Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1459.1795801780983245857
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Y0a+Dvmk;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e47347279so5123195f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801779; x=1796406579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=30l1pg8BbFdGgTu6YtqLqpW4fpV5Flrv4r8v9Of03+s=;
        b=Y0a+DvmkIi1bQcWHSVI6yU+jtWBSr/WSw64Gr3KNL/FVKsu60wy4Kg5atbZbZe9aQx
         TXHGco6PkmdAMVxWy9QHCHriKLvA1eJ5mOh1dU1me6orqI0iAiB5uIJ6eSRGSPD/tx8y
         p0BVG4w4DCnVkuda1J2nlYvJliJL5psl7vjWzcHpTXeWdajcQdBbbGQHOwNrMxpFmXhO
         aaM24HzwlutsZU4hZ7YRY1N2FxwegGLEskyTYxaa9ICk9/NJUCfAlEBVEJuNFS4kBMGa
         VPMiO79XxmDWBVB6g85vgcPxDEd5mYMcvhJ/q45mkWNCSOurB6W4RND2wP06kNSdbGXX
         O/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801779; x=1796406579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=30l1pg8BbFdGgTu6YtqLqpW4fpV5Flrv4r8v9Of03+s=;
        b=vXU5qyZOTNw/tz1FG+JdoBWs74EzQ6yJmNYVERszFNaAkAlUUjUAHJxt2S4g7IEhmd
         wVVSJf1wT2SnO0cqtTHraTrFz6SK44QemeCMFgZ937VqC3hmNhPNAj4fzcmd8+t0zvE5
         ZfwCljNDUT7kUMpjyi7Ibfn+NZ77hGsnAns2elh1G5KqOwPp/XhZ4ZcNfDKZeIuJwoZz
         5qhE8PW3/Cw6WT4BGxeonLrVsLiEdtPVXUEQ6E8rGWP+pDv4wK8FgNMx6DJGgoKd8vAP
         cO/UoSBdt2+Xe5IdlXBSLh49NOE/t9ZklltDyyosjuCflITerbPnUtXy/fHKE/tsDarY
         BDXw==
X-Gm-Message-State: APuU4Z/q1dXVDK+Ux1WnDiiOEP0zRJDuBfnHoeI/vT16YSYehzVLDTGP
	QccRE4BPin+BNqyWjn6DZwA/H5xqwdH3MoDRTp/Lt3ojF6YMGWyNkAgtrkrrXi4l0vlHJ8i+5CQ
	ijZbrqug=
X-Gm-Gg: AZFdTZe6KnOa5JW6vjWgrKNmIlgZCWXpMn2V+FSAfSJk6KnS8ramJxKd++cSif7k9Da
	AVdQRWkWEqVGi+yAT9XGqA+o3pXD1zhlBjecviZP63OMpsk3eQ1uyGyjDMb38EQ3sivkOXzPcpH
	IiEStnkll4C1ft2TO0ccVp0n0BXBZKw6BGqRO2JtrjrLpoQNGS9Lj9xuL3qSFbulzDXzgGM1+aK
	loP9Wy7/7Qiy3Od3JwvO7xfyFE8pUvE+xYcouy7OT4mScu7NHIYR19kLVxPxnIIYUg71xJnr3hX
	0KgCWTMMlGlcJQn6onnUwd/zpb2AVAga/UxlQio/s9u6neUQExaODmh5gXbrlRnUCV7zOA84VTJ
	21GQ4+l3y8FoIVT6DgmUNrnEFKmnSzewmNphUtVh7d4ocd8GGuUvRQZrpf/YWgbfY7f8W7n1DlE
	U9Y2CGdc2tXVYh4xVtxb3vnEzf3Wx4I2PT5JpkQ7YtnmzidaxV7odT4ZmOK9GHnk/34opA9HGaa
	F8HsxMLxcOWaRaexp4TxID9N8AGXTyJ5ZkYIrx69uwvNN1yGOAt/KXgZRDUQZANXmMHt6/dLy+W
	BM4ur1znZniZboGjnq0m/ZPXic/0QfhQ90OuQso0PIX/pEFoVTdwfsV3JH/eOn1hSk73Qv76pCk
	Krkp8k3zCVd1I/a0AwUZ/9B71MrHxIerELIKLMZ5FmlVeKxlsZg==
