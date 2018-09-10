Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id E3DCD797C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 16:36:59 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id y2-v6so22232370wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=4DUjZf5/udlrYbWaG0Dazslb8wQ7I0884nwpZGXERNI=;
	b=TjPz4bX7NIdYMjacwbxswZcEGyihjFrPu1LIHo/Qar+MIMJJoNDsqyC+W0cLjGFdUq
	CLVx+qAf1jsTTW39T/n8gNRi/5hdlRqlhGDKvgDnbNys+hD0xv7Qjmz0vA1rkgmni5Ao
	FJobMojcPDdIL5IrrYf3dykvgIszLgSWCY+SEWWagOvDbTRXrJCLccvBFCAPrrzLg0Il
	7VmPsJBZuk96OtZnFL2jrYcVtK19PEpJsV3wOe/ytzNE2AcCgW4w+n0JN4yGAgj3QZYB
	fox7BvApHTknD8PcpYxYW2YQz5w5s6MOBd75bhs7vk4UPUoF6FntFIt5osKlCxfrn/py
	gvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=4DUjZf5/udlrYbWaG0Dazslb8wQ7I0884nwpZGXERNI=;
	b=K0zvzd0oJcCnllGf/0tt174mr3rd6OarT2UPYhMpKfvE04vtnriKHKf9aE6okdt5C/
	JST/zg84DFKZui0P2gxcTBK/4H/MpmMS5og0WaLrh7WcFwHCj2GIlmkvACH2QOaUROGY
	3sQ2aSztiFiLTBmkFFHkneOnDOyU9lepXI13MNqwNgz8NgUPMfkGBUiIUZEFXPkvWQmd
	YFK1T3xmBKHeDpryExX2YwlMttU6I256W9FhAxUkthiSjimXA2JKspLn+QyajVkFxrrK
	ZtwQqY1KqMF0GcpHF6BA5cI7XHPfkrbvP5A7QuMWQ2gRfJ+gzviW9WDxQ2cYKM+JbXVV
	Fx4Q==
X-Gm-Message-State: APzg51CLRvzBUEtPB9zUcBZoRwqAkNNKdbjzbNqoYCGl38Py8siFkAsM
	0kBm7j5qzMkFW4NEP4VJ6ms=
X-Google-Smtp-Source: ANB0VdYPvEFgmVZTh6gorPi6fMg3LjJfdZXyfo473n2dMdzk8uJTOE5Ff+EOSL18BJK5rNR6IK40lg==
X-Received: by 2002:a1c:9808:: with SMTP id a8-v6mr1386718wme.62.1536597420503;
	Mon, 10 Sep 2018 09:37:00 -0700 (PDT)
Received: from [10.42.8.207] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	b10-v6sm20688010wmc.28.2018.09.10.09.36.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 09:36:59 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <6FC71ED0-1800-46FD-9A0D-1664CE908975@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Mon, 10 Sep 2018 18:36:46 +0200
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
X-List-Received-Date: Mon, 10 Sep 2018 16:37:00 -0000
X-Groupsio-MsgNum: 116106
Content-Type: multipart/signed;
	boundary="Apple-Mail=_47A3E97E-FF15-4E45-AFEE-AE6CC3AD1D9E";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_47A3E97E-FF15-4E45-AFEE-AE6CC3AD1D9E
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_3D74C88B-EA77-42D7-9465-E1CBF40EE7F8"

--Apple-Mail=_3D74C88B-EA77-42D7-9465-E1CBF40EE7F8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 10.09.2018 um 11:35 schrieb Alexander Kanavin =
<alex.kanavin@gmail.com>:
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
> 2018-09-10 0:38 GMT+02:00 Tim Orling <ticotimo@gmail.com>:
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
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_3D74C88B-EA77-42D7-9465-E1CBF40EE7F8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 10.09.2018 um 11:35 schrieb Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com" =
class=3D"">alex.kanavin@gmail.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Large =
parts of dnf and friends have been rewritten in c++. I have not<br =
class=3D"">yet updated and reviewed that, that will happen in the next =
cycle.<br class=3D""></div></div></blockquote><div><br =
class=3D""></div><div>If I can prepare something for you - drop me a =
note.</div><div>Otherwise - the perl-5.28 update ("." in @INC, regex =
buffer overflow, ...) is also</div><div>awaiting some progress (I can =
keep "myself" busy).</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div class=3D"">There's already enough =
disruption to deal with (postinsts errors,<br class=3D"">openssl 1.1, =
both caused by me :)<br class=3D""></div></div></blockquote><div><br =
class=3D""></div><div>You know, corner, ash, ... things happen. But =
there is progress! Great!</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div class=3D"">Good that we got all the way =
to do_rootfs though with 3.7.<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><div>Yeah, =
but than came postinst (coreutils :P) :D</div><div><br =
class=3D""></div><div>Cheers</div><br class=3D""><blockquote type=3D"cite"=
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
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""><br =
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
<br class=3D""></body></html>=

--Apple-Mail=_3D74C88B-EA77-42D7-9465-E1CBF40EE7F8--

--Apple-Mail=_47A3E97E-FF15-4E45-AFEE-AE6CC3AD1D9E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAluWnZ4ACgkQRJmWrtzl
Cp1CmA//TFX7dNMIklfQPA/O+BCPA4bZx9Slzs1TR3ukP8h/hyDpsbTc/JRK3Yu8
r+hjUZ+XUG4OpYddOdAnUtx9onFG/RZjmrRUOmO5wMFGCBYAAcrMDysIWsMz/yC9
lJ1mgNsQQRiOwOP40eyyRoYZsrot60TeHymVS5VaI4BAZXnSH0kawDLqm5Ie0ebR
taAq6pE3u/hTJOG8U7AHuuGtq7jNIKLf1Pyq9mhIIkrjf0RoYGBv7fRbjVY0PvOf
kXONvLt0iPhg8IMM0gr/t3u6lADl2uemQBEX4FGqwVZi+XZ2s8TrpUwgtlTCwbxb
a/FN58imSr6PJ5FEMmM7pliKfrikmzuAAZWZ42odxF9Fbg/lUcKXj3FZU1nwbvG5
2qUB9bs7/b1ubGmW6IVChSKSD48N1Lg25sHiwu8MlOrjCILUYKQg0ZM71Q6qJSjD
oY/MXpi5hkv4R0DuSNpbvu6PCIlJsgZgHKHlcyV6tIH5kbKKU3BlSXZgvpnaLYYK
W6HFGSPf/qWIDzmxlb3HC7meufbUqhHm0KU3gTEdCaRPjrVVPlCK2jT1Z6rWk3bi
sSO+PkBobUvMSOPV4Sj/zZLAL27jKsB+YNtQI6NIavpIP/CgE05KyigHj6BcvS9D
/NA7G+f9OmFOcLAZ2GMuyCr3YmRtxNmcEE393fWs891ua2aPFZE=
=H7Gj
-----END PGP SIGNATURE-----

--Apple-Mail=_47A3E97E-FF15-4E45-AFEE-AE6CC3AD1D9E--
