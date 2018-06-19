Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 382EF74603
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 04:25:56 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id b17-v6so9265824pfi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 21:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=GXBqoOBdaUrpH+bGg2dCA2ZmnTXiGUh0M3aQGQWvMso=;
	b=KgSWXFWyhZ2Eu+ajIWZ2z0+qnOCcF/dJmRGxMVvfRheMCtcRAPfeFUk5j8Q8I03lVp
	SQMFYAqP5Rj0WKIPk1uLy9LWUO0qAZRxdzmArp4Et6usUa59WVgQxzjoDcztsdHiagd2
	sppDYONvSSX7OOeK1pjh2G5HmVC2MljF0CsXKhTcDGlGzRMAkgdCxXLQUUGTBOygySSL
	zlSdNV5baAQLwgqWhWXGtYPtm6cCrSghgNks/FvfI/s84JZ0ajdjYx9zpZg7NweLv8ZC
	XAC2oK5F8bfp8gu0g69BMuI1a959KDda260S3R95n8uWxFA3UeEblfXBwbqQ3lZcsL7K
	oKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=GXBqoOBdaUrpH+bGg2dCA2ZmnTXiGUh0M3aQGQWvMso=;
	b=MEvfz1uaAdTbHWFohQWEsa8Otfe27k+yxnP6WRq4vRAex0YbQf82Dkz10kJxlz7hH7
	wJBz52s4jLOSVx/42Lm1jKqK+neusp1xXwL3s2HjEIH1Ch40/qpCIgbc5zxVQ02u0mXw
	Slx3zxxUnnrpPdQrkMONWGSXUwJ5X7Xlu+g0q7XO0J67fVBPIdaJEOuxLQPXaf2f9FfS
	IWUIERa27DY4p4cj3UYis/nLOOoYnwDzxhXZGkDsaq1kfKMU8NFXubWrn1o7mLhXyi9G
	gXAwUd344KyFuVWkSQnZ3vO0VleI1NaJ+/v+f7V5KrFj4XG7Nlk7vUpF+7BI5xJbcesJ
	sW4Q==
X-Gm-Message-State: APt69E2yEZZ1wLgS+a+r+hBxcqhu75rQL3q6HJI1gfYZZmqA6gl5hlSw
	STl6Z8Ry7T3NWQhgkFCRTZb40A==
X-Google-Smtp-Source: ADUXVKJn0fSRHxdRbujgx5m9I60bF1M2KRQ8k8KURmB+jr38xz7HcTJ314el99INYHIfV6wy/tLrPA==
X-Received: by 2002:a62:c918:: with SMTP id
	k24-v6mr16315504pfg.160.1529382357117; 
	Mon, 18 Jun 2018 21:25:57 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:59dc:e6d2:872c:4e7f?
	([2601:202:4000:1184:59dc:e6d2:872c:4e7f])
	by smtp.gmail.com with ESMTPSA id
	v26-v6sm23846428pfe.13.2018.06.18.21.25.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jun 2018 21:25:56 -0700 (PDT)
To: Saul Wold <sgw@linux.intel.com>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	openembedded-core@lists.openembedded.org
References: <1528788854-29279-1-git-send-email-naresh.kamboju@linaro.org>
	<283c5cb8-ec62-99a4-156c-8748a46f6ea1@linux.intel.com>
	<20005489-c469-6aea-6471-92867ac55595@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <9caf6a77-26d7-939c-cd42-8c2475f53da0@gmail.com>
Date: Mon, 18 Jun 2018 21:25:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20005489-c469-6aea-6471-92867ac55595@linux.intel.com>
Subject: Re: [PATCH v3] ltp: fix cve-2017-5669 test case
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
X-List-Received-Date: Tue, 19 Jun 2018 04:25:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 06/18/2018 09:58 AM, Saul Wold wrote:
> Armin
>
> Is there any chance of getting this into Sumo and Rocko?
Is there a chance we can have  a beer the next time I am in Eugene?

The CVE framework for LTP appears to be in the Rocko version so a little
backporting  is in order.. I will poke at it to see how straight forward
it might be. If i can, you will see patches.


