Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOoEV-0003ps-Vy
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 12:53:32 +0200
Received: by wera1 with SMTP id a1so1921765wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 03:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+JJPPTiuI1mXqMIzyuDbmmmkzbkxSax2u+TIZYW+wc0=;
	b=IHM9+IoTdax95rwYWDTX2hIqEa+PwcUNiQuFct2BNZt9tPWr7NyPaidAnVsmsOE4pG
	ll4CEuiFgnIC8JeT7B+onQaY3y7fzCpBSv9h7TFAPf+hCb5hYbiMl/GfQf/242iAOXB4
	N/AXvsI5MgzgzjW0AOdn+8A+GtU5V2rLfXtjSzJSO2F/dAwAq4YfjoSnk07PSqjwoSjR
	Fsde4NEcE0pT+/6apfiAJP2A/mFsjb2aNZA7YWyho53h4HCBS1wdMcSxpJiqu4/AOzOO
	F4JjwZR2KAVXp6Q6i4mlFsihYw1LLJT/BEkqhjnXd6Q2PLPH719cpW6OzCAx1ahwD8kl
	9lNg==
Received: by 10.180.94.33 with SMTP id cz1mr28059459wib.13.1335782629848;
	Mon, 30 Apr 2012 03:43:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e6sm27646856wix.8.2012.04.30.03.43.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 03:43:46 -0700 (PDT)
Date: Mon, 30 Apr 2012 12:43:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120430104345.GC3664@jama.jama.net>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
	<20120429091230.GB350@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120429091230.GB350@jama.jama.net>
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
X-List-Received-Date: Mon, 30 Apr 2012 10:53:32 -0000
X-Groupsio-MsgNum: 21323
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Content-Disposition: inline

--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 29, 2012 at 11:12:30AM +0200, Martin Jansa wrote:
> On Wed, Apr 25, 2012 at 04:31:53PM -0700, Khem Raj wrote:
> > Hello
> >=20
> > Now that release is almost out of door. I would like some eyes on the
> > gcc-4.7 work
> > and mips64 architecture support that I have done meanwhile
> >=20
> > I have made sure that gcc-4.6 still keeps working and I have patches
> > for gcc-4.5 too
> > for meta-oe too. I have repeatedly built core-image-sato and
> > core-image-minimal for uclibc/eglibc
> > but more coverage would be nicer.
> >=20
> > The patches are posted here
> >=20
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/misc
> >=20
> > I would appreciate any feedback or testing on this
>=20
> I got some errors while building gcc* recipes (overwriting header=20
> files in work-shared or something like that) but that's not new, gcc-4.6
> was failing the same - restarting build few times and it will succeed
> once.
>=20
> My minimal shr-lite-image compiles now fine and works on om-gta02
> (armv4t) sofar without segfaults.. so looks good.
>=20
> For normal image and feeds I've few more recipes which are failing with g=
cc-4.7:
>=20
> meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
>   | Unknown parameter a interfaceName for tags/attrs
>   | make[2]: *** [DerivedSources/WebCore/HTMLNames.cpp] Error 255
>   http://norman-schleicher.de/jenkins/job/shr-core-branches-om-gta02-shr-=
image/ws/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/webkit-efl-1.7.3+=
svnr105069-r1/
>   I'm upgrading this one instead of fixing it, because we had some
>   issues in runtime with current version, but new version needs newer
>   libsoup-2.4->glib-2.0->gobject-introspection->etc and fails with
>   different compilation issues.. so maybe if you know how to easily fix
>   it in current, we can, otherwise I'll continue to work on upgrade
>=20
>   BTW: similar fix as you did for webkit-gtk is in upstream r109509

fixed, patch for meta-efl sent to oe-devel
>=20
> meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
>   ../../../src/frontend/common/TemplateBuilder.hh:54:42: error: redeclara=
tion of 'SmartPtr<typename ElementBuilder::type> elem'
>   ../../../src/frontend/common/TemplateBuilder.hh:50:49: error: 'SmartPtr=
<typename ElementBuilder::type> elem' previously declared here
>   http://norman-schleicher.de/jenkins/job/shr-core-branches-om-gta02-shr-=
image/ws/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gtkmathview-0.8.0=
-r1/

fixed, patch for meta-efl sent to oe-devel

> meta-smartphone/meta-shr/recipes-shr/3rdparty/numptyphysics_svn.bb
>   fixed in shr branch
>=20
> meta-mozilla/recipes-mozilla/firefox/firefox_10.0.2.bb
>   | /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc=
/work/armv7a-vfp-neon-oe-linux-gnueabi/firefox-10.0.2-r1/mozilla-release/ip=
c/chromium/src/base/file_util.cc:228:35: error: 'ftruncate' was not declare=
d in this scope
>   probably easy to fix, adding Otavio to CC (maybe he has upgrade or fix
>   ready)
>=20
> Cheers,

I've found one more, which seems to happen only on x86(-64)
/OE/shr-core/meta-openembedded/meta-oe/recipes-multimedia/libav/libav_0.7.4=
=2Ebb
/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/lib=
avcodec/x86/h264_qpel_mmx.c: Assembler messages:
/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/lib=
avcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/lib=
avcodec/x86/h264_qpel_mmx.c:1294: Error: operand type mismatch for `cmp'
/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/lib=
avcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/lib=
avcodec/x86/h264_qpel_mmx.c:1298: Error: operand type mismatch for `cmp'
/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/lib=
avcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/lib=
avcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'
/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/libav/libav-0.7.4-r4.0/git/lib=
avcodec/x86/h264_qpel_mmx.c:964: Error: operand type mismatch for `cmp'

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+ebOEACgkQN1Ujt2V2gBwUOQCdG00IJ8MgSQZxKYLrHQZSHE+g
3qwAnAx4yBfP1oFVL4FU61+aybBAgn5a
=eFD+
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
