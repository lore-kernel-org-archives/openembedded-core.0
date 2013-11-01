Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 774976D123
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 12:16:39 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id e50so1969315eek.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 05:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ctqS7bCXZ5c2fzKsK1/4Q8RKm7c5qbKl4tKTTmDMeUo=;
	b=snR3eahGTFXH5voiQJYiEFcchBP3s0KC7RcGLCS6PgNdxnM9JO2X+k3Q0YmKXtN3jv
	ZWHQEEP1Zx3WrLEXJNLb2s64yGQ0PVumt838l+ngeIEEBuwaGarjhU0SIT6boGADNaDO
	UN5iOqeVFgu552hnmuXXHgBsmV4FYMd3YOljpr5JmDeayJ3Kdt3a17V9ti0f2rvoPgt9
	rALTVhdKA3Kd2mhIcd9gMNqAjsoGkln3b/notWDLUWgOwbnHyYNKs85p68jmZmGO//Hm
	z5ip1O2vf6YYI7u0EzMZrMtLv1QByJIj7sJU3BfAZxV4QQASaJvAiQFZyn5ue/dZR/Dl
	31Tw==
X-Received: by 10.14.219.198 with SMTP id m46mr2749321eep.41.1383308201010;
	Fri, 01 Nov 2013 05:16:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id j7sm7012977eeo.15.2013.11.01.05.16.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 05:16:40 -0700 (PDT)
Date: Fri, 1 Nov 2013 13:16:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20131101121643.GA5768@jama>
References: <cover.1383214870.git.hongxu.jia@windriver.com>
	<0ab98fd1823d92b6661b60432b3ec30fd9c9a03d.1383214870.git.hongxu.jia@windriver.com>
	<20131031104111.GI32015@jama> <52724411.9050909@windriver.com>
	<1383295856.25877.124.camel@ted> <20131101093903.GO32015@jama>
	<1383303152.25877.137.camel@ted> <52739398.4070402@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52739398.4070402@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/1] qemu: use PACKAGECONFIG to address nss dependencies
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
X-List-Received-Date: Fri, 01 Nov 2013 12:16:39 -0000
X-Groupsio-MsgNum: 46509
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2013 at 07:42:16PM +0800, Hongxu Jia wrote:
> On 11/01/2013 06:52 PM, Richard Purdie wrote:
> > On Fri, 2013-11-01 at 10:39 +0100, Martin Jansa wrote:
> >> On Fri, Nov 01, 2013 at 08:50:56AM +0000, Richard Purdie wrote:
> >>> On Thu, 2013-10-31 at 19:50 +0800, Hongxu Jia wrote:
> >>>> On 10/31/2013 06:41 PM, Martin Jansa wrote:
> >>>>> On Thu, Oct 31, 2013 at 06:23:01PM +0800, Hongxu Jia wrote:
> >>>>>> Use PACKAGECONFIG to explicitly address nss dependencies rather th=
an
> >>>>>> tested by configure.
> >>>>>>
> >>>>>> It avoided potential errors while multiple builds shared a common
> >>>>>> state_cache.
> >>>>> There are more floating dependencies in qemu.inc, see
> >>>>> http://patchwork.openembedded.org/patch/56935/
> >>>>>
> >>>>> and even this list isn't complete, there is also:
> >>>>> WARN: packages/armv5te-oe-linux-gnueabi/qemu/qemu/latest lost depen=
dency on  cairo gdk-pixbuf gnutls gtk+ libvte
> >>>>>
> >>>>> Can you please improve it to fix them all?
> >>>>>
> >>>> OK, I will try to fix them as possible as I can.
> >>>>
> >>>> Drop this patch, wait for V2.
> >>> Part of the problem here is that qemu-native has some "floating"
> >>> dependencies by design. If the native system has graphics support, qe=
mu
> >>> will have too. If it doesn't it won't have. This works out to be quite
> >>> useful for people. Some people have headless build machines they don't
> >>> want to install X on, equally some have build machines which do have X
> >>> and they do want graphical qemu.
> >>>
> >>> How do we support both?
> >> Aren't reproducible builds more important than automagically enabled
> >> graphics support, what if such automagically enabled qemu-native gets
> >> reused from sstate on headless server without graphics support?
> > I agree there is a problem here. Equally, there is an important use case
> > which people do use and care about which this patch removes.
> >
> >> We can extend documentation to say that in order to enable graphics
> >> support for qemu-native you need to set
> >> PACKAGECONFIG_pn-qemu-native +=3D "foo bar"
> >> in local.conf (or to remove some to disable it, but enabling explicitly
> >> is imho better because we don't have graphics native support in
> >> ASSUME_PROVIDED).
> > I think we'll have to do something like this, yes. I'd like to see the
> > patches adding this documentation to local.conf before we change things
> > though.
>=20
> OK, how about add the above documentation as comments in the patch.
> ...
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -79,6 +79,10 @@ do_install_append() {
>   }
>   # END of qemu-mips workaround
>=20
> +# Disable the following flags by default. Such as graphics is
> +# disabled for qemu-native, if you need to enable them, set
> +# PACKAGECONFIG_pn-qemu-native +=3D "foo bar" in local.conf
> +# or just comment out them to let configure do the test.

=46rom this comment it's not clear that people need to comment out
PACKAGECONFIG[foo] lines (not PACKAGECONFIG values) and I believe that sett=
ing right
PACKAGECONFIG_pn-qemu-native is more reliable and easier (I don't know
if you can easily remove PACKAGECONFIG varflag from local.conf.

Once I explicitly enable graphics support in my local.conf I would
prefer qemu-native configure to fail if my host distribution is changes
and became incompatible.

>   PACKAGECONFIG ??=3D ""
>   PACKAGECONFIG[virtfs] =3D "--enable-virtfs=20
> --enable-attr,--disable-virtfs,libcap attr,"
>   PACKAGECONFIG[aio] =3D "--enable-linux-aio,--disable-linux-aio,libaio,"
> ...
>=20
> or add them to meta-yocto/conf/local.conf.sample.extended or some place=
=20
> else?
>=20
> And I could not exactly figure out which flags affected the graphics.
>=20
> //Hongxu
>=20
>=20
> > Cheers,
> >
> > Richard
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJzm6sACgkQN1Ujt2V2gBy/UQCeJF9l8uKPPTO2JT3OmIV6fj4v
fC4AmgNl1TbdIUb+LILMCSZEfFLLfgey
=hKSi
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
