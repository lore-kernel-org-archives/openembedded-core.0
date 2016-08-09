Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4EC7720E;
	Tue,  9 Aug 2016 14:41:36 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id ti13so6076209pac.0;
	Tue, 09 Aug 2016 07:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=TLsJC3pAdesMRpCH0XBow2tJt4ByA02EnY1KpwOXhKA=;
	b=g9q7gVgrgZ/jc2RN6G0WDZ6HyYvtern3G2W0S7IwK/ZEl5PhBVfctjgL2pojjQJyfY
	P+2BnsKLFsk4oz7V+bW+HnKwDTjdAbuA19k0cvCd/umn2+wQUdsiL5/18uwlnmIPnnGk
	4t9RDiKDdm75nzwGOuyyCt0F7WiAwoeNIVGoF2NBhwvAEOT3joN6CVoAHOdqA1Og8Yw5
	Sp1qZ/9OBA7IKthghVP7CoudXI2Kfw0PJEa4JC/FtZ1fmF70oTQiiD+q3a8P1Q8SLhrj
	91GuBUyavntCBwKWhmeliBMMTwNIZM2MagJxYzHSyvs+GEx9la3M80sCYYwXFyiqCMpj
	hmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=TLsJC3pAdesMRpCH0XBow2tJt4ByA02EnY1KpwOXhKA=;
	b=Q1MjSHWHZ8aWuMlnrZYEaakiQvRJ5Eg1eoFLYCPq+QUtJu+KSuAehdpZZBovYeM3zx
	23JkhueuQA1Tn7Zksv0R1FDk2UEkvP25C1LMs/1hzsa7aevG4D3xwLCSDkwUjJYZr1Dq
	E7ZMQNMWJv3c0pY63+lftABbDgzVTMEsp+AxDKq1CIenwuAkToZw6AHptfw18ur798C+
	ucQXSl1lvqZPkMgdT8KwPy0C8YzGx0DTcSAr08UxytxEd+NWn/AiSewzRapQh+BxVWp4
	h1BG5OfX0Xiv4R6cEw7Wp+SdIrFouxurAHhjWVBHOM/+WsOuXbS5mj0/iYDxqopnjxj0
	0DTQ==
X-Gm-Message-State: AEkooutSEO+vTvD9dCrWvWKUJ913wbwbsQHGGbzr4LK/fo7tZdAIAl9FWYuJNHvEX14zQA==
X-Received: by 10.66.164.70 with SMTP id yo6mr70129104pab.47.1470753697159;
	Tue, 09 Aug 2016 07:41:37 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:29dc:cb12:3198:ca66?
	([2601:646:8882:b8c:29dc:cb12:3198:ca66])
	by smtp.gmail.com with ESMTPSA id
	p64sm56665896pfd.11.2016.08.09.07.41.35
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 07:41:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LY-MVSANSLRBzBGTL2ZJ=Ga=Xijps6jwAGosLK3aE4QLg@mail.gmail.com>
Date: Tue, 9 Aug 2016 07:42:10 -0700
Message-Id: <DC67B803-475F-4992-8DFD-B8F5FA7B1D15@gmail.com>
References: <CC61EFE1-5F39-4848-AD71-8E9C8DEC43C8@gmail.com>
	<1470637705.8166.29.camel@linuxfoundation.org>
	<8C207C42-3D61-4C3F-A1DE-F305AA6617BA@gmail.com>
	<1470644094.8166.37.camel@linuxfoundation.org>
	<1470646210.8166.38.camel@rpsys.net>
	<1470647765.4581.23.camel@andred.net>
	<ACB9AEF7-A7DF-4A88-9762-7569D91AD12D@gmail.com>
	<1470671991.8166.44.camel@linuxfoundation.org>
	<CAJTo0LY-MVSANSLRBzBGTL2ZJ=Ga=Xijps6jwAGosLK3aE4QLg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Yocto Discussion Mailing List <yocto@yoctoproject.org>
Subject: Re: [RFT] binutils 2.27
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
X-List-Received-Date: Tue, 09 Aug 2016 14:41:37 -0000
X-Groupsio-MsgNum: 85568
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4F342F10-D6A3-474D-B1AE-D40F130716F6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4F342F10-D6A3-474D-B1AE-D40F130716F6
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_92320D99-40F6-410B-BFB8-4A26B349BADF"

