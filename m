Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id CC972736AF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jun 2015 16:14:12 +0000 (UTC)
Received: by igbiq7 with SMTP id iq7so3284513igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jun 2015 09:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rnuO80idXl9HT8Gi0XcCqHgJX8AEkA1SMvCnvJdPFkk=;
	b=lXGb6fPMJnnqXIDWz737cfLt+YlH7dtL67aO/bgs50LLXwgbxiK2cXrGd7Ar5vqIjf
	yR1DPw5vTHF6m7Tivtd6OocInfKlpwQZMS/27tZtY3qKMR6dz1LwW6HfdxM+ZAYTRVI8
	ulKDh3ieHCxQE9Xh9aD1imUc455FswAlMGXBYMI1EPfV6p6ZSY8fIcjizRcA1ZJLJdlI
	g0r0TTDWF+UUaxZh/Z5PSK1gOc7uTtPSEdojvM6/2eSWNEgishnUScOSFQvLOkOEg3Fp
	RQ8KCVlYKbhROW3J4nIYFfRDpuo1loCE6PjxmSpEVJfl1vaWUsMKxthDAxQr7SzAKWZF
	h4qg==
X-Received: by 10.107.6.28 with SMTP id 28mr29565118iog.54.1434298453693; Sun,
	14 Jun 2015 09:14:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Sun, 14 Jun 2015 09:13:42 -0700 (PDT)
In-Reply-To: <557D178A.5050509@gmail.com>
References: <cover.1433771147.git.alejandro.hernandez@linux.intel.com>
	<c677cd4c037f5eea0ecc49300baac9731c41b1c0.1433771147.git.alejandro.hernandez@linux.intel.com>
	<557D178A.5050509@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Jun 2015 12:13:42 -0400
Message-ID: <CAMKF1sqHATLXo8i55Z+MjFdfb=Ra-pCYR8h=jjtgxGp5e36ewA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
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
X-List-Received-Date: Sun, 14 Jun 2015 16:14:18 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 14, 2015 at 1:56 AM, akuster808 <akuster808@gmail.com> wrote:
> Alejandro,
>
> This looks to be a new recipe. I don't believe dizzy is taking new features.

Contextual. If its a leaf recipe in terms of dependencies, I don't see any harm.

>
> - armin
>
>
> On 06/08/2015 06:56 AM, Alejandro Hernandez wrote:
>>
>> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
>> ---
>>   meta/recipes-devtools/python/python-nose_1.3.6.bb | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python-nose_1.3.6.bb
>>
>> diff --git a/meta/recipes-devtools/python/python-nose_1.3.6.bb
>> b/meta/recipes-devtools/python/python-nose_1.3.6.bb
>> new file mode 100644
>> index 0000000..d6e8fc1
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python-nose_1.3.6.bb
>> @@ -0,0 +1,16 @@
>> +DESCRIPTION = "nose extends the test loading and running features of
>> unittest, \
>> +making it easier to write, find and run tests."
>> +SECTION = "devel/python"
>> +LICENSE = "LGPLv2.1"
>> +LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
>> +
>> +SRC_URI =
>> "http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "0ca546d81ca8309080fc80cb389e7a16"
>> +SRC_URI[sha256sum] =
>> "f61e0909a743eed37b1207e38a8e7b4a2fe0a82185e36f2be252ef1b3f901758"
>> +
>> +S = "${WORKDIR}/nose-${PV}"
>> +
>> +inherit setuptools
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

