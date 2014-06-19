Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id A2985601A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 16:39:21 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so2582511wes.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p7/BhNNRXNrVYk/4Q2EwUS4hg2cOiLoU8kYLPUaVeMY=;
	b=xtC8OMUX2M3PHA4MM7EJkM8jLJs7QqPaMNFx2NmORqQb0Dws5b3/BPRkezd3GbORaA
	UzN9GxUmPlx1gOM1EKdqaquVS0y6QbKvKZ7Pa9+DIfcSnlvHtfMFd0dAoqtMXiUwsx3q
	1H4IaUP7Fwu9hlAJnHOV9by/eoBwws2+7+jA4MlJHLkB5UVgPpqaNq4dWVpdNdyy2uG6
	reNOL6x5QFMHuxNuBJ+622tC+fD1e5aWqLeQIpoT+Wxy9TBdXj9RfTG2m0QpuQ5AjBN/
	A3kpZMzdH/IuTMp9mtKAX0lZXWqrnu17BuLno1JBJHD2QqJEC0966GLKjSSjIhXravUE
	2SZw==
X-Received: by 10.194.83.39 with SMTP id n7mr6318028wjy.58.1403195961892;
	Thu, 19 Jun 2014 09:39:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ej4sm34789499wib.4.2014.06.19.09.39.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 09:39:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jun 2014 18:39:22 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140619163922.GR2117@jama>
References: <1403177022-19086-1-git-send-email-Martin.Jansa@gmail.com>
	<3503275.YjDqJfgFMA@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <3503275.YjDqJfgFMA@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
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
X-List-Received-Date: Thu, 19 Jun 2014 16:39:28 -0000
X-Groupsio-MsgNum: 54271
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="foM9DbudB2CcldhH"
Content-Disposition: inline

--foM9DbudB2CcldhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 02:54:59PM +0100, Paul Eggleton wrote:
> Hi Martin,
>=20
> On Thursday 19 June 2014 13:23:42 Martin Jansa wrote:
> > * update-rc.d.bbclass now adds dependency on TUNE_PKGARCH initscripts, =
so
> > these cannot be allarch
>=20
> As I've said before, I really dislike this change. The system should be m=
ade=20
> to handle the situation properly instead of working around the issue.

This one is new :) (I think) I had clean state (with my unmerged
changes) with dylan (now I'm testing dora, daisy, master as well), these
are "new" as the initscripts dependency was added recently.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--foM9DbudB2CcldhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOjEjoACgkQN1Ujt2V2gBwvxgCeNXAtIqZMG+9XvWUOrj9ms7cJ
91oAoLd5PzcDMjLE0RlkHHETVrjg44OR
=BXEM
-----END PGP SIGNATURE-----

--foM9DbudB2CcldhH--
