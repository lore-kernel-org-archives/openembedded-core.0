Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com [67.231.157.48])
 by mx.groups.io with SMTP id smtpd.web09.4509.1632299383997438451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 01:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: ge.com, ip: 67.231.157.48, mailfrom: ian.ray@ge.com)
Received: from pps.filterd (m0048300.ppops.net [127.0.0.1])
	by m0048300.ppops.net-00176a03. (8.16.1.2/8.16.1.2) with SMTP id 18M4nHc0046856
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 04:29:43 -0400
IronPort-SDR: JIAik7LoDqcm+MWGuwxcB2XMwlLXlhSvLjOXRwsmOW+SoHyA815FeKMWn98IO+PnolczyDlTlL
 Jgsc8t1JgQ3w==
Date: Wed, 22 Sep 2021 11:29:41 +0300
From: "Ian Ray" <ian.ray@ge.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: EXT: Re: [OE-core] [PATCH V2] archiver: Configurable tarball compression
Message-ID: <20210922082941.GA47151@zoo6.em.health.ge.com>
References: <20210921061517.8235-1-ian.ray@ge.com>
 <6c5ca68319e216177b75f0e3cb6ad8da0bcf8c25.camel@linuxfoundation.org>
 <16A6D8EA388563F3.1316@lists.openembedded.org>
 <a06209fe-c772-7a28-bde8-4627fef58296@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <a06209fe-c772-7a28-bde8-4627fef58296@bootlin.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: tUxLRv8VPgLdaYSwY2Wj4JkXhbRsdm3Z
X-Proofpoint-ORIG-GUID: tUxLRv8VPgLdaYSwY2Wj4JkXhbRsdm3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-22_02,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 phishscore=0 mlxscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109220057
X-MIME-Autoconverted: from 8bit to quoted-printable by m0048300.ppops.net-00176a03. id 18M4nHc0046856
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2021 at 03:48:29PM +0200, Michael Opdenacker wrote:
>=20
> On 9/21/21 3:20 PM, Michael Opdenacker wrote:
> > By the way, zstd seems to be marginally worse (+1%) than xz in terms =
of
> > compressed size, but is orders of magnitude faster (see
> > https://archlinux.org/news/now-using-zstandard-instead-of-xz-for-pack=
age-compression/).
>=20
>=20
> Actually, this article only mentions decompression speed, but that's
> also true for compression speed.
>=20
> Here are my own tests:
>=20
> mike@mike-laptop:~/tmp$ time gzip linux-5.15-rc2.tar
>=20
> real=A0=A0=A0 0m29.293s
> user=A0=A0=A0 0m28.712s
> sys=A0=A0=A0 0m0.553s
>=20
> mike@mike-laptop:~/tmp$ time xz linux-5.15-rc2.tar
>=20
> real=A0=A0=A0 7m2.658s
> user=A0=A0=A0 7m1.096s
> sys=A0=A0=A0 0m1.280s
>=20
> mike@mike-laptop:~/tmp$ time zstd linux-5.15-rc2.tar
> linux-5.15-rc2.tar=A0=A0 : 16.29%=A0=A0 (1136803840 =3D> 185233271 byte=
s,
> linux-5.15-rc2.tar.zst)
>=20
> real=A0=A0=A0 0m5.476s
> user=A0=A0=A0 0m5.530s
> sys=A0=A0=A0 0m0.864s
>=20
> mike@mike-laptop:~/tmp$ ls -la linux-5.15*
> -rw-rw-r-- 1 mike mike 1136803840 Sep 21 15:31 linux-5.15-rc2.tar
> -rw-rw-r-- 1 mike mike=A0 198135832 Sep 21 15:24 linux-5.15-rc2.tar.gz
> -rw-rw-r-- 1 mike mike=A0 125980548 Sep 21 15:26 linux-5.15-rc2.tar.xz
> -rw-rw-r-- 1 mike mike=A0 185233271 Sep 21 15:31 linux-5.15-rc2.tar.zst
>=20
> So, here the claim that zstd (with default options) is almost as good a=
s
> xz in compressed size is not confirmed. However, zstd is a clear winner
> in terms of compression speed, and anyway better than gzip. This is
> worth switching.

Thank you for measuring this! =20

I will re-submit the patch when we update to a more recent Yocto
version.


>=20
> Cheers
>=20
> Michael
>=20
> --=20
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>=20
>=20

