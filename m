Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id D60437891A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 11:09:09 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id r18-v6so6608845otk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 04:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2GTBP/7389n0x7/XYOde3SBz7aOKxEjmv34WBcanows=;
	b=RBTe4/ZOoAg7zFnZcwlglOd7LzcPnUjADX9XLUxz1qV70SE40c/zegepXvgTHUaNIr
	1GT6U4cdKMZmXe7XptncrmakncT9Kb/AsiZED/0LVGHKjJfaU/iLlrVsZtQql0g/T7tO
	MkCKz47DhAJF0mH02jYi8QJRPHIuJXLzsi4TDv6/75rXAgTtdyLKOHTYuvbgdVUmITlI
	s+9D+Jf2JCzjM7gP8vwbGN8UxqCNULKnvrQUN8yJsMpFQczOfS2+3JYyEu/Wkfw2Jo6h
	QRDXf0v204HMYRBnC9ZJGPT/u3caq0r5Uk9Hfji1FtCHE3tz9z4by/xVofyh9sQGHf7P
	ZL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2GTBP/7389n0x7/XYOde3SBz7aOKxEjmv34WBcanows=;
	b=JfKcE6eRiiJ4TxIQ8QzLanqQlj39v5p9j61uLuedfHUOFNM9ii4Lmzg/D9mY6iBQwv
	zz/2oMbzRBoYnRx+TnTUlUODELTaVTcd1Zofpn1O1QdWEAU/0ILab6QTa7YT+SsFnML5
	0NdzNSm87ekvRWt6N44eprfrSu/Y9ebHl0f/eNxsY7P57fpySjfB+/taf1PqgX7KGy63
	fSymu5kPaDjfqIMYOyhhec0IDlCuUdd8dxXRZhUAAdVnejBD+QoxGrqVXTn8XH3KnM2t
	YpmCcnEFG0U08sZ1H7B62duEccIElQhbBniGuilvWhmZIHUS950VxWPr26Aqy87fQjU7
	jfSA==
X-Gm-Message-State: APt69E1wk8hcH5mvIV7KL0n/IcQp5Ct1GDS7iGHGxSXWyFeNB+jh7jtc
	XQGVTev/7cfXz20NBdwySIAfANUGjfDMs5VBf/zA4Q==
X-Google-Smtp-Source: ADUXVKKO6qEr4LZeG6W6k8gKimu5u3yUhkSz0KlbVwCmLlb8Dp9dLhyrr4XZiUwOJWmyHuZpTFguZQ/D9dib9Rel0Uw=
X-Received: by 2002:a9d:50ad:: with SMTP id
	b45-v6mr995889oth.102.1528974550774; 
	Thu, 14 Jun 2018 04:09:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 04:09:10
	-0700 (PDT)
In-Reply-To: <05022c74-c917-09d1-32ca-951e52fa2612@windriver.com>
References: <cover.1528951773.git.Qi.Chen@windriver.com>
	<0273521858960b5e6bc63bd83284115dc97a566f.1528951773.git.Qi.Chen@windriver.com>
	<CANNYZj_Lj=bieGAFpzSU+U0TWKJyfiyL5r8OtgC+brYGVFn=fA@mail.gmail.com>
	<edf223f6-4bff-c460-1247-5289d9966157@windriver.com>
	<CANNYZj-tx3svh94xS8ZYoMKQqRV=+N2e_nv3Ag9_5A22WtvSzA@mail.gmail.com>
	<05022c74-c917-09d1-32ca-951e52fa2612@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Jun 2018 14:09:10 +0300
Message-ID: <CANNYZj8S67GmCvksnUZE__kMUWBB9Q=6sMVgQ5tvafCZnP4_xA@mail.gmail.com>
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
X-List-Received-Date: Thu, 14 Jun 2018 11:09:10 -0000
Content-Type: text/plain; charset="UTF-8"

Right, I see. Thanks for explaining, the patch is fine then.

