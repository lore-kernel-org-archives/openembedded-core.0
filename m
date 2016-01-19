Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 895FA6FF97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:16:57 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id q63so182183168pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 07:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=QWbxLuwzM4el5FNjstLbBBYI9U6F8ybSN1nbZcdDp6E=;
	b=hlfnSD9qFLeXVTvG7DiYLROyzjgNG5e7vYn5NHdGQ9KhofOQB7eUIMpzvMV9hPRWF2
	DUvYi/lxrqZNmwKArhG/thVC558BydJ42VX/oz+exUCmEDcY+ihNOb8LoojRxPSmD5ik
	0xJr3SmB1sLJi6rDSqdmU4zbRUGZ8MpujdkyFgU4yWxjGqmOfsizWlbnNpCHHbs3OFcU
	JfI9RsqrHlq6cs1gDFTvCDS2QfZSLhCD5Ha35QQD7GeQ99DGxq+DM1rDkAMXFXyvOu+0
	/FtDn7P4/50txHj71A9VCrF7kSOaNQGjYe9K60anTFm7B4dedhinzcG9Iwzy7/ywK2vk
	ZPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=QWbxLuwzM4el5FNjstLbBBYI9U6F8ybSN1nbZcdDp6E=;
	b=d7244Ip+wasJSa8Ccm6QF0txTvd1oLGnlWtqvHLZ5Gn43KdeE1KPORYYVEkrHFNZ0F
	RuX1SLAxWehZRS5accQx0vJZoH5Ggz804+ylSQvQwUaCtqX4WmRwtwGOjKio7Mwg1GPP
	4K+HzfnDOxjkoR5T7b5IZ9BZjV5DXEZPzpkRE61TcJXXIa3onFXnzu1iaQfZZmk4ydaJ
	xJR/BIzMfWiv1SkIEjrUAa/4bVHmvcvWUzsql+Jp169ewtNE6TICXwzjB1dxFLQGg1YK
	20ZiUqSLkJ+kMRyFdi1qPo5afd3A1ikQhhNgng5CtIsbTqKx3ryiV0PLQ5I5x1cAvror
	FXbQ==
X-Gm-Message-State: ALoCoQkaUvZE2kZgn7fbJPCjL9SxGbEUvotOQTXUznE9O/ziBY3ThHgevT+OkchNBsORA3Gpv2RSyWN2GSszR7iqQNTBVCjbpQ==
X-Received: by 10.98.1.203 with SMTP id 194mr45716329pfb.10.1453216618639;
	Tue, 19 Jan 2016 07:16:58 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:2cdb:35b7:1df4:399a?
	([2601:646:8802:5d5c:2cdb:35b7:1df4:399a])
	by smtp.gmail.com with ESMTPSA id
	k74sm42312100pfb.30.2016.01.19.07.16.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 07:16:57 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYyJGHLyrHd7eZ9KR9WfDknoWpgKQ5uHiFm8dhOwSJdQw@mail.gmail.com>
Date: Tue, 19 Jan 2016 07:16:52 -0800
Message-Id: <7E0F6C64-238D-4CD7-9EE3-FEE65CA41458@gmail.com>
References: <1453206311-26625-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LYyJGHLyrHd7eZ9KR9WfDknoWpgKQ5uHiFm8dhOwSJdQw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gcc-runtime.inc: provide libquadmath
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
X-List-Received-Date: Tue, 19 Jan 2016 15:16:58 -0000
X-Groupsio-MsgNum: 76399
Content-Type: multipart/signed;
	boundary="Apple-Mail=_99859CF4-7408-4EDB-80EB-A9B666E59437";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_99859CF4-7408-4EDB-80EB-A9B666E59437
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A252CC19-6C11-4823-B7E1-F1F69D1630C0"

--Apple-Mail=_A252CC19-6C11-4823-B7E1-F1F69D1630C0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 19, 2016, at 5:14 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 19 January 2016 at 12:25, Ioan-Adrian Ratiu <adrian.ratiu@ni.com =
<mailto:adrian.ratiu@ni.com>> wrote:
> +RUNTIMETARGET =3D "libssp libstdc++-v3 libgomp libatomic libquadmath"
>=20
> If libquadmath is only needed when fortran is enabled, shouldn't this =
respect the FORTRAN variable as well?  Or are there users beyond the =
fortran support?
>=20

There might be others e.g.  libfftw3, galculator, libfeel++, scilab etc. =
but they seem to be fortran apps.

> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_A252CC19-6C11-4823-B7E1-F1F69D1630C0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jan 19, 2016, at 5:14 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 19 January 2016 at 12:25, Ioan-Adrian Ratiu =
<span dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:adrian.ratiu@ni.com" =
target=3D"_blank" class=3D"">adrian.ratiu@ni.com</a>&gt;</span> =
wrote:<br class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ns" =
class=3D"a3s" style=3D"overflow:hidden">+RUNTIMETARGET =3D "libssp =
libstdc++-v3 libgomp libatomic libquadmath"<br =
class=3D""></div></blockquote></div><br class=3D"">If libquadmath is =
only needed when fortran is enabled, shouldn't this respect the FORTRAN =
variable as well?&nbsp; Or are there users beyond the fortran =
support?</div><div class=3D"gmail_extra"><br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>There might be others e.g. =
&nbsp;libfftw3,&nbsp;galculator,&nbsp;libfeel++,&nbsp;scilab etc. but =
they seem to be fortran apps.&nbsp;</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra">Ross</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_A252CC19-6C11-4823-B7E1-F1F69D1630C0--

--Apple-Mail=_99859CF4-7408-4EDB-80EB-A9B666E59437
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaeU2gACgkQuwUzVZGdMxRqTQCfXBSITyBnCwXuHemoTeu/xhN1
amIAn0nzXKQDw4cTbTDDSK+H2FAkzu0g
=bksc
-----END PGP SIGNATURE-----

--Apple-Mail=_99859CF4-7408-4EDB-80EB-A9B666E59437--
