Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0C62B77F3C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 17:13:37 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id 7so1801650wmo.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 10:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/LjAwaFiBohxWQgBem9uHIDMFqwpOTsW52xolWxGGX8=;
	b=JFTNNVMkOqYDz/LhfAhoaodMDOkaEiLRNIBiDMV1hYnghdK71EAhtnVRCRPZnfU4qQ
	lUy57oxLx3mRQlNUBETwhXctS9WWwYVEkHOtxhmm9yGCwXjJ/3KFTaALFcl/6A+CvMLq
	iiza/0GlUgdT+8pkTgOW/NTjIPCL/s//ji4uMS7FD1tw6h347m1E2VXhc5RNA8NSHctY
	jzKCwgjhnJGe6Qw8h0H9LZUnYOSD2Eo3YHZvgBFemt/12OSg4KTasYF3N9Wg/Bc164dU
	LjuVUCxWsrdM65Fa5F4L3O38rTyZ6mLkXgSq16rQ6Rh9OcZhx46LE1XLqOhespsl5ihU
	cSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/LjAwaFiBohxWQgBem9uHIDMFqwpOTsW52xolWxGGX8=;
	b=R3HFdMzsXPj8uM16qwXYk77lEjB46asjJ0pfm1PNejbhwB/rHF4GtSFAD6Uwu0om9Z
	DW5PTfm5q3ldaWNWUwxdLECdfos3+cSgElAZrDhypNuq9T0Jh4L01sJdVi7CRRZkzYmF
	E+r1HHMe2+EVGK+shjmxa3WOiptNNEJ80/5TzAwG9YnexNzwbJbig2YxUVt6mhPemrZr
	LC+gK9YJvhegVX3nCiOay94z2UQlDPOtDlBp283rVhFeydmjULL+7Cs7EPap73LSHAU4
	JM7OpPklgI4aC76Dx/7Y6xQX/VcvyH2g0QyrlxV3QeuqxL8oDfgD8U7TDxgXlee+c6/8
	snww==
X-Gm-Message-State: AODbwcBDOrq9NjESQ+TYe3XV8B5CakKXWF2+kvdvKoPkbybX2GzgHSAx
	ARAuhRMsxo0gzUrBZbrm3T+ssiARQg==
X-Received: by 10.80.144.118 with SMTP id z51mr17586087edz.143.1495473218420; 
	Mon, 22 May 2017 10:13:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Mon, 22 May 2017 10:13:07 -0700 (PDT)
In-Reply-To: <20170522092622.14761-1-nicolas.dechesne@linaro.org>
References: <20170522092622.14761-1-nicolas.dechesne@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 May 2017 10:13:07 -0700
Message-ID: <CAMKF1spmBTseFWvZokZT-BxnjQgzzdSWj+Y7LWH0+iaLSqOpcQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] [RFC] Add support for 'fastboot images'
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
X-List-Received-Date: Mon, 22 May 2017 17:13:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 22, 2017 at 2:26 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> Many devices come with 'Android' bootloader that implements fastboot
> protocol. This protocol was also added in uboot. This series tries to
> make (Android) fastboot image a first class citizen in OE core. While
> the fastboot protocol initially came from Android, it is not specific
> to Android, and can be used with any standard Linux system as well.
>
> More information abot the fastboot sparse image can be found at [1].
>
> Such support already exists in meta-android, but I thought it would
> make sense to move that into OE core, given that it allows any OE
> users to reuse this mechanism directly. At least, I wanted to have a
> discussion about it and gather others feedback!
>

its in meta-oe, what do we get if we bring it to OE-Core. ?
how much prevalent is it ?

> [1] http://www.2net.co.uk/tutorial/android-sparse-image-format
>
> Nicolas Dechesne (3):
>   android-tools: import from meta-oe
>   image_types: oe_mkext234fs: add arguments to customize output file
>     extension
>   image_types: add support for 'fastboot' image type
>
>  meta/classes/image_types.bbclass                   |  24 ++-
>  .../android-tools-conf/android-gadget-setup        |  25 +++
>  .../android-tools/android-tools-conf_1.0.bb        |  13 ++
>  .../android-tools/android-tools/.gitignore         |  57 +++++++
>  .../android-tools/android-tools/adb.mk             |  72 +++++++++
>  .../android-tools/android-tools/adbd.mk            | 163 ++++++++++++++++++++
>  .../android-tools/android-tools/ext4_utils.mk      | 103 +++++++++++++
>  .../android-tools/android-tools/fastboot.mk        |  89 +++++++++++
>  .../android-tools/android-tools/mkbootimg.mk       |  29 ++++
>  .../android-tools/android-tools_5.1.1.r37.bb       | 168 +++++++++++++++++++++
>  10 files changed, 736 insertions(+), 7 deletions(-)
>  create mode 100644 meta/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
>  create mode 100644 meta/recipes-devtools/android-tools/android-tools-conf_1.0.bb
>  create mode 100644 meta/recipes-devtools/android-tools/android-tools/.gitignore
>  create mode 100644 meta/recipes-devtools/android-tools/android-tools/adb.mk
>  create mode 100644 meta/recipes-devtools/android-tools/android-tools/adbd.mk
>  create mode 100644 meta/recipes-devtools/android-tools/android-tools/ext4_utils.mk
>  create mode 100644 meta/recipes-devtools/android-tools/android-tools/fastboot.mk
>  create mode 100644 meta/recipes-devtools/android-tools/android-tools/mkbootimg.mk
>  create mode 100644 meta/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

