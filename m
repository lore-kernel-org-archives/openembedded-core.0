Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id B38A060723
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 00:06:00 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so71508855pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 16:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=GwLihcW8qRReHSxno6mmEq7GRwuu3JuJX/jeBPV6qbI=;
	b=PIpI5RVp/MWuT0QpoL/lrnDD02s9IjTcGY7v8VLdBBPahJrXjVNXYj5Ha786cfi283
	mXPM8i+sg/BNvyNta6CJ8Q0bMwL6T7thKq8qW6htSr78I5U978GTHPzxqVNsP59CtWpu
	GfOHMh9PBkRbO9AISLJ7Yf1xvKGprvQl5FhfejPwHXZD3GDM1gmOEeI/upF+Xjxq9/fT
	neYGYDrPC3gIUb7D685jWj9UDJ+VAeXJ8qaSUjvWmYQ7LtToVgwEaZvNtqOtt5nb3V/a
	XuYk/DRjCzG0egM6fX7YpNoF8Hgmj2Iaxbtyxmx9Y4GDJ3ZOtKuD1sqLJbKeP65W/AV6
	BZWQ==
X-Received: by 10.66.249.37 with SMTP id yr5mr55211558pac.24.1448496360794;
	Wed, 25 Nov 2015 16:06:00 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:3d83:32e6:2c71:fee0?
	([2601:646:8802:5d5c:3d83:32e6:2c71:fee0])
	by smtp.gmail.com with ESMTPSA id
	eg5sm23652404pac.30.2015.11.25.16.05.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Nov 2015 16:05:58 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LbLQ51w5+MDkXKyFvDzzz=8UFjDi-s=JyHy2WoFFx2y2Q@mail.gmail.com>
Date: Wed, 25 Nov 2015 16:05:50 -0800
Message-Id: <AB05D454-7DF8-45A1-9222-AC42E74CAD2A@gmail.com>
References: <CAJ86T=VBh-TsnaSyNVSxmbEJz7TbFcDmNBVP4_4PhXB=YMrm5w@mail.gmail.com>
	<CAMKF1spXxarTUskBgB6ABdL-yn4wSm1cOZSBKdCpyxQzDg_a8g@mail.gmail.com>
	<CAJ86T=X_r_OU1RfN8nYJAJSYXwqEgvK17Hn87_+AfoGQAn2ocw@mail.gmail.com>
	<CAJTo0LbLQ51w5+MDkXKyFvDzzz=8UFjDi-s=JyHy2WoFFx2y2Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: vmdk images with musl libc
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
X-List-Received-Date: Thu, 26 Nov 2015 00:06:00 -0000
X-Groupsio-MsgNum: 73981
Content-Type: multipart/signed;
	boundary="Apple-Mail=_180022D7-C760-4314-8DE2-79A140F5F36E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_180022D7-C760-4314-8DE2-79A140F5F36E
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_7B214A99-2269-49F0-B94F-B5A7FDD0481A"

--Apple-Mail=_7B214A99-2269-49F0-B94F-B5A7FDD0481A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Nov 25, 2015, at 1:56 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 25 November 2015 at 21:40, Andre McCurdy <armccurdy@gmail.com =
<mailto:armccurdy@gmail.com>> wrote:
> So would it be correct to add exactly those lines to the oe-core =
mtools recipe?
>=20
> Yes.  Pretty much every dependency on glibc-gconv* should be guarded =
with a libc override of some sort.  There's an open bug to give locale =
packages virtual names so this isn't a problem anymore, I should do =
something about it!
>=20


I have already posted this as a patch along with my musl patchset for =
OE-Core ( which I need to send v2 addressing Phil=E2=80=99s feedback on =
the series )
here is particular patch
=
https://github.com/kraj/openembedded-core/commit/11c054232722c6a96fd54f40f=
664da4a754fd342 =
<https://github.com/kraj/openembedded-core/commit/11c054232722c6a96fd54f40=
f664da4a754fd342>
> Ross


--Apple-Mail=_7B214A99-2269-49F0-B94F-B5A7FDD0481A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Nov 25, 2015, at 1:56 PM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 25 November 2015 at 21:40, Andre McCurdy <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:armccurdy@gmail.com" =
target=3D"_blank" class=3D"">armccurdy@gmail.com</a>&gt;</span> =
wrote:<br class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":bhm" =
class=3D"a3s" style=3D"overflow:hidden">So would it be correct to add =
exactly those lines to the oe-core mtools recipe?<br =
class=3D""></div></blockquote></div><br class=3D"">Yes.&nbsp; Pretty =
much every dependency on glibc-gconv* should be guarded with a libc =
override of some sort.&nbsp; There's an open bug to give locale packages =
virtual names so this isn't a problem anymore, I should do something =
about it!</div><div class=3D"gmail_extra"><br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div><br class=3D""></div><div>I have already posted =
this as a patch along with my musl patchset for OE-Core ( which I need =
to send v2 addressing Phil=E2=80=99s feedback on the series =
)</div><div>here is particular patch</div><div><a =
href=3D"https://github.com/kraj/openembedded-core/commit/11c054232722c6a96=
fd54f40f664da4a754fd342" =
class=3D"">https://github.com/kraj/openembedded-core/commit/11c054232722c6=
a96fd54f40f664da4a754fd342</a></div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_7B214A99-2269-49F0-B94F-B5A7FDD0481A--

--Apple-Mail=_180022D7-C760-4314-8DE2-79A140F5F36E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZWTOYACgkQuwUzVZGdMxRD+wCgjbbgwyX2XyMXQFffn63PusxB
db8AoIXcigR5IbA7E/VQLf2nEQpAq1tn
=M6MN
-----END PGP SIGNATURE-----

--Apple-Mail=_180022D7-C760-4314-8DE2-79A140F5F36E--
