Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 39DEC755A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 08:55:06 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id p95-v6so6199309ota.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6slyFU5dJyNP1QCTtufB1QRARVfzHm4ZUY9oaniZSpk=;
	b=Euh7HI6Me5syhWWMDfG6jxVy6VZI8NsovoRP8uoiy+Bx0xQ4lzu+qDGrTvz9OcWrj9
	j83KUzGEd5WXRnkf5hQrlqmXwSV58zqHwNLDScDSUlNGRuo3Tvy61mcgGxyNVoJCfqjG
	o5ZtLEUCjakqPykFpPO3x4qSsASv34y3Rxf8fy5w4SqEzoEfKWOSZ2bzkuvzZYuhC9wU
	ACftHVMywJoYtdd8IEFT+BqejMwOhAImirXX3VVEz2uNNxxVCBFPf+8ZnAyiJDRYDhf4
	JhqSxdToXV32aLrsQgfketdmUx79x+4I9JNs9GyifL67HAfiKukG7XFHjTGpWLuNuHzM
	YvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6slyFU5dJyNP1QCTtufB1QRARVfzHm4ZUY9oaniZSpk=;
	b=bgd1gpA28mfrn9juoZDOArlHNtDnASyssPmvFWVHg/3fh1Dyveo9bwE6mETFsnVogc
	mW1ufXewkf4FIjtGEIPteksu7z63nxhQHJ++sJLwAKnBzvemppLUPpQNfCigpDL8lj9P
	77BRet/3TR8oCRh3hNl+D0MvmnBF4Z2vj87cN5KqDRc9WosmXS8q3HXQ/EaZW1gVKGbd
	4FR6EiFgyox72p8PyKOadQFwonrpQ+slhihxnaSqTrihNNR5iA/DCbhe//gY090ITmmS
	bBLWuYfm5Ihkq5z7C7vKRPxJ4EksSNvVSM2b02eFBpfawvOinnOvttWghlrKH1tQ4rVy
	/Q9A==
X-Gm-Message-State: APt69E3BJyPioWEJ7oaYFY8F1+/AgRaUrh+cA+p8KgeSNaFIHLXBEOia
	733rRDHHEJH0z3u0vzb0BJhFeFLfMR3ea5p/7gA=
X-Google-Smtp-Source: ADUXVKKDMp+QrRTb6r/r508T7MfDNiW53IG2VCElWWP5/FU/4KSdVDIq1u2S7zawCL/KGTt7Fvudl/HcdcY+LV4vP+U=
X-Received: by 2002:a9d:50ad:: with SMTP id
	b45-v6mr787565oth.102.1528966507235; 
	Thu, 14 Jun 2018 01:55:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 01:55:06
	-0700 (PDT)
In-Reply-To: <edf223f6-4bff-c460-1247-5289d9966157@windriver.com>
References: <cover.1528951773.git.Qi.Chen@windriver.com>
	<0273521858960b5e6bc63bd83284115dc97a566f.1528951773.git.Qi.Chen@windriver.com>
	<CANNYZj_Lj=bieGAFpzSU+U0TWKJyfiyL5r8OtgC+brYGVFn=fA@mail.gmail.com>
	<edf223f6-4bff-c460-1247-5289d9966157@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Jun 2018 11:55:06 +0300
Message-ID: <CANNYZj-tx3svh94xS8ZYoMKQqRV=+N2e_nv3Ag9_5A22WtvSzA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oeqa/runtime/cases/rpm.py: change to use base-passwd-doc
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
X-List-Received-Date: Thu, 14 Jun 2018 08:55:06 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Chen,

But the test still attempts to run rpm on the target. I can't
understand how target rpm can be available on the image, but at the
same time target rpm-doc package is not available in rpm deploy dir.

The issue is probably that the test should simply be skipped (in the
same way that dnf testcases are skipped - please refer to them), if
there is no package management on target? Like this:

    @skipIfNotFeature('package-management',
                      'Test requires package-management to be in
IMAGE_FEATURES')


Alex

2018-06-14 10:29 GMT+03:00 ChenQi <Qi.Chen@windriver.com>:
> On 06/14/2018 02:57 PM, Alexander Kanavin wrote:
>>
>> 2018-06-14 7:52 GMT+03:00 Chen Qi <Qi.Chen@windriver.com>:
>>>
>>> The test cases assume that rpm-doc is built out, as it says it its
>>> comment. This is not always true. And it sometimes results in
>>> following error.
>>>
>>>    |     cls.tc.target.copyTo(test_file, dst)
>>>    | UnboundLocalError: local variable 'test_file' referenced before
>>> assignment
>>
>> Wait, you need to explain this further. What is the situation when it
>> isn't true?
>>
>> Alex
>>
>
> Hi Alex,
>
> For any image that does not have rpm installed, rpm package is not likely to
> be built out.
> Having PACKAGE_CLASSES set to "package_rpm" will only ensure rpm-native to
> be built out.
>
> Best Regards,
> Chen Qi

