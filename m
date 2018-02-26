Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 114BD786A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 19:12:58 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id g2so6542973pgn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 11:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TowdZqKGSCSIcVAca8/NR1w8kS71p1QrZqeMFMvToDc=;
	b=mNbMFqS7UjyAHjRt3MEE5j+Yk/8DvKjxII77QeEXp3EmbhdTwXBK3mMfA9HIWPex/q
	88kThbzG/bneiSCuE1DDlnAFLfNaIL3KQouRPUM1UATpuP2eWxp17HaysHyIqmbMVhJR
	vrzAp5tUWDx5a5/4pIQRFdUAFBkCqklxfzae2BZnMEPPbP/hxJWVQiMAZ4WFFnLpEzdQ
	AUqzfujKaXURkVvNesVVJNV421GtbEd6tiGUohZcZ6Mst4rMnLD3pMnwYsWNnBqiMgmh
	R2Nzh+f5XRCNO9MNX6Xd8vCSvP0unIxhIJeNMk3cbC0QiD6r0pwpF0xKEZOGqQtczIAb
	PyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TowdZqKGSCSIcVAca8/NR1w8kS71p1QrZqeMFMvToDc=;
	b=IhGA4XseKtc+MNsIdRCS5zq80SqLMFswsPc5AQgPqpyfYVHB76VTiGphsu3XeonFGh
	F/W6S8ZY1rPio1SspPNVwskY0+LPTYz9ZB7VtnHmM9NpXC8gg6gp9arV5guFSO14m/kc
	qe3N0Hk46kemFWhlXZc9xQuWkspVGXX2rsjgGpQpvr8avn/05wTd8PB+arHXCa/l0prM
	c5iP8VBviHXN/tJXdD9V4LsOROxzTOldXcQ8fC6KLj8jNJQmQkhuKUivJcOpx5qID2Jz
	EX99dzXFJ43c9Ql3KN7Rf9q6OMz+k5P8Hg1VjVr/OMWgMRC1VfxdwHCjJrRtPKljyEgl
	Psjw==
X-Gm-Message-State: APf1xPD4Xk2DC0b2dgbM7ANZ3ORpnnd71dAfBg4VCKNgDMpmRz4iySnt
	agxjiJwBcflIpErTFeimfs0FKdMGEDxrQ+OE2bk=
X-Google-Smtp-Source: AH8x2278qCJ4ZnrX2+CKUv6pgRSd3vGPKs+FkgeA6d1McwT+/bIuuSNzHYQR5EXYqH7TpN7vW/itDQMJJKNu8W1nBJM=
X-Received: by 10.98.28.202 with SMTP id c193mr11583396pfc.109.1519672379592; 
	Mon, 26 Feb 2018 11:12:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.139.97 with HTTP; Mon, 26 Feb 2018 11:12:29 -0800 (PST)
In-Reply-To: <CAJTo0LaBDD9_uw19tF3J7Rg=Ua5QZEJrtgAVVHzMK_-+A58rnA@mail.gmail.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
	<1519029438-11092-2-git-send-email-maxin.john@intel.com>
	<CAMKF1spVFhwnV2v4+O0KV-+9+a66HSK9eWyYzdJK142TZ1rXGQ@mail.gmail.com>
	<20180226075447.GA8270@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LaBDD9_uw19tF3J7Rg=Ua5QZEJrtgAVVHzMK_-+A58rnA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Feb 2018 11:12:29 -0800
Message-ID: <CAMKF1srBL2m5GLh3La0rKOmznKRrRKEY3DxL9nU+J_TwtBya9g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/27] pkgconf: upgrade to version 1.4.2
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
X-List-Received-Date: Mon, 26 Feb 2018 19:12:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 26, 2018 at 3:34 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Whoops, I thought the upgrade was safe without the rest of the series.
>
> Khem, are you using pkgconf instead of pkg-config then?
>

yes I am trying to and so far it has held up.

> Ross
>
> On 26 February 2018 at 07:54, Maxin B. John <maxin.john@intel.com> wrote:
>>
>> Hi Khem,
>>
>> On Sun, Feb 25, 2018 at 11:18:58PM -0800, Khem Raj wrote:
>> > This is regressing kmod builds
>> >
>> > ERROR: kmod-25+gitAUTOINC+aca4eca103-r0 do_package: QA Issue: kmod:
>> > Files/directories were installed but not shipped in any pack
>> > age:
>> >
>> >
>> > /mnt/a/oe-build/build/tmp/work/aarch64-bec-linux/kmod/25+gitAUTOINC+aca4eca103-r0/recipe-sysroot/usr/share/bash-completion/completions/kmod
>> >
>> > as you can see its stll carrying the sysroot prefix into DESTDIR
>> >
>> > and this is how kmod is asserting for bash-completion dir
>> >
>> > with_bashcompletiondir=$($PKG_CONFIG --variable=completionsdir
>> > bash-completion)
>> >
>> > it was working fine with 1.4.0
>>
>> Good catch. This patch has removed the work-around that we had to make
>> pkgconf build compatible with freedesktop.org's pkg-conf in wrappers like:
>>
>> > > -            unset PKG_CONFIG_SYSROOT_DIR
>>
>> Without the associated kmod fix, this will fail as above. I will revert
>> those wrapper changes till we decide to go with pkgconf or not.
>>
>> > On Mon, Feb 19, 2018 at 12:36 AM, Maxin B. John <maxin.john@intel.com>
>> > wrote:
>> > > pkgconf improved compatibility with freedesktop.org pkg-config.
>> > > So, we don't need to unset PKG_CONFIG_SYSROOT_DIR in wrappers.
>> > >
>> > > Signed-off-by: Maxin B. John <maxin.john@intel.com>
>> > > ---
>> > >  meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in         | 4
>> > > +---
>> > > -            unset PKG_CONFIG_SYSROOT_DIR
>>
>> Best Regards,
>> Maxin
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

