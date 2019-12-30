Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8692A7F94F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 21:10:08 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id q127so18591569pga.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 13:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1TAcePrFLHYXWx00aB0ltnePs7Lo9NisDxlMGVcf8ak=;
	b=u7vmB74JFXbH3/nuAfx+KO9OzteywCpKTrLbCzOYTsd24++HZOkRDSF5t1/cUPRJ5d
	T4BfbySpGgIo21pP9z3t0y8ZolG/UvxytE6kIIPtqGr+ztZHKWW14AUhBBva9y3Tqdi0
	FR+py3QzWVpK9S2uVrVlcJ3C5JszkZtMnWxG0cCeSeDwnDYtpLXvYwVUhTg2t2fMhXCd
	tRWeLzIBmIOGOXULOzUo600u0G6q1F+dx2oTLZ6Has8Z25ymufDEN8vXRuN1Yhlqxyvp
	ukiwT+U3wYqzBdRqI6h+Gq+axJrzoNs3HJTXHMXN5s6eu/YAdzl+xRjmQUFYiTwxWIpp
	KwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1TAcePrFLHYXWx00aB0ltnePs7Lo9NisDxlMGVcf8ak=;
	b=knYHoCOxqlEXMzedOnm3qtXmnrm+ZdWeVKMiYvJNHg/COiMKTpZtsSe90YkMwdjt0H
	BrPv2PAqnTc/azNxR7tIfL1Z2x1X7ns8OWpi/PkDYSCC79voyXvl65LtWtv4le+w6EAR
	EvYtbhzbs/lUJUBadgeQibzWMP0GgNJ/noesG2oST21qF1aOB3Z8mN7XjatKqlcVHuF3
	fvPQrUaygaBpHJb1FJJzZ56QBM7P5H95+qZuoo4QCBt5jU7uYx2jSO/WK3kvERIcv1EO
	Sgb7IbiCD/NyvVnEgnv0UjDPMauCAyIB7xJMGPtKpB+z0+cE2KaooXy5PyNCBxv5zwXq
	txeQ==
X-Gm-Message-State: APjAAAWgM5I/S//M6+2oCODRJeMahslrw2Uyo/xGLYsRV8Uddjx5P6Gq
	Myv28Bak/CDPCkStjgT4HRoPLeAhEqM=
X-Google-Smtp-Source: APXvYqxpX4V1ZjYVwZBW7FbIcCRP7DiRLsZnuNzvNJA/vAHB7CIUnNJoAu42pvIV3wT7bF3zFhc5ag==
X-Received: by 2002:a62:1883:: with SMTP id 125mr71971207pfy.166.1577740209294;
	Mon, 30 Dec 2019 13:10:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	f23sm48727174pgj.76.2019.12.30.13.10.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 13:10:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Dec 2019 13:10:03 -0800
Message-Id: <20191230211003.2625107-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] lttng-ust: Turn examples into a packageconfig
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
X-List-Received-Date: Mon, 30 Dec 2019 21:10:09 -0000
Content-Transfer-Encoding: 8bit

examples are unbuildable in some cases, see [1]
this helps in making them optional via the newly addded
configure option in 2.11 release

[1] https://bugs.lttng.org/issues/1132
[2] https://patchwork.ozlabs.org/patch/832106/

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb
index 6d7c05e65e..0e03a31652 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.11.0.bb
@@ -36,6 +36,7 @@ SRC_URI[sha256sum] = "683280cfe5e12021e64c32cef9eeb0128f1f23dec32ba28adb5a2074be
 
 CVE_PRODUCT = "ust"
 
+PACKAGECONFIG[examples] = "--enable-examples, --disable-examples,"
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 PACKAGECONFIG[python3-agent] = "--enable-python-agent ${PYTHON_OPTION}, --disable-python-agent, python3, python3"
 
-- 
2.24.1


