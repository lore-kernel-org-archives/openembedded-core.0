Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UJ1wh-00054C-7I
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 14:23:49 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so3038738pbc.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 06:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=OHg1Q+QuLQkCTrkfRV8o2fWUF5YGwHr9CAO3llQ2gLA=;
	b=NgtT9IBva73qDMeUr3Vjr9QOEsS+wTFU0YTlXOUydWIF5YAUIYnuNM7Mgqdkv8uR+K
	RUltPD1p9aWBvVuKjr1pXz1OeQqHHfSxwnHihmSaEhA0Y+f/Y9aCaT8IWxkK2wXAd7Hf
	x+knT2jomfcG7t1oDo7SkW2lEvl8MSdTvGpP0I+Nl/eEaiq4MGdSyZe7k4dnO4u4pNRg
	mZYqw74RzGz+Bg5Eu1hWc3sr6DdUTWO42wrGS0G3hMxZzhgMpt05juAvRk3eYBhre0Ui
	WuhcHwbpTAylOiojqtZ883JcOwzdFr6iomS89IZfrMaEMTZK3O8kE+DngRqpJUfLUv9r
	ZfUA==
X-Received: by 10.68.230.193 with SMTP id ta1mr2502997pbc.103.1363957612621;
	Fri, 22 Mar 2013 06:06:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 4sm2352550pbn.23.2013.03.22.06.06.49
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 06:06:51 -0700 (PDT)
Date: Fri, 22 Mar 2013 14:06:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Message-ID: <20130322130648.GT3219@jama>
References: <1363792150-24988-1-git-send-email-Martin.Jansa@gmail.com>
	<13d91230233.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<20130322091549.GC3219@jama>
	<CAC1BbcRfxRkSDfs5g5eWRoHOQYApR0hhuS=rvW_Ryghv0wO50A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAC1BbcRfxRkSDfs5g5eWRoHOQYApR0hhuS=rvW_Ryghv0wO50A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Use u-a for getopt
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2013 13:23:50 -0000
X-Groupsio-MsgNum: 36900
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Dvf9Qz7hFaodvwE"
Content-Disposition: inline

--1Dvf9Qz7hFaodvwE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2013 at 12:51:42PM +0100, Bernhard Reutner-Fischer wrote:
> On 22 March 2013 10:15, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Fri, Mar 22, 2013 at 09:08:34AM +0100, Bernhard Reutner-Fischer wrot=
e:
> >> On 20 March 2013 16:09:10 Martin Jansa <martin.jansa@gmail.com> wrote:
> >> > * when enable busybox installs getopt to ${base_bindir} and
> >> >   util-linux to ${bindir}, so there is no file conflict, but
> >> >   because busybox implementation does not support --long used
> >>
> >> Do you mean that Busybox' getopt does not support long options?
> >> If so, enable FEATURE_GETOPT_LONG in busybox instead of this patch?
> >
> > Having lsb working correctly even when someone has bad busybox defconfig
> > is right thing to do, isn't it?
>=20
> Probably. That aside, --long being rejected smells like a bug.
> >
> > busybox's getopt supports --longoptions, but util-linux's also supports
> > --long alias for that and that's what lsb is using
> >
> > $ getopt --longoptions
> > getopt: option '--longoptions' requires an argument
> > Try `getopt --help' for more information.
> > $ getopt --long
> > getopt: option '--longoptions' requires an argument
> > Try `getopt --help' for more information.
> >
> > busybox (IIRC even with FEATURE_GETOPT_LONG enabled) reports
> > getopt: unrecognized option '--long'
> > BusyBox v1.20.2 (2013-03-16 17:45:30 PDT) multi-call binary.
>=20
> That's odd, it seems to work for me?
> $ grep GETOPT .config
> CONFIG_GETOPT=3Dy
> CONFIG_FEATURE_GETOPT_LONG=3Dy
> CONFIG_ASH_GETOPTS=3Dy
> $ ./busybox getopt --long 2>&1 | head -n2
> getopt: option '--longoptions' requires an argument
> BusyBox v1.22.0.git (2013-03-22 11:20:17 CET) multi-call binary.

FWIW I have older version (from danny), but the same problem about not
using u-a is with master.

> > lsb already RDEPENDS on util-linux, changing lsb to use --longoptions
> > would be good, but having /bin/getopt and /usr/bin/getopt without u-a
> > to select preferred one is bad, that's why I used this solution instead.
>=20
> Yes, i see what you mean. Still,
> a) it should not be required for lsb to RDEPEND on util-linux since
>    busybox supposedly should work fine too, iff configured correctly, of =
course.

Yes but I'm not changing that in this commit :) All I want is to make
getopt provider deterministic in image. default busybox defconfig does
not have GETOPT enabled at all:
meta/recipes-core/busybox/busybox-1.20.2/defconfig:# CONFIG_GETOPT is not s=
et
meta/recipes-core/busybox/busybox-1.20.2/defconfig:# CONFIG_FEATURE_GETOPT_=
LONG is not set

so if someone wants to remove util-linux from lsb RDEPENDS, then he
should also update default config.

> b) busybox's getopt --lo (or other substrings of the
> -l,--longoptions=3DLOPT[,...] opt)
>    should work correctly.
>=20
> I'd like to know why you trip b) above.
> Do you have CONFIG_FEATURE_GETOPT_LONG set?

I've rechecked and CONFIG_FEATURE_GETOPT_LONG is not set, only
CONFIG_GETOPT is. But this commit is still valid, I want to use getopt
=66rom util-linux when util-linux is installed.

> If so, what libc are you using?

private external

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1Dvf9Qz7hFaodvwE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMV2gACgkQN1Ujt2V2gBzPoQCePG9htFD1mdP5kZ3tDIqa+ziM
sOcAn1bO9YTnoHasU6NrVXoPB6gO2dv+
=atdK
-----END PGP SIGNATURE-----

--1Dvf9Qz7hFaodvwE--
