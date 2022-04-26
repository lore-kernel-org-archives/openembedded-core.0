Return-Path: <dev-faha@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1D4C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 08:14:03 +0000 (UTC)
Subject: CVE-2022-24765 Git Errors with Bitbake
To: openembedded-core@lists.openembedded.org
From: dev-faha@t-online.de
X-Originating-Location: Kelsterbach, Hesse, DE (80.187.96.109)
X-Originating-Platform: Android Phone Firefox 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 26 Apr 2022 01:13:53 -0700
Message-ID: <dwNG.1650960833949086015.bRfk@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="x0VxJAmLQlEfHDb4jgxn"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 08:14:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164861

--x0VxJAmLQlEfHDb4jgxn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,
since the patch for CVE-2022-24765 (uncontrolled search for git repositorie=
s) arrived we have problems using Git as package source. For some reason gi=
t thinks that the repositories do not belong to the user who is invoking th=
e bitbake command, even though when checking the file permission manually t=
hey seem to be correct:

"fatal: unsafe repository ('...' is owned by someone else)"

So is bitbake using some mechanism (e.g. fake root?) to invoke the git comm=
ands? Is there a workaround to fix this?

--x0VxJAmLQlEfHDb4jgxn
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,<br />since the patch for CVE-2022-24765 (uncontrolled searc=
h for git repositories) arrived we have problems using Git as package sourc=
e. For some reason git thinks that the repositories do not belong to the us=
er who is invoking the bitbake command, even though when checking the file =
permission manually they seem to be correct:<br /><br />"fatal: unsafe repo=
sitory ('...' is owned by someone else)"<br /><br />So is bitbake using som=
e mechanism (e.g. fake root?) to invoke the git commands? Is there a workar=
ound to fix this?&nbsp;

--x0VxJAmLQlEfHDb4jgxn--

