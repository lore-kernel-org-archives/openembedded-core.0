Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70996CD4F54
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 08:35:09 +0000 (UTC)
Received: from mailer9.gate185.sl.smtp.com (mailer9.gate185.sl.smtp.com [192.40.185.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1312.1779587516947121301
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 May 2026 18:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=yA/uC+ic;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=IHBbjMPO;
 spf=pass (domain: centricular.com, ip: 192.40.185.9, mailfrom: tarun@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.133] (unknown [10.138.12.33])
	by mtl-mta01-out1 (Halon) with ESMTP
	id 1c3f99a6-ca09-44e1-8523-60b3de6a2874;
	Sun, 24 May 2026 01:51:56 +0000 (UTC)
Received: Received from 10.138.12.53 by Caffeine (s0-aws-app-swarm-manager-5)
 with SMTP id a52b4bc6-c351-411e-99b9-10659cacc1b2  for
 openembedded-core@lists.openembedded.org;
  Sun, 24 May 2026 01:51:38 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app-mta-in-2 (Halon) with ESMTPSA
	id a52b4bc6-c351-411e-99b9-10659cacc1b2;
	Sun, 24 May 2026 01:51:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 203A99CAEB;
	Sun, 24 May 2026 03:51:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1779587496;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=je88PMTesVLyfj4rb8KV3bo+3F0O7dSaDIU64+GfMDY=;
	b=yA/uC+icqUCxtfgUg2e525edjNwN6ECoRejHNroY4tJUqUqKSWTR8p3FvzSeUghzcjB4xs
	4PHwEgR0gyzNa/F7Wrr1GoAqwp56ksAtFawtwHrUohLVeOa7OXlFytSgqjA4YmyutNmAq/
	ecv+sc1Rs22fUFVuokEvjIf3nPTUGswyEu9kmiGMOUMpFojrMn7F89zvJqPn3hC4qHzPfe
	/EuIIy8cXsFcbGgkcJs1IDbn51tiEqlnXCCyLuY5FFync8xd7L8u6HcASrPeA92qEt3mSd
	uqGKvsVKOve5MnIb5RVe13QLcdDjKIKsPFHKWcrtZRJiMdfbtxEMk9RR8sDhBw==
Message-ID: <b39b2b9a49473181678af5a931e03baa7622899b.camel@centricular.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-plugins-rs: add new package
From: Taruntej Kanakamalla <tarun@centricular.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Nirbheek Chauhan
	 <nirbheek@centricular.com>
Cc: openembedded-core@lists.openembedded.org, sebastian@centricular.com
Date: Sun, 24 May 2026 07:21:30 +0530
In-Reply-To: 
 <CANNYZj8TutyAOc_Kz2+r02iDY8VQ_JaoGk5oHbrZSk5Er=UYBg@mail.gmail.com>
References: <20260511133450.50595-1-tarun@centricular.com>
	 <20260513071155.1215141-1-tarun@centricular.com>
	 <CANNYZj8sYaa=hGCCWViiOQojN9TjuroAPs7FHhVLCT=g+Ut1=w@mail.gmail.com>
	 <885d89d6d131a5b1649189936537154f290e1dc6.camel@centricular.com>
	 <CANNYZj8TutyAOc_Kz2+r02iDY8VQ_JaoGk5oHbrZSk5Er=UYBg@mail.gmail.com>
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44app2) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: a52b4bc6-c351-411e-99b9-10659cacc1b2
X-SMTPCOM-Message-ID: 18d81481-0aa5-4281-887e-e71a7c93abd7
X-SMTPCOM-Payload: 
 oajIVlif2IvgeZ60gETt7lKWyVEddwe1aCtsB8tQPg6aTEyq0SdV3zKG1r7znhsNm4snW6k_6xcvuPujfj954jSztj2RpP1Yuygvz-A-Szb_im2zaHoPS1tW3UQmlCTKFgbo9sUduZWjmQWC9qcUmYC1vtjsssKxMEdJ92JELFyfJy-GDz0uRsNEo-v2juVdEyjv3bsMAEqY_1cxRSEwHA==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=18d81481-0aa5-4281-887e-e71a7c93abd7_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=18d81481-0aa5-4281-887e-e71a7c93abd7&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1779587509;
 h=feedback-id : message-id : subject : from : to : cc : date :
 in-reply-to : references : content-type : mime-version :
 list-unsubscribe : list-unsubscribe-post : subject : from : to : cc :
 date; bh=je88PMTesVLyfj4rb8KV3bo+3F0O7dSaDIU64+GfMDY=;
 b=IHBbjMPOoLAZwzT5dN8qt/TbMV8nlmrpoS/N2tHWa8XsLeOjTw8iDkIvKma1tZzdwI4WE
 3nMe4BFtJtLkpTiByEudpi6LpXcVxdv9w9IV3neTSGz95sNAU8OYhlvINDbesgFsz9eDdET
 AIXwRn7UDNiY+npXwjHgFbylQpBMrFbISyCi6Sgy9qopoWfE7lO8syQac7TVhjcfNey7wW5
 Glvm9dJur6tQbohFM9F8TEZ5T6ybHBEn7VmGP3pkiRiLjYYjYKNIDqU1Q/YDGVDp7Lnxs+9
 x6OT3x9ONulVCXNG4e8smrU2q1vEKo8Tj/DfYrZmFBJdM5pmeX7LVwi0kfjg==
Content-Type: multipart/alternative; boundary="=-bLH+PaU+PnRIY2fTnO8X"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 May 2026 08:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237563

--=-bLH+PaU+PnRIY2fTnO8X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Wed, 2026-05-13 at 13:45 +0200, Alexander Kanavin wrote: =20
... =20
> I meant something else: the items in this list: =20
> =20
> SRC_URI =3D " \ =20
> +=C2=A0=C2=A0=C2=A0 git://gitlab.freedesktop.org/gstreamer/gst-plugins-rs=
;protocol=3Dhttps;branch=3D0.15;name=3Ddefault =20
> \ =20
> +=C2=A0=C2=A0=C2=A0 git://github.com/gtk-rs/gtk4-rs;protocol=3Dhttps;bran=
ch=3D0.11;name=3Dgtk4-rs;destsuffix=3Dgtk4-rs =20
> \ =20
> +=C2=A0=C2=A0=C2=A0 git://github.com/gtk-rs/gtk-rs-core;protocol=3Dhttps;=
branch=3D0.22;name=3Dgtk-rs-core;destsuffix=3Dgtk-rs-core =20
> \ =20
> +=C2=A0=C2=A0=C2=A0 git://github.com/rust-av/ffv1.git;protocol=3Dhttps;no=
branch=3D1;name=3Dffv1;destsuffix=3Dffv1 =20
> \ =20
> +=C2=A0=C2=A0=C2=A0 git://github.com/rust-av/flavors;protocol=3Dhttps;nob=
ranch=3D1;name=3Dflavors;destsuffix=3Dflavors =20
> \ =20
> +=C2=A0=C2=A0=C2=A0 git://gitlab.freedesktop.org/gstreamer/gstreamer-rs;p=
rotocol=3Dhttps;branch=3D0.25;name=3Dgstreamer-rs;destsuffix=3Dgstreamer-rs=
 =20
> \ =20
> +" =20
> =20
> all should be built with separate recipes. The plugins themselves =20
> don't need separate recipes, but the resulting plugin binaries should =
=20
> be put into separate target packages, same as the classic =20
> base/good/bad/ugly plugins are. The recipe isn't doing that yet. =20
> =20
> Alex

Thanks for your inputs. Except gst-plugins-rs, all other repositories are d=
ependencies of the plugins and they have their respective crates published =
on crates.io. So in the V3 patch we switched to using crates.io for these a=
s well as the individual plugins, by appending them to the SRC_URI in the $=
{BPN}-crates.inc using the `update_crates:append`.

Thanks, =20
Tarun


--=-bLH+PaU+PnRIY2fTnO8X
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Alexander,</p>
<p>On Wed, 2026-05-13 at 13:45 +0200, Alexander Kanavin wrote:<br />
...</p>
<blockquote type=3D"cite">
<p>I meant something else: the items in this list:</p>
<p>SRC_URI =3D &quot; \<br />
+=C2=A0=C2=A0=C2=A0 git://gitlab.freedesktop.org/gstreamer/gst-plugins-rs;p=
rotocol=3Dhttps;branch=3D0.15;name=3Ddefault<br />
\<br />
+=C2=A0=C2=A0=C2=A0 git://github.com/gtk-rs/gtk4-rs;protocol=3Dhttps;branch=
=3D0.11;name=3Dgtk4-rs;destsuffix=3Dgtk4-rs<br />
\<br />
+=C2=A0=C2=A0=C2=A0 git://github.com/gtk-rs/gtk-rs-core;protocol=3Dhttps;br=
anch=3D0.22;name=3Dgtk-rs-core;destsuffix=3Dgtk-rs-core<br />
\<br />
+=C2=A0=C2=A0=C2=A0 git://github.com/rust-av/ffv1.git;protocol=3Dhttps;nobr=
anch=3D1;name=3Dffv1;destsuffix=3Dffv1<br />
\<br />
+=C2=A0=C2=A0=C2=A0 git://github.com/rust-av/flavors;protocol=3Dhttps;nobra=
nch=3D1;name=3Dflavors;destsuffix=3Dflavors<br />
\<br />
+=C2=A0=C2=A0=C2=A0 git://gitlab.freedesktop.org/gstreamer/gstreamer-rs;pro=
tocol=3Dhttps;branch=3D0.25;name=3Dgstreamer-rs;destsuffix=3Dgstreamer-rs<b=
r />
\<br />
+&quot;</p>
<p>all should be built with separate recipes. The plugins themselves<br />
don't need separate recipes, but the resulting plugin binaries should<br />
be put into separate target packages, same as the classic<br />
base/good/bad/ugly plugins are. The recipe isn't doing that yet.</p>
<p>Alex</p>
</blockquote>
<p>Thanks for your inputs. Except gst-plugins-rs, all other repositories ar=
e dependencies of the plugins and they have their respective crates publish=
ed on crates.io. So in the V3 patch we switched to using crates.io for thes=
e as well as the individual plugins, by appending them to the SRC_URI in th=
e ${BPN}-crates.inc using the <code>update_crates:append</code>.</p>
<p>Thanks,<br />
Tarun</p>

--=-bLH+PaU+PnRIY2fTnO8X--

