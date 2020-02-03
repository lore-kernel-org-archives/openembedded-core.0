Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B4E0B610BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 17:37:55 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z9so7137971wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 09:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jyD5TAKTIMA357CBDmHEwkdY2GH0eC2UdlxXL5U6Jus=;
	b=S+r6pO3J89isplhooRD0jFLYEE5J1Df/qvFrG7Yaxe9YY8fCONiDWwi6fIH28nWKI/
	eaNkF1tmO3mfg8FtSIcgWN1r2EpDUdGW2Z8fQkCQHM6czpzcM7cIBPuRY2G6zgfsPGC6
	OzRPCmD0Db2YM1RyfsXukH1D1i2gJsp2nbDjtoQPksiAjLT4qowU4klkGDTXILZ1xVsR
	KXDdBsze/tJKx9n/DJolTnjJdBtzu0FReFQWYKxS4A8wPpuZ0A6DDLi/oMNlpWbQ0tQz
	fuUy1G252wjD9Wch7P6mSv9bSTS5vC/iQp+o97N74pEsAV7e3hIOhrWiHPC6WsEp18yf
	2NTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jyD5TAKTIMA357CBDmHEwkdY2GH0eC2UdlxXL5U6Jus=;
	b=Su1gozCuYgV0iCJiVPM/4fy4b/UBYlVHUVUrr7sjovgaCHkFmcPA+NmafeDpHVQVwW
	43WQ777tRtjJI5YY+KXVHhnjCW/uqj0J/i8KYNTBV+KCfT2XVIGEb7+QL2MFrb9B/SBH
	IdpTCn8fmVsqsZE97ZwSEJ7MkLx0fyxpIbf7bNsS3cMIKRjqBkMtTRmZlBIpROtwcEwr
	Oxoe+7j4nugAyPEanEok9PL18THMxaA7wVKLqzMpWUg6zwkoFNpIz4PjDow4RQ7dYu3/
	lx1ZDe3SKMz1dZEH2chjSNpGlTgDpTl/u4aUBAkU0/J7bu1j9bo9uBWJotp2SD+Kg7Yy
	wpog==
X-Gm-Message-State: APjAAAWYViKDTSi8nYMOHI3zIBYqk0glFTGdV8MLaEkmUFl4fl/ct6Cu
	TSrBIIBiJlKSosPSx/eoGMe7d5FV
X-Google-Smtp-Source: APXvYqwtgZh5OTd+JIdWgT1djIhtom8Hy2DQqtY1CGSYAUNBCZseRkHklLUKDsvYcSzsn3wKU6Ehgw==
X-Received: by 2002:adf:b193:: with SMTP id q19mr16511915wra.78.1580751474533; 
	Mon, 03 Feb 2020 09:37:54 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	t131sm127241wmb.13.2020.02.03.09.37.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 09:37:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 3 Feb 2020 18:37:53 +0100
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20200203173753.dcrz2qokzecl4bsx@jama>
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
	<e6b6484beb730f63714567d89da06834fbbbbd3c.1580248809.git.bruce.ashfield@gmail.com>
	<CAMKF1so3M-Zza8Oz54Z=pXmykU4686nKWL3JLK8f-bBde-ueiA@mail.gmail.com>
	<CA+chaQehJEiOLysVA8Sf86tGJ-cVmr+Z7FsPt0LGHLEMQLzEtQ@mail.gmail.com>
	<CAMKF1srWkwKOAeP2+nxmuyMCO40zZ6Q5U9s04i8fhoFyLXPr9A@mail.gmail.com>
	<CADkTA4PO7OL0MsE39imy+C9R1gGSLJyBGGRiYWs05w3oJuAMdA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4PO7OL0MsE39imy+C9R1gGSLJyBGGRiYWs05w3oJuAMdA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-yocto: introduce 5.4 recipes
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
X-List-Received-Date: Mon, 03 Feb 2020 17:37:56 -0000
X-Groupsio-MsgNum: 134453
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xrwaqawu47e4hbgm"
Content-Disposition: inline

--xrwaqawu47e4hbgm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 12:11:31PM -0500, Bruce Ashfield wrote:
> On Mon, Feb 3, 2020 at 11:45 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On Mon, Feb 3, 2020 at 8:42 AM Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >>
> >> It fails to build with gold enabled (ld-is-gold in DISTRO_FEATURES)
> >>
> >> First olddefconfig fails with "gold linker 'x86_64-oe-linux-ld' not su=
pported" and then it fails with a bit misleading error about oldnoconfig (w=
hich is called only when oddefconfig fails) and then the whole log repeats =
itself again, whole log.do_configure.4075 follows:
> >
> >
> > Since it=E2=80=99s a kernel piece I think asking for gold might be out =
of scope perhaps
> >
>=20
> Yah, there's not much we can do to fix that, but I suppose it could be
> detected in the bbclass and a better error thrown ?
>=20
> > I have staged a fix in master next which helps a bit with eg mips I had=
 to disable bpf
>=20
> Is that the one with the missing header for on-target module build ?
> If so, i have a similar patch here.

Do you have a fix for do_kernel_configcheck as well somewhere?

I'm seeing a lot of warnings in default linux-yocto build for
qemux86-64 and the log.do_kernel_configcheck starts with long list of
missing python since python was removed from HOSTTOOLS.


DEBUG: Executing python function do_kernel_configcheck
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
/usr/bin/env: 'python': No such file or directory
[mismatch (291)]: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel=
-source/.kernel-meta/cfg/mismatch.txt
   There were hardware options requested that do not
   have a corresponding value present in the final ".config" file.
   This probably means you aren't getting the config you wanted.

WARNING: [kernel config]: specified values did not make it into the kernel'=
s final configuration:

---------- CONFIG_MCORE2 -----------------
Config: CONFIG_MCORE2
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc-64/common-pc-64-cpu.cfg
Requested value:  CONFIG_MCORE2=3Dy
Actual value:     # CONFIG_MCORE2 is not set


---------- CONFIG_ATA -----------------
Config: CONFIG_ATA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA=3Dy
Actual value:     # CONFIG_ATA is not set

Config: CONFIG_ATA_ACPI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_ACPI=3Dy
Actual value:    =20

Config: CONFIG_ATA_SFF
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_SFF=3Dy
Actual value:    =20

Config: CONFIG_ATA_BMDMA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_BMDMA=3Dy
Actual value:    =20

Config: CONFIG_ATA_PIIX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_PIIX=3Dm
Actual value:    =20


---------- CONFIG_ATA_ACPI -----------------
Config: CONFIG_ATA_ACPI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_ACPI=3Dy
Actual value:    =20


---------- CONFIG_ATA_SFF -----------------
Config: CONFIG_ATA_SFF
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_SFF=3Dy
Actual value:    =20


---------- CONFIG_ATA_BMDMA -----------------
Config: CONFIG_ATA_BMDMA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_BMDMA=3Dy
Actual value:    =20


---------- CONFIG_ATA_PIIX -----------------
Config: CONFIG_ATA_PIIX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_ATA_PIIX=3Dm
Actual value:    =20


---------- CONFIG_PATA_SCH -----------------
Config: CONFIG_PATA_SCH
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_PATA_SCH=3Dy
Actual value:    =20


---------- CONFIG_INPUT_MOUSEDEV -----------------
Config: CONFIG_INPUT_MOUSEDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_INPUT_MOUSEDEV=3Dy
Actual value:     # CONFIG_INPUT_MOUSEDEV is not set


---------- CONFIG_INPUT_EVDEV -----------------
Config: CONFIG_INPUT_EVDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/input/input.cfg /OE/build/oe-core=
/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/s=
tandard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_INPUT_EVDEV=3Dy
Actual value:     # CONFIG_INPUT_EVDEV is not set


---------- CONFIG_INPUT_TABLET -----------------
Config: CONFIG_INPUT_TABLET
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_INPUT_TABLET=3Dy
Actual value:     # CONFIG_INPUT_TABLET is not set


---------- CONFIG_HID_WACOM -----------------
Config: CONFIG_HID_WACOM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_HID_WACOM=3Dy
Actual value:    =20


---------- CONFIG_RTC_CLASS -----------------
Config: CONFIG_RTC_CLASS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_RTC_CLASS=3Dy
Actual value:     # CONFIG_RTC_CLASS is not set


---------- CONFIG_RTC_DRV_CMOS -----------------
Config: CONFIG_RTC_DRV_CMOS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_RTC_DRV_CMOS=3Dy
Actual value:    =20


---------- CONFIG_SERIAL_8250_PNP -----------------
Config: CONFIG_SERIAL_8250_PNP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_SERIAL_8250_PNP=3Dy
Actual value:    =20


---------- CONFIG_PARPORT -----------------
Config: CONFIG_PARPORT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_PARPORT=3Dm
Actual value:     # CONFIG_PARPORT is not set

Config: CONFIG_PARPORT_PC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_PARPORT_PC=3Dm
Actual value:    =20


---------- CONFIG_PARPORT_PC -----------------
Config: CONFIG_PARPORT_PC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_PARPORT_PC=3Dm
Actual value:    =20


---------- CONFIG_PRINTER -----------------
Config: CONFIG_PRINTER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_PRINTER=3Dm
Actual value:    =20


---------- CONFIG_USB_HID -----------------
Config: CONFIG_USB_HID
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_HID=3Dy
Actual value:    =20

Config: CONFIG_USB_HIDDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_HIDDEV=3Dy
Actual value:    =20


---------- CONFIG_USB_HIDDEV -----------------
Config: CONFIG_USB_HIDDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_HIDDEV=3Dy
Actual value:    =20


---------- CONFIG_USB_SERIAL -----------------
Config: CONFIG_USB_SERIAL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL=3Dy
Actual value:    =20

Config: CONFIG_USB_SERIAL_CONSOLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_CONSOLE=3Dy
Actual value:    =20

--
Config: CONFIG_USB_SERIAL_GENERIC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_GENERIC=3Dy
Actual value:    =20

Config: CONFIG_USB_SERIAL_FTDI_SIO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_FTDI_SIO=3Dy
Actual value:    =20

Config: CONFIG_USB_SERIAL_PL2303
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_PL2303=3Dy
Actual value:    =20


---------- CONFIG_USB_SERIAL_CONSOLE -----------------
Config: CONFIG_USB_SERIAL_CONSOLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_CONSOLE=3Dy
Actual value:    =20


---------- CONFIG_USB_EZUSB_FX2 -----------------
Config: CONFIG_USB_EZUSB_FX2
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_EZUSB_FX2=3Dy
Actual value:    =20


---------- CONFIG_USB_SERIAL_GENERIC -----------------
Config: CONFIG_USB_SERIAL_GENERIC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_GENERIC=3Dy
Actual value:    =20


---------- CONFIG_USB_SERIAL_FTDI_SIO -----------------
Config: CONFIG_USB_SERIAL_FTDI_SIO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_FTDI_SIO=3Dy
Actual value:    =20


---------- CONFIG_USB_SERIAL_PL2303 -----------------
Config: CONFIG_USB_SERIAL_PL2303
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_USB_SERIAL_PL2303=3Dy
Actual value:    =20


