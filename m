Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 929887CF19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 22:01:11 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id y67so14095986ede.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 15:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=EeQwSh9a7BWZcqILm6dZOzQEWsYO1XX5NZo3/I5z5+0=;
	b=pOIFgAVqphIPddfezFZjECNNItX1lv/uZJklK+8F6/m9mtGWvFEQmeTrIwphuC0C7+
	q5atZ292GGCmi3n/MckAUo25EmjquFl2wEF7KQ/Qit1DKiuG9myn9KdIpZ0vUn01Xf6U
	8NVKTliOmhr5s2cCNhTPSSrAPkZvjzpvYfb8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=EeQwSh9a7BWZcqILm6dZOzQEWsYO1XX5NZo3/I5z5+0=;
	b=kGhLokLKY+Y807u58qAgV0VuzLxDXymSwAYDXm4FQEZV0g/XxhzklGDNx3JX/yxbTX
	ATWwDYa6ks5tL+sg3lv3TN2lWXWj9sASq738wkd24ddJsAfKCGqh1X0SkvtyPxe4kfhJ
	5zHkKlSpIe+W4OVwqb+jccv9tbtqvP2s0hfaC9+GirWayx2/fr6TGmLHFageMRuB3eqC
	drPN+gm9EVLdgvbI9Ri3Corn5ONdv+SPDj/zIGhrgp4ni9qQEM6pqt5l6qT6j9A9RVw7
	hTSlS3/YWHKVnD51YIcRCxkX28xKWFdhRr58G5kb4KUZIAPOtBT281ljOdNewVjp5dg5
	mRJw==
X-Gm-Message-State: APjAAAVTcyTpyypPjW3qBJdGFP5Rx7Cc/zkzPJC+ZHSpvKbiUYiFjJmY
	8YPRZnqAFlK0q6jtsmQ9E/eEGg==
X-Google-Smtp-Source: APXvYqy0LShrxXYno+iwZJXvFK/dRRTOA7PxX8+DYx5R/DGugKPss963Be7fegRcaSOB8GUh4GjpgA==
X-Received: by 2002:a50:b101:: with SMTP id k1mr17472140edd.231.1556056871401; 
	Tue, 23 Apr 2019 15:01:11 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	f16sm1474432ede.15.2019.04.23.15.01.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 15:01:09 -0700 (PDT)
Date: Tue, 23 Apr 2019 18:01:06 -0400
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190423220106.GA30419@bill-the-cat>
References: <1555869425-7613-1-git-send-email-trini@konsulko.com>
	<1555869425-7613-2-git-send-email-trini@konsulko.com>
	<6d594af6f152f129047dd75c8d42a52e1c6e7687.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <6d594af6f152f129047dd75c8d42a52e1c6e7687.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] vim: Update to 8.1.1198
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
X-List-Received-Date: Tue, 23 Apr 2019 22:01:11 -0000
X-Groupsio-MsgNum: 123641
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 04:02:49PM +0100, Richard Purdie wrote:
> On Sun, 2019-04-21 at 13:57 -0400, Tom Rini wrote:
> > This brings us to the current version of vim.
> >=20
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
> >  meta/recipes-support/vim/{vim-tiny_8.1.1017.bb =3D> vim-
> > tiny_8.1.1198.bb} | 0
> >  meta/recipes-support/vim/{vim_8.1.1017.bb =3D>
> > vim_8.1.1198.bb}           | 2 +-
> >  2 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-support/vim/{vim-tiny_8.1.1017.bb =3D> vim-
> > tiny_8.1.1198.bb} (100%)
> >  rename meta/recipes-support/vim/{vim_8.1.1017.bb =3D> vim_8.1.1198.bb}
> > (98%)
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527

Does the current version even work in this case?  Digging down into
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527/steps=
/7/logs/step1b
there's a certain level of "how does that even work today then?" that
springs to mind.

I need a few more details to know how to reproduce this locally as I
don't see whatever must be in site.conf/etc to turn regular poky into
no-x11.  The errors are also around iconv stuff so maybe nls is also
removed here?  Thanks!

--=20
Tom

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcv4siAAoJEIf59jXTHXZSrgEP/2rM6zzf7yZx9cpyYp/FNxe1
BwG4b6P0NVu8tom92QoN8xH7U7fi45KLnEv4Po8Zg40+M5NC/L8VMCIm/FddZmHh
Kt+fsnNBANSG+HlLMSpMJZ6w9LGCHJSJXypiMk0YIhBO4D7+40dGxYQgTdaAl9GL
B0xndexwmTYwoWmwb/Iq6p1ox8UK8fbxC3OoQ/e3ySjsu/GY12vPkS3oG7HSVkbQ
WkuGGm5+s9heTIlNy9LoN4cVs7sXG+/eRilg1yt7fz9XwdH5RNp/jQXp3uSdto/j
pvsny6C8jCkdrnuQ4esjFt+MngrYY0W5auDy4VIqeXuYAZHpoz0oJvG1/v84i/+t
XhupLPjp3+ZPfs+yVIqck1oDLTVaKJ1oEFmPOCHCn2QBLgFqA77L38Ep66WCBKxw
qNtTAQyjulckSZHUWBccyaOAwm5y8QinIqDt+M8RgzZSgUAcDzd6rDr2PKiWMZI7
Nvd4M0S3Cn/E3rY/FQFAvdf7qSablnQ8Tri2tEDBV8FKj4XOkko6hMAlfzGJ/cHq
Zxzb28s+UFGFGFz9LN4nkvu0w57DHrW4Vcc+QZCTK7IzoGIsijAr+dtFoauLNqiX
oCGhLzR5R0WmFy28Jxgsu/+Qx35cMG93fVZ0lhJw2SaRxbrgLNNXEqJ7pXhEy5Lg
9l/XSgtpA/IbviD6spv4
=nDTo
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
