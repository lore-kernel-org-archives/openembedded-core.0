Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81304C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 11:17:26 +0000 (UTC)
Subject: Forced password change in first login
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: =?utf-8?q?Stuttgart=2C_Baden-W=C3=BCrttemberg=2C_DE_?=
 =?utf-8?q?=28194=2E39=2E218=2E10=29?=
X-Originating-Platform: Windows Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 May 2022 04:17:24 -0700
Message-ID: <IkQF.1653391044347982572.4xC9@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="S5w5PUIt7oQXmihMUkI3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 11:17:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166056

--S5w5PUIt7oQXmihMUkI3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi!

In extrausers.bbclass ( https://github.com/openembedded/openembedded-core/b=
lob/honister/meta/classes/extrausers.bbclass ) there is a quite new=C2=A0pa=
sswd-expire ( https://www.mail-archive.com/yocto@lists.yoctoproject.org/msg=
05373.html ) to force password change on first login. I am using honister r=
elease now, my experience is that my root user has always an expired passwo=
rd in default and i need to change it in every first login of my flashed im=
age,=C2=A0even though I pre-configured my root password by usermod -p <hash=
_pass> and i am not using new passwd-expire command.

Can i disable that new method somehow to be avoid to change password in fir=
st login?

--S5w5PUIt7oQXmihMUkI3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi!<br /><br />In&nbsp;<a href=3D"https://github.com/openembedded/openem=
bedded-core/blob/honister/meta/classes/extrausers.bbclass" target=3D"_blank=
" rel=3D"noopener">extrausers.bbclass</a> there is a quite <a href=3D"https=
://www.mail-archive.com/yocto@lists.yoctoproject.org/msg05373.html" target=
=3D"_blank" rel=3D"noopener">new&nbsp;passwd-expire</a>&nbsp;to force passw=
ord change on first login. I am using honister release now, my experience i=
s that my root user has always an expired password in default and i need to=
 change it in every first login of my flashed image,&nbsp;even though I pre=
-configured my root password by&nbsp;<em>usermod -p &lt;hash_pass&gt;</em>&=
nbsp;and i am not using new&nbsp;<em>passwd-expire</em> command.</p>
<p>Can i disable that new method somehow to be avoid to change password in =
first login?</p>

--S5w5PUIt7oQXmihMUkI3--

