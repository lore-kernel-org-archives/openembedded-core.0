Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id AF0B2607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 18:55:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 14 Jun 2017 11:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,341,1493708400"; 
	d="asc'?scan'208";a="274323356"
Received: from jalamego-mobl2.zpn.intel.com (HELO [10.219.128.123])
	([10.219.128.123])
	by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2017 11:55:45 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CA+chaQf0chop2q_9UD9aqDe+9dZbMdEXtB2Y636REOTFXoDBkw@mail.gmail.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <fd3a8d0e-bcc9-22dc-2799-25a59f28341d@linux.intel.com>
Date: Wed, 14 Jun 2017 13:55:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQf0chop2q_9UD9aqDe+9dZbMdEXtB2Y636REOTFXoDBkw@mail.gmail.com>
Subject: Re: Patchwork git hooks for meta-oe repository
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
X-List-Received-Date: Wed, 14 Jun 2017 18:55:56 -0000
X-Groupsio-MsgNum: 98770
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="OE7wAu91JlDFDqwri77XduObX1sPDO7af"

--OE7wAu91JlDFDqwri77XduObX1sPDO7af
Content-Type: multipart/mixed; boundary="s5VfdFmtwxQlFETDHMitodIwoGqdOna5R";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <fd3a8d0e-bcc9-22dc-2799-25a59f28341d@linux.intel.com>
Subject: Re: Patchwork git hooks for meta-oe repository
References: <CA+chaQf0chop2q_9UD9aqDe+9dZbMdEXtB2Y636REOTFXoDBkw@mail.gmail.com>
In-Reply-To: <CA+chaQf0chop2q_9UD9aqDe+9dZbMdEXtB2Y636REOTFXoDBkw@mail.gmail.com>

--s5VfdFmtwxQlFETDHMitodIwoGqdOna5R
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 06/14/2017 07:57 AM, Martin Jansa wrote:
> I don't know if they are supposed to work now, but the output from git
> remote indicates that they probably don't work:
>=20
Yes, we found this issue when enabling the hook for automated updates
for all the Patchwork projects.
I've disabled the hook while finding a fix. Thanks for the heads up and
sorry for any inconvenience.

Jose Lamego
> remote: /usr/local/patchwork/tools/post-receive_standalone.hook: line
> 65: $4: unbound variable
>=20
> remote: ++ git -C Next rev-parse
> remote: ++ git -C Next rev-list --stdin --no-merges --reverse
> cd021470e9055422992a1adeae3f1f1ec59deab6..3e6defe4735b9a0
> c5757bd25eea6158c7e9d567f  =20
> remote: fatal: Cannot change to 'Next': No such file or directory
> remote: fatal: Cannot change to 'Next': No such file or directory
>=20
>=20
> Whole output from 2 pushes today:
>=20
> OE @~/meta-openembedded $git push origin master
> Counting objects: 170, done.
> Delta compression using up to 8 threads.
> Compressing objects: 100% (161/161), done.
> Writing objects: 100% (170/170), 34.85 KiB | 0 bytes/s, done.
> Total 170 (delta 89), reused 1 (delta 0)
> remote: +
> STATE_MAP=3D'refs/heads/master:Accepted;refs/heads/master-next:Master
> Next;refs/heads/ross/mut:Master U
> nder Test'
> remote: + EXCLUDE=3D
> remote: + PWDIR=3D/usr/local/patchwork/patchwork
> remote: + '[' -d /usr/local/patchwork/patchwork ']'
> remote: + '[' '!' -w /usr/local/patchwork/patchwork/post-receive_logs '=
]'
> remote: + do_exit=3D0
> remote: + trap do_exit=3D1 INT
> remote: +
> ERR_LOG_FILE=3D/usr/local/patchwork/patchwork/post-receive_logs/post_re=
ceive_standalone.log
>=20
> remote: + '[' '!' -f
> /usr/local/patchwork/patchwork/post-receive_logs/post_receive_standalon=
e.log
> ']'
> remote: + read oldrev newrev refname workdir
> remote: + found=3D0
> remote: + IFS=3D';'
> remote: + for i in '$STATE_MAP'
> remote: + key=3Drefs/heads/master
> remote: + IFS=3D' '
> remote: + '[' refs/heads/master =3D refs/heads/master ']'
> remote: ++ date
> remote: + echo -e 'Wed Jun 14 12:51:55 UTC 2017 I: Started patch-update=

