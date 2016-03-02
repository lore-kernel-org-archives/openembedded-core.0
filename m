Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id B817476803
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 13:22:51 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id l68so79970550wml.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2016 05:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qRbhZbJAk5Ezet6iwl7CKXwodQyesAZbSnxNy7lXx5w=;
	b=rFrIws+HBw3WyYe3qA5hr1Rd4l/H6xfTNn4Z5yUYMt/0FoSDj+shemMbLvTFm96sze
	W/7SfmGxI9eprWbvp2yEaeLOyp2NEcBAuwWQ7qxyu6ZeddYp5JiNivjycgZ5UzTpKrcC
	a/+WdT1qNVTe4F+VVrzUNyT/DG2Uc3NYSpdGhgxw9pWocngPGHQrlMqN4mpgYElSHubZ
	nWaYcOXaWFcYhvYXHLzWjFvlsuC1z6VWPi1qH0BLffRv1TAACJxCWMzsCLLgpbBjM+V1
	mQp2UD3fE+KVf1kfhoZPaNLakiQYdnlVkG/Bie1oaupKP/UNGRycz3IiRgthPY4DFTzC
	X9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qRbhZbJAk5Ezet6iwl7CKXwodQyesAZbSnxNy7lXx5w=;
	b=AUk2Ndfw5K8vmDjrwT/v+NJ2o7SEkTHrp/ST0awbItXrU0L2yGyOu5kscfvzrk3nhD
	8zgGiOMdpDoufXc630P6HcIMbqLwqxM8Cm+X5VherCA4hA6IaBsPJCaGZFj2sJSUVOEI
	NVrxFFS3Jxc4vaNU1WXQ7kGqfWaynZA4mTVJnqoh/EAuzqcx+D7nNjJPbd/q+7LtgUuN
	A85EL+BY90FFiUKCu9AKGNt+STgMdj0VAoWk+Q3Cbmac/XU1WVkZDE5Yl9K3GWpGXQmW
	cmh3yH+/6J0hXV9ysT3q154HYQBb4rh7gWesgi1nZ6GmqkfJZhK5VHXhwFqF5XNcPMMr
	jQKg==
X-Gm-Message-State: AD7BkJJ6TARfUUCguSgLaP7RUZWLu/oPZ4KAfr2MfBLsVlb5ZXmDOuoyuG6w3bk6VMGW6w==
X-Received: by 10.28.224.195 with SMTP id x186mr3474270wmg.21.1456924971667;
	Wed, 02 Mar 2016 05:22:51 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id x65sm4201398wmg.4.2016.03.02.05.22.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 05:22:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Mar 2016 14:24:49 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160302132449.GC10529@jama>
References: <1456610987-17836-1-git-send-email-Martin.Jansa@gmail.com>
	<20160302123800.GB10529@jama>
	<1456924305.25131.30.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1456924305.25131.30.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][RFC] base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
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
X-List-Received-Date: Wed, 02 Mar 2016 13:22:52 -0000
X-Groupsio-MsgNum: 79029
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HG+GLK89HZ1zG0kk"
Content-Disposition: inline

--HG+GLK89HZ1zG0kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2016 at 01:11:45PM +0000, Richard Purdie wrote:
> On Wed, 2016-03-02 at 13:38 +0100, Martin Jansa wrote:
> > On Sat, Feb 27, 2016 at 11:09:47PM +0100, Martin Jansa wrote:
> > > * add separate variable for configuration options generated from
> > >   PACKAGECONFIG setting, this helps other bbclasses and recipes
> > >   to take advantage of PACKAGECONFIG mechanism, without including
> > >   other options from EXTRA_OECONF
> > > * e.g. meta-qt5 recipes are abusing EXTRA_OECONF to get options
> > >   from PACKAGECONFIG:
> > >   EXTRA_QMAKEVARS_PRE +=3D
> > >   but with
> > >   conf/distro/include/no-static-libs.inc
> > >   it means getting --disable-static as invalid option inside
> > >   EXTRA_QMAKEVARS_PRE as reported by Alexandre Belloni who tried
> > >   to use poky with meta-qt5.
> > > * once we migrate all bbclasses and recipes to
> > > EXTRA_CONF_PACKAGECONFIG
> > >   we should also restrict EXTRA_OECONF append only to
> > > autotools.bbclass
> > >   like I did for cmake.bbclass
> >=20
> > No comments? Should I resend without [RFC] tag?
> >=20
> > This is needed to fix couple components when
> > conf/distro/include/no-static-libs.inc is used.
>=20
> I can see the need for it, I'm just not 100% sure I like the form of
> the patch. No one particular thing is doing that, just a general
> feeling of unease which I can't quite put into words :(.
>=20
> We continue to have a need to differentiate between "proper" autotools
> recipes and non-autotools recipes which would make this kind of issue
> easier. I guess I'm trying to weigh up whether we should consider
> something a bit more invasive to try and improve things and if we do
> that whether this patch helps or hinders that (it probably does help).

I've considered the invasive part of moving EXTRA_OECONF append to
autotools.bbclass (like I did for cmake.bbclass) but after grepping for
EXTRA_OECONF I've decided to leave it for separate step (e.g.
waf-samba.bbclass and meta-oe/recipes-benchmark/fio/fio_2.2.6.bb are
abusing EXTRA_OECONF and would break if we remove this).

EXTRA_OECMAKE wasn't afaik abused anywhere and fix for qt5 was
relatively simple:
http://patchwork.openembedded.org/patch/116981/

so I went with compromise to fix what's really failing now and leave
future cleanup/improvement for later when more recipes adapt
EXTRA_CONF_PACKAGECONFIG variable.

> I'm also not 100% convinced EXTRA_CONF_PACKAGECONFIG is the right name,
> but I can see how you got here and I'm not sure I have a better
> suggestion (PACKAGECONFIG_CONFPARAMS? _CONFARGS?)

I was expecting this discussion, I have no strong opinion either way.
Namespacing with with PACKAGECONFIG_ prefix is good idea though.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HG+GLK89HZ1zG0kk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbW6aEACgkQN1Ujt2V2gBx3egCcDQWGe5sFaof8uUIiVQUe+0EJ
4tMAnAs2/CSAbdKR8Snog29e1HKIv5HI
=9Jws
-----END PGP SIGNATURE-----

--HG+GLK89HZ1zG0kk--
