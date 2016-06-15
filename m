Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9A41C6FFEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 21:05:36 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id c73so35914847qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 14:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Isism6UCPA2RERjAlNNtHo3hLcaZ8Lw5MoIu9KB9ss8=;
	b=uUXOWUlmctFcEJx1e64N0Dt/znCaCVo/vUgDTlM5Uwi6bW4kYr/w97Sa1YDko4wDYm
	IqSRdKgs7MhMvD+Ww6662OLEhUMo2DHrDbAy1umQYNf+PtrETyLvvfsRBeNdRpHZNRLH
	pvL7Vwx3YA95OtvJf/HJ/bG0hZtx8oJY0vBffE0QIJRnl96LDXbwzpCDg8beRPyDrbIe
	6wnYs/L9iUn0Y9dcRIeOCVKRfr9yn76zoKDuDNEaJwYD1nKzuP/I2cz9XQmcVPeaJpNu
	KXiV0Xkc8JFtDXvjqO6bZIbg8fIKYihDT7KJ1++Va5xSXVUVlKcXYqiTHN77OlsFnQsZ
	/qRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Isism6UCPA2RERjAlNNtHo3hLcaZ8Lw5MoIu9KB9ss8=;
	b=SJeqdaq1H86OMTbRdZ5p11t4tQe6DKFsE5ZKU5t8Ox9sLqOOkfe2w52nShjl2B09Cc
	1j49goFI1IlLxF1HPkuFIJj+plfZgRyaOkOgnaNtdCII0YVm3JiuMNVCImMZTqJ37Qk8
	zzN4PRKNmYYun5IIB+xT2g0j9neeC/5nb1kQ02G5+dVoeiaddlHBJ5Pqj3T3NvhRlRl3
	8OCNqokaEWnGVcLZFFg7krJcHqqLMti76ZLF5YprEN0T6Qo81HWdoXrAT0Il0r/tpdaN
	OhHOoWOO4J4W2NXCGBVNXl5Pg96GsVLVqvM+a4Fe/YaRkZo8tZZFCCr7r1tDR0WeVymY
	bnYA==
X-Gm-Message-State: ALyK8tLF1nykWVOgzSo+Mljv14EKrvYW+ZeijGGkj25dVYaL2JVutAXZBvWKYwPzv5+IeQGtCfIxlVfMmorIMQ==
X-Received: by 10.233.239.18 with SMTP id d18mr892957qkg.41.1466024736858;
	Wed, 15 Jun 2016 14:05:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Wed, 15 Jun 2016 14:05:07 -0700 (PDT)
In-Reply-To: <5761C211.6050604@linux.intel.com>
References: <cover.1465824701.git.mariano.lopez@linux.intel.com>
	<4a96e992a3f5d117eb4b33513a2330e81ffd0b59.1465824701.git.mariano.lopez@linux.intel.com>
	<CAJTo0LbaK3civt08iMhoyxrFnWAF+d29Xv1njRCE_LKcAtMt_w@mail.gmail.com>
	<57608079.2020008@linux.intel.com>
	<CAMKF1sp583CejzXNPSVwHVB-fDXfDN_q-PbG=4bt+04m8HKg2g@mail.gmail.com>
	<5761C211.6050604@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Jun 2016 14:05:07 -0700
Message-ID: <CAMKF1soZoS9fBShVDOdQ31FMijXY4PJ-LAf1dCrXwO+MW5NXoA@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] selftest/runtime-test.py: Add test for import test from other layers
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
X-List-Received-Date: Wed, 15 Jun 2016 21:05:38 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 15, 2016 at 2:01 PM, Mariano Lopez
<mariano.lopez@linux.intel.com> wrote:
>
>
> On 06/15/2016 03:47 PM, Khem Raj wrote:
>>
>> On Tue, Jun 14, 2016 at 3:08 PM, Mariano Lopez
>> <mariano.lopez@linux.intel.com> wrote:
>>>
>>> If we're just running ping/ssh/selftest, can the image be something a lot
>>> smaller such as core-image-base?
>>>
>>> Ross
>>>
>>>
>>> Unfortunately, base or minimal don't have ssh installed, and ssh it is
>>> required for the runtime tests.
>>> I could add the ssh to DISTRO_FEATURES but personally I think that is not
>>> clean. What do you think?
>>
>> Can ssh be added to images automatically if testing is enabled ?
>
>
> IMO that is not a good practice, because the image being tested is polluted
> with packages not meant to be there.

I thought you mentioned that ssh is required for testing, I dont see
that as polluting.
and its only added to image with have ptest turned on.

>
> Mariano

