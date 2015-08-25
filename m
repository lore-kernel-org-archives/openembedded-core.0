Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6888765CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 19:06:20 +0000 (UTC)
Received: by pacgr6 with SMTP id gr6so2346530pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 12:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=YWmCCK2O9QkEDVs+LBxMrf+5a4MAAudNP0xbWsRfpzI=;
	b=rIV5eimChwTcgSk46x9kGZZOAVWqlyP28Rx5C/CxdmiHLGqjpfXfl6qWn7TKunegGF
	IusJ4qocKdxVq1JncOjIBKB4flFXEOfVcF9EXi4IJMVN7UMVUqEw3L9a/58yD7Pi2J8+
	rx79jVkeKTMEBI/vtkQIDWXGc8PK066G0zwA42qm+5N777ZZzKh9w/IisE5YEDw3IK6g
	TmMa/SsI62KUPR7EVKlxqreWKnu2uzyFuzppzRcuwp0dYdB5FdQEVkuPYr1xMN04coID
	jk4Vcl++nnLElpTKRCoFtH3+YaxO+BGkvTjA6LD8eYzyzvQD4H3FL06YX2SFYyfqWJJE
	jHpA==
X-Received: by 10.68.116.109 with SMTP id jv13mr58711632pbb.137.1440529580836; 
	Tue, 25 Aug 2015 12:06:20 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:316a:3272:24e7:4679?
	([2601:646:8601:4580:316a:3272:24e7:4679])
	by smtp.gmail.com with ESMTPSA id
	fw15sm21946039pdb.26.2015.08.25.12.06.19
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Aug 2015 12:06:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZLhzWSo-vN79hKbOdZ-N7U+zD_wECtXCAGgN5y56=Y2A@mail.gmail.com>
Date: Tue, 25 Aug 2015 12:06:15 -0700
Message-Id: <03BBEAE9-4C5F-429A-85EC-D4F630E4F65E@gmail.com>
References: <cover.1440446289.git.raj.khem@gmail.com>
	<9bf77291c7084cfdef86008d204932e7adb1067a.1440446290.git.raj.khem@gmail.com>
	<CAJTo0LZLhzWSo-vN79hKbOdZ-N7U+zD_wECtXCAGgN5y56=Y2A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/17] python-distribute, python-setuptools: Migrate to good old python-setuptools
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
X-List-Received-Date: Tue, 25 Aug 2015 19:06:23 -0000
X-Groupsio-MsgNum: 70028
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D568C9E2-1D04-4800-80C2-7376EAED6D0F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D568C9E2-1D04-4800-80C2-7376EAED6D0F
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_FE3207D5-96F2-463F-A2CC-4A60CAB6197C"

--Apple-Mail=_FE3207D5-96F2-463F-A2CC-4A60CAB6197C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 25, 2015, at 9:26 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> On 24 August 2015 at 21:03, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> setuptools the old king is ruling again, distribute fork has been =
merged
> into setuptools starting 0.7x, so lets move to use it as well
>=20
> This fails dramatically on the autobuilder with the core error being:
>=20
> ERROR: Nothing PROVIDES 'python-setuptools-native' (but =
virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-a=
rm64/build/meta/recipes-devtools/python/python-git_1.0.1.bb =
<http://python-git_1.0.1.bb/> DEPENDS on or otherwise requires it). =
Close matches:
>   python3-setuptools-native
>   python3-setuptools
>   python-scons-native
>=20

sdks build shows this probably. Pull out those two setuptools related =
commits for now.

> Ross


--Apple-Mail=_FE3207D5-96F2-463F-A2CC-4A60CAB6197C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 25, 2015, at 9:26 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra">On 24 August 2015 at 21:03, Khem =
Raj <span dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br class=3D""><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><span class=3D"">setuptools</span> the =
old king is ruling again, distribute fork has been merged<br class=3D"">
into <span class=3D"">setuptools</span> starting 0.7x, so lets move to =
use it as well<br class=3D""></blockquote></div><div =
class=3D"gmail_extra"><br class=3D""></div>This fails dramatically on =
the autobuilder with the core error being:</div><div =
class=3D"gmail_extra"><br class=3D"">ERROR: Nothing PROVIDES =
'python-setuptools-native' (but =
virtual:nativesdk:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-a=
rm64/build/meta/recipes-devtools/python/<a =
href=3D"http://python-git_1.0.1.bb/" class=3D"">python-git_1.0.1.bb</a> =
DEPENDS on or otherwise requires it). Close matches:<br class=3D"">&nbsp; =
python3-setuptools-native<br class=3D"">&nbsp; python3-setuptools<br =
class=3D"">&nbsp; python-scons-native<br class=3D""></div><div =
class=3D"gmail_extra"><br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>sdks build shows this probably. Pull out those two =
setuptools related commits for now.</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_FE3207D5-96F2-463F-A2CC-4A60CAB6197C--

--Apple-Mail=_D568C9E2-1D04-4800-80C2-7376EAED6D0F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXcvKoACgkQuwUzVZGdMxTfiACeK9MMmk6QEElNpEkN8vNG+WI0
ScsAn3JPUP+1zH2UrIK0qjEbU37HoLKc
=BjgU
-----END PGP SIGNATURE-----

--Apple-Mail=_D568C9E2-1D04-4800-80C2-7376EAED6D0F--
