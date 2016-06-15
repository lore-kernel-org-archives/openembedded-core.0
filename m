Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0314D6FFAB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 20:47:29 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id p10so35496268qke.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 13:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5orPxNPBLj6heOsMzKPGpCoGnv9JxhBzceiC63Ko+bg=;
	b=Pb2qKl3SPhUxBNOHpSEzHtqanh8ZvvRKHAfho1dOb/fcg35bewfoxJZwYcAfLvKNgU
	M7DCrtqolerkhKDjxpd325z0wS2t6uGRL+6BmxG/yiZlMAGSaTFo65Nig8tITBuq5Yva
	OICXHTytMY+3ysGjXWQAB9NOUwrzBemTob9UAwS5BMYPEJ037OXwIWbu1bCc4Jh1NDyG
	iZOIuAhbqUhq5M/uW7QX67+a13pUY1cgLqgBwhUjdG6oXmw/Rtn9Ea+000Cpm4BPlRDr
	URBPBhw4IKOL+Ys0+5SXOJEwoPd1X9JwPt/ou9Bpbbhvh77VXJK2dDHVHncnfKT3WsZN
	LpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5orPxNPBLj6heOsMzKPGpCoGnv9JxhBzceiC63Ko+bg=;
	b=TXf25z73qIYBphtzUWxKZhncyWBWJgPI3joG8/x97lP0Jqpnq/QAu8LTRa0IFMm3QW
	JG+0R9QH4tbTxpj4MHje3/7EvtS4B7DWrPUxJVyvmsfUtjS1Vdr+RBbiXYbbnNvq5TAC
	rm59C7nwH/ry7g6r2D7iWh83DMiexuQOxDKhMUN3noCCVcS4rsG+50p9vntVrJ2e/ZpE
	ffllu4irxstALsLo7XfzGi9N4l+CtTUHWg5CuVTzQZMStCIBhsYIYCa79bnpdrE0XpPJ
	Gyxyb1E3y2yFVLfWDnK5FfHAxFTPkppGUulkQSGx49xgb/OteGfw1a2RAcRl4s7YPJMs
	Jx6A==
X-Gm-Message-State: ALyK8tKmDeTG4svAjd9j+wYE2Gd0LfiTh9AOvq94RGSJXJb9BP/sT11io6/4dlkElCpzsWlorZ0jTHv2pVG3RQ==
X-Received: by 10.200.50.77 with SMTP id y13mr782264qta.5.1466023650146; Wed,
	15 Jun 2016 13:47:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Wed, 15 Jun 2016 13:47:00 -0700 (PDT)
In-Reply-To: <57608079.2020008@linux.intel.com>
References: <cover.1465824701.git.mariano.lopez@linux.intel.com>
	<4a96e992a3f5d117eb4b33513a2330e81ffd0b59.1465824701.git.mariano.lopez@linux.intel.com>
	<CAJTo0LbaK3civt08iMhoyxrFnWAF+d29Xv1njRCE_LKcAtMt_w@mail.gmail.com>
	<57608079.2020008@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Jun 2016 13:47:00 -0700
Message-ID: <CAMKF1sp583CejzXNPSVwHVB-fDXfDN_q-PbG=4bt+04m8HKg2g@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 Jun 2016 20:47:32 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 14, 2016 at 3:08 PM, Mariano Lopez
<mariano.lopez@linux.intel.com> wrote:
>
>
> On 06/14/2016 04:26 AM, Burton, Ross wrote:
>
>
> On 13 June 2016 at 14:32, <mariano.lopez@linux.intel.com> wrote:
>>
>> +        features = 'INHERIT += "testexport"\n'
>> +        features = 'TEST_SUITES = "ping ssh selftest"\n'
>> +
>> +        # Build core-image-sato and testimage
>> +        bitbake('core-image-sato socat')
>> +        bitbake('-c testimage core-image-sato')
>
>
> If we're just running ping/ssh/selftest, can the image be something a lot
> smaller such as core-image-base?
>
> Ross
>
>
> Unfortunately, base or minimal don't have ssh installed, and ssh it is
> required for the runtime tests.
> I could add the ssh to DISTRO_FEATURES but personally I think that is not
> clean. What do you think?

Can ssh be added to images automatically if testing is enabled ?

>
> Mariano
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

