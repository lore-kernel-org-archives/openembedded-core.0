Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 99E906BE78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:28:34 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id r10so678873pdi.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=cW5JPNLiis5lScb9ReH3eQGcLC7ZAhNaOSbvF38YCfs=;
	b=jMAQv4Te9W7Gw1MIZsbnegdzt7Xm6pZGsMRsYRU4827aVgEGnmD17k81FQFOalhQtB
	mJlmV7OOd+0yWirUV6UZ4RFuHlOGg27cC1BmG5j1AlGvLc6VLORo3noZjPGvc53UevfW
	RHswwITkU4/wviNi8rDKN9kxQxPlJmdZ3v0PuYgR1BYzKnywz1xnxqWNs5aKKU7LXeMJ
	hNSnx36CauRO9eKS2VnpM69dH8HgKyi4PQtZdLMktWE520x9UQpja7QOyqwI0OCta1pd
	IBMQiKjryj7lX6Ix5qGZzoN2zlEm42eEvhqi+SiULTdO89T6RM1wRr1U/nZa7TNzdl/G
	3eug==
X-Received: by 10.68.217.225 with SMTP id pb1mr4694562pbc.61.1377793715568;
	Thu, 29 Aug 2013 09:28:35 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id
	ib9sm38862649pbc.43.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:28:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <521F7578.60909@windriver.com>
Date: Thu, 29 Aug 2013 20:28:27 +0400
Message-Id: <B419949F-98C0-4A31-9B7C-ED6C0F2D76FF@gmail.com>
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
	<521F4020.1080800@windriver.com>
	<9B9DE34A-D9BE-44CB-871D-E9C57510DE38@gmail.com>
	<521F7578.60909@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
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
X-List-Received-Date: Thu, 29 Aug 2013 16:28:34 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 29, 2013, at 8:23 PM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:

> On 13-08-29 10:02 AM, Elvis Dowson wrote:
>> Hi Bruce,
>>=20
>> On Aug 29, 2013, at 4:35 PM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:
>>=20
>>> With that, it's always been a manual setup for me in the past. The =
typical
>>> workflow is to test them via the usermode NFS boot. Have you given
>>> that a go ?
>>=20
>> Does yocto have some wrapper script/command to setup nfs boot =
automatically
>> without too much manual configuration? The runqemu and =
runqemu-internal
>> scripts seems to indicate that, but haven't tried this before.
>>=20
>> Let me know if it exists! If not, if you could point me to a link =
that describes how
>> to set NFS boot, and use it to load a beagleboard image it would be =
great!
>=20
> This is supported right out of the box, and it should be documented in
> the project docs.
>=20
> Search for users-space NFS in =
http://www.yoctoproject.org/docs/current/adt-manual/adt-manual.html

I saw this, its only for the rootfs. what I've read on the net alluded =
to the fact that you need to have
xload, uboot and the kernel image on a specific partition inside an =
sdcard image. Those were
the boot procedures used for the beagleboard using qemu.

This is for -M beagle, with qemu-system-arm.=20

Anyway, I just need a way to boot vexpress-a9 using QEMU. I'll send a =
private email, with the
patch to you, so that you can start off from where I left, in terms of =
modifications to poky-master
and be able to debug the issue directly at your end.

Best regards,

Elvis Dowson=

