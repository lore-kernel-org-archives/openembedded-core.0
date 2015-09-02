Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3241C762A2;
	Wed,  2 Sep 2015 12:06:19 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so38354880wic.0;
	Wed, 02 Sep 2015 05:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gA16nf70N5kqEej17hlBOK+9zbx8NOvMtD8+6+cIffA=;
	b=oe0RGt2szf+9wPtGdLP9MlGkn28BVJHcRLZB9k9pSQjfGvItPY7W39GoBHvS3SfapX
	2Qn5iDzbrYGA7O3u9KGrOgOMGbW0BP3kccXMPRPt3Z1zDzGs7ZNWSdK2ckk0ILvVgYvJ
	MxS6B3FnKtsa4lnKUMGmTLDDyjk44QOUPddJlCdeYTmc+GL4wLD3U+iBZCWimKaFjKBl
	NTeWlZZurSgDS8KGfPQqoiskj4R9wIjJjJYhDbXgsti1KRTOuNaMYbvXgYYY1OLSKJFq
	mb+wQyoPkAiylKLuzpSqxmWBkf6F6AafTvp8kbREvzRvKw2VUsPuujp8wRbJ2n30T48a
	YY2g==
X-Received: by 10.180.21.137 with SMTP id v9mr3561319wie.8.1441195578738;
	Wed, 02 Sep 2015 05:06:18 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id go5sm3314938wib.5.2015.09.02.05.06.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 05:06:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Sep 2015 14:06:38 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150902120638.GA2470@jama>
References: <20150831125632.GA2465@jama>
	<1441192582.24871.52.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1441192582.24871.52.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, Failed tasks 2015-08-30
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
X-List-Received-Date: Wed, 02 Sep 2015 12:06:23 -0000
X-Groupsio-MsgNum: 70488
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2015 at 12:16:22PM +0100, Richard Purdie wrote:
> On Mon, 2015-08-31 at 14:56 +0200, Martin Jansa wrote:
> > OE @ ~/openembedded-core $ git log --oneline origin/master..contrib/jan=
sa/master=20
> > e223862 initramfs-framework: Drop allarch
> > d51627d linux-firmware: Drop allarch
> > ee54e69 ppp-dialin: Drop allarch
> > 2ff92fc usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
> > 913639d resolvconf: Drop allarch
>=20
> I think that with some recent changes you might be able to drop all of
> the above. We've also added an automated sanity test to ensure this list
> doesn't regress either.

Thanks, I've noticed the SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS additions and
was planning to drop this before next test signatures run on jenkins..
it's just too busy doing normal builds so I didn't get to it yet.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXm5k4ACgkQN1Ujt2V2gBz48gCfdVga7ZQKzZL+CmIJs7KBy12K
ByQAoKewz1N6fi/kvBHAXXpUXUO4shMA
=SjqL
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
