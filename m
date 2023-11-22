Return-Path: <tobias.jakobi@compleo-cs.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1218FC61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 10:10:27 +0000 (UTC)
Subject: Re: [Kirkstone] joe editor broken with current ncurses
To: openembedded-core@lists.openembedded.org
From: tobias.jakobi@compleo-cs.com
X-Originating-Location: Dortmund, North Rhine-Westphalia, DE (84.60.164.225)
X-Originating-Platform: Linux Firefox 119
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 22 Nov 2023 02:10:22 -0800
References: <CANNYZj9AN=Eq0DKPeGS-N-XP2=OitMzW6sOcBpH2MUNzugY1hQ@mail.gmail.com>
In-Reply-To: <CANNYZj9AN=Eq0DKPeGS-N-XP2=OitMzW6sOcBpH2MUNzugY1hQ@mail.gmail.com>
Message-ID: <31510.1700647822136703903@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Tvz2qLN14IKzjTaSXBbh"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 10:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191051

--Tvz2qLN14IKzjTaSXBbh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Alex,

thanks for the suggestion. I've imported the ncurses recipe from oe-core/ma=
ster, but the problem remained. It turns out that the CVE patch is what is =
causing the problems here. I read through the Gentoo bugreports again, and =
noticed that one user reported p20230918 to be working. Checking the ncurse=
s commit log it seems like p20230918 includes a fix for the CVE, so additio=
nal patching is unnecessary.

So my current approach is to use p20230918 (https://github.com/ThomasDickey=
/ncurses-snapshots/releases/tag/v6_4_20230918), but drop the CVE patch that=
 the recipe is master applies. This seems to work, i.e. joe and tmux are bo=
th functional again.

Sadly I have no idea which changes one would need to backport to the 6.3 ve=
rsion to fix the issue... :(

P.S.: So oe-core/master does *not* work. master has ncurses 6.4 (no patchle=
vel), plus the patch for CVE-2023-29491.

--Tvz2qLN14IKzjTaSXBbh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Alex,<br /><br />thanks for the suggestion. I've imported the ncurses=
 recipe from oe-core/master, but the problem remained. It turns out that th=
e CVE patch is what is causing the problems here. I read through the Gentoo=
 bugreports again, and noticed that one user reported p20230918 to be worki=
ng. Checking the ncurses commit log it seems like p20230918 includes a fix =
for the CVE, so additional patching is unnecessary.<br /><br />So my curren=
t approach is to use p20230918 (https://github.com/ThomasDickey/ncurses-sna=
pshots/releases/tag/v6_4_20230918), but drop the CVE patch that the recipe =
is master applies. This seems to work, i.e. joe and tmux are both functiona=
l again.<br /><br />Sadly I have no idea which changes one would need to ba=
ckport to the 6.3 version to fix the issue... :(<br /><br />P.S.: So oe-cor=
e/master does *not* work. master has ncurses 6.4 (no patchlevel), plus the =
patch for CVE-2023-29491.

--Tvz2qLN14IKzjTaSXBbh--

