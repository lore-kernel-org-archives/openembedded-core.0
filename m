Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id DF636771FA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 14:04:49 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id p63so61945272wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 06:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=+wlOXTJDofBl3RoVGU/RNH4WEMPepE+YaCtjtIttUX8=;
	b=dLe6ZRSJPADy+8lz8s4mi+A/ctd3JGp714HFuXivMPfGf2LjSabkzdWXPomWRNwk0x
	4NZmNS3xMEMbPiZLsUjuZJz1RuvJdWp4ZOqFOAhbQv0f+BCqYIIg+etNPvVFx27OH2mV
	fskfxZmRLC52rKjSwMROhBUAN5qfwUDw+vKsHhYGhH0JF4uRmwqxRp3weqcyCfroeh2h
	gqyFEFoy6saEQ+LoKwdh6lKaKgwSsN4nrhS5wZH0PQ036LCZsXQ3UURtBkQJJK/pC9tx
	b5FT151+zN+n+IoNMs7CX/ofzq0tma8WhfdSbedtQstUEjDo0t5/ZvEN7W3KzUTQ9BJR
	1wzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=+wlOXTJDofBl3RoVGU/RNH4WEMPepE+YaCtjtIttUX8=;
	b=Sv3Sl9UFe+kV94tGBDbuQchuehR0++iaTLSY/mb3LRCZmEriFvp0mqD+imFqLjPqon
	ahbwceuyyEKf+tgR2Vas16Tr4a4dg7LW+Fdi6PPwf2N4co6DyDqdMazzm3pN09JQN0/u
	V+E+RfPUt7k9btWRdG3JTWUJ5Sn5uhDESpunRwxwtaaeuZKYhGhrphj1xIX9ycdIIwIS
	AX7GZ5QUs4pVoJdgqR9Yci6WjO/f7sMZIey1O/Ji6dMFwRKMVkgUqq3vejTJ1vfe2P2b
	VHSZrDfyQE/4uSrJ7bBsoq/5VUITGVX3OhIxCKIeTS5W+KH6Lke/Qi7nFcployOkQyK9
	68CQ==
X-Gm-Message-State: AG10YOQfHKeTGs1fuEm//KBi6KRUHMlUQUzfLH/+DCwIkMI++AQdzERKXGRGAI4ju3iRSw==
X-Received: by 10.194.111.232 with SMTP id il8mr22121999wjb.150.1454767489566; 
	Sat, 06 Feb 2016 06:04:49 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	e198sm3430251wmd.0.2016.02.06.06.04.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Feb 2016 06:04:48 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAJTo0Lbm-AM=9tVYnY443RdHYqzs3LUg=tk6mTnaVer54hYpWg@mail.gmail.com>
Date: Sat, 6 Feb 2016 15:04:47 +0100
Message-Id: <658E71AF-D8E5-4119-AF9A-6192B127C1B3@gmail.com>
References: <8C0EB999-664F-45C3-B3AA-14B175F2B475@gmail.com>
	<CAJTo0Lbm-AM=9tVYnY443RdHYqzs3LUg=tk6mTnaVer54hYpWg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][jethro] cross-localedef-native: add ABI breaking glibc patch
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
X-List-Received-Date: Sat, 06 Feb 2016 14:04:51 -0000
X-Groupsio-MsgNum: 77682
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0B6C13EC-4EC9-4F79-8775-FDD72DFA63E3";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_0B6C13EC-4EC9-4F79-8775-FDD72DFA63E3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 05.02.2016 um 15:26 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
>=20
> On 5 February 2016 at 10:25, Jens Rehsack <rehsack@gmail.com> wrote:
> Add patch from commit 96b1b5c127e9e0e637aaf7948cf3330a94a5cd57 to =
cross-localedef-native
> to avoid broken images built with ENABLE_BINARY_LOCALE_GENERATION set =
to 1:
>=20
> This impacts master too, so I've merged this into ross/mut and endorse =
it for Jethro.

I meant I've seen an upgrade to glibc-2.23 on master. For master I =
suggest a patch
which forces cross-localedef-native and glibc share the same =
glibc-sources.

> I've also a filed a bug against QA so we notice this breaking on the =
autobuilder...

Cool, thanks.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_0B6C13EC-4EC9-4F79-8775-FDD72DFA63E3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWtf1/AAoJEESZlq7c5Qqdc+oP+gNgCOitPMAiO6g7ekuYda4/
Nz5J/fX5rlXe8bb77gyGzAO+zC8liGboheJ1yuocwO1amfI70jCA5INH7yS7O6Bs
12HyTyQOG2g2/yXNNTlOHlK71+y2sF7cBIZwDXiB3ezSahya2u5PKELyaqLlQvYk
rBylllcbMEHWi/19cDEZEv1E5GK0lFFMm8b0LgJ4e8tDt866nDtkU+vARX85Nx3f
wh09nAOccblLwgYGnBgqViPMIHTKsAKawOUs2FI68+yKcVkuxDqsojgj7sr5W8KT
xg7QGS2DAgyztYRAhcweLOwJW2R0gwBpTVwWdRIY6OL/ZGvfQ5369XQJYaGM2Dks
yhkLayvZrb1KfAD9JCl3rq3U6vnjta+O6GM1pRCu9+c/KiQgAFqb2xIQAjUA01R0
Et8cVwg4toJ4ukM+TDDcjVbtvm7eW52lEqiALTflV05ph2J9ZlKduFuXCCYf7PN2
O1SMEgF/FMcDAVmw/qJ5bp8lsVMKq0YM2rHT7rWCkY9/kzMsV/IjwKTITBmOJYr2
cfuUqyPWRSVuXn5fwAugWmsZSRTHLxsBh2ONNEmMoteoTBV+HYYsRXNW/ZdJMe4F
35nuia7/z02mODZQYL192hXMPDdHrVh6H/GKM5iVisrf+XwFJ3ND2xBFZIcTep8D
kQNuwlcaBMDi4EMK/TO0
=PYVD
-----END PGP SIGNATURE-----

--Apple-Mail=_0B6C13EC-4EC9-4F79-8775-FDD72DFA63E3--
