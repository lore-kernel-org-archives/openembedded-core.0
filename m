Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A27C7885C
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 13:06:07 +0000 (UTC)
Subject: Re: [PATCH] glibc: stable 2.40 branch updates
To: openembedded-core@lists.openembedded.org
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 25 Sep 2024 06:06:02 -0700
References: <CAMKF1soqCDcC3VKcR9tGV8dPpfByxv-s=UKAmtZDJ-6BrdRkgw@mail.gmail.com>
In-Reply-To: <CAMKF1soqCDcC3VKcR9tGV8dPpfByxv-s=UKAmtZDJ-6BrdRkgw@mail.gmail.com>
Message-ID: <20211.1727269562780495516@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="szQN1BjpcDkYi7EGuKu2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 13:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204952

--szQN1BjpcDkYi7EGuKu2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Testing was done and below are the results
*After update
* PASS - 4945
FAIL - 224
XPASS - 4
XFAIL - 16
UNSUPPORTED - 229

*Before update
* PASS - 4924
FAIL - 223
XPASS -4
XFAIL - 16
UNSUPPORTED - 229

Below is the new failure:
FAIL: malloc/tst-free-errno

--szQN1BjpcDkYi7EGuKu2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Testing was done and below are the results<br /><strong>After update<br =
/></strong><span style=3D"background-color: var(--light-mode-body-color);">=
PASS - 4945<br /></span>FAIL - 224<br />XPASS - 4<br />XFAIL - 16<br /><spa=
n style=3D"background-color: var(--light-mode-body-color);">UNSUPPORTED - 2=
29</span></p>
<p><strong><span style=3D"background-color: var(--light-mode-body-color);">=
Before update<br /></span></strong><span style=3D"background-color: var(--l=
ight-mode-body-color);">PASS - 4924<br /></span><span style=3D"background-c=
olor: var(--light-mode-body-color);">FAIL - 223<br /></span><span style=3D"=
background-color: var(--light-mode-body-color);">XPASS -4<br /></span><span=
 style=3D"background-color: var(--light-mode-body-color);">XFAIL - 16<br />=
</span><span style=3D"background-color: var(--light-mode-body-color);">UNSU=
PPORTED - 229</span></p>
<p><span style=3D"background-color: var(--light-mode-body-color);">Below is=
 the new failure:<br /></span><span style=3D"background-color: var(--light-=
mode-body-color);">FAIL: malloc/tst-free-errno</span></p>

--szQN1BjpcDkYi7EGuKu2--

