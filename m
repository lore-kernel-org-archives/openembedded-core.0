Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0ECFC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 11:11:39 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.5084.1678878698690929904
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 04:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=VatnkaLl;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678878697; i=@fujitsu.com;
	bh=WK3McB1Eqh2WeeXV7U8OnnSk63+bIH2yUUJTGUv5bck=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=VatnkaLlBQsq4vjIdAM4FyppiAL/nnUY+7A2OoB10iyCLKyvPj0nc6PumJknFfsh3
	 ryOCwJiAacTnPHj/HNTtW40cVs3u6muuxtw+WORHFSQ+ATtbeYfLh7FawJtXIA2tIK
	 hPtRIw0WzXmKmDu0k2WedoG1BylXd3mAniUxhCBVvRIEZwhThqJZJWERbdEwVZYjAg
	 jP929cbDvNTGr38pCuN9TJd8AFm3IwxJrBRQ+QlTAJZBw7H369zkMFOdM5nCbbYCjl
	 Qe6mD5+CBl3ROLlgRWn8xJNcsocx+ygcLiwgC+FpU2AF0mxD5TyZmB2nk3nh0WCOC1
	 BO3GODXBtCKjg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8ORqPtiuWC
  KwcMXahZ3fr5jt7g3fwGbA5PHuY0rGD06fl9nDGCKYs3MS8qvSGDNaDhqW/Ceu+LqjYlsDYw7
  uLoYuTiEBLYwSnw/cpAdwlnOJPH76WrmLkZOIGcPo8SlFywgNpuAlMSN+//Zuhg5OEQE9CSu/
  hMFCTMLOEo0z7/PBmILCxhLrHu7gBXEZhFQlbjy4DXYGF4BJ4mnCz+CxSUEFCSmPHwPFReUOD
  nzCQvEHE2J1u2/2SFseYnmrbOZIeoVJWZfbmaBsCskGqcfYoKw1SSuntvEPIFRYBaSUbOQjJq
  FZNQCRuZVjKbFqUVlqUW6RnpJRZnpGSW5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5
  yTkpenmpJZsYgaGcUszWvYNxfe9fvUOMkhxMSqK8f9YIpAjxJeWnVGYkFmfEF5XmpBYfYpTh4
  FCS4OVbIpgiJFiUmp5akZaZA4wrmLQEB4+SCG9EPVCat7ggMbc4Mx0idYpRUUqcV3AZUEIAJJ
  FRmgfXBovlS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeS+BTOHJzCuBm/4KaDET0GLeeQI
  gi0sSEVJSDUwPxRdMP6P4pPzj5PPLVuh5RWyXcDU8efjOek7+qoRJs1d9n15SdiE6eJ/f/4Qz
  ZexHb/Xo+Zw8/NhXwUCi9/SB4+vuxKrqsWqJduR/+9jSnHMr9k7LPnm936KdHLON9D6+02ZVa
  r+hw2Yb1lcptKv2+Aezuv8R8zZtPO2o90g5/9jiyjVrvHPTq5fb1b5jnP3on9ml98rMsiq+Xk
  uqF/dqRaw2Tchlyqi4fMcnpE3SN0+49sTc6c8vVeZu8JDJc9zHnVDPcWneNb8VUhXZb/vPHFz
  8paFl96Nfyxn1ZT+2XGYQKHpR90BHp/fYsQvTt+ZYdh48V8PDs36tyFvturNvzktMzVo7/aXT
  9m+fVu9XYinOSDTUYi4qTgQANN3/LGADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-585.messagelabs.com!1678878696!105151!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5537 invoked from network); 15 Mar 2023 11:11:36 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 11:11:36 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3FAC81001A7;
	Wed, 15 Mar 2023 11:11:36 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 33D0D1001A4;
	Wed, 15 Mar 2023 11:11:36 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 11:11:34 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>, Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] grep: upgrade 3.8 -> 3.9
Date: Wed, 15 Mar 2023 19:11:19 +0800
Message-ID: <1678878683-19486-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178540

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


