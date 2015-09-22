Return-Path: <marcus.mueller@ettus.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3EF4D76DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 17:45:11 +0000 (UTC)
Received: by obbbh8 with SMTP id bh8so13845835obb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 10:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NmERh06s9rH7iEYz+NJ6ztweN4S4u7OdbkIBUcX3ul0=;
	b=mhvTv3Yi5m5mDYDCCpj7zPsDeCw5b85wEXQoka7vxzazF57CzUQ+tW7P2P2QPJIW/t
	IuHoJ5GwqcqbBm0nmcaUBqhbfy4lRQf0rTSGOKJVjzKpvAXPSlegbj8panzae7EfDaIF
	xH9fM8Oq2AMDHemNoWL2GMtx7Ej+E0ddbVY3rqnOfugX+M6OjHmLI+QV2WJosAymsQg5
	2RQEaO6SpM00YgdLOpB6+x5+VH8BX5dlytFBG2lfTPz5eABhM2bAT099EJsWnjE9RUuM
	8zsl0pAMWNGNSvdNPw//pKlZWoZ84AJgVdtYp11WI9rOxLOuS/j1mnoUz2LuDM7M/xu5
	81rA==
X-Gm-Message-State: ALoCoQkbzBIfjBbVM6wOcpVER3Sg8eMaWOu8/lZVN2W8bQBjcjvelOZSJGLJ7RiBkBXZX9zxgHnO
X-Received: by 10.60.63.103 with SMTP id f7mr6764489oes.5.1442943911630;
	Tue, 22 Sep 2015 10:45:11 -0700 (PDT)
Received: from workhorse.natinst.com (x5f71d3b0.dyn.telefonica.de.
	[95.113.211.176]) by smtp.gmail.com with ESMTPSA id
	s139sm1294709oie.12.2015.09.22.10.45.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 10:45:10 -0700 (PDT)
From: =?UTF-8?q?Marcus=20M=C3=BCller?= <marcus.mueller@ettus.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 19:44:35 +0200
Message-Id: <1442943875-2955-1-git-send-email-marcus.mueller@ettus.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH] hand the TEMPLATECONF local over to setup-builddir
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
X-List-Received-Date: Tue, 22 Sep 2015 17:45:12 -0000

---
 oe-init-build-env | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index 6fee5f7..b7e2918 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -45,7 +45,7 @@ fi
 OEROOT=`readlink -f "$OEROOT"`
 export OEROOT
 . $OEROOT/scripts/oe-buildenv-internal && \
-     $OEROOT/scripts/oe-setup-builddir && \
+     TEMPLATECONF="$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir && \
      [ -n "$BUILDDIR" ] && cd "$BUILDDIR"
 unset OEROOT
 unset BBPATH
-- 
2.4.3


