Return-Path: <clopez@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 8F28B780B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 14:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=dd4O0iOYqeln+9iqLKr0LDMzdDLKF6rutM0oJR4dL3k=; 
	b=ohgIYOINxxsMQiulB5maKnW9rSwyQN/DR62jiHgeJtnqnrX8CMyMBGXRZ3FwO0YIGcYsokg6jWmfMsyZtrijTFOLttJnslg7E46j+eV7TaP9kzvGAdnHZcFseFezAosDmkdl798XocGgKa2hjopmeYZTCFiE+UzGm1lKBhGp5tbs+pxK5Z3Wb+VDjyhmn6Owr8oRivhy+myNmvt1qTtBFOP+HNS1qHu2f30OQ/snq/fu9MXOlFCgjvdkx65yl4L8KVAfAe1Zpf/tPwUv5ywjfYT9TPynMqvP714k7bV3S0KG4dQk3nbvU1w2+gonxxHzC1BAtZ9sbWJLpJznpjOkzw==;
Received: from [192.168.10.149] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1duJbT-00074a-4Z; Tue, 19 Sep 2017 16:34:23 +0200
To: OE-core <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAJTo0LaTCgNx-g8jyhULWNs3bNiouu2JbptobWE5vbFVwgVnxQ@mail.gmail.com>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Openpgp: id=B5D2B50BC48EC7F1EE90D9AB965089CE6B95F882;
	url=http://key.neutrino.es
Organization: Igalia S.L.
Mail-Followup-To: OE-core <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Message-ID: <d2cf577f-a995-9cc2-380b-9a1922926abd@igalia.com>
Date: Tue, 19 Sep 2017 16:34:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaTCgNx-g8jyhULWNs3bNiouu2JbptobWE5vbFVwgVnxQ@mail.gmail.com>
Subject: Re: [oe] Use of github /archive/ tarballs in SRC_URI
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
X-List-Received-Date: Tue, 19 Sep 2017 14:34:22 -0000
X-Groupsio-MsgNum: 103135
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="NNmhmt21GmdVGGagETcdhX5wJ44Fo7Dii"

--NNmhmt21GmdVGGagETcdhX5wJ44Fo7Dii
Content-Type: multipart/mixed; boundary="wSMXuOcFwxqDc5X5PHoNKu8xlN7Up8R5R";
 protected-headers="v1"
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: OE-core <openembedded-core@lists.openembedded.org>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Message-ID: <d2cf577f-a995-9cc2-380b-9a1922926abd@igalia.com>
Subject: Re: [oe] Use of github /archive/ tarballs in SRC_URI
References: <CAJTo0LaTCgNx-g8jyhULWNs3bNiouu2JbptobWE5vbFVwgVnxQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaTCgNx-g8jyhULWNs3bNiouu2JbptobWE5vbFVwgVnxQ@mail.gmail.com>

--wSMXuOcFwxqDc5X5PHoNKu8xlN7Up8R5R
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 19/09/17 10:09, Burton, Ross wrote:
> Then the tarball for one of Erlang's repositories changed, and was noti=
ced
> by the checksum in the recipe (thanks Gunnar Andersson for reporting
> this).  The extracted contents are identical, but the tarball itself ha=
s
> changed.  I'm presuming this is due to the old tarball expiring in thei=
r
> cache, and a newly generated tarball using a later version of tar.

I don't think tar is the one to blame, but gzip.
I have just tested GNU tar (versions 1.29 and 1.26) and BSD tar (from
OpenBSD 5.8) and the 3 have produced identical archives (same md5sum)
when invoked like git archive does.

However, the .tar.gz file generated was different in the case of BSD.
It even had a different file size.

I bet that if you uncompress both files, the .tar will have the same
checksum in both cases.

I guess that a different version (or implementation) of gzip, or even
different local settings like forcing a more or less aggressive
compression can be the explanation here.

Maybe an idea is that OE could gain a feature to optionally do a
checksum of the .tar file once uncompressed that could be used as a
fallback second check if the first one fails?
If the first one fails but the second one passes a non-fatal WARN could
be issued.


--wSMXuOcFwxqDc5X5PHoNKu8xlN7Up8R5R--

--NNmhmt21GmdVGGagETcdhX5wJ44Fo7Dii
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: You can fetch my GnuPG key from http://key.neutrino.es

iQIzBAEBCgAdFiEEtdK1C8SOx/HukNmrllCJzmuV+IIFAlnBKu4ACgkQllCJzmuV
+IJB3A//bm0k9e2CMDtkOjadhAupGtSf2c8XwKO6VajQCePG00ScrzeYD4+qhivi
G7uPftjD7GsqreLqtCtsl5u5BJZZYmHjxATMRS/75kZjqOuMZQ/lFhUiLpEIwubr
oU5vDc1FCwtNGlhigyRgD+S8UJWLgQAn/cUvnzU+fEeG8eBD8WfOPmxZdzct2G6P
s3XWby2LER45/0WOzlau4VpMtM1+s8szBgD287ixB/fw0+mFsgJCMo7kz2Q+axfr
iYGZv8rX9Ko/uMiwoKwsuY1wp4DBVl+e76Wo1iy6qhmiKvdES2EASsEmDMVBtTFB
RgQ7ts3YAxvzrcOraSwdw0Gx9DTGgswK8ToHOxZZWTXztY/4q/T+ioGKcAGkBghw
uVb+jtqbT5PLCPFTFLNJNucNEFdButYssh+QmbplDz6ip96IlKM+tg5IWpdv41if
eKfANQOuifTaMOkw+A/XRBvtNSaXmILskqdG+Y6i+zvxzq/s8fkDAHZUBtG62bEU
7gdoaVK+iV79X7rzS2nJLalIqiIty3k6Vcq34TEODdqxh+JDmBow0i82zcfNSTyk
mHmiCDTeGEG3osu/6FgkSjD7t0rpq/srKfi5yuseVZCoUAiGFY877M69aQbfZCbs
gzyv+dVsh2WJBW5B3wvT8i7a4mxrv5b2U3uNhuQjXIfK/4jyxYM=
=14jD
-----END PGP SIGNATURE-----

--NNmhmt21GmdVGGagETcdhX5wJ44Fo7Dii--
