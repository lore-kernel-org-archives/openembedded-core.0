Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 539A46067C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 17:58:58 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id q11-v6so10534533oic.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 10:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aELDdEqh4m6UFG0fuvYnqRqPb7aWqzXsT/fX1VeBwDg=;
	b=Gop5Bp+G/OqjOFKi34LQ/eDQC61m/PQ515b8boSXQ3MHP6TuMhHP2DqR+KfojyxMMv
	KuLSgF2j5vTRanT5kchFawvha0EAGXTi7jeJAyEkG7IpbHeDCUgC7hrXa+nXMjvjy7Ow
	hwcBdUnbXGGWpV3CsfwOAgH8evr1pnNIGLANbYCkwatP1AzQHeyAMp6JSuTNuUuJxFph
	1xJUZkOW4IlKZwb3T0FOwlnktFQ2TZ8ICVsp9SemD7QKEAd9Qfo2ir8A6Cfyt9+IE+s1
	Tiw+3KzwuPmKUl5sjDcFMGg6teVYQAFQATtFs9y4yOnzhz5oEM6jtnh+msIgrev+T5Ls
	kkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aELDdEqh4m6UFG0fuvYnqRqPb7aWqzXsT/fX1VeBwDg=;
	b=ITpLwsq7v6D57JUOM/slur4s6H/YgZ7lgeZkMGwPuIOvncHBYAbUiDmSZAT2QxTTgm
	u1LQGOtAucoHeCh8Fy1cK6Hm4znRnBsFO9EBy3h/ubBviNVUtvd7vMmJVW+v1cKpZ+2I
	fV+VYKq6XESCH4mAbq0o3Bl9PQBVZ5+lijHsSxuvlfI8AEDm8gk0Kj1+OEGimAg3KgTl
	T4eJ7qeWwBohvMyaB0VPbiFoukVy4dwDQcOcL97C6Vvi+G0hvjAh1qgSFuZoLe+k3Jj8
	4WbaXiXzupHgboPPOq0bTNSsrjPdfgiuMY96yLoos/7SbNLFR52kgW9hIkLKEjj03Hcw
	tofg==
X-Gm-Message-State: AOUpUlGzYYQvTkd3T4usbr+WxYVs/XElK0ucdCC9F2htttTRHYlmAl2C
	s3ohuHdsUkRIFP+fi2rJLSkZ52aGbSYej5Ei8c5ZAg==
X-Google-Smtp-Source: AAOMgpdJcBwCgCp3RkeaZBJASRYoy87eEvq9l4XmPNZfXE2dllTIvP+ToyQeHaVZyKLcOFuXXF03Idmsn+/FLVtklko=
X-Received: by 2002:aca:efd7:: with SMTP id
	n206-v6mr8238752oih.70.1532714339236; 
	Fri, 27 Jul 2018 10:58:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Fri, 27 Jul 2018 10:58:38
	-0700 (PDT)
In-Reply-To: <CAMKF1spY45xEPKK9nEVLZnAW0dLGB8soEMWPGjHm=dBOrGxy=g@mail.gmail.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
	<20180727153248.22838-16-ross.burton@intel.com>
	<CAMKF1spY45xEPKK9nEVLZnAW0dLGB8soEMWPGjHm=dBOrGxy=g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Jul 2018 18:58:38 +0100
Message-ID: <CAJTo0LanAStkgfag3k9bHSTKVize_umjGu9Eakoiof2hLrvUkQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/16] pax-utils: remove
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
X-List-Received-Date: Fri, 27 Jul 2018 17:58:58 -0000
Content-Type: text/plain; charset="UTF-8"

If someone wants to use it, it will be in meta-oe.

Ross

On 27 July 2018 at 18:52, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On Fri, Jul 27, 2018 at 8:34 AM Ross Burton <ross.burton@intel.com> wrote:
>>
>> This was packaged originally to perform QA tests on binaries (text
>> relocations
>> and RPATHs), but we perform those tests at build-time now.
>
>
> So how did we replace scanelf functionality
> I still think that it is a core tool from hardening point of view
>>
>>
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb | 36
>> ----------------------
>>  1 file changed, 36 deletions(-)
>>  delete mode 100644 meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
>>
>> diff --git a/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
>> b/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
>> deleted file mode 100644
>> index 9635a5e7082..00000000000
>> --- a/meta/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -SUMMARY = "Security-focused ELF files checking tool"
>> -DESCRIPTION = "This is a small set of various PaX aware and related \
>> -utilities for ELF binaries. It can check ELF binary files and running \
>> -processes for issues that might be relevant when using ELF binaries \
>> -along with PaX, such as non-PIC code or executable stack and heap."
>> -HOMEPAGE = "http://www.gentoo.org/proj/en/hardened/pax-utils.xml"
>> -LICENSE = "GPLv2+"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
>> -
>> -SRC_URI = "https://dev.gentoo.org/~vapier/dist/pax-utils-${PV}.tar.xz"
>> -SRC_URI[md5sum] = "a580468318f0ff42edf4a8cd314cc942"
>> -SRC_URI[sha256sum] =
>> "7f4a7f8db6b4743adde7582fa48992ad01776796fcde030683732f56221337d9"
>> -
>> -RDEPENDS_${PN} += "bash"
>> -
>> -export GNULIB_OVERRIDES_WINT_T = "0"
>> -
>> -do_configure_prepend() {
>> -    touch ${S}/NEWS ${S}/AUTHORS ${S}/ChangeLog ${S}/README
>> -}
>> -
>> -do_install() {
>> -    oe_runmake PREFIX=${D}${prefix} DESTDIR=${D} install
>> -}
>> -
>> -BBCLASSEXTEND = "native"
>> -
>> -inherit autotools pkgconfig
>> -
>> -PACKAGECONFIG ??= ""
>> -
>> -PACKAGECONFIG[libcap] = "--with-caps, --without-caps, libcap"
>> -PACKAGECONFIG[libseccomp] = "--with-seccomp, --without-seccomp,
>> libseccomp"
>> -PACKAGECONFIG[pyelftools] = "--with-python, --without-python,,
>> pyelftools"
>> -
>> -EXTRA_OECONF += "--enable-largefile"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