Alex

2018-06-14 12:31 GMT+03:00 ChenQi <Qi.Chen@windriver.com>:
> Hi Alex,
>
> In short, it's about setUpClass.
> See details below.
>
> In fact, if rpm is not installed, these test cases have been skipped.
>
> See codes below from rpm.py:
>
>     @OETestID(960)
>     @OEHasPackage(['rpm'])
>     @OETestDepends(['ssh.SSHTest.test_ssh'])
>     def test_rpm_help(self):
>         status, output = self.target.run('rpm --help')
>         msg = 'status and output: %s and %s' % (status, output)
>         self.assertEqual(status, 0, msg=msg)
>
>     @OETestID(192)
>     @OETestDepends(['rpm.RpmBasicTest.test_rpm_help'])
>     def test_rpm_install(self):
>         status, output = self.target.run('rpm -ivh
> /tmp/base-passwd-doc.rpm')
>         msg = 'Failed to install base-passwd-doc package: %s' % output
>         self.assertEqual(status, 0, msg=msg)
>
> You can see that if 'rpm' is not installed on target, the test cases are
> skipped.
> The '@skipIfNotFeature' decorator you suggested will achieve the same effect
> that the above logic has already achieved.
>
> The key problem here is that the copying action happens in setUpClass().
> Even if the testcase is determined to be skipped via the decorator logic,
> this setUpClass function will still be called.
>
> For the current OEQA's runtime testing design, we need to ensure setUpClass
> do not generate 'error'.
>
> For the problem I described in this email, the simplest approach I see here
> is to change rpm-doc to base-passwd-doc.
> Another apporach is to check whether 'rpm' is installed in setUpClass()
> function and if not skip. But this is more complex and kind of weird as
> we've checked it via @HasPackage and the test cases dependencies are
> correct.
>
> You can do a quick test with the following configuration to reproduce the
> problem.
> local.conf:
> IMAGE_INSTALL_append = " openssh"
> TEST_IMAGE = "1"
> TEST_SUITES = "auto"
>
> bitbake core-image-minimal
>
> Best Regards,
> Chen Qi
>
>
>
> On 06/14/2018 04:55 PM, Alexander Kanavin wrote:
>>
>> Hello Chen,
>>
>> But the test still attempts to run rpm on the target. I can't
>> understand how target rpm can be available on the image, but at the
>> same time target rpm-doc package is not available in rpm deploy dir.
>>
>> The issue is probably that the test should simply be skipped (in the
>> same way that dnf testcases are skipped - please refer to them), if
>> there is no package management on target? Like this:
>>
>>      @skipIfNotFeature('package-management',
>>                        'Test requires package-management to be in
>> IMAGE_FEATURES')
>>
>>
>> Alex
>>
>> 2018-06-14 10:29 GMT+03:00 ChenQi <Qi.Chen@windriver.com>:
>>>
>>> On 06/14/2018 02:57 PM, Alexander Kanavin wrote:
>>>>
>>>> 2018-06-14 7:52 GMT+03:00 Chen Qi <Qi.Chen@windriver.com>:
>>>>>
>>>>> The test cases assume that rpm-doc is built out, as it says it its
>>>>> comment. This is not always true. And it sometimes results in
>>>>> following error.
>>>>>
>>>>>     |     cls.tc.target.copyTo(test_file, dst)
>>>>>     | UnboundLocalError: local variable 'test_file' referenced before
>>>>> assignment
>>>>
>>>> Wait, you need to explain this further. What is the situation when it
>>>> isn't true?
>>>>
>>>> Alex
>>>>
>>> Hi Alex,
>>>
>>> For any image that does not have rpm installed, rpm package is not likely
>>> to
>>> be built out.
>>> Having PACKAGE_CLASSES set to "package_rpm" will only ensure rpm-native
>>> to
>>> be built out.
>>>
>>> Best Regards,
>>> Chen Qi
>
>
>

