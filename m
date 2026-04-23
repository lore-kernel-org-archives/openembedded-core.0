Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F86F99373
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 11:15:23 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15999.1776938654431058054
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 03:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eLrbMDwL;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: zizuzacker@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso2226932b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 03:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776938654; x=1777543454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3sGudDubg+VJrcwavrV8MC1YA4i+metK1Kym5QjTC0=;
        b=eLrbMDwLCvV80LslAf0ELFZoLGKpwKVaws+73dkpATESaQ3xmHzt08ZydcRf0HA05O
         cvBukByTBNkIUFsge8f5AA+JfIPCg/sD6Qy6xm/wdpKHXW3TLu5jLV3rwtC/uzIAiJAj
         /gCxFUqf584ad6WbRTqhZCerXeAyWDDqsOY8hry9TrRg/PDjm9IEU6xfuAnDmBJMc6Zv
         5W5QKphG+B/FRaktQ4P2uCGjdCnS0Cr1JdKWP8hngr+TEdQx+rSrN8YgbibPhiRJEgSs
         qUiGDhZP8eplsuHJi1w9mfG33kEiq364FwOckWbCIZ7Zci30TtWkVL0CS0sJMP9B9/MF
         AdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776938654; x=1777543454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j3sGudDubg+VJrcwavrV8MC1YA4i+metK1Kym5QjTC0=;
        b=dJbpMtGCGsK+vaxJdbvgpdGSRx2sW55xmm0jRKv00X4u+YgrVIBwm6bz9Rti9a9mt6
         C2Y82y3Y95rmfNLnRC5Hr7pdoxjnYHDccqi0rWtU35quS8aPODFv72YfKNalyLMT0kN3
         aye+a/WBJMKbd3Dwr3YNyhopovtxZcKUpNeGi5XaMfmKW3OXwSBAJtDbW/A2NLudgNBG
         wYXf4Q655jmICPJfaRcjoK5hN1Wt4/uKS81qGm81RLc+a+v3kXogHxPovWRibPLHMViB
         7M2oGpAVodW2lZqRx0w5/9ya6jpqyrkbpipdGMb3Vhk+guBG6DqukXHuWSri7A0w1nLk
         PFJA==
X-Gm-Message-State: AOJu0YyG8TmRFpx64RYYAOZKc+3waZl5MbfFuHqez0HRkvRx4gmsDcHd
	DcKyJbKh/EJq37LwP30BszuR9Hz8Z+Ct1EQiL+cVHjO44lTGudEpYsjit4TlugGX
X-Gm-Gg: AeBDievqx740W/KueJqTBlEUTiCW8tXsCiJIuKGgwA3ci2ceIIfnBSMT64TySMWm4Ty
	0j3MhUPpPm3NUMWs0dlVJqoxf8oC7NJmw9eqcQgHnzIMeRTlbgL/4ryP7XyuBfvpHr6Sixqtcw3
	laE8E0WWqpxqcU1O/tgyt+J4R8a/n8B9ngCkYhCDaMG0sTwAke43FuFzkcHacwb7jj/OvtAYZvj
	y1DUJDYGj0R78V49cXVbhiN1gr3AZAYtw4cWgMttTZTrr2HVDMuDVFikqvzceoUyBA1jwdv+B5Y
	vgmnU4snizvm2BXRdHVD02ihizGtQ5hq/AzJ1rojWCBlReNV25USTFTX8VMjzgIDvZXM7OEKXDS
	t0K3Stvlh/ZQ5wXblLMdfowUHeLjuYfzmFRoTkeYqpJpEx/3TRu/j6qqwBKdJDOAgtr/4GpFWaq
	f1MP+2HVwCsDNiCv5MNQIq2Cfk
X-Received: by 2002:a05:6a00:6c8e:b0:82f:7182:693d with SMTP id d2e1a72fcca58-82f8c8fba34mr26402455b3a.30.1776938653475;
        Thu, 23 Apr 2026 03:04:13 -0700 (PDT)
Received: from ltu.. ([42.118.25.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9e0f40sm21540801b3a.17.2026.04.23.03.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:04:13 -0700 (PDT)
From: "Zk47T" <zizuzacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	mathieu.dubois-briand@bootlin.com,
	Nguyen Minh Tien <zizuzacker@gmail.com>
Subject: [PATCH v3 2/3] meta-selftest: add usegroup-deponly recipe to test USERADD_DEPENDS only
Date: Thu, 23 Apr 2026 17:04:04 +0700
Message-Id: <20260423100405.25255-3-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260423100405.25255-1-zizuzacker@gmail.com>
References: <DI0BXNU5HAFH.348GL3QVI6JL3@bootlin.com>
 <20260423100405.25255-1-zizuzacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 11:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235757

Add a test recipe that inherits useradd and only sets USERADD_DEPENDS
without USERADD_PACKAGES to validate the fix for [YOCTO #15863].

The root bug is that useradd.bbclass unconditionally requires
USERADD_PACKAGES to be set, even when a recipe only needs to depend on
users/groups created by another recipe via USERADD_DEPENDS. This recipe
depends on creategroup1 for user gt1 and group grouptest, but does not
create any users/groups itself, exercising the code path fixed in the
previous commit.

Signed-off-by: Nguyen Minh Tien <zizuzacker@gmail.com>
---
 .../selftest-users/usegroup-deponly.bb        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb

diff --git a/meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb b/meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb
new file mode 100644
index 0000000000..22288abb61
--- /dev/null
+++ b/meta-selftest/recipes-test/selftest-users/usegroup-deponly.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Test recipe that only uses USERADD_DEPENDS without USERADD_PARAM"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+LICENSE = "MIT"
+
+# This recipe depends on the user/group created by creategroup1
+# but does NOT create users or groups itself.
+USERADD_DEPENDS = "creategroup1"
+
+EXCLUDE_FROM_WORLD = "1"
+
+inherit useradd allarch
+
+TESTDIR = "${D}${sysconfdir}/deponly"
+
+do_install() {
+	install -d   ${TESTDIR}
+	touch        ${TESTDIR}/file
+	chown gt1:grouptest ${TESTDIR}/file
+}
+
+FILES:${PN} = "${sysconfdir}/deponly/*"
-- 
2.34.1


