Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 94E1C719B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:02:25 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id 23so1537961vkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 07:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XhJGGLi7dIeL8CCrBLetsTf3TYJaEdBa/adtuRgtj6Y=;
	b=K56vMugtNduRanxbKwq3TQaeFncMXz8SIw0rxTgBbezJpbkpdRM5+YFLvE8pMWOdR4
	XhxF9X9MlphUZsx6p7Unp0Qu7s3lYDaTE8xvJlGFZovDc1U6mcdB1thdKa1yWaMtRadF
	Ww6PvH6V6IqqeKxqZ7ppdD1b6Jk5R88fCFWRZwOkyXYdTRBJ4DMtUhhUhSV95aOuShcG
	GSbRN+cGgghcubIGzyIqhb2+NCixEY4vU1NY4GF+j8Qa5ywDRZL4DW/prPjR5phiMswF
	jHCG1vJU+8usIy+hx2bppTKrrlbEUdBi2J7utpRDE3g56erGWgmJFOyBEngX2Cho5FBj
	D9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XhJGGLi7dIeL8CCrBLetsTf3TYJaEdBa/adtuRgtj6Y=;
	b=aefZMD4g/fXeWWAdV4l42YvqI1m2FdSOWCV4S1FVOmSwgbvU5VPsdy62uWak4AJ3ml
	z6FzlrqU4yO+V1XNIFvZSPVqkyEaarIz5zSy0GhJfA74aRTt4siRyP1DCEcRpRq4iArW
	GvR5Ucrk3Zzo0qAMWsimUTqP5cGb4Qvt4BNUVmCa6/YIMfutITpjaJUp4djS2AN0yose
	NXJFYdhM1OYWdH42deyQYBY9p3gwv0mMR0Z8yQsLabyTBYSFfNQLzHhXNwNofXyenHNs
	pgYzyCngXxtR6nMs/hKn+3B0Fd/brR7me+z+Vnn0VxodZOL+MtYlXlB43U8mmGgwGNyi
	6kbw==
X-Gm-Message-State: AMke39kPG6Kg/TV/6aKlbJMz9kIq0BeJX4tFpRu/Ag/H4kOoYfI1uIH5uCNrHXmyp8XdS67JtyG1UW/bdPF8dA==
X-Received: by 10.31.115.142 with SMTP id o136mr1288056vkc.139.1487257345968; 
	Thu, 16 Feb 2017 07:02:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Thu, 16 Feb 2017 07:01:36 -0800 (PST)
In-Reply-To: <DM5PR05MB295440589E889B60FAAEACD5BB5A0@DM5PR05MB2954.namprd05.prod.outlook.com>
References: <DM5PR05MB2954FBA66842C0F05C5108C6BB5B0@DM5PR05MB2954.namprd05.prod.outlook.com>
	<9c23fade-7e4c-ec14-f0c1-dd43ae71c5ff@gmail.com>
	<DM5PR05MB295440589E889B60FAAEACD5BB5A0@DM5PR05MB2954.namprd05.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Feb 2017 07:01:36 -0800
Message-ID: <CAMKF1spJC6amuibmaqgPOJsH4bvVfaw6qJEOFDW2mzfPY4pVng@mail.gmail.com>
To: Bryan Evenson <bevenson@melinkcorp.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Suggested RREPLACES/RCONFLICTS for easier kernel-image upgrades
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
X-List-Received-Date: Thu, 16 Feb 2017 15:02:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2017 at 5:43 AM, Bryan Evenson <bevenson@melinkcorp.com> wr=
ote:
>
> I tried that and it didn't make a difference; without the specific previo=
us package names listed in RDEPENDS/RCONFLICTS, opkg does not recognize the=
 new kernel-image as an upgrade.  From my understanding PE only affects the=
 version number, not the package name.  In this case, since KERNEL_VERSION =
is part of the package name, opkg does not immediately recognize kernel-ima=
ge-4.1.38 as an upgrade for kernel-image-3.10.0-at91.  Even though both pac=
kages provide "kernel-image", that's not what opkg is looking at when it ch=
ecks for upgrades.
>

Ah yes if its in PN then PE wont help here you have to establish the
relationship between old and new PN,  RCONFLICTS/RREPLACES is probably
the best bet

> Could someone explain to me why KERNEL_VERSION is even in the package nam=
e to begin with?

Perhaps so that you can have have multiple kernels installed in parallel.

 I'm tempted to remove the following two lines from kernel.bbclass:
>
> PKG_kernel-image =3D "kernel-image-${@legitimize_package_name('${KERNEL_V=
ERSION}')}"
> PKG_kernel-base =3D "kernel-${@legitimize_package_name('${KERNEL_VERSION}=
')}"
>
> However, I don't know if this will break something else that would cause =
an even bigger problem.

