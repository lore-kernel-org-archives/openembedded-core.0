Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6042071979
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 10:03:06 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id g23so88079671wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 02:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lgRwDKTiKAqv562FDYS6BnQBYomlhtBYf8wNqMxWtDM=;
	b=NrDPxJdVfO4kYPZQ0vudXnTn71kvr0Zhdf6EiAHr+EPgEmFtjCJSyNOGONlIxgmfvt
	FIXwtScXZ60A28m9qwPedeUYOCZZ753zqUEPGrdyzzLaemGlpF0csXBCrgVFXF9sceIH
	9TwZ1VhClxZJYF5Xsac2z7EHlsFIaE2XTuRA7F4t76Au3OWo7l49NNgOnRUubiqy67DW
	amVbzM3OyApCtmYYC3+l16gnZ9IVl+OcLzeGJBD+fsyowi2pUpzk2yfmejAQYCQNd5C6
	cbU2ijcweryFpvInmLaN/E4okrJFFMhcIH9AzUGZheujZGcaVWXSa2X5zmEnWM4/JYIE
	CiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lgRwDKTiKAqv562FDYS6BnQBYomlhtBYf8wNqMxWtDM=;
	b=Us7Ph/JbP7KlGR7bSItW2QtSn8Bjf68phzJvTJ9qk/Fi82PX1P8E6c92EPmZ5YuLvl
	fq1eUkfvLrcPj0IDe9LUA9jn4dBTsuIkYn3oi9dupzfduMCFtcNFRPcSpxIrMQXkPNhg
	RxauB1BiSKZVwdcXI4HkQ8uny5QGkLU4xzg/ekRtJppFYW9ub4ENOGDQteIyROD+rtZa
	HL5ptnccFuYkEqnMufGbcZ9Zv4/7WX8QC4jIhj+J40OMkaKj/u5qK4672GpJKySCgF0f
	Ob5u9Bj5q7Vv8lqeKg88uQNfZtvD3ro6G46pA1ljpWKlA2D6+F4iPiUqJHhjbHDO3rbo
	VL+w==
X-Gm-Message-State: ABUngveJZK4HRsj2SYF1BbnYIjGAYh5mc5/dqlU7HaDAiFG04B/6mFUmTa61TssuLKGEjHoud6BzVT7Tk2/ZBw==
X-Received: by 10.28.66.7 with SMTP id p7mr10019659wma.64.1479117787192; Mon,
	14 Nov 2016 02:03:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Mon, 14 Nov 2016 02:02:46 -0800 (PST)
In-Reply-To: <CAJTo0LZiXenXy8WC28z+5a4+ibJekaqeD+0_O84aejyi9XNH4w@mail.gmail.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
	<CAJTo0LZiXenXy8WC28z+5a4+ibJekaqeD+0_O84aejyi9XNH4w@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Mon, 14 Nov 2016 11:02:46 +0100
Message-ID: <CAD4b0_J6hKetcbiXvUS3wAeo19QSGF=5DCFZnLK-0Lz904-6DA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 00/10] wic: bugfixes & --fixed-size support, tests, selftest: minor fixes
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
X-List-Received-Date: Mon, 14 Nov 2016 10:03:08 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 14, 2016 at 10:24 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 10 November 2016 at 12:18, Maciej Borzecki <maciej.borzecki@rndity.com>
> wrote:
>>
>> v2 of patch series previously posted here [1].
>>
>> The series introduces anumber of fixes to wic, as well as a new
>> --fixed-size
>> option applicable to `part` entries in kickstart files. The option makes
>> it
>> possible to have a fixed size partition, with additional verification that
>> the
>> file system image fits into the allocated disk space. This is in cotrast
>> with
>> --size option, which the minimum size, and partition may in fact be larger
>> in
>> the final disk image.
>>
>> The series introduces two tests that verify if wic has created the image
>> with
>> properly sized partition and that partition size checks work as expected.
>>
>> Patch `oe-selftest: fix handling of test cases without ID in
>> --list-tests-by` is
>> a small bugfix for oe-selftes tool which resolves an issue triggered by
>> Python
>> 3.x being more strict than 2.x.
>
>
> This series appears to be causing selftest to fail on the autobuilders:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/732/steps/Running%20oe-selftest/logs/stdio

I see that the builds were running with qemux85-64 MACHINE, shouldn't
TARGET_ARCH be set to x86-64 then? There's a check that builds
syslinux(-native) for x86 archs only since it's not buildable for
anything else. Same for HDDIMG.

One more question, the assert raised when comparing parted's output is
caused by different locale. Do you think it would be ok to just enforce
LC_ALL=C when running commands under wic?

-- 
Maciej Borzecki
RnDity

