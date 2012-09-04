Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T8stJ-0000zZ-SA
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 15:10:05 +0200
Received: by bkcik5 with SMTP id ik5so3263400bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 05:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Oh12qkzF0+U0g8KNbqfOk+VpPkj21x6Ka9+z99sAUIA=;
	b=wups5mWYNI6hQyPo9acqJ4fXctK3JYJD3JtBJOshdgbqmGDJcTxKYaHN/SuKlxZJpV
	T//S5cWPn1yhNi/MCJYtDBrhXzUHQ7mv+FDNk03+1bgykXMZOGwuyORNLXQLSKvmfXJd
	cQ7inC+ubUyN+Z8/FielosUCf00imT2iPYqXefE0KY2sFtRQMJyFKaSNO5fkb+lX2AgM
	/JiO80ZkicU03BPIDrttvZW1g0DuKhNnHS6qN+pEtiD0GB33r+jLFNwxb0Zvt4Za4+eY
	7chTZaIKe9Ucc1gId0Jji05Yk9YCrSRtniXv5ISspn/gUKxbp1b33iGTT2GQi3SttI4K
	7xig==
Received: by 10.205.123.133 with SMTP id gk5mr7965271bkc.140.1346763464096;
	Tue, 04 Sep 2012 05:57:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm10315516bkc.5.2012.09.04.05.57.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 05:57:42 -0700 (PDT)
Date: Tue, 4 Sep 2012 14:58:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120904125810.GE3372@jama.jama.net>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/28] Package group fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 13:10:06 -0000
X-Groupsio-MsgNum: 28640
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0QFb0wBpEddLcDHQ"
Content-Disposition: inline

--0QFb0wBpEddLcDHQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 03, 2012 at 11:30:20AM +0100, Paul Eggleton wrote:
> This rather large set of changes renames "task" to "packagegroup" and
> attempts to clean up a number of package group related issues [1]. It
> doesn't go quite as far as I had hoped - I wanted to tidy up the base,
> core-lsb and core-basic recipes even further, but unfortunately I ran
> out of time for this cycle.
>=20
> [1] http://www.openembedded.org/wiki/OE-Core_Task_Rework

It looks like this does not have any upgrade path from old task-*
recipes.

14:16:07 < JaMa> bluelightning: how do you ensure upgrade path on target fr=
om task-* recipes to packagegroup-*?
14:16:47 < JaMa> bluelightning: tasks are installed mostly by image recipe,=
 so target will stay on task-* which won't be ever upgraded
14:21:34 < JaMa> ah, there are RPROVIDES at least in some renamed recipes
14:31:52 < bluelightning> JaMa: there's a RPROVIDES yes
14:47:57 < JaMa> bluelightning: and does RPROVIDES really work?
14:48:36 < JaMa> bluelightning: I've added it to all meta-oe/meta-smartphon=
e/meta-webos task-* recipes including PR bump and nothing is upgraded on ta=
rget
14:48:46 < bluelightning> JaMa: I'm not sure if it will help in that situat=
ion
14:48:57 < JaMa> bluelightning: I guess you have to add RREPLACES too

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0QFb0wBpEddLcDHQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBF+uIACgkQN1Ujt2V2gByDvACgqHls3uQJgpwHehszCwhjnGg0
798AnAzttzZ4EU4iE36acepsxSm5O0Xx
=ZLCP
-----END PGP SIGNATURE-----

--0QFb0wBpEddLcDHQ--
