Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id E5306719A8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 12:58:35 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id q5-v6so20019809lff.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 05:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yIg9lOQg1EMuZxJju3xFHIt4ZeWjkyCcGNbjsGdKqMY=;
	b=k7dpzE7VrFHF7+fhkkZF/LFS0vFkZ29ykO6BmQpu7pg1wbTsQoaEb3LWUyYZ7nQ1XZ
	yQ6IyWC9/jP1+yM0Gj1CknlQqQyI2RuYO86d7mJi2yqS0YkRudMJn8GCUEXRU73g3aSE
	rp8gxYd5AKVEd+HxeU99B0zkxpCR4KuK7Bit330EJ4RYEZ6luAk4OIqriPwwRtuR2PTA
	1FsRcCwP9Lg4lMFf3wJ/rTdA7ULPg0IYgHpzjTG37PuPcdGY/M3rh+4YXSvrBjVf1XxN
	xCJWAYblj6Ru9Mp6rxK9KgWKFFmkVd0B79LBd+yYqDIy6BuaPv5zIoQ2w+/QoLzJeV/M
	otqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yIg9lOQg1EMuZxJju3xFHIt4ZeWjkyCcGNbjsGdKqMY=;
	b=KsDPdQ0l0cPhe2e/Q32WxM5aOHA1kkdFU12F/4u7awu6NgIzFxhkqBPmtXLCQGHOHD
	0+Rqr801hbvYQDguqb9nFKrAVDp1EBROrZY0Kt/8OvPDctLXh/T3mxeahbStILDdASQ5
	7B4znD4QMoLRJ2Ffd7PDSvFX5EORvHXmR7umvYZa+tKgb0CsVMenRDwQb1fHxIWajH6l
	K/b2ctKcj0doCkV9osmm+jzs1PzNcAsT+sHWQrTTociHqMHIpLqfnNlEXtQFhd6tkEL2
	Je5DdC4K5cE0UP1LEKS9i013BmB2WwvL3nrUf8z3F/+mnOb5RimasxkMI6L63IxOIRM2
	iG1g==
X-Gm-Message-State: ALQs6tB1fPcixi451CxrK9g7JR1se1rKZAfOfjAqYw0K3q0kOF7GXuIT
	482ODBJSkJ8IGfBZx3WpcJevWhHdMEAuc+uaPAw=
X-Google-Smtp-Source: AIpwx4+fsXUyxCeUEXzofZQZ+7wZ4vTsXZ+QuGbcgEqtoBneP4XvpGNPeD/hUM6nNnJXRBDCOHkKvxHbGTPstV7BWKk=
X-Received: by 10.46.154.145 with SMTP id p17mr8424440lji.28.1522760316063;
	Tue, 03 Apr 2018 05:58:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Tue, 3 Apr 2018 05:58:35 -0700 (PDT)
In-Reply-To: <20180403042331.24524-1-net147@gmail.com>
References: <20180403042331.24524-1-net147@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Apr 2018 08:58:35 -0400
Message-ID: <CADkTA4PPm8GXxWAEk_yigy-7=xY1-ARfjKJW2CW__qbypDsizQ@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: improve reproducibility
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
X-List-Received-Date: Tue, 03 Apr 2018 12:58:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 3, 2018 at 12:23 AM, Jonathan Liu <net147@gmail.com> wrote:
> Set KBUILD_BUILD_VERSION=1 to avoid build version being incremented on
> every build. It is visible in the output of "cat /proc/version" after
> the hash character.

It is possible that someone might actually want this feature, for debug or
different build variants.

So this would be better as a variable that can be overridden.

Bruce

>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 4877965af0..78d6c30b07 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -151,6 +151,7 @@ PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>
>  export OS = "${TARGET_OS}"
>  export CROSS_COMPILE = "${TARGET_PREFIX}"
> +export KBUILD_BUILD_VERSION = "1"
>  export KBUILD_BUILD_USER = "oe-user"
>  export KBUILD_BUILD_HOST = "oe-host"
>
> --
> 2.16.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

