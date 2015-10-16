Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2F20677144
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 14:43:49 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so12354316wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 07:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZJxiM6VGaJidQ5lpg8daQxU1L8lhTsW6Js1f+QqDEhw=;
	b=c3hvzi4dRreorYJYFuL4ZlHnt2aTULqMoH4rbWf2DXcSwB7JmlxDwgHCm/FbJnOGDS
	G2PrtXrdj6auge04BNtvU5MftmtcYfjl5XQW6YAMpbN4FHKxEGI58trJbi6MSlqLZgK8
	C8ls8MGMxbd4svx5wrJCfQv32ug2grWxbpTs9PAHDFW0lPZ7eQzyCFypBehO5k8tPKkj
	OBooIFORZdDnPY5M2OkKSqGbyfrk1+ao16WtZkE6d0pe4naHV5uwgwQLJFV5AZgRLS5C
	RxUJnYmIQF2Qyajwf+7JTHiu1xgqv3mPZrZFFXa42UjLvZtVg5oxKvyN0qFx02uS6PtS
	cVmQ==
X-Received: by 10.180.88.227 with SMTP id bj3mr5083351wib.80.1445006620857;
	Fri, 16 Oct 2015 07:43:40 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bf8sm22922662wjc.22.2015.10.16.07.43.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Oct 2015 07:43:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 16 Oct 2015 16:44:08 +0200
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20151016144408.GB2544@jama>
References: <1445005527-2384-1-git-send-email-adrian.ratiu@ni.com>
	<56210C4A.2090400@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <56210C4A.2090400@mlbassoc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] x11vnc: move recipe to meta-oe
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
X-List-Received-Date: Fri, 16 Oct 2015 14:43:50 -0000
X-Groupsio-MsgNum: 72274
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline

--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2015 at 08:40:10AM -0600, Gary Thomas wrote:
> On 2015-10-16 08:25, Ioan-Adrian Ratiu wrote:
> > x11vnc can be configured with --use-system-libvncserver to use an
> > external libvncserver which will be added to meta-oe. Since oe-core
> > should not depend on meta-oe, we move x11vnc there.
> >
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>=20
> Just curious why not the other way - move libvncserver to OE-core?
> x11vnc seems like one of the very few [and useful] X based tools that
> are present in OE-core that it seems like a huge step backwards to
> move it out.

It was discussed in "[OE-core] [oe] [meta-oe][PATCH v2] meta-oe:
recipes-graphics: add libvncserver recipe" thread and I agree with
Otavio that x11vnc doesn't look so fundamental component used by most
embedded builds to deserver being in the core.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYhDTcACgkQN1Ujt2V2gBwtUQCbBqcA/krQqWCV7NG5bUbmqEmf
P/UAn1DBdxEVUCrwiKAXt+U2vpF+bCzs
=9laK
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
