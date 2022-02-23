Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BA3C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 09:08:33 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.5399.1645607311558018826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 01:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pbvuZHbv;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645607309; i=@fujitsu.com;
	bh=8nSXuxPVSQdgQlu8NROmWVy1unVnW51u6Rv7CNb277w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pbvuZHbvZmCSE0chL2ifMhHTnpk2VMCk7LHg9grgfLQ93GPx8U2KS94ep+nbaspvs
	 kDhGh+FKUiuPbDE3YIhXQ/BYckiwkErhVdPfUtX7C95oBEgwcxbp2nUSUjm7m8B953
	 +FEfJuOQngoyQrTjNysTx8iAJvTQk3/CWXN3fRdOz7N+APLveG13W8jZjgnDxcVHac
	 7CqTw3KuNdg/GMLaADKVAg0KS6ko1gjf5kbWqCJuVG/6KhcXhhvNfPlKAyjPyIr2qt
	 qEFLXcZ/ReJC99C4XvJ0JN4fDA+4w0s5xtLJZEAD33Znu0xfOCOQVAm1NOVO0pM3gm
	 lt3D/uTYxlOpQ==
Received: from [100.115.36.74] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id 0F/42-29321-D89F5126;
 Wed, 23 Feb 2022 09:08:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRWlGSWpSXmKPExsViZ8MxRbf3p2i
  SwZaHghZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a3KbMZC25xVrxd85q5gfEGRxcjF4eQwAwm
  iWtT9zBCOCcYJd5+WsHWxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvfvewg9jCArYSE
  zYtBCtnEVCV+PfoHZjNK+Ak8aV1BhOILSGgIDHl4XtmiLigxMmZT1gg5khIHHzxghmiRlFi9u
  VmFgi7QmLWrDamCYy8s5C0zELSsoCRaRWjdVJRZnpGSW5iZo6uoYGBrqGhqa6xia6RoYVeYpV
  uol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJJkZgkKUUK93awbhh1U+9Q4ySHExKoryF
  R0SThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwmn0DygkWpaanVqRl5gADHiYtwcGjJMKr/Qkoz
  VtckJhbnJkOkTrFqCglzvvuB1BCACSRUZoH1waLskuMslLCvIwMDAxCPAWpRbmZJajyrxjFOR
  iVhHnVQKbwZOaVwE1/BbSYCWjxlCwhkMUliQgpqQYm5/9zzQ95NHTsSrh2MXi6wD9pax3e7JK
  0IOGX1h/8jjU9WZGvsC11RWmb4e9rtneuWKYV8nD7lBp9OGOWv+1zfaGYfHTnAW2POWGBr1fc
  nfWeya1k29cCyc6NBfzhHqs+WX+7fuFglZpXVd9UpzUf407sfuQa4NvBFrzrwc5wplrr6yc8e
  zkfiof+Pny8+Mikf4l7C1kYfGSi6qZnzWm1KmewM7Ko0dRQLphcoPDtwqE9N4PkMnbMXvTLrp
  m/opv1uvztfd9ELUvWKgaEpzdkvlnJETrXyph3xQIlt/VCrdWGbaw817JfCU6T0I3q87AW87j
  9WzhZLvSkK9eDGyJanZaBn/ICD33e+UK/UYmlOCPRUIu5qDgRADgySO4tAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-565.messagelabs.com!1645607309!48489!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10487 invoked from network); 23 Feb 2022 09:08:29 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-5.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 09:08:29 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21N98Nev015390
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 09:08:28 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 09:08:22 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] asciidoc: upgrade 10.1.1 -> 10.1.3
Date: Wed, 23 Feb 2022 17:08:13 +0800
Message-ID: <1645607293-28631-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 09:08:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162248

Bugfix:
========
Add missing py files to dist archives
Fix setup.py including packages outside of asciidoc

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../asciidoc/{asciidoc_10.1.1.bb => asciidoc_10.1.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_10.1.1.bb => asciidoc_10.1.3.bb} (94%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb b/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
similarity index 94%
rename from meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb
rename to meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
index 8de827f09e..a922cdf04f 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
                     file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=main"
-SRCREV = "9bb083349e66a6b7195675b04e9adb2d6e21093f"
+SRCREV = "342639edbbc0dcc64354a0291d2214d4d5e65cab"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.25.1


