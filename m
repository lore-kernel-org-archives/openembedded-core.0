Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id AC425781F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:46:35 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id r66so5174341qke.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=xwROBLzK8vHUIFmZEwEKlXO6kcyKmTTliGMMbHSyKis=;
	b=sbhCJC5KCzsIYTOE8lMeeOl9gkkMSV02qNwFmKLVWvR0DxPvvvifk+5R6+5VAIgyyN
	FuXb6WjySYj3haRYfCSPIb+FBsh0SrXCD78YALZ+Q+Tz21Ax5A6V2G6jMB8SxvYV8s2d
	hoFGaBVNvYgZEQB/7qx0wMc/HO566E9UmeMFC4MpXWHmx3b7UrnuKQFjMPieYqxhiPas
	JQNO5XLQeSoRxzVyoCoBaM9fl/9lsaNLRm8bf2Btku/b1H9H0O49ae/70Vocp1bozgdX
	kAlXRaXa01RXgZROfSJZB8I/eRtmyZP6auayQ4+NQVFl6j2PthZOtkJBfu8TX8nKn2uy
	X/Og==
X-Gm-Message-State: AHPjjUj0SvELc9BtqBKsXpD4bfBfpkRuvdEVRX7f2bMFj7Sg7refoaI7
	8CjpSPWfvdu2oeRt
X-Google-Smtp-Source: AOwi7QAy5a6RJGDtVBy2W8AW/CGn3DqmVCEQL1gpKpn4jNTb6RETb7BkKkfxAI56dUDZam3zyckoKg==
X-Received: by 10.55.136.134 with SMTP id k128mr15557293qkd.38.1505133996544; 
	Mon, 11 Sep 2017 05:46:36 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	d42sm6083820qta.17.2017.09.11.05.46.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:46:35 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:46:30 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:37 -0300
Message-Id: <20170911124558.2863-6-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 05/26] goarch.bbclass: Add support for ARMv5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Sep 2017 12:46:35 -0000

This adds support to return the proper ARMv5 format.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5: None
Changes in v4:
- rebase on top of new "goarch.bbclass: Replace logic for setting
  GOARM"

Changes in v3: None
Changes in v2: None

 meta/classes/goarch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 0f0d8b6a60..0c22f80518 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -50,6 +50,8 @@ def go_map_arm(a, f, d):
             return '7'
         elif 'armv6' in f:
             return '6'
+        elif 'armv5' in f:
+            return '5'
     return ''
 
 def go_map_os(o, d):
-- 
2.14.1


