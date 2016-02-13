Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 099E560119
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 04:31:52 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id b205so4985009wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 20:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vRGcba0LS2mvuW+sR5QNk1voQGaEufW0MGdvzLilWms=;
	b=g5gO4Ck2nEulOnVyEU3t6lz4C5Lns5P7ZvlvCRYGacFBrm/mOQK3qrN9SNDgvULbI1
	8+gyrERsEqEXL/0jh8Qna0WG5Vgt2tv73xdDJEvjeM4gCyuBpuRBCuFD0tfNKV5Fl9Me
	FpmDc3Z+bogTms/EL2CvcCO/FVUxTzLvSwQQBk160LwAVYnrdhpxdirSIB8am6YdMpmq
	yDyx8YNNKGSmxaRFcBgwvc+7nbYiutPGCDiJXlWKemlldkV3hVCxoND1HxtSkXjcpLj5
	wisTXJFltVI5CLms9ydzmhLNF6jn7WLXd6pi2kpZtIB2Sj3U0iqMjwYDrUi/iHDeBn7U
	mlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=vRGcba0LS2mvuW+sR5QNk1voQGaEufW0MGdvzLilWms=;
	b=gDMD3iu9pVLYz77G8u/Ro2amKTs9PJaH4g/LMPkCMvWfZkWCznTh9+rDOgZeoBmjX/
	Pp7yHgWWD71q6bpwmg9VLpy/xP35MvPQieQ/mms+Q7sQmUGQfxVoz3nCXYyMiv7XQyj/
	Wa5TI1ahlFZA/+VK9SOq+vgPd7eCH1uwGA8yR69qzOB5dyZx4rlQfAHU5YtqUvAdxcHF
	1uankSDQK+uc+t13e/cAON8lB2seoCbHvfZK0v/y122SlEPKCRJZv2WBIzofSxnd5g+L
	RfCO/VhyX1eWuJCGbMAmKCCUupGYGfaVboV6/IoEScte/Th4D0JaWJv7FaJ1SREbf7n8
	cOhQ==
X-Gm-Message-State: AG10YOSZAEHr+JS2sP+Dd5QuIUH4yQQiTC3vE3q13jfDHWbCdWVhcDzc7LDRv8Y0HXME7px1Wx+7JNxgQhwXUw==
MIME-Version: 1.0
X-Received: by 10.28.54.22 with SMTP id d22mr1213832wma.72.1455337911910; Fri,
	12 Feb 2016 20:31:51 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Fri, 12 Feb 2016 20:31:51 -0800 (PST)
In-Reply-To: <1455276418-4134-1-git-send-email-eu@felipetonello.com>
References: <1455276418-4134-1-git-send-email-eu@felipetonello.com>
Date: Fri, 12 Feb 2016 20:31:51 -0800
Message-ID: <CAJ86T=WQApsnZLTAGsRv9BiitVxiKnmDd=5qEsQrogSaQu22hQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Felipe F. Tonello" <eu@felipetonello.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-core-tools-profile: Enable valgrind on ARM
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
X-List-Received-Date: Sat, 13 Feb 2016 04:31:55 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 12, 2016 at 3:26 AM, Felipe F. Tonello <eu@felipetonello.com> wrote:
> fixes af1ddab5c('task-core-tools-profile: fix valgrind for arm and systemtap for')

$ cd openembedded-core
$ git show af1ddab5c
fatal: ambiguous argument 'af1ddab5c': unknown revision or path not in
the working tree.

>
> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> ---
>  meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> index 59d930bc7b72..52e17c59bcea 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> @@ -64,7 +64,6 @@ VALGRIND_libc-uclibc = ""
>  VALGRIND_mips = ""
>  VALGRIND_mips64 = ""
>  VALGRIND_mips64n32 = ""
> -VALGRIND_arm = ""

Valgrind only supports armv7a and above, so should still be excluded
for armv4, armv5 and armv6.

>  VALGRIND_aarch64 = ""
>
>  RDEPENDS_${PN} = "\
> --
> 2.7.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

