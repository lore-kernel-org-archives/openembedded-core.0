Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7628C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 14:39:58 +0000 (UTC)
Subject: Re: [PATCH] python3: dont disable readline module for editline
To: openembedded-core@lists.openembedded.org
From: "Khem Raj" <raj.khem@gmail.com>
X-Originating-Location: US (76.133.204.196)
X-Originating-Platform: Mac Chrome 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 29 Mar 2024 07:39:57 -0700
References: <20240227215631.1593504-1-nick.owens@eero.com>
In-Reply-To: <20240227215631.1593504-1-nick.owens@eero.com>
Message-ID: <20232.1711723197934502490@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 14:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197631


unfortunately this change regresses ptests on musl based systems. Similar t=
o https://github.com/python/cpython/issues/87338
but that issue is fixed so enabling both must be triggering it again in som=
e way.=20

 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   FAIL: test_write_read_append (test.test_readline.TestHistoryManipulation=
.test_write_read_append)
   ----------------------------------------------------------------------
   Traceback (most recent call last):
     File "/usr/lib/python3.12/test/test_readline.py", line 96, in test_wri=
te_read_append
       self.assertEqual(readline.get_current_history_length(), 3)
   AssertionError: 4 !=3D 3

   ----------------------------------------------------------------------
   Ran 9 tests in 0.178s

   FAILED (failures=3D1, skipped=3D1)
   test test_readline failed

