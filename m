Return-Path: <stefan.strogin@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3378D71ABB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:45:46 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id t72so4021675lff.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 12:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=obi565vrTFtFfXBrQiLGwyAEj2+Iam2UTbf8rodIStU=;
	b=vFM0nNSM/Ab4JgZhb7EvQqGXwedfOtyaR4Hu7rPNPNTVrQAQqibyCV5ubdJ21YbUUA
	8l6O4vAOlZ+YYQGLCobjRDYev+7gz8TpGjMjnv9YBMO3Gg2BUoi/TPHytlhVSa2UkiE2
	FsR/SaRpLxUAx25IBP2Hq09r6FxYHUCJSpQugturYDvIn2C8PLqjWLnTw3PBrTMfcTLg
	kcmEezZgFBix5TpsN427q951g3bappweOrl5rEzqHWJEFodyUGne1fEQ8GZ0n1aDT31i
	SAbS8u5++K17fpNopzRSSZUR+h+Rm7YTAVNK006gIaGNYJi70dIlm3iTpfdKkHngZC8Y
	YbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=obi565vrTFtFfXBrQiLGwyAEj2+Iam2UTbf8rodIStU=;
	b=PCoNx/uozFLCwqtF+v9Q3l9aqDeRUFm3z1T5ukwQP5JWtSc9U0/GLe8wvTCVIeTMk1
	J0aFYgkdGN9UdWB1urru3DLCBcnBnM4BERrXK1oT5Z/s3U4Hyko0b4rnBIwZWEtNP7nr
	ZqAgaMKCtrVT/uDLMQMzTIK2IU2zUBhlxGU5E45FkaXdXo9XJm/YiCiOqfkX/dLNukal
	4xIfAAy8fPLhY9T5IV20Fuf/tVIhuJC5IbIivRjn2QRsqhUHETls4lxoHTr0l2xViSXn
	clp6A25B/bYHUVukXehIautZT9vBCmMcDma++eVGemkdvr/6pQAZYZeSA8OZQvjr2x6C
	LXtw==
X-Gm-Message-State: AIVw113IbwMnCp5/RLETiyD99Y4lHQxXqzUgdDaCrqpNcH2Qnd0VaOAd
	c8v4Z11ZqzkizA==
X-Received: by 10.25.219.208 with SMTP id t77mr61494lfi.110.1499888747251;
	Wed, 12 Jul 2017 12:45:47 -0700 (PDT)
Received: from [192.168.1.3] ([109.95.51.107])
	by smtp.googlemail.com with ESMTPSA id
	n89sm705045lje.20.2017.07.12.12.45.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jul 2017 12:45:46 -0700 (PDT)
To: Robert Yang <liezhi.yang@windriver.com>,
	Stefan Strogin <sstrogin@cisco.com>,
	openembedded-core@lists.openembedded.org
References: <20170620162102.27948-1-sstrogin@cisco.com>
	<c2a53be7-9d79-04e5-e6d3-5e1918443a9d@windriver.com>
	<f2e42f21-8059-c195-c2b6-b21f5af4d51e@cisco.com>
	<511f8c91-2d28-680c-7bcd-f22d67e0a7d2@windriver.com>
From: Stefan Strogin <stefan.strogin@gmail.com>
Message-ID: <feb1fc77-f32a-a970-e802-7cfef38b5d0c@gmail.com>
Date: Wed, 12 Jul 2017 22:45:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <511f8c91-2d28-680c-7bcd-f22d67e0a7d2@windriver.com>
Cc: xe-linux-external@cisco.com
Subject: Re: [PATCH v3] slang: add ptest
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
X-List-Received-Date: Wed, 12 Jul 2017 19:45:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Oh, I see. There are no errors in my log.do_compile_ptest_base
and nothing is written to the terminal when building slang, it confused me.
But there is an error in log.do_configure indeed,
"ERROR: /usr/bin/ncurses5-config should not be used". I'll fix it.

