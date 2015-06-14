Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3A77B607BB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jun 2015 23:12:27 +0000 (UTC)
Received: by pdjn11 with SMTP id n11so59306840pdj.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jun 2015 16:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=zaEWN1pw/K79BDxaNjrnSpSBQFmn7N+IP3nox/oSSlg=;
	b=N5tuepY4EWOD6XjNdtvtNwMoPih3G/2yn6wbPeP371tUYVst7IUhDC22SKleuZB+bj
	4osfTm8WsSUTu728zFUn9uQeMZkeFa4icvHzzYS150Wn2Q7IwcnnMzAo5dwo9uJu5L3G
	mCj59LRR8d0pC+1q+/Pjp3ZpMyW/IGSFu8Pk2AfLTx7pRqJ8Gm1in3u3rPktjySVzB0C
	hwpEEYCmBkv/YS1tUaxExSXeZg1k3I7yKOK3WEfzwZDbwcYrHftwakpR5enCk6SnstGz
	oFmVi8AYC1fwKn7tJIL5Yk2WCCEWyIl20R4kYU4ZbJqYiyts9kjYKEkuE8KnWmY1ceTo
	bVdg==
X-Received: by 10.68.231.98 with SMTP id tf2mr43189499pbc.12.1434323549258;
	Sun, 14 Jun 2015 16:12:29 -0700 (PDT)
Received: from Akusters-laptop-2.local
	([2601:202:4000:1239:4c4f:8c4b:7f0d:18e8])
	by mx.google.com with ESMTPSA id i6sm10167438pde.3.2015.06.14.16.12.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Jun 2015 16:12:27 -0700 (PDT)
Message-ID: <557E0A58.7010809@gmail.com>
Date: Sun, 14 Jun 2015 16:12:24 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1433771147.git.alejandro.hernandez@linux.intel.com>
	<c677cd4c037f5eea0ecc49300baac9731c41b1c0.1433771147.git.alejandro.hernandez@linux.intel.com>
	<557D178A.5050509@gmail.com>
	<CAMKF1sqHATLXo8i55Z+MjFdfb=Ra-pCYR8h=jjtgxGp5e36ewA@mail.gmail.com>
In-Reply-To: <CAMKF1sqHATLXo8i55Z+MjFdfb=Ra-pCYR8h=jjtgxGp5e36ewA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2][dizzy] python-nose: backport it to dizzy
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
X-List-Received-Date: Sun, 14 Jun 2015 23:12:30 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 6/14/15 9:13 AM, Khem Raj wrote:
> On Sun, Jun 14, 2015 at 1:56 AM, akuster808 <akuster808@gmail.com> wrote:
>> Alejandro,
>>
>> This looks to be a new recipe. I don't believe dizzy is taking new features.
> Contextual. If its a leaf recipe in terms of dependencies, I don't see any harm.

It is still  a new recipe.  If adding new recipes is something that
should be allowed on a maintenance release, then the policy should be
updated. I still not in favor of adding new recipes nor features to a
maintenance release.

- Armin
>
>> - armin
>>
>>
>> On 06/08/2015 06:56 AM, Alejandro Hernandez wrote:
>>> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
>>> ---
>>>   meta/recipes-devtools/python/python-nose_1.3.6.bb | 16 ++++++++++++++++
>>>   1 file changed, 16 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/python/python-nose_1.3.6.bb
>>>
>>> diff --git a/meta/recipes-devtools/python/python-nose_1.3.6.bb
>>> b/meta/recipes-devtools/python/python-nose_1.3.6.bb
>>> new file mode 100644
>>> index 0000000..d6e8fc1
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/python/python-nose_1.3.6.bb
>>> @@ -0,0 +1,16 @@
>>> +DESCRIPTION = "nose extends the test loading and running features of
>>> unittest, \
>>> +making it easier to write, find and run tests."
>>> +SECTION = "devel/python"
>>> +LICENSE = "LGPLv2.1"
>>> +LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
>>> +
>>> +SRC_URI =
>>> "http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
>>> +
>>> +SRC_URI[md5sum] = "0ca546d81ca8309080fc80cb389e7a16"
>>> +SRC_URI[sha256sum] =
>>> "f61e0909a743eed37b1207e38a8e7b4a2fe0a82185e36f2be252ef1b3f901758"
>>> +
>>> +S = "${WORKDIR}/nose-${PV}"
>>> +
>>> +inherit setuptools
>>> +
>>> +BBCLASSEXTEND = "native nativesdk"
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


