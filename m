Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7B77671A4B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 18:38:23 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id qn10so8370481pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 11:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=3fEXLCyWcIjJ3fCyhSJjaOG8MONCyh4KiFh6HIc5wFk=;
	b=TjcLSRGsybv16mj/49IPySk6xTFJrU1D5YAmWuraciiz6dKXXvD2hBdofsE6QVlU9x
	lqczCWOptYkrZQ6uTujQsQGfYk6h3pUJSvOwTAZrZZ+sYKtRLLbDxPlBYcGey78/holj
	S/NXKJgnhfLnLJp8alz75Dq18ytrIxZBNxIHNVx7FL7MFBapQiIPUUMYSADUjSYU557D
	xKsY7qt+RZ4Av+J8wYB/didu+LQ6mShwgj9xSoGAmhzaz5jk52yB4TcAHDTRBDvpBN4u
	jEBX3i9DSQ3YxGEhvdOQD1m+7DgqhdEViEoPU6UhXKKBosuCXZ6E2/nqLYHgWroDlNnM
	CZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=3fEXLCyWcIjJ3fCyhSJjaOG8MONCyh4KiFh6HIc5wFk=;
	b=Dka+8jXWLVxOTXQjpc19cNVkDNkeQHTtnWXoR0zAMN5vYtEZy/gNnFq9STQ0f4A1tT
	L7O3bbawBogVViJ3uiYn/nBtEZJ7atMLexUh7f7i4x7x1Bm7GgD+djIkhd4R64Rt5oiH
	BN0M7u8K3YIgid9xAfQQ7hkfy3pasqGbdCNUnF40NXzZ3rWYPLx/H0EomKWU4nn2SAC0
	BHiAw1bQyRLhnvsX8uuvwR7nf1ttaQljWUT9dP4c0dcfy1fFwcf5o6pedYvnNVEnrqeh
	qZQgtnnmkBmEeKDbQmPgjd2e51twATGUtT6lNt0kZGA7lQwOEiluWpOWpfnycXFZ7Qk4
	6CkA==
X-Gm-Message-State: AA6/9Rk+XwhoHK6ZHT79MsaVRHFpy0AHk2XJfMST6KencLPsc8UCc7+SRM+4Gh0zky/upg==
X-Received: by 10.66.188.80 with SMTP id fy16mr26938404pac.162.1476643104832; 
	Sun, 16 Oct 2016 11:38:24 -0700 (PDT)
Received: from ?IPv6:2600:1010:b026:70df:d54d:70d9:9262:3840?
	([2600:1010:b026:70df:d54d:70d9:9262:3840])
	by smtp.gmail.com with ESMTPSA id
	a9sm42142212pfa.38.2016.10.16.11.38.23
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 16 Oct 2016 11:38:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAAzKXnhZ86h2QNd8oVC-QrW726b9D8urV3JU7oQU3NGXR6EEWg@mail.gmail.com>
Date: Sun, 16 Oct 2016 11:38:22 -0700
Message-Id: <A2BBEB19-CD6D-4A3F-A740-9694FAC6D0A7@gmail.com>
References: <CAAzKXnhZ86h2QNd8oVC-QrW726b9D8urV3JU7oQU3NGXR6EEWg@mail.gmail.com>
To: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	Armin Kuster <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: libical build issue on krogoth
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
X-List-Received-Date: Sun, 16 Oct 2016 18:38:23 -0000
X-Groupsio-MsgNum: 88215
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7152D491-94B6-4817-9ECD-54C4334D0768";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7152D491-94B6-4817-9ECD-54C4334D0768
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_19B44D57-5266-4D6C-9726-1621ECDC5B41"

--Apple-Mail=_19B44D57-5266-4D6C-9726-1621ECDC5B41
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Zoltan

Ensure that you CC the release maintainers when sending back port =
requests

Armin ( krogoth maintainer ) CCed here

> On Oct 12, 2016, at 4:12 AM, Zoltan Kuscsik =
<zoltan.kuscsik@linaro.org> wrote:
>=20
> Hi,
>=20
> could you kindly merge the following fix from master to krogoth =
branch?
>=20
> 0445e68fdbbba5c4efb6422c89ee864e4273b114
>=20
> The issue mentioned in the commit message can be reproduced on
> krogoth builds  on armv8. The patch fixes the problem.
>=20
> Issue described in commit message:
>=20
> The libical build QA fails when libical is built for e.g. qemux86-64 =
already, and
> is then built for generic86-64 in a way that install is re-run:
>=20
> $ MACHINE=3Dqemux86-64 bitbake libical
> $ MACHINE=3Dgenericx86-64 bitbake -f -Cinstall libical
>=20
> ERROR: libical-2.0.0-r0 do_populate_sysroot: QA Issue: libical.pc =
failed
> sanity test (tmpdir) in path
>=20
> Br,
>=20
> Zoltan
>=20
> --
> Zoltan Kuscsik
>=20
> Senior Software Developer, Linaro Digital Home Group
> email: zoltan.kuscsik@linaro.org <mailto:zoltan.kuscsik@linaro.org>
> IRC: zoli_ on irc.linaro.org <http://irc.linaro.org/>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_19B44D57-5266-4D6C-9726-1621ECDC5B41
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">Zoltan</div><div class=3D""><br =
class=3D""></div><div class=3D"">Ensure that you CC the release =
maintainers when sending back port requests</div><div class=3D""><br =
class=3D""></div>Armin ( krogoth maintainer ) CCed here<div class=3D""><br=
 class=3D""><div><blockquote type=3D"cite" class=3D""><div class=3D"">On =
