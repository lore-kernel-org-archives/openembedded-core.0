Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.9245.1619078069615912986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 00:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XK347Ak3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619078067; i=@fujitsu.com;
	bh=dFUNCF0Ky4EbYLwIiuUA36PCiErRlBFfhX8NhJjGfFI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XK347Ak3nEBsEAgHuNOQ1OlIQZ2Emjk1/jLvpwx2vwTPkYZdY4T9B3noVQN2F17rf
	 MvWgbqfd5uezkxTDhgQkTj3bsAEv+mlHxpScE1xuI/tQ4GJdTjXWAis6QEbxvcSTDt
	 GjcBCsZQnkWl0/MhdtBbc6AINfwYDF++r9WD5j1eJUyd7kUCTEBVVmYfA6AqcIIXJM
	 50+LGY7TINTby3QzY7arnOs9RHu3AlrNuASyKPFKLuCWg4wwlLpPYSZtxKmn9k7SLq
	 21Dzgn0LTn6pfxHBQr9hdN4QIWpckUnhYiL8UbEBVFOqV9IoECUSwdfIgijzROCCI9
	 ktmOCs7oG1usA==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 4B/95-60958-3BB21806; Thu, 22 Apr 2021 07:54:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxRXezdmO
  CQcdZNos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPTrF/MBW1cFSd/NjI3ME7j7GLk4hASmMUk
  cWxaKxOEc5xR4sOSvYxdjJwcbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHidw87iC0s4Cpx+
  vcTJhCbRUBVYsv0j8wg5bwCjhJ7n6mChCUEFCSmPHzPDGJzCjhJrDt9hQmkRAioZOHhUJAwr4
  CgxMmZT1ggpktIHHzxghmiVVFi9uVmFgi7UqJz/QLGCYz8s5C0zELSsoCRaRWjRVJRZnpGSW5
  iZo6uoYGBrqGhka6hpYWukaGpXmKVbpJeaqlueWpxia6hXmJ5sV5xZW5yTopeXmrJJkZgKKYU
  HLu+g/Hq6w96hxglOZiURHkX8jUmCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgfaEFlBMsSk1Pr
  UjLzAHGBUxagoNHSYTXHiTNW1yQmFucmQ6ROsWoKCXOuxokIQCSyCjNg2uDxeIlRlkpYV5GBg
  YGIZ6C1KLczBJU+VeM4hyMSsK8lzWBpvBk5pXATX8FtJgJaLH2lFqQxSWJCCmpBqY9/F28r66
  /S9q74vYuzqnR2tuEOcsP/boUeP3C862HZv4/c0jxxM9MAZGl7b6nrY5H7NdSeqXz63XLlL3m
  +09J5k/bqnG/Lz3scPSnlu55J67F7RSM3/7qy8P85W+TbddNvyw/ve33lQ1BU1n27a9JX9TGc
  tOYKXKebeexzpuBr1fNjJtknx98srtFPiHY7Jnzpc9PNpk/P7amyubs/Xv2GU8Ez/b/c1kuZj
  H3F/d2J4vCvLrqPbPv8VfdK4nZ8KvLQ8TiYW+lkPKlDVWWHh031CSPLFq+f/m7rqsyno+OzfC
  bs5EtStV8y0JN3zvc9xef6pDVvBp4ai7Xfi6vTQ4vg733l74WcZMrW/pzxbplLEosxRmJhlrM
  RcWJAJugTXBAAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-291.messagelabs.com!1619078066!1576355!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4616 invoked from network); 22 Apr 2021 07:54:27 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-6.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 07:54:27 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M7sQDd019244
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 08:54:26 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 08:54:24 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cython: upgrade 0.29.22 -> 0.29.23
Date: Thu, 22 Apr 2021 15:54:05 +0800
Message-ID: <1619078047-5587-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1619078047-5587-1-git-send-email-wangmy@fujitsu.com>
References: <1619078047-5587-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.22.bb => python3-cython_0.29.23.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.22.bb => python3-cython_0.29.23.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 0e6bac06a7..04fd2ec2b7 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "df6b83c7a6d1d967ea89a2903e4a931377634a297459652e4551734c48195406"
+SRC_URI[sha256sum] = "6a0d31452f0245daacb14c979c77e093eb1a546c760816b5eed0047686baad8e"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.22.bb b/meta/recipes-devtools/python/python3-cython_0.29.23.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.22.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.23.bb
-- 
2.25.1

