Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 360277D114
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Mar 2019 19:11:08 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id u21so3614954lfu.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Mar 2019 12:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=OW5H7bfuoDLTEvK4AdVV26nl6u3uvvUlZYZPZ6AyemM=;
	b=OdK4QDCmtGiS/WdgR8DvqiHYk0Niy5EmcXPy5MJ6lSYxtkuJMv9ZeMhh9zE09gubDc
	kvCjETsfLnNPK67QVNVHzp0OoK1tour98sXdsRmfGcM9DNRw6LvM/lNcWI3qSs62TRUA
	ux9vUADvqC3KXvb/EW18lrLu+W+GQ69Ee63B8IIpG6nOk7kXRyNrocoA9jiW1p4qcYrY
	HScH7LghBcG/SE8aj4Q2lc2ctuduQfFZqkw5YmlL9QWF0v8SjlEba05KTO2gzujWXd8g
	FHdUIdkPufgHb+fssofWKm9/5dD1uJ9YIRydKkAIMy1UcbmG3MhPo0OyNB+ajoini6Ay
	pjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=OW5H7bfuoDLTEvK4AdVV26nl6u3uvvUlZYZPZ6AyemM=;
	b=Q5wCKrYWZ2/AuEeRGELKLWTWp/lNBGwiLXHsviZKdr17TTm8ULaQ9bOMbgDmSLoFpC
	I2wM1sX9ljfu2v8UQ3P6eaIGjSM1V03CucWJYXmQ0n0McPhlv610WTjVp7s4p+TtWdUU
	y3eHbe1eGQKhf33lR/JyHXvVEfK32tC+sTcfnw55puGMBUGq8ddyrrgTYEp7FftKg6vP
	P4h0uyTrvfzUmf/9FTjx1j+JIMFh8Ys2qtea/aYrVnPu9JEolyPXer+a7ngdhji4gwV0
	bfbOlw972vtHXXX8QuN5VPf6zpd1XyvrwFCd38aCu/O3YeTnpLrFrBtDt4OitZul26Fu
	GUfA==
X-Gm-Message-State: APjAAAXRZgwRbN0qKthIZU68l8iwnlMNqnA355IUBfmpYsWmtMN9QI+D
	4i5HZnqMBnd+aE8yDV1XlX9TbOp6WGk=
X-Google-Smtp-Source: APXvYqxgddpMgmu8Flbx/L78p5/LLd/011JXVTZhacfUw80z4x7RgEkU7UMW/Si6zKc6Qm2MHBj+jw==
X-Received: by 2002:a19:c303:: with SMTP id t3mr11579715lff.134.1553973069020; 
	Sat, 30 Mar 2019 12:11:09 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id v11sm932500lfb.68.2019.03.30.12.11.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Mar 2019 12:11:08 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20190323163858.15371-1-open.source@oleksandr-kravchuk.com>
	<CAMKF1spdgZwUH8LaaohT1hsWBa02iYCTQVN64CrhEaAveUyZnQ@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <ca17a559-20c5-424c-a677-c37151467f5d@oleksandr-kravchuk.com>
Date: Sat, 30 Mar 2019 20:11:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spdgZwUH8LaaohT1hsWBa02iYCTQVN64CrhEaAveUyZnQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ninja: upate to 1.9.0
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
X-List-Received-Date: Sat, 30 Mar 2019 19:11:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Khem -

Unfortunately, I could not find a solution of the doxygen build issue.

I have failed bug on doxygen and hope the community will assist:
https://github.com/doxygen/doxygen/issues/6906

