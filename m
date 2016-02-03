Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id DCD60601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 19:56:45 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id n128so18909556pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 11:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Ipsk0ip468Y8bn65iiOaDtC5zT/YXNl1PUJRzzj1Yuo=;
	b=MmTSdYVwxyJaL4ieBDfD8ujviuG+cQstP82NKpeOiyIMi+BDbPh+xFzgk7WNqBdoH2
	tJGBZtTWFksHrh3r9jy+tS3ccr025fyfk+kWvVDZRKzOn6APpk2J2zVk+gI0hFpfo/Fv
	hVN6HD0YbNEgedW4/zB/0j9FZdr4RB+YP5QdDG9ydWOpDqaU0F7k4NFTgHPNHfz1I6vs
	9yA8ExygVY+E+kEUCMF20Qs8NSCNE5zqtF5ogs3tvfGbQ1+xWv4WIRbIbqSE3gOhUsbj
	svOvKb7Q9e/dMPI4IBoZJrK/amQtOA+XJ2bJsyStNAJ+r46rixkimY8HDSM0ff2NGUHN
	Et/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=Ipsk0ip468Y8bn65iiOaDtC5zT/YXNl1PUJRzzj1Yuo=;
	b=krWBqYFYhHGVGIctt1pn75+PDKbW9rj39XZsXkCU5W9/XqP9RZ2f8ZoKBDhLSKLhTX
	wxCbPXGvW2se5OdBiLdmKPxSTmqtrsJjAIEFEVRf+J0lEDrlklaAjArcvqMRSBI7hQKC
	80hDoZ/15yBlmvJh2ge/JJBZp8fW/msAYFKJJeql/mUCpWR/8YuCUtxzYf7I9KkmMis4
	frUP8dQzpj8FkVDp7Wy2w7ZaGrTiLMQxPzX4WPGUl0mDBh9MeQYl1hzHePBqQK0j9+MU
	7SQXhptf/fEKGb23lRSQz3JUaFumy1RDwRcYpR4bLgRlxJ50Ce9Veh9L1jOi2wvu+cjE
	MgvA==
X-Gm-Message-State: AG10YOR9J3TPmNXqeS/Gd95HpzwR5m7KwLjeKKvb2vgU74P2cG2q/YR+8c233m0WJF9PeA==
X-Received: by 10.98.18.201 with SMTP id 70mr5223812pfs.104.1454529406554;
	Wed, 03 Feb 2016 11:56:46 -0800 (PST)
Received: from ?IPv6:2601:647:4c01:b37d:95b4:fa84:8c74:446f?
	([2601:647:4c01:b37d:95b4:fa84:8c74:446f])
	by smtp.gmail.com with ESMTPSA id
	l9sm11741546pfb.29.2016.02.03.11.56.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Feb 2016 11:56:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56B25500.7030402@gmail.com>
Date: Wed, 3 Feb 2016 11:56:45 -0800
Message-Id: <34309FCD-61ED-4DC8-BD3C-219DE8924BDA@gmail.com>
References: <56B25500.7030402@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: binutils upgrade to 2.26 failure - unsupported reloc 42 against global symbol __gmon_start__
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
X-List-Received-Date: Wed, 03 Feb 2016 19:56:48 -0000
X-Groupsio-MsgNum: 77478
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B0C34762-0A6F-40CC-BD68-2DE5B2CC90AB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B0C34762-0A6F-40CC-BD68-2DE5B2CC90AB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 3, 2016, at 11:29 AM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>=20
> My chromium build is now failing due to:
>=20
>    commit 86ade2cc2553c942d9526c5323a11ae151653505
>        binutils: Upgrade to 2.26
>=20
> | FAILED: x86_64-oe-linux-gcc  -m64 -march=3Dcorei7 -mtune=3Dcorei7 =
-mfpmath=3Dsse -msse4.2 =
--sysroot=3D/z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-64 =
-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,now -Wl,-z,relro =
-Wl,-z,defs -pthread -Wl,-z,noexecstack -fPIC =
-B/z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chromium/49.0.261=
2.0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/Release/bin =
-Wl,--disable-new-dtags -m64 -Wl,-O1 -Wl,--as-needed -Wl,--gc-sections =
-o chrome_sandbox -Wl,--start-group =
obj/sandbox/linux/suid/chrome_sandbox.process_util_linux.o =
obj/sandbox/linux/suid/chrome_sandbox.sandbox.o -Wl,--end-group
> | =
/z/chromium-49/build/tmp-glibc/work/corei7-64-oe-linux/chromium/49.0.2612.=
0-r0/chromium-49.0.2612.0/third_party/binutils/Linux_x64/Release/bin/ld: =
error: =
/z/chromium-49/build/tmp-glibc/sysroots/intel-corei7-64/usr/lib/../lib/crt=
i.o: unsupported reloc 42 against global symbol __gmon_start__
> | ../sysdeps/x86_64/crti.S:66: error: unsupported reloc 42
>=20
> Any suggestions on how to approach this?

do a clean build. Its mixing objects

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_B0C34762-0A6F-40CC-BD68-2DE5B2CC90AB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlayW4EACgkQuwUzVZGdMxSI5gCaAm8Dzqt1MxAiiOl8eSK0keHd
n28Aniq2zntWQLYLX8TLsU+01HHt0Ie3
=iKQL
-----END PGP SIGNATURE-----

--Apple-Mail=_B0C34762-0A6F-40CC-BD68-2DE5B2CC90AB--
