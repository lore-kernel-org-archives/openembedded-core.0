Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOQKU-0002Pz-Pu
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 11:22:06 +0200
Received: by wibhj13 with SMTP id hj13so1588816wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 02:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RqyqEqjW+/8sGs2+x854DnWWN2dcWm4KVEK6Zvu6Mys=;
	b=nVfcOAuw8ilZUWdXp1kpWPEO5ppvzSD/F5yMG3KnpNPTRze2IaJkgn6JMqBHSjOpnD
	JqUD4yzdLc8Hl3BoZNetsXwkoAjLcTln9X6nRPQIObK2TVcOqbLAAszaMMuZ1n52arDJ
	fGWVGCydejp5ElufYcYzokOO75laguWX+t9UrqtBm99gSVvrxb1oIZSYscKR9s6V17u2
	RAb5IHJz53TJFkazCR28N3LTFCdj+ry1FlPrARHqvvQTu/pD8B50ZpDa8LFhb5n25Hrg
	XkMdkS6YO8Msang+sPTPVVQgVTAMpqtyqqNUZp/WM4+XP1UH0BDmSXc0xOc/easTMzQo
	v/Eg==
Received: by 10.180.80.104 with SMTP id q8mr20185087wix.14.1335690746451;
	Sun, 29 Apr 2012 02:12:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h8sm30659698wix.4.2012.04.29.02.12.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 02:12:24 -0700 (PDT)
Date: Sun, 29 Apr 2012 11:12:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120429091230.GB350@jama.jama.net>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: gcc 4.7 + mips64 architecture support
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
X-List-Received-Date: Sun, 29 Apr 2012 09:22:06 -0000
X-Groupsio-MsgNum: 21313
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline

--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 25, 2012 at 04:31:53PM -0700, Khem Raj wrote:
> Hello
>=20
> Now that release is almost out of door. I would like some eyes on the
> gcc-4.7 work
> and mips64 architecture support that I have done meanwhile
>=20
> I have made sure that gcc-4.6 still keeps working and I have patches
> for gcc-4.5 too
> for meta-oe too. I have repeatedly built core-image-sato and
> core-image-minimal for uclibc/eglibc
> but more coverage would be nicer.
>=20
> The patches are posted here
>=20
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/misc
>=20
> I would appreciate any feedback or testing on this

I got some errors while building gcc* recipes (overwriting header=20
files in work-shared or something like that) but that's not new, gcc-4.6
was failing the same - restarting build few times and it will succeed
once.

My minimal shr-lite-image compiles now fine and works on om-gta02
(armv4t) sofar without segfaults.. so looks good.

For normal image and feeds I've few more recipes which are failing with gcc=
-4.7:

meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
  | Unknown parameter a interfaceName for tags/attrs
  | make[2]: *** [DerivedSources/WebCore/HTMLNames.cpp] Error 255
  http://norman-schleicher.de/jenkins/job/shr-core-branches-om-gta02-shr-im=
age/ws/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/webkit-efl-1.7.3+sv=
nr105069-r1/
  I'm upgrading this one instead of fixing it, because we had some
  issues in runtime with current version, but new version needs newer
  libsoup-2.4->glib-2.0->gobject-introspection->etc and fails with
  different compilation issues.. so maybe if you know how to easily fix
  it in current, we can, otherwise I'll continue to work on upgrade

  BTW: similar fix as you did for webkit-gtk is in upstream r109509

meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
  ../../../src/frontend/common/TemplateBuilder.hh:54:42: error: redeclarati=
on of 'SmartPtr<typename ElementBuilder::type> elem'
  ../../../src/frontend/common/TemplateBuilder.hh:50:49: error: 'SmartPtr<t=
ypename ElementBuilder::type> elem' previously declared here
  http://norman-schleicher.de/jenkins/job/shr-core-branches-om-gta02-shr-im=
age/ws/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gtkmathview-0.8.0-r=
1/

meta-smartphone/meta-shr/recipes-shr/3rdparty/numptyphysics_svn.bb
  fixed in shr branch

meta-mozilla/recipes-mozilla/firefox/firefox_10.0.2.bb
  | /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/w=
ork/armv7a-vfp-neon-oe-linux-gnueabi/firefox-10.0.2-r1/mozilla-release/ipc/=
chromium/src/base/file_util.cc:228:35: error: 'ftruncate' was not declared =
in this scope
  probably easy to fix, adding Otavio to CC (maybe he has upgrade or fix
  ready)

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+dBf4ACgkQN1Ujt2V2gBzlTwCeNYUdCaZI+bcCxLPIGupWb/o1
oZoAoJpqqL97PXw4h8rnShBn1ovjEsXY
=kI9y
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