- Armin
>
>
> Sau!
>
>
> On 06/13/2018 10:40 AM, Saul Wold wrote:
>> Can this be backported to both Rocko and Sumo?
>>
>> Or is this a case to update LTP in those older releases?
>>
>>
>> Sau!
>>
>>
>> On 06/12/2018 12:34 AM, Naresh Kamboju wrote:
>>> Adding cve-2017-5669 test fix patch which is accepted upstream in
>>> LTP repo.
>>>
>>> Ref:
>>> cve-2017-5669: shmat() for 0 (or <PAGESIZE with RND flag) has to
>>> fail with REMAPs
>>> https://github.com/linux-test-project/ltp/pull/324
>>>
>>> Upstream-Status: Accepted
>>> [https://github.com/linux-test-project/ltp/pull/324]
>>> CVE: cve-2017-5669
>>> Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>>> ---
>>>   ...69-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch | 97
>>> ++++++++++++++++++++++
>>>   meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
>>>   2 files changed, 98 insertions(+)
>>>   create mode 100644
>>> meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
>>>
>>> diff --git
>>> a/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
>>> b/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
>>>
>>> new file mode 100644
>>> index 0000000..2a47785
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-extended/ltp/ltp/0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
>>> @@ -0,0 +1,97 @@
>>> +From b767b73ef027ba8d35f297c7d3659265ac80425b Mon Sep 17 00:00:00 2001
>>> +From: Rafael David Tinoco <rafael.tinoco@canonical.com>
>>> +Date: Wed, 30 May 2018 09:14:34 -0300
>>> +Subject: [PATCH] cve-2017-5669: shmat() for 0 (or <PAGESIZE with
>>> RND flag) has
>>> + to fail with REMAPs
>>> +
>>> +Fixes: https://github.com/linux-test-project/ltp/issues/319
>>> +
>>> +According to upstream thread (https://lkml.org/lkml/2018/5/28/2056),
>>> +cve-2017-5669 needs to address the "new" way of handling nil addresses
>>> +for shmat() when used with MAP_FIXED or SHM_REMAP flags.
>>> +
>>> +- mapping nil-page is OK on lower addresses with MAP_FIXED (or else
>>> X11 is broken)
>>> +- mapping nil-page is NOT OK with SHM_REMAP on lower addresses
>>> +
>>> +Addresses Davidlohr Bueso's comments/changes:
>>> +
>>> +commit 8f89c007b6de
>>> +Author: Davidlohr Bueso <dave@stgolabs.net>
>>> +Date:   Fri May 25 14:47:30 2018 -0700
>>> +
>>> +    ipc/shm: fix shmat() nil address after round-down when remapping
>>> +
>>> +commit a73ab244f0da
>>> +Author: Davidlohr Bueso <dave@stgolabs.net>
>>> +Date:   Fri May 25 14:47:27 2018 -0700
>>> +
>>> +    Revert "ipc/shm: Fix shmat mmap nil-page protection"
>>> +
>>> +For previously test, and now broken, made based on:
>>> +
>>> +commit 95e91b831f87
>>> +Author: Davidlohr Bueso <dave@stgolabs.net>
>>> +Date:   Mon Feb 27 14:28:24 2017 -0800
>>> +
>>> +    ipc/shm: Fix shmat mmap nil-page protection
>>> +
>>> +Signed-off-by: Rafael David Tinoco <rafael.tinoco@linaro.org>
>>> +Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>>> +Reviewed-by: Jan Stancek <jstancek@redhat.com>
>>> +
>>> +Upstream-Status: Accepted
>>> [https://github.com/linux-test-project/ltp/pull/324]
>>> +CVE: cve-2017-5669
>>> +Signed-off-by: Rafael David Tinoco <rafael.tinoco@linaro.org>
>>> +---
>>> + testcases/cve/cve-2017-5669.c | 20 +++++++++++++++++++-
>>> + 1 file changed, 19 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/testcases/cve/cve-2017-5669.c
>>> b/testcases/cve/cve-2017-5669.c
>>> +index 1ca5983..0834626 100644
>>> +--- a/testcases/cve/cve-2017-5669.c
>>> ++++ b/testcases/cve/cve-2017-5669.c
>>> +@@ -28,7 +28,20 @@
>>> +  * is just to see if we get an access error or some other
>>> unexpected behaviour.
>>> +  *
>>> +  * See commit 95e91b831f (ipc/shm: Fix shmat mmap nil-page
>>> protection)
>>> ++ *
>>> ++ * The commit above disallowed SHM_RND maps to zero (and rounded)
>>> entirely and
>>> ++ * that broke userland for cases like Xorg. New behavior disallows
>>> REMAPs to
>>> ++ * lower addresses (0<=PAGESIZE).
>>> ++ *
>>> ++ * See commit a73ab244f0da (Revert "ipc/shm: Fix shmat mmap
>>> nil-page protect...)
>>> ++ * See commit 8f89c007b6de (ipc/shm: fix shmat() nil address after
>>> round-dow...)
>>> ++ * See https://github.com/linux-test-project/ltp/issues/319
>>> ++ *
>>> ++ * This test needs root permissions or else security_mmap_addr(),
>>> from
>>> ++ * get_unmapped_area(), will cause permission errors when trying
>>> to mmap lower
>>> ++ * addresses.
>>> +  */
>>> ++
>>> + #include <sys/types.h>
>>> + #include <sys/ipc.h>
>>> + #include <sys/shm.h>
>>> +@@ -60,7 +73,11 @@ static void cleanup(void)
>>> + static void run(void)
>>> + {
>>> +     tst_res(TINFO, "Attempting to attach shared memory to null
>>> page");
>>> +-    shm_addr = shmat(shm_id, ((void *)1), SHM_RND);
>>> ++    /*
>>> ++     * shmat() for 0 (or < PAGESIZE with RND flag) has to fail
>>> with REMAPs
>>> ++     * https://github.com/linux-test-project/ltp/issues/319
>>> ++     */
>>> ++    shm_addr = shmat(shm_id, ((void *)1), SHM_RND | SHM_REMAP);
>>> +     if (shm_addr == (void *)-1) {
>>> +         shm_addr = NULL;
>>> +         if (errno == EINVAL) {
>>> +@@ -89,6 +106,7 @@ static void run(void)
>>> + }
>>> +
>>> + static struct tst_test test = {
>>> ++    .needs_root = 1,
>>> +     .setup = setup,
>>> +     .cleanup = cleanup,
>>> +     .test_all = run,
>>> +--
>>> +2.7.4
>>> +
>>> diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb
>>> b/meta/recipes-extended/ltp/ltp_20180515.bb
>>> index b07c1b9..48739f1 100644
>>> --- a/meta/recipes-extended/ltp/ltp_20180515.bb
>>> +++ b/meta/recipes-extended/ltp/ltp_20180515.bb
>>> @@ -41,6 +41,7 @@ SRC_URI =
>>> "git://github.com/linux-test-project/ltp.git \
>>> file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
>>> \
>>> file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
>>> file://0040-read_all-Define-FNM_EXTMATCH-if-not-already-like-und.patch
>>> \
>>> +
>>> file://0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch
>>> \
>>>              "
>>>     S = "${WORKDIR}/git"
>>
>


