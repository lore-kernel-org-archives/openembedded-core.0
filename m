Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id EA8E27708E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 21:40:27 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id ik10so44056813igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 13:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=KdLthPFyj1lbdTro5Xj7UVkYZOQVqB/0AkGzs9TpzF8=;
	b=Q7f3EXWrDuDw5KbLG1M7aiujhwrNpLgsx/APUaYldDfCsiTjlZHK0ZmNRkLu8wRzRQ
	4l5ljgNq5rmt/29UbDqvoNexSXETj3Y9ylrlsxDg24kfWeZFcrENOtIZQSzt31b4g5Fu
	BDZCBR8TS/N4J9pHpM8LVJcsudRS1kYp4okdq1HaC4HBTDNtxbUO9aMJOmrHmf/vjxYR
	+664k3wUmjBBKQ0kV3pVnDgchpFPB5vlY8jzxWwP4YDW1J7VAifDwPb9pzV/NVvdbLC8
	DNboKjRLWCsXVnpYczGr/KwuQQqROHVAONH6mgTE1HM4yEbt3XUKUfMYuKTa57Ipc7xh
	Vv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=KdLthPFyj1lbdTro5Xj7UVkYZOQVqB/0AkGzs9TpzF8=;
	b=CQ8MfOn3h+mHavv2i3gFOyAFHGiMyIPc2UXYqVc5Y0+h7AeSoKQWXxBYKV6Fz3tE7C
	86ZkO9UaULBq5sfjbUS7NUU3/0NpNydQY85l3L709FwFXqytKRSDCB4+W54fOCPps+eH
	5TMUkn3hRfL/4J4ixw/XB6U6XX8VsnrKUsPB4h6oeKuFUfnoCPKO61CueiJCesnYvhuX
	ElYPXRkLO0IvEAOsTayIQJA3HYekO3ns/K7KlCO0ON46vH771xiimQft/az86CHgOF1k
	baIvdpuw3qDucv2jyPR20r2cy4WeAvibDv7kSzfjQzp35qDrlNbVJF0vUICBqfpy1UiK
	vaCA==
X-Gm-Message-State: AG10YOQy6TjSLg4rZfXmkdpmfmq4+mRUDaVhDpmyG6myj4i9LPGnl62CWtU22gVSBgz5Aw==
X-Received: by 10.50.20.197 with SMTP id p5mr20348240ige.89.1453758027961;
	Mon, 25 Jan 2016 13:40:27 -0800 (PST)
Received: from [172.19.131.113] ([12.130.117.66])
	by smtp.gmail.com with ESMTPSA id s5sm3567360igg.1.2016.01.25.13.40.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jan 2016 13:40:27 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LbYbUcN6j1Otc+-MeQMOxSM9tmmNfY9-tuQDQg=9yDyOA@mail.gmail.com>
Date: Mon, 25 Jan 2016 13:40:16 -0800
Message-Id: <B40E1E4A-5880-49D4-84E1-EA8DE07FE2C8@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
	<c8b6c58c6a42381f980b7f5eb388323ffd83836b.1453746280.git.raj.khem@gmail.com>
	<CAJTo0LZwr6drjDYg=DcPaR8iVhoP8uwuQ6=6v0ftc5xd5kKj1g@mail.gmail.com>
	<2F7C10D7-0CBB-45F3-B1E1-C9170BD7845E@gmail.com>
	<CAJTo0LbYbUcN6j1Otc+-MeQMOxSM9tmmNfY9-tuQDQg=9yDyOA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/11] grub: Backport fix for largefile detection/use
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
X-List-Received-Date: Mon, 25 Jan 2016 21:40:28 -0000
X-Groupsio-MsgNum: 76874
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BCF852AE-3F10-4BC0-8A4D-B35D2E813E37";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BCF852AE-3F10-4BC0-8A4D-B35D2E813E37
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_1974A3E3-4F7F-4784-8E92-ED9F9634651B"

--Apple-Mail=_1974A3E3-4F7F-4784-8E92-ED9F9634651B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 25, 2016, at 1:35 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 25 January 2016 at 21:33, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> Remember my other email about how we cache sizeof_off_t to =
openemebedded-architecture  ?
> this to insulate against that change. Because by caching that variable =
in our site files we defeat AC_CHECK_SIZEOF macro.
>=20
> Let's remove it from the site files then?

I will. we need to do it carefully and ensure that it doesnt regress us. =
These patches here however will work either way
when we have removed the caching we can unbolt them if we want to.

>=20
> Ross


--Apple-Mail=_1974A3E3-4F7F-4784-8E92-ED9F9634651B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jan 25, 2016, at 1:35 PM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 25 January 2016 at 21:33, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"">Remember=
 my other email about how we cache sizeof_off_t to =
openemebedded-architecture &nbsp;?</div><div class=3D"">this to insulate =
against that change. Because by caching that variable in our site files =
we defeat AC_CHECK_SIZEOF macro.</div></blockquote></div><br =
class=3D"">Let's remove it from the site files =
then?</div></div></div></blockquote><div><br class=3D""></div><div>I =
will. we need to do it carefully and ensure that it doesnt regress us. =
These patches here however will work either way</div><div>when we have =
removed the caching we can unbolt them if we want to.</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><br =
class=3D""></div><div class=3D"gmail_extra">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_1974A3E3-4F7F-4784-8E92-ED9F9634651B--

--Apple-Mail=_BCF852AE-3F10-4BC0-8A4D-B35D2E813E37
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlamlkQACgkQuwUzVZGdMxTSPQCeJ7gdaVqxGYCkThCgjVhsFlGc
ZFwAoIyhYccWlVn4gzQPz0+H05id+yXV
=llSp
-----END PGP SIGNATURE-----

--Apple-Mail=_BCF852AE-3F10-4BC0-8A4D-B35D2E813E37--
