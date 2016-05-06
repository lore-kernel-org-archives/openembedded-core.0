Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id B8CAE6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 14:13:51 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id c189so51882923pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 07:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=4NtEP8xZ51yNYzdVrAq0sYln7A3xanyfF5REV/63kww=;
	b=qXF+MQEAz0plpK0F8+w9P9PyuGwWg6Jpo4Ttfq2e5hN1nxFgq4H/DKY37P0JYRSs0M
	DHEHm3NuvTwHyDvTByfYSFM+UqG6UWY2n62nLZAV/KJr+0jirZvSLTsdKYXPm0iP7782
	MyC0+BW4sF+3j9TeIC14LKX0DPHx3oyGtrLNiCXISzFfYuuRtsdqW9GvT2r5fOFuTZYg
	y/4jkPySq18YwMS1Ji9aE8IW2lX7oGbegoGsVRORE8Ih6vq7Rt2vGh7iEjwczn89dYvx
	m+RNuHDuVjQJuLdvs53wILTIJmDSHILWUqv45Lyhj/zotpP8UMAB/m8wkQLKwjsnoZ2h
	VljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=4NtEP8xZ51yNYzdVrAq0sYln7A3xanyfF5REV/63kww=;
	b=H7MCE2XTU5c7Z9GNHUOjjae9Zp6OnXjvcVBvlYYMXG8AZy1+HsibWGbVuhmzqviDG5
	MLNW67hJsvych10sIVfJKVzZjkQMxpfSAd3vC4vkKzPgcPTviL2Pb1fjhaoEP3vl/S2p
	ds+bmItXeU06hxsz4J8tm1Sb7MgoAEA4DmlQvtLf5aEH0QI7PU03FoSP6SmvDhlJrSWb
	Jxxri+JEZX14yNbIhek2rguCJnLdz9KLdSyYlL4r0RxnS4pelMa/bWns2B+IVgsm5MVJ
	7UanWYcIUIHQoAkAqs13iTKsKHab+zi38hHwHXMal2XjXD5gKJhJiOvPxyLmpw0kHTxq
	8ZqA==
X-Gm-Message-State: AOPr4FXG0DicJopQhiFB2x5hJ8za/HxwArRbL2craGHSG3raXqCnHjLHDKJwNwy/RzG9FQ==
X-Received: by 10.98.109.197 with SMTP id i188mr29086785pfc.88.1462544031939; 
	Fri, 06 May 2016 07:13:51 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:7d5a:e5f2:4cd9:25ad?
	([2601:646:8800:5a9a:7d5a:e5f2:4cd9:25ad])
	by smtp.gmail.com with ESMTPSA id
	y128sm21510630pfb.13.2016.05.06.07.13.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 May 2016 07:13:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <3e695d04-c762-c199-3f8f-142b74bf90e6@windriver.com>
Date: Fri, 6 May 2016 07:13:46 -0700
Message-Id: <1A010AA0-37A1-4C03-AC4A-6232D6FFAC0F@gmail.com>
References: <1462534000-18539-1-git-send-email-ross.burton@intel.com>
	<3e695d04-c762-c199-3f8f-142b74bf90e6@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: add default for IMAGE_FSTYPES_DEBUGFS
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
X-List-Received-Date: Fri, 06 May 2016 14:13:51 -0000
X-Groupsio-MsgNum: 81672
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D1DF1041-9AEF-48EE-9267-1A04D2892F1E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D1DF1041-9AEF-48EE-9267-1A04D2892F1E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 6, 2016, at 6:51 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>=20
> On 5/6/16 6:26 AM, Ross Burton wrote:
>> If debug filesystem generation is enabled but this isn't assigned =
then the
>> generation code throws exceptions.
>>=20
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Acked-by: Mark Hatle <mark.hatle@windriver.com>
>=20
> (This is the patch that I thought had been sent before.. obviously =
didn't happen..)
>=20

Please bring this to krogoth as well.

> Thanks!
> --Mark
>=20
>> ---
>> meta/conf/bitbake.conf | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 1c4175f..8e02e91 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -713,6 +713,7 @@ require conf/sanity.conf
>> DL_DIR ?=3D "${TOPDIR}/downloads"
>> SSTATE_DIR ?=3D "${TOPDIR}/sstate-cache"
>> IMAGE_FSTYPES ?=3D "tar.gz"
>> +IMAGE_FSTYPES_DEBUGFS ?=3D "${IMAGE_FSTYPES}"
>>=20
>> INITRAMFS_FSTYPES ?=3D "cpio.gz"
>> # The maximum size in Kbytes for the generated initramfs image size.
>>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_D1DF1041-9AEF-48EE-9267-1A04D2892F1E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcspp4ACgkQuwUzVZGdMxR49gCbBQemCHLLkJLGt1o1CjbS/qDX
gRgAnRNQC8DDZu0s9Th8ivXEu3/sqKj1
=wsmp
-----END PGP SIGNATURE-----

--Apple-Mail=_D1DF1041-9AEF-48EE-9267-1A04D2892F1E--
