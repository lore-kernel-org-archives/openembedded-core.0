Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPhiw-0007NZ-NA
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 01:13:18 +0200
Received: by mail-ea0-f174.google.com with SMTP id m14so3036824eaj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 15:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=t1LCwbBTb/FqIREwuMUPBoVsxVKIbQ+MyqooAjzT7UU=;
	b=uTAHw0bcTGNFSWP0LxxDm/lVhXz2zCizo10jluZzaqsI61+gDlhjoQYh6jwkKFQwSH
	tjXXnlnnDfkN6xGoZlrbra7GZ2ju8XmbxbGmxLJsFUi2oU0HC0pYsPTT39TS7jv09T3/
	PKFZDySdtGnBbvdjnkMwjITrzco+RLRMRaLhmB5ECkKihuHHkSOf0rqIfCBcD9g2OQ24
	phN0faVL5Qr9l1Tq4opECOrC20p/ig9UhibWWMZle438jOnEJcok6qP3NQ91RZqKZvE2
	Np4hRW1+J2wxID4dIfjad82JAE7doVmYXqqb/EzXzIzGtnArr/3wahlrxGYXHBY9tlx8
	18BQ==
X-Received: by 10.14.183.198 with SMTP id q46mr64815555eem.1.1365548150029;
	Tue, 09 Apr 2013 15:55:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b5sm8735598eew.16.2013.04.09.15.55.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 15:55:49 -0700 (PDT)
Date: Wed, 10 Apr 2013 00:55:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20130409225549.GG2474@jama>
References: <cover.1363156578.git.Qi.Chen@windriver.com>
	<5482882.4phbAeRO1n@helios>
	<1364318752.6320.27.camel@phil-desktop.brightsign>
	<6500457.3vgtoKXQDv@helios>
	<1365541265.2116.9.camel@pb-ThinkPad-R50e>
MIME-Version: 1.0
In-Reply-To: <1365541265.2116.9.camel@pb-ThinkPad-R50e>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rm_work.bbclass: inhibit rm_work per recipe
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
X-List-Received-Date: Tue, 09 Apr 2013 23:13:26 -0000
X-Groupsio-MsgNum: 37703
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UKNXkkdQCYZ6W5l3"
Content-Disposition: inline

--UKNXkkdQCYZ6W5l3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 09, 2013 at 10:01:05PM +0100, Phil Blundell wrote:
> On Tue, 2013-03-26 at 17:52 +0000, Paul Eggleton wrote:
> > I'm sure this has come up before, but is rm_old_work something we ought=
 to=20
> > have in OE-Core?
>=20
> Obviously it's not for me to say, but I suspect probably not.  It
> requires ${WORKDIR} to follow a particular pattern, which not everybody

That pattern is now default in oe-core:
commit 05075cf3138d1c61f5cf4fe0e1a4587acc00c692
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Fri Nov 16 15:35:53 2012 +0000

    bitbake.conf/sanity: Separate versions and PN stamp components into
separate directories for WORKDIR and STAMP


> will necessarily want, and I don't think you could really argue that it
> represents "core" functionality either.

I think that in some cases it's more useful then rm_work.

IMHO only missing part is good documentation (or better name) describing
rm_work/rm_work_old difference:

1) rm_work is much better for builds in tmpfs
2) rm_work_old is better then rm_work if you have enough space to keep
1 WORKDIR for each component you're building

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UKNXkkdQCYZ6W5l3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFknHUACgkQN1Ujt2V2gByiLACgjnNRVWfl81OG2ZV2TMSfKZOT
qu0AoI80Aww1PxRQAQ3BvHqxVocapU2J
=0ZJa
-----END PGP SIGNATURE-----

--UKNXkkdQCYZ6W5l3--
