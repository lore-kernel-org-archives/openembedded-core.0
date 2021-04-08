Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web08.4157.1617862163990816345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 23:09:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VLUjSA5s;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617862162; i=@fujitsu.com;
	bh=P4FwKojdnQS+3hNUiOQ9VXe/eeviBpJLCHobjklyy7Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VLUjSA5sDACKL99Yh+XWO7VR7i/+e/WvJ+JYUTltOMaOIjL9ai5B530NxCBOkfGgP
	 L8sUnLdqm55GDdU3cPl87XBTfrKhzMLVYljWCHHIPZv6Y4pyTJbLTPPdWKRyvzUfnn
	 13DtKByZRaJWuNMECtmxIMKTGr/k5SA1jH4pukxtMXTlHsmGc8S/8YhbVtpFa6PjCe
	 +h4zmhJymJ97Uk+nP0g1C+lkOv1xLqPSDPMY2k5jAPGPufauyb/mIpXt5VltEwklJp
	 Nd6gkl/kz9RN9mdCx5VwAHp8au5Rdlbdtdl6TfIOCbSO5CSOU2PnhW20YCyqAtaXWW
	 Tl4t38dWaB8tA==
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id A7/1D-41911-21E9E606; Thu, 08 Apr 2021 06:09:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRqis4Ly/
  BYNJHM4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePx4e1sBXfYK35NPMrWwPiXrYuRi0NIYAuT
  xJelh9khnOOMEidXf2LqYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv3vYQWxhAQuJ8
  48ugJWzAMU3PHjGAmLzCjhKXH00B6xGQkBBYsrD98wgNqeAk8SN7+fBaoSAap6vecQKUS8ocX
  LmExaI+RISB1+8YIboVZSYfbmZBcKukuj8cJxtAiP/LCQts5C0LGBkWsVomVSUmZ5RkpuYmaN
  raGCga2horAskjQ30Eqt0E/VSS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgQGZUsjQtIPx
  3asPeocYJTmYlER5syblJQjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4O2fC5QTLEpNT61Iy8wBR
  gdMWoKDR0mEt2w2UJq3uCAxtzgzHSJ1ilFRSpz3yByghABIIqM0D64NFpGXGGWlhHkZGRgYhH
  gKUotyM0tQ5V8xinMwKgnz7geZwpOZVwI3/RXQYiagxSUHc0EWlyQipKQamE69m/JIVtkol+s
  R89PuKR2ie+JdqmUUbk497XPu5zY383vqL/8vLVsf4nZjteBewdmPc+0iD4hrCM9mWDGb82ut
  tYXix2vtvnMKGDb8eWvf0ZB07l7dzOpTlgULrG6fevMpSHU9V62qf3rGF2c5pUi7DNsb81bFb
  F4kEXz24yK90m+H5+lLRJ+sqco7//3MPL1OS/mT+11XPt5iuohPdgI/d4aV9d8D968wfXxxd4
  3FY/WGmQdn/09OSRY/mp4hnaqxQ5/lzB8BnbDkIzbnXVJC7s3KSZWsemLwLmj6lvyU0lki6ks
  PrtznvDzL/WLkqiuiNXF/rj73Xb5m02b2zR5LfGTibp9+Vfv8zn5ZrgtKLMUZiYZazEXFiQBI
  eiAXQwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-232.messagelabs.com!1617862161!1010203!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23370 invoked from network); 8 Apr 2021 06:09:21 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-4.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 06:09:21 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13869Ld0006343
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Apr 2021 07:09:21 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 07:09:19 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libportal: upgrade 0.3 -> 0.4
Date: Thu, 8 Apr 2021 14:09:04 +0800
Message-ID: <1617862144-5153-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617862144-5153-1-git-send-email-wangmy@fujitsu.com>
References: <1617862144-5153-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libportal/{libportal_0.3.bb => libportal_0.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libportal/{libportal_0.3.bb => libportal_0.4.bb} (92%)

diff --git a/meta/recipes-gnome/libportal/libportal_0.3.bb b/meta/recipes-gnome/libportal/libportal_0.4.bb
similarity index 92%
rename from meta/recipes-gnome/libportal/libportal_0.3.bb
rename to meta/recipes-gnome/libportal/libportal_0.4.bb
index bc4ff3784c..03e681f58c 100644
--- a/meta/recipes-gnome/libportal/libportal_0.3.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.4.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SRC_URI = "git://github.com/flatpak/${BPN}.git;protocol=https"
-SRCREV = "a609e06d0c4adc5c510cf9ac7b060db3d368e78f"
+SRCREV = "f68764e288ede516d902b131cc4fadded3804059"
 S = "${WORKDIR}/git"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
-- 
2.25.1

