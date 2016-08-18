Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4D50976651
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:08:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i138so431024wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SjVVS/evzQlD0IyRXTDgYq1auTC3ztxOMsBYLRBzNz8=;
	b=tr/iSG+kO4skO+PJND5gA5KpkamJJWg4HDl6aJrh8sJjb2Rf6c8GLjiIysBCBWa4J5
	Q4EDU291FEoSd7+5NFk2pHcdINRJMi5b7vfbjzL/vEXYQj9k0SC6AIG5Z5b40rUQBisF
	rZKsqJVb2b8xpsmT3tf7jvX6b8IvDfzByUBD/SmCiVO2PLK7k1W3T4CZO2NHmk+8NjfC
	2ZRx8vaIlzgsSzb9Ile9QbXA0Sra1tUP7cW8+YEGgZK2Vp3IWsWutPjhtMn4FlKd4pA6
	t3N9ezJ1ARwZZiA7t5kB/MMttwCGscgSFV5ceoR6KjRKz5Fw2SUb1M+tJR1G4SiUkRGs
	MQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SjVVS/evzQlD0IyRXTDgYq1auTC3ztxOMsBYLRBzNz8=;
	b=kNt3zfIa5GGac5Se/nBXih1tc7cz9B0g1ElboEWU6iBN5a9dmEBYVS3hMEyZfD3EFb
	80vyTprSA49My3VXgxGK26jjWb632P25mroWnuF5I4+LxqHEoNGh0TZw9c49/MUx0Ot3
	2Wn9CqWWcH7ubp2ZIC4WqHZWjfJWn5ne8uS+RZrdsUGltRhmaXgYWgnTiGLclqAUU4e+
	u5ffxic9gI4NHjxeh2yas+XMFQYbcTxp+qIoIPV2z8uLf625ZQxppls3KpU796sVwxg8
	MImuI8/SYLa0rlcIZT5COPH2J1zg9Zf1Ja6+CHdK934KLuguigFK3myv857yO+nAybmd
	0RFg==
X-Gm-Message-State: AEkoouuZG96RxYh1kE/DGPxyjzOfFghIHBjDlvI+wRrV5sswRU0kqPFRPl2w9EZdPhrSCQ==
X-Received: by 10.28.17.9 with SMTP id 9mr413149wmr.73.1471540106171;
	Thu, 18 Aug 2016 10:08:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id p4sm3098516wjq.27.2016.08.18.10.08.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Aug 2016 10:08:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 18 Aug 2016 19:08:24 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160818170824.lql76v2c7bbfs46t@jama>
References: <1471538461-27065-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1471538461-27065-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Specify extra paths
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
X-List-Received-Date: Thu, 18 Aug 2016 17:08:27 -0000
X-Groupsio-MsgNum: 85913
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w7tzqrghzn5mj3i7"
Content-Disposition: inline

--w7tzqrghzn5mj3i7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2016 at 04:41:01PM +0000, Khem Raj wrote:
> Some layers have gstreamer plugin recipes which include
> the .inc files from OE-Core but they do not get to find
> the patch that is being forced by the .inc file and
> ends up with errors like
>=20
> WARNING: /mnt/oe/meta-qcom/recipes-multimedia/gstreamer/gstreamer1.0-plug=
ins-v4l2.bb: Unable to get checksum for gstreamer1.0-plugins-v4l2 SRC_URI e=
ntry 0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch: file =
could not be fo
> und

Isn't it better to move this SRC_URI_append to the individual .bb files?

Other versions of plugins might not be able to apply this .patch and
such recipes will need to use SRC_URI_remove (or SRC_URI with override)
to get rid of this.

>=20
> This path prepend fixes it
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b=
/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
> index 2dcec50..b066941 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
> @@ -28,6 +28,7 @@ EXTRA_OECONF =3D " \
>      --disable-examples \
>  "
> =20
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
>  SRC_URI_append =3D " file://0001-introspection.m4-prefix-pkgconfig-paths=
-with-PKG_CON.patch"
> =20
>  delete_pkg_m4_file() {
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w7tzqrghzn5mj3i7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAle164cACgkQN1Ujt2V2gBxykQCglElr4nUhykczZPp+32+s7fiS
AOsAoLtpP0hLzNtGkgQ6dKggQrvcoF1A
=OEGr
-----END PGP SIGNATURE-----

--w7tzqrghzn5mj3i7--
