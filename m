Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 884386E666
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 15:02:23 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t79so29697246wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 07:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZP1gkP1rROCO9e5TUcA+8waEWyIwEUjUMHK9ALb/o5E=;
	b=08bcN/f1DEvKbuvkWKRVB6gFtg3xAVIcn92pXbVOngAYFQqIBBfdHma9M+d0Nib/ek
	6UKroE8e0UALySXumCjAM9baVDdxFPReBXUeFitHgIPtDpCaFFCcqZ7rvynGrfPGk5eB
	Bx1EPXRM1kh4GJQbf2cGbINLqhcDYgRrG2d/e0lGlnycBY+ZFncq4EgZdgRycMAPzOH8
	aiKEwN381o8oIctrrWX02+QqkSt04s3HXZ7zlLv5g7Z4UKqaHTw2VEZJqY8L8/PhOam5
	jkU2S76CObO/+vh7eB+kBSyBa0oCXgl+PbAMfIgmiFd8h2463PBJTTPyQR2kwLwJWDVA
	0rOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZP1gkP1rROCO9e5TUcA+8waEWyIwEUjUMHK9ALb/o5E=;
	b=QQrQx7qRYBbll1ZBJ8TUJ24vhOZLhcww31fBzBotnD6bEEPcFaAFVbjU20GE8zRQ25
	6GTarwQcjBKeYH9lMj1WLxZ1cLqgmRwAXyQcLGTz7+ZwaPnRFDFKkrGXbS4d0VqC1Vbp
	P6BfBZmv/p52vGV/EAvUERRrZhLuOwisnw7nvflLb6DcXMGBjZc95U1jEp0ffRc2oNPn
	jYYiedbV341y5GHe9XhZYGNJsVoC6TTUxZWFcaqxl05+xauXVy1uTXKJ2/UzY89icdSU
	jfWhu0F0njQ47LUjJV0OUqNo0NMdHXqrL6JTdhBQ1crknb+u+FUj7PeOCa7sDnvjlXHS
	kp4A==
X-Gm-Message-State: AKaTC01QxjzL5hywL/y+Wby4teO/Ur2WW7d9HFOrTbjsgdILk1i2ekeJ1JPbgvbUQsPP1rRvOXxh1Lzx7Tx/5Q==
X-Received: by 10.28.104.213 with SMTP id d204mr2688378wmc.101.1479826944251; 
	Tue, 22 Nov 2016 07:02:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Tue, 22 Nov 2016 07:02:03 -0800 (PST)
In-Reply-To: <CAJTo0LaJZkpg_z6uSz3oMAH-bE7x6-hth94okNG+2GzsGy913w@mail.gmail.com>
References: <cover.1479203195.git.maciej.borzecki@rndity.com>
	<eb38d44adc6f103f898ee7a8859d7ef046df4402.1479203195.git.maciej.borzecki@rndity.com>
	<CAJTo0LaJZkpg_z6uSz3oMAH-bE7x6-hth94okNG+2GzsGy913w@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 22 Nov 2016 16:02:03 +0100
Message-ID: <CAD4b0_JOLmdGF+ufTkn2V_ANiLUkxZHzWqvACT4ptUEtKGZUnQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 09/11] wic: selftest: add tests for --fixed-size partition flags
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
X-List-Received-Date: Tue, 22 Nov 2016 15:02:23 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 22, 2016 at 3:47 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 15 November 2016 at 09:52, Maciej Borzecki <maciej.borzecki@rndity.com>
> wrote:
>>
>> wic has a new flag for setting a fixed parition size --fixed-size. Add
>> tests that verify if partition is indeed sized properly and that errors
>> are signaled when there is not enough space to fit partition data.
>
>
> Just failed on the AB:
>
> FAIL: test_fixed_size (oeqa.selftest.wic.Wic)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/wic.py",
> line 418, in test_fixed_size
>     self.assertEqual(0, res.status)
> AssertionError: 0 != 127
>
> Might be useful to print res.output in the failure. :)
>

A bit weird. The test failed on this:

        # verify partition size with wic
        res = runCmd("parted -m %s unit mib p 2>/dev/null" % wicimg,
ignore_status=True)
        self.assertEqual(0, res.status)

So the image is there. It was listed by glob(), which is a directly
before runing parted. Also wic has built it (because the test would have
failed even earlier). However, when parted gets there, it either fails
to understand `unit mib p` (unlikely), or the disk image is just not
there anymore.

Is there a chance these tests are run in parallel?

-- 
Maciej Borzecki
RnDity

