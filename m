Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE6FC7115D
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 18:25:13 +0000 (UTC)
Subject: Re: [PATCH v4] sqlite3: upgrade 3.48.0 -> 3.49.1
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: =?UTF-8?B?R2Fyw7BhYmFlciwgQ2FwaXRhbCBSZWdpb24sIElT?= (81.15.100.92)
X-Originating-Platform: Windows Firefox 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 22 Jun 2025 11:25:03 -0700
References: <AS1PR10MB5697540CDFAE09DCB8F094D0FD93A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697540CDFAE09DCB8F094D0FD93A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Message-ID: <3500.1750616703244224826@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="pFcFPfH5xxqMH6ppkGuk"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 18:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219194

--pFcFPfH5xxqMH6ppkGuk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I looked a bit into this today. I am using 3.49.2 specifically. On that rel=
ease I see no way to disable rpaths. FYI: I posted a question in their foru=
m https://sqlite.org/forum/forumpost/13cac3b565

ERROR: sqlite3-5_3.49.2-r0 do_package_qa: QA Issue: libsqlite3: /usr/lib/li=
bsqlite3.so.3.49.2 contains probably-redundant RPATH /usr/lib [useless-rpat=
hs]
ERROR: sqlite3-5_3.49.2-r0 do_package_qa: QA Issue: sqlite3: /usr/bin/sqlit=
e3 contains probably-redundant RPATH /usr/lib [useless-rpaths]

After 3.49.1 the --disable-rpath option was removed which seems strange to =
me.

--pFcFPfH5xxqMH6ppkGuk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I looked a bit into this today. I am using 3.49.2 specifically. On tha=
t release I see no way to disable rpaths. FYI: I posted a question in their=
 forum <a href=3D"https://sqlite.org/forum/forumpost/13cac3b565" target=3D"=
_blank" rel=3D"noopener">https://sqlite.org/forum/forumpost/13cac3b565</a><=
/div>
<div>&nbsp;</div>
<div>ERROR: sqlite3-5_3.49.2-r0 do_package_qa: QA Issue: libsqlite3: /usr/l=
ib/libsqlite3.so.3.49.2 contains probably-redundant RPATH /usr/lib [useless=
-rpaths]<br />ERROR: sqlite3-5_3.49.2-r0 do_package_qa: QA Issue: sqlite3: =
/usr/bin/sqlite3 contains probably-redundant RPATH /usr/lib [useless-rpaths=
]</div>
<div>&nbsp;</div>
<div>After 3.49.1 the --disable-rpath option was removed which seems strang=
e to me.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>

--pFcFPfH5xxqMH6ppkGuk--

