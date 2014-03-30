Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 53A1D6BA1D;
	Sun, 30 Mar 2014 01:31:00 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so5289109eei.5
	for <multiple recipients>; Sat, 29 Mar 2014 18:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=zuYJU0aboieT8sr3K+kpTET+4a05vM+ha/XOM26fVsQ=;
	b=GauHWs3zqh8CoTq/BuWVmolJDVjxno5dz+H3vXcH5BHPelHA8agB5QZQSFMnduXBLe
	x51rkwiNk3B5G09qxeply3gj/4qh2kcRBncSVY4SQXDsJk7G4Z+tMQ246CPXuXVxcegO
	FQAEWQWbXzwoq7EOr5DyGzg8UPZwBzWPJPRgMtXWU0FRytQQE5b5gy5DYtUWEeLyrq1p
	Bx6S7yF+pts9rjvIKQi6Xnj+7ct4W2zF5blxv4Jll/+MPRpWlOtXkibg5LHUWyRbr4sv
	17Yb0u356m7fRZ6XkEGAUJEcXUVo/9sJYNKwgvb71UUXcCEFqytOuYm9tnAyBqqXN2rK
	esgA==
X-Received: by 10.15.68.136 with SMTP id w8mr20727704eex.5.1396143061361;
	Sat, 29 Mar 2014 18:31:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w1sm22316327eel.16.2014.03.29.18.30.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Mar 2014 18:30:59 -0700 (PDT)
Date: Sun, 30 Mar 2014 03:31:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140330013103.GD2428@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Quality of meta-oe metadata
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
X-List-Received-Date: Sun, 30 Mar 2014 01:31:02 -0000
X-Groupsio-MsgNum: 51865
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ycz6tD7Th1CMF4v7"
Content-Disposition: inline

--Ycz6tD7Th1CMF4v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, sorry for longer e-mail, this is one of topic I would like to discuss
on OEDAM (http://openembedded.org/wiki/OEDAM), but having some feedback and
thoughts in advance will be very useful.

As people can notice from my "State of bitbake world" e-mails or
http://www.openembedded.org/wiki/Bitbake_World_Status
we never had "green" builds. There are always 20+ failed tasks in those
big builds and just reading the numbers isn't good indicator of quality,
because sooner you break something in dependency tree, fewer recipes will
be actually tested, so fewer failed tasks often means that something
important is broken.

There are IMHO at least 3 reasons for this depressing state:

1) Nobody is paid/dedicated to fix them, there is no company behind meta-oe
   layers, now SWAT team, not even dedicated maintainers to which I could send
   error from latest build and ask them to fix it before the end of
   week/month.

   Kudos to people who are sometimes sending patches for such issues!

2) There are a lot of changes and component upgrades in oe-core which
   sometimes aren't very straight-forward to adapt to and issues stay in
   meta-oe for months.

   I don't mean it's oe-core fault or that changes to oe-core should slow
   down just because meta-oe, especially when we cannot guarantee when it
   will be prepared for them (because of 1)).

   oe-core is trying to track latest stable versions, but meta-oe often
   contains very old versions and people upgrade to latest stable only the
   recipes they really care about, so it's not so surprising that 2 year old
   version of something isn't compatible with latest greatest freetype or
   some library like that.

3) OE releases work great and don't invalidate sstate signatures so often, so my
   feeling is that most developers and projects are just using releases and
   less and less people do CI. People will start complaining that something
   is broken in meta-oe only when they are upgrading their project from 1.5 to
   1.6 when 1.6 is released and that could be too late for fixing meta-oe
   issues.

What I'm trying to do with it:

a) sending those e-mails and updating wiki, so that people can easily find
   if some build failure is common or something which happens only for them
   (something like oestats-client.bbclass page was providing in oe-classic)
   It also includes log of QA issues which are usually easy to fix and great
   way for new people to learn something about OE.
b) trying to refuse all patches which cause new world issue (or new QA
   warn/err) - sometimes missed in logs, because it's often "hidden" by some
   other issue and hard to compare 40 issues from previous build with 38
   from current.
   Also the issues are often triggered later by changes somewhere else...
c) fixing build/qa issues in recipes I've never used or don't even have
   hardware to test - just based on assumption that something which builds
   is better than broken build, even when it can have some issues in runtime.
d) contacting people who added the recipe which is now failing, often
   without reply for months even when I try it multiple times :/
e) moving to "nonworking" directory to mark it as "known-to-be-broken",
   last resort for recipes where the fix is complicated and it's not known
   if someone is actually using it (because it was broken for months and
   nobody replied).
   + easy to find them, because they are still in repository (instead of
     git rm + revert when someone fixes it)
   - layer index probably doesn't find them, because "nonworking" directory
     level isn't in BBFILES, so maybe meta-broken or meta-nonworking would be
     better
   ? some recipes are "broken" just because their dependency is broken, what
     to do with such recipe, I usually just say that in commit message when
     I'm moving them to "nonworking" with their broken dep.

What can we do better? How to motivate more people to do CI and send fixes?
When we get to "green" state it will be easier to quickly spot new issues and
easier to fix them, because it will be clear what's causing them.

--Ycz6tD7Th1CMF4v7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM3c9cACgkQN1Ujt2V2gBwPlACgkmHd4Sud976YSjtv9DZMpBsV
hlEAmgOj5FB0kO89OlciEsVLHWwCWtgv
=PoP/
-----END PGP SIGNATURE-----

--Ycz6tD7Th1CMF4v7--
