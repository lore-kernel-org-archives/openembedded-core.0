Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 656536BED8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:23:04 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md4so665550pbc.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=83u8XAOhEqRKNWTZTW0LbzwOBbYVgfooE44bY1q99BY=;
	b=Y6XzrYn+msxP9uiRjb2iR4e7SocNLQ46p1X8oRZxExU/IhVukxgpPJUPT2Qwc3ieN0
	p90C8NdZX6BAJC8UT2kkV4vgSJTQXgp40LllG8un1xlhFuIwqAbD5tbYh7ot+Fyei2rr
	S5n+f3fL585IdJyAzHPsabGvh/O8Rmr6/uD/8OOiCua837c9k2wI+XgWWlqb2QDWBEmj
	0NnGjL6VKuDCgKBQtg1aJYexV3/s0y4dlmA/WrdnqXOQDPjiRFXVcMUtTTkQDN63z4LK
	QJ6xh3OdiifDDDmTbLZSmdU36Sovl+WHAzJq981uNK4C0Pix+N6KTM67JszCSOgSJY+6
	V3jw==
X-Received: by 10.68.200.34 with SMTP id jp2mr4657652pbc.53.1377793385233;
	Thu, 29 Aug 2013 09:23:05 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id
	zi1sm38861763pbb.28.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:23:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <7C83EB0C-C1E8-4481-AD5A-D38135A15D9F@gmail.com>
Date: Thu, 29 Aug 2013 20:22:56 +0400
Message-Id: <CBA2A6AF-AC69-41D5-841A-D17A144B753B@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
	<4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
	<521AA95A.8000803@windriver.com>
	<7DBFB4EE-4727-422F-8815-D801827A37C9@gmail.com>
	<521AD896.3000503@windriver.com>
	<6324D287-2CA2-4A88-AFF4-58CABE82B2CC@gmail.com>
	<521BA7CB.7070206@windriver.com>
	<2D33FB6A-9F7F-4E8E-8B1A-CED1D571A82C@gmail.com>
	<521D0622.6090802@windriver.com>
	<2AC87191-8D2B-4972-A249-2043B68A0A7B@gmail.com>
	<521E7D2E.6060404@windriver.com>
	<E66BA9BD-07D4-4A90-BFB9-0908608FBD07@gmail.com>
	<A3529AF4-7650-4866-A83B-5D948D733723@gmail.com>
	<6A28979E-6351-4F22-B118-8987B099613B@gmail.com>
	<7C83EB0C-C1E8-4481-AD5A-D38135A15D9F@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1498)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Thu, 29 Aug 2013 16:23:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 29, 2013, at 8:17 PM, Khem Raj <raj.khem@gmail.com> wrote:

>=20
> On Aug 29, 2013, at 1:50 AM, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:
>=20
>>>> also take a look at meta-linaro, they test armv7+ qemu regularly.
>>=20
>> I built core-image-minimal using meta-linaro, using genericarmv7 =
machine but it just generates an Image file for the kernel and a tar.gz =
rootfs. It doesn't look like its useful out of the box for a QEMU image. =
Additionally you have to do something extra for the image to be usable =
for a beagle QEMU machine, related to x-load and u-boot, to get it to =
work.
>=20
> x-load, u-boot are not needed when booting a qemu machine. You just =
need a kernel and rfs. So make sure that you use a kernel thats =
configured correctly to boot on say vexpress emulation on qemu and that =
should be it. Real thing is to figure out the kernel and any patches if =
needed.

Tried that with the current poky master, it doesn't work.=20

The only two qemu arm based machine configurations that work, at the =
moment are qemuarm (versatilepb) and qemuzynq from the meta-xilinx layer =
(xilinx-zynq-a9).

The others don't work, it crashes upon booting.

If you've got -M vexpress-a9 working, please let me know how you got it =
to run against yocto master.

Elvis Dowson=

