Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDA8CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 08:06:09 +0000 (UTC)
Subject: Re: [scarthgap 09/11] glibc: fix CVE-2025-8058
To: openembedded-core@lists.openembedded.org
From: "Wang, Jinfeng (CN)" <Jinfeng.Wang.CN@windriver.com>
X-Originating-Location: CN (60.247.85.88)
X-Originating-Platform: Linux Chrome 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 26 Sep 2025 01:06:02 -0700
References: <c2b63f171719e2b1c12ba049cbe776adf9e0244b.1753910853.git.steve@sakoman.com>
In-Reply-To: <c2b63f171719e2b1c12ba049cbe776adf9e0244b.1753910853.git.steve@sakoman.com>
Message-ID: <21409.1758873962886905830@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Jc1P48EtOYRtHWUmvpb0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 08:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224062

--Jc1P48EtOYRtHWUmvpb0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

With this patch, after I add INHERIT +=3D "buildhistory" in conf/local.conf=
, I found the following build errors:
ERROR: glibc-2.39+git-r0.wr2413 do_packagedata: QA Issue: Package version f=
or package ldconfig went backwards which would break package feeds (from 0:=
2.39+git0+cff1042cce-r0.wr2408.0 to =C2=A0 0:2.39+git0+b027d5b145-r0.wr2413=
.0) [version-going-backwards]
ERROR: glibc-2.39+git-r0.wr2413 do_packagedata: QA Issue: Package version f=
or package ldd went backwards which would break package feeds (from 0:2.39+=
git0+cff1042cce-r0.wr2408.0 to 0:2.39+git0+b027d5b145-r0.wr2413.0) [version=
-going-backwards]
ERROR: glibc-2.39+git-r0.wr2413 do_packagedata: QA Issue: Package version f=
or package ldso went backwards which would break package feeds (from 0:2.39=
+git0+cff1042cce-r0.wr2408.0 to
I found in the buildhistory.bbclass, bb.utils.vercmp((pkge, pkgv, pkgr), (l=
ast_pkge, last_pkgv, last_pkgr)) will compare the version, the hash is part=
 of the version.
The commit(d9b992de0da6be8e9bc26c39c4e5aa7bb9c2049e) in oe-core glibc, upgr=
ade from cff1042cce to b027d5b145. c < b, so it is thought as version-going=
-backwards. How to deal with this situation?

Regards,
Jinfeng

--Jc1P48EtOYRtHWUmvpb0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi all,</div>
<div>&nbsp;</div>
<div>With this patch, after I add INHERIT +=3D "buildhistory" in conf/local=
.conf, I found the following build errors:<br />&nbsp; ERROR: glibc-2.39+gi=
t-r0.wr2413 do_packagedata: QA Issue: Package version for package ldconfig =
went backwards which would break package feeds (from 0:2.39+git0+cff1042cce=
-r0.wr2408.0 to &nbsp; 0:2.39+git0+b027d5b145-r0.wr2413.0) [version-going-b=
ackwards]<br />&nbsp; ERROR: glibc-2.39+git-r0.wr2413 do_packagedata: QA Is=
sue: Package version for package ldd went backwards which would break packa=
ge feeds (from 0:2.39+git0+cff1042cce-r0.wr2408.0 to 0:2.39+git0+b027d5b145=
-r0.wr2413.0) [version-going-backwards]<br />&nbsp; ERROR: glibc-2.39+git-r=
0.wr2413 do_packagedata: QA Issue: Package version for package ldso went ba=
ckwards which would break package feeds (from 0:2.39+git0+cff1042cce-r0.wr2=
408.0 to&nbsp;</div>
<div>I found in the buildhistory.bbclass, bb.utils.vercmp((pkge, pkgv, pkgr=
), (last_pkge, last_pkgv, last_pkgr)) will compare the version, the hash is=
 part of the version.<br />The commit(d9b992de0da6be8e9bc26c39c4e5aa7bb9c20=
49e) in oe-core glibc, upgrade from cff1042cce to b027d5b145. c &lt; b, so =
it is thought as version-going-backwards. How to deal with this situation?<=
/div>
<div>&nbsp;</div>
<div>Regards,</div>
<div>Jinfeng</div>

--Jc1P48EtOYRtHWUmvpb0--