On 12/07/17 04:36, Robert Yang wrote:
> 
> On 07/12/2017 01:31 AM, Stefan Strogin wrote:
>> Hi Robert,
>>
>> Thanks for the report. Could you say how to reproduce the error? What target architecture, config options, oe-core version, etc do you use?
>> I have tried with openembedded-core 643c81af (master), with
>> MACHINE = "qemux86-64",
>> EXTRA_IMAGE_FEATURES ?= "debug-tweaks ptest-pkgs"
>> DISTRO_FEATURES += "ptest"
>> and CORE_IMAGE_EXTRA_INSTALL += "slang"
>> set in local.conf, everything builds fine.
> 
> The ARCH doesn't matter, I can see the error on every builds, is there
> "ERROR: /usr/bin/ncurses5-config should not be used" in your log.do_configure
> please ? What does it use for ncurses in your build?
> 
> // Robert
> 
>>
>> --
>> Stefan
>>
>> On 11/07/17 04:36, Robert Yang wrote:
>>> Hello Stefan,
>>>
>>> There is an error when do_compile_ptest_base:
>>>
>>> | ../objs/libslang.a(sldisply.o): In function `tt_tgetstr':
>>> | /usr/src/debug/slang/2.3.1a-r0/slang-2.3.1a/src/sldisply.c:2576: undefined
>>> reference to `tgetstr'
>>> | ../objs/libslang.a(sldisply.o): In function `SLtt_initialize':
>>> | /usr/src/debug/slang/2.3.1a-r0/slang-2.3.1a/src/sldisply.c:2770: undefined
>>> reference to `tgetent'
>>> | ../objs/libslang.a(sldisply.o): In function `tt_tgetflag':
>>> | /usr/src/debug/slang/2.3.1a-r0/slang-2.3.1a/src/sldisply.c:2635: undefined
>>> reference to `tgetflag'
>>>
>>>
>>> It is because it uses ncurses5-config which is wrong in oe-core, the
>>> log.do_configure shows:
>>>
>>> checking for ncurses5-config...
>>> /buildarea/lyang1/test_m/tmp/work/i586-poky-linux/slang/2.3.1a-r0/recipe-sysroot/usr/bin/crossscripts/ncurses5-config
>>> checking for terminfo... ERROR: /usr/bin/ncurses5-config should not be used, use
>>> an alternative such as pkg-config
>>>
>>> Would you please fix it?
>>>
>>> // Robert
>>>
>>> On 06/21/2017 12:21 AM, Stefan Strogin wrote:
>>>> This patch adds ptest for slang, it uses `make runtests` to run tests.
>>>> The Makefile runs runtests.sh for each *.sl and *.slc tests.
>>>> runtests.sh is patched for printing test results in a common format,
>>>> Makefile is patched in order not to compile any dependencies.
>>>>
>>>> Changes v2->v3: rebased on the latest master (1d9a88f6).
>>>>
>>>> Signed-off-by: Stefan Strogin <sstrogin@cisco.com>
>>>> Cc: xe-linux-external@cisco.com
>>>> ---
>>>>  meta/recipes-extended/slang/slang/run-ptest        |  3 +++
>>>>  ...-add-output-in-the-format-result-testname.patch | 30 ++++++++++++++++++++++
>>>>  meta/recipes-extended/slang/slang_2.3.1a.bb        | 25 +++++++++++++++++-
>>>>  3 files changed, 57 insertions(+), 1 deletion(-)
>>>>  create mode 100644 meta/recipes-extended/slang/slang/run-ptest
>>>>  create mode 100644 meta/recipes-extended/slang/slang/test-add-output-in-the-format-result-testname.patch
>>>>
>>>> diff --git a/meta/recipes-extended/slang/slang/run-ptest b/meta/recipes-extended/slang/slang/run-ptest
>>>> new file mode 100644
>>>> index 0000000000..39f474af31
>>>> --- /dev/null
>>>> +++ b/meta/recipes-extended/slang/slang/run-ptest
>>>> @@ -0,0 +1,3 @@
>>>> +#!/bin/sh
>>>> +
>>>> +make -C test runtests
>>>> diff --git a/meta/recipes-extended/slang/slang/test-add-output-in-the-format-result-testname.patch b/meta/recipes-extended/slang/slang/test-add-output-in-the-format-result-testname.patch
>>>> new file mode 100644
>>>> index 0000000000..27a9bb87ea
>>>> --- /dev/null
>>>> +++ b/meta/recipes-extended/slang/slang/test-add-output-in-the-format-result-testname.patch
>>>> @@ -0,0 +1,30 @@
>>>> +From 38688ee2754415cf2a1935dafb8278861b7315e7 Mon Sep 17 00:00:00 2001
>>>> +From: Stefan Strogin <sstrogin@cisco.com>
>>>> +Date: Thu, 2 Mar 2017 00:26:31 +0200
>>>> +Subject: [PATCH] test: add output in the format "result: testname"
>>>> +
>>>> +Upstream-Status: Inappropriate [oe specific]
>>>> +
>>>> +Signed-off-by: Stefan Strogin <sstrogin@cisco.com>
>>>> +---
>>>> + src/test/runtests.sh | 2 ++
>>>> + 1 file changed, 2 insertions(+)
>>>> +
>>>> +diff --git a/src/test/runtests.sh b/src/test/runtests.sh
>>>> +index a3eaad0..64f0705 100755
>>>> +--- a/src/test/runtests.sh
>>>> ++++ b/src/test/runtests.sh
>>>> +@@ -34,8 +34,10 @@ do
>>>> +     then
>>>> + 	n_failed=`expr ${n_failed} + 1`
>>>> + 	tests_failed="$tests_failed $testfile"
>>>> ++	echo "FAIL: $testfile"
>>>> +     else
>>>> +         touch lastrun/$testfile
>>>> ++	echo "PASS: $testfile"
>>>> +     fi
>>>> + done
>>>> +
>>>> +--
>>>> +2.11.0
>>>> +
>>>> diff --git a/meta/recipes-extended/slang/slang_2.3.1a.bb b/meta/recipes-extended/slang/slang_2.3.1a.bb
>>>> index c71d80481f..b302104ee1 100644
>>>> --- a/meta/recipes-extended/slang/slang_2.3.1a.bb
>>>> +++ b/meta/recipes-extended/slang/slang_2.3.1a.bb
>>>> @@ -17,6 +17,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a52a18a472d4f7e45479b06563717c02"
>>>>  SRC_URI = "http://www.jedsoft.org/releases/${BPN}/${BP}.tar.bz2 \
>>>>             file://no-x.patch \
>>>>             file://dont-link-to-host.patch \
>>>> +           file://test-add-output-in-the-format-result-testname.patch \
>>>> +           file://run-ptest \
>>>>            "
>>>>
>>>>  SRC_URI[md5sum] = "c5235313042ed0e71ec708f7b85ec241"
>>>> @@ -25,7 +27,7 @@ SRC_URI[sha256sum] = "54f0c3007fde918039c058965dffdfd6c5aec0bad0f4227192cc486021
>>>>  UPSTREAM_CHECK_URI = "http://www.jedsoft.org/releases/slang/"
>>>>  PREMIRRORS_append = "\n http://www.jedsoft.org/releases/slang/.* http://www.jedsoft.org/releases/slang/old/ \n"
>>>>
>>>> -inherit autotools-brokensep
>>>> +inherit autotools-brokensep ptest
>>>>  CLEANBROKEN = "1"
>>>>
>>>>  EXTRA_OECONF = "--without-onig"
>>>> @@ -49,6 +51,27 @@ do_configure_prepend() {
>>>>      cd ${B}
>>>>  }
>>>>
>>>> +do_compile_ptest() {
>>>> +	oe_runmake -C src static
>>>> +	oe_runmake -C src/test sltest
>>>> +}
>>>> +
>>>> +do_install_ptest() {
>>>> +	mkdir ${D}${PTEST_PATH}/test
>>>> +	for f in Makefile sltest runtests.sh *.sl *.inc; do
>>>> +		cp ${S}/src/test/$f ${D}${PTEST_PATH}/test/
>>>> +	done
>>>> +	sed -e 's/\ \$(TEST_PGM)\.c\ assoc\.c\ list\.c\ \$(SLANGLIB)\/libslang\.a//' \
>>>> +	    -e '/\$(CC).*(TEST_PGM)/d' \
>>>> +	    -i ${D}${PTEST_PATH}/test/Makefile
>>>> +
>>>> +	cp ${S}/slsh/lib/require.sl ${D}${PTEST_PATH}/test/
>>>> +	sed -i 's/\.\.\/\.\.\/slsh\/lib\/require\.sl/require\.sl/' ${D}${PTEST_PATH}/test/req.sl
>>>> +
>>>> +	cp ${S}/doc/text/slangfun.txt ${D}${PTEST_PATH}/test/
>>>> +	sed -i 's/\.\.\/\.\.\/doc\/text\/slangfun\.txt/slangfun\.txt/' ${D}${PTEST_PATH}/test/docfun.sl
>>>> +}
>>>> +
>>>>  FILES_${PN} += "${libdir}/${BPN}/v2/modules/ ${datadir}/slsh/"
>>>>
>>>>  PARALLEL_MAKE = ""
>>>>
>>
>>


