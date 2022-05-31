Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420ACC433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 08:29:56 +0000 (UTC)
Subject: Re: [kirkstone][PATCH v2] libpcre2: upgrade 10.39 -> 10.40
To: openembedded-core@lists.openembedded.org
From: "Davide Gardenal" <davidegarde2000@gmail.com>
X-Originating-Location: Mesero, Lombardy, IT (87.12.122.122)
X-Originating-Platform: Linux Firefox 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 31 May 2022 01:29:55 -0700
References: <20220531082603.11954-1-davide.gardenal@huawei.com>
In-Reply-To: <20220531082603.11954-1-davide.gardenal@huawei.com>
Message-ID: <8694.1653985795705658654@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Yk7G8pfpfxC22ynUm6kr"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 08:29:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166306

--Yk7G8pfpfxC22ynUm6kr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

After a bit of research I found out that the commit that fixes CVE-2022-158=
7 (https://github.com/PCRE2Project/pcre2/commit/03654e751e7f0700693526b67df=
cadda6b42c9d0) is not directly applicable to .39, it needs a compiler updat=
e (https://github.com/PCRE2Project/pcre2/commit/dea56d2df94546c23021a42d939=
5f2333589f01e), this is a very substantial update. Looking at Fedora and De=
bian they updated the .40 too.

Hope it helps,

Davide

--Yk7G8pfpfxC22ynUm6kr
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

After a bit of research I found out that the commit that fixes CVE-2022-158=
7 (https://github.com/PCRE2Project/pcre2/commit/03654e751e7f0700693526b67df=
cadda6b42c9d0) is not directly applicable to .39, it needs a compiler updat=
e (https://github.com/PCRE2Project/pcre2/commit/dea56d2df94546c23021a42d939=
5f2333589f01e), this is a very substantial update. Looking at Fedora and De=
bian they updated the .40 too.<br /><br />Hope it helps,<br /><br />Davide

--Yk7G8pfpfxC22ynUm6kr--

