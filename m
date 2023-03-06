Return-Path: <davidcorbe@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C394DC61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 05:18:01 +0000 (UTC)
Subject: [Kirkstone][Patch review] harfbuzz: CVE-2023-25193 doesn't fix the issue and still exhibits O(n^2) behaviour #kirkstone
To: openembedded-core@lists.openembedded.org
From: "DC" <davidcorbe@outlook.com>
X-Originating-Location: Ahmedabad, Gujarat, IN (49.34.248.198)
X-Originating-Platform: Linux Chrome 110
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 05 Mar 2023 21:17:53 -0800
Message-ID: <g24C.1678079873441089494.XMJ4@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Te3SMd1PRR7Wwsn998Kp"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 05:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178056

--Te3SMd1PRR7Wwsn998Kp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The patches submitted to
dunfell -> https://lists.openembedded.org/g/openembedded-core/message/17776=
8
Kirkstone -> https://lists.openembedded.org/g/openembedded-core/message/177=
767 ( https://lists.openembedded.org/g/openembedded-core/message/177767 )

Still exhibits=C2=A0O(n^2) behaviour upon testing with applications and fon=
ts and in worst cases Harfbuzz is not printing anything.
Upon closer examination, looks to me that a wrong fix is pushed for the iss=
ue.

The patch [ https://github.com/harfbuzz/harfbuzz/commit/85be877925ddbf34f74=
a1229f3ca1716bb6170dc ] is known to causes erroneous results and regression=
 already reverted by Behdad as a developer of Harfbuzz in the commit [ http=
s://github.com/harfbuzz/harfbuzz/commit/661050b4659ee490dfe622821bc7fde7d1c=
40510 ].

(ref-> https://github.com/harfbuzz/harfbuzz/commit/85be877925ddbf34f74a1229=
f3ca1716bb6170dc#commitcomment-101326711 )

The new fix was already introduced ( https://github.com/harfbuzz/harfbuzz/c=
ommit/85be877925ddbf34f74a1229f3ca1716bb6170dc#commitcomment-101335712 ) an=
d needs to be backported properly.

It doesn't look correct to patch Harfbuzz with code already reverted.

--Te3SMd1PRR7Wwsn998Kp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>The patches submitted to&nbsp;<br />dunfell -&gt;&nbsp;<a href=3D"https:=
//lists.openembedded.org/g/openembedded-core/message/177768" target=3D"_bla=
nk" rel=3D"noopener">https://lists.openembedded.org/g/openembedded-core/mes=
sage/177768</a><br />Kirkstone -&gt;&nbsp;<a href=3D"https://lists.openembe=
dded.org/g/openembedded-core/message/177767" target=3D"_blank" rel=3D"noope=
ner">https://lists.openembedded.org/g/openembedded-core/message/177767&nbsp=
;</a><br /><br />Still exhibits&nbsp;O(n^2) behaviour upon testing with app=
lications and fonts and in worst cases Harfbuzz is not printing anything.<b=
r />Upon closer examination, looks to me that a wrong fix is pushed for the=
 issue.<br /><br />The patch [ <a href=3D"https://github.com/harfbuzz/harfb=
uzz/commit/85be877925ddbf34f74a1229f3ca1716bb6170dc" target=3D"_blank" rel=
=3D"noopener">https://github.com/harfbuzz/harfbuzz/commit/85be877925ddbf34f=
74a1229f3ca1716bb6170dc</a> ] is known to causes erroneous results and regr=
ession already reverted by Behdad as a developer of Harfbuzz in the commit =
[ <a href=3D"https://github.com/harfbuzz/harfbuzz/commit/661050b4659ee490df=
e622821bc7fde7d1c40510" target=3D"_blank" rel=3D"noopener">https://github.c=
om/harfbuzz/harfbuzz/commit/661050b4659ee490dfe622821bc7fde7d1c40510</a> ].=
</p>
<p>(ref-&gt;&nbsp;<a href=3D"https://github.com/harfbuzz/harfbuzz/commit/85=
be877925ddbf34f74a1229f3ca1716bb6170dc#commitcomment-101326711" target=3D"_=
blank" rel=3D"noopener">https://github.com/harfbuzz/harfbuzz/commit/85be877=
925ddbf34f74a1229f3ca1716bb6170dc#commitcomment-101326711</a>)<br /><br />T=
he new fix was already introduced (<a href=3D"https://github.com/harfbuzz/h=
arfbuzz/commit/85be877925ddbf34f74a1229f3ca1716bb6170dc#commitcomment-10133=
5712" target=3D"_blank" rel=3D"noopener">https://github.com/harfbuzz/harfbu=
zz/commit/85be877925ddbf34f74a1229f3ca1716bb6170dc#commitcomment-101335712<=
/a>) and needs to be backported properly.</p>
<p>It doesn't look correct to patch Harfbuzz with code already reverted.</p=
>

--Te3SMd1PRR7Wwsn998Kp--

