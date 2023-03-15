Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1138C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 11:09:29 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.5042.1678878562503481223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 04:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=I8P8Bspc;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678878560; i=@fujitsu.com;
	bh=WK3McB1Eqh2WeeXV7U8OnnSk63+bIH2yUUJTGUv5bck=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=I8P8BspcEYLmByF6jVdR43aBI3d9GRKafKPd/nYySd8JCW6yuqWm8aIOb3iZVJU8D
	 REiSpR1R9aSAYQf2+1IsfHTjd+Mp6Yib3j+JczXM+glTIxzDJjvrb3y9PU/hnpR/OX
	 6bMv/NAP4zIMPU3lewGl+ViYl0z1WzGcwC8i3p5azDBLRZlPHUnwfuqAnKsoKnmUC1
	 KRHP3XD+2FxTRFjtO5T8c5Hcl6g2Up2A4chIamPHnmACXFJaSaBXSK9lcwq06xTXeF
	 92C3kIApqFYBASvzhDfPy3/9khIUWS+NFfZEg4WVWhEZz4L7ntfaS2xbmIQ9PLEblx
	 XtMezBFwx4a+w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORpJuwXDD
  FYFkDk8Wdn+/YLe7NX8DmwORxbuMKRo+O39cZA5iiWDPzkvIrElgzGo7aFrznrrh6YyJbA+MO
  ri5GLg4hgY2MEh2rLrFDOEuYJLZP+Qzl7GGUWLBoEksXIycHm4CUxI37/9m6GDk4RAT0JK7+E
  wUJMws4SjTPv88GYgsLGEuse7uAFcRmEVCVODdxLjuIzSvgJDHh0WpGEFtCQEFiysP3zBBxQY
  mTM5+wQMzRlGjd/psdwpaXaN46mxmiXlFi9uVmFgi7QqJx+iEmCFtN4uq5TcwTGAVmIRk1C8m
  oWUhGLWBkXsVoVpxaVJZapGtoqZdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxX
  XJmbnJOil5dasokRGM4pxazHdzDO6vurd4hRkoNJSZT3zxqBFCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvHxLBFOEBItS01Mr0jJzgLEFk5bg4FES4Y2oB0rzFhck5hZnpkOkTjEqSonzti8FSg
  iAJDJK8+DaYPF8iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7zKQKTyZeSVw018BLWYCWsw
  7TwBkcUkiQkqqgalD3OnutELLl0GXctXLLgmUPn+7ac2JU4uN7zupd2q2X1ig92vejJ3V3w8u
  uuUTfurorOrf/cZXn2S0v1z8Q7zIYgOb2Z5z/JzV0h1MrRs4izlqkvcGuqSLFldt2Vj08uTpO
  Vw10x+fsV6g0/Hclmsz14Rw149GCydHffu7avEyDbPlDw//bvKXKde4yu8ymeHr5L3zz/GKTF
  Sxfpbp/ue0o8Wnc017DL+0PLH/+u2n/7Ggqaz3Hr+bLnnlCpsMc/kX6Qgzd0eXyvAzHres7pz
  cJhvVlbfp9NWKTVkMR4+/+fvvZ7+P74zXQcrbZrzuvr76cYxS/uIH1duW6RX+Eb04e/KL6/5W
  zNtXPw72k8t+r8RSnJFoqMVcVJwIAAiiZuZiAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1678878559!54070!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20713 invoked from network); 15 Mar 2023 11:09:20 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 11:09:20 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9AF7E1B1;
	Wed, 15 Mar 2023 11:09:19 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 8FBCD1AE;
	Wed, 15 Mar 2023 11:09:19 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 11:09:17 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>, Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] grep: upgrade 3.8 -> 3.9
Date: Wed, 15 Mar 2023 19:09:01 +0800
Message-ID: <1678878545-19387-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178535

From: Upgrade Helper <uh@not.set>

Bug fixes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  With -P, some non-ASCII UTF8 characters were not recognized as
  word-constituent due to our omission of the PCRE2_UCP flag. E.g.,
  given f(){ echo Per=C3=BA|LC_ALL=3Den_US.UTF-8 grep -Po "$1"; } and
  this command, echo $(f 'r\w'):$(f '.\b'), before it would print ":r".
  After the fix, it prints the correct results: "r=C3=BA:=C3=BA".

  When given multiple patterns the last of which has a back-reference,
  grep no longer sometimes mistakenly matches lines in some cases.
  [Bug#36148#13 introduced in grep 3.4]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/grep/{grep_3.8.bb =3D> grep_3.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/grep/{grep_3.8.bb =3D> grep_3.9.bb} (94%)

diff --git a/meta/recipes-extended/grep/grep_3.8.bb b/meta/recipes-extended/grep/grep_3.9.bb
similarity index 94%
rename from meta/recipes-extended/grep/grep_3.8.bb
rename to meta/recipes-extended/grep/grep_3.9.bb
index be2caaa920..3c39a5fb56 100644
--- a/meta/recipes-extended/grep/grep_3.8.bb
+++ b/meta/recipes-extended/grep/grep_3.9.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI =3D "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[sha256sum] =3D "498d7cc1b4fb081904d87343febb73475cf771e424fb7e6141aff66013abc382"
+SRC_URI[sha256sum] =3D "abcd11409ee23d4caf35feb422e53bbac867014cfeed313bb5f488aca170b599"
 
 inherit autotools gettext texinfo pkgconfig
 
-- 
2.34.1