---------- CONFIG_I2C_I801 -----------------
Config: CONFIG_I2C_I801
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_I2C_I801=3Dy
Actual value:    =20


---------- CONFIG_IDE -----------------
Config: CONFIG_IDE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_IDE=3Dy
Actual value:     # CONFIG_IDE is not set

Config: CONFIG_IDE_GD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_IDE_GD=3Dy
Actual value:    =20

Config: CONFIG_IDE_GD_ATA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_IDE_GD_ATA=3Dy
Actual value:    =20


---------- CONFIG_IDE_GD -----------------
Config: CONFIG_IDE_GD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_IDE_GD=3Dy
Actual value:    =20

Config: CONFIG_IDE_GD_ATA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_IDE_GD_ATA=3Dy
Actual value:    =20


---------- CONFIG_IDE_GD_ATA -----------------
Config: CONFIG_IDE_GD_ATA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_IDE_GD_ATA=3Dy
Actual value:    =20


---------- CONFIG_BLK_DEV_PIIX -----------------
Config: CONFIG_BLK_DEV_PIIX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_BLK_DEV_PIIX=3Dy
Actual value:    =20


---------- CONFIG_SATA_AHCI -----------------
Config: CONFIG_SATA_AHCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_SATA_AHCI=3Dy
Actual value:    =20


---------- CONFIG_BLK_DEV_FD -----------------
Config: CONFIG_BLK_DEV_FD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_BLK_DEV_FD=3Dm
Actual value:     # CONFIG_BLK_DEV_FD is not set


---------- CONFIG_EEPROM_AT24 -----------------
Config: CONFIG_EEPROM_AT24
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_EEPROM_AT24=3Dm
Actual value:    =20


---------- CONFIG_NVME_CORE -----------------
Config: CONFIG_NVME_CORE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_NVME_CORE=3Dy
Actual value:    =20


---------- CONFIG_BLK_DEV_NVME -----------------
Config: CONFIG_BLK_DEV_NVME
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_BLK_DEV_NVME=3Dy
Actual value:    =20


---------- CONFIG_NET_CORE -----------------
Config: CONFIG_NET_CORE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_CORE=3Dy
Actual value:    =20


---------- CONFIG_ETHERNET -----------------
Config: CONFIG_ETHERNET
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ETHERNET=3Dy
Actual value:    =20


---------- CONFIG_NET_VENDOR_3COM -----------------
Config: CONFIG_NET_VENDOR_3COM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_3COM=3Dy
Actual value:    =20


---------- CONFIG_TYPHOON -----------------
Config: CONFIG_TYPHOON
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_TYPHOON=3Dm
Actual value:    =20


---------- CONFIG_NET_VENDOR_BROADCOM -----------------
Config: CONFIG_NET_VENDOR_BROADCOM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_BROADCOM=3Dy
Actual value:    =20


---------- CONFIG_TIGON3 -----------------
Config: CONFIG_TIGON3
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_TIGON3=3Dm
Actual value:    =20


---------- CONFIG_BNX2X -----------------
Config: CONFIG_BNX2X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_BNX2X=3Dm
Actual value:    =20

Config: CONFIG_BNX2X_SRIOV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_BNX2X_SRIOV=3Dy
Actual value:    =20


---------- CONFIG_BNX2X_SRIOV -----------------
Config: CONFIG_BNX2X_SRIOV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_BNX2X_SRIOV=3Dy
Actual value:    =20


---------- CONFIG_BNXT -----------------
Config: CONFIG_BNXT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_BNXT=3Dm
Actual value:    =20

Config: CONFIG_BNXT_SRIOV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_BNXT_SRIOV=3Dy
Actual value:    =20


---------- CONFIG_BNXT_SRIOV -----------------
Config: CONFIG_BNXT_SRIOV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_BNXT_SRIOV=3Dy
Actual value:    =20


---------- CONFIG_NET_VENDOR_ATHEROS -----------------
Config: CONFIG_NET_VENDOR_ATHEROS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_ATHEROS=3Dy
Actual value:    =20


---------- CONFIG_ATL1 -----------------
Config: CONFIG_ATL1
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ATL1=3Dm
Actual value:    =20

Config: CONFIG_ATL1C
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ATL1C=3Dm
Actual value:    =20

Config: CONFIG_ATL1E
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ATL1E=3Dm
Actual value:    =20


---------- CONFIG_ATL1C -----------------
Config: CONFIG_ATL1C
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ATL1C=3Dm
Actual value:    =20


---------- CONFIG_ATL1E -----------------
Config: CONFIG_ATL1E
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ATL1E=3Dm
Actual value:    =20


---------- CONFIG_ATL2 -----------------
Config: CONFIG_ATL2
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ATL2=3Dm
Actual value:    =20


---------- CONFIG_ALX -----------------
Config: CONFIG_ALX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_ALX=3Dm
Actual value:    =20


---------- CONFIG_NET_VENDOR_INTEL -----------------
Config: CONFIG_NET_VENDOR_INTEL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_INTEL=3Dy
Actual value:    =20


---------- CONFIG_NET_VENDOR_AMD -----------------
Config: CONFIG_NET_VENDOR_AMD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_AMD=3Dy
Actual value:    =20


---------- CONFIG_PCNET32 -----------------
Config: CONFIG_PCNET32
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_PCNET32=3Dm
Actual value:    =20


---------- CONFIG_NET_VENDOR_REALTEK -----------------
Config: CONFIG_NET_VENDOR_REALTEK
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_REALTEK=3Dy
Actual value:    =20


---------- CONFIG_8139CP -----------------
Config: CONFIG_8139CP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_8139CP=3Dm
Actual value:    =20


---------- CONFIG_8139TOO -----------------
Config: CONFIG_8139TOO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_8139TOO=3Dm
Actual value:    =20


---------- CONFIG_R8169 -----------------
Config: CONFIG_R8169
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_R8169=3Dm
Actual value:    =20


---------- CONFIG_NET_VENDOR_DLINK -----------------
Config: CONFIG_NET_VENDOR_DLINK
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_DLINK=3Dy
Actual value:    =20


---------- CONFIG_DL2K -----------------
Config: CONFIG_DL2K
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_DL2K=3Dm
Actual value:    =20


---------- CONFIG_NET_VENDOR_MARVELL -----------------
Config: CONFIG_NET_VENDOR_MARVELL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_NET_VENDOR_MARVELL=3Dy
Actual value:    =20


---------- CONFIG_SKGE -----------------
Config: CONFIG_SKGE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_SKGE=3Dm
Actual value:    =20


---------- CONFIG_SKY2 -----------------
Config: CONFIG_SKY2
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_SKY2=3Dm
Actual value:    =20


---------- CONFIG_JME -----------------
Config: CONFIG_JME
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Requested value:  CONFIG_JME=3Dm
Actual value:    =20


---------- CONFIG_FB_MODE_HELPERS -----------------
Config: CONFIG_FB_MODE_HELPERS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Requested value:  CONFIG_FB_MODE_HELPERS=3Dy
Actual value:    =20


---------- CONFIG_CONNECTOR -----------------
Config: CONFIG_CONNECTOR
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Requested value:  CONFIG_CONNECTOR=3Dy
Actual value:    =20


---------- CONFIG_FB_UVESA -----------------
Config: CONFIG_FB_UVESA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Requested value:  CONFIG_FB_UVESA=3Dm
Actual value:    =20


---------- CONFIG_DRM_CIRRUS_QEMU -----------------
Config: CONFIG_DRM_CIRRUS_QEMU
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Requested value:  CONFIG_DRM_CIRRUS_QEMU=3Dm
Actual value:    =20


---------- CONFIG_WIRELESS -----------------
Config: CONFIG_WIRELESS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_WIRELESS=3Dy
Actual value:    =20


---------- CONFIG_WLAN -----------------
Config: CONFIG_WLAN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_WLAN=3Dy
Actual value:    =20

--
Config: CONFIG_WLAN_VENDOR_ATH
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_WLAN_VENDOR_ATH=3Dy
Actual value:    =20


---------- CONFIG_MAC80211 -----------------
Config: CONFIG_MAC80211
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_MAC80211=3Dm
Actual value:    =20


---------- CONFIG_CFG80211 -----------------
Config: CONFIG_CFG80211
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_CFG80211=3Dm
Actual value:    =20

--
Config: CONFIG_CFG80211_WEXT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_CFG80211_WEXT=3Dy
Actual value:    =20


---------- CONFIG_ATH_COMMON -----------------
Config: CONFIG_ATH_COMMON
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_ATH_COMMON=3Dm
Actual value:    =20


---------- CONFIG_WLAN_VENDOR_ATH -----------------
Config: CONFIG_WLAN_VENDOR_ATH
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_WLAN_VENDOR_ATH=3Dy
Actual value:    =20


---------- CONFIG_ATH5K -----------------
Config: CONFIG_ATH5K
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_ATH5K=3Dm
Actual value:    =20


---------- CONFIG_ATH9K -----------------
Config: CONFIG_ATH9K
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_ATH9K=3Dm
Actual value:    =20


---------- CONFIG_WEXT_CORE -----------------
Config: CONFIG_WEXT_CORE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_WEXT_CORE=3Dy
Actual value:    =20


---------- CONFIG_WEXT_PROC -----------------
Config: CONFIG_WEXT_PROC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_WEXT_PROC=3Dy
Actual value:    =20


---------- CONFIG_CFG80211_WEXT -----------------
Config: CONFIG_CFG80211_WEXT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_CFG80211_WEXT=3Dy
Actual value:    =20


---------- CONFIG_BCMA -----------------
Config: CONFIG_BCMA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA=3Dm
Actual value:     # CONFIG_BCMA is not set

Config: CONFIG_BCMA_HOST_PCI_POSSIBLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
Actual value:    =20

Config: CONFIG_BCMA_HOST_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA_HOST_PCI=3Dy
Actual value:    =20

Config: CONFIG_BCMA_DRIVER_GMAC_CMN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
Actual value:    =20


---------- CONFIG_BCMA_HOST_PCI_POSSIBLE -----------------
Config: CONFIG_BCMA_HOST_PCI_POSSIBLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
Actual value:    =20


---------- CONFIG_BCMA_HOST_PCI -----------------
Config: CONFIG_BCMA_HOST_PCI_POSSIBLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
Actual value:    =20

Config: CONFIG_BCMA_HOST_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA_HOST_PCI=3Dy
Actual value:    =20


---------- CONFIG_BCMA_DRIVER_GMAC_CMN -----------------
Config: CONFIG_BCMA_DRIVER_GMAC_CMN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
Actual value:    =20


---------- CONFIG_CRC8 -----------------
Config: CONFIG_CRC8
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_CRC8=3Dm
Actual value:     # CONFIG_CRC8 is not set


---------- CONFIG_CORDIC -----------------
Config: CONFIG_CORDIC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Requested value:  CONFIG_CORDIC=3Dm
Actual value:     # CONFIG_CORDIC is not set


