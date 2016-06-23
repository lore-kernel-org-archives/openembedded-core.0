Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 67B13731B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 10:25:36 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id v199so120454047wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=ff8Aq/LpWiUfjt3h4U+buQ+pwvnrDVvxQP8Gecndyj8=;
	b=01ASuDF71Coi/gXU7Np41qy3EWZBoon2rHWvVn8R+/XYg0pGLPWIgxnr5DXvDN6roI
	RzeFJYzjiIzFumOsNpTj9FLx5dhPKvBEEY13/BsRsAqaSycd/5VvDItxbmVDggk5wkL4
	/SwspzSkARM8wHIy+Xskei2x29NtvP/i7Qqa8XAG160cJpaa82ssThOvCQkAnUAlAxXu
	DyVmyDQfdcY4B8L1bewlFNltIgn5f19O/nvm9bZvTBlqvdR/o0NYp8fRivUA2sn0AHYx
	rppARogiUOnvZmyvZx84K8f+YDRI4AAdXd65y0f3xBA5pfENX3f74RdICHUwbZp3j/kt
	ezng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=ff8Aq/LpWiUfjt3h4U+buQ+pwvnrDVvxQP8Gecndyj8=;
	b=UvVI4fCg+xHwsXEntRUBcCSPYu+F14XGSufU1zsmJ9VswH6g0b4IFmCgs6uuSlWFp/
	jIui3JPxpGiUfaIS/z2AyG4xeNEPuK1la/b4yo0bB5sfkzQOO+6ex9sp23ukWK+YPdKV
	XwzbB3jIMv8M85ZKJZsRPX7VITutYXud0K/+sClwFM1v9LHFUoQ0sPQXLgBjpG2oea17
	1HWE0uLfuk0jTncr56VRvqC7ZkPOHLOqCt4+XPdWzCmwPs6wX3c3+Wdnyohtoan/DpOR
	GKiOjbP4aWCKVTzSnoY23cnujxjqIHldih2s4Mi27yPHFsaZolXQgt/TBoeH3hsIIgn0
	A4bQ==
X-Gm-Message-State: ALyK8tL7Ci1XySifVkHOpF7LjSAx7c1VxeWEnc7YHurPyWV/ikcaqraZL9mNz4eI2NZ7nA==
X-Received: by 10.194.22.169 with SMTP id e9mr29295908wjf.128.1466677536418;
	Thu, 23 Jun 2016 03:25:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id c142sm36318wme.18.2016.06.23.03.25.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 Jun 2016 03:25:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Jun 2016 12:26:03 +0200
To: markus.lehtonen@linux.intel.com
Message-ID: <20160623102603.GB2567@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: marquiz/build-perf/python-rewrite branch in openembedded-core-contrib
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
X-List-Received-Date: Thu, 23 Jun 2016 10:25:36 -0000
X-Groupsio-MsgNum: 83784
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CUfgB8w4ZwR/yMy5"
Content-Disposition: inline

--CUfgB8w4ZwR/yMy5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Can you please use different branch name for this?

There was marquiz/build-perf branch just few days ago:

OE @ ~/openembedded-core $ git log --pretty=3Dfuller
contrib/marquiz/build-perf
commit 51bd580b2b44636007e698832f585bbd5785ca02
Author:     Markus Lehtonen <markus.lehtonen@linux.intel.com>
AuthorDate: Fri May 27 16:53:08 2016 +0300
Commit:     Markus Lehtonen <markus.lehtonen@linux.intel.com>
CommitDate: Thu Jun 16 15:31:15 2016 +0300

    oe-build-perf-test: print summary of test statuses
   =20
    Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>

And now everybody would need to run git remote prune, to remove this
branch in order to fetch new marquiz/build-perf/python-rewrite (where
marquiz/build-perf will serve as a directory - so there cannot be a
branch with the same name here)


Processing openembedded-core: From
git://git.openembedded.org/openembedded-core-contrib
 * [new branch]      ChenQi/PU-20160623 -> origin/ChenQi/PU-20160623
error: 'refs/remotes/origin/marquiz/build-perf' exists; cannot create
'refs/remotes/origin/marquiz/build-perf/python-rewrite'
 ! [new branch]      marquiz/build-perf/python-rewrite ->
origin/marquiz/build-perf/python-rewrite  (unable to update local ref)
error: some local refs could not be updated; try running
 'git remote prune origin' to remove any old, conflicting branches

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CUfgB8w4ZwR/yMy5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldruToACgkQN1Ujt2V2gBxQ5ACeJnmtL4swiJPGpzLYDggJB0nz
m94An0opZ+5tKeM4bG9P7+QoQzbiNa9D
=sREE
-----END PGP SIGNATURE-----

--CUfgB8w4ZwR/yMy5--
