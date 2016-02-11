Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id AFE306FF97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 16:13:16 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id p5so670516paw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 08:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=zjO4tZ6M02QKjhZIjhglaT83mzzC8Hf+7wBCe7nJaoA=;
	b=Tw5r+1fGTBQokousCdk7pQ9sTu9VvHol5p3cYK1UDQFBeIq2N+UTRBjw00m2EOWzho
	KIpWq9gLyDg4tXptW7cKBbKNlhe512fsoWV8jhIxKeaooJk9q5TA5/+WaLaq+zguH73J
	jWoezo7poJa2HZZlLpngOatkwfduIjzKkEeTZD7AEzL/F3YaCmxI4MG2Jf4DFK6/6fM7
	Pscn/ZROmm9gQ8M49c0f7BJHONKZLN8+AkvigG/8Yhxz6wvSjf9huAuTcPBP0macXxj7
	RqsUUYXveK8KX/sp4h0PFgICu4CZ950OaDWBXVHu2ejoFXhhoR4sPDnr2Y0tJsqqSlN+
	1liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=zjO4tZ6M02QKjhZIjhglaT83mzzC8Hf+7wBCe7nJaoA=;
	b=L9YVy7HwOxPt2KeuTwQ8bo0ZwTAjbJbdcBCCARNGBP9skibgP3m3UcG3eh0HJaootb
	D0l6SZFxdrDgvANXufN/ea2cuYCDBndBU5vJ9XKiq+itI7QCckZEDg4A2gJEvWZDem2S
	qHJo1L1WoRm50oEUFtNQ9va6ExaD6+eCwWi0pWgeG3maPdOKM1ExsePeIZypyHqxjvWD
	HHfQl9Qx3h5+5CZhxrJYr/zUQDW1k1K1KGwlHdGyFCoMrRtnI3qOJf+ySYFA635oFLz7
	+miYWwZYMmRw0wotSX2JQIyF30p9H0mkrA/B+OIjl+Aq0gIAsVu8GKUJ17PuVW5Fqx6I
	ajGQ==
X-Gm-Message-State: AG10YOSGuXdrHIGlRAzRMgR7nr2c7w+CvRwe9bRFLMD23jDBMW0SfZRBK5XMTBXfIpNdfA==
X-Received: by 10.66.142.200 with SMTP id ry8mr13623187pab.11.1455207196984;
	Thu, 11 Feb 2016 08:13:16 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:a190:ab95:2b5:eacb?
	([2601:646:8802:5d5c:a190:ab95:2b5:eacb])
	by smtp.gmail.com with ESMTPSA id
	pu3sm13378966pac.9.2016.02.11.08.13.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Feb 2016 08:13:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1455185559.16142.244.camel@linuxfoundation.org>
Date: Thu, 11 Feb 2016 08:13:11 -0800
Message-Id: <B9BD853D-6CD5-4726-A4A6-C5ADBB6A062C@gmail.com>
References: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
	<216ce45325c2608c2f9b1fece5dee005e6ee2ba7.1455126045.git.raj.khem@gmail.com>
	<1455185559.16142.244.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/9] ltp: Upgrade to 20160126 and fix build on musl
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
X-List-Received-Date: Thu, 11 Feb 2016 16:13:16 -0000
X-Groupsio-MsgNum: 78012
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8885C62E-ADF8-413D-902D-5BF7A14207E4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8885C62E-ADF8-413D-902D-5BF7A14207E4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 11, 2016, at 2:12 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> I tested this in master-next on the AB, it fails for
> "MACHINE=3Dedgerouter bitbake ltp":
>=20
> | 1455184833.52:                                             ^
> | 1455184833.52: In file included from =
/media/build1/poky/build/tmp/sysroots/edgerouter/usr/include/asm/types.h:2=
2:0,
> | 1455184833.52:                  from =
/media/build1/poky/build/tmp/sysroots/edgerouter/usr/include/linux/types.h=
:4,
> | 1455184833.52:                  from =
/media/build1/poky/build/tmp/work/mips64-poky-linux/ltp/20160126-r0/git/ut=
ils/sctp/testlib/../include/netinet/sctp.h:37,
> | 1455184833.52:                  from sctputil.c:55:
> | 1455184833.52: =
/media/build1/poky/build/tmp/sysroots/edgerouter/usr/include/asm-generic/i=
nt-l64.h:28:25: note: previous declaration of '__s64' was here
> | 1455184833.52:  typedef __signed__ long __s64;
> | 1455184833.52:                          ^
> | 1455184833.52: In file included from =
/media/build1/poky/build/tmp/sysroots/edgerouter/usr/include/asm-generic/t=
ypes.h:6:0,
> | 1455184833.52:                  from =
/media/build1/poky/build/tmp/work/mips64-poky-linux/ltp/20160126-r0/git/ut=
ils/sctp/testlib/../include/netinet/sctp.h:38,
> | 1455184833.52:                  from sctputil.c:55:
> | 1455184833.52: =
/media/build1/poky/build/tmp/sysroots/edgerouter/usr/include/asm-generic/i=
nt-ll64.h:30:42: error: conflicting types for '__u64'
> | 1455184833.52:  __extension__ typedef unsigned long long __u64;
> | 1455184833.52:                                           ^
>=20
> also did so locally.

OK. I tested it for qemumips along with other qemu machines. I think the =
real fix there is to not use __u64, I will reproduce it on edgerouter =
build.

>=20
> Cheers,
>=20
> Richard


--Apple-Mail=_8885C62E-ADF8-413D-902D-5BF7A14207E4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAla8sxsACgkQuwUzVZGdMxTNEACcCR+qxFsE7p+VWNgHeK8H4kAi
l3kAnAro0o1FpiQKl/vYP0Uy7V9rmVdT
=8lhi
-----END PGP SIGNATURE-----

--Apple-Mail=_8885C62E-ADF8-413D-902D-5BF7A14207E4--
