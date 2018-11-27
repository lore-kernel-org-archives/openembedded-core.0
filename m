Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0080C600BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 16:03:30 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id s22so17358341ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wkPK+iQcbQTJzI5OgN88M3/cSv+ENuY8yQFgngIkR60=;
	b=sEb3cEzeUm2msdqY1NO63nbfZP/+qq+LzaYS0Ah11Yn8ApuonCfImdO9PMWf5hp/JK
	uhvdahvjJ9LIGG2VaPIE7Ek5gv2PBum7CSQWDQpUYB0/i/4FgcPXUXJGxItN+gt8aUhZ
	LMBIpF1DM/YbbIqJDSMXdQ89GRb2oo7xONUyBxiN0wrejDHK1ZLOvnVMRRQQvffkDwjr
	Y8x+SPBf72tgi+o4AM5bYZckNBs/I/dnM0Lm7MuRhKRISL6+i4omgWn8wBPr0Sc72ZzR
	FAarrIHiHoPoRB1yQWZlL30ZESE2RIPmVi9uz5GhfZ0KpoAgj+OZbIgW3vHXLFLxU6IZ
	RLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wkPK+iQcbQTJzI5OgN88M3/cSv+ENuY8yQFgngIkR60=;
	b=JR5hNrfrJkl5F7QX5HtcPKO9YVazWwA7fgEi1e4mVyVZ6RJuE3hV2cJc8oGQApQBGi
	W5/I1hZLOkSDzYfyaXCqPtAah0xa2yOIzvsUQWn/ehxGd9ItlxuMN0d5awwKJDx5i4eW
	6w3bZV7iqddCB6B4I+gZxVr2KTOZv88zJh0DFhHt84u3GMj/NFW68fk4K4KCaIYolTAa
	Vp/sy+ENTbs/FCGJA7p/W2Q6N0dfqUMPIEmTpo1Nk24S8vCqHbP8gkc+Oe6CbF+vIIR5
	owwdwQYz4uspitfabWFsOahLVDBvXK3rYZJ6UIO0ViPcarSp00KbnlbcJ1FyZZ0zcDUJ
	A/eg==
X-Gm-Message-State: AA+aEWbYnXEWGjU+/o8JChSXbsfxJq5+hj7Iib1KGueqpzFLhJJ1uvk3
	BH0WxKLeSM0YV18DSOKuFDXXdqSGPT+Dx/hkPAeeJQ==
X-Google-Smtp-Source: AFSGD/XNca1aUCJIG3TA9MPzSpFnkMmXRNVTzk7z0j1BvDDIBqOat5Kp9r9lvNsvQmYAi/pC5N1js4FRon7cSump0bg=
X-Received: by 2002:a6b:b844:: with SMTP id i65mr24518472iof.20.1543334611968; 
	Tue, 27 Nov 2018 08:03:31 -0800 (PST)
MIME-Version: 1.0
References: <1ce120dd374a4af1e47cfc6ad6fb0d1be9132d8a.camel@linuxfoundation.org>
In-Reply-To: <1ce120dd374a4af1e47cfc6ad6fb0d1be9132d8a.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Nov 2018 16:03:20 +0000
Message-ID: <CAJTo0LZM5o=wA64stJrfjpDVASWMcRVs4MkCusGYWRoStVqFyg@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: oe-selftest instability - help needed!
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
X-List-Received-Date: Tue, 27 Nov 2018 16:03:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Nov 2018 at 15:25, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> These are a problem as it means the builds go red and someone has to
> dig through the logs and figure out what broke. Doing this repeatedly
> for builds is quite tedious. The SWAT process isn't even really picking
> these up or logging them in bugzilla :(.

As I'm on SWAT this week, I'm filing the bugs now.

> 2018-11-27 13:58:44,758 - oe-selftest - INFO - ERROR: runqemu.RunqemuTests.test_boot_deploy_hddimg (subunit.RemotedTestCase)
> 2018-11-27 14:03:03,386 - oe-selftest - INFO - ERROR: runqemu.RunqemuTests.test_boot_deploy_hddimg (subunit.RemotedTestCase)
> 2018-11-27 13:43:27,665 - oe-selftest - INFO - FAIL: runqemu.RunqemuTests.test_boot_rootfs (subunit.RemotedTestCase)

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13043

> 2018-11-27 02:16:31,246 - oe-selftest - INFO - FAIL: wic.Wic.test_rootfs_indirect_recipes (subunit.RemotedTestCase)
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13044

> 2018-11-26 16:52:24,931 - oe-selftest - INFO - ERROR: signing.Signing.test_signing_packages (subunit.RemotedTestCase)
> 2018-11-26 16:52:24,932 - oe-selftest - INFO - ERROR: signing.Signing.test_signing_sstate_archive (subunit.RemotedTestCase)

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13045

> 2018-11-27 00:18:09,479 - oe-selftest - INFO - FAIL: imagefeatures.ImageFeatures.test_image_fstypes (subunit.RemotedTestCase)

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13042

> 2018-11-27 00:18:09,479 - oe-selftest - INFO - FAIL: buildoptions.ImageOptionsTests.test_ccache_tool (subunit.RemotedTestCase)

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13046

Ross