---------- CONFIG_PARTITION_ADVANCED -----------------
Config: CONFIG_PARTITION_ADVANCED
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
Requested value:  CONFIG_PARTITION_ADVANCED=3Dy
Actual value:     # CONFIG_PARTITION_ADVANCED is not set


---------- CONFIG_FB_EFI -----------------
Config: CONFIG_FB_EFI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
Requested value:  CONFIG_FB_EFI=3Dy
Actual value:    =20


---------- CONFIG_EFI_VARS -----------------
Config: CONFIG_EFI_VARS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
Requested value:  CONFIG_EFI_VARS=3Dm
Actual value:    =20


---------- CONFIG_EFI -----------------
Config: CONFIG_EFI_VARS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
Requested value:  CONFIG_EFI_VARS=3Dm
Actual value:    =20

Config: CONFIG_EFI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/wo=
rk-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg/e=
fi.cfg
Requested value:  CONFIG_EFI=3Dy
Actual value:     # CONFIG_EFI is not set

Config: CONFIG_EFI_STUB
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/wo=
rk-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg/e=
fi.cfg
Requested value:  CONFIG_EFI_STUB=3Dy
Actual value:    =20

Config: CONFIG_EFIVAR_FS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/wo=
rk-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg/e=
fi.cfg
Requested value:  CONFIG_EFIVAR_FS=3Dy
Actual value:    =20

--
Config: CONFIG_EFI_EARLYCON
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/debug/printk.cfg
Requested value:  CONFIG_EFI_EARLYCON=3Dy
Actual value:    =20


---------- CONFIG_EFI_STUB -----------------
Config: CONFIG_EFI_STUB
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/wo=
rk-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg/e=
fi.cfg
Requested value:  CONFIG_EFI_STUB=3Dy
Actual value:    =20


---------- CONFIG_EFIVAR_FS -----------------
Config: CONFIG_EFIVAR_FS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/wo=
rk-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg/e=
fi.cfg
Requested value:  CONFIG_EFIVAR_FS=3Dy
Actual value:    =20


---------- CONFIG_HPET_EMULATE_RTC -----------------
Config: CONFIG_HPET_EMULATE_RTC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
Requested value:  CONFIG_HPET_EMULATE_RTC=3Dy
Actual value:    =20


---------- CONFIG_HPET -----------------
Config: CONFIG_HPET_EMULATE_RTC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
Requested value:  CONFIG_HPET_EMULATE_RTC=3Dy
Actual value:    =20

Config: CONFIG_HPET
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
Requested value:  CONFIG_HPET=3Dy
Actual value:     # CONFIG_HPET is not set

Config: CONFIG_HPET_MMAP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
Requested value:  CONFIG_HPET_MMAP=3Dy
Actual value:    =20


---------- CONFIG_HPET_MMAP -----------------
Config: CONFIG_HPET_MMAP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
Requested value:  CONFIG_HPET_MMAP=3Dy
Actual value:    =20


---------- CONFIG_X86_MSR -----------------
Config: CONFIG_X86_MSR
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/x86_base.cfg
Requested value:  CONFIG_X86_MSR=3Dy
Actual value:     # CONFIG_X86_MSR is not set


---------- CONFIG_X86_CPUID -----------------
Config: CONFIG_X86_CPUID
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/x86_base.cfg
Requested value:  CONFIG_X86_CPUID=3Dy
Actual value:     # CONFIG_X86_CPUID is not set


---------- CONFIG_X86_CHECK_BIOS_CORRUPTION -----------------
Config: CONFIG_X86_CHECK_BIOS_CORRUPTION
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/x86_base.cfg
Requested value:  CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
Actual value:     # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set


---------- CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK -----------------
Config: CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/x86_base.cfg
Requested value:  CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=3Dy
Actual value:    =20


---------- CONFIG_SMP -----------------
Config: CONFIG_SMP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/smp_64.cfg
Requested value:  CONFIG_SMP=3Dy
Actual value:     # CONFIG_SMP is not set


---------- CONFIG_SCHED_SMT -----------------
Config: CONFIG_SCHED_SMT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/smp_64.cfg
Requested value:  CONFIG_SCHED_SMT=3Dy
Actual value:    =20


---------- CONFIG_NR_CPUS -----------------
Config: CONFIG_NR_CPUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc-64/common-pc-64-cpu.cfg /OE/=
build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/c=
onfigs/v5.4/standard/cfg/smp_64.cfg
Requested value:  CONFIG_NR_CPUS=3D64
Actual value:     CONFIG_NR_CPUS=3D1


---------- CONFIG_IA32_EMULATION -----------------
Config: CONFIG_IA32_EMULATION
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc-64/common-pc-64-cpu.cfg /OE/=
build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/c=
onfigs/v5.4/standard/cfg/x86_64.cfg
Requested value:  CONFIG_IA32_EMULATION=3Dy
Actual value:     # CONFIG_IA32_EMULATION is not set


---------- CONFIG_COMPAT -----------------
Config: CONFIG_COMPAT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/x86_64.cfg
Requested value:  CONFIG_COMPAT=3Dy
Actual value:    =20


---------- CONFIG_UNWINDER_ORC -----------------
Config: CONFIG_UNWINDER_ORC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/x86_64.cfg
Requested value:  # CONFIG_UNWINDER_ORC is not set
Actual value:     CONFIG_UNWINDER_ORC=3Dy


---------- CONFIG_UNWINDER_FRAME_POINTER -----------------
Config: CONFIG_UNWINDER_FRAME_POINTER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/x86_64.cfg
Requested value:  CONFIG_UNWINDER_FRAME_POINTER=3Dy
Actual value:     # CONFIG_UNWINDER_FRAME_POINTER is not set


---------- CONFIG_X86_AMD_PLATFORM_DEVICE -----------------
Config: CONFIG_X86_AMD_PLATFORM_DEVICE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/amd.cfg
Requested value:  CONFIG_X86_AMD_PLATFORM_DEVICE=3Dy
Actual value:     # CONFIG_X86_AMD_PLATFORM_DEVICE is not set


---------- CONFIG_MICROCODE_AMD -----------------
Config: CONFIG_MICROCODE_AMD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/amd.cfg
Requested value:  CONFIG_MICROCODE_AMD=3Dy
Actual value:     # CONFIG_MICROCODE_AMD is not set


---------- CONFIG_X86_MCE_AMD -----------------
Config: CONFIG_X86_MCE_AMD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/amd.cfg
Requested value:  CONFIG_X86_MCE_AMD=3Dy
Actual value:    =20


---------- CONFIG_PCI -----------------
Config: CONFIG_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg /OE/build=
/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/config=
s/v5.4/standard/cfg/efi.cfg /OE/build/oe-core/tmp-glibc/work-shared/qemux86=
-64/kernel-source/.kernel-meta/configs/v5.4/standard/cfg/efi.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_PCI=3Dy
Actual value:     # CONFIG_PCI is not set

Config: CONFIG_PCI_MMCONFIG
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_PCI_MMCONFIG=3Dy
Actual value:    =20

Config: CONFIG_PCI_MSI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_PCI_MSI=3Dy
Actual value:    =20

Config: CONFIG_PCIEPORTBUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_PCIEPORTBUS=3Dy
Actual value:    =20

--
Config: CONFIG_PCI_IOV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci-iov/pci-iov.cfg
Requested value:  CONFIG_PCI_IOV=3Dy
Actual value:    =20


---------- CONFIG_PCI_MMCONFIG -----------------
Config: CONFIG_PCI_MMCONFIG
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_PCI_MMCONFIG=3Dy
Actual value:    =20


---------- CONFIG_PCI_MSI -----------------
Config: CONFIG_PCI_MSI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_PCI_MSI=3Dy
Actual value:    =20


---------- CONFIG_PCIEPORTBUS -----------------
Config: CONFIG_PCIEPORTBUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_PCIEPORTBUS=3Dy
Actual value:    =20


---------- CONFIG_HOTPLUG_PCI -----------------
Config: CONFIG_HOTPLUG_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Requested value:  CONFIG_HOTPLUG_PCI=3Dy
Actual value:    =20


---------- CONFIG_PCI_IOV -----------------
Config: CONFIG_PCI_IOV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/pci-iov/pci-iov.cfg
Requested value:  CONFIG_PCI_IOV=3Dy
Actual value:    =20


---------- CONFIG_MMC -----------------
Config: CONFIG_MMC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-base.cfg /OE/build/oe-cor=
e/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/=
standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC=3Dy
Actual value:     # CONFIG_MMC is not set

Config: CONFIG_MMC_SDHCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI=3Dy
Actual value:    =20

Config: CONFIG_MMC_SDHCI_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_PCI=3Dy
Actual value:    =20

Config: CONFIG_MMC_SDHCI_ACPI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_ACPI=3Dy
Actual value:    =20

Config: CONFIG_MMC_SDHCI_PLTFM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_PLTFM=3Dy
Actual value:    =20

Config: CONFIG_MMC_RICOH_MMC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_RICOH_MMC=3Dy
Actual value:    =20


---------- CONFIG_MMC_SDHCI -----------------
Config: CONFIG_MMC_SDHCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI=3Dy
Actual value:    =20

Config: CONFIG_MMC_SDHCI_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_PCI=3Dy
Actual value:    =20

Config: CONFIG_MMC_SDHCI_ACPI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_ACPI=3Dy
Actual value:    =20

Config: CONFIG_MMC_SDHCI_PLTFM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_PLTFM=3Dy
Actual value:    =20


---------- CONFIG_MMC_SDHCI_PCI -----------------
Config: CONFIG_MMC_SDHCI_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_PCI=3Dy
Actual value:    =20


---------- CONFIG_MMC_SDHCI_ACPI -----------------
Config: CONFIG_MMC_SDHCI_ACPI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_ACPI=3Dy
Actual value:    =20


---------- CONFIG_MMC_SDHCI_PLTFM -----------------
Config: CONFIG_MMC_SDHCI_PLTFM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_SDHCI_PLTFM=3Dy
Actual value:    =20


---------- CONFIG_MMC_RICOH_MMC -----------------
Config: CONFIG_MMC_RICOH_MMC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Requested value:  CONFIG_MMC_RICOH_MMC=3Dy
Actual value:    =20


---------- CONFIG_USB_EHCI_HCD -----------------
Config: CONFIG_USB_EHCI_HCD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb/ehci-hcd.cfg
Requested value:  CONFIG_USB_EHCI_HCD=3Dy
Actual value:    =20


---------- CONFIG_USB_EHCI_ROOT_HUB_TT -----------------
Config: CONFIG_USB_EHCI_ROOT_HUB_TT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb/ehci-hcd.cfg
Requested value:  CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
Actual value:    =20


---------- CONFIG_USB_OHCI_HCD -----------------
Config: CONFIG_USB_OHCI_HCD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb/ohci-hcd.cfg
Requested value:  CONFIG_USB_OHCI_HCD=3Dy
Actual value:    =20


---------- CONFIG_USB_XHCI_HCD -----------------
Config: CONFIG_USB_XHCI_HCD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb/xhci-hcd.cfg
Requested value:  CONFIG_USB_XHCI_HCD=3Dy
Actual value:    =20


