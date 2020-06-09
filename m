Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web12.7106.1591709213344645176
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 06:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L6/c/Sb2;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id b5so20289957iln.5
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 06:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=UKidboM54rhEPBju3KpDAzMAOpzVB3XnT0GH9f41jrA=;
        b=L6/c/Sb2lOafeXoUUv1vAKAJsoHCyrQzpfVwI7zayWMNc4gXWyA3eohJnMGws4otCF
         pgUIMJs9VksaV8Q9IN1OFURXIZ+vtL7x2n3yYtJlvjh7tp60e+/ziKJZJAd0zlhkxPjr
         kawJ57D5crBPxkDP/El+XHfnn417R+vpzddUASbG0KWZHwQ4ssPdlYrKYERWHpBz15fA
         EMOv5qwdMtV2zpWgaK9Ud2wJMFbq3E5WfWxO3ngPO34pOlBF9k0s72sh9tt5MwHn/Nax
         BciwLJUYr61Qdub8bI++ylVB9d5iu5LBe0dUlCDpyrwnTOf1mtJs5pgwrNz/beswkyqt
         ceGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=UKidboM54rhEPBju3KpDAzMAOpzVB3XnT0GH9f41jrA=;
        b=fyrVb2cXlJthyHyQf7lyqcFZobvMA/OUiInKigT9qWodzAasvIKyzBCTWAIDTotJPE
         WS5r16Cq3vw/Vw2FxTweQlZUYLmJzo2DT0FREnN7HRabLqP/KiTlJ7GeGQgLe9KZdO5S
         nmuKCca4mUxDzoJMZU52B5clvQJIVPn0kt0hoaXhihAdM+DbcnLkVxrqSDEK1aXeR2Va
         BwmhNtq3/LHAJsQysChVMhpO5ESSRIhpG2sfcIqS5WXlfJkSed/LDNCU12tXBu3ib+Uo
         P3qvPmsA2VXY9eIjmroCq8Rr6U0cI7Xau8AFdf7ta98rxbalXVWe/s39HyefmO7e42BT
         IVMQ==
X-Gm-Message-State: AOAM532NTK97eIMFmh84wR00pBE7BEqbGne3EctAh6PSjtEgsVz53vcs
	hkG8BcW299gHnb+eG2/aZy9jHXOy
X-Google-Smtp-Source: ABdhPJy9n9qzUnoDR1M6DjFCCTprXzPcl8yBiusO3167toCwd3gCKftfwirFa5RpVrM+Fs5/b/laDQ==
X-Received: by 2002:a92:506:: with SMTP id q6mr25248474ile.107.1591709212394;
        Tue, 09 Jun 2020 06:26:52 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:6cec:510:bc9:611? ([2605:a601:ac3d:c100:6cec:510:bc9:611])
        by smtp.gmail.com with ESMTPSA id v2sm7309925iol.36.2020.06.09.06.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 06:26:51 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH v3] wic: Add --offset argument for partitions
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
References: <20200511194835.20890-1-JPEWhacker@gmail.com>
 <20200602134205.17838-1-JPEWhacker@gmail.com>
 <20200608231107.GT17660@denix.org>
Message-ID: <ec9e545b-f828-7e57-b94e-27de24ce1eee@gmail.com>
Date: Tue, 9 Jun 2020 08:26:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608231107.GT17660@denix.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/8/20 6:11 PM, Denys Dmytriyenko wrote:
> Not sure if it's related to this change, but I've been seeing this error
> across the platforms in master past few days:
>
> WARNING: bootloader config not specified, using defaults
>
> Traceback (most recent call last):
>    File "/OE/poky-master-build/sources/poky/scripts/wic", line 540, in <module>
>      sys.exit(main(sys.argv[1:]))
>    File "/OE/poky-master-build/sources/poky/scripts/wic", line 535, in main
>      return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcommands)
>    File "/OE/poky-master-build/sources/poky/scripts/lib/wic/help.py", line 83, in invoke_subcommand
>      subcmd[0](args, usage)
>    File "/OE/poky-master-build/sources/poky/scripts/wic", line 219, in wic_create_subcommand
>      engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
>    File "/OE/poky-master-build/sources/poky/scripts/lib/wic/engine.py", line 190, in wic_create
>      plugin.do_create()
>    File "/OE/poky-master-build/sources/poky/scripts/lib/wic/plugins/imager/direct.py", line 86, in do_create
>      self.create()
>    File "/OE/poky-master-build/sources/poky/scripts/lib/wic/plugins/imager/direct.py", line 179, in create
>      self._image.prepare(self)
>    File "/OE/poky-master-build/sources/poky/scripts/lib/wic/plugins/imager/direct.py", line 352, in prepare
>      part.prepare(imager, imager.workdir, imager.oe_builddir,
>    File "/OE/poky-master-build/sources/poky/scripts/lib/wic/partition.py", line 175, in prepare
>      plugin.do_prepare_partition(self, srcparams_dict, creator,
>    File "/OE/poky-master-build/sources/poky/scripts/lib/wic/plugins/source/bootimg-partition.py", line 193, in do_prepare_partition
>      part.prepare_rootfs(cr_workdir, oe_builddir, hdddir,
>    File "/OE/poky-master-build/sources/poky/scripts/lib/wic/partition.py", line 238, in prepare_rootfs
>      method(rootfs, oe_builddir, rootfs_dir, native_sysroot, pseudo)
>    File "/OE/poky-master-build/sources/poky/scripts/lib/wic/partition.py", line 305, in prepare_rootfs_msdos
>      rootfs_size = self.get_rootfs_size(blocks)
>    File "/OE/poky-master-build/sources/poky/scripts/lib/wic/partition.py", line 100, in get_rootfs_size
>      if extra_blocks < self.extra_space:
> TypeError: '<' not supported between instances of 'int' and 'function'
> WARNING: /OE/poky-master-build/build-CORTEX_1/arago-tmp/work/am335x_evm-poky-linux-gnueabi/core-image-base/1.0-r0/temp/run.do_image_wic.3266:1 exit 1 from 'BUILDDIR="/OE/poky-master-build/build-CORTEX_1" PSEUDO_UNLOAD=1 wic create "$wks" --vars "/OE/poky-master-build/build-CORTEX_1/arago-tmp/sysroots/am335x-evm/imgdata/" -e "core-image-base" -o "$build_wic/"'
> ERROR: Execution of '/OE/poky-master-build/build-CORTEX_1/arago-tmp/work/am335x_evm-poky-linux-gnueabi/core-image-base/1.0-r0/temp/run.do_image_wic.3266' failed with exit code 1:
>
> Any clues? Has anyone seen anything like that?

Yes, this is because of my change to add --offset support. I'm not sure 
how that slipped past, but I'm working on a patch to fix it.

>
