Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 45925738AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 14:38:14 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id ts6so3868993pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 07:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=bt6OLGqHY9WGz8eJ7qpXPvnQ0wl4YNajkfIJ7PLZ7Hk=;
	b=Vh4SZ9VtMbNhtn2/poq8okQ6UeX5JdqKFoAf68bgZ7VZCuHhXjvCRDW8+CtphtDynJ
	P+CAIr1tGW/RE9+uGdztrF23uyqXdqZi8+zLW7kL0HNftEb6p80RTVS+VMy0hzO8KmWH
	6Y8zzVlf8mQtX0z4v+feo4MHRu9jWURUFYiPi3IXBn5aC2LJe0gq3H48wgpvtsU7ypk7
	o38YXfrU4k6/x15K4aHPczMQPcDsgy0CJS+3owHbR0RHPq9XUPWaczEnqLU3xgBSuLPP
	GrqXcTmyj4Vg80O17NYOURgHlHURDzoUYOn79Cz5Mtfl8CD7d5qp8F4ZGOVB7yiGtC6I
	dqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=bt6OLGqHY9WGz8eJ7qpXPvnQ0wl4YNajkfIJ7PLZ7Hk=;
	b=XHm3Ip75ck+bfkn41XS+pkLrvQ3E5GFq/M72itVVJRoxRHTmL2J0vK69Oce8+gp1/6
	/S2R6Ultnx6z1bEn60alyFrtoxpZsojTMN1oYw65a/GmzOJug9SciEbrzwyDJ9IFT7AH
	m2mHfNb+MipEsOK1fOeMxtXY7q3eZ9jtSAFzKdpJR+GUr6QdJ37Vzw674Mk1zjSXT/1w
	6JUgU74Sf0qiLCE5oTur68Qp6SaVY7OpZOV15S6zuc84sLhYDxBblObBQ0vwcQHNJuVq
	qzb1EPlpkNo5x1HuDP7kNWqGBsATn7/WMSC6fNGScSb3et3d2AmlIKpdjyIPMDpl5kXl
	+yIA==
X-Gm-Message-State: ALyK8tI3APso3i+nTv8FWW8hl6F6f2G4KNYtLedarsZZWZ7y/wnd/ycKRYSW3QqG6wwaIw==
X-Received: by 10.66.182.194 with SMTP id eg2mr5422574pac.159.1466087895719;
	Thu, 16 Jun 2016 07:38:15 -0700 (PDT)
Received: from [192.168.0.6] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	z123sm61182710pfb.89.2016.06.16.07.38.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2016 07:38:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5762b536.ea7ec20a.4591c.ffffbfc2SMTPIN_ADDED_BROKEN@mx.google.com>
Date: Thu, 16 Jun 2016 07:38:13 -0700
Message-Id: <693FEC68-8F39-42E1-AF73-D709F9EAD441@gmail.com>
References: <1465997797-6613-1-git-send-email-j.remmet@phytec.de>
	<7E603C53-3E9F-488E-8AC2-AA8D4AB8DBC0@gmail.com>
	<5762b536.ea7ec20a.4591c.ffffbfc2SMTPIN_ADDED_BROKEN@mx.google.com>
To: Jan Remmet <J.Remmet@phytec.de>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs-postcommands: generate /var/lib/systemd/clock
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
X-List-Received-Date: Thu, 16 Jun 2016 14:38:15 -0000
X-Groupsio-MsgNum: 83516
Content-Type: multipart/signed;
	boundary="Apple-Mail=_81D4BD23-C09F-4757-A845-43FCA1880317";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_81D4BD23-C09F-4757-A845-43FCA1880317
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 16, 2016, at 7:17 AM, Jan Remmet <J.Remmet@phytec.de> wrote:
>=20
> On Wed, Jun 15, 2016 at 12:14:17PM -0700, Khem Raj wrote:
>>=20
>>> On Jun 15, 2016, at 6:36 AM, Jan Remmet <J.Remmet@phytec.de> wrote:
>>>=20
>>> systemd timesyncd check /var/lib/systemd/clock instead of
>>> /etc/timestamp.
>>> If this file is missing it defaults to TIME_EPOCH. It's set while
>>> configuring systemd.
>>>=20
>>> Signed-off-by: Jan Remmet <j.remmet@phytec.de>
>>> ---
>>> meta/classes/rootfs-postcommands.bbclass | 6 ++++++
>>> 1 file changed, 6 insertions(+)
>>>=20
>>> diff --git a/meta/classes/rootfs-postcommands.bbclass =
b/meta/classes/rootfs-postcommands.bbclass
>>> index db8b551..0c7b764 100644
>>> --- a/meta/classes/rootfs-postcommands.bbclass
>>> +++ b/meta/classes/rootfs-postcommands.bbclass
>>> @@ -234,6 +234,12 @@ python write_image_manifest () {
>>> # sane default time setting
>>> rootfs_update_timestamp () {
>>> 	date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
>>> +
>>> +	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", =
"false", d)}; then
>>> +		# touch needs timestamp as [[CC]YY]MMDDhhmm[.ss]
>>> +		TS=3D$(sed 's/[.]*/&./13' ${IMAGE_ROOTFS}/etc/timestamp)
>>> +		touch -t $TS ${IMAGE_ROOTFS}/var/lib/systemd/clock
>>> +	fi
>>> }
>>=20
>> i wonder if this will work with read only rootfs.
> I found no special handling for systemd and /var/lib if IMAGE_FEATURES
> read-only-rootfs is used.
> If timesyncd didn't find /var/lib/systemd/clock it defaults to the =
configure
> time value und try to write /var/lib/systemd/clock. On read-only it =
will
> silently fail.
> So I don't see a problem here.

It fixes one case when rootfs is r/w but create another behavior when =
its r/o
in r/o case /var/lib/systemd must be mounted r/w during boot. So the =
timesyncd service
should check for that directory to exist I have a hunch if thats checked =
then this patch
may not be needed

>=20
> Jan
>>=20
>>>=20
>>> # Prevent X from being started
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>=20
>=20


--Apple-Mail=_81D4BD23-C09F-4757-A845-43FCA1880317
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldiudYACgkQuwUzVZGdMxSdfQCZARf/yfahnEVok0xeWQH5O2zX
c6MAnj8T8dhKZlfoepLCSaYPsZDvhn4D
=h6Iz
-----END PGP SIGNATURE-----

--Apple-Mail=_81D4BD23-C09F-4757-A845-43FCA1880317--