---------- CONFIG_INPUT_TOUCHSCREEN -----------------
Config: CONFIG_INPUT_TOUCHSCREEN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/input/touchscreen.cfg
Requested value:  CONFIG_INPUT_TOUCHSCREEN=3Dy
Actual value:     # CONFIG_INPUT_TOUCHSCREEN is not set


---------- CONFIG_TOUCHSCREEN_USB_COMPOSITE -----------------
Config: CONFIG_TOUCHSCREEN_USB_COMPOSITE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb/touchscreen-composite.cfg
Requested value:  CONFIG_TOUCHSCREEN_USB_COMPOSITE=3Dm
Actual value:    =20


---------- CONFIG_USB_USBNET -----------------
Config: CONFIG_USB_USBNET
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_USBNET=3Dm
Actual value:    =20


---------- CONFIG_USB_NET_DRIVERS -----------------
Config: CONFIG_USB_NET_DRIVERS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_DRIVERS=3Dm
Actual value:    =20


---------- CONFIG_USB_KAWETH -----------------
Config: CONFIG_USB_KAWETH
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_KAWETH=3Dm
Actual value:    =20


---------- CONFIG_USB_PEGASUS -----------------
Config: CONFIG_USB_PEGASUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_PEGASUS=3Dm
Actual value:    =20


---------- CONFIG_USB_RTL8150 -----------------
Config: CONFIG_USB_RTL8150
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_RTL8150=3Dm
Actual value:    =20


---------- CONFIG_USB_RTL8152 -----------------
Config: CONFIG_USB_RTL8152
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_RTL8152=3Dm
Actual value:    =20


---------- CONFIG_USB_NET_AX8817X -----------------
Config: CONFIG_USB_NET_AX8817X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_AX8817X=3Dm
Actual value:    =20


---------- CONFIG_USB_NET_AX88179_178A -----------------
Config: CONFIG_USB_NET_AX88179_178A
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_AX88179_178A=3Dm
Actual value:    =20


---------- CONFIG_USB_NET_CDCETHER -----------------
Config: CONFIG_USB_NET_CDCETHER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_CDCETHER=3Dm
Actual value:    =20


---------- CONFIG_USB_NET_CDC_EEM -----------------
Config: CONFIG_USB_NET_CDC_EEM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_CDC_EEM=3Dm
Actual value:    =20


---------- CONFIG_USB_NET_CDC_NCM -----------------
Config: CONFIG_USB_NET_CDC_NCM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_CDC_NCM=3Dm
Actual value:    =20


---------- CONFIG_USB_NET_DM9601 -----------------
Config: CONFIG_USB_NET_DM9601
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_DM9601=3Dm
Actual value:    =20


---------- CONFIG_USB_NET_SMSC75XX -----------------
Config: CONFIG_USB_NET_SMSC75XX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_SMSC75XX=3Dm
Actual value:    =20


---------- CONFIG_USB_NET_SMSC95XX -----------------
Config: CONFIG_USB_NET_SMSC95XX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_SMSC95XX=3Dm
Actual value:    =20


---------- CONFIG_USB_NET_MCS7830 -----------------
Config: CONFIG_USB_NET_MCS7830
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_MCS7830=3Dm
Actual value:    =20


---------- CONFIG_USB_NET_RNDIS_HOST -----------------
Config: CONFIG_USB_NET_RNDIS_HOST
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_RNDIS_HOST=3Dm
Actual value:    =20


---------- CONFIG_USB_NET_CDC_SUBSET_ENABLE -----------------
Config: CONFIG_USB_NET_CDC_SUBSET_ENABLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_CDC_SUBSET_ENABLE=3Dm
Actual value:    =20


---------- CONFIG_USB_NET_CDC_SUBSET -----------------
Config: CONFIG_USB_NET_CDC_SUBSET_ENABLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_CDC_SUBSET_ENABLE=3Dm
Actual value:    =20

Config: CONFIG_USB_NET_CDC_SUBSET
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_NET_CDC_SUBSET=3Dm
Actual value:    =20


---------- CONFIG_USB_ALI_M5632 -----------------
Config: CONFIG_USB_ALI_M5632
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_ALI_M5632=3Dy
Actual value:    =20


---------- CONFIG_USB_AN2720 -----------------
Config: CONFIG_USB_AN2720
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_AN2720=3Dy
Actual value:    =20


---------- CONFIG_USB_BELKIN -----------------
Config: CONFIG_USB_BELKIN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_BELKIN=3Dy
Actual value:    =20


---------- CONFIG_USB_ARMLINUX -----------------
Config: CONFIG_USB_ARMLINUX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_ARMLINUX=3Dy
Actual value:    =20


---------- CONFIG_USB_KC2190 -----------------
Config: CONFIG_USB_KC2190
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Requested value:  CONFIG_USB_KC2190=3Dy
Actual value:    =20


---------- CONFIG_E100 -----------------
Config: CONFIG_E100
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/features/intel-e1xxxx/intel-e100.cfg /OE/build/oe-core/tmp-g=
libc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standar=
d/features/intel-e1xxxx/intel-e1xxxx.cfg
Requested value:  CONFIG_E100=3Dy
Actual value:    =20

Config: CONFIG_E1000E
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
Requested value:  CONFIG_E1000E=3Dy
Actual value:    =20

Config: CONFIG_E1000
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
Requested value:  CONFIG_E1000=3Dy
Actual value:    =20


---------- CONFIG_E1000E -----------------
Config: CONFIG_E1000E
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
Requested value:  CONFIG_E1000E=3Dy
Actual value:    =20


---------- CONFIG_E1000 -----------------
Config: CONFIG_E1000E
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
Requested value:  CONFIG_E1000E=3Dy
Actual value:    =20

Config: CONFIG_E1000
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/features/intel-e1xxxx/intel-e1xxxx.cfg
Requested value:  CONFIG_E1000=3Dy
Actual value:    =20


---------- CONFIG_IGB -----------------
Config: CONFIG_IGB
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/igb/igb.cfg
Requested value:  CONFIG_IGB=3Dy
Actual value:    =20

Config: CONFIG_IGBVF
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/igb/igb.cfg
Requested value:  CONFIG_IGBVF=3Dm
Actual value:    =20


---------- CONFIG_IGBVF -----------------
Config: CONFIG_IGBVF
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/igb/igb.cfg
Requested value:  CONFIG_IGBVF=3Dm
Actual value:    =20


---------- CONFIG_IRQ_REMAP -----------------
Config: CONFIG_IRQ_REMAP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/x2apic/x2apic.cfg
Requested value:  CONFIG_IRQ_REMAP=3Dy
Actual value:    =20


---------- CONFIG_X86_X2APIC -----------------
Config: CONFIG_X86_X2APIC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/x2apic/x2apic.cfg
Requested value:  CONFIG_X86_X2APIC=3Dy
Actual value:    =20


---------- CONFIG_ISDN -----------------
Config: CONFIG_ISDN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_ISDN=3Dy
Actual value:    =20

Config: CONFIG_ISDN_CAPI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_ISDN_CAPI=3Dm
Actual value:    =20


---------- CONFIG_ISDN_CAPI -----------------
Config: CONFIG_ISDN_CAPI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_ISDN_CAPI=3Dm
Actual value:    =20


---------- CONFIG_BT_6LOWPAN -----------------
Config: CONFIG_BT_6LOWPAN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_6LOWPAN=3Dm
Actual value:    =20


---------- CONFIG_BT_RFCOMM -----------------
Config: CONFIG_BT_RFCOMM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_RFCOMM=3Dm
Actual value:    =20

Config: CONFIG_BT_RFCOMM_TTY
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_RFCOMM_TTY=3Dy
Actual value:    =20


---------- CONFIG_BT_RFCOMM_TTY -----------------
Config: CONFIG_BT_RFCOMM_TTY
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_RFCOMM_TTY=3Dy
Actual value:    =20


---------- CONFIG_BT_BNEP -----------------
Config: CONFIG_BT_BNEP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_BNEP=3Dm
Actual value:    =20

Config: CONFIG_BT_BNEP_MC_FILTER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_BNEP_MC_FILTER=3Dy
Actual value:    =20

Config: CONFIG_BT_BNEP_PROTO_FILTER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_BNEP_PROTO_FILTER=3Dy
Actual value:    =20


---------- CONFIG_BT_BNEP_MC_FILTER -----------------
Config: CONFIG_BT_BNEP_MC_FILTER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_BNEP_MC_FILTER=3Dy
Actual value:    =20


---------- CONFIG_BT_BNEP_PROTO_FILTER -----------------
Config: CONFIG_BT_BNEP_PROTO_FILTER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_BNEP_PROTO_FILTER=3Dy
Actual value:    =20


---------- CONFIG_BT_CMTP -----------------
Config: CONFIG_BT_CMTP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_CMTP=3Dm
Actual value:    =20


---------- CONFIG_BT_HIDP -----------------
Config: CONFIG_BT_HIDP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_HIDP=3Dm
Actual value:    =20


---------- CONFIG_BT_LE -----------------
Config: CONFIG_BT_LE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_LE=3Dy
Actual value:    =20


---------- CONFIG_BT_BREDR -----------------
Config: CONFIG_BT_BREDR
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Requested value:  CONFIG_BT_BREDR=3Dy
Actual value:    =20


---------- CONFIG_6LOWPAN -----------------
Config: CONFIG_6LOWPAN
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/6lowpan/6lowpan.cfg
Requested value:  CONFIG_6LOWPAN=3Dm
Actual value:    =20


---------- CONFIG_SERIAL_8250 -----------------
Config: CONFIG_SERIAL_8250_PNP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_SERIAL_8250_PNP=3Dy
Actual value:    =20

--
Config: CONFIG_SERIAL_8250
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/bu=
ild/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/con=
figs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250=3Dy
Actual value:     # CONFIG_SERIAL_8250 is not set

Config: CONFIG_SERIAL_8250_CONSOLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/bu=
ild/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/con=
figs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_CONSOLE=3Dy
Actual value:    =20

Config: CONFIG_SERIAL_8250_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/bu=
ild/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/con=
figs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_PCI=3Dy
Actual value:    =20

Config: CONFIG_SERIAL_8250_NR_UARTS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_NR_UARTS=3D4
Actual value:    =20

Config: CONFIG_SERIAL_8250_RUNTIME_UARTS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
Actual value:    =20


---------- CONFIG_SERIAL_8250_CONSOLE -----------------
Config: CONFIG_SERIAL_8250_CONSOLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/bu=
ild/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/con=
figs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_CONSOLE=3Dy
Actual value:    =20


---------- CONFIG_SERIAL_8250_PCI -----------------
Config: CONFIG_SERIAL_8250_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/bu=
ild/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/con=
figs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_PCI=3Dy
Actual value:    =20


---------- CONFIG_SERIAL_8250_NR_UARTS -----------------
Config: CONFIG_SERIAL_8250_NR_UARTS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_NR_UARTS=3D4
Actual value:    =20


---------- CONFIG_SERIAL_8250_RUNTIME_UARTS -----------------
Config: CONFIG_SERIAL_8250_RUNTIME_UARTS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
Actual value:    =20


