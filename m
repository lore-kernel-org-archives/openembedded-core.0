Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0F17278D34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 16:13:21 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id d189-v6so9985243oib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 09:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CL0m+VhvuiNO9GSHRz4Z65nWA7+TkJ/asxmtph27fbM=;
	b=1fHy11hIzq1W+llqzTNSsytUOD4uZk0eLBqnHu9OdEk8WnDgwz3zlvSzxXfm2PIcJ/
	l5CxAOwNjsChKCUnhsdbALvVz69wHCNGDyGRCBJAfs6SFvYL7gEs0r66jVmgPeyAtzOW
	DjAnPGJaSxYaoRwD+CaDYrTCRbqQJfgLLwtkUY+wYXloQDiaj9tSA18fIWw/mGpJALCO
	amMhCRLAxQd4tTEa4bDEUPF0pXbchZBu6jiMvkPcPmmerITnBLNzoGWyBRkeCoMeOUIQ
	3ZA9NuMpJJTZKjjoDl7gGeeseZEGlVPIsnwWu71xC0Fuj0l85vARnzRO5ImNbCSFi2QK
	yuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CL0m+VhvuiNO9GSHRz4Z65nWA7+TkJ/asxmtph27fbM=;
	b=q4fvj32q+VtJT0HsvfzWxJydSqVb4FYIt5OtWm/DBKqW7AeaOf/kqHUBEsRVzMvSKf
	BioBsmKE4ava4QoeBAIDHLpOoZoHj02EIGlvwjKsPbdl7DfZOLKBPwkWedlyXTSklBOn
	hlf9bVc3AvPatYQ3i33ZLsA//eQQSVaebkiQehb7a8stu8BV/Glg1TKJh9zTe685rAkx
	J5q+TEZOzALIKdhjAklxUI6UO3ZdugeQz+e11H1fdSGqSZnwf/FBR3PEpzzmCnTWNxvk
	EdoSzDUCGjd9QYxKo/Mbi4/FmArAHtNvuYQZaWCSX+lVO0A7cmSoKb0bXGAT1ylLG6w2
	Baug==
X-Gm-Message-State: AOUpUlH29n8ivGRyYoKMnF9M+0+Cloa9fcxKiX5Z8jeY3FSgogjS0vY0
	WbAx8YX4v0YwImurZt9KgWqCYMJXxseqxF31E0mJ4Q==
X-Google-Smtp-Source: AAOMgpeAS+9fDaK5PgtlUFC08v28Z2G6M0GnEQiKTdhHw5NMJJ4ZUNbUu8YDsFtI+rwRm30QsZN925P9O4fgHt9malk=
X-Received: by 2002:aca:5f56:: with SMTP id
	t83-v6mr7572483oib.115.1532708003130; 
	Fri, 27 Jul 2018 09:13:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Fri, 27 Jul 2018 09:13:02
	-0700 (PDT)
In-Reply-To: <CABcZANmAyxmcS3rb-MJOR50CJD6qOFZBoN78ap=r_Wwap_Zf7A@mail.gmail.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
	<20180727153248.22838-16-ross.burton@intel.com>
	<CABcZANmAyxmcS3rb-MJOR50CJD6qOFZBoN78ap=r_Wwap_Zf7A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Jul 2018 17:13:02 +0100
Message-ID: <CAJTo0LYVkE1aOr-SA2rPyc+VdwLwxzuRv20TZxR=GdeYBkKVhA@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 27 Jul 2018 16:13:22 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, I had it in a branch already, just hit the send button.

Ross

On 27 July 2018 at 17:01, Christopher Larson <kergoth@gmail.com> wrote:
> Should this be moved to meta-oe rather than just removed?
>
> On Fri, Jul 27, 2018 at 8:34 AM Ross Burton <ross.burton@intel.com> wrote:
>>
>> This was packaged originally to perform QA tests on binaries (text
>> relocations
>> and RPATHs), but we perform those tests at build-time now.
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
>
>
>
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics

