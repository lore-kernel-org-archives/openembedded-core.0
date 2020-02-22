Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 60306616A5;
	Sat, 22 Feb 2020 17:48:44 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id a5so4992735wmb.0;
	Sat, 22 Feb 2020 09:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jooMuhSkJLaTgtztXyjArfHJR5b/HWgPdvgxoJjAsV8=;
	b=Eh/wrl6i03kF7shJ1O0DTkgDDka8SL6Wtda+k/clviV3xna6BJQUR3x5Yl65OHazy9
	QqzD1fg7H76RFxgPqduMOeCPii5gJdhTzcIflAzEf0B7FLA4a6YBjtRmRWdH4+aPJnal
	zi80d1sNhtZqjb+yUItmUDyZTm6aO//nmRG6C8VJbOZkg8CupOyQQ0wgeht0jM7Ck02m
	eTbVfoQNmxnDDzKAIv1hAH8mSHc1ATYN4rvKgi4h32gmO1PmFQAU3Mw7GhuNbmavWCRn
	TmtqxKIVPNiBFPxZwDUiNVY0UGfP+SxwZQpppInwwKagdSuWl+YhO/woudcgQ3dE+g6r
	ASWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jooMuhSkJLaTgtztXyjArfHJR5b/HWgPdvgxoJjAsV8=;
	b=BzVvAr/vwggct/J0hZ7JQbPSAMjCM5P4AXYgLXGvUfcGKVfQwDymrky8KJ7vsvT4I/
	bx+q1BCnuLXxeSzfdRcRRUCNzVKqyne0tOn5bR7L14CwPWDUpWYEVWEsc3s2OZfV/Fng
	N8BaR/vZmi4klTvycCXeIQ7yuUCzb0lNotisQuwAnPlESJwsgyY469u5vkyTOnkjYt60
	LKFU1vLVzcj8eBtvOxp7H00svNgC4dIHhV80Zs2w8zaWDUUJiH+HB4P+GHrEeWBVlAXr
	VOcqGIcmKRzXnTE8qbxX99xXackmPERQtM/IPMTDuMlqlfgBDnpF2mM9Hz2v9ZQGo2qi
	YFcg==
X-Gm-Message-State: APjAAAUy6mFzzlCJxtX0gnIhRjUD2Cnhw5WnHIbXsHDllWuPUB6qO+Zw
	Ql2GK3qWAa3WebAkVHGhSSsFIRNf
X-Google-Smtp-Source: APXvYqwm7DYSt6OZBPgqcGkYMgIH+/DXP/PGmb+nSuForGN4MyelK7aXNU99+IilITMuWAcBj1LIlA==
X-Received: by 2002:a1c:9e13:: with SMTP id h19mr11453490wme.21.1582393724901; 
	Sat, 22 Feb 2020 09:48:44 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	b10sm6688825wmj.48.2020.02.22.09.48.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 09:48:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 22 Feb 2020 18:48:42 +0100
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200222174842.3q75aclj43asd45k@jama>
References: <158227796073.14405.8091912688817468758@git.openembedded.org>
	<20200221093921.880D82328BD@git.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20200221093921.880D82328BD@git.openembedded.org>
User-Agent: NeoMutt/20180716
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 06/26: webkitgtk: unbreak wayland build
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
X-List-Received-Date: Sat, 22 Feb 2020 17:48:45 -0000
X-Groupsio-MsgNum: 135445
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d3fgra3bksllwjgs"
Content-Disposition: inline

--d3fgra3bksllwjgs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 09:39:26AM +0000, git@git.openembedded.org wrote:
> This is an automated email from the git hooks/post-receive script.
>=20
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>=20
> commit 85431fe5c16ce1aa0916e57e820ff69c5aa0612a
> Author: Alexander Kanavin <alex.kanavin@gmail.com>
> AuthorDate: Wed Feb 19 20:47:42 2020 +0100
>=20
>     webkitgtk: unbreak wayland build
>    =20
>     webkit nowadays requires a couple of supplementary libraries for this,
>     so bring them in (courtesy of meta-webkit[1], which will hopefully
>     adjust without a lot of trouble).
>    =20
>     [1] https://github.com/Igalia/meta-webkit/
>    =20
>     [RP: Add missing maintainers entries]
>     Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/maintainers.inc         |  2 ++
>  meta/recipes-sato/webkit/libwpe_1.4.0.1.bb       | 15 +++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.26.4.bb     |  2 +-
>  meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb | 15 +++++++++++++++

These need opengl in DISTRO_FEATURES, will send a fix for that.

--d3fgra3bksllwjgs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXlFpeQAKCRA3VSO3ZXaA
HNWyAKCxmycLE7yips87N9WrHmaoIKqruQCffwrrgpNQyucTL9BN9/5PT06UQ+c=
=En90
-----END PGP SIGNATURE-----

--d3fgra3bksllwjgs--
