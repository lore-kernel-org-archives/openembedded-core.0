Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1391D776C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 23:35:51 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id 141so643037pgd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tTirVID8d6RkiPv99Y9qiP98qOaH2EGXr2+4Zq5iGuI=;
	b=i267KVGWDbyNULrbtTbXRL+wMZvXBrTmKeCCcpkTQxsUuJKAqctWytXpuRygSzjrxR
	jL6sr+/uFR5UYCfl5qjfrN2MrEFKNiJnKN3GctILXvaKZCft6hq5h/pW2XY3TyBYXMLz
	4CJXwEkM9UERKIe1HElq/MqX73IWcYDD/t6dOjt1qji+qWUS8RarNHHVdbfYQxFk14bI
	egcXtD4mBTmD/H9tVQWk6neGlBT7SI596QM8DEpeOL63nj9liSgi52sc3iJwjDiOhWUc
	MxjyKqudPfzsceq39JIShCOXLzy0bDcC+fZeaGN0LbVP+hQmctsMkP33TI9eE8fTvUu2
	fCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tTirVID8d6RkiPv99Y9qiP98qOaH2EGXr2+4Zq5iGuI=;
	b=tDMgc26P67hVtUzQSGyHxHH/5l6E1En/ddRlEh+ukv9rvTFxQJdxpQJhosZUz+YZlV
	LAnY7hxZ0SS89n/nCay60o3EiIoGrnToXG4j9pv7qE6BLTpdXzuPifbaeRzLz+CiIwed
	xqoGNovk7wh59U+YPPcUDLtMwVERbOUho/7dvxeK/JyGb4B6W6Jafu8CoqnoHxJUCVTH
	q5w5zItt+YfA53s/3LZOoaq1QJz7XtFITlpIv3N9rUqE1d401cUI+m+Cocyu7Cfj0qoK
	4G9BeTy2YI38ptj/oK8uQ9wbHhi2114afigo9GY4t2Frb8S1UIO8hcjD4z0mR3otgGIj
	vXAA==
X-Gm-Message-State: AFeK/H3T9vtEcO9GNpQsg20jY7Kw+rx2tYJ3IHcq/PtvmVDwrJzkdaNJIRdSGvP2MmXQRg==
X-Received: by 10.99.36.5 with SMTP id k5mr252585pgk.201.1489534552804;
	Tue, 14 Mar 2017 16:35:52 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 73sm124094pfh.56.2017.03.14.16.35.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Mar 2017 16:35:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 16:35:30 -0700
Message-Id: <627df96431a66a631222f2c8cae0fd2cad5bb12f.1489534345.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1489534345.git.raj.khem@gmail.com>
References: <cover.1489534345.git.raj.khem@gmail.com>
Subject: [PATCH 3/6] go: Fix packaging for target go
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
X-List-Received-Date: Tue, 14 Mar 2017 23:35:52 -0000

We need all packaging tasks when building
go for target

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go.inc | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/go/go.inc
index 0b0cbf19ad..5ccbf73e23 100644
--- a/meta/recipes-devtools/go/go.inc
+++ b/meta/recipes-devtools/go/go.inc
@@ -74,12 +74,6 @@ do_install_class-cross() {
 		install -m755 $f ${D}${bindir}
 	done
 }
+do_package_qa[noexec] = "1"
 
-INSANE_SKIP_${PN} += "staticdev"
 RDEPENDS_${PN} += "perl"
-
-do_package[noexec] = "1"
-do_packagedata[noexec] = "1"
-do_package_write_ipk[noexec] = "1"
-do_package_write_deb[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
-- 
2.12.0


