Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1461.1795801782871559888
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ixo2VHW7;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-497614c95f0so4779798f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801781; x=1796406581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=71GsGBGN1M4Bw1UD5oYJEAxZVC0DwtGHum5KI7fzTpg=;
        b=ixo2VHW7eo69pzWcA0cw1kSUsJAsxspDl3QtoNXDNTkrRQYxQaK/sJhp0UQ0TIHxIF
         u9hmxEB8DsiOImUsLgkKlEovs1XQlICYKODoBBGEpmticP0RcSgWMBK3FMsJsSWpelhe
         vg3GnEJZiCoGUId+hpX96WS9H4a/ZA3aJiTkhnr0Uz+A7FjFI3XORJ71cXZHRKjg9a+l
         irM4Bg2ZDydJHbEL8PQ7GBk8SXGbkstXPBukn3qBN1UWVk4rS9vPmJ8N6UjYiEO21JuW
         Y2/5bA8r17f5mIykeg5P+z2ro9BX4+bdy3NXV+z9YjvNu0QAs4mOFJj7SqORdCzG1MB4
         s4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801781; x=1796406581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=71GsGBGN1M4Bw1UD5oYJEAxZVC0DwtGHum5KI7fzTpg=;
        b=i5LUbFveqpJn6Zln36wq8dYinAYhKVPaDHkej624zlWarxpZzbzt6iLsfXdPu2OrDa
         oyVvQEAlR81C2ajnku5dXxvQYZBx4aOuLv2K9j6nbDj1VPfk/LVLAHlS5l3QQzRpPWYL
         l9Q04uuo8d+rgL8Lu78tER8WqcjXtT4Rktct2lTOzRWPeRusc5gL9SoYUBpZYMA9b+Wu
         dQHf8ZcPIE+EqxwGqRe7owp1ljaIQTLcU3D8V7ewQN4LO/trMkQpccTz27RObmaAHMPi
         3wGApunvs4+VXU6R1KGi3BdMVp6Jai/VKABpJtGF4lat7AH1uucJv54Jk7a8FihNt0Ew
         AP4Q==
X-Gm-Message-State: APuU4Z89C5Oj0r8bGtRAuabD1vYqYp42vrWWUxL5iFJuv6LlBkrbTkDx
	WWSu1BHnYzhq94JKPtaxcBwiN/Lf1E9AAQ+L3juFReJD8haF7xF1dz8iIJZBXyodWJBrg+yk1uZ
	vix1p3Qo=
X-Gm-Gg: AZFdTZcwXJJimfogMUHP4RIi7MfUDKKUyAdGqutr4waL20cNDCJTN5fRgwP4j6jWEac
	+FqorSB5RNn8w9ZUUdShsQO7pDsolUePgL08etyPeGKj6XUd2pJg3XS+GLkCEbcFqDZwS1JkEKS
	BO5SVJkImMuYwilP9+qNVjUITFvWAbCtE2vutlBSRp9EApUeSlQODJJ3cxgbhnUG+iQYTVFx4iU
	sJaahVlN5vc1QFrgq6Noa2LzzyTWbzLxlQBhizlWXiJs9qqYhxXgt1I9wQxEhC7hc4V5psYgRTw
	dpTnJ0VzRzcBmJ+TuYz8WaImR7B5rbdeiki6feWtcNhXTqOSj7AxlJAJf2Nd43fAbBxCjvhwVP/
	WsKHzz0BpkVLkOr8CV2SniZcxEFsmpAnymUL/Mgf/fVZ2nXiZHi91C8/Cb296ulDgl8YRQBRYsR
	oZLUEzrLBSBRJvzXVJKk+Ozq30TJF1+qigl48Es+7qTjQjYpVQbz4gwe5dd0BlMnbg6YFjOpmXp
	qLX71N5YPpP3Qgd1KSjGwupnaORkKzMm3sK3k7VLFIcCrdAZgH4Nrm0xMmBwm3khc0olij4acw8
	I625RMbX05B5NI4I2IXhHb0NvRK/StLChKJhicAm5BKbmkR1dM127YSDqPvao6Q2yj9bnaMy4d3
	NmxgndGkirgbaKH9J+JjNRFYLyREo
X-Received: by 2002:adf:e197:0:b0:492:b5d9:feb9 with SMTP id ffacd0b85a97d-4abb3a4d8f7mr44968823f8f.30.1795801781074;
        Fri, 27 Nov 2026 09:49:41 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:40 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/37] sqlite3: fix CVE-2026-119591
Date: Fri, 27 Nov 2026 18:48:56 +0100
Message-ID: <1e3870474c1d4a054916c49bae19d02fc7e04b80.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251419
Content-Type: text/plain; charset="utf-8"

From: Arpit Patel <arpitpa@cisco.com>

This patch applies the upstream fix [1] for stack exhaustion in the
count-of-view optimization. The GitHub mirror commit [1] corresponds
to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/eff50a067c55f972909e7780e506e91382d08de2
[2] https://sqlite.org/src/info/ab621a3e11ee4acc

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119591

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119591.patch      | 40 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch
new file mode 100644
index 00000000000..3162d7af45d
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch
@@ -0,0 +1,40 @@
+From 5dbe255431ad2b935db31e8e3c2c66284e2709ef Mon Sep 17 00:00:00 2001
+From: drh <>
+Date: Mon, 5 Oct 2026 12:18:23 +0000
+Subject: [PATCH] Prevent the expression generated by the count-of-view
+ optimization from getting too deep and causing a CPU stack overflow.
+ [bugs:/info/2026-10-04T05:34:47Z|Bug 2026-10-04T05:34:47Z]
+
+FossilOrigin-Name: ab621a3e11ee4accce14bf6c90a7cc273d9c25a7c3d9dd2466f2bdc2bbbf8084
+
+CVE: CVE-2026-119591
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/eff50a067c55f972909e7780e506e91382d08de2]
+
+Backport Changes:
+- Ported the src/select.c change into the amalgamated sqlite3.c.
+- Omitted manifest and manifest.uuid because they are Fossil metadata
+  and are not needed for this source layout.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 27b3bff8ea..788e23a839 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -149172,6 +149172,10 @@ static int countOfViewOptimization(Parse *pParse, Select *p){
+     }else{
+       pExpr = sqlite3PExpr(pParse, TK_PLUS, pTerm, pExpr);
+     }
++    if( pParse->nErr ){
++      sqlite3ExprDelete(db, pExpr);
++      pExpr = 0;
++    }
+     pSub = pPrior;
+   }
+   p->pEList->a[0].pExpr = pExpr;
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 464d1cf9b03..3befa41c1ca 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119376.patch \
            file://CVE-2026-119371-dependent.patch \
            file://CVE-2026-119371.patch \
+           file://CVE-2026-119591.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
