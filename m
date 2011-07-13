Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qh5oA-0001Gq-2F
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 22:14:01 +0200
Received: by wyg30 with SMTP id 30so444363wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 13:06:44 -0700 (PDT)
Received: by 10.216.54.197 with SMTP id i47mr5623785wec.48.1310587604491;
	Wed, 13 Jul 2011 13:06:44 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p80sm1770232weq.17.2011.07.13.13.06.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jul 2011 13:06:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAOd_LFwkz6w5oOmwbQwikW6bptwtWiwXGXwmPLDEHga0SAjCdQ@mail.gmail.com>
Date: Wed, 13 Jul 2011 22:06:37 +0200
Message-Id: <22EEF991-A119-48E8-8387-2B6315008E78@dominion.thruhere.net>
References: <CAPhnLPCXP0mPU6=WxG8n-zLJJOozwyqZo9pMqkrmO4gdOJrDOg@mail.gmail.com>
	<CAOd_LFwkz6w5oOmwbQwikW6bptwtWiwXGXwmPLDEHga0SAjCdQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/1] Additional license wrangling functionality
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2011 20:14:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 jul 2011, om 16:06 heeft Cliff Brake het volgende geschreven:

> Many thanks for implementing these improvements!
>=20
> The manifest file for core-image-minimal is attached.
>=20
> A few thoughts after testing this ...
>=20
> I like the way the license information is being cleaned up in the =
recipes.
>=20
> In the past, I have collected licenses by using the following
> procedure directly on a device:
>=20
> cd /usr/lib/opkg/info
> grep License *
>=20
> In the past (OE Classic build from a year ago or so), the Control file
> in a packaged looked like:
>=20
> Package: libc6
> Version: 2.9-r37.3.6
> Description: GNU C Library
> Section: libs
> Priority: required
> Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
> License: LGPL
> Architecture: armv5te
> OE: glibc
> Homepage: http://www.gnu.org/software/libc/libc.html
> Depends: update-rc.d, libcidn1
> Source: ...
>=20
> Now, in OE core they look like this:
>=20
> Package: libc6
> Version: 2.13-r6+svnr14157
> Description: Embedded GLIBC (GNU C Library)
> Embedded GLIBC (EGLIBC) is a variant of the GNU C Library (GLIBC) that =
is
> designed to work well on embedded systems. EGLIBC strives to be source
> and binary compatible with GLIBC. EGLIBC's goals include reduced
> footprint, configurable components, better support for =
cross-compilation
> and cross-testing.
> Section: libs
> Priority: optional
> Maintainer: OE-Core Developers =
<openembedded-core@lists.openembedded.org>
> Architecture: i586
> OE: eglibc
> Homepage: http://www.eglibc.org/home
> Provides: glibc
> Source:  ...
>=20
> Why is the License field no longer included in the control file?
>=20
> One of the biggest issues with the current license mechanism is the
> license directory seems to only populated at recipe build time, not at
> image rootfs generation.  Therefore, you have to do a clean build to
> get a list of licenses.  It seems like it would be more optimal if the
> License information was stored in the packages (as it was in the
> past), and then extracted from each package during the rootfs phase.
> The license manifest could then be created similar to the way the
> testlab stuff is done in OE:
>=20
> =
http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/class=
es/testlab.bbclass

I ported bits of that to narcissus to generate a manifest, have a look =
at:

=
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/narcissus/tree/scrip=
ts/extract-metadata.sh
=
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/narcissus/tree/scrip=
ts/assemble-image.sh#n275

Narcissus will generate a html page that looks like the manifest we use =
internally in TI to get things approved by the opensource reviewboard, =
so if things look strange, that's why :)

The angstrom autobuilders log a subset of testlab into a git repo: =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/log/?h=3Dyoc=
to

regards,

Koen=


