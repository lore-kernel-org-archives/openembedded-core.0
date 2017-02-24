Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27259730EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 08:18:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1O8InQA010222
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 00:18:49 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Feb 2017 00:18:48 -0800
To: oe-core <openembedded-core@lists.openembedded.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <6a71c4f3-a370-a1a8-e3a5-e4fc73b21e71@windriver.com>
Date: Fri, 24 Feb 2017 16:18:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: Failed to boot core-image-minimal-qemux86-64.cpio.gz
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
X-List-Received-Date: Fri, 24 Feb 2017 08:18:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Does anyone know the reason, please ?

$ runqemu nographic tmp/deploy/images/qemux86-64 core-image-minimal cpio.gz

[    6.375829] ALSA device list:
[    6.375990]   No soundcards found.
[    6.429357] Freeing unused kernel memory: 1376K (ffffffff81f1f000 - 
ffffffff82077000)
[    6.429708] Write protecting the kernel read-only data: 14336k
[    6.433613] Freeing unused kernel memory: 704K (ffff880001950000 - 
ffff880001a00000)
[    6.458184] Freeing unused kernel memory: 1124K (ffff880001ce7000 - 
ffff880001e00000)
INIT: version 2.88 booting
[    6.497317] usb 1-1: new full-speed USB device number 2 using uhci_hcd
[    6.682837] input: QEMU QEMU USB Tablet as 
/devices/pci0000:00/0000:00:01.2/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input4
[    6.686286] hid-generic 0003:0627:0001.0001: input: USB HID v0.01 Pointer 
[QEMU QEMU USB Tablet] on usb-0000:00:01.2-1/input0
[    6.851785] input: ImExPS/2 Generic Explorer Mouse as 
/devices/platform/i8042/serio1/input/input3
[   11.744796] uvesafb: 5000 ms task timeout, infinitely waiting.
[   16.864725] uvesafb: 5000 ms task timeout, infinitely waiting.
[   21.984430] uvesafb: 5000 ms task timeout, infinitely waiting.
[   27.104459] uvesafb: 5000 ms task timeout, infinitely waiting.
[   32.224577] uvesafb: 5000 ms task timeout, infinitely waiting.
[   37.344413] uvesafb: 5000 ms task timeout, infinitely waiting.
[   42.464578] uvesafb: 5000 ms task timeout, infinitely waiting.
[   47.584458] uvesafb: 5000 ms task timeout, infinitely waiting.


-- 
Thanks

Robert

