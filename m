Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E4B3360111
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 13:49:56 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id a197so308299585wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 05:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8hA5wA7mEL+WTDW2jYUCO849F9J9ofasphXkWzATrGQ=;
	b=BDaINsms7LSvehGKlHtmqlM7TootE8gulmt+I9STSTPxV+AaJ0SxUayW77UQXHtwKU
	h3xoFegBfGKz36DRWp2+3BR1c3UHZ1Pz4MRLPE2xEpMte1KuhWbU88I7a+p2YoQW0J+n
	aaHmZJH39hXZLY5fqL+RJrbIswiFgsm7VW3WK81UM7qUwrH15T6OoRgMV8Q1LAS46aHH
	lGblT0IhEpvzrODnV/Jfh1vO/lsknp1wxCAKs+WjsxAaEo025MQE81cWoEVaV8EFtaxW
	53T7lH5L6L3d/d/GbUyfb8q+hGQYcj9f7iqYrAZf4wNh2LtBR7fUb77XX4tl4fT+9zTr
	9Kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8hA5wA7mEL+WTDW2jYUCO849F9J9ofasphXkWzATrGQ=;
	b=FGzQDJAuWzjZHAVRz/hI0uvNO32VV+vYieRPfi6Nky+no7JGJOZSr5b0/S0BtCRgol
	aYDuoS7s9Tnv0zMfede1g1UaNEX4MnZhOOHx032mgM82Max6USEqYIlwbsjy7C1Fiwnj
	gJzaEuIKSpxVlrOH8yuV8soWnPppI2mLP4jX3/GORddqsO/aZ1eAfqxR5WAOgeHeYnHB
	mGUIfLD+m7OB/TI+EfTlfgdVOjX/BUHPb0x5OYEuYyd+eC7wl885Z2aXD07Yjc+mw/Ov
	rdofi24Ax2SOl3mO2ueWzSGXn0d4uJkNMguzjgPk9mwuCwrivBJE5fAewQ5e93Uq4Pau
	fDNQ==
X-Gm-Message-State: ABUngve7vQn73DE/cZqUumVkjk68gQMkbAl1GPRcykK5JXZjznUodU+leuwfYZRA3eT9FKy3j03V6Pas2fmUWQ==
X-Received: by 10.194.231.8 with SMTP id tc8mr12497147wjc.193.1478699396982;
	Wed, 09 Nov 2016 05:49:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.5.141 with HTTP; Wed, 9 Nov 2016 05:49:36 -0800 (PST)
In-Reply-To: <CAJTo0LaARkjM1C1D=k_NdoCRy5ivQdnbT+C_X-7WnnpnuQN0Ew@mail.gmail.com>
References: <cover.1478619682.git.maciej.borzecki@rndity.com>
	<CAJTo0LaARkjM1C1D=k_NdoCRy5ivQdnbT+C_X-7WnnpnuQN0Ew@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Wed, 9 Nov 2016 14:49:36 +0100
Message-ID: <CAD4b0_+eXk3va3Z8NVBniCkt-Ah1M08m7sg1O-BobjPY4ZHkKw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] wic: bugfixes & --fixed-size support
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
X-List-Received-Date: Wed, 09 Nov 2016 13:49:58 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 9, 2016 at 2:17 PM, Burton, Ross <ross.burton@intel.com> wrote:
> I pulled this series into a test run on the autobuilder and it is throwing
> quite a lot of exceptions, such as:
>
> Traceback (most recent call last):
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/wic",
> line 319, in <module>
>     sys.exit(main(sys.argv[1:]))
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/wic",
> line 314, in main
>     return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage,
> subcommands)
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/lib/wic/help.py",
> line 95, in invoke_subcommand
>     subcommands.get(args[0], subcommand_error)[0](args[1:], usage)
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/wic",
> line 247, in wic_create_subcommand
>     options.compressor, options.bmap, options.debug)
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/lib/wic/engine.py",
> line 195, in wic_create
>     crobj.main(cmdline)
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/lib/wic/creator.py",
> line 125, in main
>     return self._subcmds[pname](options, *args[1:])
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/lib/wic/plugins/imager/direct_plugin.py",
> line 93, in do_create
>     creator.create()
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/lib/wic/imager/baseimager.py",
> line 159, in create
>     self._create()
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/lib/wic/imager/direct.py",
> line 305, in _create
>     system_id=part.system_id)
>   File
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64-lsb/build/scripts/lib/wic/utils/partitionedfs.py",
> line 101, in add_partition
>     size = size * 1024 // self.sector_size
> TypeError: unsupported operand type(s) for //: 'str' and 'int'
> WARNING:
> TOPDIR/tmp/work/genericx86_64-poky-linux/core-image-lsb/1.0-r0/temp/run.do_image_wic.15783:1
> exit 1 from 'BUILDDIR="TOPDIR" wic create "$wks" --vars
> "TOPDIR/tmp/sysroots/genericx86-64/imgdata/" -e "core-image-lsb" -o "$out/"'
>
> See
> http://errors.yoctoproject.org/Errors/Latest/Autobuilder/?filter=a44a6a635c9ed02edb2a3dee0a13b0067becc425&type=commit
> for more examples and context.

Thanks. I see now that bootimg-efi and rawcopy plugins do not convert partition
size to int as they should be.


>
> Ross
>
> On 8 November 2016 at 15:56, Maciej Borzecki <maciej.borzecki@rndity.com>
> wrote:
>>
>> The patch series is a follow-up after a previous attempt of adding
>> --reserved-size option to wic[1].
>>
>> The series introduces a number of fixes in patches 1 - 4.
>>
>> The last patch in the series introduces --fixed-size option as discussed
>> in [1].
>> The patch also introduces minor refactoring to code responsible for
>> computing
>> partition size.
>>
>> Aside from new option, another user-visible change is how the size rootfs
>> partitions with vfat is calculated. In previous code, vfat rootfs
>> partition size
>> did not account for --extra-space nor --overhead-factor. Now, all rootfs
>> partitions (except for squashfs) are subject to the same rules of
>> partition
>> sizing.
>>
>>
>> http://lists.openembedded.org/pipermail/openembedded-core/2016-October/127634.html
>>
>> Maciej Borzecki (5):
>>   wic: make sure that partition size is always an integer in internal
>>     processing
>>   wic: use partition size when creating empty partition files
>>   wic: check that filesystem is specified for a rootfs partition
>>   wic: fix function comment typos
>>   wic: add --fixed-size wks option
>>
>>  scripts/lib/wic/help.py                | 14 +++--
>>  scripts/lib/wic/imager/direct.py       |  2 +-
>>  scripts/lib/wic/ksparser.py            | 41 +++++++++++++--
>>  scripts/lib/wic/partition.py           | 93
>> +++++++++++++++++++++-------------
>>  scripts/lib/wic/utils/partitionedfs.py |  6 +--
>>  5 files changed, 109 insertions(+), 47 deletions(-)
>>
>> --
>> 2.5.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>



-- 
Maciej Borzecki
RnDity

