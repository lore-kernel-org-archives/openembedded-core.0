Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30991.1795560769476376653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Y4FHQgni;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490d59c3edaso3462459f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560768; x=1796165568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3it6SThJCd6D06Yvi2RtiQsYtaouxyDyVcMGQlR5Lg4=;
        b=Y4FHQgni++3wQZ6Afaz0PIU2YN6bCljCa2JZ6tkDCUueKvW7ogGB1kt3q2BKeSsayZ
         3ntcu7OYs21U8kxPFjdpeLYrtnKSq/WFEew9k9f3Ff+NlYFPj17dkaZ/Ak+nayF5Y677
         dY1H0JYnkVkOB3/ug+McfIn2qASYVwaRVwGl/OhK5kqHNfn7rbWlmZ+BQ9bhSp9HV/F9
         wA1ROQjUt5lrX5u00xNGwTFe6KpT1Aor4BoTWRp/99EIVtWl/cRx7buOvHAubZmkiOin
         lg35WOsLnwTytJlWO93Md6ZGrGAF/+pMoQrOP978sHNiXm1VN49ekwYPJ0pWQZ6Sx7lG
         HLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560768; x=1796165568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3it6SThJCd6D06Yvi2RtiQsYtaouxyDyVcMGQlR5Lg4=;
        b=Ca/L4cHiFtf/jpHKifBrXirx8RvJW53qRdBj5GwpaCFyzJGVZ/9O/lDn7vBusnbzsS
         Iw6+nctkBTLSV2eW7kQ1HiC6Lk/POofl01KlKQeFOTS4SFITdCnRBBnKBnAdYsJz2u97
         Lc+1GDTvnC+a8ZxlBEr49vsbX1Yj2uqPIGvWta3hzDv7BbXt45F5Eqbdj6BBTRpWhfna
         wvbCK3hJpYC9ReY90b52vv7ZxVWUClzEWLsWJo/nwxC0i1Ske1PHDOSk+T8AYTDboG4X
         HZUXem4x1KuxG08HrZLJ32kT7AbMtGKy9KbwZC2oid+eqyn1w8B2pF2Fb5nzPLV1ReS5
         JgAw==
X-Gm-Message-State: APuU4Z+hg907WyhadUtUe7afoB+JK7Jnex+QYW8R8fdBtp0DVXivE997
	IQQjFMmvkvXe+xwcRCL2L4h5V7JCPMSW2jsNWh5vPUbZAri95yRr71EVXM62yuDsHSWc1dn7DAo
	gQxvVY1o=
X-Gm-Gg: AZFdTZcmwEcXCJ8wzw270FutV8M7/fBOXSVNE6Y5WDvkOUSDVZBR0JWNVFNKkjm3/LH
	HdD1vRJpTNXYes33cINwhlEsWfyBIllD3kx5SF0S0wW82/3tWOiuKmrbKwCJfcHCp9RnNesfBiK
	Lk4t4iPyewf4OWd4hAv5MCiL0djtdH2AMyYaZ2yUYiIPyMH4D1mWHkuvHSZbTy0XOLKgtVxX9Rh
	wDT2sIWMCI9c7D9q+uAn4NP7y9O4MjM1vATHyESRTxkQ/V0J5hLgtBFBCOrsnuXF8eVasJx6EDw
	uQ5nfVXY/5wfr4ssH6fuyK7RfOuGhjeK+LbgbMQNJ4tojTj/kLGWIPWwu4DOtPuF/Td8Xt5x3dt
	1gHDFeEMXMSN+/QF9MdyCyK4NqfsoS56XiTE+Q39mjx0mQLDfCGUgccd9YnFyVzd4rZ4KE0OX3u
	n2NvI2g+I+edkx/RBEoUukBoQ9+Grve/lNayBOdfjSqTnpz+uSHo8OWWltHX1W1WAlqkA9lafN2
	CW9sv+IfWxA7gOvVhfC7Zs2cUY0W8h5FF5Q1NkcQGMGXH24xVfW3EcVNtB+x2bqHcIkOez5s24k
	iEJ4ZfBeY8np6SIH6o6B/AZsUHQIPmYn8p0TywmmRPm/0yuc6G2OPZONhfJ3ysUcwnGUAsfkeFI
	7ZBbEU7lFlPq3Qk+okdALrgPJQ2io
X-Received: by 2002:a05:6000:2903:b0:48e:d40:a87c with SMTP id ffacd0b85a97d-4aa579a8cabmr43192582f8f.16.1795560767683;
        Tue, 24 Nov 2026 14:52:47 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:47 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/21] sqlite3: fix CVE-2026-119378
Date: Tue, 24 Nov 2026 23:52:26 +0100
Message-ID: <e494f477571761046690fee1cd4091581ec13c26.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251111
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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sqlite/sqlite3/CVE-2026-119378.patch      | 52 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch

diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch
new file mode 100644
index 00000000000..5228e32cb65
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch
@@ -0,0 +1,52 @@
+From e92efe57e1f9cc51f7d819bb7fb05bff182b708b Mon Sep 17 00:00:00 2001
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
+index cbad7b2ae5..45ade42b16 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -216677,7 +216677,17 @@ static int nodeWrite(Rtree *pRtree, RtreeNode *pNode){
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
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
index c6a19525fa7..7c8658a977c 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.3.bb
@@ -18,4 +18,5 @@ SRC_URI += "\
 	file://CVE-2026-119375.patch \
 	file://CVE-2026-119379.patch \
 	file://CVE-2026-119372.patch \
+	file://CVE-2026-119378.patch \
 "
