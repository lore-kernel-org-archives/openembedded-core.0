Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id B6A386E221;
	Wed, 26 Mar 2014 22:04:47 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id rl12so2385023iec.18
	for <multiple recipients>; Wed, 26 Mar 2014 15:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=lDSV8t2SVHiFUBAAXCd5+au2ZwFgNrp1+L3YiTbzIVs=;
	b=IGF1z6vTSKEejhXgsCzCPg9NR2l/xeVs184USxPZBS3K8lRdzlrOlfJq+6GjdzEE0C
	+mEr9YBwxf6U8zE0NpyvtnwjVEsLeRwqs+0pBnSAi6iPj1kzh2qIdb8WwWNIuzYk4bSL
	d4ppZk/J0EkYmCWGWOQXcuP7Ptu+f5Uhf4t6GsOXQOtUOFEY9Mj3sieCOD6SF78TWwAm
	N9iKvWRclBfDSUDYcO4nBMiX3Xmtvocdwqp8UDWjvcCvbEY0fYjCn9Bw+vC7iGBFNdLU
	BxazGpViAhOlZGTtWEaCCMlhkulGAKyTeelnDisx9Q5m/FR6EE20q2roRZm9LT6IRvQT
	AbTQ==
X-Received: by 10.50.49.109 with SMTP id t13mr313287ign.2.1395871488225; Wed,
	26 Mar 2014 15:04:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Wed, 26 Mar 2014 15:04:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Mar 2014 15:04:17 -0700
Message-ID: <CAMKF1soKZqqmQUVCQnUqS1GV1FO5KictTO+=up=d7Jw3+QhXMw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: initial support for musl libc with OE/Yocto Project
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
X-List-Received-Date: Wed, 26 Mar 2014 22:04:49 -0000
Content-Type: text/plain; charset=UTF-8

Hi

There were interest in other threads in having musl as an alternative
to eglibc/uclibc that we already have in OE, in that direction I have
poured in my on and off work and put it into a contrib tree

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/musl

TCLIBC=musl MACHINE=qemuarm bitbake musl

would get you going. It does not yet build a full image, there are
patches needed for some packages and I could use some help to weed
them out.

Right now, I have added support for qemuarm in gcc but others are
following soon.

So if you are interested try it out and may be try to build core-image-minimal
and fix the packages along the way

Happy hacking

-Khem

