Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 60F6577303
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 19:27:43 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id uo6so18535425pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 11:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=kJGkmAijKmZQSN+NkRrTchB6iJhY5I2j+UXjo71++qA=;
	b=gsKWE4oQdcsjPQ9HOzFBJ70VIYr0NaTdkgCPjRe21dK2dsCQp5KXhWtoWE47Bmqlr6
	Oej5ih1EAzWAzU4Uj6yeKXzxFa+2HuSQx8GVR625U4+g9W6Ofr7vE4q2p8jRWE73UZus
	dkKamRDrXxinCxeCxJvzlwM1JSI7glT2T8yQFRcHJZ8Cq5W0nml4G5t+zD/1y3sGg1b6
	tbS+nww54nu4oATv955sb7PuW0+G1jNfGhYjLBKB8byCzDWoboZcPh20n9DxD+vH8IZX
	9Vr9MBWON3O1fc/gJZGgjkgPL7SLwzDEm9+9qi0b69JjV22BRZpCYWbMmv0VNjCgRRX9
	Z2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=kJGkmAijKmZQSN+NkRrTchB6iJhY5I2j+UXjo71++qA=;
	b=SOWFf4g68abzeDeo/gxBCJqB5i/j2K2U2OetNoVNWpx4RA1eFYHdB2m89K14AD+9qt
	Asq2Qk7Gne5PQ4KHW/CTI754OxNKOtoHVIpjMQgCe2u/JzS4rnknlP4127SzKiHpAh6P
	tfF2CRhyUuyaQlBv+kDtGdH/DCYincVYXIi5OiYZPGkkLUqVJt1sjmEhuOrdyZCb/xFh
	43CKMpisdtnj8VZSd4pyGDHH3Ks2O+qeZpwlgMSMi4aix22IhMaEC2maV1RqpMVhRXOf
	6gbjWKAqnI2gDGW8K8kjdhYcD1rk0X+8oqHVDR8l0S+CWRIR60//6Eymr/WMcnvj4F8v
	fSuQ==
X-Gm-Message-State: AG10YOTkYW4IrzYxEIpmuBjdyGTt9TLNNGtoBPJLgnGDZteUk0e7vV8WOey8Y0Gab9Af7g==
X-Received: by 10.66.216.69 with SMTP id oo5mr4831735pac.126.1454527664758;
	Wed, 03 Feb 2016 11:27:44 -0800 (PST)
Received: from ?IPv6:2601:647:4c01:b37d:95b4:fa84:8c74:446f?
	([2601:647:4c01:b37d:95b4:fa84:8c74:446f])
	by smtp.gmail.com with ESMTPSA id
	l14sm11584931pfb.73.2016.02.03.11.27.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Feb 2016 11:27:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0Lan0p9UUfXibbAt_vJ426YqrEQH98h-dA8Y5bwGriTLxQ@mail.gmail.com>
Date: Wed, 3 Feb 2016 11:27:43 -0800
Message-Id: <558336DD-79CD-4C07-9D81-32D35DDC7584@gmail.com>
References: <cover.1454480571.git.raj.khem@gmail.com>
	<cf539a03e3ad82336bf24df078174800e7f2c2a5.1454480571.git.raj.khem@gmail.com>
	<CAJTo0LbL72SbPTh22uJbRPq9G8PJRQ8Tf80bKbjYVZGBaY_kVw@mail.gmail.com>
	<852326EB-DC9D-4912-AF5D-6BB837745EBE@gmail.com>
	<CAJTo0Lan0p9UUfXibbAt_vJ426YqrEQH98h-dA8Y5bwGriTLxQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] gcc: musl related fixes for unwinding, ppc/secure-plt and gthr
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
X-List-Received-Date: Wed, 03 Feb 2016 19:27:46 -0000
X-Groupsio-MsgNum: 77476
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9E6FC98F-762E-45FB-A8F1-6B174347A907";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9E6FC98F-762E-45FB-A8F1-6B174347A907
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_AA5496E4-28F0-4142-A548-DB068587C273"

--Apple-Mail=_AA5496E4-28F0-4142-A548-DB068587C273
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 3, 2016, at 8:40 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 3 February 2016 at 16:38, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> is it with security flags enabled or disabled and which arch.
> my builds all went ok. I will do a clean build without sstate to see
> if I can reproduce your issue. May be its because I have gold linker =
enabled
> I will check that independently here.
>=20
> Security flags enabled, x86-64.  No gold.

I was able to reproduce it and have fixed it. The new changes are in =
kraj/pu branch

>=20
> Ross


--Apple-Mail=_AA5496E4-28F0-4142-A548-DB068587C273
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 3, 2016, at 8:40 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 3 February 2016 at 16:38, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"">is it =
with security flags enabled or disabled and which arch.</div><div =
class=3D"">my builds all went ok. I will do a clean build without sstate =
to see</div><div class=3D"">if I can reproduce your issue. May be its =
because I have gold linker enabled</div><div class=3D"">I will check =
that independently here.</div></blockquote></div><br class=3D"">Security =
flags enabled, x86-64.&nbsp; No =
gold.</div></div></div></blockquote><div><br class=3D""></div><div>I was =
able to reproduce it and have fixed it. The new changes are in kraj/pu =
branch&nbsp;</div><br class=3D""><blockquote type=3D"cite" class=3D""><div=
 class=3D""><div dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><br =
class=3D""></div><div class=3D"gmail_extra">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_AA5496E4-28F0-4142-A548-DB068587C273--

--Apple-Mail=_9E6FC98F-762E-45FB-A8F1-6B174347A907
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlayVLMACgkQuwUzVZGdMxSECwCfRPDgTCVh5vFjdbV/dIQ/x5FE
xpwAn3FxF7cfqmtLQs3ui4JwYV79l43c
=sAAh
-----END PGP SIGNATURE-----

--Apple-Mail=_9E6FC98F-762E-45FB-A8F1-6B174347A907--
