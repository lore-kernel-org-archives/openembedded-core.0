Return-Path: <aws.ismail@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4B1CE77337
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 16:34:39 +0000 (UTC)
Received: by obbww6 with SMTP id ww6so77515833obb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 08:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=Irp5MRX/aWgi3zoC4ERnlrVbPXKW1hOojvRjNGnU+gE=;
	b=IGfDfECXTNFZ1PovaSuBb9lQ3TS8FS92+88RBTzqrFbUxLhalrlsU5xQR0g2X5xW0g
	n2SH1eJfv71c0oMVsOw0CGGkMO2w4KLzXXNN+bT0dC/gbHTFT/ZB6lRcoW4WSd8z7b5q
	KPKOgidYijkC3YVklovGGQeh0uANvjCDX9vhxONmeR8XsRqDX8bMXSh9hG/jkmxkk57B
	1cHHy6L97uWACqb9B+hd67/eRaqOt0KciR+CpzAaJy/umq2VGnRylwHx6VlJYZwCcNXp
	P4RD0cJIac8B/Bm/+sTKFE2kLoad4FakaOIBWl4PyzlUlHv+yAuIMiMc3XvT8WoE62Jk
	wnsA==
X-Received: by 10.182.129.138 with SMTP id nw10mr13502621obb.24.1447432479942; 
	Fri, 13 Nov 2015 08:34:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.41.39 with HTTP; Fri, 13 Nov 2015 08:34:20 -0800 (PST)
From: Aws Ismail <aws.ismail@gmail.com>
Date: Fri, 13 Nov 2015 11:34:20 -0500
Message-ID: <CAMHMu0MyG2djSqi-ao6UyATX03+TuTtT_ajOUY8hvWPrkPFOhQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: how to use runqemu with multiple tap devices
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
X-List-Received-Date: Fri, 13 Nov 2015 16:34:40 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I noticed that runqemu starts with one TAP device by default. Inside
the VM this would be eth1 vNIC device. Is it possible to start the VM
with multiple tap devices (i.e. eth1, eth2, eth3, etc.)?

I have tried using the "runqemu-gen-tapdevs" script, which creates
multiple tap devices successfully (on the host), but when I try to add
the new tap devices as part of the qemuparams it fails.

The only way I was able to boot the VM with multiple vNICs was to use
the simple "-net nic ..."  qemuparam option, but then this vNIC won't
be configured and won't have a proper address like what's done to the
default one by runqemu.

Am I missing something, or does this mean that the runqemu-internal
script would need to be modified to support multiple vNICs in the
QEMU_CMD?

Thanks.

