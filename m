Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id A031860596
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 00:51:55 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id d190so8405712ywd.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 16:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bpIxGS9SrpOsxwjORaO4mFDLQmq++j2ueqyDgzQvGKg=;
	b=eNOAxh3YilkLvqA85wUoaAkIgUNAY4JHorlmSJ2uNcOXmBm5Uu+Af9jR2PX96gFKqo
	UQ2OQDOoqyuS2eP/uc03IeGQ0lB7bt2PvOI6oK0IVc3gf4uLT207fxdowqV0sHCe9odH
	vHag9rDgeBIc+38dY3iJXZ3kdhvHFZYCFXVas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bpIxGS9SrpOsxwjORaO4mFDLQmq++j2ueqyDgzQvGKg=;
	b=BubHFAfGfxlHFTjfCp1TSCFaY2Oy6N//tJal/4ltBMtTe01QQhzSL+JCOTNKxK2F9M
	W+gwxeU7Ar7+YvjLGC4N0truhumEGPe/dS0B+3140N0mHLorxYFe3Rmm0wizwIJEWce4
	ifCt//pf3JPBrvZ+wQ1bFK/2uuIepjUdslAQTzyDnK8PaLpiUU8UnXJR1TevX1cJRLD+
	x5hewRw5V/uBLIH+ZqrgZB38euROEuzhDMjvdfQQK712FRASsgIiKNY71MPivXXVUqM2
	nBnD/325PrDFUNNxwhJC7FeA6smIs+iEyvdP52zJ3etX9Vl4oKb7lqxuMt8G7HYKrEBw
	aRrg==
X-Gm-Message-State: AGRZ1gKAzkmOUYz0AFSf/qw7JwGtsNJSObipHr9+QuJIsTyAlRIEj2f2
	8WrzH2BurAExU74hKgHZX6tJhQ==
X-Google-Smtp-Source: AJdET5fDLlG0480NdgLPsAkjXBXAqsovrngSXAJB1rdVmQJKpKH0/1zppFbhHU18EC+hlPA81LzGJg==
X-Received: by 2002:a81:58c4:: with SMTP id
	m187mr31496349ywb.300.1543279916270; 
	Mon, 26 Nov 2018 16:51:56 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-133-47.ec.res.rr.com. [65.184.133.47])
	by smtp.gmail.com with ESMTPSA id
	x10-v6sm508080ywa.94.2018.11.26.16.51.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 16:51:54 -0800 (PST)
Date: Mon, 26 Nov 2018 19:51:51 -0500
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20181127005151.GG11247@bill-the-cat>
References: <20181122225820.2553-1-abrodkin@synopsys.com>
	<CAMKF1sqbHtV1UYiXre_1sNEzyFWJw3mRs_hcuVzu+us_r0OWVg@mail.gmail.com>
	<8950e9f58055a8667d20ff83de1f8acd14b7f303.camel@synopsys.com>
	<CAP9ODKrJ0Yshn29tSt-Aj1Gr01+XrZ7C_K4Yn4r6yA4CdkiCnQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrJ0Yshn29tSt-Aj1Gr01+XrZ7C_K4Yn4r6yA4CdkiCnQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v7] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Tue, 27 Nov 2018 00:51:55 -0000
X-Groupsio-MsgNum: 118628
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J/n4Xdq2of065shL"
Content-Disposition: inline

--J/n4Xdq2of065shL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 26, 2018 at 09:07:37PM -0200, Otavio Salvador wrote:
> Hello Alexey,
>=20
> On Mon, Nov 26, 2018 at 7:30 PM Alexey Brodkin
> <alexey.brodkin@synopsys.com> wrote:
> > On Sat, 2018-11-24 at 06:57 -0800, Khem Raj wrote:
> > >
> > > http://errors.yoctoproject.org/Errors/Details/202185/
> >
> > Looking at the target name "u-boot-tools-1_2018.11-r0 do_compile"
> > I think it might have something to do with bump of U-Boot to v2018.11
> > and the error message in question was added in v2018.11-rc1,
> > see http://git.denx.de/?p=3Du-boot.git;a=3Dcommitdiff;h=3Da4958a71017fb=
142542f977c843c5fce769fc6ea
> >
> > The problem is we use "sandbox_defconfig" as a dummy defconfig
> > because otherwise (not configured) U-Boot's build-system won't
> > allow us to proceed and in its turn mentioned patch adds a check
> > for a target platform like "if defined(__x86_64__)" which
> > we essentially don't satisfy and so we fail.
> >
> > There're the following solutions:
> >  1. Revert mentioned patch
> >  2. Disable "CONFIG_EFI_LOADER"
> >
> > Reverting is not nice and not future-proof.
> > Disabling of "CONFIG_EFI_LOADER" might be done in a couple of ways
> > like:
> >  1. Patching sandbox_defconfig
> >  2. Filtering "CONFIG_EFI_LOADER" from "sandbox_defconfig" right before
> >     execution of "make sandbox_defconfig"
> >
> > I think latter option is the simplest and cleanest.
> >
> > Should I send a patch for that?
>=20
> Let's add Tom (U-Boot upstream main maintainer) to this so he can comment.

Hey, so you've hit the problem Fedora also hit, but we haven't gotten a
real solution to.  Yes, the best "fix" here for just building tools
would be to turn off EFI_LOADER in sandbox, on all arches.

--=20
Tom

--J/n4Xdq2of065shL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJb/JUnAAoJEIf59jXTHXZS3IwP/AmwGZe3w8rL31u8i086+KKD
OokdNMv8faQZxetEmNAmythz+x51rpATnMdhtyt6cOug3GIW0W62IR6Zt304lfn5
b0tHqAzB12fesayVqCZ44kFRFP6YIURkQGXqngF6ydM3eFKxDRgdO5wgiCGfJ4in
ayMrb6r1ljdMMNApC6oFgd2dOGFBsmfPU4CETwJwBrVOVI0DVzT80uhRHMR3zpuH
rXSO/+Ml22IuoHrHFpxQU1l9pPccFvZ5dihgR7vyNI6WnBFmoJYDCa4rwXxqd+2A
QoL3pjBjVZj6VvUrGJKlVK9SDJxbaX8CjMazfdt/RwPqCDIvwfslppf/hiinA3Ae
7orGBQenIwNb1YeINRAFzxKTOfJb111ykk8llhoKIcW7/DJqd+NfFPL+WS+QTF8E
43ELG054XVfJNoJV4TkAtKQ5ZFtLzfkB8/0jXc50algOuPvTmqS9UrZVc8JA2nyO
YBAc5Ki6XEi7kwrxb9WIYn/ZNXA1QYLumPS7vgJPNyj9BuCpdqwhNUoNrs323cJw
suL3ACCeznK6IPLlt6URKhNeu94RGAL6caVUiy9Azfg0ZpKiVW8K38UpDbTnijeY
V7UAIAjO/hr6qyoPchcMjrtWd68QRnvIyPm3nctFbfqYvNLcwCmSA6+fUid9/rCc
js1XDvnb1jBFjwDjMtW+
=mnc3
-----END PGP SIGNATURE-----

--J/n4Xdq2of065shL--
