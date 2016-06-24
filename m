Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 119E1601B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 08:46:16 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id r201so15723356wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 01:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1Lpzwx/u+PIefRRoi52/SrgtLNglRGnGvu1NMwePFpE=;
	b=QnZSFlzcvzWrB25YSVVs6yUHT5ZcCGDEKSH0mlRtf17yZ2k77IfOfXpjDcPZaYn5lA
	dhzpL5DhszvwWldZJb9v2bY6QiZ/SwUO/ULGjCMMr8DFsg0k94dalpTLPCg9/trx/F9H
	BUuTbAgMAvKYvj3gODt5BI6ZzQYrdiEhuCM975iXqciEd0pwHkjlyesrOcaf3SbP5/vn
	rJQF63xJ3P12mAOV8DqVIulPARCTt1oPzXJOE3XBQIN7M0cYAFPw411e/P/JaRPxgOUm
	T0/njGWiBypvAkiZELOEr/ZUBi94mrIiMAzMr7vOdFfRwKUFNGhCqpABImaj29EeKoNb
	PEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1Lpzwx/u+PIefRRoi52/SrgtLNglRGnGvu1NMwePFpE=;
	b=ZZNtISF/s70UCtG7jt6yYujPxFEk7Go7bG0eS7GrgYGM0gLtwhkuQh5aUA+cOg8/7h
	ulM5f98M8fNhixkvRQW6CtkL6cxn2GiRmjvifnOTP3edYWTTP6GMDgEYB3uJRClS9GvE
	9d9LX6K/fhoQJ2h6SCcO45F9pk6ckA3OZ964NeNmhk7anRomdKTtB5qd4kDMrfOHvOKw
	K0lrxbtqCDCrG5QByqLRfwgu1WcTJRpj4uv34HuYUL5g1nzjS2xYX14y/FxP0Ov8JInM
	BnU1Peevg1j2Iu3JI5PbsbKv07tg9PJeZZkeDnmY6Z5osZW9npwVQtyM9fAIhmsyfz8g
	nM4A==
X-Gm-Message-State: ALyK8tIfhEXm3iLo92qjFkqPwXsvY1RjNo3ZioycunQUorNMQr2anrGlP2vm2dzqeIT1ew==
X-Received: by 10.194.101.41 with SMTP id fd9mr2590547wjb.27.1466757976749;
	Fri, 24 Jun 2016 01:46:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id m125sm193700wmm.8.2016.06.24.01.46.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 Jun 2016 01:46:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 24 Jun 2016 10:46:50 +0200
To: markus.lehtonen@linux.intel.com
Message-ID: <20160624084650.GA2561@jama>
References: <20160623102603.GB2567@jama>
MIME-Version: 1.0
In-Reply-To: <20160623102603.GB2567@jama>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: marquiz/build-perf/python-rewrite branch in openembedded-core-contrib
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
X-List-Received-Date: Fri, 24 Jun 2016 08:46:19 -0000
X-Groupsio-MsgNum: 83816
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2016 at 12:26:03PM +0200, Martin Jansa wrote:
> Can you please use different branch name for this?
>=20
> There was marquiz/build-perf branch just few days ago:
>=20
> OE @ ~/openembedded-core $ git log --pretty=3Dfuller
> contrib/marquiz/build-perf
> commit 51bd580b2b44636007e698832f585bbd5785ca02
> Author:     Markus Lehtonen <markus.lehtonen@linux.intel.com>
> AuthorDate: Fri May 27 16:53:08 2016 +0300
> Commit:     Markus Lehtonen <markus.lehtonen@linux.intel.com>
> CommitDate: Thu Jun 16 15:31:15 2016 +0300
>=20
>     oe-build-perf-test: print summary of test statuses
>    =20
>     Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>=20
> And now everybody would need to run git remote prune, to remove this
> branch in order to fetch new marquiz/build-perf/python-rewrite (where
> marquiz/build-perf will serve as a directory - so there cannot be a
> branch with the same name here)
>=20
>=20
> Processing openembedded-core: From
> git://git.openembedded.org/openembedded-core-contrib
>  * [new branch]      ChenQi/PU-20160623 -> origin/ChenQi/PU-20160623
> error: 'refs/remotes/origin/marquiz/build-perf' exists; cannot create
> 'refs/remotes/origin/marquiz/build-perf/python-rewrite'
>  ! [new branch]      marquiz/build-perf/python-rewrite ->
> origin/marquiz/build-perf/python-rewrite  (unable to update local ref)
> error: some local refs could not be updated; try running
>  'git remote prune origin' to remove any old, conflicting branches
>=20

Another one was added tonight:
Fetching contrib
remote: Counting objects: 264, done.
remote: Compressing objects: 100% (94/94), done.
remote: Total 264 (delta 188), reused 235 (delta 169)
Receiving objects: 100% (264/264), 37.85 KiB | 0 bytes/s, done.
Resolving deltas: 100% (188/188), completed with 27 local objects.
error: cannot lock ref 'refs/remotes/contrib/marquiz/build-perf/new-format'=
: 'refs/remotes/contrib/marquiz/build-perf' exists; cannot create 'refs/rem=
otes/contrib/marquiz/build-perf/new-format'
=46rom git+ssh://git.openembedded.org/openembedded-core-contrib
 ! [new branch]      marquiz/build-perf/new-format -> contrib/marquiz/build=
-perf/new-format  (unable to update local ref)
error: cannot lock ref 'refs/remotes/contrib/marquiz/build-perf/python-rewr=
ite': 'refs/remotes/contrib/marquiz/build-perf' exists; cannot create 'refs=
/remotes/contrib/marquiz/build-perf/python-rewrite'
 ! [new branch]      marquiz/build-perf/python-rewrite -> contrib/marquiz/b=
uild-perf/python-rewrite  (unable to update local ref)
 + 411e291...ecbd05f paule/startup-oe -> contrib/paule/startup-oe  (forced =
update)
error: some local refs could not be updated; try running
 'git remote prune contrib' to remove any old, conflicting branches
error: Could not fetch contrib =20

I've renamed both to have dash instead of slash after build-perf:
 * [new branch]      marquiz/build-perf-new-format -> marquiz/build-perf-ne=
w-format
 * [new branch]      marquiz/build-perf-python-rewrite -> marquiz/build-per=
f-python-rewrite
because I'm tired of seeing all my jenkins job reporting failure from this =
fetch and
I don't want to go to every single jenkins workspace to call git remote pru=
ne just because
of this (or to extend the git updating tooling to also call git remote prun=
e before
any fetch).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlds83gACgkQN1Ujt2V2gByjCACfb/ihThiVjHTPLqR0om4o1ijZ
XfsAnRPbgvPKh8AD2WWTlYBduz4a1iRF
=Neeq
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
