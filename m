Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id CE2A076DF8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 16:02:59 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so14221795pad.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 09:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=1VAoOWBqgSSstErokT4+WGhecpGIYKxIhUGe9sTPbis=;
	b=Vy/U3JRYVomBegJV16RWTy1I3FWlhM5/C70jd9GvXfdnOWpHnFAqkb0tCNo8C6j4Cp
	ZOL/VWsZIw1ZUyXSOwTL7HkT977c0D2aCqEYy4sx4O07i3DLooBP5jhsV05BXnY0p5Y+
	naE4GKbmf0YGtiz0wkZDE4ZLVDQ4q6iuL24Psb2EN2oQRacFyD4ViwDBNmeuIqnCy5ap
	MKHXZxMO3EZM+dkTcQ9j8dwxfafkWaF6v25JCxotgL22Ck5wlLSQ206ZfpaMCYxQBiIz
	PGcu/+3/N4EbhdLvogoCWNzoh663xXSpFHJmmOq1tTML78/eQKXbmSLqCQIV0NE+sj68
	Xk3Q==
X-Received: by 10.67.22.99 with SMTP id hr3mr62004109pad.41.1441814579770;
	Wed, 09 Sep 2015 09:02:59 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:a80f:97a4:8ac:b5c7?
	([2601:646:8601:4580:a80f:97a4:8ac:b5c7])
	by smtp.gmail.com with ESMTPSA id
	xv12sm7491123pac.38.2015.09.09.09.02.58
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Sep 2015 09:02:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
X-Priority: 3 (Normal)
In-Reply-To: <64065.10.252.58.194.1441794205.squirrel@linux.intel.com>
Date: Wed, 9 Sep 2015 09:02:50 -0700
Message-Id: <32176B14-814F-40D7-A452-86D835E38FCB@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<0b794c84466fef2ece1269e01820503b4bce0b52.1441753511.git.raj.khem@gmail.com>
	<63981.10.252.58.194.1441792979.squirrel@linux.intel.com>
	<64065.10.252.58.194.1441794205.squirrel@linux.intel.com>
To: alexander.kanavin@linux.intel.com
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/16] slang: Fix namespace conflict vis-a-vis posix_close
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
X-List-Received-Date: Wed, 09 Sep 2015 16:03:01 -0000
X-Groupsio-MsgNum: 70921
Content-Type: multipart/signed;
	boundary="Apple-Mail=_660ECE92-F543-46F3-8BA6-1E8199B2B157";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_660ECE92-F543-46F3-8BA6-1E8199B2B157
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Sep 9, 2015, at 3:23 AM, alexander.kanavin@linux.intel.com wrote:
>=20
>>> +Exposed while compiling on musl
>>> +
>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> +---
>>> +Upstream-Status: Pending
>>=20
>> If this has been submitted upstream (as you say in the cover letter =
for
>> this patchset), please provide a link for the submission in the
>> upstream-status. We can't afford to let the amount of 'Pending' =
patches in
>> oe-core grow indefinitely.
>>=20
>> Same goes for other patches in this set.
>=20
>=20
> Actually scratch the above, it was too hasty. What I really wanted to =
say
> is that, ideally, you should first submit the patches upstream, have a
> prooflink of that, and only then send them here with that proof in the
> upstream-status. There are already too many eternal 'Pending' patches =
in
> oe-core that never made it to upsream. We can't afford more of them.

There is process for that. The upstreaming of a patch is an independent =
thing thats why pending status
is agreed upon probably it predates you in OE contributor's community.
since it deals with different community, and usually we carry a patch =
for a release or two
and then it gets merged or redone and we drop it. Many a times with =
recipe upgrades you will
see patches get dropped for these reasons. As integrators, the =
engagement of rule is a bit different for us. since every component =
community has its own interworking and nature, this way we make progress =
while upstreaming takes its own course. This process is followed by all =
major distro=92s as well including OE.
Now if we want to step ahead and change a policy to first submit patch =
upstream then it will be accepted in OE
thats a fine idea, however that requires a wider discussion community =
wide and also needs tools to reject
patches with out upstream submission. It also has downside where a =
distro developer may not participate upstream
and hence with not enough momentum things will stall and people may =
prefer to carry own forks, so we have
to make it less burdensome. We can not go by grey area where we say this =
patch should be first submitted upstream and this we can accept without =
submission since that will put extra burden on maintainers of OE for =
deciding on code thats they may not be experts in.

So I encourage you to formulate a policy and make a proposal to =
community and get everyone on board in changing
the policy OE wide.

Cheers
-Khem


--Apple-Mail=_660ECE92-F543-46F3-8BA6-1E8199B2B157
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXwWDIACgkQuwUzVZGdMxTZMgCffgignfGygTn1mVH+Py/FBATX
708An2aqBx1FoXGV2hKz34GD+IRY0U3h
=rd1E
-----END PGP SIGNATURE-----

--Apple-Mail=_660ECE92-F543-46F3-8BA6-1E8199B2B157--
