Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30E4A6057B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 03:19:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3L3J12j013175
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 20:19:02 -0700
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Apr 2016 20:19:00 -0700
To: oe-core <openembedded-core@lists.openembedded.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <571846A4.7010001@windriver.com>
Date: Thu, 21 Apr 2016 11:19:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
Subject: Add ovmf-native to make qemu-native/runqemu support boot UEFI image?
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
X-List-Received-Date: Thu, 21 Apr 2016 03:19:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I'd like to add ovmf-native to make qemu-native/runqemu support
boot UEFI image, that will make us debug UEFI image much more easier,
without ovmf, we have to burn EFI image to a usb disk or cdrom,
then boot it on the real hardware, this is inconvenient. (Virtual
box can't boot our UEFI image, either, please see my last email
about virtualbox, we may fix it later.)

The ovmf is released under BSD license:
http://www.tianocore.org/ovmf/
The website says:
License information: BSD (May contain an additional exception if bundled with 
the FAT driver.)

We don't use the prebuilt FAT driver, we will build it from ovmf source.

I tried it in my local repo, it works.

We need to do:
1) Add ovmf-native to oe-core.
2) Move acpica from meta-oe to oe-core since ovmf-naive requires iasl which is
    provided by acpica, we may also move acpitests to oe-core since it is used
    for testing acpica, others are not needed.
3) Update runqemu to make it can boot EFI image.

Of course, this for master branch only.

Any objections or comments, please ?

-- 
Thanks

Robert

