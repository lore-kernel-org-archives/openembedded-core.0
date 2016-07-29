Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5E6C6607A4
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 19:05:28 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id h186so35067269pfg.3
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 12:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=iaNoEGaYW98cnHuB3OTZX14ot8Txg56c1VDSpARbNiY=;
	b=DXHL5tMoW6qIQH7gWgveLsZsSd8VZE8KW440h/LIYQmzwypvBmQVWRstW1hXXh81/9
	tcIYVcS44EGl2iaJ52BmNshECi5BfsXz9FNsAOjChqH+oBlicql2+AgJ9r+P1ZFbn7Zr
	Z+i2iBO53VAsu00txVKVFj1eL5fJpZNsLi7RupRsKjvnwduviDDPpjXSj1eh2+r6yoby
	wPkDnTuXkAi0OmffSHzKF6rLCWuQRcPBsNqBQ/Zu6Z3PGZ4LkHHeOnzguRDZ52bTaSct
	/kAkPFvSeMk4ZLe79MVY+sGXrHNchE7WpWDqJ/dv03oSo+9f7xI1f+RQ1PuYWnk2Rn8J
	frEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=iaNoEGaYW98cnHuB3OTZX14ot8Txg56c1VDSpARbNiY=;
	b=WauRPFyZY00sgvG/GmAaCK7G3gaRcl50Tg+mtjG1rDISIsEQnLjdcLq7k7XMAmC2o5
	/IUeCZttPf4k6+O6WOyvnGXcgWC8pNdbEYBsgbhjSyqdxdguDBY/amEPF8NehgaMQK2p
	lfMt6eDzuMpPimB0EtlBpvVIMzAmgpO52QnAWaBkbz8kaDFpYLfRd+gOSWftzDENI+zW
	bu18QXIoN8iN/wG6grqsfpPhpCLXpIlk38DVjI5ISWlNO8S7aSeQam82BWhZfEroczn7
	bMiqS1D0TorqmgFMTGwn9aJYPczOBCiyc8X0gb3kmqaYDvqPs/ztY/+Uk7tY7n1yyM7l
	9f3A==
X-Gm-Message-State: AEkoouuLNAZ+vi0Ls9VYkRpn8xSmfc9pV9moHssHZi+a4iQSeI88Ics+qDUm/wGtLik8wA==
X-Received: by 10.98.58.149 with SMTP id v21mr70653638pfj.19.1469819129842;
	Fri, 29 Jul 2016 12:05:29 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:99bc:2711:d44c:7b33?
	([2601:647:4c00:3edf:99bc:2711:d44c:7b33])
	by smtp.gmail.com with ESMTPSA id
	n80sm26846338pfi.19.2016.07.29.12.05.28
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jul 2016 12:05:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <BLUPR0201MB1553BE8DD545F0CC1F13E518F7010@BLUPR0201MB1553.namprd02.prod.outlook.com>
Date: Fri, 29 Jul 2016 12:05:24 -0700
Message-Id: <5CB73D98-DACC-4B43-9863-FF4BDBB6A97A@gmail.com>
References: <BLUPR0201MB1553BE8DD545F0CC1F13E518F7010@BLUPR0201MB1553.namprd02.prod.outlook.com>
To: Edson Seabra <Edson.Seabra@zpesystems.com>
X-Mailer: Apple Mail (2.3124)
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: metadata_scm - get branch/revision from svn repository
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
X-List-Received-Date: Fri, 29 Jul 2016 19:05:29 -0000
X-Groupsio-MsgNum: 85137
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3D342AD8-4495-40FF-BDE9-44597FEE6800";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3D342AD8-4495-40FF-BDE9-44597FEE6800
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_CFFF25E7-D7DE-4408-AB4F-DB0B54149CD5"

--Apple-Mail=_CFFF25E7-D7DE-4408-AB4F-DB0B54149CD5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

Hi Edson

> On Jul 29, 2016, at 11:09 AM, Edson Seabra =
<Edson.Seabra@zpesystems.com> wrote:
>=20
> Hi,
>=20
> With this patch bitbake commands can display the branch/revision of =
layers under svn control.
>=20

Can you submit the patch following the patch submitting guidelines

http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded =
<http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded>

--Apple-Mail=_CFFF25E7-D7DE-4408-AB4F-DB0B54149CD5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Hi Edson<div class=3D""><br class=3D""><div><blockquote =
type=3D"cite" class=3D""><div class=3D"">On Jul 29, 2016, at 11:09 AM, =
Edson Seabra &lt;<a href=3D"mailto:Edson.Seabra@zpesystems.com" =
class=3D"">Edson.Seabra@zpesystems.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
id=3D"divtagdefaultwrapper" style=3D"font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; font-size: 12pt; background-color: =
rgb(255, 255, 255); font-family: Calibri, Arial, Helvetica, sans-serif;" =
class=3D""><div style=3D"margin-top: 0px; margin-bottom: 0px;" =
class=3D"">Hi,</div><div style=3D"margin-top: 0px; margin-bottom: 0px;" =
class=3D""><br class=3D""></div><div style=3D"margin-top: 0px; =
margin-bottom: 0px;" class=3D"">With this patch bitbake commands can =
display the branch/revision of layers under svn control.</div><div =
style=3D"margin-top: 0px; margin-bottom: 0px;" class=3D""><br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>Can you submit the patch following the patch =
submitting guidelines&nbsp;</div><div><br class=3D""></div><div><a =
href=3D"http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbe=
dded" =
class=3D"">http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenE=
mbedded</a></div></div><br class=3D""></div></body></html>=

--Apple-Mail=_CFFF25E7-D7DE-4408-AB4F-DB0B54149CD5--

--Apple-Mail=_3D342AD8-4495-40FF-BDE9-44597FEE6800
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlebqPgACgkQuwUzVZGdMxQjsACgizoai5uK3pntQ/lw1BTX6bHD
GMkAniEErQW/U6UopBDHS9uAsYSad7US
=9LgM
-----END PGP SIGNATURE-----

--Apple-Mail=_3D342AD8-4495-40FF-BDE9-44597FEE6800--