--Apple-Mail=_92320D99-40F6-410B-BFB8-4A26B349BADF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 8, 2016, at 4:16 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 8 August 2016 at 16:59, Richard Purdie =
<richard.purdie@linuxfoundation.org =
<mailto:richard.purdie@linuxfoundation.org>> wrote:
> FWIW, I think the connmand segfault on mips and powerpc is hinted at
> with this bug:
>=20
> https://bugs.launchpad.net/ubuntu/+source/lua5.3/+bug/1570055 =
<https://bugs.launchpad.net/ubuntu/+source/lua5.3/+bug/1570055>
>=20
> connmand is a binary linked with a linker version-script. If I build
> connmand without that option, it doesn't segfault, at least on mips.
>=20
> The binutils manuals say you shouldn't build binaries with version
> scripts:
>=20
> http://ftp.gnu.org/old-gnu/Manuals/ld-2.9.1/html_node/ld_25.html =
<http://ftp.gnu.org/old-gnu/Manuals/ld-2.9.1/html_node/ld_25.html>
>=20
> Its suspected connman might do this to limit the function exposure to
> its plugins.
>=20
> Now sure exactly what needs to happen here without more research but =
it
> certainly hits at where the problem is. I suspect its the same issue =
on
> ppc.
>=20
> I've verified that with binutils 2.26 on x86-64, a minimal test case =
for an executable using a version script to limit exported symbols to =
dlopen()d modules does in fact work.  A toolchain is building now to see =
what happens in different environments.

I could also see it on ppc. backtrace, shows the segfault is in exit =
path and happens in libc
at this point, I think the problem is how libc is compiled with binutils =
2.27, connman itself
is ok.

>=20
> Ross


--Apple-Mail=_92320D99-40F6-410B-BFB8-4A26B349BADF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 8, 2016, at 4:16 PM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 8 August 2016 at 16:59, Richard Purdie <span =
dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank" =
class=3D"">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":37i" =
class=3D"a3s aXjCH m1566ae22eb3a0c11">FWIW, I think the connmand =
segfault on mips and powerpc is hinted at<br class=3D"">
with this bug:<br class=3D"">
<br class=3D"">
<a href=3D"https://bugs.launchpad.net/ubuntu/+source/lua5.3/+bug/1570055" =
rel=3D"noreferrer" target=3D"_blank" =
class=3D"">https://bugs.launchpad.net/<wbr =
class=3D"">ubuntu/+source/lua5.3/+bug/<wbr class=3D"">1570055</a><br =
class=3D"">
<br class=3D"">
connmand is a binary linked with a linker version-script. If I build<br =
class=3D"">
connmand without that option, it doesn't segfault, at least on mips.<br =
class=3D"">
<br class=3D"">
The binutils manuals say you shouldn't build binaries with version<br =
class=3D"">
scripts:<br class=3D"">
<br class=3D"">
<a =
href=3D"http://ftp.gnu.org/old-gnu/Manuals/ld-2.9.1/html_node/ld_25.html" =
rel=3D"noreferrer" target=3D"_blank" =
class=3D"">http://ftp.gnu.org/old-gnu/<wbr =
class=3D"">Manuals/ld-2.9.1/html_node/ld_<wbr class=3D"">25.html</a><br =
class=3D"">
<br class=3D"">
Its suspected connman might do this to limit the function exposure to<br =
class=3D"">
its plugins.<br class=3D"">
<br class=3D"">
Now sure exactly what needs to happen here without more research but =
it<br class=3D"">
certainly hits at where the problem is. I suspect its the same issue =
on<br class=3D"">
ppc.</div></blockquote></div><br class=3D"">I've verified that with =
binutils 2.26 on x86-64, a minimal test case for an executable using a =
version script to limit exported symbols to dlopen()d modules does in =
fact work.&nbsp; A toolchain is building now to see what happens in =
different environments.</div></div></div></blockquote><div><br =
class=3D""></div><div>I could also see it on ppc. backtrace, shows the =
segfault is in exit path and happens in libc</div><div>at this point, I =
think the problem is how libc is compiled with binutils 2.27, connman =
itself</div><div>is ok.&nbsp;</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><br class=3D""></div><div =
class=3D"gmail_extra">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_92320D99-40F6-410B-BFB8-4A26B349BADF--

--Apple-Mail=_4F342F10-D6A3-474D-B1AE-D40F130716F6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlep68YACgkQuwUzVZGdMxRbGACbBFTHTJjM6FUXx74dA5CqqLcw
BWgAn32xx8eY09ajbzeY/DwiX60N2SZV
=PtDM
-----END PGP SIGNATURE-----

--Apple-Mail=_4F342F10-D6A3-474D-B1AE-D40F130716F6--
