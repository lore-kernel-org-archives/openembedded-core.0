Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7597E080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 20:14:28 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u17so7764508pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 13:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=1On+2dJvFiohadq/vLOSNZSc4Z6bcFdlJffalN4Ivbk=;
	b=sNk1KyYwwyd2d5gp5iq340pIgK8cPSPDE1l36l4gOUwVrPZ/CJ4mumGN44Z3bnv7Cf
	nmq/D1+NXU+0YSPNrVUPxFF1VEUZGvClvEzOh2oyKpA3jK5K7ZH3LjaNN4Lib5WYR8un
	t41oynd71VSofHKxj66xLR8Dhv6vv/qfMajU8JecpdkKKkZhY/U7B9HrREv8/ZU20E0p
	cepCAafuNzc/oZCY0TNgFsb7ZopwiLO87UdgPQs7/MYa/f7Htv7PxhvcvzKshNt7CKlR
	X4DW6Gyv6Ci00msyhMxr01Ay+kRgRLLO0ONfTa8/XsflXQ5aJbnUoEOks+qVyE5bhTgC
	fO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=1On+2dJvFiohadq/vLOSNZSc4Z6bcFdlJffalN4Ivbk=;
	b=Pn+SjtFUu9w+8w3qFvJUZBWPlramDqESmJnQsdggHqqX/wQ8v7sSQ2WcLOREyb6qt1
	1DSlPuPqCc39WFcbG+dgGrC2el4uFacF6NLEad51YcCB8RPjntYzdPSlovaMdy79grmX
	K+VXbXfj4+B5vgmzLa1FxfK8itk0fV/NUvFaE2JtLYFF2sDLgRiCffywjztIAGzP/KHH
	3cSHKKf2PFIUZ13awYJi6WxWwN18oM3yHsKvWEa9m3PL5QRo7L08bxX+MDTxH2q0y8XV
	GIPn8Z43fp67nl5VrSR6t1As7odD1iKHfvfVlpH5oRLQkJVRE7sWMwRmX04q+z8dnqOG
	AHBQ==
X-Gm-Message-State: APjAAAXJGH+8mDKwskVnoN9tcSzIXNesCXhIvVUGbkt2OQo+eu2aRDl1
	ZQZE0Y6RpcUQAt+tsOkflAlCQV8+9lI=
X-Google-Smtp-Source: APXvYqywNta3UW4xI6IMLorUFz1dBDk4/CFi1cs/x9csTXtfKd9fNtlDzVccMBQ49L9eZPQff8+Vow==
X-Received: by 2002:a62:14d6:: with SMTP id 205mr82465383pfu.4.1558383268803; 
	Mon, 20 May 2019 13:14:28 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	c5sm20397055pgh.86.2019.05.20.13.14.28
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 13:14:28 -0700 (PDT)
To: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC@Cisco)" <oobitots@cisco.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
References: <20190416152935.25062-1-oobitots@cisco.com>
	<a06cf453e2f54afbb2a1ccdaf325179f@XCH-RCD-007.cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ee4c71d8-fa1e-06e3-82c9-4a51d77f5c53@gmail.com>
Date: Mon, 20 May 2019 13:14:27 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <a06cf453e2f54afbb2a1ccdaf325179f@XCH-RCD-007.cisco.com>
Subject: Re: [PATCH] kexec-tools: Fix compilation with clang
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
X-List-Received-Date: Mon, 20 May 2019 20:14:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/16/19 1:32 AM, Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at 
Cisco) via Openembedded-core wrote:
> Any comments?
> 

This is same as https://bugzilla.kernel.org/show_bug.cgi?id=177321

and I think the below should have helped.

https://github.com/kraj/meta-clang/blob/master/conf/nonclangable.conf#L152-L158

If thats not helping then I would like to understand why

So lets try to fix the problem upstream first and meanwhile make fixes 
in meta-clang.

> Regards,
> Oleksiy
> 
> On 16.04.19 18:29, Oleksiy Obitotskyy wrote:
>> clang assembler do not understand some directives e.g.
>>
>> ../kexec-tools-2.0.17/purgatory/arch/i386/entry32-16.S:23:2: error: unknown directive
>> .arch i386
>> ^ ../kexec-tools-2.0.17/purgatory/arch/i386/entry32-16.S:115:11: error: unknown token in expression
>> ljmp %cs:*(realdest - entry16)
>> ^
>>
>> Force external assembler for purgatory and tests.
>>
>> Upstream-Status: Pending
>> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
>> ---
>>   ..._64-Makefile-fix-assemble-with-clang.patch | 23 +++++++++++++++++++
>>   .../kexec/kexec-tools_2.0.19.bb               |  2 ++
>>   2 files changed, 25 insertions(+)
>>   create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-x86_64-Makefile-fix-assemble-with-clang.patch
>>
>> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-x86_64-Makefile-fix-assemble-with-clang.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-x86_64-Makefile-fix-assemble-with-clang.patch
>> new file mode 100644
>> index 0000000000..13f247982a
>> --- /dev/null
>> +++ b/meta/recipes-kernel/kexec/kexec-tools/0001-purgatory-x86_64-Makefile-fix-assemble-with-clang.patch
>> @@ -0,0 +1,23 @@
>> +--- a/purgatory/Makefile	2019-03-05 07:47:03.190429822 -0800
>> ++++ b/purgatory/Makefile	2019-03-05 07:42:52.167623612 -0800
>> +@@ -31,6 +31,9 @@ include $(srcdir)/purgatory/arch/x86_64/
>> +
>> + PURGATORY_SRCS+=$($(ARCH)_PURGATORY_SRCS)
>> +
>> ++PURGATORY_EXTRA_CFLAGS += -no-integrated-as
>> ++$(ARCH)_PURGATORY_EXTRA_CFLAGS += -no-integrated-as
>> ++
>> + PURGATORY_OBJS = $(call objify, $(PURGATORY_SRCS)) purgatory/sha256.o
>> + PURGATORY_DEPS = $(call depify, $(PURGATORY_OBJS))
>> +
>> +--- a/kexec_test/Makefile	2019-03-05 07:45:14.757353575 -0800
>> ++++ b/kexec_test/Makefile	2019-03-05 07:45:57.567173264 -0800
>> +@@ -17,6 +17,8 @@ endif
>> +
>> + ifeq ($(BUILD_KEXEC_TEST),yes)
>> +
>> ++CPPFLAGS += -no-integrated-as
>> ++
>> + KEXEC_TEST_OBJS = $(call objify, $(KEXEC_TEST_SRCS))
>> + KEXEC_TEST_DEPS = $(call depify, $(KEXEC_TEST_OBJS))
>> +
>> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
>> index f65cd9f106..c229097d5b 100644
>> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
>> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.19.bb
>> @@ -20,6 +20,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
>>              file://0001-Disable-PIE-during-link.patch \
>>              "
>>   
>> +SRC_URI_append_toolchain-clang = " file://0001-purgatory-x86_64-Makefile-fix-assemble-with-clang.patch"
>> +
>>   SRC_URI[md5sum] = "052458f0a35c2a3b0d2302caa3318e9f"
>>   SRC_URI[sha256sum] = "913c8dee918e5855a4ba60d609371390978144b4c8d15d6446ca0057b7bc5e58"
>>   
> 

