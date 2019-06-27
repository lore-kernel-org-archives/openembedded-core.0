Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21FF16B8BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:35:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5R8ZJmr008700
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jun 2019 01:35:35 -0700
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 27 Jun 2019 01:35:26 -0700
To: <a.silberhorn@web.de>, oe-core <openembedded-core@lists.openembedded.org>
References: <trinity-b095feb1-65bd-4db2-999a-3afe9a9f0428-1561451174816@3c-app-webde-bs02>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <1c8ec9db-7911-7ae6-f89b-8e73ffb0a8f3@windriver.com>
Date: Thu, 27 Jun 2019 16:36:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <trinity-b095feb1-65bd-4db2-999a-3afe9a9f0428-1561451174816@3c-app-webde-bs02>
Subject: Re: [yocto-builds] Yocto build won't boot from HDD
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
X-List-Received-Date: Thu, 27 Jun 2019 08:35:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Alex,

This email should go into oe-core mailing list.

On 6/25/19 4:26 PM, a.silberhorn@web.de wrote:
> Hello everybody,
> Since im new to Yocto I ran into some problems trying to boot my intel-corei7-64 
> core-image-minimal from HDD.
> I used dd to put it on the hard drive but while booting it stops with a Kernel 
> panic:
> Kernel panic - not syncing: VFS: Unable to moutn root fs on unkknown block (0,0)
> I tried a lot and searched for a solution. First of all I had to do a 
> grub-install and configured the grub.cfg file in the boot partition to list the 
> Image in GRUB but I am not getting any further than that point. In some forums 
> they said its meaning that the initramfs is missing.

The grub should already be on the HDD since you've dd it (I supposed that you
dd to a HDD, not a to partition). Check the grub.cfg, maybe the root=/dev/foo is 
incorrect, it should be the partition which contains the rootfs.

// Robert

> I dont think that the image itself is broken because it works on a usb flash drive.
> Could someone of you folks be so nice to help me out of this misery?
> Best regards
> Alex
> 

