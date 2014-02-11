Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 86C2A6E938
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 05:46:50 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id v10so7098861pde.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 21:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=h6R+ZmHqNiyiMPJHptCwKOdIeluhadDLpTOZqAa7vM0=;
	b=WsYGLLatw0FsMjgj+v7VhRRXYOMgV2fDQSeWt3s3Y6btCoRwGvtlSJCpausyVXsAqY
	Pk7yI1pnLpUflPn8UC3rdf8o3MLP6rWcLiZPXn+IP+XWwsG9XmgsoR6jWIe4/ABlmcAq
	pUNtCuJnSb4RtU/yTJPKO2YAWhh7pocbEeAUsUdGj8bqEqq4zujLguHCt+RvpmBBKsUC
	k2Ndz6Anm7knwtoJtoqELvriEgfb6Y1cwTiv2+icKZQI6zCKL6wKYjuWbbEZ7YF7j6WU
	bMIBmJYLKvgWz0fketIBrXRiiSM7O4pRDN/ut5g5TkH7ctoYUQMnB75m+Fh1PCMS3aB/
	QXAg==
X-Received: by 10.68.143.196 with SMTP id sg4mr12567669pbb.155.1392097611259; 
	Mon, 10 Feb 2014 21:46:51 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	ug2sm127990425pac.21.2014.02.10.21.46.49 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Feb 2014 21:46:49 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20140121155032.GA21712@mail.itconsulting-heinold.de>
Date: Mon, 10 Feb 2014 21:46:47 -0800
Message-Id: <E32137DE-8B3E-42C9-BF29-487777BC4EE7@gmail.com>
References: <20140121155032.GA21712@mail.itconsulting-heinold.de>
To: Henning Heinold <henning@itconsulting-heinold.de>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: strange directories inside sdk build with with dora
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
X-List-Received-Date: Tue, 11 Feb 2014 05:46:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jan 21, 2014, at 7:50 AM, Henning Heinold =
<henning@itconsulting-heinold.de> wrote:

> Hi,
>=20
> I build a sdk with latest stable dora and in includes some x86 =
directories in the arm sysroot:
>=20
> pwd
>=20
> /opt/poky/1.5.1/sysroots/armv5te-poky-linux-gnueabi
>=20
> find | grep "/opt"
>=20
> ./opt
> ./opt/poky
> ./opt/poky/1.5.1
> ./opt/poky/1.5.1/sysroots
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/chsh
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/newgrp
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/passwd
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/opkg
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/chfn
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/bin/groups
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/sbin
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/usr/sbin/chpasswd
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/bin
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/bin/su
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/bin/login
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/etc
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/etc/rcS.d
> =
./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/etc/rcS.d/S98run-postinsts
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/sbin
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/sbin/vigr
> ./opt/poky/1.5.1/sysroots/x86_64-pokysdk-linux/sbin/vipw
>=20
> Are the really used or are the just got wrongly included?

This seems wrong. firstly file a bug so it can be tracked. Secondly, =
seems
prefix has gone wrong for some nativesdk package=20

>=20
> Bye Henning
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


