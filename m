Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id C1C6F79663
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 18:10:11 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id u12-v6so22891983wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 11:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=JRD251LewmKN30xwchzhXWMivx96D5Y7ch0CDrQ6nuQ=;
	b=QOqezV6uYengnYyu8/IhcmJPduOsKozgz8t7VzTIypCuvvNBtqvsX8yjYEtgxaT4ao
	CEbjezQMWI4etgdcTCykkA6q/ajT7cIc4xQdUISmcXG5pV7lp+Qk1gUjlebkSrigG9q/
	1g6F+pq4FzDYyh34TSLU3fLTHUcA3tA+DQIgUgbrb6fOlDtMhIwmFe2fYWnGDk7/27yA
	Ub0nszGqwySp0uLw+/BSYZGjjvO26yLfgqvHLmSOv1bnX+NKptHnanFYcfkR/5Hfgxl0
	Jm1ZxEOetlARrftOpkKWO4nPtwzPdacv75fBXXDwJkq1G+ymrzDHssYtyhSwYEKNR3yl
	VSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=JRD251LewmKN30xwchzhXWMivx96D5Y7ch0CDrQ6nuQ=;
	b=CFV/bsW7OCfytb6bNVG+z0ISC0Jfh2k1hod0Er5UM7ZjiF4Dq5N1qLiYcevPAKmeXt
	PvQYtSGgVSBsAq9tZ9ssyDcdKe2ZlJuieLi3CqCd0ZtPuFKtHOhLKB9OmyHGB58LWJ5K
	2oOxe+hXYfGCToKC3KgYhF1SWX7YjSCXwozZvS7CvhtxGwxCoYczAMV3Ff0JAvcZU3Na
	mri1ZxV+lDoDTdkb2LhaV3rxIvxq53qOs37Mr3QV8DDcXQNytumxzjTimGNljiNAJhsE
	tBbED899OX7omWdls6MzNguqcw9JRTrQQCXvtK5NAgg51TFeEmiCF0IetjykHrRXqHKk
	RYWg==
X-Gm-Message-State: APzg51Cva/9CwJRgpyY7FnppvwhST4zAw/EhfzvwXe7WGTlJB68dIUof
	ILBLt2EVyK/UIYwDAAmy4XE=
X-Google-Smtp-Source: ANB0VdZ7QkjfLuUXD7UJfDqi9F1ZmhqkdrzG1JSIr711HMoPe9yor1Pf8AyK4TkaOdHECmo9odEJ1w==
X-Received: by 2002:adf:8485:: with SMTP id 5-v6mr16118262wrg.34.1536603012426;
	Mon, 10 Sep 2018 11:10:12 -0700 (PDT)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	d1-v6sm31312218wrc.52.2018.09.10.11.10.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 11:10:11 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <5630C08D-12C8-4534-B2D4-A485B493931A@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Mon, 10 Sep 2018 20:10:09 +0200
In-Reply-To: <CANNYZj8dyfuOnHxqE7V5n3sz=3XjqPS98E2n=t2uJbPkvczKyw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20180907145533.31088-1-sno@netbsd.org>
	<10772E09-62BB-4CFC-A99A-F4816FAE87C1@netbsd.org>
	<CANx9H-BfgTfmNs+oGxC-Cm=Tp464=fpZnMb17vbTWsRg2LTZdg@mail.gmail.com>
	<CANNYZj8dyfuOnHxqE7V5n3sz=3XjqPS98E2n=t2uJbPkvczKyw@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: =?utf-8?Q?Sven_H=C3=A4drich?= <svenha@external.miltenyibiotec.de>,
	Igor Kreps <igork@miltenyibiotec.de>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Mon, 10 Sep 2018 18:10:12 -0000
X-Groupsio-MsgNum: 116115
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2C2F073B-4CF3-4793-A2E5-556B90927D1E";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_2C2F073B-4CF3-4793-A2E5-556B90927D1E
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_85A49478-4181-4924-BDA9-861C0B444002"

--Apple-Mail=_85A49478-4181-4924-BDA9-861C0B444002
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 10.09.2018 um 11:35 schrieb Alexander Kanavin =
<alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>:
>=20
> Large parts of dnf and friends have been rewritten in c++. I have not
> yet updated and reviewed that, that will happen in the next cycle.

If I can prepare something for you - drop me a note.
Otherwise - the perl-5.28 update ("." in @INC, regex buffer overflow, =
...) is also
awaiting some progress (I can keep "myself" busy).

> There's already enough disruption to deal with (postinsts errors,
> openssl 1.1, both caused by me :)

You know, corner, ash, ... things happen. But there is progress! Great!

> Good that we got all the way to do_rootfs though with 3.7.

Yeah, but than came postinst (coreutils :P) :D

Cheers

> Alex
>=20
> 2018-09-10 0:38 GMT+02:00 Tim Orling <ticotimo@gmail.com =
<mailto:ticotimo@gmail.com>>:
>> I did not review the patches closely, but I did try to build
>> core-image-full-cmdline with the tip of poky and these patches =
applied.
>> Everything was fine until do_rootfs... I've attached the log.
>>=20
>> Essentially, there are some bits of dnf and so on which are not ready =
for
>> Python 3.7. We have dnf version 2.7.5, but the latest upstream =
release is
>> 3.4.0 (with a 3.5.0 just 3 days ago). Not sure yet if that would have
>> helped.
>>=20
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20

