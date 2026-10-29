Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7406.1793264413969796467
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HnN4BxdD;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35829219da8so658936eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 02:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264413; x=1793869213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Pbib5toM9TjKBogsFxe2w136xUy+n2qsQagrCYQT7A=;
        b=HnN4BxdDVd3Z2boKrAt7gMOmYHg2ic+/eXIjR6OKURMuoZ3H1zNU2XiOyVTu+xtKSq
         3btU8o0+8Ah4W+JuDuHbDeaMOvSrlByjpZWa6kRB2BJHui45vrWAc7fKyG5p/pK7GsOr
         Z/54qaUfG6dMvnqzQtdqnQzJvgNEQY+BbdP3eloRk2TsB1nKwfdo0diTBEC+vdDDAtwx
         LcrsOWcTLNabjERius6LqHN17FvHLQONpaYgU0v0Ot3vm/6fULcRwSP07HGVrYsfFuaX
         6TJFnEQ6WJMPMksSFWDgy2dKsZ4rR1ofnTQlGj6oKlL/bP+lwu47fxvnu2FPi8YD5Djo
         2T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264413; x=1793869213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Pbib5toM9TjKBogsFxe2w136xUy+n2qsQagrCYQT7A=;
        b=KrVnH+ZmI6Cb/Ohs96o/8WScFTUYlB/W2s67xFgJdZG9TaUoCdoeE+1C4mUnuAmaUZ
         fT2hxoX0Qhgp1+g+t1OcOHRyE5/WgQ6evK7v1cAEoi9LKGgXm+EatAKdDek5AulMbVMC
         ofZa0QUaHvgdJVRspqjRena2IhqdCn+CLAjRYur3etLrtaemqXBvBLKkVjMeqztNnad6
         m3Q1W0nCuPaB+Wu/2wkYkmZ+/oE4tjkvM8X00pF+1e5LDecxhmREloRvnGM6Le01mc2T
         FM0bOGi7s/5rrN2xzNEPCiaUBY4ePVaxDDdJvgYE2LTz8P1NA4YMBDb17+84fiEC6pxm
         P8Cw==
X-Gm-Message-State: AFq9FYLznkh2KsQJVkBsh0w5O+9l5hVg90MPFQ5evz5n1mSXN3XLnFX7
	oHjOsmVF2SnXtJWVhFR50v9xOfv19m2BFEyUCXfcw0y73nrak44nr6Bhq9lKmtaJ
X-Gm-Gg: AYBFou29TisIPVo/d7++umMeQPCem+uHuia23gq8m0EOdk9UAtdiQO2b54PvFsJqBJM
	F+1y8upO5kGp6LerqPPnijoCtYcIEHQTuGsCdi2m0BCRS/6oHma3WZn0+Qoi0ufv0/j/Az7Et9O
	+0ned05qIQl9siyLWWq1+n9CRfOEj+seRrHRhbB5c0AZPRocAKX0Hu3Gl6uBTnanKGLEMZA1TZS
	sjiS6e74w1sXyy5/OO3WXS7TQjFUxw5Z6XiCuuNXXjM6hnaCC7LD198lUKfRVihzUS/BYZNI1mV
	DhxlJMBVDw+fMmiasXi12SE8EZmMSmo7DKM1B4dYAUkUa3KMmbKIpusHYHMe+xmirzXEpOgCxZV
	C7y6DsyTX9g+Venh/Rjgiueufq1g1+1xnbR0uYCRtw5+0hJOMvlmWtNW7gqrmqHEp+YFby9v6ID
	dgsewaqpomD02UEFxCTvlLy1vE0h5oXhgiJmY/ifGc/mhm//4WXPLGkiJZA6CyTvTTLKPx2ZLpz
	QuYlcsVkvHCpwB2cG1ZqzbC+/kgM7/Za+jE37tEYm/fie5x3w1CdwDdgRlyNTh+UrFjtSzdNHo0
	p2iaboT8o3n/t/mqMU7NM0nHS5+oxERgVLDX8Y7QAayGGRD14+TsG/NaB+KChdqpMjL0vUjgKWj
	xeRBGnbkPNA==
