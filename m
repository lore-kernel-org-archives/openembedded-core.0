Return-Path: <roman@khimov.ru>
Received: from roman.khimov.ru (roman.khimov.ru [82.146.54.17])
	by mail.openembedded.org (Postfix) with ESMTP id 1A00C7317A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 11:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=khimov.ru;
	s=mail; 
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=gg2B1khD4OYNl+5sr8/uD5HOhJd+YJI99KyQvcUfNGA=; 
	b=hO6VSSWwsN/gIi4DlUJEsr7GRSWR3vgtesb7Q3gkIvInODYaokki6IJIDQliziS5GtZOAnTSaT3mn1u8OSIphPIYgJJZzwIsxyk0/7Rnajs1BDyIlibhp+qKT76pp522u0LfgKFiL79cfp96el9B6LVTW/9EhUk/r74T27uZnPxq0BicqDouXWYFpCyX4phCr6ZQUWrOmhUOuYO4lMI4Xe+suARTo/wIgbOkBBI3FMcahAvak0AIP12RadRgjXGk73UvMf96SlfyjFEzr6DdWJSCf7MFpFV+oFp2B2nErYYKkMwCxDIJpqhDuyhfs+IH02eyJQkakDNUU4qxLI+2lw==;
Received: from mail.pkcc-tb.ru ([185.33.199.10] helo=bancha.hex)
	by roman.khimov.ru with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.84) (envelope-from <roman@khimov.ru>)
	id 1a9X3Z-00044C-Ql; Thu, 17 Dec 2015 14:49:14 +0300
From: Roman Khimov <roman@khimov.ru>
To: Matthias Schiffer <mschiffer@universe-factory.net>
Date: Thu, 17 Dec 2015 14:49:13 +0300
Message-ID: <20429947.OAhnyEDPKl@bancha.hex>
User-Agent: KMail/4.14.9 (Linux/3.16.7-24-desktop; KDE/4.14.9; x86_64; ; )
In-Reply-To: <567284B0.4020603@universe-factory.net>
References: <cover.1450288828.git.mschiffer@universe-factory.net>
	<1893430.e3TcZXnnJp@masala.hex>
	<567284B0.4020603@universe-factory.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] base-files: create typical merged /usr symlinks if the "merged-usr" distro feature is set
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
X-List-Received-Date: Thu, 17 Dec 2015 11:49:16 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 17 =D0=B4=D0=B5=
=D0=BA=D0=B0=D0=B1=D1=80=D1=8F 2015 10:47:28 =D0=BF=D0=BE=D0=BB=D1=8C=D0=
=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Matthias Schiffer =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> On 12/16/2015 08:46 PM, Roman Khimov wrote:
> > =D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 16 =D0=B4=D0=
=B5=D0=BA=D0=B0=D0=B1=D1=80=D1=8F 2015 19:12:00 =D0=BF=D0=BE=D0=BB=D1=8C=
=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Matthias Schiffer=20
> > =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > Also, you probably want to add this symlinks to fs-perms.txt. I don=
't
> > quite
> > remember which packages failed for me without it, but there were so=
me.
>=20
> Is it even possible to have fs-perms.txt entries depending on a
> DISTRO_FEATURE?=20

Probably not.

> And can fs-perms.txt move files from one directory to
> another (as you suggested in your reply for PATCH 2)?

IIRC, yes.

> AFAICT, fs-perms.txt is only there to fix some common issues with
> directory permissions. Most packages already respect base_libdir etc.=

> just fine, so in my opinion it would be preferable to just fix the
> packages which don't if adding such things to fs-perms.txt is non-tri=
vial.

fs-perms can fix things automatically, with no additional code in recip=
es (and=20
that's a nice thing IMO), but, yes, at the moment it probably can't do =
or=20
don't do things based on DISTRO_FEATURE settings. Maybe using=20
FILESYSTEM_PERMS_TABLES can help or even generating fs-perms on the fly=
 taking=20
into account real ${somedir} values.

