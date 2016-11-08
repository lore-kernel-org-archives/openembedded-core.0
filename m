Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2F36D719EF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 16:22:05 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id d2so110423382pfd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 08:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=12oaCj0hUdyAk1rPE0W//XC9nEV6Xh+OZ+1+PqIgQq4=;
	b=ScXFWA9ToQrQJUJc14AFanQ4kMLFIm+6ZtQkRjBZiXUZQKBC3OlGNCU3JGLhL25M+b
	8H6f//3U0efGGBNO6Sw89GRoWzDiIWp///bU4mWdyT0FPuxXdbN0vvRTQaEC4s7OywLI
	BjZYPbXKKtar9H8UMU3NWGw1RAMyulwmDJoZOX+52v9x/0CzYiIuWulYKHj909yqyqxp
	1lqeyueF1BFXuo2smVX3WPFaml+meWJMuuz1HaV1vYsibU0cvXA3M5lBPJyegPiwjv7n
	qK9RzI0GO0hOTS0QCmjIw4jdJRhKzhkIAaxtw2M1HbUEFcuo9f+hZK+c39M6RHH52Eed
	ulNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=12oaCj0hUdyAk1rPE0W//XC9nEV6Xh+OZ+1+PqIgQq4=;
	b=OlBKAs8U/EcTQ2rHR2NC+rTdZsFS/v0R8HwU/gzf5cR2OOQQB/bn57537LYlyPUbZz
	sefQr4cQAly6YhRJI+ypXDNeSjVFMgsSyrIPPyGq44pXTO/R3Wjv5Fuf0kgiurpLCjk3
	sOJNbSzUUSvBZLJPjeRkbMbuB7YUWCwhZF08zPLMCjb2kzd0sAmOm2zY/6FaQ+34As6q
	zwtr8due/Psem0oqKAibPeG5c11EseY6iGBHkXQ+73tzSmRwL5J0MPZ+fTXWlqhCceMR
	/mLA3GHCksVa/0+uilwBZ7hY7Du86g0Al8v41e5vgDDksIk39HnNEU04GVBupNvnDKvu
	d1Ww==
X-Gm-Message-State: ABUngvex1dnXIaEH/F7FOSI7cT6qtD/hVku+NciprvFansIlowgJKZErbm8qrLQQcW6rdA==
X-Received: by 10.98.43.67 with SMTP id r64mr24575616pfr.55.1478622127345;
	Tue, 08 Nov 2016 08:22:07 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:8af:972a:9de4:9514])
	by smtp.gmail.com with ESMTPSA id
	y2sm49305789pfk.54.2016.11.08.08.22.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Nov 2016 08:22:06 -0800 (PST)
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.20.1611080239410.18324@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <2baa43c4-5e7d-376f-edfa-3b0fea57986d@gmail.com>
Date: Tue, 8 Nov 2016 08:22:01 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1611080239410.18324@localhost.localdomain>
Subject: Re: methodology for writing OE perl recipes equivalent to RH RPMs
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
X-List-Received-Date: Tue, 08 Nov 2016 16:22:06 -0000
X-Groupsio-MsgNum: 89149
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="E52OxuhPF2hwRCPuFd4GLr8KcQ5DTvH0O"

--E52OxuhPF2hwRCPuFd4GLr8KcQ5DTvH0O
Content-Type: multipart/mixed; boundary="hqIfhL1cIbGJnXKdNxmc31BKNUWXDLXEt";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <2baa43c4-5e7d-376f-edfa-3b0fea57986d@gmail.com>
Subject: Re: [OE-core] methodology for writing OE perl recipes equivalent to
 RH RPMs
References: <alpine.LFD.2.20.1611080239410.18324@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.20.1611080239410.18324@localhost.localdomain>