--
Jens Rehsack - rehsack@gmail.com <mailto:rehsack@gmail.com>

--Apple-Mail=_85A49478-4181-4924-BDA9-861C0B444002
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><meta=
 http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii" =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D""><br class=3D""><div =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 10.09.2018 um 11:35 schrieb Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com" =
class=3D"">alex.kanavin@gmail.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Large =
parts of dnf and friends have been rewritten in c++. I have not<br =
class=3D"">yet updated and reviewed that, that will happen in the next =
cycle.<br class=3D""></div></div></blockquote><div class=3D""><br =
class=3D""></div><div class=3D"">If I can prepare something for you - =
drop me a note.</div><div class=3D"">Otherwise - the perl-5.28 update =
("." in @INC, regex buffer overflow, ...) is also</div><div =
class=3D"">awaiting some progress (I can keep "myself" busy).</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
class=3D"">There's already enough disruption to deal with (postinsts =
errors,<br class=3D"">openssl 1.1, both caused by me :)<br =
class=3D""></div></div></blockquote><div class=3D""><br =
class=3D""></div><div class=3D"">You know, corner, ash, ... things =
happen. But there is progress! Great!</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div class=3D"">Good that we =
got all the way to do_rootfs though with 3.7.<br =
class=3D""></div></div></blockquote><div class=3D""><br =
class=3D""></div><div class=3D"">Yeah, but than came postinst (coreutils =
:P) :D</div><div class=3D""><br class=3D""></div><div =
class=3D"">Cheers</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div class=3D"">Alex<br class=3D""><br =
class=3D"">2018-09-10 0:38 GMT+02:00 Tim Orling &lt;<a =
href=3D"mailto:ticotimo@gmail.com" =
class=3D"">ticotimo@gmail.com</a>&gt;:<br class=3D""><blockquote =
type=3D"cite" class=3D"">I did not review the patches closely, but I did =
try to build<br class=3D"">core-image-full-cmdline with the tip of poky =
and these patches applied.<br class=3D"">Everything was fine until =
do_rootfs... I've attached the log.<br class=3D""><br =
class=3D"">Essentially, there are some bits of dnf and so on which are =
not ready for<br class=3D"">Python 3.7. We have dnf version 2.7.5, but =
the latest upstream release is<br class=3D"">3.4.0 (with a 3.5.0 just 3 =
days ago). Not sure yet if that would have<br class=3D"">helped.<br =
class=3D""><br class=3D"">--<br =
class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br class=3D""><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e</a><br class=3D""><br =
class=3D""></blockquote></div></div></blockquote></div><br class=3D""><div=
 class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">--&nbsp;</div><div class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" =
class=3D"">rehsack@gmail.com</a></div></div></div>
</div>
<br class=3D""></div></body></html>=

--Apple-Mail=_85A49478-4181-4924-BDA9-861C0B444002--

--Apple-Mail=_2C2F073B-4CF3-4793-A2E5-556B90927D1E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAluWs4EACgkQRJmWrtzl
Cp0ugxAAnwgqh4+Ky8NPgxEhQukRFVjfqGyiViA+jfCSzMPVhR/WqhzrySlxUwVh
eImFtk2oTIZJHwY+YvpqyODD0K3XZcBBv9hT3T1hlRk5Bnv7w4eF3CbYYHEH/aWI
w+dgDBRRSjIOIb+JGU6l+OUqiR+mEnqB2es8VSuptdh9plX0nI22+CjQYxkdt707
xu0jXdmLwDtUZjyjZGKiTy/P32Xiv4l1dSCZFyUJxPyAluaVA9BgNhdtur9U66ab
K9PM4q12iBKypDno0dYVzkcT4rixpyHZcyOqHg+FzFxDUGcuXpV/GNI6vnXhKJBn
0DQjc/ahnDl0XJTJYQiTYekrCWnvSbQTr1ZFDpFB2dnp5NTWNJqM3n+1SwUDbGkX
X6Nlo5yJhLipvahABnBNi3HU+2TWQikfs5CsAF1qKKjTRcLjN78HjkFL0dSvcIJ0
NFFUrBsrwNEQY2mN1LMKO6+yo+ffu6wAgAIng5pHsQc0Rj2Uo+nCL+tyUCEtG//O
jlXi12A/Lz8ixeIg1sZsWWFBDno//Jv+0039C8MYAcFjJ0Zv77ScQJe+GJEvwiZ+
6VUqW0LzurgxCAw8bLvI+rQsU7728XUqYIYPp7bClHDP6HLhvuzhIJunlX/CpV60
rr4s69Hguag2M0MGhKGv9QxNl5OJSPGmc6K6b99o15s5TyzX02E=
=yIzB
-----END PGP SIGNATURE-----

--Apple-Mail=_2C2F073B-4CF3-4793-A2E5-556B90927D1E--
