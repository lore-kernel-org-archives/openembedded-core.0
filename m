Return-Path: <rm.santos.caldas@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 11EDA7717D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 21:35:39 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id n129so102860380wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 14:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=GADoYesvjz21RTq3CLz5uuFUYNSsgXKdNInPfOZmsK8=;
	b=XbKVc15/NJNcITpiGlaOIoxJlcKJfxVfb0vMB4TO/9/dxAjzchv/hxnQHWjYb3PSyf
	Ep8Oii3OWxEP2kOk3vHZs5NQXh22E2IS0qUcRwdPoWaV38n417/wU+aicE9voRsmThiR
	YRHzI9Ttoe3lc/wE6x0pwGkc/d2h52vARF9Q0zkWKlcYLe74aQwrHluPCD8QwnScr4pN
	oyygXKSoY75EqvlfNJ/ABONdaQGlzegU0Hp+Hv7zfPWWaz86yo7ZHuGmSz1gnyFSo/VE
	T9jRGbCrKci3PlgwVbRba1kGQyQWh/eh2HRwDhRcCa+x4+sV58rEAER8zNFks2Xdsjh9
	05Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=GADoYesvjz21RTq3CLz5uuFUYNSsgXKdNInPfOZmsK8=;
	b=QFu2w3EeMnKkNS3LTKtw6y6di0UfqJnTd230AV34uetPALAGsb+Sl76C44Uvnd3UmJ
	nRgbaxAxo3Cl9Hnpke6eLC6S3SU13WYKmA1EWm1XO6WmPMf6SwZ4dXyyVdu/5iZSBmuh
	5+0CKDE/uQwp4RDQIdkFfdEd1r30ItsDUP3eVwCD3V7DTZRFCB8QTuldrubnz/YyWxMf
	AbpNGH53hpXNkE0rRsOXLdlBWUn7zZg6/aLEo9dd9ZQjx7JeWHIrT1NMStAmQEuyF65v
	4mnzW1+mCHz0N+vl2Ag/ly0fP86pPQKx9Zg3jbzFiXwEGqoOntCVZZuJeleaZwrVYibN
	4VHQ==
X-Gm-Message-State: ALyK8tJaD4rpCAxRchX7Fd5aGd4qKuIZpjsVk9Swuz0s4RocMTmTpJzLrwSIwhvujv328tIWKNCyd/gCdv4W2w==
MIME-Version: 1.0
X-Received: by 10.28.238.89 with SMTP id m86mr12173342wmh.4.1464644139323;
	Mon, 30 May 2016 14:35:39 -0700 (PDT)
Received: by 10.194.81.105 with HTTP; Mon, 30 May 2016 14:35:39 -0700 (PDT)
In-Reply-To: <574CADDB.1010108@linux.intel.com>
References: <20160528115341.4965-1-rm.santos.caldas@gmail.com>
	<574C9E8C.1070503@linux.intel.com>
	<CA+21M5A1CeV6ojWjLsLNcf3XgC_nUgwJtjV5B5NCF-0_Aj_4Qw@mail.gmail.com>
	<574CAB3D.9060706@linux.intel.com>
	<574CADDB.1010108@linux.intel.com>
Date: Mon, 30 May 2016 22:35:39 +0100
Message-ID: <CA+21M5BrhVXbHVe166i1ksdopJhjrCSF0iT4NYZvM-X-Y9oTNA@mail.gmail.com>
From: Renato Caldas <rm.santos.caldas@gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl: reorder tar arguments in do_install_ptest()
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
X-List-Received-Date: Mon, 30 May 2016 21:35:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2016-05-30 22:17 GMT+01:00 An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel=
.com>:
>
>
> On 05/30/2016 04:06 PM, An=C3=ADbal Lim=C3=B3n wrote:
>>
>>
>> On 05/30/2016 03:39 PM, Renato Caldas wrote:
>>> Hi An=C3=ADbal,
>>>
>>> Sorry but I'm still a bit unfamiliar with the yocto workflow, should I
>>> resubmit exact same patch with the [krogoth] prefix added, or should I
>>> change the commit message in any way? It applies cleanly to both
>>> master and krogoth.
>>
>> You need to send two patches one with [krogoth] prefix and another
>> without it for master.
>>
>> Also is a good practice to cc the maintainer of the release [krogoth]
>> release, since the 2.1 release was a little time ago i don't know who is
>> the current maintainer sorry.
>
> Reviewing this wiki [1] the maintainer for krogoth is Armin Kuster
> <akuster@mvista.com>.
>
> [1] https://wiki.yoctoproject.org/wiki/Releases

Thanks, will do so. And sorry for top-posting before, bad habits..

Cheers,
  Renato

>>
>> Cheers,
>>       alimon
>>
>>
>>>
>>> Cheers,
>>>   Renato
>>>
>>> 2016-05-30 21:11 GMT+01:00 An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.i=
ntel.com>:
>>>> Hi Renato,
>>>>
>>>> I tested the patch and works very well.
>>>> Could you sent another patch with [krogoth] prefix to be backported?
>>>>
>>>> Thanks a lot,
>>>>         alimon
>>>>
>>>>
>>>> On 05/28/2016 06:53 AM, Renato Caldas wrote:
>>>>> On some distributions tar requires the FILE argument to be the last, =
and
>>>>> the existing order was causing the subsequent --exclude options to be=
 dropped.
>>>>>
>>>>> Fixes [YOCTO #9673].
>>>>>
>>>>> Signed-off-by: Renato Caldas <rm.santos.caldas@gmail.com>
>>>> Acked-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>>>>> ---
>>>>>  meta/recipes-devtools/perl/perl-ptest.inc | 4 ++--
>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes=
-devtools/perl/perl-ptest.inc
>>>>> index 948ea7c..66c5355 100644
>>>>> --- a/meta/recipes-devtools/perl/perl-ptest.inc
>>>>> +++ b/meta/recipes-devtools/perl/perl-ptest.inc
>>>>> @@ -7,8 +7,8 @@ do_install_ptest () {
>>>>>       mkdir -p ${D}${PTEST_PATH}
>>>>>       sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
>>>>>       sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
>>>>> -     tar -cf - * --exclude \*.o --exclude libperl.so --exclude Makef=
ile --exclude makefile --exclude hostperl \
>>>>> -             --exclude miniperl --exclude generate_uudmap --exclude =
patches | ( cd ${D}${PTEST_PATH} && tar -xf - )
>>>>> +     tar -cf - --exclude \*.o --exclude libperl.so --exclude Makefil=
e --exclude makefile --exclude hostperl \
>>>>> +             --exclude miniperl --exclude generate_uudmap --exclude =
patches * | ( cd ${D}${PTEST_PATH} && tar -xf - )
>>>>>
>>>>>       sed -i -e "s,${D},,g" \
>>>>>              -e "s,--sysroot=3D${STAGING_DIR_HOST},,g" \
>>>>>
>>>>
>>
>>
>>
>

