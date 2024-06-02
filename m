Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F3DC25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 17:52:31 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] openssl: Security fix for CVE-2024-4741
To: openembedded-core@lists.openembedded.org
From: "Siddharth" <sdoshi@mvista.com>
X-Originating-Location: IN (157.32.46.224)
X-Originating-Platform: Linux Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 02 Jun 2024 10:52:23 -0700
References: <AS1PR10MB5697AB1D0FEA8F5683503339FDFE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697AB1D0FEA8F5683503339FDFE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Message-ID: <918.1717350743959512876@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="wHhz9D6kFeF5etp6sJ7C"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 17:52:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200214

--wHhz9D6kFeF5etp6sJ7C
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>> Nitpick : above commit link references commit for CVE-2024-4603 (copy+pa=
ste error).

- Ahh, that's silly of me. Guess the cup of coffee didnt take away the drow=
siness completely.. Thank-you for pointing it out.

>> The main problem of this patch (and the same patch for scarthgap) is tha=
t it's picking only one out of 5 commits referencing this CVE.
- That definately makes sense. I just followed the fix links from https://o=
penssl.org/news/vulnerabilities.html and didnt dive deeper.

- I will send a v2 by tomorrow.

--wHhz9D6kFeF5etp6sJ7C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>&gt;&gt; <span style=3D"color: #333333; font-family: system-ui, 'Segoe U=
I', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-s=
erif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color=
 Emoji'; font-size: 16px; font-style: normal; font-variant-ligatures: norma=
l; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orp=
hans: 2; text-align: start; text-indent: 0px; text-transform: none; widows:=
 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wra=
p; background-color: #ffffff; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial; display: inline !imp=
ortant; float: none;">Nitpick : above commit link references commit for CVE=
-2024-4603 (copy+paste error).</span></p>
<p>- Ahh, that's silly of me. Guess the cup of coffee didnt take away the d=
rowsiness completely.. Thank-you for pointing it out.<br /><br />&gt;&gt; <=
span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, '=
Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple =
Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font=
-size: 16px; font-style: normal; font-variant-ligatures: normal; font-varia=
nt-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text=
-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background=
-color: #ffffff; text-decoration-thickness: initial; text-decoration-style:=
 initial; text-decoration-color: initial; display: inline !important; float=
: none;">The main problem of this patch (and the same patch for scarthgap) =
is that it's picking only one out of 5 commits referencing this CVE.</span>=
<br />- That definately makes sense. I just followed the fix links from <a =
href=3D"https://openssl.org/news/vulnerabilities.html" target=3D"_blank" re=
l=3D"noopener">https://openssl.org/news/vulnerabilities.html</a> and didnt =
dive deeper.</p>
<p>- I will send a v2 by tomorrow.<br /><br /><br /></p>

--wHhz9D6kFeF5etp6sJ7C--

