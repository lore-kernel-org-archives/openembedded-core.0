Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6B511745D4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 06:37:07 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id k3-v6so12209519otl.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 23:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=4MgUlZX8kyrUGn32GIl5xUaxiUtiCDH8+Q+HXrPnNpo=;
	b=OuzFSoBNAhGBgfpWoJfffb23sPCeTn3/V0nWRf+54vs4pgp95cEbqOvPi5uBknuCSc
	Q2vjjJoDmxbIvLi1R3oSIiViA/PrrPe/yqgzwHZ7qbI2AOlijtRAw7tbCFfILsGyyz0H
	5Al9hWRKnsPuEmw0xDOM1u74hZORE2+cxnS9EQvSkoJ4dTPRrYv82ki2CrNJjdUnPq0a
	CyfRY5fTJszCcxAsDr3sjvFIsuuNHQk5SLdcr2GgVq3OKovApsrLMmgAhBkfoVFAkCIa
	iYu+KFqKOPpsoz6TiChhqT3pid4f1dMXW5MHoPdaNYckDfGcn2QLHht/kaV5lQpQyGSG
	kByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=4MgUlZX8kyrUGn32GIl5xUaxiUtiCDH8+Q+HXrPnNpo=;
	b=rcFiPFqElGwHRHl+goPOXyCnpYZ9f58YbFlrzIYti67CAcjJ+htrN11UttyEQP050b
	POEaORyh86cqPIlkm5+1ajbuxdc5hK1uvV4UujRXUOGxUq9w1O3fWk42u/MJjO4Y/GCo
	Z9ShYcOMAGAIPEoqalUe9fNZ+R7ehkCuuRvccFR8uORLE5U/wNTpBGnObTDkfw452vuv
	hAh1DKBqieGIEsQkbEAPW1Lq13CIM9VO/zozsGxndDtP1aFLSFh4z95Yau+hgrw9U/oK
	nIiL4H9Vo7eALW7A9VTGFEUAMfa4LS52yTWYRB1ha57+hrVMPr+sewmNC/e986t1PW2z
	5e4A==
X-Gm-Message-State: APt69E0KK7AuX+PhH4Lox92wSF8J6f8O/YkJXZZmD0gzLBWvX2z0f01D
	tKOze8YuFhH+4J3Z1LCHen6Z8mPis2re/fILCtVaFQ==
X-Google-Smtp-Source: AAOMgpfi30U8lrcD8HsujJ/75Eymr+mjTYTWrR/P0ekQDysowTNYB6TnPbn5B2StO5kVWFgSgL1BvB58gMLDTlxI01o=
X-Received: by 2002:a9d:2c5:: with SMTP id
	63-v6mr10869282otl.155.1530340628273; 
	Fri, 29 Jun 2018 23:37:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Fri, 29 Jun 2018 23:37:07
	-0700 (PDT)
In-Reply-To: <20180629235346.qsg3sjhpsaqqqcxi@axis.com>
References: <20180625092738.17962-1-olofjn@axis.com>
	<CANNYZj_kMAYH6=EcXM4ACwZhUp3qzzZdv9k6nev-v2oitWO6SQ@mail.gmail.com>
	<7693ed11-5b51-52f6-08f9-4e4f9b76fa90@windriver.com>
	<CANNYZj-MKfxraD-Ho6_Rej3R8dXSAWo3-JtZvQ4SanH183uWvA@mail.gmail.com>
	<CANNYZj_tSbtCh13rCUVYW0iqozQ65q+OufCgVGSW96J11wibEA@mail.gmail.com>
	<CANNYZj-8KYbZw-kcaAU0DQNd9=Lmy4eog75iY+6rtr2as5hEDA@mail.gmail.com>
	<20180629235346.qsg3sjhpsaqqqcxi@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 30 Jun 2018 08:37:07 +0200
Message-ID: <CANNYZj_t-68JsYddLZDu+8JMBCDggtNLKEEMFLpafDFfwn1WgQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Olof Johansson <olof.johansson@axis.com>
Subject: Re: [PATCH] rpm: Avoid leaking temporary scriplet files
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
X-List-Received-Date: Sat, 30 Jun 2018 06:37:07 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-30 1:53 GMT+02:00 Olof Johansson <olof.johansson@axis.com>:
>> As scriptlets are executed outside of rpm's chroot, they are being
>> written into system's /var/tmp, not rootfs's. This patch should
>> probably be amended to prepend the rootfs path when scriptlets are
>> written out, and then we should be sorted.
>
> Is that not a more invasive change than just removing the tmp
> files unconditionally (especially in terms of maintainability)?
> I'm not even sure how exactly to do that, but I'm obviously
> missing something. For instance, is there a way to manipulate the
> global rpmMacroContext temporarily?

Removing the tmp files unconditionally is a *workaround* for the fact
that they are written into an incorrect location, due to a different
patch removing the use of chroots (so that scriptlets can use native
tools in a cross-install situation), but not amending temporary
scriptlet file paths otherwise. The correct location would be the
/var/tmp directory inside the rootfs.

The files are created here:

lib/rpmscript.c:    FD_t fd = rpmMkTempFile("/", &fn);

Ideally, "/" should've been replaced with rpmtsRootDir(ts), but ts is
not accessible from the function, or from its parent, or parent
parent. So yes, I concede this would be too invasive to pass that down
the call stack. So if you can amend the above patch of mine with your
change, commit message, and SOB, that should be best. These changes
really belong together, as a custom fix for the oe build environment.

Alex

