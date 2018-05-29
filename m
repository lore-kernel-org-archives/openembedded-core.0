Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2A75374966
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 17:33:22 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id f13-v6so19671164qtp.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 10:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=niYpJL98ZAR0qoO8p01TYso51/Z0HB7smxSH9iOKr10=;
	b=K8zt03q2MZ01oDP/PDn7Q0y7J2vcLgx6icl5cfYlF1wmMdFlnnerylKPtpiSrI5dhC
	joZCojzdt2R1IItJhQsafq7xuhh+OMjfrV1B6YG/0TZBoVk0BTPERhwjSKjFDQfY/gWy
	UOV/MnusA8REgqDVD6apuBpLYpCAs//UlbLwzEAHtSqWQsM4/oPTJki9befYzzLmPxq2
	oNzS1i4H3MSIq2osf82MLw4jpcetVlzCg1EcKudQoCSSG/tcHsEtSbPORpGlPYu3FtMy
	8DGdnxK1o/O0ceDRTDTsTl0M7yCrlk9vr1rjFuov23oF4NsJX3Py8NbDAqtvTjYEDRbv
	rkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=niYpJL98ZAR0qoO8p01TYso51/Z0HB7smxSH9iOKr10=;
	b=TZa3XEAQWJykervZPVaIWXVAdJpXDEg8v9vFDpTUpaJDR2ElbQTeVXtakvfTV8hR+3
	Kdmz2woJAXuBASfLNKsa5e3z4Ag69LCazrvnsAl8MvUzlHJpV8LptHEUT2msSUB2xMCZ
	wB7oh8zK81D+clymgYcmhCLFyt7fd+SuD+PUE4zrC0XdDVaquZf8XMjcTJzIioYPeShs
	zd2jIMRpMXGcjTr4kTLjylFdVgziY19ffpxnWaXax6e4LeytKh4HNokTgcedQ5emg7OU
	L78YCLcmTcf9/yXnJsa1ma/oiG1t58y/edkRTS16V1tnqCNWwIfNzdDDTwDjq0C6nF5i
	48ww==
X-Gm-Message-State: ALKqPwf9ilSaGqE02IeZ76H5scV01OO9w2vXTQTV9cU4Lu7sxvXuiEO6
	QECyyVI0m74g0p16rnfLBDnba38M6ag3cCZp0r0=
X-Google-Smtp-Source: ADUXVKL61ZlfZYWP925y2HgHbBrBKyUVlP1zd9vPKVs70XI4F6uYWvEn2/nkq90H2se6RBEtTkzUB/1IWgb657O0DmI=
X-Received: by 2002:ac8:2b5c:: with SMTP id
	28-v6mr17394166qtv.117.1527615203103; 
	Tue, 29 May 2018 10:33:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Tue, 29 May 2018 10:32:52
	-0700 (PDT)
In-Reply-To: <a0e82af237232cb4df6b304ef83291c16bedb33b.1527216285.git.liezhi.yang@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
	<a0e82af237232cb4df6b304ef83291c16bedb33b.1527216285.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 10:32:52 -0700
Message-ID: <CAMKF1sqL1N0g-540M4XJVVFCPZOHJsTs9aDgjVNoM+_i6E763g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/24] gcc-sanitizers: Fix libtool .la files
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
X-List-Received-Date: Tue, 29 May 2018 17:33:22 -0000
Content-Type: text/plain; charset="UTF-8"

this seems fine

On Thu, May 24, 2018 at 7:48 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>
> Since libtool sysroot is not set when compiling sanitizers, the libtool
> does no prefix the dependency path correctly. Fix it, so that programs
> can link to sanitizer libraries without error.
>
> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> index e5e8452..2373dd8 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -39,6 +39,8 @@ do_install () {
>          rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
>      fi
>      chown -R root:root ${D}
> +    # Fix broken libtool with stdc++, as sysroot is not set.
> +    find ${D} -name \*.la -exec sed -i "/^dependency_libs=/s@'${libdir}'@=${libdir}@g" {} \;
>  }
>
>  INHIBIT_DEFAULT_DEPS = "1"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