--hqIfhL1cIbGJnXKdNxmc31BKNUWXDLXEt
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11/8/16 12:19 AM, Robert P. J. Day wrote:
>=20
>   (NOTE: i'm fighting with a compile error in a perl recipe i've
> written, but rather than ask about that right this instant, i want to
> explain my general methodology for writing these sorts of recipes so
> that, in the future, i'll have a much better idea of how to solve
> issues like this, so i apologize for the verbosity, and if people want
> to chime in with advice, i'll be delighted to write all this up later
> for everyone else's benefit. *then* i'll ask about my compile error.)
>=20
>   at the moment, for a "qemuppc" core-image-minimal target, i'm trying
> to write OE-equivalent perl and/or python recipes for 200+ x86_64
> centos RPMs -- effectively trying to reproduce (for powerpc) a running
> centos 7 system. in short, trying to port a centos 7 system to an
> OE-based powerpc box, which involves reproducing with OE equivalents
> quite a number of stock RPMs for which there are no obvious available
> recipes. from that initial list of 200+ RPMs, i'm down to less than 60
> to go, so that's progress.
>=20
>   most of what's left is perl, so here's my methodology for creating a
> perl recipe, and i'll use a specific example, "perl-Net-IP", and even
> though i'm doing this on my fedora system, there's not much difference
> between this system and a centos box, other than RPM version
> differences.
>=20
>   first, i typically pop over to the OE layers page, and do a search
> to see if there's already a recipe for what i'm looking for -- in this
> case, i didn't see an equivalent for "perl-Net-IP":
>=20
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dp=
erl+net+ip
>=20
> (Q: is that a reasonably comprehensive search approach? oh, and i've
> already been advised to avoid using the meta-debian layer.)
>=20
>   next, since it looks like i'll need to write a recipe, i install the
> equivalent recipe on my fedora box, just to see what i'm aiming for as
> a final result (or something reasonably equivalent):
>=20
>   $ sudo dnf install perl-Net-IP
>   $ rpm -ql perl-Net-IP
>   /usr/bin/ipcount
>   /usr/bin/iptab
>   /usr/share/doc/perl-Net-IP
>   /usr/share/doc/perl-Net-IP/COPYING
>   /usr/share/doc/perl-Net-IP/Changes
>   /usr/share/doc/perl-Net-IP/README
>   /usr/share/man/man3/Net::IP.3pm.gz
>   /usr/share/perl5/vendor_perl/Net
>   /usr/share/perl5/vendor_perl/Net/IP.pm
>   $
>=20
> ok, now i have an idea of what my final OE build should produce.
>=20
>   next, pop over to metacpan.org and search for corresponding source
> to find:
>=20
>   https://metacpan.org/pod/Net::IP
>=20
> at which point, write a fairly boilerplate recipe (the "noarch" RPMs
> are the easy ones), filling in among other things:
>=20
>   * "SRC_URI"
>   * checksums
>   * "S"
>   * "inherit cpan allarch"
>=20
> ///// start /////
>=20
> DESCRIPTION =3D "Net::IP"
>=20
> SECTION =3D "libs"
> LICENSE =3D "Artisticv1 | GPLv1+"
> PR =3D "r0"
>=20
> MAINTAINER=3D     "rday"
> HOMEPAGE=3D       "https://metacpan.org/pod/Net::IP"
>=20
> LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=3Dc=
da03bbdc3c1951996392b872397b798 \
> file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=3De9e36a9de734199567a4d769498f=
743d"
>=20
> SRC_URI =3D "https://cpan.metacpan.org/authors/id/M/MA/MANU/Net-IP-1.26=
=2Etar.gz"
>=20
> SRC_URI[md5sum] =3D "3a98e3ac45d69ea38a63a7e678bd716d"
> SRC_URI[sha256sum] =3D "040f16f3066647d761b724a3b70754d28cbd1e6fe5ea01c=
63ed1cd857117d639"
>=20
> S =3D "${WORKDIR}/Net-IP-${PV}"
>=20
> inherit cpan allarch
>=20
> BBCLASSEXTEND =3D "native"
>=20
> ///// end /////
>=20
>   at this point, i run:
>=20
>   $ bitbake -c fetchall perl-net-ip
>=20
> to make sure the fetch works (and adjust checksums to taste), then:
>=20
>   $ bitbake perl-net-ip
>=20
> to build, and check the contents of the resulting rpm file to see that
> it matches:
>=20
>   $ rpm -qpl perl-net-ip-1.26-r0.all.rpm
>   /usr
>   /usr/bin
>   /usr/bin/ipcount
>   /usr/bin/iptab
>   /usr/lib
>   /usr/lib/perl
>   /usr/lib/perl/vendor_perl
>   /usr/lib/perl/vendor_perl/5.22.1
>   /usr/lib/perl/vendor_perl/5.22.1/Net
>   /usr/lib/perl/vendor_perl/5.22.1/Net/IP.pm
>   $
>=20
> looks good, so that gets added to my build, and on to the next recipe.
>=20
>   couple final notes:
>=20
> * i'm currently ignoring all the dependencies i should be adding to
> those recipes; i'll put them in later
>=20
> * it's easy to see when i should use "inherit cpan_build" for the
> older-style Build.PL-based recipes
>=20
> * about to get into the arch-specific recipes, so that will get more
> interesting ... back shortly with my recipe that's causing the build
> error
>=20
>   thoughts?
>=20

this seems OK approach to me. I wonder how would recipe-tool fair doing t=
he
new recipe work of this sort of usecase. ( devtool add )

> rday
>=20


--hqIfhL1cIbGJnXKdNxmc31BKNUWXDLXEt--

--E52OxuhPF2hwRCPuFd4GLr8KcQ5DTvH0O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgh+60ACgkQuwUzVZGdMxSQuQCfW/NX35TVu6Ts7GqyX49W3qvC
qvAAnjEJ9yY5NYnMi5VaTKzJfH7sQpA8
=Uyll
-----END PGP SIGNATURE-----

--E52OxuhPF2hwRCPuFd4GLr8KcQ5DTvH0O--
