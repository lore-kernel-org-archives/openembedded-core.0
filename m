Return-Path: <andrea.adami@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8286FF0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 23:25:42 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id w14-v6so8294792eds.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 16:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a2+3mMsLIYVvkCGuIePv6saqWEjbLQfB/8HbxU2YW7I=;
	b=JITT4GzCalKnNd1DDvr9sb8PB7VW0MRWuSwsRqDndFmX1KPboR1/c27mjHXeRY3awP
	lLyA3CGwc/NaBGCGA19Kv2/EmqyzRYlRQ4UJoTWGv729eSXsZBVZv8Vnx6hYIybcxhIm
	I149VrEY4zruUQVXNpkcgDpBcCrCoL9zYZTq/UkEF42RpBijfzTDI4f1IsMKiIiNDmwp
	9rT8CPsZxZA6HiExHjmbxN5Sl5tWsELNr5ZF6n/rWlzNemiMpOwtOIn3cxqJcyCKFJvL
	kPql3t10CgRigILuE3+rBj/ORfg8j/UkVZOKEdCz/C9w/lWo/6pnNLVtofJ7pNZpPa5h
	a5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a2+3mMsLIYVvkCGuIePv6saqWEjbLQfB/8HbxU2YW7I=;
	b=uI9E3L6TsPTKyFg5IQVZBYTICFg/IBzJ5vef+DHc7TOmHr/L7SuMDCZ7F0fbyqW257
	b4LLXA9QNsobkchru0qf62C6ju6WWYUJ06vpHkkRX0ROKNZefESmKTrhp9XKijNm2JQL
	zlqOtJMOLrH7MZ9yvTgXmn0bvNY65pE7pwY10Q4ErGfeEwgzsljrLFUGPCzdyqKH+RBb
	4b/hu3sLSUfQBdMYCMaiCKkBOpMCDxemmbURHKP4cSRSaSubKrTy2eQQ7E192SWIlTKF
	VWbj/XJEk9ktKa9Ep+WoxTQYINGMncHgzbZ7v6mO2rC7bzeSxgyPwvq5091JT46H96s9
	JFvA==
X-Gm-Message-State: AOUpUlFzP6wG18q9aM80qBRutKoMUav3vrcWoomS6zHmhZTVO76eSE+x
	N41kk+yPAXS8rhW+9Jr0bOkFUNg3FrnVo6SbPgM=
X-Google-Smtp-Source: AAOMgpdUc7oiXPFbg8UGMVzmwpfg44FTeXfap1O3p1Krh2i2xqaZ1B6PH14QpuUx/dLsHSagK3sEEVcyEW/JLP8JYuw=
X-Received: by 2002:a50:b8a6:: with SMTP id l35-v6mr39780ede.273.1532042743196;
	Thu, 19 Jul 2018 16:25:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:e70e:0:0:0:0:0 with HTTP; Thu, 19 Jul 2018 16:25:42
	-0700 (PDT)
In-Reply-To: <20180719135752.43056-1-raj.khem@gmail.com>
References: <20180719135752.43056-1-raj.khem@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 20 Jul 2018 01:25:42 +0200
Message-ID: <CAAQYJAuSyJQP8zC7PAsETAOpWHjKTmfpxZAAOBuhvv8U0FYnpg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Fix dirent struct alignment issue seen on armv5te
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2018 23:25:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 19, 2018 at 3:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Full logs
> https://git.musl-libc.org/cgit/musl/log/?qt=range&q=9cad27a3dc1a4eb349b6591e4dc8cc89dce32277..18fbc7e4fa254696eb024f56ee74704805925fad
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index b56870cb3f..9a3bbef68e 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -3,7 +3,7 @@
>
>  require musl.inc
>
> -SRCREV = "9cad27a3dc1a4eb349b6591e4dc8cc89dce32277"
> +SRCREV = "18fbc7e4fa254696eb024f56ee74704805925fad"
>
>  PV = "1.1.19+git${SRCPV}"
>
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Thanks. Patch fixes the issue: no more alignment traps on armv5te.
Tested on pxa255/corgi.

Acked-by: Andrea Adami <andrea.adami@gmail.com>

