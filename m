Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id D7BB87564B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 13:02:34 +0000 (UTC)
Received: by wiwd19 with SMTP id d19so22256907wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 06:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kMsVSfCY/pFdbqKtWChazhEspwBYK2eW+XzNGVbRbW8=;
	b=vZRZCcf+QMzy3c4rNhARFWy3h65pEO+seB4ogRJax/5x8twgjqKskyAN0gdJlpZCKo
	VAsoN6vT+hc/o5e4EQ/1/pC7bxrEvjMigAI9biom45N8nu4cdVG1q7yCI6v5aiJkSSFS
	9J8hHSQUMp26RiQ3yjqAQ80AJZ2dw3JumPCvEeT7wMPAbVdu8RaUQPfNqyckwh6ap9OY
	jas0e5PrsoG6zOeNCjojRde+7jmjRe67sjZaF0PMxK9yoDlLPkCYyZQyzZE2iAOF0ky1
	RdQJefp9bjGri3l5ldYBu3uZUDzdCG5M+ZHV+vxRPOzhMDuD5ceogJImG5SW5YQ1QOIP
	inuA==
X-Received: by 10.180.39.147 with SMTP id p19mr64494333wik.15.1434632555364;
	Thu, 18 Jun 2015 06:02:35 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	bg6sm12148257wjc.13.2015.06.18.06.02.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jun 2015 06:02:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 18 Jun 2015 15:02:55 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20150618130255.GB2451@jama>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1434547172-24620-6-git-send-email-alexander.kanavin@linux.intel.com>
	<CAHiDW_EwLwe52-VXnJTctjMS5+4pevuOE1CZwHuEbc_xRQ=4Zw@mail.gmail.com>
	<5582AA4A.9000202@linux.intel.com>
	<CALbNGRQ5C5cMEPZEyYe03dJfMdAkyH-WiaWjoZCH77Y-DJ+f4A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ5C5cMEPZEyYe03dJfMdAkyH-WiaWjoZCH77Y-DJ+f4A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/22] Update libnotify to version 0.7.6
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
X-List-Received-Date: Thu, 18 Jun 2015 13:02:37 -0000
X-Groupsio-MsgNum: 66951
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Content-Disposition: inline

--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2015 at 02:35:20PM +0200, Andreas M=FCller wrote:
> On Thu, Jun 18, 2015 at 1:23 PM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
> > On 06/17/2015 05:59 PM, Jussi Kukkonen wrote:
> >>
> >> 0.6 is the last release that supports GTK+2 and changing this might
> >> annoy people who are avoiding GTK+3 and are using some of the recipes
> >> in meta-oe that depend on libnotify.
> >>
> >> I believe the GTK dependency is only there for tests: Modifying the
> >> build so it doesn't build tests and doesn't depend on GTK should not
> >> be difficult.
> >
> >
> > There is no way to switch off tests building in libnotify, so dropping =
the
> > gtk3 dependency means developing a custom source patch. I'd rather do t=
hat
> > only if there are specific complaints.
> >
> I think gtk3 is not the problem here it is the API change libnotify
> 0.6 -> 0.7 which cannot (or only by ugly hacks) be installed parallel.
> Do we know what happens to meta-gnome/meta-xfce?

I think they will get broken like 2 years ago when we tried to do this:
http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57913

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWCwX4ACgkQN1Ujt2V2gBzZGQCggliM/FihVeBuFiTrrQAyGEQk
LTMAnREWi+zTTUx10v6hZAj+oKYVWB/j
=b1Tg
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
