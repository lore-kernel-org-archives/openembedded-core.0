Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1D409771E9;
	Thu, 12 Nov 2015 17:19:00 +0000 (UTC)
Received: by wmww144 with SMTP id w144so98150337wmw.0;
	Thu, 12 Nov 2015 09:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WcxtqOti4nnG7lu4MPOrmhKrd2DEe1umXIPEaHCvZz4=;
	b=1HLxrwS4VJIr9vupJwKLaV3/Q4BUk4Crz3uGZDNpDIT2/Ag1XZcL8TnVAtcKaI58TF
	sPs0BDJlg12DgB+h37pv2uAYyTeu6eiK1Pw19uH5b5Hb7AeXfH0KkvFuxS6YRsbzZYiO
	8PifMUmSAJ9CtyGIjf56sscxyalEd2LUAVMVOmJGvSAFH1dUWMXxdxeh/Q7v+8FZEy9n
	A2bDeQxRuDvMYmbQkOEWXcLNXQF8B9+7XKBveUABDqNle3CuhWCCsuPeM1BfSZWbILVK
	Iom4dKruCL4jWY5s1l6yznqdXRx+CJdEBuLSd7QyOkDJruk+6cJT7wJzCxSg9mKaFJXv
	gozw==
X-Received: by 10.28.138.140 with SMTP id m134mr18560604wmd.74.1447348740205; 
	Thu, 12 Nov 2015 09:19:00 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u126sm31778726wmd.3.2015.11.12.09.18.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 09:18:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 18:19:15 +0100
To: alexander.kanavin@linux.intel.com
Message-ID: <20151112171915.GK2574@jama>
References: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <58488.10.252.13.130.1447346734.squirrel@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: qt4 moves out of oe-core - to meta-qt4, or to meta-oe?
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
X-List-Received-Date: Thu, 12 Nov 2015 17:19:04 -0000
X-Groupsio-MsgNum: 73302
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HTLCc13+3hfAZ6SL"
Content-Disposition: inline

--HTLCc13+3hfAZ6SL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 06:45:34PM +0200, alexander.kanavin@linux.intel.com=
 wrote:
> Hello,
>=20
> now that 2.0 is out, it's time to move the Qt4 recipes out of oe-core.
> This has been discussed previously here:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-June/10635=
5.html
>=20
> I'm not sure where the recipes should land, and want to ask your opinion.
> The options are:
> 1) Make a new layer, meta-qt4, under meta-openembedded tree. Move also
> everything in meta-oe/recipes-qt (and possibly other spots) to that layer.
> This is somewhat more disruptive to people's layer configurations, but
> would clearly separate qt4, and slim down meta-oe.
>=20
> 2) Simply move the qt4 recipes from oe-core to meta-oe/recipes-qt, so they
> will be next to all the qt4-based software. This is less disruptive, but
> adds bloat to meta-oe.
>=20
> Preferences?

1)=20

There is already enough meta-oe bloat moved from oe-core:

http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112=
665.html

WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on glib-2.0, but =
it isn't a build dependency?
WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on gstreamer, but=
 it isn't a build dependency?
WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on libasound, but=
 it isn't a build dependency?
WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on libgstapp-0.10=
, but it isn't a build dependency?
WARN: qt-mobility-embedded: qt-mobility-embedded rdepends on libgstvideo-0.=
10, but it isn't a build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on glib-2.0, but it isn't a=
 build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on gstreamer, but it isn't =
a build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libasound, but it isn't =
a build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libgstapp-0.10, but it i=
sn't a build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libgstinterfaces-0.10, b=
ut it isn't a build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libgstvideo-0.10, but it=
 isn't a build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libxext, but it isn't a =
build dependency?
WARN: qt-mobility-x11: qt-mobility-x11 rdepends on libxv, but it isn't a bu=
ild dependency?

I'm still fixing gst-plugins-good and more gst-plugins-bad issues..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HTLCc13+3hfAZ6SL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZEyhIACgkQN1Ujt2V2gByBPQCdGThnTxDB7r6CiNgkNdnK1pHu
KyIAnietBwWlEYs+2rZq0P8KBiLIb8px
=Yv2v
-----END PGP SIGNATURE-----

--HTLCc13+3hfAZ6SL--
