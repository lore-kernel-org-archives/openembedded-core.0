Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 98FCC77155
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 14:52:15 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id p63so29931932wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 06:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=773A9L2UvnGqY/hw2Y64pyGLQ0fPHTKaWu+2XoCvcfc=;
	b=K7qZBDfla+NvT+HUjzHeTCTNT6lNcLIoFnphDdNd+2Kme1d1OrHWU2ffbKIdo5jfk8
	YMihtUKExMs7CKrkV3nxGHhEix1op5XVvPH2WYMF2LASzz7H5o+wIsfD+Kthl2ZUBbsX
	vkH4flFi/yEBy6uMdN8Y6zfKsfXUmmFgSgAfARsDq3Tn+CYt2dJOJFzFjmn/EGq/xsPJ
	bE1lvUH+VkWhqfhpGhBFRgUXJJxBT4CBGuP8jIE9W7PGh6RlA69z7laplYt7NqUEc5P9
	cjvdfMyqvLpKx4lnc7sGTdAd/q1ZNyTg49RjUdu/TMZZaKtxtAX99Z4powuexKGnxUnq
	9AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=773A9L2UvnGqY/hw2Y64pyGLQ0fPHTKaWu+2XoCvcfc=;
	b=JSWm0kfa+HHslHchLcx0I0r/RWCFJDqYm8VPElfTKQA1Tz1j/UjK/+9aZLkRhHWJuE
	srhz4RExxWUe6rJivQdvB9to1nbJft5qakopuBdVUu1L4pJL+WXGMtndxb2OzXL3yF6N
	pXOKzP9iCeNE8lQx3HkkS4E81H+7UZwqKxcKDilYDPnYkbyI1WgM5PaAx6/oOx9/HV2j
	0qfXeT8lT9+/snSjA/V3VLtZOty/inkHA8TNEDOuOVMalwW2UT8JdVYTq0gNqDP0vRat
	lpStCFp4XhdcvpgEEemlBDddkMKGOJGVkryL0dRiUMNiPNE7y6zimfAI4Kebt7cZNwSA
	p42g==
X-Gm-Message-State: AG10YOSJihmr1Om/AXYgqjIJUaowjjtQehoWjVkHb1HthPnfZ2vyi7hK9Qiwp7+RAvZbjQ==
X-Received: by 10.194.243.10 with SMTP id wu10mr14141802wjc.14.1454683935548; 
	Fri, 05 Feb 2016 06:52:15 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l194sm31474286wmb.14.2016.02.05.06.52.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Feb 2016 06:52:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 5 Feb 2016 15:55:45 +0100
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20160205145545.GD2575@jama>
References: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
	<1454627058-26663-6-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1454627058-26663-6-git-send-email-armccurdy@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] gstreamer1.0-plugins-base_git: drop obsolete dependency on freetype
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
X-List-Received-Date: Fri, 05 Feb 2016 14:52:16 -0000
X-Groupsio-MsgNum: 77618
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Content-Disposition: inline

--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2016 at 03:04:18PM -0800, Andre McCurdy wrote:
> The dependency on freetype was dropped shortly after the 1.7.1 release
>=20
>   http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=3D183=
610c035dd6955c9b3540b940aec50474af031
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb | 5 +=
++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_=
git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
> index 956b24a..06afb04 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
> @@ -20,6 +20,11 @@ SRCREV_FORMAT =3D "base"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> +# The dependency on freetype was dropped shortly after the 1.7.1 release
> +# http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=3D18=
3610c035dd6955c9b3540b940aec50474af031
> +DEPENDS_remove =3D "freetype"
> +EXTRA_OECONF_remove =3D "--disable-freetypetest"

Please remove both in:
meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
and add them only to 1.6*bb recipe

If you keep the comment like this, then there is small change that the next
time the automated package upgrade will bump the main recipe, someone
will notice and remove this.

>  do_configure_prepend() {
> =20
>  	# Temp solution for git snapshot: relax version checks so we can build =
against GStreamer 1.7.1
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla0t/AACgkQN1Ujt2V2gBwPfQCgn1MpjUj2fTJhLqSA+/ClgMNZ
laQAn13EHR42+Wx60Vg95xEZUBqRuHk2
=TXhp
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
