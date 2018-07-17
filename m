Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 82929789CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 18:29:55 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id g18-v6so1299940uam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 11:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tKH0MNsFlFzoN1bY+lNp0WuCVtVylU2+bx1h3Ldcbiw=;
	b=acINZz8ky1XPb0mB7JqLJMD/pSzHv7MCi0TWTM0GqERNEHHx6e56MGOxKCEQLoRZ4L
	VYeWc/sVaz+7E55J4r8ZQ3E4CtJoYWRlV9n80ROl75SQfjHzxyGvKTxKYTsWe+mRtxkx
	M/pbsG56sbBrIRHqIjsl0KBZe25/fVl70PKPmx6nkaCzI7u43liHmfZOV3jCR7h3+GmQ
	mldw5PnWDC6mEjzvyfVzSJgbuWC2BZSJ8LGqzRP5+4xjry/2v/gJjHac0yThxGgCZmqk
	N5s4YdTt5Tq6EyaL88K2qwGzPnLS+7Jbz+qhhLo5TaIWFloSCqa3zHYt/7y4t6nQxhIT
	UgoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tKH0MNsFlFzoN1bY+lNp0WuCVtVylU2+bx1h3Ldcbiw=;
	b=G923gg5yD/H5FdhDxIgtDcKC+tn6GL4Pj8YJ+L4opP++++0jXUoBpKFkpmUgJ/ElKn
	lytWPCxOteknS8MXuuyYX84ZdD45hCs/oGUVaQmjbxJiZa+Gv/rpo3j5M2uUASDaysKr
	GHexLRAJ942d9QyJ2Z6VDqGgmFqiBpZHDHqEDlWBGxdu7N3VYUs3AEvp9tP9/40DtVfh
	u92g/4JVqHKSGmNqCFWlHbMD06Ufu2BzWlDBaQ4DKp7QnRqR6a8GtL6FOXtrv5q2z+99
	JF8ecYVlVGzn/RRL5CbXEO2LHo6mHygT76Qg+rVTPtJMVWwch7WYiA/itcqBflCYDUjv
	4eog==
X-Gm-Message-State: AOUpUlGofVTClynoOvbmTfSHRhJH720BVYk3gKyoZJGr0Iv/Wu/dxmT5
	7isUjq+ZpybYIp+04UBSHo37A79Yqbh++lb+P2s=
X-Google-Smtp-Source: AAOMgpfgp1C7HwjLBBbcwKoZvnrpFfpcuPUZmTnL/ZLvogN3c1CzGTigrWqkqxCqMxXBl9youWgWIZWfZnQKx71R8HU=
X-Received: by 2002:ab0:6545:: with SMTP id
	x5-v6mr1805766uap.139.1531852196115; 
	Tue, 17 Jul 2018 11:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <1531850817-26274-1-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1531850817-26274-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Jul 2018 11:29:30 -0700
Message-ID: <CAMKF1sp3z1n+t5QKgbiWn6MkXEGOEFF_8G_X=1dYFTcx48U3RQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: disable C source code generator
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
X-List-Received-Date: Tue, 17 Jul 2018 18:29:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 17, 2018 at 11:07 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> The --libcurl command line option causes curl to generate C source
> code which, when compiled and linked with libcurl, creates a binary
> which behaves in the same way as curl when run with the other options
> passed on the curl command line.
>
>   https://curl.haxx.se/docs/manpage.html#--libcurl
>
> It's a development tool and not generally useful on the target,
> especially if the target doesn't contain a toolchain etc.
>

probably better to have it controlled via packageconfig knob

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-support/curl/curl_7.61.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
> index 03d627e..cc983fd 100644
> --- a/meta/recipes-support/curl/curl_7.61.0.bb
> +++ b/meta/recipes-support/curl/curl_7.61.0.bb
> @@ -49,6 +49,7 @@ PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
>  PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
>
>  EXTRA_OECONF = " \
> +    --disable-libcurl-option \
>      --disable-ntlm-wb \
>      --enable-crypto-auth \
>      --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

