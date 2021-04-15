Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.3358.1618467689616738370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 23:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PniFr79j;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618467688; i=@fujitsu.com;
	bh=4yQoa48LOqKfNelHisiBhM3anQFpXdjIrU43Azou7m4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PniFr79j5xJyNdKgOpztI2T8ra0GDYoC5J5WeFZA0pAkxCfNUeGfng5SHagV+U9mX
	 hT49ztjYZ7BfzvnOVi697lzcH3gSjPc9xmNtQIhqToEZ3tuOQTSf0xh2/I8c7a9ZtQ
	 ls3rBo/jjf7D+yxYjBjEGVYfcpViDpAuhwTxYlk79zWvO4Ex7EM3gEj9Li1jhJwxy5
	 94gr3JLB1ZyvFxt7VtTntKBKLehOh6n6jFeBnPlvUdN63NR6+VVo5Qx0QoaywLXLWC
	 owyOXjluQUMKY+YsUCiSAZUJAmd707/86OxKqVNUUJK/LjFjdvYLS5baA9pbIWp30W
	 Ko0qc8ta76E+w==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 9E/89-56778-76BD7706; Thu, 15 Apr 2021 06:21:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeJIrShJLcpLzFFi42Kxs+EI0U2/XZ5
  g8PajqsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvHzbE7BSo6KL0eOsDUwnmfvYuTiEBKYxSRx
  aUMbE4Szm1Hi7ZerLF2MnBxsAroS5x6vBari4BAR0JO4+k8UJCwsYCdxoqWPEcRmEVCVOHV3I
  xNICa+Ah0TDXFuQsISAgsSUh++ZQWxeAUGJkzOfgE1kFpCQOPjiBTNIuYSAosTs6fIQ5ZUS26
  edZZzAyDMLSccsJB0LGJlWMZonFWWmZ5TkJmbm6BoaGOgaGhrpGlqa6JqZ6SVW6SbqpZbqlqc
  Wl+ga6iWWF+sVV+Ym56To5aWWbGIEhk9KwSGnHYzvX3/QO8QoycGkJMp7aEVZghBfUn5KZUZi
  cUZ8UWlOavEhRhkODiUJ3sSb5QlCgkWp6akVaZk5wFCGSUtw8CiJ8OqCpHmLCxJzizPTIVKnG
  BWlxHn3giQEQBIZpXlwbbD4ucQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmJfpFtAUnsy8Er
  jpr4AWMwEtrlhVCrK4JBEhJdXAJHXMt+t8KWfWceeHKe0v2mOqgzmzVr5jmf286M6i3smix1j
  OrAy+FMf3g9Fwkt6akpmHX9pM7tIW/RvCxnaZy1d/uqyimOTtUPlYhR9f681qCk5c5J18tKhe
  VV478EVC7yrFX3Nfsl34N3XbU+7ft7czLX03O1nCspbx+oZrT/cpfSnJeJYRwxEU+fydZsXln
  ncSrQ6xgc0iDvnHOzd7B+zSVFUxPfeJs0frrdAvm+3zU+6qcikovkmet/TN30sFU7Yf9XA7G9
  xYyh2y5ciLpKYC9baPsj9E9i384/qA48LNx8EFvcn65q57Dfr1TFqNbRuYWbsnFEw+dZuZQSM
  m8ZD8VSlncZ7iaNb5f+uUWIozEg21mIuKEwFmQgiyGgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-267.messagelabs.com!1618467687!873983!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4189 invoked from network); 15 Apr 2021 06:21:27 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-8.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Apr 2021 06:21:27 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13F6LRWL010108
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 07:21:27 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 07:21:25 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libdazzle: upgrade 3.38.0 -> 3.40.0
Date: Thu, 15 Apr 2021 22:52:35 +0800
Message-ID: <1618498355-53142-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libdazzle/{libdazzle_3.38.0.bb => libdazzle_3.40.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libdazzle/{libdazzle_3.38.0.bb => libdazzle_3.40.0.bb} (88%)

diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.40.0.bb
similarity index 88%
rename from meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb
rename to meta/recipes-gnome/libdazzle/libdazzle_3.40.0.bb
index a2a1aed7bc..ff9088a62f 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.40.0.bb
@@ -12,7 +12,7 @@ inherit gnomebase upstream-version-is-even vala features_check gobject-introspec
 
 DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
 
-SRC_URI[archive.sha256sum] = "e18af28217943bcec106585298a91ec3da48aa3ad62fd0992f23f0c70cd1678f"
+SRC_URI[archive.sha256sum] = "dba99a7e65fa6662c012b306e5d0f99ff3b466a46059ea7aa0104aaf65ce4ba5"
 
 GIR_MESON_OPTION = 'with_introspection'
 
-- 
2.25.1