X-Received: by 2002:a05:701b:4549:20b0:143:1bb1:3305 with SMTP id a92af1059eb24-1a94abded94mr2509451c88.22.1793264412703;
        Thu, 29 Oct 2026 02:00:12 -0700 (PDT)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a26d59f0fsm12512413eec.6.2026.10.29.02.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:00:12 -0700 (PDT)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH] spdx30_tasks: include the SDK target packages in the SDK SBOM
Date: Thu, 29 Oct 2026 17:59:14 +0900
Message-Id: <20261029085914.3185894-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 09:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248918
Content-Type: text/plain; charset="utf-8"

The SDK target and host parts both write sdk-rootfs.spdx.json. The host
part runs last and overwrites the target one, so the SDK SBOM lists the
nativesdk packages but none of the target sysroot packages.

Write separate target and host documents, with their own build IDs, and
include both in the SDK SBOM.

SPDX 2.2 wrote separate host and target SBOMs, so this was lost when
the SDK SBOM moved to SPDX 3.0.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---

Notes:
    Tested with "bitbake core-image-minimal for checking the software_Package names in the SDK SBOM.
    
    Before: 740 packages, only the ...-toolchain-nodistro.0-host rootfs,
    no target packages (libc6...).
    
    After: 1128 packages, both the ...-host and ...-target rootfs, and the
    target packages are included.
    
    oe-selftest -r spdx.SPDX30Check.test_core_image_minimal_sdk passes.

 meta/lib/oe/spdx30_tasks.py | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 1d11d8d1d2..646ec7d074 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1602,7 +1602,9 @@ def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolchain_outputname):
     )
     set_timestamp_now(d, sdk_rootfs, "builtTime")
 
-    sdk_build = objset.add_root(objset.new_task_build("sdk-rootfs", "sdk-rootfs"))
+    sdk_build = objset.add_root(
+        objset.new_task_build("sdk-rootfs-" + sdk_type, "sdk-rootfs")
+    )
     set_timestamp_now(d, sdk_build, "build_buildEndTime")
 
     objset.new_scoped_relationship(
@@ -1615,28 +1617,36 @@ def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolchain_outputname):
     collect_build_package_inputs(d, objset, sdk_build, sdk_packages)
 
     objset.add_aliases()
-    oe.sbom30.write_jsonld_doc(d, objset, spdx_work_dir / "sdk-rootfs.spdx.json")
+    oe.sbom30.write_jsonld_doc(
+        d, objset, spdx_work_dir / ("sdk-rootfs-%s.spdx.json" % sdk_type)
+    )
 
 
 def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
-    # Load the document written earlier
-    rootfs_objset = oe.sbom30.load_jsonld(
-        d, spdx_work_dir / "sdk-rootfs.spdx.json", required=True
-    )
+    # Load the target and host documents written earlier
+    rootfs_objsets = []
+    rootfs = []
+    for sdk_type in ("target", "host"):
+        objset = oe.sbom30.load_jsonld(
+            d, spdx_work_dir / ("sdk-rootfs-%s.spdx.json" % sdk_type), required=True
+        )
+        root = objset.find_root(oe.spdx30.software_Package)
+        if root is None:
+            bb.fatal("Unable to find %s rootfs artifact" % sdk_type)
+        rootfs_objsets.append(objset)
+        rootfs.append(root)
+
+    rootfs_objset = rootfs_objsets[0]
 
     # Create a new build for the SDK installer
     sdk_build = rootfs_objset.new_task_build("sdk-populate", "sdk-populate")
     set_timestamp_now(d, sdk_build, "build_buildEndTime")
 
-    rootfs = rootfs_objset.find_root(oe.spdx30.software_Package)
-    if rootfs is None:
-        bb.fatal("Unable to find rootfs artifact")
-
     rootfs_objset.new_scoped_relationship(
         [sdk_build],
         oe.spdx30.RelationshipType.hasInput,
         oe.spdx30.LifecycleScopeType.build,
-        [rootfs],
+        rootfs,
     )
 
     files = set()
@@ -1683,7 +1693,7 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
         bb.warn(f"No SDK output files found in {sdk_deploydir}")
 
     objset, sbom = oe.sbom30.create_sbom(
-        d, toolchain_outputname, sorted(list(files)), [rootfs_objset]
+        d, toolchain_outputname, sorted(list(files)), rootfs_objsets
     )
 
     # Set supplier on root elements if SPDX_SDK_SUPPLIER is defined
-- 
2.34.1

