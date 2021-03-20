Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.9810.1616277710349613786
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 15:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uec6np9v;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso6574745pjb.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 15:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3TTMjANSjU8e9qTJ40e8jd723dHT9EnwDpAV65jAtqk=;
        b=Uec6np9vS+6EmvsP6/TJDaUMXP2/5Y9heKTcyUeXPEkQvjMnyNurY9o0sSa4LbYEf1
         umKfYRRPtrd6iEbhevq0HQosmNJriLw1BxNVZgVnnzUXpWZvWRx784HLR25o5mOFGfux
         Xi1hWF9iJeiAQrqM/Gy/o4trUVJB9sFrIUA6rqmRFvzTfavhgtjHapH2E+Quw9y2XOBF
         2WR3mqeHQBhSqBD7z8xMJm45Fe44U94dlMDvvD9a1alynKTuluPWdumiy4YmOcBNHeex
         BLY3ZQ2SJQ2TKqe0wozdejRslIEI3fgsx1U5eYrKNyvM4iOZpK0XlAtzqUtvPBFbaS90
         bqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3TTMjANSjU8e9qTJ40e8jd723dHT9EnwDpAV65jAtqk=;
        b=Otnwbqk6XxCtumE/qt35OmQlXoEk2qJMEbqfcj0Kd3aPTS4uxcfKyvvOYEb/pCKEV4
         dpopSUrj2bOb3TLwj8U2meSHBiZ+jXAVI0ADIPFCdATKUQtRjOHOUKi4TpLKmFX351N6
         q0EfuAqu4gKuJlx+hgaMzay3PRBa4qgvMQWf3sK/yL4xRnEsODbUBEht3Jh/Mkmmt6A+
         iMs7i09GWLKIy8phf67m9qN0CuOm3Ar0HeKTLkuPy1Xs4XgCE0rTN50Cgp50x2QrdgPB
         elL+kG3VYSR7iJyBdGR723aeVDs2alqiWu4qJJS6P8KV2KO96uaQf9qJ1BdFr1LC7woz
         zy6w==
X-Gm-Message-State: AOAM5328BU4W8hpkXNmxf/0YPFE4aJPte69Vo4375XE+esQKYwuq73O1
	bkZSqw11YieXKwTEnsb0/R9dKFjyD1/jIg==
X-Google-Smtp-Source: ABdhPJzIkGxxYK9PoBO/6ydRTKxVaEFrowl2cGIQSH88naXB8UM9+8lp4ljdZzl0bzU2BocEUFu33Q==
X-Received: by 2002:a17:902:7682:b029:e6:2bc5:f005 with SMTP id m2-20020a1709027682b02900e62bc5f005mr19701548pll.32.1616277709138;
        Sat, 20 Mar 2021 15:01:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:c4a9:4187:9c07:8080? ([2601:646:9200:a0f0:c4a9:4187:9c07:8080])
        by smtp.gmail.com with ESMTPSA id w22sm8898965pfi.133.2021.03.20.15.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Mar 2021 15:01:48 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 12/16] automake: update 1.16.2 - > 1.16.3
From: "Khem Raj" <raj.khem@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
 <20210319084401.576728-12-alex.kanavin@gmail.com>
 <CAMKF1soBhVCH+2YfBveNhPdtsMxOEizE9LDuhv4BX=ej6urKRg@mail.gmail.com>
Organization: HIMVIS LLC
Message-ID: <3dbb5069-8f44-0129-f135-c6825d738d89@gmail.com>
Date: Sat, 20 Mar 2021 15:01:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soBhVCH+2YfBveNhPdtsMxOEizE9LDuhv4BX=ej6urKRg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/19/21 8:45 PM, Khem Raj wrote:
> here is a related failure
> https://errors.yoctoproject.org/Errors/Details/574252/
> 

FWIW, I have posted a fix for gaudio makery for this to oe-devel, so we 
should be good with pulling this update in core from my POV.

