Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 719B97892B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:07:45 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id c16-v6so9807252qtj.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uzH837T5c6O82mPuBwxvcSqVr01qYNSAwsdZckTAm3I=;
	b=ln+GOhUiw4r0T4Tncd+V2/BhErGxixLSMV6Kftax+90sAEpSLchh+YOcVaDbBKeq/R
	7X1rWgmANLyoZ/QmpCE3e66F/XKNeLrQWyZqdL6rZq5VWtyMH1rcZCD8mEtQwMSybL5U
	8i2vUl/kYgK/1MFhdb8g0t/7res+4iSsbx+fZCXe7u0UE5fhNNn4la1r62nSswJhvzDs
	DSxVl5jKnvCpzmw4uBgrG2MTt0LRrx3q4M1sDroTelFHeJon+U56tMRRbIkOZXfrvENX
	GxaiJgNq7NsC7niFBAjSdzRW75PY+DwaVJJq6+tm4sH+ufMxmwJGCEaxbZ1RcHIsqKhA
	G86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uzH837T5c6O82mPuBwxvcSqVr01qYNSAwsdZckTAm3I=;
	b=btBoyg/p2/CiBphFkJSjV0QwRu+UlaUUYvwVsVGOHNi1W/BPWBnaaO/VGlL9AAuCQw
	qXGo6n4kOsXfCTbXqTnWphn9aQCyfXFDWJmZOCg5zib6wXqQPSK2sAqA2Dox5g5/m/xf
	Q4Idh3Ti3KWBVcMYToJ2aOMs0IY5pypbd6dJXFGnS7lmJpSeC4Lz7ffi71+d7B6MiHLE
	laCYzueKXa4MxtYy0OH0IEJ1dUuYU0ay9jQed6XrVumrpJBrKLjI0aYSljrl6VAoNpFw
	A0O6R73t8+ztaZMfRlRlrvhlS4ETCjdeZVMg6gwGPnDHW3aw2cqKPoMooyaWeFGi4ChF
	qnyA==
X-Gm-Message-State: AGRZ1gKNjOHrgOXULiqxgJNCAPPUVOFsIqABqf07Ecv+mriD76ZH3fRw
	Oxg2wSwrgHY6xGDb9GJCu9vR5RJUXg2ZjWrXWnw=
X-Google-Smtp-Source: AJdET5cpTLboGlqBEG/1UlkZkttnsp56odVacexNhNWeDDIot4Q2Ss0t8Jdo+eAzWi1J/xA7BQcznCTs2160t0wMYoA=
X-Received: by 2002:aed:3e94:: with SMTP id
	n20-v6mr13335236qtf.196.1540829265973; 
	Mon, 29 Oct 2018 09:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20181025155629.5281-1-christian.meusel@posteo.de>
In-Reply-To: <20181025155629.5281-1-christian.meusel@posteo.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 09:07:19 -0700
Message-ID: <CAMKF1sovDOoewFVN_0GVsFmqF4SCEzD4bus+Dex4gADNDvq5vw@mail.gmail.com>
To: christian.meusel@posteo.de
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Ignore repo tool directory
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
X-List-Received-Date: Mon, 29 Oct 2018 16:07:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 25, 2018 at 8:57 AM Christian Meusel
<christian.meusel@posteo.de> wrote:
>
> This reduces the noise produced by 'git status' and 'repo status' when
> orchestrating the layers with Google's repo tool
> (https://gerrit.googlesource.com/git-repo/).

Not against this patch, but it seems interesting to see this being here
since I assume repo would be a higher level aggregation where oe-core
is just another repo.

> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitignore b/.gitignore
> index 94894d498c..57dd439401 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,6 +1,7 @@
>  *.pyc
>  *.pyo
>  /*.patch
> +/.repo/
>  /build*/
>  pyshtables.py
>  pstage/
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

