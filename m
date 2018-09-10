Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6DC70797B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 16:47:11 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id v90-v6so22739374wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=Bp6n0SAMUferywK5Qwb+U2Zi1FOQ0Q96HiNA1+VYZrA=;
	b=notsZCxKO6x6m6dS9+F72Hbdpuxh3xLEc2Sd8F/pBX7crtYxtOrP+JDvCLqHByAj3B
	rpV7XW+4tCiN4qDFdxceKuuDR0TsRo/dh5tf4hP1gSn6q2etiGpoGRu09XIjuSEwP3P+
	hr++7ooutKFpLPAXyMcaQx19WoB2Lese+WNsQqz7aMpK+bwClKjdIe6jV9fYxQSIu3uT
	pDlOCJxnkGGafoe0TOH/r02aMJcBxkHrCiYiSSX7NVfiJwPZzHxPvzYD5RUc/WuHP58X
	e8fZP4qsRdFWaI62HcS6RTd4klvneL6SSvaMZKyp3VHkcUXhi6DCCNQyeWABkYyuX8A5
	/N8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=Bp6n0SAMUferywK5Qwb+U2Zi1FOQ0Q96HiNA1+VYZrA=;
	b=QE5IXhT5/e27QU1xmzrC1LPZEJaPFPI0X1cypoWtVBtppig9fYy4l9QHuGoUOt16CK
	TrHxL0hoT4sSDveWxaSjtQIOVJxdRa0qMHDh+95OIl8w0MjLHNZy+Uz32zu1VOS45eSF
	cYGVcq1lf78Y+W+lWY+W4D+P5i7YyOPR4xg5tr8Efl0QhgOijgOJHPUCkoIJrYv5pGA4
	af9I+K1M1RZItJ/uP6RV4rLb39CCM9STD8dqfJqa8QK4oFOtis6KyuPok6zii58IhtRo
	eg8lI7LDFUzdJa0Vs6dXK0m9XQI9cvvNboLvWnSiKawhIucZzWt8d5RpgUJp2ZxKRge/
	zDgA==
X-Gm-Message-State: APzg51A8vopdA4n4Q7iNdLagCwyEyKzjHvQNTA65lFe0lbNbDX6+m1Am
	/01mk0vFq02TezYzN2Gpg5A=
X-Google-Smtp-Source: ANB0VdYk7HVWwbAUaROfDctFV/iq/AWUu6UG20Z4RPLLyJE0Lg3NUyk7vOEppZzvWyXrHWQN4hnLmg==
X-Received: by 2002:adf:ea4f:: with SMTP id
	j15-v6mr16597563wrn.224.1536598032133; 
	Mon, 10 Sep 2018 09:47:12 -0700 (PDT)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	o19-v6sm16019712wro.50.2018.09.10.09.47.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 09:47:10 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <9001B3D6-85AF-4E00-BCAE-6C297A1E1582@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Mon, 10 Sep 2018 18:42:51 +0200
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
X-List-Received-Date: Mon, 10 Sep 2018 16:47:11 -0000
X-Groupsio-MsgNum: 116109
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BE37EFD7-FA6A-4E44-BBAA-32D9F09808E8";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_BE37EFD7-FA6A-4E44-BBAA-32D9F09808E8
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A9063B58-B9FD-476C-85AE-DAC1E593ABC0"

--Apple-Mail=_A9063B58-B9FD-476C-85AE-DAC1E593ABC0
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

--Apple-Mail=_A9063B58-B9FD-476C-85AE-DAC1E593ABC0
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

--Apple-Mail=_A9063B58-B9FD-476C-85AE-DAC1E593ABC0--

--Apple-Mail=_BE37EFD7-FA6A-4E44-BBAA-32D9F09808E8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAluWnwsACgkQRJmWrtzl
Cp1GiA/9F6Mh9FtXIVuGxKuMbl24AJjOUs/9KtZOCBS0Ay7IqMPijZBosPIGlleh
fsM4vdKxXtf2JhRs+zXlAdgvbagOjN+4oSGNmo+ABL02ME2gFXwJiJyKebo6GMfJ
lTrVVDucL0j/rQ29iiyeb5KPIMk2S5CtJiaPRWfbLE2zjE97fFY2fpbpVDSiAdsF
adSsLXK9h/ZOuDUWTL3bKv/eDsQvRwOW0KSaVI6Bx8uWr1WET6xLenN8gKE1HObk
EbyDdG/Goo7vaVM0t9xnXwimYuhjssLt05c/h2rABOvrCUqcJ1rj8itiL0AzJFGj
eBxrgVOCIJG/QBR+FVANS6Mj+hvhXHvyU8FN1EcXa0myoxPvh1faJ6dSuY3hOHZ+
FoGSQt0vQfOZDGSHVwAAnS1P93bc6kOSh608acRfN7kYhVHTUjgmA7vY/cipCQiP
pGTibA57+pXmWbn8WSThIKoVK9DgamzX8jRdyHO1lroHlQ5Nn/uErc7DYNpAbFif
SZuMNQA2aKDhKBChnO8MYSSmbiliZSdD38TvRWczGIMZFtDGGpbP5SWf22rQ8Wg2
sW2cizgI/s8iZn8cTVpUHFhTggLkbbuhtVwyoU9Fo5fdJ5lYAoZXJWFPsTlgDh9B
l8M5oXZvQsBWHpJfVmv/Iw83cBR6NnEq/92awjTRHDJpUxUlvIs=
=3MmH
-----END PGP SIGNATURE-----

--Apple-Mail=_BE37EFD7-FA6A-4E44-BBAA-32D9F09808E8--
