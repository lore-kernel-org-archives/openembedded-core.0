Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 95BD56B5D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 13:46:44 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id x55so9105021wes.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 05:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=sr9Pl1IZo1cFFFoT2zOPO+C4jiu8vMqL9VP+2QZhn3Q=;
	b=ZfDyY7GgGNofgPdz5418vEaK2GIo3i2h/dchXggGbuazjAnT12NM9exX+IPHoWydOB
	1u0VoJ4ryl9xDIlpDqRrhauIu3eYElMpdlOsMkqaCypXKMkAr9SoRReaDr3u4ST2mVDu
	KPOwNfx5N4csfh0zYjTTTKa6fR0+F5c2i1M1b1ip/niGAnNVgYo6Df2GWLyZH432mVbI
	juYNxboMRCpXg2wUgMhkdHMMxczyMIdAOXL+k+auxtGWtZvNLxA0+48RVUfy65nPZrkn
	eQHq7cBiMLrckCbBs8FLEFMkBSgWA+qfpjdjhP5kvlnGvDUg1L4DZJ0fskxnwt6i1Lni
	oxvQ==
X-Gm-Message-State: ALoCoQlklS12pu40BbuDAmpbQRdMikbMxnUgpk5EMoWbors4YsgNKFWPpiqYr5eWXMjnzUybeKeZ
X-Received: by 10.194.23.73 with SMTP id k9mr43187342wjf.24.1385732803213;
	Fri, 29 Nov 2013 05:46:43 -0800 (PST)
Received: from ?IPv6:2001:610:612::b9df:fc03:e058:63e8?
	([2001:610:612:0:b9df:fc03:e058:63e8])
	by mx.google.com with ESMTPSA id pi6sm92364549wic.3.2013.11.29.05.46.41
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Nov 2013 05:46:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <F8B3526C-4727-4090-A092-1827AAE52F71@dominion.thruhere.net>
Date: Fri, 29 Nov 2013 14:47:25 +0100
Message-Id: <ADD31F3B-8E62-411A-AE0C-8F3A616BB0FC@dominion.thruhere.net>
References: <F8B3526C-4727-4090-A092-1827AAE52F71@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Nitin A Kamble <nitin.a.kamble@intel.com>
X-Mailer: Apple Mail (2.1822)
Cc: Tim Orling <ticotimo@gmail.com>, Elias Bakken <elias.bakken@gmail.com>
Subject: Re: Perl CPAN module install path bug in cpan_build.bbclass?
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
X-List-Received-Date: Fri, 29 Nov 2013 13:46:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 nov. 2013, om 09:45 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

> Hi,
>=20
> I've been working on perl modules and I noticed some of them don't =
work properly and nearly all of the non-working ones are Build.PL based =
and use cpan_build.bbclass.=20
>=20
> A working module looks like this:
> 	[koen@rrmbp v2013.06]$ dpkg-deb -c =
deploy/eglibc/ipk/armv7ahf-vfp-neon/perl-module-test-differences_0.61-r0.1=
_armv7ahf-vfp-neon.ipk
> 	-r--r--r-- root/root     19567 2013-11-28 15:20 =
./usr/lib/perl/vendor_perl/5.14.3/Test/Differences.pm
>=20
> A non-working one looks like this:
> 	[koen@rrmbp v2013.06]$ dpkg-deb -c =
deploy/eglibc/ipk/armv7ahf-vfp-neon/perl-module-build-withxspp_0.14-r0.0_a=
rmv7ahf-vfp-neon.ipk
> 	-rw-r--r-- root/root       361 2013-11-28 16:50 =
./usr/lib/perl/auto/Module/Build/WithXSpp/.packlist
> 	-r--r--r-- root/root     22557 2013-11-28 16:50 =
./usr/share/perl/Module/Build/WithXSpp.pm
>=20
> Looking through the git logs it looks like Nitin tried to fix it, but =
stopped halfway and only did cpan.bbclass properly:
>=20
> 	=
https://github.com/openembedded/oe-core/commit/83796edd29561f02b6f7b036351=
711f8def77a4f
>=20
> Since I don't know anything about perl, should cpan_build.bbclass be =
changes to install into /usr/lib/perl/vendor_perl/5.14.3 as well or are =
Build.PL based modules 'special' and need a lot more work? This is what =
I had in mind:
>=20
> -        --install_path lib=3D"${datadir}/perl" \
> +        --install_path =
lib=3D"${libdir}/perl/vendor_perl/${@get_perl_version(d)}" \

Thinking "less is more", this seems to work:

diff --git a/meta/classes/cpan_build.bbclass =
b/meta/classes/cpan_build.bbclass
index eaba40a..5b0ad61 100644
--- a/meta/classes/cpan_build.bbclass
+++ b/meta/classes/cpan_build.bbclass
@@ -32,7 +32,6 @@ cpan_build_do_configure () {
=20
        perl Build.PL --installdirs vendor \
                                --destdir ${D} \
-                               --install_path lib=3D"${datadir}/perl" \
                                --install_path arch=3D"${libdir}/perl" \
                                --install_path script=3D${bindir} \
                                --install_path bin=3D${bindir} \

[koen@rrmbp v2013.06]$ dpkg-deb -c =
deploy/eglibc/ipk/armv7ahf-vfp-neon/perl-module-build-withxspp_0.14-r*.ipk=

-rw-r--r-- root/root       378 2013-11-29 14:44 =
./usr/lib/perl/auto/Module/Build/WithXSpp/.packlist
-r--r--r-- root/root     22557 2013-11-28 17:22 =
./usr/lib/perl/vendor_perl/5.14.3/Module/Build/WithXSpp.pm

opinions, flames, etc?=

