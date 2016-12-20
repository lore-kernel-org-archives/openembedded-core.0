Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7B671A8D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 18:27:23 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id t79so138168632wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 10:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i8Tr+g3i1grNRGb9D15zAMKTG9X4sHLGL1mB/jLAau0=;
	b=iQaHzn/Fvg1VAgjm/qbuQw2X7pOreggmStBv3nXCAAL/VHjWtc3I3QDoYyieup+c6k
	+Od4WFQRriRhmg10ZxiveH8SlgByIx89IUfvcBxTjdCKsvsVIKW/tGu5uIH4nO7p/zAm
	g7jtH1YE4CtdO2uKXnIHO77kXpumyUql1RiSwu/7qKe7v47vg5nBKEBHyPNrTyI6Cijd
	n5KkR2YRDreJfj7wB7szhOZmnb5slAtZPzFOzPAfZZVL94Aqba3yVc17Ob1f2/5rUSGJ
	RH5czjK8eK4MyyRnvXMtVQfImnkVeaGYpCoqGRO98LT1BbqepCu75mVLiS0n5YINfzpI
	lzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i8Tr+g3i1grNRGb9D15zAMKTG9X4sHLGL1mB/jLAau0=;
	b=BewDFfCQoIRnY6TKwy7lYKqx+4vEd421grmfYOdDCDVe63uwyrTlfe3rW9IY7xtRx1
	HDEaUxm1A5Rzp2rUCoefhSrIaOc+6qYFU3c1xp756Q0vqopxfYm3HlMilYez9K7YlhXN
	4D9xDR8YneX3lwhOTD1/X50gLtglQilyFno04yyrKCcVCXWbg/nmjTg5sv0IMSm/Z8Ne
	qsrXdE+IZHaERn+gWBRUqT3wmR75kA3BbvBrv1qlS97LBrDMihHKpAbpvCTuEM44DRhP
	Oxr6npX8T6D60GNtaGEn2y26lIpxLviTywQTXT4d0+knWmRPYjKyGq5zoHs+kofsLpX+
	VxKA==
X-Gm-Message-State: AIkVDXLG0K3Q3NqfJEV6bov6m3Zopsn4l0uCabhdZYsh5tUbO6p2+JRyARd7HsCBQ4RohX2rnheadXYLnG2B3g==
X-Received: by 10.28.8.202 with SMTP id 193mr1077439wmi.101.1482258444532;
	Tue, 20 Dec 2016 10:27:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.10.69 with HTTP; Tue, 20 Dec 2016 10:27:04 -0800 (PST)
In-Reply-To: <20161220140412.GA16406@linux.intel.com>
References: <20161213185317.GA6550@linux.intel.com>
	<cover.1482145354.git.maciej.borzecki@rndity.com>
	<20161220140412.GA16406@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 20 Dec 2016 19:27:04 +0100
Message-ID: <CAD4b0_JGK0zGsNEOSN1T_w-jKMFRnnbzTxVdYkxE=+1cQu5nRw@mail.gmail.com>
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
X-List-Received-Date: Tue, 20 Dec 2016 18:27:28 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 20, 2016 at 3:04 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Mon, Dec 19, 2016 at 12:20:56PM +0100, Maciej Borzecki wrote:
>> v6 of a patch series previously posted here [1].
>>
>> Changes since v5:
>>
>> * `oe-selftest: enforce en_US.UTF-8 locale` was merged to master, hence it's no
>>   longer part of this series
>>
>> * rebased on top of master (d0d260b0b85790ceb136dd6b0445e8e33d038f5e)
>>
>
> The patchset looks good to me. Thank you.
>
> Couple of questions:
> - did you test if Lars' change
>   https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=db08ffee0ad1451f3bf710f4d1b623938ba9aefb
>   works with your patchset?

Yes. The series was rebased on top of
d0d260b0b85790ceb136dd6b0445e8e33d038f5e, which includes Lars' patch.
The tests passed on all MACHINES I've used (though I'm not sure if
scenario addressed in that patch is covered by relevant test cases).

I believe I have also hit a weird bug in BitbakeVars._parse_line() while
testing with this patch and meta-mender. I Hope you can confirm it.

From a quick investigation I have determined that _parse_line() may
interpret arbitrary lines that are of 'key=value' format as legitimate
bitbake variables. In my case, IMAGE_CMD_sdimg defined in
mender-sdimg.bbclass includes the following piece:

    IMAGE_CMD_sdimg() {
        ...
        REMAINING_SIZE=$(expr ${MENDER_STORAGE_TOTAL_SIZE_MB} - \
        ${MENDER_BOOT_PART_SIZE_MB} - \
        ${MENDER_DATA_PART_SIZE_MB} - \
        ${MENDER_PARTITIONING_OVERHEAD_MB} - \
        $boot_env_size_mb)
        ROOTFS_SIZE=$(expr $REMAINING_SIZE / 2)
        ...
    }

This will obviously be seen in `bitbake -e output`. Looking at code
here:
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/scripts/lib/wic/utils/oe/misc.py?id=db08ffee0ad1451f3bf710f4d1b623938ba9aefb#n151
the line will be split at '=', then whitespace will be stripped from
both key and value. So a line (taken from bitbake -e):

    ROOTFS_SIZE=\$(expr \$REMAINING_SIZE / 2)

Will define a variable ROOTFS_SIZE with value '\\$(expr \\$REMAINING_SIZE / 2)'.

It's a pure coincidence that Lars' patch queries ROOTFS_SIZE which also
appears in bitbake -e output under exactly the same name.

IMO, when parsing env output, we should expect variable name to start
right at the beginning of a line, IOW skip the line if key[0].isspace() == True

>
> - Regarding oe-selftest fixes, wich machine did you run oe-selftest on?
>   It looks to me that a lot of test cases can be run on your machine
>   if we use another wks.

I've run it on beaglebone, vexpress-qemu, qemux86 and qemuarm. Agree
with your observation though. I think that at least these TCs could be
made machine agnostic:

- test_build_artifacts
- test_build_image_name
- test_compress_*
- test_gpt_image
- test_wic_image_type
- test_wrong_compressor
- test_rootfs_*



>
>> [1]. http://lists.openembedded.org/pipermail/openembedded-core/2016-November/129187.html
>>
>> Maciej Borzecki (5):
>>   oeqa/utils/commands.py: allow use of binaries from native sysroot
>>   wic: add --fixed-size wks option
>>   wic: selftest: avoid COMPATIBLE_HOST issues
>>   wic: selftest: do not assume bzImage kernel image
>>   wic: selftest: add tests for --fixed-size partition flags
>>
>>  meta/lib/oeqa/selftest/wic.py          | 117 +++++++++++++++++++++++++++++++--
>>  meta/lib/oeqa/utils/commands.py        |   9 ++-
>>  scripts/lib/wic/help.py                |  14 +++-
>>  scripts/lib/wic/imager/direct.py       |   2 +-
>>  scripts/lib/wic/ksparser.py            |  41 ++++++++++--
>>  scripts/lib/wic/partition.py           |  88 +++++++++++++++----------
>>  scripts/lib/wic/utils/partitionedfs.py |   2 +-
>>  7 files changed, 224 insertions(+), 49 deletions(-)
>

Regards,
-- 
Maciej Borzecki
RnDity

