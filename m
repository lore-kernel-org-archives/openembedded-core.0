Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5482960268
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 23:37:58 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id cd13so5778578pac.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2016 16:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=4NbmQfeNs6BrP2mTWImBJuvGEiqvEteEAel7yjYxtuw=;
	b=MdOuh6/hOBE/HWYb9ydK8N5vP0kUZnA8avKOZ/XflV5YJUPezTC7S7izqw6SZezHvS
	0Ljjdz8YpBl4Un4bnhutIP5TWSCflCbsCKuEpcZqB1hZkbV9s7qxahYnAoSK0BtEuzow
	7tTkVCljxAShRA0pAHz+m3Ex38efjk99CMmx8mVHcrzsrRoAw0gL5S1RUZtUfFg2Ui21
	/SM2H4cob4DFgUberQDykNuaQieoe3/EReiwmRTkjaJGIWPNIK+tas2/29P4G0sZoVra
	8TI+sQqsd6iLpcfUzFXKL/TrbmJRGdg9MYzvOkWc0DNIn0xnw16XhXedOfKMdMThCyMD
	2j4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=4NbmQfeNs6BrP2mTWImBJuvGEiqvEteEAel7yjYxtuw=;
	b=gbi/5BXAr2Lz8Ar8xHd4Lxi45utmW7DVUXTalTD89rpHl9pTP1fzkMj/aRESRm8W4E
	U5hYN0g3bizUcISWpjCYh9P6ddgss3XmL41Gr10Rxi2ZX9YR94VkM6301NGcnG7FLSuB
	vSJAiw+QQGsgZmK91AcaXPWk4rlo5HtTf7R9YNXEV4nWPvvDpi3lgs9fB3MZuGHOoCOy
	Pco3EUJ8LVi3Fpdy93TWDfjpGmbbUhsDGL9XyRLLtYe8EO0NlH3w81ZX70JOCeOpmC34
	a9xJQc0HeCNJrUbhVHr9EyL909M97JdPth1YAotHv78WpBgvQa0pUXLOnc4o6q2WvCSL
	iLTg==
X-Gm-Message-State: AA6/9RmY16tVKz+HbmNVZi+3SpI02vMYV+KlHIGJ7W8x6Mk0YYpq1wOJq/soS/h4EmeaRg==
X-Received: by 10.67.3.102 with SMTP id bv6mr33079710pad.61.1475451479972;
	Sun, 02 Oct 2016 16:37:59 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:4b8:204d:45de:e844?
	([2601:646:8882:b8c:4b8:204d:45de:e844])
	by smtp.gmail.com with ESMTPSA id l2sm8498475pav.7.2016.10.02.16.37.58
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 16:37:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CALDxG5jveoshv5wXMZFFJOgprMOAOwARG4xXwQ+gNO8kFmvzuA@mail.gmail.com>
Date: Sun, 2 Oct 2016 16:37:53 -0700
Message-Id: <7D3A9BAC-9942-4D89-9B78-D3183E139F9D@gmail.com>
References: <CALDxG5jveoshv5wXMZFFJOgprMOAOwARG4xXwQ+gNO8kFmvzuA@mail.gmail.com>
To: srikanth krishnakar <skrishnakar@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Psplash on Systemd with progress bar
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
X-List-Received-Date: Sun, 02 Oct 2016 23:38:00 -0000
X-Groupsio-MsgNum: 87777
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5BB00A94-9162-4D55-AA91-E06AAE302DA8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5BB00A94-9162-4D55-AA91-E06AAE302DA8
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_1B4F0D01-9043-4940-B950-5712C6A7A3BE"

--Apple-Mail=_1B4F0D01-9043-4940-B950-5712C6A7A3BE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 28, 2016, at 10:38 PM, srikanth krishnakar =
<skrishnakar@gmail.com> wrote:
>=20
> Hi All,
>=20
> Yocto version: yocto-2.1
> Target: ARM imx6
> Graphics: X11 (core-image-sato)
>=20
> I am trying to use psplash with systemd and have come across the =
service files prepared by Eric:
>=20
> http://lists.busybox.net/pipermail/buildroot/2014-May/097233.html =
<http://lists.busybox.net/pipermail/buildroot/2014-May/097233.html>
>=20
> Although the splash comes up for a split second and vanishes on my =
imx6 target it never stays till desktop appears nor it displays any =
progress bar. I read Eric mention about patch to systemd =
(src/core/manager.c) to write progress data to psplash socket but I =
couldn't find the patch. Can anyone point me to the patch for systemd =
that writes progress data to psplash socket so that I can see progress =
bar and while keeping splash alive till desktop shows up ?

systemd is not integrated with psplash as systemV is. system has other =
graphic systems e.g. dietsplash which work better.

>=20
> Thanks in Advance!!
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_1B4F0D01-9043-4940-B950-5712C6A7A3BE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Sep 28, 2016, at 10:38 PM, srikanth krishnakar &lt;<a =
href=3D"mailto:skrishnakar@gmail.com" =
class=3D"">skrishnakar@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D"">Hi All,<div class=3D""><br class=3D""></div><div =
class=3D"">Yocto version: yocto-2.1</div><div class=3D"">Target: ARM =
imx6</div><div class=3D"">Graphics: X11 (core-image-sato)</div><div =
class=3D""><br class=3D""></div><div class=3D"">I am trying to use =
psplash with systemd and have come across the service files prepared by =
Eric:</div><div class=3D""><br class=3D""></div><div class=3D""><a =
href=3D"http://lists.busybox.net/pipermail/buildroot/2014-May/097233.html"=
 =
class=3D"">http://lists.busybox.net/pipermail/buildroot/2014-May/097233.ht=
ml</a><br class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D"">Although the splash comes up for a split second and vanishes =
on my imx6 target it never stays till desktop appears nor it displays =
any progress bar. I read Eric mention about patch to systemd =
(src/core/manager.c) to write progress data to psplash socket but I =
couldn't find the patch. Can anyone point me to the patch for systemd =
that writes progress data to psplash socket so that I can see progress =
bar and while keeping splash alive till desktop shows up =
?</div></div></div></blockquote><div><br class=3D""></div><div>systemd =
is not integrated with psplash as systemV is. system has other graphic =
systems e.g. dietsplash which work better.</div><br class=3D""><blockquote=
 type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div=
 class=3D""><br class=3D""></div><div class=3D"">Thanks in =
Advance!!</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_1B4F0D01-9043-4940-B950-5712C6A7A3BE--

--Apple-Mail=_5BB00A94-9162-4D55-AA91-E06AAE302DA8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfxmlYACgkQuwUzVZGdMxSrTgCeNfEPf//63jcCNcbdMOO6Z2Td
+rYAn1EkUp+N7l7a1SQmhhzLYu5SgGLs
=zwQn
-----END PGP SIGNATURE-----

--Apple-Mail=_5BB00A94-9162-4D55-AA91-E06AAE302DA8--