---------- CONFIG_SERIAL_CORE -----------------
Config: CONFIG_SERIAL_CORE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_CORE=3Dy
Actual value:    =20

Config: CONFIG_SERIAL_CORE_CONSOLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_CORE_CONSOLE=3Dy
Actual value:    =20


---------- CONFIG_SERIAL_CORE_CONSOLE -----------------
Config: CONFIG_SERIAL_CORE_CONSOLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/8250.cfg
Requested value:  CONFIG_SERIAL_CORE_CONSOLE=3Dy
Actual value:    =20


---------- CONFIG_AGP -----------------
Config: CONFIG_AGP
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_AGP=3Dy
Actual value:    =20

Config: CONFIG_AGP_INTEL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_AGP_INTEL=3Dy
Actual value:    =20


---------- CONFIG_AGP_INTEL -----------------
Config: CONFIG_AGP_INTEL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_AGP_INTEL=3Dy
Actual value:    =20


---------- CONFIG_DRM_I915 -----------------
Config: CONFIG_DRM_I915
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_DRM_I915=3Dm
Actual value:    =20

Config: CONFIG_DRM_I915_ALPHA_SUPPORT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_DRM_I915_ALPHA_SUPPORT=3Dy
Actual value:    =20


---------- CONFIG_DRM_I915_ALPHA_SUPPORT -----------------
Config: CONFIG_DRM_I915_ALPHA_SUPPORT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_DRM_I915_ALPHA_SUPPORT=3Dy
Actual value:    =20


---------- CONFIG_BLK_DEV_SD -----------------
Config: CONFIG_BLK_DEV_SD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/scsi/disk.cfg
Requested value:  CONFIG_BLK_DEV_SD=3Dy
Actual value:    =20


---------- CONFIG_USB_VIDEO_CLASS -----------------
Config: CONFIG_USB_VIDEO_CLASS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_VIDEO_CLASS=3Dm
Actual value:    =20

Config: CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy
Actual value:    =20


---------- CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV -----------------
Config: CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy
Actual value:    =20


---------- CONFIG_USB_GSPCA -----------------
Config: CONFIG_USB_GSPCA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA=3Dm
Actual value:    =20

--
Config: CONFIG_USB_GSPCA_BENQ
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_BENQ=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_CONEX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_CONEX=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_CPIA1
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_CPIA1=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_ETOMS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_ETOMS=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_FINEPIX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_FINEPIX=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_JEILINJ
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_JEILINJ=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_JL2005BCD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_JL2005BCD=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_KINECT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_KINECT=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_KONICA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_KONICA=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_MARS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_MARS=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_MR97310A
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_MR97310A=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_NW80X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_NW80X=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_OV519
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_OV519=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_OV534
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_OV534=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_OV534_9
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_OV534_9=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_PAC207
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_PAC207=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_PAC7302
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_PAC7302=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_PAC7311
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_PAC7311=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SE401
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SE401=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SN9C2028
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SN9C2028=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SN9C20X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SN9C20X=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SONIXB
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SONIXB=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SONIXJ
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SONIXJ=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SPCA500
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA500=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SPCA501
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA501=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SPCA505
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA505=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SPCA506
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA506=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SPCA508
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA508=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SPCA561
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA561=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SPCA1528
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA1528=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SQ905
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SQ905=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SQ905C
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SQ905C=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SQ930X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SQ930X=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_STK014
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_STK014=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_STV0680
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_STV0680=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SUNPLUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SUNPLUS=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_T613
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_T613=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_TOPRO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_TOPRO=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_TV8532
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_TV8532=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_VC032X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_VC032X=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_VICAM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_VICAM=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_XIRLINK_CIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_XIRLINK_CIT=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_ZC3XX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_ZC3XX=3Dm
Actual value:    =20


---------- CONFIG_USB_M5602 -----------------
Config: CONFIG_USB_M5602
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_M5602=3Dm
Actual value:    =20


---------- CONFIG_USB_STV06XX -----------------
Config: CONFIG_USB_STV06XX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_STV06XX=3Dm
Actual value:    =20


---------- CONFIG_USB_GL860 -----------------
Config: CONFIG_USB_GL860
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GL860=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_BENQ -----------------
Config: CONFIG_USB_GSPCA_BENQ
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_BENQ=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_CONEX -----------------
Config: CONFIG_USB_GSPCA_CONEX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_CONEX=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_CPIA1 -----------------
Config: CONFIG_USB_GSPCA_CPIA1
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_CPIA1=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_ETOMS -----------------
Config: CONFIG_USB_GSPCA_ETOMS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_ETOMS=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_FINEPIX -----------------
Config: CONFIG_USB_GSPCA_FINEPIX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_FINEPIX=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_JEILINJ -----------------
Config: CONFIG_USB_GSPCA_JEILINJ
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_JEILINJ=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_JL2005BCD -----------------
Config: CONFIG_USB_GSPCA_JL2005BCD
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_JL2005BCD=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_KINECT -----------------
Config: CONFIG_USB_GSPCA_KINECT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_KINECT=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_KONICA -----------------
Config: CONFIG_USB_GSPCA_KONICA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_KONICA=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_MARS -----------------
Config: CONFIG_USB_GSPCA_MARS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_MARS=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_MR97310A -----------------
Config: CONFIG_USB_GSPCA_MR97310A
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_MR97310A=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_NW80X -----------------
Config: CONFIG_USB_GSPCA_NW80X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_NW80X=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_OV519 -----------------
Config: CONFIG_USB_GSPCA_OV519
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_OV519=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_OV534 -----------------
Config: CONFIG_USB_GSPCA_OV534
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_OV534=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_OV534_9
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_OV534_9=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_OV534_9 -----------------
Config: CONFIG_USB_GSPCA_OV534_9
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_OV534_9=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_PAC207 -----------------
Config: CONFIG_USB_GSPCA_PAC207
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_PAC207=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_PAC7302 -----------------
Config: CONFIG_USB_GSPCA_PAC7302
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_PAC7302=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_PAC7311 -----------------
Config: CONFIG_USB_GSPCA_PAC7311
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_PAC7311=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SE401 -----------------
Config: CONFIG_USB_GSPCA_SE401
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SE401=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SN9C2028 -----------------
Config: CONFIG_USB_GSPCA_SN9C2028
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SN9C2028=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SN9C20X -----------------
Config: CONFIG_USB_GSPCA_SN9C20X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SN9C20X=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SONIXB -----------------
Config: CONFIG_USB_GSPCA_SONIXB
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SONIXB=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SONIXJ -----------------
Config: CONFIG_USB_GSPCA_SONIXJ
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SONIXJ=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SPCA500 -----------------
Config: CONFIG_USB_GSPCA_SPCA500
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA500=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SPCA501 -----------------
Config: CONFIG_USB_GSPCA_SPCA501
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA501=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SPCA505 -----------------
Config: CONFIG_USB_GSPCA_SPCA505
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA505=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SPCA506 -----------------
Config: CONFIG_USB_GSPCA_SPCA506
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA506=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SPCA508 -----------------
Config: CONFIG_USB_GSPCA_SPCA508
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA508=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SPCA561 -----------------
Config: CONFIG_USB_GSPCA_SPCA561
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA561=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SPCA1528 -----------------
Config: CONFIG_USB_GSPCA_SPCA1528
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SPCA1528=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SQ905 -----------------
Config: CONFIG_USB_GSPCA_SQ905
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SQ905=3Dm
Actual value:    =20

Config: CONFIG_USB_GSPCA_SQ905C
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SQ905C=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SQ905C -----------------
Config: CONFIG_USB_GSPCA_SQ905C
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SQ905C=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SQ930X -----------------
Config: CONFIG_USB_GSPCA_SQ930X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SQ930X=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_STK014 -----------------
Config: CONFIG_USB_GSPCA_STK014
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_STK014=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_STV0680 -----------------
Config: CONFIG_USB_GSPCA_STV0680
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_STV0680=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_SUNPLUS -----------------
Config: CONFIG_USB_GSPCA_SUNPLUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_SUNPLUS=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_T613 -----------------
Config: CONFIG_USB_GSPCA_T613
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_T613=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_TOPRO -----------------
Config: CONFIG_USB_GSPCA_TOPRO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_TOPRO=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_TV8532 -----------------
Config: CONFIG_USB_GSPCA_TV8532
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_TV8532=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_VC032X -----------------
Config: CONFIG_USB_GSPCA_VC032X
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_VC032X=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_VICAM -----------------
Config: CONFIG_USB_GSPCA_VICAM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_VICAM=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_XIRLINK_CIT -----------------
Config: CONFIG_USB_GSPCA_XIRLINK_CIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_XIRLINK_CIT=3Dm
Actual value:    =20


---------- CONFIG_USB_GSPCA_ZC3XX -----------------
Config: CONFIG_USB_GSPCA_ZC3XX
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_GSPCA_ZC3XX=3Dm
Actual value:    =20


---------- CONFIG_USB_PWC -----------------
Config: CONFIG_USB_PWC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_PWC=3Dm
Actual value:    =20

Config: CONFIG_USB_PWC_INPUT_EVDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_PWC_INPUT_EVDEV=3Dy
Actual value:    =20


---------- CONFIG_USB_PWC_INPUT_EVDEV -----------------
Config: CONFIG_USB_PWC_INPUT_EVDEV
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_PWC_INPUT_EVDEV=3Dy
Actual value:    =20


---------- CONFIG_VIDEO_CPIA2 -----------------
Config: CONFIG_VIDEO_CPIA2
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_VIDEO_CPIA2=3Dm
Actual value:    =20


---------- CONFIG_USB_STKWEBCAM -----------------
Config: CONFIG_USB_STKWEBCAM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_STKWEBCAM=3Dm
Actual value:    =20


---------- CONFIG_USB_S2255 -----------------
Config: CONFIG_USB_S2255
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/media/media-usb-webcams.cfg
Requested value:  CONFIG_USB_S2255=3Dm
Actual value:    =20


---------- CONFIG_SND_PCI -----------------
Config: CONFIG_SND_PCI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_PCI=3Dy
Actual value:    =20


---------- CONFIG_SND_HDA_INTEL -----------------
Config: CONFIG_SND_HDA_INTEL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_INTEL=3Dm
Actual value:    =20


---------- CONFIG_SND_HDA_GENERIC -----------------
Config: CONFIG_SND_HDA_GENERIC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_GENERIC=3Dm
Actual value:    =20


---------- CONFIG_SND_HDA_CODEC_HDMI -----------------
Config: CONFIG_SND_HDA_CODEC_HDMI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_HDMI=3Dm
Actual value:    =20


---------- CONFIG_SND_HDA_CODEC_ANALOG -----------------
Config: CONFIG_SND_HDA_CODEC_ANALOG
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_ANALOG=3Dm
Actual value:    =20


---------- CONFIG_SND_HDA_CODEC_REALTEK -----------------
Config: CONFIG_SND_HDA_CODEC_REALTEK
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_REALTEK=3Dm
Actual value:    =20


