Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id DEF867CD23
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 19:28:42 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id g9so1078850eds.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 11:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vD+ybPgqIHRGsXPhjA0Eb7vQRmBvshXmSnFEHf0Kuk8=;
	b=Li/HiU5SdlmdXtRvhjPThuHjO6WQu+dXHc0ik9k7UPhi2gpYcR+4xbeR5K4BD0DiTL
	7KvNpfBzEB2I5ezrRMWJw5JmZ6VBqB9yqvRvgLbuYK1obUJS/yycGqLxJZie1PkOci2X
	AovWj0gGLqXfPYLyZrITZBrsvSNOo7pFSf+iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vD+ybPgqIHRGsXPhjA0Eb7vQRmBvshXmSnFEHf0Kuk8=;
	b=W3TsDw0pSchl5PjLw/uNemuToUNImHnfZa8S42VGlzvM3Wqw/CUOKi0eF+HmoipaOF
	fokhMNonrB08+GXFg+4Hb5nm8/+fO2Na3MspI+ZQMhyTP5KMUmgqHL9MrWIAt3pvCV3b
	uKfdzI2aJRRZzvPSNChXKfyoWQ3Z4OujTA4GkcGXB4eOoXje651Q23lvFk8cFyxBmhpC
	xnUEtdE5U9zce4mx7kYt+Hz/iWzXHbCMCieDfu64MRLnNrjwTHmgRMrUt6oY6aIRZt5M
	Fsz+gLHLFQSXEAUUM37zJLEo3jO+0bZ5yQwJUcJvGPvfPq39BLpPHSB0GMt82iXDKRuo
	RawA==
X-Gm-Message-State: APjAAAVsWxrl8d7gR9ntC4cs5l+mprUFTkv6zyJ+CuNhmTW5+bA7Kd8T
	Mey5JqkCwQwaGlYcfr2j4+WgWS+ToNA=
X-Google-Smtp-Source: APXvYqwI+k/84vsnVWMP9EIqyHRGlzVVYkENMOMtPdwoukeVFBmm+gd4Jow6tsIfNxUHtcx6qC+GBA==
X-Received: by 2002:a17:906:4bc8:: with SMTP id
	x8mr4386455ejv.114.1551554923491; 
	Sat, 02 Mar 2019 11:28:43 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-118E-86C-E9FB-6784.dyn6.twc.com.
	[2606:a000:1401:880d:118e:86c:e9fb:6784])
	by smtp.gmail.com with ESMTPSA id d42sm581050ede.30.2019.03.02.11.28.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Mar 2019 11:28:41 -0800 (PST)
Date: Sat, 2 Mar 2019 14:28:37 -0500
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190302192837.GJ5026@bill-the-cat>
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
	<1551479212-28944-3-git-send-email-trini@konsulko.com>
	<e44ab9ad197708fae61fefb6b235e62ae59f0dcb.camel@linuxfoundation.org>
	<20190302174624.GH5026@bill-the-cat>
	<ad024f8fb7f7fb2f8bb82a6e878d75a4325565ab.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <ad024f8fb7f7fb2f8bb82a6e878d75a4325565ab.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] inetutils: Import version 1.9.4
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
X-List-Received-Date: Sat, 02 Mar 2019 19:28:43 -0000
X-Groupsio-MsgNum: 121836
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VkqCAaSJIySsbD6j"
Content-Disposition: inline

--VkqCAaSJIySsbD6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 02, 2019 at 07:25:29PM +0000, Richard Purdie wrote:
> On Sat, 2019-03-02 at 12:46 -0500, Tom Rini wrote:
> > On Sat, Mar 02, 2019 at 05:00:18PM +0000, Richard Purdie wrote:
> > > On Fri, 2019-03-01 at 17:26 -0500, Tom Rini wrote:
> > > > In order to have more robust stand-alone network tools in oe-
> > > > core,
> > > > bring
> > > > in vim from meta-openembedded/meta-networking.  This imports the
> > > > recipes
> > > > as of git commit:
> > > > commit 408204073e6bdcd8ac586e05d5b75213417673f2
> > > > Author: Martin Jansa <martin.jansa@gmail.com>
> > > > Date:   Thu Aug 16 20:39:15 2018 +0000
> > > >=20
> > > >     inetutils: fix build with glibc-2.28
> > > >=20
> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > >=20
> > > vim and inetutils will need entries in maintainers.inc else we'll
> > > see
> > > selftest failures.
> >=20
> > Ah, OK.  Does that generally involve more than ack'ing the automatic
> > upgrades (that one gets CC'd on I assume) and answering questions?
>=20
> That and helping out with upgrades when new versions appear even if the
> AUH can't handle it.

Yeah, I can handle that much still :)  I'll drop myself in for v2.  I'll
wait until Monday to give anyone else a chance to chime in on anything
else I might have missed.  Thanks!

--=20
Tom

--VkqCAaSJIySsbD6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcetllAAoJEIf59jXTHXZS4UAQAIZL2hs+0TiBoWmlz0UEIist
d8y38N7N1rAWfhTb10a9PDBgMbkaWh5XqAVUW0Tpn5v5x2a3Cd+EDOJbyJDIhHey
BuSCF+ZEGEA8DaLIPFQDwJsMRknJku3VfRKfmq+dLywUuVpPWJTtmTrt6TfXsj6D
JEU37q6Kdt8AcH+H9b0FG00Qf5x9n6qBvD6dZUU2pfFG5pInGXcxWboRN34mIDao
ZxThoEs73eTqr8g8Jn6/pGZXt7xlwM8aAM68yJtx/39rh6S2PCy1kZZa7SKKk2Mj
UvNiGF3kee/qEUg4dGsv6xcpA5YwA+JMjNAFK7iT3fQsQTCuutrLngKCmtKsObR5
NmzqknNEk1yp79pRtQyEa3vqlc45T6MQqlFG9HFxafclx/CrVxozhgM7GiItnCFd
2+l4UzpGwaYGFj2nOexd2AwoJM+6p6wrGnrnyVNJe0/uXP5sldyNwxuhNOAdmzY4
xR9Sw4yCleoF4BsEGk5fteco715rWOAV2G7fHjgOAFICrrRjqK099FdmtId/Csxk
+y+5Nq57i0ja41IVKsv8DqghuV2SUMm0Fp2LJYR1jIC2NmQ3Az5mT1blTaGDcGlV
7ae1BA0U8NfHPAH3i9OCy5j8f5uB+RJCYmfkWe5LY+ohR9orQ0vGMJLfbSnPzDT4
DU+OWpq6TYVacFaw00r2
=YD8y
-----END PGP SIGNATURE-----

--VkqCAaSJIySsbD6j--