On 28/03/2019 17:45, Khem Raj wrote:
> doxygen still fails
>
> https://errors.yoctoproject.org/Errors/Details/234762/
>
> On Sat, Mar 23, 2019 at 9:39 AM Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  .../ninja/ninja/fix-musl.patch                | 39 +++++++++++++++++++
>>  .../ninja/{ninja_1.8.2.bb => ninja_1.9.0.bb}  |  6 ++-
>>  2 files changed, 43 insertions(+), 2 deletions(-)
>>  create mode 100644 meta/recipes-devtools/ninja/ninja/fix-musl.patch
>>  rename meta/recipes-devtools/ninja/{ninja_1.8.2.bb => ninja_1.9.0.bb} (87%)
>>
>> diff --git a/meta/recipes-devtools/ninja/ninja/fix-musl.patch b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
>> new file mode 100644
>> index 0000000000..543d4f1c48
>> --- /dev/null
>> +++ b/meta/recipes-devtools/ninja/ninja/fix-musl.patch
>> @@ -0,0 +1,39 @@
>> +2ff54ad7478a90bd75c91e434236a Mon Sep 17 00:00:00 2001
>> +From: makepost <makepost@firemail.cc>
>> +Date: Mon, 24 Dec 2018 03:13:16 +0200
>> +Subject: [PATCH] Use st_mtim if st_mtime is macro, fix #1510
>> +
>> +In POSIX.1-2008, sys_stat has a st_mtim member and a st_mtime backward
>> +compatibility macro. Should help avoid hardcoding platform detection.
>> +---
>> + src/disk_interface.cc | 14 ++++----------
>> + 1 file changed, 4 insertions(+), 10 deletions(-)
>> +
>> +diff --git a/src/disk_interface.cc b/src/disk_interface.cc
>> +index d4c2fb087..dc297c449 100644
>> +--- src/disk_interface.cc
>> ++++ /src/disk_interface.cc
>> +@@ -202,19 +202,13 @@ TimeStamp RealDiskInterface::Stat(const string& path, string* err) const {
>> +   // that it doesn't exist.
>> +   if (st.st_mtime == 0)
>> +     return 1;
>> +-#if defined(__APPLE__) && !defined(_POSIX_C_SOURCE)
>> ++#if defined(_AIX)
>> ++  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
>> ++#elif defined(__APPLE__)
>> +   return ((int64_t)st.st_mtimespec.tv_sec * 1000000000LL +
>> +           st.st_mtimespec.tv_nsec);
>> +-#elif (_POSIX_C_SOURCE >= 200809L || _XOPEN_SOURCE >= 700 || defined(_BSD_SOURCE) || defined(_SVID_SOURCE) || \
>> +-       defined(__BIONIC__) || (defined (__SVR4) && defined (__sun)) || defined(__FreeBSD__))
>> +-  // For glibc, see "Timestamp files" in the Notes of http://www.kernel.org/doc/man-pages/online/pages/man2/stat.2.html
>> +-  // newlib, uClibc and musl follow the kernel (or Cygwin) headers and define the right macro values above.
>> +-  // For bsd, see https://github.com/freebsd/freebsd/blob/master/sys/sys/stat.h and similar
>> +-  // For bionic, C and POSIX API is always enabled.
>> +-  // For solaris, see https://docs.oracle.com/cd/E88353_01/html/E37841/stat-2.html.
>> ++#elif defined(st_mtime) // A macro, so we're likely on modern POSIX.
>> +   return (int64_t)st.st_mtim.tv_sec * 1000000000LL + st.st_mtim.tv_nsec;
>> +-#elif defined(_AIX)
>> +-  return (int64_t)st.st_mtime * 1000000000LL + st.st_mtime_n;
>> + #else
>> +   return (int64_t)st.st_mtime * 1000000000LL + st.st_mtimensec;
>> + #endif
>> diff --git a/meta/recipes-devtools/ninja/ninja_1.8.2.bb b/meta/recipes-devtools/ninja/ninja_1.9.0.bb
>> similarity index 87%
>> rename from meta/recipes-devtools/ninja/ninja_1.8.2.bb
>> rename to meta/recipes-devtools/ninja/ninja_1.9.0.bb
>> index c6fcfef3dd..1b06328961 100644
>> --- a/meta/recipes-devtools/ninja/ninja_1.8.2.bb
>> +++ b/meta/recipes-devtools/ninja/ninja_1.9.0.bb
>> @@ -5,9 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
>>
>>  DEPENDS = "re2c-native ninja-native"
>>
>> -SRCREV = "253e94c1fa511704baeb61cf69995bbf09ba435e"
>> +SRCREV = "b25c08bda4949192c69cea4cee057887341a2ffc"
>>
>> -SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
>> +SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release \
>> +           file://fix-musl.patch \
>> +"
>>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
>>
>>  S = "${WORKDIR}/git"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