> On Fri, Mar 19, 2021 at 1:45 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>>
>> Drop automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch;
>> upstream has fixed the issue.
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>   ...in-shebangs-with-modern-use-warnings.patch | 60 -------------------
>>   .../automake/automake/python-libdir.patch     | 16 ++---
>>   ...{automake_1.16.2.bb => automake_1.16.3.bb} | 18 +++---
>>   3 files changed, 16 insertions(+), 78 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
>>   rename meta/recipes-devtools/automake/{automake_1.16.2.bb => automake_1.16.3.bb} (61%)
>>
>> diff --git a/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch b/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
>> deleted file mode 100644
>> index 0e84c4bf86..0000000000
>> --- a/meta/recipes-devtools/automake/automake/automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch
>> +++ /dev/null
>> @@ -1,60 +0,0 @@
>> -From 857c843d4bcf576467b505eb05a47f3e7d32caaa Mon Sep 17 00:00:00 2001
>> -From: Serhii Popovych <spopovyc@cisco.com>
>> -Date: Wed, 10 Feb 2016 17:07:32 +0000
>> -Subject: [PATCH] perl: Replace -w option in shebangs with modern "use
>> - warnings" In some builds we might provide ac_cv_path_PERL as /usr/bin/env
>> - perl to use newer version of the perl from users PATH rather than older from
>> - standard system path.
>> -
>> -However using /usr/bin/env perl -w from shebang line isn't
>> -possible because it translates to something like
>> -/usr/bin/env -w perl and env complains about illegal option.
>> -
>> -To address this we can remove -w option from perl shebang
>> -line and add "use warnings" statement.
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
>> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> -
>> ----
>> - bin/aclocal.in  | 3 ++-
>> - bin/automake.in | 3 ++-
>> - 2 files changed, 4 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/bin/aclocal.in b/bin/aclocal.in
>> -index 9a20325..bd185d4 100644
>> ---- a/bin/aclocal.in
>> -+++ b/bin/aclocal.in
>> -@@ -1,4 +1,4 @@
>> --#!@PERL@ -w
>> -+#!@PERL@
>> - # aclocal - create aclocal.m4 by scanning configure.ac      -*- perl -*-
>> - # @configure_input@
>> - # Copyright (C) 1996-2020 Free Software Foundation, Inc.
>> -@@ -26,6 +26,7 @@ BEGIN
>> - }
>> -
>> - use strict;
>> -+use warnings;
>> -
>> - use Automake::Config;
>> - use Automake::General;
>> -diff --git a/bin/automake.in b/bin/automake.in
>> -index 5ed404a..d387b8e 100644
>> ---- a/bin/automake.in
>> -+++ b/bin/automake.in
>> -@@ -1,4 +1,4 @@
>> --#!@PERL@ -w
>> -+#!@PERL@
>> - # automake - create Makefile.in from Makefile.am            -*- perl -*-
>> - # @configure_input@
>> - # Copyright (C) 1994-2020 Free Software Foundation, Inc.
>> -@@ -23,6 +23,7 @@
>> - package Automake;
>> -
>> - use strict;
>> -+use warnings;
>> -
>> - BEGIN
>> - {
>> diff --git a/meta/recipes-devtools/automake/automake/python-libdir.patch b/meta/recipes-devtools/automake/automake/python-libdir.patch
>> index ee1f725f76..f319fc001b 100644
>> --- a/meta/recipes-devtools/automake/automake/python-libdir.patch
>> +++ b/meta/recipes-devtools/automake/automake/python-libdir.patch
>> @@ -1,4 +1,4 @@
>> -From a80dacd5124d0713cf2c986b28d736e78dc6b0ca Mon Sep 17 00:00:00 2001
>> +From 61bd143910001aaf610416d7ca56c52c0b081318 Mon Sep 17 00:00:00 2001
>>   From: Kumar Gala <galak@kernel.crashing.org>
>>   Date: Thu, 11 Aug 2011 01:26:33 -0500
>>   Subject: [PATCH] automake: Update for python.m4 to respect libdir
>> @@ -17,11 +17,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>    1 file changed, 7 insertions(+), 20 deletions(-)
>>
>>   diff --git a/m4/python.m4 b/m4/python.m4
>> -index 63c0a0e..7bbd2d2 100644
>> +index b2302ba..dbc6954 100644
>>   --- a/m4/python.m4
>>   +++ b/m4/python.m4
>> -@@ -94,12 +94,13 @@ AC_DEFUN([AM_PATH_PYTHON],
>> -     [am_cv_python_version=`$PYTHON -c "import sys; sys.stdout.write(sys.version[[:3]])"`])
>> +@@ -96,12 +96,13 @@ AC_DEFUN([AM_PATH_PYTHON],
>> +     [am_cv_python_version=`$PYTHON -c "import sys; print('%u.%u' % sys.version_info[[:2]])"`])
>>      AC_SUBST([PYTHON_VERSION], [$am_cv_python_version])
>>
>>   -  dnl Use the values of $prefix and $exec_prefix for the corresponding
>> @@ -36,7 +36,7 @@ index 63c0a0e..7bbd2d2 100644
>>      AC_SUBST([PYTHON_EXEC_PREFIX], ['${exec_prefix}'])
>>
>>      dnl At times (like when building shared libraries) you may want
>> -@@ -144,14 +145,7 @@ except ImportError:
>> +@@ -146,14 +147,7 @@ except ImportError:
>>         else
>>           am_py_prefix=$prefix
>>         fi
>> @@ -52,7 +52,7 @@ index 63c0a0e..7bbd2d2 100644
>>         case $am_cv_python_pythondir in
>>         $am_py_prefix*)
>>           am__strip_prefix=`echo "$am_py_prefix" | sed 's|.|.|g'`
>> -@@ -161,7 +155,7 @@ sys.stdout.write(sitedir)"`
>> +@@ -163,7 +157,7 @@ sys.stdout.write(sitedir)"`
>>           case $am_py_prefix in
>>             /usr|/System*) ;;
>>             *)
>> @@ -61,7 +61,7 @@ index 63c0a0e..7bbd2d2 100644
>>            ;;
>>           esac
>>           ;;
>> -@@ -186,14 +180,7 @@ sys.stdout.write(sitedir)"`
>> +@@ -188,14 +182,7 @@ sys.stdout.write(sitedir)"`
>>         else
>>           am_py_exec_prefix=$exec_prefix
>>         fi
>> @@ -77,7 +77,7 @@ index 63c0a0e..7bbd2d2 100644
>>         case $am_cv_python_pyexecdir in
>>         $am_py_exec_prefix*)
>>           am__strip_prefix=`echo "$am_py_exec_prefix" | sed 's|.|.|g'`
>> -@@ -203,7 +190,7 @@ sys.stdout.write(sitedir)"`
>> +@@ -205,7 +192,7 @@ sys.stdout.write(sitedir)"`
>>           case $am_py_exec_prefix in
>>             /usr|/System*) ;;
>>             *)
>> diff --git a/meta/recipes-devtools/automake/automake_1.16.2.bb b/meta/recipes-devtools/automake/automake_1.16.3.bb
>> similarity index 61%
>> rename from meta/recipes-devtools/automake/automake_1.16.2.bb
>> rename to meta/recipes-devtools/automake/automake_1.16.3.bb
>> index 08ec034626..7dc59d9fe7 100644
>> --- a/meta/recipes-devtools/automake/automake_1.16.2.bb
>> +++ b/meta/recipes-devtools/automake/automake_1.16.3.bb
>> @@ -19,16 +19,14 @@ RDEPENDS_${PN} += "\
>>   RDEPENDS_${PN}_class-native = "autoconf-native hostperl-runtime-native"
>>
>>   SRC_URI += "file://python-libdir.patch \
>> -            file://buildtest.patch \
>> -            file://performance.patch \
>> -            file://new_rt_path_for_test-driver.patch \
>> -            file://automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch \
>> -            file://0001-automake-Add-default-libtool_tag-to-cppasm.patch \
>> -            file://0001-build-fix-race-in-parallel-builds.patch \
>> -            "
>> -
>> -SRC_URI[md5sum] = "f1a14f2ab2b0fb861a011e1d94e589e0"
>> -SRC_URI[sha256sum] = "b2f361094b410b4acbf4efba7337bdb786335ca09eb2518635a09fb7319ca5c1"
>> +           file://buildtest.patch \
>> +           file://performance.patch \
>> +           file://new_rt_path_for_test-driver.patch \
>> +           file://0001-automake-Add-default-libtool_tag-to-cppasm.patch \
>> +           file://0001-build-fix-race-in-parallel-builds.patch \
>> +           "
>> +
>> +SRC_URI[sha256sum] = "ce010788b51f64511a1e9bb2a1ec626037c6d0e7ede32c1c103611b9d3cba65f"
>>
>>   PERL = "${USRBINPATH}/perl"
>>   PERL_class-native = "${USRBINPATH}/env perl"
>> --
>> 2.29.2
>>
>>
>> 
>>
