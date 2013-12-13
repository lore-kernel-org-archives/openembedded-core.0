Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1FDCD6E416
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 12:08:56 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so844343eaj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 04:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EU+/yiqJ+wcGXrzzNOj3RR30ovlDCJcDOdtSMzoP48Q=;
	b=FfDJAFnZHRxmK+tYXljTRS7ewj8UaLv3uSxgPW14bAXzjrQ9n2gP4aHvU0Wbw14/54
	7uuILiLmtz36lBj2hmVfe5HGO7+1cDakDV8u5fhl/7bXbvgftBX/3bDkOfSa2hky8Z/6
	0KIUJvth+vep8frovheYvzrwK5+cZSKXisgGZac6wxex7Y2aIq1bImdr62K81sWAueGY
	+7LRCrItdkY/4Q8O6bqKdHAtDVixDW5fGBTYMLqysk42fxKAqxx2o8+PEuSE1CYzO3ue
	ICMJhq6idZViI1IFZBmL9KjEi+dn+QbHKWof5QtR6B1PRH21Kimvd3rUbvWGOSKn8rdB
	y7Kw==
X-Received: by 10.14.184.66 with SMTP id r42mr2543616eem.86.1386936536370;
	Fri, 13 Dec 2013 04:08:56 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm6095182eef.9.2013.12.13.04.08.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Dec 2013 04:08:55 -0800 (PST)
Date: Fri, 13 Dec 2013 13:09:19 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20131213120919.GB3715@jama>
References: <52A73622.4030608@linux.intel.com>
	<1386902238-4354-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1386902238-4354-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH] ltp: Use patch generated without -M
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
X-List-Received-Date: Fri, 13 Dec 2013 12:08:58 -0000
X-Groupsio-MsgNum: 48188
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Content-Disposition: inline

--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 03:37:18AM +0100, Martin Jansa wrote:
> * in my builds both versions worked, but Saul reported that it fails to
>   apply with:
>   Applying patch
>   0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
>   patch: **** Only garbage was found in the patch input.
>=20
>   Now I've see the same issue on different builder (with Ubuntu 12.04).

The difference is version of patch utility:
gentoo:
ltp/20130904-r0/git $ patch -v
GNU patch 2.7.1
=2E..
ltp/20130904-r0/git $ patch -p1 < ../0001-Rename-runtests_noltp.sh-script-s=
o-have-unique-name.patch
patching file testcases/kernel/containers/sysvipc/runipctests_noltp.sh (ren=
amed from testcases/kernel/containers/sysvipc/runtests_noltp.sh)
patching file testcases/kernel/containers/utsname/runutstests_noltp.sh (ren=
amed from testcases/kernel/containers/utsname/runtests_noltp.sh)

ubuntu 12.04:
ltp/20130904-r0/git$ patch -v
patch 2.6.1
=2E..
ltp/20130904-r0/git$ patch -p1 <
=2E./0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
patch: **** Only garbage was found in the patch input.

patch-native is in ASSUME_PROVIDED, I guess that quilt-native just calls
patch internally so have the same "problem"

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKq+O8ACgkQN1Ujt2V2gBxOYwCgr/F9qd22k+2HxxMr7rdGVd5n
inIAoIBDkwy2k6vuYvfjizGna6fxxfHM
=MaRQ
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
