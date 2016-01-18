Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id EEAEE6612D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 21:29:54 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id cy9so439645077pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 13:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=hVruwTaoN/1dxCJtAnPr4o+3FNLk1tAszHkJ+bMHbAw=;
	b=EPpcexucNPYSA1HLnOkTIPaW/Y8+3JGJTf81QkR443GZWqD4FxR45tNj2PS/RaVuVe
	JCq97QH26nPtP3R93YjwsGnIK36pVdEmpMDNhWi07HHQgLmgU/yRg8S1H0dX7xUgwcQL
	qZrgRqu3KQOTvcfIwk0y7lICcMsWpctTTCAE+LZYOI8kPs1pEdlw48oqBuNgcxrK8Yos
	tn/im4ehGkdPWb6PKH+Wc+6sHGWvtOUfgqB+4OllLbxSn8bdk7uCwyT3Hq6K30pCxaok
	2cy+5im/V0ofyNiZp/QH/RCeWcsWzdGU2J+E+jL8C4aSPrPoNOXEG11t8iLtFJApHJXL
	BQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=hVruwTaoN/1dxCJtAnPr4o+3FNLk1tAszHkJ+bMHbAw=;
	b=aIZpnNMnSCqu4tOZhNa9tL3cR2oeLw4SAEHFRpMgzZSAM4ekQT+640YMCRnwW1agzb
	hXk21TNGYR/LCzlUerPud7vF+uUzNXE/htrZTexr6Z95SNzCnfb4DoMq3Ag7vt4ctFjV
	y7gIY2HGbk8EQjBb2oGc18Kb5lxYxEUmhpDmxqDhSfrkc5BRzYxByBEPd4gIhnKz6Np9
	t0w4yd9RdP6QwlsGi9v0voi0vSFoyZVC8SH6LcmFWqko9b8LqL3wfD7wIySidkIEEbMj
	1lkMIRntmGsoNudHE1chet1mqiEU+82MTkAfVLk1XSjgiKngENEYtEjCJt6RUx3yVMN5
	dfRA==
X-Gm-Message-State: ALoCoQkQ1nr0ldXTify7Pr2vko9DpQPjUTSBwbct2m464FXte9r9mk7eS5MgRlSe3lkTeVPaw1+26yiG157yqbRvbHTzCzW6hg==
X-Received: by 10.66.148.167 with SMTP id tt7mr40103728pab.62.1453152595449;
	Mon, 18 Jan 2016 13:29:55 -0800 (PST)
Received: from [192.168.0.4] (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	v26sm36110419pfi.56.2016.01.18.13.29.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jan 2016 13:29:54 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LY_hqMjgrTX6-RJTvcMabdoA7vE-M54H2fDCXJoz8-1Sw@mail.gmail.com>
Date: Mon, 18 Jan 2016 13:29:50 -0800
Message-Id: <F10F7277-153E-4141-8860-E43F4580C582@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
	<ae92e4f1b2b1ce46e943903798d96a7b39a1fc85.1453029952.git.raj.khem@gmail.com>
	<CAJTo0LY_hqMjgrTX6-RJTvcMabdoA7vE-M54H2fDCXJoz8-1Sw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 22/73] libdrm: Upgrade 2.4.65 -> 2.4.66
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
X-List-Received-Date: Mon, 18 Jan 2016 21:29:57 -0000
X-Groupsio-MsgNum: 76356
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6EE3AA8C-EF66-49C4-92F9-71D9BE4BC4A3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6EE3AA8C-EF66-49C4-92F9-71D9BE4BC4A3
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_0B56ED3B-7AB3-420B-8ABF-901D93615FEC"

--Apple-Mail=_0B56ED3B-7AB3-420B-8ABF-901D93615FEC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Ross

> On Jan 18, 2016, at 7:40 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 17 January 2016 at 11:35, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> Fix test build failures
>=20
> packages/corei7-64-poky-linux/libdrm/libdrm: PKG changed from libdrm2 =
to libdrm [default] - may indicate debian renaming failure
> packages/corei7-64-poky-linux/libdrm/libdrm: PKGSIZE changed from =
56367 to 176551 (+213%)
>   * PV changed from "2.4.65" to "2.4.66"
>   * FILELIST: added "/usr/bin/random /usr/bin/getversion =
/usr/bin/updatedraw /usr/bin/setversion /usr/bin/name_from_fd =
/usr/bin/getstats /usr/bin/hash /usr/bin/openclose =
/usr/bin/kms-universal-planes /usr/bin/kms-steal-crtc =
/usr/bin/getclient"
>=20
> Please remember to run buildhistory-diff :)

I think we have a bit relaxed QA checks for nodistro in OE-Core, may be =
we should tighten it up to make it similar to poky. I will locally add =
them in my site.conf


>=20
> This is a simple matter of more binaries being added and =
overly-restricted FILES matches, I've fixed locally.
>=20

thanks for the help


--Apple-Mail=_0B56ED3B-7AB3-420B-8ABF-901D93615FEC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Hi Ross<div class=3D""><br class=3D""><div><blockquote =
type=3D"cite" class=3D""><div class=3D"">On Jan 18, 2016, at 7:40 AM, =
Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 17 January 2016 at 11:35, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D":7i5" class=3D"" =
style=3D"overflow:hidden">Fix test build failures<br =
class=3D""></div></blockquote></div><br class=3D""><div =
class=3D"gmail_extra">packages/corei7-64-poky-linux/libdrm/libdrm: PKG =
changed from libdrm2 to libdrm [default] - may indicate debian renaming =
failure</div><div =
class=3D"gmail_extra">packages/corei7-64-poky-linux/libdrm/libdrm: =
PKGSIZE changed from 56367 to 176551 (+213%)<br class=3D""></div><div =
class=3D"gmail_extra">&nbsp; * PV changed from "2.4.65" to =
"2.4.66"</div><div class=3D"gmail_extra">&nbsp; * FILELIST: added =
"/usr/bin/random /usr/bin/getversion /usr/bin/updatedraw =
/usr/bin/setversion /usr/bin/name_from_fd /usr/bin/getstats =
/usr/bin/hash /usr/bin/openclose /usr/bin/kms-universal-planes =
/usr/bin/kms-steal-crtc /usr/bin/getclient"</div><div =
class=3D"gmail_extra"><br class=3D""></div><div =
class=3D"gmail_extra">Please remember to run buildhistory-diff =
:)</div></div></div></div></blockquote><div><br class=3D""></div><div>I =
think we have a bit relaxed QA checks for nodistro in OE-Core, may be we =
should tighten it up to make it similar to poky. I will locally add them =
in my site.conf</div><div><br class=3D""></div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_extra"><br class=3D""></div><div=
 class=3D"gmail_extra">This is a simple matter of more binaries being =
added and overly-restricted FILES matches, I've fixed locally.</div><div =
class=3D"gmail_extra"><br =
class=3D""></div></div></div></div></blockquote><div><br =
class=3D""></div><div>thanks for the help</div><div><br =
class=3D""></div></div></div></body></html>=

--Apple-Mail=_0B56ED3B-7AB3-420B-8ABF-901D93615FEC--

--Apple-Mail=_6EE3AA8C-EF66-49C4-92F9-71D9BE4BC4A3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAladWVEACgkQuwUzVZGdMxSkPQCeL5DeEArFxrrWtakZwsa4zvH6
mU8An3w7j8Fb+8IKMc6bZI1wZCoobSzW
=/aTD
-----END PGP SIGNATURE-----

--Apple-Mail=_6EE3AA8C-EF66-49C4-92F9-71D9BE4BC4A3--