---------- CONFIG_SND_HDA_CODEC_SIGMATEL -----------------
Config: CONFIG_SND_HDA_CODEC_SIGMATEL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_SIGMATEL=3Dm
Actual value:    =20


---------- CONFIG_SND_HDA_CODEC_CIRRUS -----------------
Config: CONFIG_SND_HDA_CODEC_CIRRUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_CIRRUS=3Dm
Actual value:    =20


---------- CONFIG_SND_HDA_CODEC_CONEXANT -----------------
Config: CONFIG_SND_HDA_CODEC_CONEXANT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_CONEXANT=3Dm
Actual value:    =20


---------- CONFIG_SND_HDA_CODEC_CA0110 -----------------
Config: CONFIG_SND_HDA_CODEC_CA0110
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_CA0110=3Dm
Actual value:    =20


---------- CONFIG_SND_HDA_CODEC_CA0132 -----------------
Config: CONFIG_SND_HDA_CODEC_CA0132
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_CA0132=3Dm
Actual value:    =20


---------- CONFIG_SND_HDA_CODEC_CMEDIA -----------------
Config: CONFIG_SND_HDA_CODEC_CMEDIA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_CMEDIA=3Dm
Actual value:    =20


---------- CONFIG_SND_HDA_CODEC_SI3054 -----------------
Config: CONFIG_SND_HDA_CODEC_SI3054
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Requested value:  CONFIG_SND_HDA_CODEC_SI3054=3Dm
Actual value:    =20


---------- CONFIG_DMA_SHARED_BUFFER -----------------
Config: CONFIG_DMA_SHARED_BUFFER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DMA_SHARED_BUFFER=3Dy
Actual value:    =20


---------- CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS -----------------
Config: CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
Actual value:    =20


---------- CONFIG_MOUSE_PS2_SMBUS -----------------
Config: CONFIG_MOUSE_PS2_SMBUS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_MOUSE_PS2_SMBUS=3Dy
Actual value:    =20


---------- CONFIG_VT_HW_CONSOLE_BINDING -----------------
Config: CONFIG_VT_HW_CONSOLE_BINDING
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_VT_HW_CONSOLE_BINDING=3Dy
Actual value:     # CONFIG_VT_HW_CONSOLE_BINDING is not set


---------- CONFIG_I2C -----------------
Config: CONFIG_I2C_I801
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg
Requested value:  CONFIG_I2C_I801=3Dy
Actual value:    =20

--
Config: CONFIG_I2C
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.cfg /OE/bu=
ild/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/con=
figs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/tmp-glibc/work-=
shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/features=
/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C=3Dy
Actual value:     # CONFIG_I2C is not set

Config: CONFIG_I2C_BOARDINFO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_BOARDINFO=3Dy
Actual value:    =20

Config: CONFIG_I2C_COMPAT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_COMPAT=3Dy
Actual value:    =20

Config: CONFIG_I2C_HELPER_AUTO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_HELPER_AUTO=3Dy
Actual value:    =20

Config: CONFIG_I2C_ALGOBIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_ALGOBIT=3Dy
Actual value:    =20


---------- CONFIG_I2C_BOARDINFO -----------------
Config: CONFIG_I2C_BOARDINFO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_BOARDINFO=3Dy
Actual value:    =20


---------- CONFIG_I2C_COMPAT -----------------
Config: CONFIG_I2C_COMPAT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_COMPAT=3Dy
Actual value:    =20


---------- CONFIG_I2C_HELPER_AUTO -----------------
Config: CONFIG_I2C_HELPER_AUTO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_HELPER_AUTO=3Dy
Actual value:    =20


---------- CONFIG_I2C_ALGOBIT -----------------
Config: CONFIG_I2C_ALGOBIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_I2C_ALGOBIT=3Dy
Actual value:    =20


---------- CONFIG_DRM -----------------
Config: CONFIG_DRM_CIRRUS_QEMU
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Requested value:  CONFIG_DRM_CIRRUS_QEMU=3Dm
Actual value:    =20

--
Config: CONFIG_DRM_I915
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_DRM_I915=3Dm
Actual value:    =20

Config: CONFIG_DRM_I915_ALPHA_SUPPORT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Requested value:  CONFIG_DRM_I915_ALPHA_SUPPORT=3Dy
Actual value:    =20

--
Config: CONFIG_DRM_VIRTIO_GPU
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/virtio.cfg /OE/build/oe-core/tmp-glibc=
/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cf=
g/virtio.cfg
Requested value:  CONFIG_DRM_VIRTIO_GPU=3Dy
Actual value:    =20

--
Config: CONFIG_DRM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM=3Dy
Actual value:     # CONFIG_DRM is not set

Config: CONFIG_DRM_KMS_HELPER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_KMS_HELPER=3Dy
Actual value:    =20

Config: CONFIG_DRM_KMS_FB_HELPER
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/i915/i915.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_KMS_FB_HELPER=3Dy
Actual value:    =20

Config: CONFIG_DRM_FBDEV_EMULATION
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_FBDEV_EMULATION=3Dy
Actual value:    =20

Config: CONFIG_DRM_FBDEV_OVERALLOC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_FBDEV_OVERALLOC=3D100
Actual value:    =20

Config: CONFIG_DRM_TTM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_TTM=3Dy
Actual value:    =20

Config: CONFIG_DRM_BOCHS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_BOCHS=3Dy
Actual value:    =20

Config: CONFIG_DRM_PANEL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL=3Dy
Actual value:    =20

Config: CONFIG_DRM_BRIDGE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_BRIDGE=3Dy
Actual value:    =20

Config: CONFIG_DRM_PANEL_BRIDGE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL_BRIDGE=3Dy
Actual value:    =20

Config: CONFIG_DRM_PANEL_ORIENTATION_QUIRKS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
Actual value:    =20


---------- CONFIG_DRM_FBDEV_EMULATION -----------------
Config: CONFIG_DRM_FBDEV_EMULATION
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_FBDEV_EMULATION=3Dy
Actual value:    =20


---------- CONFIG_DRM_FBDEV_OVERALLOC -----------------
Config: CONFIG_DRM_FBDEV_OVERALLOC
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_FBDEV_OVERALLOC=3D100
Actual value:    =20


---------- CONFIG_DRM_TTM -----------------
Config: CONFIG_DRM_TTM
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_TTM=3Dy
Actual value:    =20


---------- CONFIG_DRM_BOCHS -----------------
Config: CONFIG_DRM_BOCHS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_BOCHS=3Dy
Actual value:    =20


---------- CONFIG_DRM_PANEL -----------------
Config: CONFIG_DRM_PANEL
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL=3Dy
Actual value:    =20

--
Config: CONFIG_DRM_PANEL_BRIDGE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL_BRIDGE=3Dy
Actual value:    =20

Config: CONFIG_DRM_PANEL_ORIENTATION_QUIRKS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
Actual value:    =20


---------- CONFIG_DRM_BRIDGE -----------------
Config: CONFIG_DRM_BRIDGE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_BRIDGE=3Dy
Actual value:    =20


---------- CONFIG_DRM_PANEL_BRIDGE -----------------
Config: CONFIG_DRM_PANEL_BRIDGE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL_BRIDGE=3Dy
Actual value:    =20


---------- CONFIG_DRM_PANEL_ORIENTATION_QUIRKS -----------------
Config: CONFIG_DRM_PANEL_ORIENTATION_QUIRKS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
Actual value:    =20


---------- CONFIG_FB_CMDLINE -----------------
Config: CONFIG_FB_CMDLINE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CMDLINE=3Dy
Actual value:    =20


---------- CONFIG_FB_NOTIFY -----------------
Config: CONFIG_FB_NOTIFY
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_NOTIFY=3Dy
Actual value:    =20


---------- CONFIG_FB -----------------
Config: CONFIG_FB_MODE_HELPERS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Requested value:  CONFIG_FB_MODE_HELPERS=3Dy
Actual value:    =20

--
Config: CONFIG_FB_UVESA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Requested value:  CONFIG_FB_UVESA=3Dm
Actual value:    =20

--
Config: CONFIG_FB_EFI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
Requested value:  CONFIG_FB_EFI=3Dy
Actual value:    =20

--
Config: CONFIG_FB_CMDLINE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CMDLINE=3Dy
Actual value:    =20

Config: CONFIG_FB_NOTIFY
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_NOTIFY=3Dy
Actual value:    =20

Config: CONFIG_FB
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/cfg/efi-ext.cfg /OE/build/oe-core/tmp-glibc/work-shared/qemu=
x86-64/kernel-source/.kernel-meta/configs/v5.4/standard/features/drm-bochs/=
drm-bochs.cfg
Requested value:  CONFIG_FB=3Dy
Actual value:     # CONFIG_FB is not set

Config: CONFIG_FB_CFB_FILLRECT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CFB_FILLRECT=3Dy
Actual value:    =20

Config: CONFIG_FB_CFB_COPYAREA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CFB_COPYAREA=3Dy
Actual value:    =20

Config: CONFIG_FB_CFB_IMAGEBLIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CFB_IMAGEBLIT=3Dy
Actual value:    =20

Config: CONFIG_FB_SYS_FILLRECT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_FILLRECT=3Dy
Actual value:    =20

Config: CONFIG_FB_SYS_COPYAREA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_COPYAREA=3Dy
Actual value:    =20

Config: CONFIG_FB_SYS_IMAGEBLIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_IMAGEBLIT=3Dy
Actual value:    =20

Config: CONFIG_FB_SYS_FOPS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_FOPS=3Dy
Actual value:    =20

Config: CONFIG_FB_DEFERRED_IO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_DEFERRED_IO=3Dy
Actual value:    =20

Config: CONFIG_FB_SIMPLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SIMPLE=3Dy
Actual value:    =20


---------- CONFIG_FB_CFB_FILLRECT -----------------
Config: CONFIG_FB_CFB_FILLRECT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CFB_FILLRECT=3Dy
Actual value:    =20


---------- CONFIG_FB_CFB_COPYAREA -----------------
Config: CONFIG_FB_CFB_COPYAREA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CFB_COPYAREA=3Dy
Actual value:    =20


---------- CONFIG_FB_CFB_IMAGEBLIT -----------------
Config: CONFIG_FB_CFB_IMAGEBLIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_CFB_IMAGEBLIT=3Dy
Actual value:    =20


---------- CONFIG_FB_SYS_FILLRECT -----------------
Config: CONFIG_FB_SYS_FILLRECT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_FILLRECT=3Dy
Actual value:    =20


---------- CONFIG_FB_SYS_COPYAREA -----------------
Config: CONFIG_FB_SYS_COPYAREA
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_COPYAREA=3Dy
Actual value:    =20


---------- CONFIG_FB_SYS_IMAGEBLIT -----------------
Config: CONFIG_FB_SYS_IMAGEBLIT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_IMAGEBLIT=3Dy
Actual value:    =20


---------- CONFIG_FB_SYS_FOPS -----------------
Config: CONFIG_FB_SYS_FOPS
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SYS_FOPS=3Dy
Actual value:    =20


