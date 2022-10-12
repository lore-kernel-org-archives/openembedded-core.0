Return-Path: <k@piana.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BDBC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 09:51:38 +0000 (UTC)
Received: from out3.zimbraopen.it (out3.zimbraopen.it [54.246.171.71])
 by mx.groups.io with SMTP id smtpd.web08.18164.1665568290498001678
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 02:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@piana.eu header.s=2238c770-2b10-11ea-b6cc-ce101abb603f header.b=TYfHENFv;
 spf=pass (domain: piana.eu, ip: 54.246.171.71, mailfrom: carlo@piana.eu)
Received: from out3.zimbraopen.it (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by out3.zimbraopen.it (Postfix) with ESMTPS id 4MnSbN41xMz31rN;
	Wed, 12 Oct 2022 11:51:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by out3.zimbraopen.it (Postfix) with ESMTP id 4MnSbN31tfz31rP;
	Wed, 12 Oct 2022 11:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 out3.zimbraopen.it 4MnSbN31tfz31rP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piana.eu;
	s=2238C770-2B10-11EA-B6CC-CE101ABB603F; t=1665568288;
	bh=1LRJV3QmS3bi1tUV3DwLs9oiwtZkIG40ktMpM1EIBTU=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=TYfHENFvBzG83dMQqFfx1R3dXnuejLLFhPrQKzTkD6iE/I6NjWCNQOFvwgCnvhQ+/
	 Iwx/svSTzDQZ5dEUrSVqLHqr2okwDY21sW2fKRKSihHHLcb/t1M8JBctlgtU1qxhFf
	 VJYoWJgtC2NN/gh8lbKxwqOKV2E8fsuhEdiENNze2LgWLVul0BmZI1p8tzSUnzbDfi
	 7DPfMlVAQvdxJwfmcDM+4cAM90607DzqjQcORq7lumYeQz0oOvgcpbOJxa117us90W
	 AYKMif+2th4euKSiCCL61Dan/GPayiyHA3dgqTHYhYWsfkgHmOHY9Pfr2vCFcosp3G
	 KgeGbX0WJpcYg==
Received: from out3.zimbraopen.it ([127.0.0.1])
	by localhost (out3.zimbraopen.it [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uGFFPtd857xR; Wed, 12 Oct 2022 11:51:28 +0200 (CEST)
Received: from mail.zimbraopen.it (mail.zimbraopen.it [10.70.1.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by out3.zimbraopen.it (Postfix) with ESMTPS id 4MnSbN2D0Rz31rN;
	Wed, 12 Oct 2022 11:51:28 +0200 (CEST)
Received: from mail.zimbraopen.it (localhost [127.0.0.1])
	by mail.zimbraopen.it (Postfix) with ESMTP id 4MnSbN1FT2z3wYL;
	Wed, 12 Oct 2022 11:51:28 +0200 (CEST)
Date: Wed, 12 Oct 2022 11:51:28 +0200 (CEST)
From: Carlo Piana <k@piana.eu>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Marta Rybczynska <rybczynska@gmail.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Alberto Pianon <alberto@pianon.eu>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	marta rybczynska <marta.rybczynska@linaro.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <1529445347.7178896.1665568288122.JavaMail.zimbra@piana.eu>
Subject: Re: [OE-core] severe issue in CVE checker
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="=_2299b4d2-f782-489a-a617-8bf747458d1d"
X-Mailer: Zimbra 8.8.15_GA_2020101 (ZimbraWebClient - FF105 (Linux)/8.8.15_GA_202209149)
Thread-Index: XNoGkJeUvrwl5QuLtVkp3WVn3zPjvg==
Thread-Topic: severe issue in CVE checker
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 09:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171661

--=_2299b4d2-f782-489a-a617-8bf747458d1d
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

[sent from the wrong account, resent, sorry for the noise]=20

----- Messaggio originale -----=20
> Da: "Mikko Rapeli" <mikko.rapeli@linaro.org>=20
> A: "Marta Rybczynska" <rybczynska@gmail.com>=20
> Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>, "Alberto Pianon" <alber=
to@pianon.eu>, "OE-core"=20
> <openembedded-core@lists.openembedded.org>, "marta rybczynska" <marta.ryb=
czynska@linaro.org>, "Richard Purdie"=20
> <richard.purdie@linuxfoundation.org>, "Carlo Piana" <carlo@piana.eu>=20
> Inviato: Mercoled=C3=AC, 12 ottobre 2022 10:04:07=20
> Oggetto: Re: [OE-core] severe issue in CVE checker=20

> Hi,=20
>=20
> Can the downloads be turned into normal do_fetch() SRC_URI downloads incl=
uding=20
> caches in yocto infrastructure?=20
>=20
> There are many issues around CVE checking that it's really=20
> a process where a lot of details and uncertainties just need to be=20
> accepted. It's far from a perfect and users just need to accept this.=20
>=20
>=20

[...]=20

I beg to (strongly, if I may) differ.=20

CVE is broken? This is no excuse of course to ignore a known insecurity.=20

Is it better to include a process that, when fails, the fail goes unnoticed=
, than nothing? No, "nothing" is better than flawed here, speaking of secur=
ity, since a false sense of security is worse than insecurity itself.=20

If we put a CVE checker that just throws in a contradictory message (a warn=
ing and eventually a "success" one) and then silently moves on without any =
fuss, we leave users in a state of false belief that they have completed at=
 least the CVE checks -- however insufficient this may be -- but in reality=
 it's a test that never fails because the database is empty or outdated. I =
agree that for developers CVE checking, compliance, software component inve=
ntory are a PITA, but it's way more a PITA when an attacker exploits an unp=
atched known insecurity kept out in the wild, or when a copyright troll com=
es after you demanding (many!) millions in damages (I can't disclose who ha=
s received it, but I have seen it in real life), because you failed to noti=
ce that a GPL component went into a mass-distribution device.=20

Once the function is advertised, the expected behaviour for a thing of that=
 importance must be to visibly flag the issue and **stand in the way** unti=
l you acknowledge it, so that the warning cannot be missed. It is up to the=
 duly informed user to say "Ok, it's nothing, I know it" and shrug the prob=
lem off. Not a decision taken for the user by others and hidden under the c=
arpet. We have several clients relying on that CVE checking and just by coi=
ncidence we noticed that something did not add up. God only knows how many =
times did this happen before.=20

One can think it's not their problem, this is open source after all. But be=
ing open source is not total relief from liability. If you create a hole in=
 the road and cover it with foliage, the fact that you are not paid to pave=
 the road and you are doing it as a service for the community does not shie=
ld you if a car takes a nose-dive into it.=20

I am sorry to intrude in the discussion so bluntly, but I prefer that the l=
egal implications are correctly perceived before making a decision.=20

All the best,=20

Carlo=20


--=_2299b4d2-f782-489a-a617-8bf747458d1d
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: arial,helvetica,sans-serif; font-siz=
e: 12pt; color: #000000"><div data-marker=3D"__QUOTED_TEXT__">[sent from th=
e wrong account, resent, sorry for the noise]<br data-mce-bogus=3D"1"></div=
><div data-marker=3D"__QUOTED_TEXT__"><br data-mce-bogus=3D"1"></div><div d=
ata-marker=3D"__QUOTED_TEXT__">----- Messaggio originale -----<br>&gt; Da: =
"Mikko Rapeli" &lt;mikko.rapeli@linaro.org&gt;<br>&gt; A: "Marta Rybczynska=
" &lt;rybczynska@gmail.com&gt;<br>&gt; Cc: "Alexander Kanavin" &lt;alex.kan=
avin@gmail.com&gt;, "Alberto Pianon" &lt;alberto@pianon.eu&gt;, "OE-core"<b=
r>&gt; &lt;openembedded-core@lists.openembedded.org&gt;, "marta rybczynska"=
 &lt;marta.rybczynska@linaro.org&gt;, "Richard Purdie"<br>&gt; &lt;richard.=
purdie@linuxfoundation.org&gt;, "Carlo Piana" &lt;carlo@piana.eu&gt;<br>&gt=
; Inviato: Mercoled=C3=AC, 12 ottobre 2022 10:04:07<br>&gt; Oggetto: Re: [O=
E-core] severe issue in CVE checker<br><br>&gt; Hi,<br>&gt; <br>&gt; Can th=
e downloads be turned into normal do_fetch() SRC_URI downloads including<br=
>&gt; caches in yocto infrastructure?<br>&gt; <br>&gt; There are many issue=
s around CVE checking that it's really<br>&gt; a process where a lot of det=
ails and uncertainties just need to be<br>&gt; accepted. It's far from a pe=
rfect and users just need to accept this.<br>&gt; <br>&gt; <br><br>[...]<br=
><br>I beg to (strongly, if I may) differ.<br><br>CVE is broken? This is no=
 excuse of course to ignore a known insecurity. <br><br>Is it better to inc=
lude a process that, when fails, the fail goes unnoticed, than nothing? No,=
 "nothing" is better than flawed here, speaking of security, since a false =
sense of security is worse than insecurity itself.<br><br>If we put a CVE c=
hecker that just throws in a contradictory message (a warning and eventuall=
y a "success" one) and then silently moves on without any fuss, we leave us=
ers in a state of false belief that they have completed at least the CVE ch=
ecks -- however insufficient this may be -- but in reality it's a test that=
 never fails because the database is empty or outdated. I agree that for de=
velopers CVE checking, compliance, software component inventory are a PITA,=
 but it's way more a PITA when an attacker exploits an unpatched known inse=
curity kept out in the wild, or when a copyright troll comes after you dema=
nding (many!) millions in damages (I can't disclose who has received it, bu=
t I have seen it in real life), because you failed to notice that a GPL com=
ponent went into a mass-distribution device.<br><br>Once the function is ad=
vertised, the expected behaviour for a thing of that importance must be to =
visibly flag the issue and **stand in the way** until you acknowledge it, s=
o that the warning cannot be missed. It is up to the duly informed user to =
say "Ok, it's nothing, I know it" and shrug the problem off. Not a decision=
 taken for the user by others and hidden under the carpet. We have several =
clients relying on that CVE checking and just by coincidence we noticed tha=
t something did not add up. God only knows how many times did this happen b=
efore.<br><br>One can think it's not their problem, this is open source aft=
er all. But being open source is not total relief from liability. If you cr=
eate a hole in the road and cover it with foliage, the fact that you are no=
t paid to pave the road and you are doing it as a service for the community=
 does not shield you if a car takes a nose-dive into it. <br><br>I am sorry=
 to intrude in the discussion so bluntly, but I prefer that the legal impli=
cations are correctly perceived before making a decision. <br><br>All the b=
est,<br><br>Carlo</div><div><br></div></div></body></html>
--=_2299b4d2-f782-489a-a617-8bf747458d1d--

