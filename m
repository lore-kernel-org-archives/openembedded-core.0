Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id F1FAF78352
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:18:19 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id h189so21106571ywf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 04:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0ViYJpUblAEd77lu2GVYE9DyDF3LhbAF2rKbYrL+SGA=;
	b=ikvLUnn9dx9R/WFP0bF6wShpUWrDWakxKq3LjRSv+NI31PcfM+BQeXcS/UDIdMY4NI
	NcMRH7QRZgkbTLN4gS3tMfAmQDS+fwhWFn6XThY+fPPiXVLcCvzWOXc/Px479sTUgVDI
	3wwi4/UfdlRy4qi6iioVh9dNxieF+QiM6r5xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0ViYJpUblAEd77lu2GVYE9DyDF3LhbAF2rKbYrL+SGA=;
	b=gHcofGa00GOM9x/0vmENBFBONDdWtuLzuC6YrMqJbEMBIu3v83/g2c/JxgIQzS21QU
	c9CVSX6xV0uMEWEPBbdCHq+HYEXFwzZyIyzWRKrUfPwOAnbWBeOxtD5R2//cjkpAGGiH
	Yv/q28Dc80v1ar1gUKCeawhx0uKyzDrJj7lqN791S/26hpBZltGS8002WKMBFnTRjEJJ
	/ZdSNqHE7lhzhWV/4+CzAD0sahhiXAmoMfOnm++ck6Qjanz5YWKTsJLXlJNGc4/fiqk9
	9jSdXSHi1aMEDqB5md4a8Cc4hvi9+Q1QH5EGIcbCf8718CldnZwNW24lfIweU3ejN9nS
	1LZQ==
X-Gm-Message-State: AIVw1135AA0DUjHPrl3G1Skg+ltnYUE+3P4ykXGEeIjSrUMJe3PnIXGA
	trNOuLyepsf06I5i
X-Received: by 10.37.162.104 with SMTP id b95mr12649412ybi.245.1500895100879; 
	Mon, 24 Jul 2017 04:18:20 -0700 (PDT)
Received: from bill-the-cat (cpe-174-106-0-58.ec.res.rr.com. [174.106.0.58])
	by smtp.gmail.com with ESMTPSA id
	q11sm4028857ywj.78.2017.07.24.04.18.19
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 04:18:20 -0700 (PDT)
Date: Mon, 24 Jul 2017 07:19:05 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170724111905.GE26163@bill-the-cat>
References: <1500674794-23258-1-git-send-email-trini@konsulko.com>
	<1500885337.25812.2.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1500885337.25812.2.camel@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image.bbclass: Correct chaining compression support
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
X-List-Received-Date: Mon, 24 Jul 2017 11:18:20 -0000
X-Groupsio-MsgNum: 100639
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q0rSlbzrZN6k9QnT"
Content-Disposition: inline

--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2017 at 10:35:37AM +0200, Patrick Ohly wrote:
> On Fri, 2017-07-21 at 18:06 -0400, Tom Rini wrote:
> > The fix for this inadvertently broke chaining
> > compression/conversion.=A0 First, correct the u-boot conversion code.
> >=20
> > Fixes: 46bc438374de ("image.bbclass: do exact
> > match for rootfs type")
> > Cc: Zhenhua Luo <zhenhua.luo@nxp.com>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Cc: Patrick Ohly <patrick.ohly@intel.com>
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
> > This change is fairly important and, imho, innocuous and should be
> > populated to pyro/etc, once merged to master.=A0 The next part of the
> > series is clean-up and while with my U-Boot hat on, I would say
> > should
> > be pushed more widely, I am biased.
> > ---
> > =A0meta/classes/image.bbclass=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 =
2 +-
> > =A0meta/classes/image_types_uboot.bbclass | 13 +++++--------
> > =A02 files changed, 6 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index de535ce6fcff..bd6a5b7b810a 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -453,7 +453,7 @@ python () {
> > =A0=A0=A0=A0=A0=A0=A0=A0 rm_tmp_images =3D set()
> > =A0=A0=A0=A0=A0=A0=A0=A0 def gen_conversion_cmds(bt):
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 for ctype in ctypes:
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if bt[bt.find('.') + 1:]=
 =3D=3D ctype:
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if bt.endswith("." + cty=
pe)
>=20
> This reverts 46bc438374de and thus restores the code as I had
> originally written it.
>=20
> Looking at 46bc438374de, it's not clear to me how the commit message
> matches the code, i.e. I don't understand the commit. So it was an
> incorrect fix for the problem described in that commit message, and the
> right one are your changes to the u-boot conversion command?

Ah, so the important bit is the other half of this patch, which
addresses the problem 46bc438374de was intended to deal with, correctly.
Prior to the chaining compression/conversion support, the "u-boot"
targets would clean up their intermediate files.  With your patch those
files get cleaned up automatically and that the mkimage calling function
was also doing it lead to build failures.  But since we no longer need
to have a manual cleaning step, we can just drop it.

--=20
Tom

--Q0rSlbzrZN6k9QnT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZddepAAoJEIf59jXTHXZSEmYP/iKkYENBoJS2EMc971G58rAx
70y7uQPKc7EBeVrwGovL06ijUZOU9n/gqrsuobEVQUyiJU/fBD8ujs3xnR4BYobw
3Fjo+g5sIqgJdigCQURcr4O8OdYIo9zIQCZ2ftDV8ywMQWL2Pe7RgRicrPK/eDL1
I+YGBw1R2op/NYkuELKd+wvRVKd0RECQ9jZuavfRjccZwmB0qw5d2XHb7nb66AUJ
ebjQq64YAHckkaXxduGTePpEnMJmVzJdUTBrlYYc3P2VZ0Q9/MQZ/kJ11R52wZT0
tIcSkEvUBwBydiO+tYnlWRuWw7cWEg+7yBwgW23Z2RaExV9zr2DAqHXA1VUuMqSG
qd6pJILiIKt0q8p7RJtOPpsiCCcWHw0bVY1vdL7uND9ZFMq6T5DTQtJVPuZw3CjL
QbXH/4OA+BjLRbKDHs1plS8cDy5/LVF9SMU9aYsRT62xde371JZAHQPDTdW2Pd6d
ICubtYGE02bfsZB3pl4y5mWXwsYtqA292iD9rOezlNHZQJ0ueICH8tkEipQYbksy
0QQkYDRkv8pjcOaULth/GsThCOfg7lyLqAkiNCMq0K9BzuQvSGUxO32/bz2F95QM
NphrVZgDuL8Z5N1g+xh2d1TPNX8XaDvLdxM8FyL/QVWKB9R3ZQb0wRJcSZNdMXTs
QATe1OgZPPqkuIGDqm8P
=gVWV
-----END PGP SIGNATURE-----

--Q0rSlbzrZN6k9QnT--
