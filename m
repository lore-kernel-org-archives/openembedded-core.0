Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D144B60119
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 09:52:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3K9qcBS010265
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 02:52:54 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Apr 2016 02:52:40 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57175167.2080409@windriver.com>
Date: Wed, 20 Apr 2016 17:52:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
Subject: Can't boot efi image (iso or vmdk) in virtualbox
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
X-List-Received-Date: Wed, 20 Apr 2016 09:52:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

I can't boot oe-core's efi image in virtualbox (with UEFI set), the
image works well on real EFI hardware, but there is nothing output
in virtual box after grub loaded, after set debug=all in grub command,
it hangs at:
[a lot of such lines]
mmap/efi/mmap.c:66: EFI memory region 0xfoo-foo: n
[a lot of such lines]

My local.conf: (krogoth branch)
MACHINE = "qemux86-64"
IMAGE_FSTYPES += "iso hddimg vmdk qcow2"
MACHINE_FEATURES_remove = "pcbios"
MACHINE_FEATURES_append = " efi"

I tried virtual box(with EFI set) + Fedora23, it works well.

virtualbox version:
5.0.14 (ubuntu 15.04's version)
And
5.0.18

Does anyone has met the similar issue, please ? Any suggestion is
appreciated.

-- 
Thanks

Robert

