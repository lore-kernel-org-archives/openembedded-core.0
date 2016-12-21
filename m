Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id DCDE0773EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 14:20:08 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id g23so149751057wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7oSGeYj6yK8IF2XbNt2Gkx6WiPZv1cKDGyiXWe2j0y8=;
	b=1FYvVHdKx//3vO6Xx2YF3BBFKM09U9kOTjWou32K4scFjnwacYuwhimc0BIa8qIrfi
	QW8VQM/VhWDULoNMLcO6Gm3Ob/30g68lRJx/b3I3StAe+TV2LDTa2izVR+FpMrdkPWJX
	ORo7x3w9HqT5MD28spYXvf1JLKMvyfXPGE5rZ4u6Drn6dGaR5w/3FkGf7DlrrMm8n7G+
	AYwKlgTPkQBWtlRYuB1GFq2M3FujKBgNnEp9HkBiXFxzhLw6sH8+fyg5aNBhvaxbD6y4
	nxBS0GjVl55sbLfh5QFytojCyKJ666uzhSJvs2gKJScTEE3Lo1PpDvqtabsbWAzDUcHp
	lV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7oSGeYj6yK8IF2XbNt2Gkx6WiPZv1cKDGyiXWe2j0y8=;
	b=YwKqu3fRqa9Scd8i8X9QcddNoXChJFpuyl6gQUU43/vxp2jcgeAqZUWITmBjb/RFDo
	qcYjd/tZH/cTSZb0m5RPQL1fTvMkucB2hi9B3NVQYK+/ibywjWI0WocGvAF4EVtlrDKQ
	vegumkS+FxdBD9ZkkdE7Eubg/a/naaS29iY6KZrZ2VvyZBF+Zuzvjg6hsKbu4R+xXGN7
	vKg+AMtOd+wAuK6JinaIEol/3nEyffvNn6UO8+d7TvSTVzDZH3ZZH/3mwgqJEwicKmDI
	DLlpECfUA9p9JVSA7w9PvpOUpKSj0IByH9qXw7shnrYs73pu0tIvNPxt7YhgmreJbLsM
	XWAw==
X-Gm-Message-State: AIkVDXK1Qlf4YdAz2WJCQZIGSzGia+QxQ45XB3XBEcfXbek5/KHchxyviPEXiFmyU2sEO2fSRrHSthbIaETD+Q==
X-Received: by 10.28.66.7 with SMTP id p7mr5198349wma.64.1482330009499; Wed,
	21 Dec 2016 06:20:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.10.69 with HTTP; Wed, 21 Dec 2016 06:19:49 -0800 (PST)
In-Reply-To: <20161221130043.GA9628@linux.intel.com>
References: <20161213185317.GA6550@linux.intel.com>
	<cover.1482145354.git.maciej.borzecki@rndity.com>
	<20161220140412.GA16406@linux.intel.com>
	<CAD4b0_JGK0zGsNEOSN1T_w-jKMFRnnbzTxVdYkxE=+1cQu5nRw@mail.gmail.com>
	<20161221130043.GA9628@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Wed, 21 Dec 2016 15:19:49 +0100
Message-ID: <CAD4b0_+YOtJukqBN0QFZ9oVtip0i4m9sgKv5X_v=D=Ajq8XGaw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 0/5] wic: bugfixes & --fixed-size support, tests, oeqa: enhancements
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
X-List-Received-Date: Wed, 21 Dec 2016 14:20:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2016 at 2:00 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wr=
ote:
> On Tue, Dec 20, 2016 at 07:27:04PM +0100, Maciej Borz=C4=99cki wrote:
>> On Tue, Dec 20, 2016 at 3:04 PM, Ed Bartosh <ed.bartosh@linux.intel.com>=
 wrote:
>> > On Mon, Dec 19, 2016 at 12:20:56PM +0100, Maciej Borzecki wrote:
>> >> v6 of a patch series previously posted here [1].
>> >>
>> >> Changes since v5:
>> >>
>> >> * `oe-selftest: enforce en_US.UTF-8 locale` was merged to master, hen=
ce it's no
>> >>   longer part of this series
>> >>
>> >> * rebased on top of master (d0d260b0b85790ceb136dd6b0445e8e33d038f5e)
>> >>
>> >
>> > The patchset looks good to me. Thank you.
>> >
>> > Couple of questions:
>> > - did you test if Lars' change
>> >   https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Ddb08ffe=
e0ad1451f3bf710f4d1b623938ba9aefb
>> >   works with your patchset?
>>
>> Yes. The series was rebased on top of
>> d0d260b0b85790ceb136dd6b0445e8e33d038f5e, which includes Lars' patch.
>
> The series causes conflicts on the latest master. Can you check if it's
> really the case or it's just something wrong with my setup?

Just rebased on top current master d41d2fd and pushed to
https://github.com/bboozzoo/poky branch bboozzoo/wic-fixed-size-v7 in
case you want to test locally. I guess the conflict was with patch
aa1c50a `selftest/wic: extending test coverage for WIC script
options`, which has been reverted yesterday by RP.

Jair has posted a v2 yesterday and I expect it to be merged soon. So,
I think I'll just wait a couple of days (actually more like until the
beginning of January) before publishing a rebased version of my
series.

<snip>
>
>>
>> I've run it on beaglebone, vexpress-qemu, qemux86 and qemuarm. Agree
>> with your observation though. I think that at least these TCs could be
>> made machine agnostic:
>>
>> - test_build_artifacts
>> - test_build_image_name
>> - test_compress_*
>> - test_gpt_image
>> - test_wic_image_type
>> - test_wrong_compressor
>> - test_rootfs_*
>>
>>
>
> Yes, that's exactly my point. We should make generic tests work on any
> machine.
>
> Would you be willing to do this in a separate patchset together with
> your oe-selftest core fixes?
>
> I'd suggest to only include new testcase that works on qemu-x86* into
> this patchset. It will make it faster to get merged.
>

I would prefer to post these changes as a separate patchset. It looks
like there's already a couple of potentially conflicting patches
floating on the mailing list, so I would prefer to get --fixed-size
merged before starting another one.

Regards,
--=20
Maciej Borzecki
RnDity