Oct 12, 2016, at 4:12 AM, Zoltan Kuscsik &lt;<a =
href=3D"mailto:zoltan.kuscsik@linaro.org" =
class=3D"">zoltan.kuscsik@linaro.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D"">Hi,<div class=3D""><div class=3D""><br class=3D""></div><div =
class=3D"">could you kindly merge the following fix from master to =
krogoth branch?</div><div class=3D""><br class=3D""></div><div =
class=3D""><span style=3D"color:rgb(51,51,51);font-family:&quot;helvetica =
neue&quot;,helvetica,arial,sans-serif;font-size:14px" =
class=3D"">0445e68fdbbba5c4efb6422c89ee864e4273b114</span><br =
class=3D""></div><div class=3D""><span =
style=3D"color:rgb(51,51,51);font-family:&quot;helvetica =
neue&quot;,helvetica,arial,sans-serif;font-size:14px" class=3D""><br =
class=3D""></span></div><div class=3D""><font color=3D"#333333" =
face=3D"helvetica neue, helvetica, arial, sans-serif" class=3D""><span =
style=3D"font-size:14px" class=3D"">The issue mentioned in the commit =
message can be reproduced on</span></font></div><div class=3D""><font =
color=3D"#333333" face=3D"helvetica neue, helvetica, arial, sans-serif" =
class=3D""><span style=3D"font-size:14px" class=3D"">krogoth builds =
&nbsp;on armv8. The patch fixes the problem.</span></font></div><div =
class=3D""><br class=3D""></div><div class=3D"">Issue described in =
commit message:</div><div class=3D""><br class=3D""></div><div =
class=3D"">The libical build QA fails when libical is built for e.g. =
qemux86-64 already, and</div><div class=3D"">is then built for =
generic86-64 in a way that install is re-run:</div><div class=3D""><br =
class=3D""></div><div class=3D"">$ MACHINE=3Dqemux86-64 bitbake =
libical</div><div class=3D"">$ MACHINE=3Dgenericx86-64 bitbake -f =
-Cinstall libical</div><div class=3D""><br class=3D""></div><div =
class=3D"">ERROR: libical-2.0.0-r0 do_populate_sysroot: QA Issue: =
libical.pc failed</div><div class=3D"">sanity test (tmpdir) in =
path</div><div class=3D""><br class=3D""></div></div><div =
class=3D"">Br,</div><div class=3D""><br class=3D""></div><div =
class=3D"">Zoltan<br clear=3D"all" class=3D""><div class=3D""><br =
class=3D""></div>-- <br class=3D""><div class=3D"gmail_signature"><div =
dir=3D"ltr" class=3D""><div style=3D"color:rgb(136,136,136)" =
class=3D"">Zoltan Kuscsik</div><div style=3D"color:rgb(136,136,136)" =
class=3D""><br class=3D""></div><div style=3D"color:rgb(136,136,136)" =
class=3D"">Senior Software Developer, Linaro Digital Home =
Group</div><div style=3D"color:rgb(136,136,136)" class=3D"">email: <a =
href=3D"mailto:zoltan.kuscsik@linaro.org" target=3D"_blank" =
class=3D"">zoltan.kuscsik@linaro.org</a></div><div =
style=3D"color:rgb(136,136,136)" class=3D""><span =
style=3D"font-size:12.8px" class=3D"">IRC: zoli_ on&nbsp;</span><a =
href=3D"http://irc.linaro.org/" =
style=3D"font-size:12.8px;color:rgb(17,85,204)" target=3D"_blank" =
class=3D"">irc.linaro.org</a><br class=3D""></div></div></div>
</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_19B44D57-5266-4D6C-9726-1621ECDC5B41--

--Apple-Mail=_7152D491-94B6-4817-9ECD-54C4334D0768
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgDyR4ACgkQuwUzVZGdMxRIQACcD7u+a2urXX/yD/vcYAjIThBO
POYAn3I9aZ1qjHpeZmOHZAtwgR1kel4c
=uIJj
-----END PGP SIGNATURE-----

--Apple-Mail=_7152D491-94B6-4817-9ECD-54C4334D0768--
