Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 702436AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 12:05:15 +0000 (UTC)
Received: by igui7 with SMTP id i7so59053259igu.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 05:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=hNBh+f0u84AUlkLljuduH6b/+eOF3ttf8r1YBpLE6vA=;
	b=kJ1wPQAN6L26KVW/TtN8vei0Cas0wH5mX4GdSt9Efe+m2Xkd8OiKtAkEsUUotBosm4
	HCA0AInCs/zffvbTrjL62EGNw7M33eveVUMx2q3+IzbOKM/ZTJTfiI0i+X9XpnCamWvO
	XoVc4K6VfE+e/j99tJUt4yQU6uFhbwRuZNYG9Fe1MBUuy7NmUgN8jj4Be2t1FTGtiu28
	3uas7MJjK/447iertJ9Kw1VRaOG26Agkx4GZkLerbMfzVMbhwGW9upZyHMa0Arpjmxo2
	L1gdt2UpAJXn37v9QHA6JlPeYSanH2YZGkxhMIohnEdg+KYSzKxKXVZrRRHTy2QOwk1G
	CbpA==
X-Gm-Message-State: ALoCoQkOR0HiU5v0/g/oJenCj3Rzp8zi2XAb7X82YGkEw00XLkoXvRyNdHMg6NrxrshN078DC4Mq
X-Received: by 10.50.107.6 with SMTP id gy6mr12534477igb.32.1440417915409;
	Mon, 24 Aug 2015 05:05:15 -0700 (PDT)
Received: from pohly-mobl1 (p57A56DBD.dip0.t-ipconnect.de. [87.165.109.189])
	by smtp.gmail.com with ESMTPSA id
	h33sm12926436iod.23.2015.08.24.05.05.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Aug 2015 05:05:14 -0700 (PDT)
Message-ID: <1440417912.3543.20.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 24 Aug 2015 14:05:12 +0200
In-Reply-To: <1440417012.3543.16.camel@intel.com>
References: <1440417012.3543.16.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: qemu + initramfs
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
X-List-Received-Date: Mon, 24 Aug 2015 12:05:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-08-24 at 13:50 +0200, Patrick Ohly wrote:
> Hello!
> 
> I just tried to boot a custom image under qemu with
> core-image-minimal-initramfs included in the kernel. For that, I added
> to my local.conf:
>         
>         INITRAMFS_IMAGE = "core-image-minimal-initramfs"
>         INITRAMFS_IMAGE_BUNDLE = "1"
> 
> The extended kernel now gets built fine with the normal "bitbake
> <image>".

Speaking of qemu and core-image-minimal-initramfs, that initramfs isn't
really suitable as it stands. It uses init-live-boot, which expects to
boot from removable media instead of the fixed disk provided by qemu.

Is there anything more suitable or do I have to roll my own init script
entirely, perhaps based on initramfs-framework?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




