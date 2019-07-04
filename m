Return-Path: <matt@madison.systems>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0889E7C160
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 12:38:59 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 205so6025301ljj.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 05:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=G761bljHXXP6ZnrgSXPS81TQRNX8Q2yHvAmYiL5tt8M=;
	b=18Lp+UbFyCmI5Bivpk7Y7gThQ9bSSIIE5V8tBI0HhANlS7DQRG/6zOUgemMYbFGPZn
	B2gFNpPdgBR3X35YTogZV/uuxy+Hhni5L0YjcYj2+VoJBVFG+iQlEwbkRC7waJhz7mRY
	QGwnNXFKz3wt2fAToo27FYpLGey4llYZhYBv5LsY74sMXJDsooBbbTiTFEZolXXyvPG7
	MIHmeoxi9SewPAltFk3kpCI74Kk7xbLwVdni3aes8MSP2dSBwh2CpWxw8/xOUwHzn5QY
	T54XxYylyxPbc7X0QkutqEHJky1cg1IiCyu3g9Y0sVQEDQLpmvD8yeBYveyu2qiFL42o
	twGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G761bljHXXP6ZnrgSXPS81TQRNX8Q2yHvAmYiL5tt8M=;
	b=eTICQ/e+fA0UmKpcqzKYotoz/f57mJo7pPFDLDzOt2IqUonq09XvlcSjw/KOKEGtHD
	Hgp3E+oPHg+AgxNMEdhcsw8durG5/T2bkD3kEDg7eSNVwNLYPFyGkv6p/Dz1v5VKoKjc
	FdDf2tPeK/bdN0pABRruLTAVMPCGwNFtoch3Ui9gLl4V7WwZFeZZybqpSEO91HjMP8lp
	Y44KwXAIvJjfAqiT8uC8pmVnJ6bOa+d0prFCnmO8byuEv3WQUlqrAvFhrsN+oHt1s3vz
	drI0kuvl81nr5TS/ts8/nT/6HflsNLwTe5Pwo82fTIu4hocaVKiRqpCdkl2osz/22VHF
	Y6Hw==
X-Gm-Message-State: APjAAAUuWWSt39OjZlItpC8GhuF+eE/RwxScD9RLFo0mF+URnsOlcAFA
	31QJmeYw+uGGjxih7HELN2gSZT1xA4k55yPSJEEPAg==
X-Google-Smtp-Source: APXvYqzBss8zZ1N6lCw0BxU152BunS3yiEkg2NuGiI57g49rgHBVMqAqXFpEshBGUBpMxH8NDkzVEfGS1oHKgIH7NrA=
X-Received: by 2002:a2e:4794:: with SMTP id
	u142mr24806898lja.222.1562243940690; 
	Thu, 04 Jul 2019 05:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAGgRHJqeFE75tXJ7qB4gyxkZaWsLmFozY+1YoJLUPXzG9Q+fOA@mail.gmail.com>
	<20190703092412.30747-1-mingli.yu@windriver.com>
In-Reply-To: <20190703092412.30747-1-mingli.yu@windriver.com>
From: Matt Madison <matt@madison.systems>
Date: Thu, 4 Jul 2019 05:38:49 -0700
Message-ID: <CAGgRHJofXoz2j3qYU9CiiBpYA7iLhc=-aQMWoE7t_=uFDH0KMg@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go.bbclass: remove ptest inherit
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
X-List-Received-Date: Thu, 04 Jul 2019 12:39:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 3, 2019 at 2:25 AM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Remove the ptest bbclass inherit logic to let
> each recipe inherit ptest individually if the
> specified recipe wants to support ptest to avoid
> the recipe which inherits go bblcass inheriting
> ptest automatically.

Recipes will have to inherit ptest before inheriting go, which seems
counter-intuitive; with ptest after go, the compile_ptest and
install_ptest functions will be the null ones from ptest.bbclass.
Ross's suggestion of breaking out the ptest-related functions from
go.bbclass into a separate bbclass would be better.  Perhaps called
ptest-go.bbclass, similar to the ones already there for gnome and
perl.

Thanks,
-Matt

> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/classes/go.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index e05a5c641c..424d869540 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -1,4 +1,4 @@
> -inherit goarch ptest
> +inherit goarch
>
>  GO_PARALLEL_BUILD ?= "${@oe.utils.parallel_make_argument(d, '-p %d')}"
>
> --
> 2.21.0
>

