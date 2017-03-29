Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1096A7017D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 20:45:21 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u18so6418354wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 13:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rrAZ5mb0p18yx7HUQkGXZSHVlfwiYvZCNdETyAA2Cb0=;
	b=H2HXdCfPQCRC+7t+YVwY3ZvRtNwq1lpcbShKILvDoqirXYgCEylDkHOK+/tLlUTuyE
	Qou5Gmf0UOELDKadrcq5ny55YaLfflyMgezeQMA6Hy3/u5twKk/c7atDGDCtoYCvlKBF
	qJekLNuWcaWRdTN66yDk8T6HLNd4t8FQH1+Dcq5W+pXNZWgl5TYUYGNZKAdhSrVoeVY+
	bRA2mu8L8LUicNC/dSeoiyvuVmwg3g1Kj0L5aqMpAgpQZqXBLwFKjaIXJ2wxHu7bsCL7
	RIAQKLWhOpBh/rQ8rVXvINvLZll3PD3+g9JeKKMMN0N/poJKD1akHJ3maTCANDNSC1Z3
	wl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rrAZ5mb0p18yx7HUQkGXZSHVlfwiYvZCNdETyAA2Cb0=;
	b=ro7CUAukA90JTsiSUuQ1Xco8ixp6wsI3fdZNi2lotTPjdnZ5pNMILTpxQlf62GPtcP
	CPQRZM1bH5YcaVHRXY1kkB/6MwkTY97IC9QUINcel0T/rJE2wLfnek95IoxpSaabXQVJ
	DfILafpF/3qYsm7PHhdbbzajOgp13IbprCgnRidiz1caTr6qKwHRvBdGYLeqELrXhg0S
	zqrMWkqC7UKGK2Bf3ueljVjmoPqgEOrbcxID9jpB3ExAR0YKJfxVbPOYbQoeVU5wDhhC
	PyMftbIyXLk+wsIt35sYJttmDCTRYDjRDHJbTe4h6hsmZkVKUdvSKDrcMxQUAUVxI1En
	yN/A==
X-Gm-Message-State: AFeK/H0kdessvRiBlNuzLOvKbCj4B2S33f5QNbr1MB9RYisynaZ5yC5Yj2On491B9ZPbOg==
X-Received: by 10.28.52.137 with SMTP id b131mr290735wma.30.1490820322720;
	Wed, 29 Mar 2017 13:45:22 -0700 (PDT)
Received: from ThinkPad-T520.homenet.telecomitalia.it ([95.236.249.99])
	by smtp.gmail.com with ESMTPSA id t85sm491794wmt.23.2017.03.29.13.45.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Mar 2017 13:45:21 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 22:45:17 +0200
Message-Id: <1490820317-3686-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] bitbake.conf: add whoami to HOSTTOOLS
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
X-List-Received-Date: Wed, 29 Mar 2017 20:45:22 -0000

Spotted in log do_compile of linux:

 /tmp/build/tmp-glibc/work-shared/c7x0/kernel-source/scripts/mkcompile_h:
 line 46: whoami: command not found

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 96a9ed9..4f67413 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -462,7 +462,7 @@ HOSTTOOLS += " \
     mktemp mv nm objcopy objdump od patch perl pod2man printf pwd python \
     python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sleep \
     sort split stat strings strip tail tar tee test touch tr true uname uniq \
-    wc wget which xargs \
+    wc wget which whoami xargs \
 "
 
 # Tools needed to run testimage runtime image testing
-- 
2.7.4