> attempt using commit d3dd8bc3721f3958eb7ddeb026
> f7221d48daa986.\n'
> remote: + update_patches 0abf5af3ffd3d13c009a8ffcd5a6f045c36be837
> d3dd8bc3721f3958eb7ddeb026f7221d48daa986 Accepted
> remote: + local cnt
> remote: + cnt=3D0
> remote: + local workdir
> remote: /usr/local/patchwork/tools/post-receive_standalone.hook: line
> 65: $4: unbound variable
> remote: Sending notification emails to:
> openembedded-commits@lists.openembedded.org
> <mailto:openembedded-commits@lists.openembedded.org>
> To git.openembedded.org:meta-openembedded
>   0abf5af3f..d3dd8bc37  master -> master
>=20
> OE @~/meta-openembedded $git push -f origin master-next
> Counting objects: 183, done.
> Delta compression using up to 8 threads.
> Compressing objects: 100% (144/144), done.
> Writing objects: 100% (183/183), 60.26 KiB | 0 bytes/s, done.
> Total 183 (delta 89), reused 85 (delta 31)
> remote: +
> STATE_MAP=3D'refs/heads/master:Accepted;refs/heads/master-next:Master
> Next;refs/heads/ross/mut:Master Under Tes
> t'
> remote: + EXCLUDE=3D
> remote: + PWDIR=3D/usr/local/patchwork/patchwork
> remote: + '[' -d /usr/local/patchwork/patchwork ']'
> remote: + '[' '!' -w /usr/local/patchwork/patchwork/post-receive_logs '=
]'
> remote: + do_exit=3D0
> remote: + trap do_exit=3D1 INT
> remote: +
> ERR_LOG_FILE=3D/usr/local/patchwork/patchwork/post-receive_logs/post_re=
ceive_standalone.log
>=20
> remote: + '[' '!' -f
> /usr/local/patchwork/patchwork/post-receive_logs/post_receive_standalon=
e.log
> ']'
> remote: + read oldrev newrev refname workdir
> remote: + found=3D0
> remote: + IFS=3D';'
> remote: + for i in '$STATE_MAP'
> remote: + key=3Drefs/heads/master
> remote: + IFS=3D' '
> remote: + '[' refs/heads/master =3D refs/heads/master-next ']'
> remote: + for i in '$STATE_MAP'
> remote: + key=3Drefs/heads/master-next
> remote: + IFS=3D' '
> remote: + '[' refs/heads/master-next =3D refs/heads/master-next ']'
> remote: ++ date
> remote: + echo -e 'Wed Jun 14 12:52:04 UTC 2017 I: Started patch-update=

> attempt using commit 3e6defe4735b9a0c5757bd25ee
> a6158c7e9d567f.\n'
> remote: + update_patches cd021470e9055422992a1adeae3f1f1ec59deab6
> 3e6defe4735b9a0c5757bd25eea6158c7e9d567f Master Next
> remote: + local cnt
> remote: + cnt=3D0
> remote: + local workdir
> remote: + workdir=3DNext
> remote: + local revparse   =20
> remote: + local revs
> remote: + '[' -z '' ']'
> remote: + revparse=3Drev-parse
> remote: ++ git -C Next rev-parse
> remote: ++ git -C Next rev-list --stdin --no-merges --reverse
> cd021470e9055422992a1adeae3f1f1ec59deab6..3e6defe4735b9a0
> c5757bd25eea6158c7e9d567f  =20
> remote: fatal: Cannot change to 'Next': No such file or directory
> remote: fatal: Cannot change to 'Next': No such file or directory
> remote: + revs=3D
> remote: Sending notification emails to:
> openembedded-commits@lists.openembedded.org
> <mailto:openembedded-commits@lists.openembedded.org>
> To git.openembedded.org:meta-openembedded
> + cd021470e...3e6defe47 master-next -> master-next (forced update)
>=20
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--s5VfdFmtwxQlFETDHMitodIwoGqdOna5R--

--OE7wAu91JlDFDqwri77XduObX1sPDO7af
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJZQYaxAAoJEFJAtowlSEbniy8H/jlJILfRayRRVbWvTXgc9APh
ZQd83kwhcx1s55WVFpBlKyD3/Ru1GflRRhyQHPsue/kSGPhpRAGvkvcgzU/SRpDP
Il0MBUHmy8t6ANP9ggOCUS5l++WXlcdaYkg5+udwCvHxabK1RfPoVufMChmlAjee
eBdun+Q9cIWvREieg+gg0sTGBrp7sK6W2yKNPYdJhfLvXTaM6jktxNrDVcZIwOAa
YQE7iTD8JoffaF7vOYul5YINfd6kBW6AOcKZTQ4UjR73K3SC04NeSa1SdsJFLpAa
N5cm28kK90BKGP7NvBkKrgvrF2xvtJJTlp2l7VbBdlMAzd3/S7ynZRRK/X9XbV0=
=jVRR
-----END PGP SIGNATURE-----

--OE7wAu91JlDFDqwri77XduObX1sPDO7af--