---------- CONFIG_FB_DEFERRED_IO -----------------
Config: CONFIG_FB_DEFERRED_IO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_DEFERRED_IO=3Dy
Actual value:    =20


---------- CONFIG_FB_SIMPLE -----------------
Config: CONFIG_FB_SIMPLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FB_SIMPLE=3Dy
Actual value:    =20


---------- CONFIG_HDMI -----------------
Config: CONFIG_HDMI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_HDMI=3Dy
Actual value:    =20


---------- CONFIG_FRAMEBUFFER_CONSOLE -----------------
Config: CONFIG_FRAMEBUFFER_CONSOLE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg /OE/build/=
oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs=
/v5.4/standard/cfg/efi-ext.cfg /OE/build/oe-core/tmp-glibc/work-shared/qemu=
x86-64/kernel-source/.kernel-meta/configs/v5.4/standard/features/drm-bochs/=
drm-bochs.cfg
Requested value:  CONFIG_FRAMEBUFFER_CONSOLE=3Dy
Actual value:    =20

Config: CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
Actual value:    =20


---------- CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY -----------------
Config: CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
Actual value:    =20


---------- CONFIG_SYNC_FILE -----------------
Config: CONFIG_SYNC_FILE
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_SYNC_FILE=3Dy
Actual value:     # CONFIG_SYNC_FILE is not set


---------- CONFIG_FONT_SUPPORT -----------------
Config: CONFIG_FONT_SUPPORT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FONT_SUPPORT=3Dy
Actual value:    =20


---------- CONFIG_FONT_8x8 -----------------
Config: CONFIG_FONT_8x8
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FONT_8x8=3Dy
Actual value:    =20


---------- CONFIG_FONT_8x16 -----------------
Config: CONFIG_FONT_8x16
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Requested value:  CONFIG_FONT_8x16=3Dy
Actual value:    =20


---------- CONFIG_HYPERVISOR_GUEST -----------------
Config: CONFIG_HYPERVISOR_GUEST
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/hv-guest.cfg
Requested value:  CONFIG_HYPERVISOR_GUEST=3Dy
Actual value:     # CONFIG_HYPERVISOR_GUEST is not set


---------- CONFIG_KVM_GUEST -----------------
Config: CONFIG_KVM_GUEST
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/paravirt_kvm.cfg
Requested value:  CONFIG_KVM_GUEST=3Dy
Actual value:    =20


---------- CONFIG_PARAVIRT -----------------
Config: CONFIG_PARAVIRT
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/paravirt_kvm.cfg
Requested value:  CONFIG_PARAVIRT=3Dy
Actual value:    =20

Config: CONFIG_PARAVIRT_CLOCK
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/paravirt_kvm.cfg
Requested value:  CONFIG_PARAVIRT_CLOCK=3Dy
Actual value:    =20


---------- CONFIG_PARAVIRT_CLOCK -----------------
Config: CONFIG_PARAVIRT_CLOCK
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/paravirt_kvm.cfg
Requested value:  CONFIG_PARAVIRT_CLOCK=3Dy
Actual value:    =20


---------- CONFIG_SCSI -----------------
Config: CONFIG_SCSI_VIRTIO
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/cfg/virtio.cfg /OE/build/oe-core/tmp-glibc=
/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/standard/cf=
g/virtio.cfg
Requested value:  CONFIG_SCSI_VIRTIO=3Dy
Actual value:    =20

--
Config: CONFIG_SCSI
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/scsi/scsi.cfg /OE/build/oe-core/t=
mp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/v5.4/sta=
ndard/features/scsi/scsi.cfg /OE/build/oe-core/tmp-glibc/work-shared/qemux8=
6-64/kernel-source/.kernel-meta/configs/v5.4/standard/features/scsi/scsi.cfg
Requested value:  CONFIG_SCSI=3Dy
Actual value:     # CONFIG_SCSI is not set

Config: CONFIG_SCSI_DEBUG
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/scsi/scsi-debug.cfg
Requested value:  CONFIG_SCSI_DEBUG=3Dm
Actual value:    =20


---------- CONFIG_SCSI_DEBUG -----------------
Config: CONFIG_SCSI_DEBUG
=46rom: /OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.k=
ernel-meta/configs/v5.4/standard/features/scsi/scsi-debug.cfg
Requested value:  CONFIG_SCSI_DEBUG=3Dm
Actual value:    =20



DEBUG: Python function do_kernel_configcheck finished
>=20
> Bruce
>=20
> >>
> >>
> >> make[1]: Entering directory '/OE/build/oe-core/tmp-glibc/work/qemux86_=
64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> >>   GEN     Makefile
> >>   HOSTCC  scripts/basic/fixdep
> >>   HOSTCC  scripts/kconfig/conf.o
> >>   HOSTCC  scripts/kconfig/confdata.o
> >>   HOSTCC  scripts/kconfig/expr.o
> >>   HOSTCC  scripts/kconfig/lexer.lex.o
> >>   HOSTCC  scripts/kconfig/parser.tab.o
> >>   HOSTCC  scripts/kconfig/preprocess.o
> >>   HOSTCC  scripts/kconfig/symbol.o
> >>   HOSTLD  scripts/kconfig/conf
> >> scripts/kconfig/conf  --olddefconfig Kconfig
> >> scripts/Kconfig.include:39:  gold linker 'x86_64-oe-linux-ld' not supp=
orted
> >> make[2]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kerne=
l-source/scripts/kconfig/Makefile:73: olddefconfig] Error 1
> >> make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kerne=
l-source/Makefile:567: olddefconfig] Error 2
> >> make[1]: Leaving directory '/OE/build/oe-core/tmp-glibc/work/qemux86_6=
4-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> >> make: *** [Makefile:179: sub-make] Error 2
> >> make: Leaving directory '/OE/build/oe-core/tmp-glibc/work-shared/qemux=
86-64/kernel-source'
> >> NOTE: make HOSTCC=3Dgcc  -isystem/OE/build/oe-core/tmp-glibc/work/qemu=
x86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/include -O2=
 -pipe -L/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5=
=2E4.15-r0/recipe-sysroot-native/usr/lib                         -L/OE/buil=
d/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-s=
ysroot-native/lib                         -Wl,--enable-new-dtags           =
              -Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/qemux86_64-o=
e-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/lib                =
         -Wl,-rpath-link,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-lin=
ux/linux-yocto/5.4.15-r0/recipe-sysroot-native/lib                         =
-Wl,-rpath,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto=
/5.4.15-r0/recipe-sysroot-native/usr/lib                         -Wl,-rpath=
,/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0=
/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-shli=
b-undefined -Wl,--dynamic-linker=3D/OE/build/oe-core/tmp-glibc/sysroots-uni=
native/x86_64-linux/lib/ld-linux-x86-64.so.2 HOSTCPP=3Dgcc  -E -C /OE/build=
/oe-core/tmp-glibc/work-shared/qemux86-64/kernel-source O=3D/OE/build/oe-co=
re/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_6=
4-standard-build CC=3Dx86_64-oe-linux-gcc  -fuse-ld=3Dbfd -fmacro-prefix-ma=
p=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15=
-r0=3D/usr/src/debug/linux-yocto/5.4.15-r0                      -fdebug-pre=
fix-map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/=
5.4.15-r0=3D/usr/src/debug/linux-yocto/5.4.15-r0                      -fdeb=
ug-prefix-map=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-=
yocto/5.4.15-r0/recipe-sysroot=3D                      -fdebug-prefix-map=
=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-=
r0/recipe-sysroot-native=3D  -fdebug-prefix-map=3D/OE/build/oe-core/tmp-gli=
bc/work-shared/qemux86-64/kernel-source=3D/usr/src/kernel oldnoconfig
> >> make: Entering directory '/OE/build/oe-core/tmp-glibc/work-shared/qemu=
x86-64/kernel-source'
> >> make[1]: Entering directory '/OE/build/oe-core/tmp-glibc/work/qemux86_=
64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> >>   GEN     Makefile
> >> make[2]: *** No rule to make target 'oldnoconfig'.  Stop.
> >> make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kerne=
l-source/Makefile:567: oldnoconfig] Error 2
> >> make[1]: Leaving directory '/OE/build/oe-core/tmp-glibc/work/qemux86_6=
4-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> >> make: *** [Makefile:179: sub-make] Error 2
> >> make: Leaving directory '/OE/build/oe-core/tmp-glibc/work-shared/qemux=
86-64/kernel-source'
> >> ERROR: oe_runmake failed
> >> WARNING: exit code 1 from a shell command.
> >> ERROR: Execution of '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-li=
nux/linux-yocto/5.4.15-r0/temp/run.do_configure.4075' failed with exit code=
 1:
