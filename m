Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 805496FF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 12:00:29 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id e126so2169825vkb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 05:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=2Qmocfhlw/nJOJ1JC2pel60Khctzp2dbIARgn8jivkY=;
	b=0l3Vh/a6mHxoqKqMj6nvluSLwuQc95er2kIMksytQVdVD1GcST5L2lnj5zz5FJx2do
	FPChcmurNElMnIi8vEnobn9ZZEWDfIo8iGSz2UeHj33PoMNDiShVNBCgLKiP2y3Hcmxm
	oMErCQYJ62er/zG2uFAWLqThyqUqYJ4m/9Jhinm+yeWEidpskCV45U5z6PfNs6sd+vN8
	OC4DqtaL9SQyKvHmqIOImLN2t+ci83GJec4TLL1l/lT0fxY++vzLEwsJCoTN2TyGTzKq
	+3OGb4mT3+v/0Sx51eYcsBCkw93hGOD/RyZG/yNCeKJiGPBYiRPHd2Q8VfvAqlChzNnP
	nG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=2Qmocfhlw/nJOJ1JC2pel60Khctzp2dbIARgn8jivkY=;
	b=Nu2Fi/WVhXfr/7IoGc1OpDGQE6bE4+cHLAbrZVds4OM7rYzKvvvh9WYTZyuPHKPNx7
	vwSVy5WvO5qOToK9UshS/IMz0Q1hWP/HxIkS+kzXvtgLE9oAcLBS/cykxM+IY91YRi5Z
	bCMKVONG8LwKPMKkjzGtbb/WpQcfU4j/eCJ5coMmRcUNl99m2MiyFibEiyMPdUWm2nUR
	1Hd3Glm/ROhjeneEQHHiylXJhrEq7Hnqef97w2elZIZ0atJwunn5LMJhtzrRj8Qdsg9E
	BP+zN4EzEc96iuwHl0hDnLFJ3I5jZVvi5g6ZLvnwly0I8UKIbnRzQfYzhCnoFhBXcXix
	9TIA==
X-Gm-Message-State: ALyK8tKkorozUTGrYaR7PhVPi51SdUuQGw1v80JYINFkBMjE7QFNN5DMcSFMO2VRL29KW0G3c612EB3G4JcrwQ==
MIME-Version: 1.0
X-Received: by 10.31.15.14 with SMTP id 14mr5205392vkp.30.1464264029545; Thu,
	26 May 2016 05:00:29 -0700 (PDT)
Received: by 10.159.39.68 with HTTP; Thu, 26 May 2016 05:00:29 -0700 (PDT)
In-Reply-To: <c044a00c888e3359e64270e57067df9d648f9896.1463042237.git.pkj@axis.com>
References: <cover.1463042237.git.pkj@axis.com>
	<c044a00c888e3359e64270e57067df9d648f9896.1463042237.git.pkj@axis.com>
Date: Thu, 26 May 2016 14:00:29 +0200
Message-ID: <CALbNGRRogSXXcyLTUvq_CqS41wNqD1EjOXPpdGzH8SSKcAEorw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 05/16] tcl: Use SYSROOT_DIRS to add dirs to stage in sysroot
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
X-List-Received-Date: Thu, 26 May 2016 12:00:30 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 12, 2016 at 10:37 AM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> ---
>  meta/recipes-devtools/tcltk/tcl_8.6.4.bb | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
> index 8e92b3e..61be81d 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
> @@ -68,10 +68,7 @@ do_install() {
>         done
>  }
>
> -SYSROOT_PREPROCESS_FUNCS += "tcl_sysroot_preprocess"
> -tcl_sysroot_preprocess () {
> -       sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
> -}
> +SYSROOT_DIRS += "${bindir_crossscripts}"
>
>  PACKAGES =+ "tcl-lib"
>  FILES_tcl-lib = "${libdir}/libtcl8.6.so.*"
> --
> 2.1.0
>
This one breaks meta-oe's postgresql.

Andreas

