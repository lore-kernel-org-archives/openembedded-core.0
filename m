Return-Path: <nathan@nathanrossi.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 001A560C42
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2020 04:50:14 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t2so11067004wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 20:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4xvv76vJKe+7Umd+bmgjrakM+S3aP3Pto81Mda5FftI=;
	b=XhDpOZyg4XdNgf0exMSecBHATt+teIXxpYbQifnuNCB5RF23CjiyCvxuhsMzGjZW3c
	uJ8kiKUxkKhsyJK0XGrumC09D+i8WSbtTYuaTl51PijiVCRjmqBmRr4ghpzljOHGCX/h
	QZ0oIH+8KXoie7g+zZwdTu8NlUnWl2UIOAV5FXJn4SdmdOQsmG+4nQyEjn7OeGqw7ZrI
	LEkhtlWztYFvCBxSHpMhDbV5ruDEDunmeuTTEYHGpYk+6Z8Gu2xufpN+EumyDuez09OT
	tnvB0RVkBBfKMt4E5deBu5AoAqTTqJLx07pq/4U0KBllDSqVEjzWk8WC44OgEv0TvcA/
	pmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4xvv76vJKe+7Umd+bmgjrakM+S3aP3Pto81Mda5FftI=;
	b=ThhxQbLSWpAgubFRR1HB8R8iNnPW0oNDVZGSS30g82LZiO7LrgJTMwmxq1yjMvQctM
	l7CF4OaFX7NAPlnu829gmuLOunOl/V2Xm7Pp8Jhf13fgqJiQxdBFTPWV0HOVKJUlV/B5
	XgsJ+9OOuGyGhSwyaM2UpvVXaRegtUFvlq7cYIm8XLUADmwvEJiRGzmZcbqJjcowaFF+
	7aLebl9DIX2WPBdmnfu4nVr012CCvVOvS40Hh/voKD5OJv8pgXCXHELXCfDu2EL/ZqMe
	Vjk3BgLoaylNHD7gsIFWqJks6iqtDpAbOE0OBHG8/zyvOU+YNOI5mTRhaCDi0hXBRthi
	N+SA==
X-Gm-Message-State: APjAAAVMlO5+r9HxV1M1h3yWo51Tl1EvE+GnFkTCjoqEXH63j+zHs2ZM
	Tt+vROhJ3WxdND3/e7FQ4CdEkPfkrGOruxMWXoakpJpt
X-Google-Smtp-Source: APXvYqzjKe30zU86TEryQN1hXCayBT0zdvyT5RiUTHpujX+qPwuOZ8irS8dELNqre/h28uvc5lpj63cnU0KFLx8imes=
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr1956861wrk.101.1580532615610; 
	Fri, 31 Jan 2020 20:50:15 -0800 (PST)
MIME-Version: 1.0
References: <20200131233305.118454-1-mark.hatle@kernel.crashing.org>
In-Reply-To: <20200131233305.118454-1-mark.hatle@kernel.crashing.org>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Sat, 1 Feb 2020 14:50:04 +1000
Message-ID: <CA+aJhH1nnqrUzwdRuju04NY=YsTfafkQLA7ucMMUUcPyozpEmA@mail.gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] microblaze tune: Enable 64-bit
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
X-List-Received-Date: Sat, 01 Feb 2020 04:50:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Feb 2020 at 09:33, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>
> From: Mark Hatle <mark.hatle@xilinx.com>
>
> 64-bit is not yet available in Linux, but some non-Linux uses exist.
>
> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/conf/machine/include/microblaze/arch-microblaze.inc | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/microblaze/arch-microblaze.inc b/meta/conf/machine/include/microblaze/arch-microblaze.inc
> index 265898b6b6..fb777d929c 100644
> --- a/meta/conf/machine/include/microblaze/arch-microblaze.inc
> +++ b/meta/conf/machine/include/microblaze/arch-microblaze.inc
> @@ -4,6 +4,9 @@
>  TUNEVALID[microblaze] = "MicroBlaze"
>  MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "microblaze", "microblaze:", "", d)}"
>
> +TUNEVALID[64-bit] = "64-bit MicroBlaze"
> +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "microblaze64:", "", d)}"

This should probably TUNECONFLICTS with all unsupported versions.

Regards,
Nathan


> +
>  # Endian
>  TUNEVALID[bigendian] = "Use Microblaze Big Endian"
>  TUNECONFLICTS[bigendian] += "v10.0"
> @@ -26,6 +29,7 @@ TUNECONFLICTS[frequency-optimized] += "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "barrel-shift", "-mxl-barrel-shift", "-mno-xl-barrel-shift", d)}"
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "pattern-compare", "-mxl-pattern-compare", "-mno-xl-pattern-compare", d)}"
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "frequency-optimized", "-mxl-frequency", "", d)}"
> +TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "-m64", "", d)}"
>
>  # Disable reorder for v8.30 if pattern-compare is not enabled
>  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "reorder", \
> @@ -48,6 +52,9 @@ require conf/machine/include/microblaze/feature-microblaze-math.inc
>  # Architecture name, either 'microblazeeb' or 'microblazeel' depending on endianess
>  TUNE_ARCH = "microblaze${@bb.utils.contains("TUNE_FEATURES", "bigendian", "", "el", d)}"
>
> +# Add 64-bit to the PKGARCH if enabled.
> +MBPKGARCH_SIZE = "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "64", "", d)}"
> +
>  # Package Architecture formatting
> -TUNE_PKGARCH = "microblaze${MBPKGARCH_ENDIAN}${MBPKGARCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
> +TUNE_PKGARCH = "microblaze${MBPKGARCH_SIZE}${MBPKGARCH_ENDIAN}${MBPKGARCH_VERSION}${MBPKGARCH_TUNE}${MBPKGARCH_MATH}"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