> >> make: Entering directory '/OE/build/oe-core/tmp-glibc/work-shared/qemu=
x86-64/kernel-source'
> >> make[1]: Entering directory '/OE/build/oe-core/tmp-glibc/work/qemux86_=
64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> >>   GEN     Makefile
> >>   HOSTCC  scripts/basic/fixdep
> >>   HOSTCC  scripts/kconfig/conf.o
> >>   HOSTCC  scripts/kconfig/confdata.o
> >>   HOSTCC  scripts/kconfig/expr.o
> >>   HOSTCC  scripts/kconfig/lexer.lex.o
> >>   HOSTCC  scripts/kconfig/parser.tab.o
> >>   HOSTCC  scripts/kconfig/preprocess.o
> >>   HOSTCC  scripts/kconfig/symbol.o
> >>   HOSTLD  scripts/kconfig/conf
> >> scripts/kconfig/conf  --olddefconfig Kconfig
> >> scripts/Kconfig.include:39:  gold linker 'x86_64-oe-linux-ld' not supp=
orted
> >> make[2]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kerne=
l-source/scripts/kconfig/Makefile:73: olddefconfig] Error 1
> >> make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kerne=
l-source/Makefile:567: olddefconfig] Error 2
> >> make[1]: Leaving directory '/OE/build/oe-core/tmp-glibc/work/qemux86_6=
4-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> >> make: *** [Makefile:179: sub-make] Error 2
> >> make: Leaving directory '/OE/build/oe-core/tmp-glibc/work-shared/qemux=
86-64/kernel-source'
> >> make: Entering directory '/OE/build/oe-core/tmp-glibc/work-shared/qemu=
x86-64/kernel-source'
> >> make[1]: Entering directory '/OE/build/oe-core/tmp-glibc/work/qemux86_=
64-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> >>   GEN     Makefile
> >> make[2]: *** No rule to make target 'oldnoconfig'.  Stop.
> >> make[1]: *** [/OE/build/oe-core/tmp-glibc/work-shared/qemux86-64/kerne=
l-source/Makefile:567: oldnoconfig] Error 2
> >> make[1]: Leaving directory '/OE/build/oe-core/tmp-glibc/work/qemux86_6=
4-oe-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
> >> make: *** [Makefile:179: sub-make] Error 2
> >> make: Leaving directory '/OE/build/oe-core/tmp-glibc/work-shared/qemux=
86-64/kernel-source'
> >> WARNING: exit code 1 from a shell command.
> >>
> >> On Fri, Jan 31, 2020 at 10:37 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>> kernel-seltest fails now to build
> >>>
> >>> https://errors.yoctoproject.org/Errors/Details/308578/
> >>>
> >>> On Tue, Jan 28, 2020 at 2:14 PM <bruce.ashfield@gmail.com> wrote:
> >>> >
> >>> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>> >
> >>> > This creates recipes for the v5.4/* branches of the linux-yocto
> >>> > reference kernel.
> >>> >
> >>> > preempt-rt, yaffs2, aufs5 and reference board specific patches are
> >>> > part of these branches. All major architectures: x86,x86-64,ARM,
> >>> > ARM64,ppc,mips and mips64 have been feature tested against this
> >>> > reference.
> >>> >
> >>> > 5.4 is a LTS release, and as such will receive -stable updates
> >>> > for the duration of upstream korg support.
> >>> >
> >>> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>> > ---
> >>> >  .../linux/linux-yocto-rt_5.4.bb               | 44 +++++++++++++++
> >>> >  .../linux/linux-yocto-tiny_5.4.bb             | 32 +++++++++++
> >>> >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 54 +++++++++++++++=
++++
> >>> >  3 files changed, 130 insertions(+)
> >>> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> >>> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.=
bb
> >>> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >>> >
> >>> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta=
/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> >>> > new file mode 100644
> >>> > index 0000000000..52f0e3b833
> >>> > --- /dev/null
> >>> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> >>> > @@ -0,0 +1,44 @@
> >>> > +KBRANCH ?=3D "v5.4/standard/preempt-rt/base"
> >>> > +
> >>> > +require recipes-kernel/linux/linux-yocto.inc
> >>> > +
> >>> > +# Skip processing of this recipe if it is not explicitly specified=
 as the
> >>> > +# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when t=
rying
> >>> > +# to build multiple virtual/kernel providers, e.g. as dependency of
> >>> > +# core-image-rt-sdk, core-image-rt.
> >>> > +python () {
> >>> > +    if d.getVar("KERNEL_PACKAGE_NAME") =3D=3D "kernel" and d.getVa=
r("PREFERRED_PROVIDER_virtual/kernel") !=3D "linux-yocto-rt":
> >>> > +        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/=
kernel to linux-yocto-rt to enable it")
> >>> > +}
> >>> > +
> >>> > +SRCREV_machine ?=3D "5d5d4070c5f8b10a4c6bda37e77071ce37f102d5"
> >>> > +SRCREV_meta ?=3D "a48522779fae4887c47268e5f650bf10c94a165c"
> >>> > +
> >>> > +SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D$=
{KBRANCH};name=3Dmachine \
> >>> > +           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkm=
eta;name=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
> >>> > +
> >>> > +LINUX_VERSION ?=3D "5.4.15"
> >>> > +
> >>> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826=
c0c6b8814"
> >>> > +
> >>> > +DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native=
', '', d)}"
> >>> > +DEPENDS +=3D "openssl-native util-linux-native"
> >>> > +
> >>> > +PV =3D "5.4.15"
> >>> > +
> >>> > +KMETA =3D "kernel-meta"
> >>> > +KCONF_BSP_AUDIT_LEVEL =3D "2"
> >>> > +
> >>> > +LINUX_KERNEL_TYPE =3D "preempt-rt"
> >>> > +
> >>> > +COMPATIBLE_MACHINE =3D "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemu=
arm64|qemuppc|qemumips)"
> >>> > +
> >>> > +KERNEL_DEVICETREE_qemuarmv5 =3D "versatile-pb.dtb"
> >>> > +
> >>> > +# Functionality flags
> >>> > +KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc featu=
res/taskstats/taskstats.scc"
> >>> > +KERNEL_FEATURES_append =3D " ${KERNEL_EXTRA_FEATURES}"
> >>> > +KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc features/drm-boc=
hs/drm-bochs.scc"
> >>> > +KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.=
scc"
> >>> > +KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_k=
vm.scc"
> >>> > +KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURES"=
, "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> >>> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/me=
ta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> >>> > new file mode 100644
> >>> > index 0000000000..a028b37548
> >>> > --- /dev/null
> >>> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> >>> > @@ -0,0 +1,32 @@
> >>> > +KBRANCH ?=3D "v5.4/standard/tiny/base"
> >>> > +KBRANCH_qemuarm  ?=3D "v5.4/standard/tiny/arm-versatile-926ejs"
> >>> > +
> >>> > +LINUX_KERNEL_TYPE =3D "tiny"
> >>> > +KCONFIG_MODE =3D "--allnoconfig"
> >>> > +
> >>> > +require recipes-kernel/linux/linux-yocto.inc
> >>> > +
> >>> > +LINUX_VERSION ?=3D "5.4.15"
> >>> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826=
c0c6b8814"
> >>> > +
> >>> > +DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native=
', '', d)}"
> >>> > +DEPENDS +=3D "openssl-native util-linux-native"
> >>> > +
> >>> > +KMETA =3D "kernel-meta"
> >>> > +KCONF_BSP_AUDIT_LEVEL =3D "2"
> >>> > +
> >>> > +SRCREV_machine_qemuarm ?=3D "9eeafafc19278b5c5376ba1fd9eae26626730=
458"
> >>> > +SRCREV_machine ?=3D "cdda35317561d2741b396efa623ace0bd2212c16"
> >>> > +SRCREV_meta ?=3D "a48522779fae4887c47268e5f650bf10c94a165c"
> >>> > +
> >>> > +PV =3D "5.4.15"
> >>> > +
> >>> > +SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D$=
{KBRANCH};name=3Dmachine \
> >>> > +           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkm=
eta;name=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
> >>> > +
> >>> > +COMPATIBLE_MACHINE =3D "qemux86|qemux86-64|qemuarm|qemuarmv5"
> >>> > +
> >>> > +# Functionality flags
> >>> > +KERNEL_FEATURES =3D ""
> >>> > +
> >>> > +KERNEL_DEVICETREE_qemuarmv5 =3D "versatile-pb.dtb"
> >>> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/re=
cipes-kernel/linux/linux-yocto_5.4.bb
> >>> > new file mode 100644
> >>> > index 0000000000..9fbc47d79e
> >>> > --- /dev/null
> >>> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >>> > @@ -0,0 +1,54 @@
> >>> > +KBRANCH ?=3D "v5.4/standard/base"
> >>> > +
> >>> > +require recipes-kernel/linux/linux-yocto.inc
> >>> > +
> >>> > +# board specific branches
> >>> > +KBRANCH_qemuarm  ?=3D "v5.4/standard/arm-versatile-926ejs"
> >>> > +KBRANCH_qemuarm64 ?=3D "v5.4/standard/qemuarm64"
> >>> > +KBRANCH_qemumips ?=3D "v5.4/standard/mti-malta32"
> >>> > +KBRANCH_qemuppc  ?=3D "v5.4/standard/qemuppc"
> >>> > +KBRANCH_qemuriscv64  ?=3D "v5.4/standard/base"
> >>> > +KBRANCH_qemux86  ?=3D "v5.4/standard/base"
> >>> > +KBRANCH_qemux86-64 ?=3D "v5.4/standard/base"
> >>> > +KBRANCH_qemumips64 ?=3D "v5.4/standard/mti-malta64"
> >>> > +
> >>> > +SRCREV_machine_qemuarm ?=3D "637086def651a00b1274a80cd3ca740e271eb=
0f9"
> >>> > +SRCREV_machine_qemuarm64 ?=3D "cdda35317561d2741b396efa623ace0bd22=
12c16"
> >>> > +SRCREV_machine_qemumips ?=3D "bfe04753d00b0f36848bb8204020b69d0e78=
f02a"
> >>> > +SRCREV_machine_qemuppc ?=3D "cdda35317561d2741b396efa623ace0bd2212=
c16"
> >>> > +SRCREV_machine_qemuriscv64 ?=3D "cdda35317561d2741b396efa623ace0bd=
2212c16"
> >>> > +SRCREV_machine_qemux86 ?=3D "cdda35317561d2741b396efa623ace0bd2212=
c16"
> >>> > +SRCREV_machine_qemux86-64 ?=3D "cdda35317561d2741b396efa623ace0bd2=
212c16"
> >>> > +SRCREV_machine_qemumips64 ?=3D "81cd255c72add4dcf06603250869f739bb=
4f05cb"
> >>> > +SRCREV_machine ?=3D "cdda35317561d2741b396efa623ace0bd2212c16"
> >>> > +SRCREV_meta ?=3D "a48522779fae4887c47268e5f650bf10c94a165c"
> >>> > +
> >>> > +# remap qemuarm to qemuarma15 for the 5.4 kernel
> >>> > +# KMACHINE_qemuarm ?=3D "qemuarma15"
> >>> > +
> >>> > +SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;name=3Dmac=
hine;branch=3D${KBRANCH}; \
> >>> > +           git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkm=
eta;name=3Dmeta;branch=3Dyocto-5.4;destsuffix=3D${KMETA}"
> >>> > +
> >>> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbea815ee2795b2f4230826=
c0c6b8814"
> >>> > +LINUX_VERSION ?=3D "5.4.15"
> >>> > +
> >>> > +DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native=
', '', d)}"
> >>> > +DEPENDS +=3D "openssl-native util-linux-native"
> >>> > +
> >>> > +PV =3D "5.4.15"
> >>> > +
> >>> > +KMETA =3D "kernel-meta"
> >>> > +KCONF_BSP_AUDIT_LEVEL =3D "2"
> >>> > +
> >>> > +KERNEL_DEVICETREE_qemuarmv5 =3D "versatile-pb.dtb"
> >>> > +
> >>> > +COMPATIBLE_MACHINE =3D "qemuarm|qemuarmv5|qemuarm64|qemux86|qemupp=
c|qemumips|qemumips64|qemux86-64|qemuriscv64"
> >>> > +
> >>> > +# Functionality flags
> >>> > +KERNEL_EXTRA_FEATURES ?=3D "features/netfilter/netfilter.scc"
> >>> > +KERNEL_FEATURES_append =3D " ${KERNEL_EXTRA_FEATURES}"
> >>> > +KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc features/drm-boc=
hs/drm-bochs.scc"
> >>> > +KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.=
scc"
> >>> > +KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_k=
vm.scc"
> >>> > +KERNEL_FEATURES_append =3D " ${@bb.utils.contains("TUNE_FEATURES",=
 "mx32", " cfg/x32.scc", "" ,d)}"
> >>> > +KERNEL_FEATURES_append =3D " ${@bb.utils.contains("DISTRO_FEATURES=
", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> >>> > --
> >>> > 2.19.1
> >>> >
> >>> > --
> >>> > _______________________________________________
> >>> > Openembedded-core mailing list
> >>> > Openembedded-core@lists.openembedded.org
> >>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

--xrwaqawu47e4hbgm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXjhacAAKCRA3VSO3ZXaA
HCMgAKCeeOHuDLL7rxx6nhx9EjsrpU24jwCeN+uHLCsuhVwWEol+G2nmH1qM2uM=
=x7gs
-----END PGP SIGNATURE-----

--xrwaqawu47e4hbgm--