X-Received: by 2002:a05:6000:184d:b0:48c:7386:af18 with SMTP id ffacd0b85a97d-4abacfea55cmr54373761f8f.8.1795801779171;
        Fri, 27 Nov 2026 09:49:39 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:38 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/37] sqlite3: fix CVE-2026-119378
Date: Fri, 27 Nov 2026 18:48:53 +0100
Message-ID: <aaa55b322ab859b52a674879cbbeb47af572f217.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251416
Content-Type: text/plain; charset="utf-8"

From: Arpit Patel <arpitpa@cisco.com>

This patch applies the upstream fix [1], which prevents a use-after-free
in R-Tree when a manipulated shadow-table schema causes
sqlite3_last_insert_rowid() to return 0. The GitHub mirror commit [1]
corresponds to the SQLite Fossil check-in shown in [2].

[1] https://github.com/sqlite/sqlite/commit/d21bd37c7cfc1b85b17a6703555f0926b6236e04
[2] https://sqlite.org/src/info/6a9e1415659f9e75

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-119378

Signed-off-by: Arpit Patel <arpitpa@cisco.com>
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119378.patch      | 52 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch
new file mode 100644
index 00000000000..98937c7bc91
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch
@@ -0,0 +1,52 @@
+From 347b0263ce597345446fcfd259d063ef86228191 Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Thu, 24 Sep 2026 20:14:31 +0000
+Subject: [PATCH] Avoid a use-after-free problem in rtree triggered by an
+ attacker manipulating the shadow table schema to ensure
+ sqlite3_last_insert_rowid() returns 0 after certain INSERTs. Problem reported
+ by Claude and Ada Logics.
+
+FossilOrigin-Name: 6a9e1415659f9e75940b3c3a6f6e123f61c5e9e2a7a612693ee395d7b7567bef
+
+CVE: CVE-2026-119378
+Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/d21bd37c7cfc1b85b17a6703555f0926b6236e04]
+
+Backport Changes:
+- Applied the ext/rtree/rtree.c fix to sqlite3.c because the recipe
+  source uses the amalgamated SQLite layout.
+- Omitted ext/rtree/rtreeI.test because the extracted source does not
+  include the upstream test tree.
+- Omitted manifest and manifest.uuid because they are Fossil
+  repository metadata and are not needed for this source patch.
+
+Signed-off-by: Arpit Patel <arpitpa@cisco.com>
+---
+ sqlite3.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 62a8d5128b..4b1c310fd6 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -209661,7 +209661,17 @@ static int nodeWrite(Rtree *pRtree, RtreeNode *pNode){
+     sqlite3_bind_null(p, 2);
+     if( pNode->iNode==0 && rc==SQLITE_OK ){
+       pNode->iNode = sqlite3_last_insert_rowid(pRtree->db);
+-      nodeHashInsert(pRtree, pNode);
++      if( pNode->iNode==0 ){
++        /* If the SQL statement has succeeded but sqlite3_last_insert_rowid()
++        ** returns 0, then the shadow table schema has been corrupted somehow
++        ** (e.g. the %_node table has been replaced by a WITHOUT ROWID table).
++        ** It would be dangerous to continue in this case as the hash table
++        ** implementation assumes iNode==0 means that the node is not part
++        ** of the hash table. */
++        rc = SQLITE_CORRUPT_VTAB;
++      }else{
++        nodeHashInsert(pRtree, pNode);
++      }
+     }
+   }
+   return rc;
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
index 378903944bb..8a8456567ec 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.45.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.sqlite.org/2024/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2026-119377_p2.patch \
            file://CVE-2026-119375.patch \
            file://CVE-2026-119372.patch \
+           file://CVE-2026-119378.patch \
           "
 SRC_URI[sha256sum] = "b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531"
 
