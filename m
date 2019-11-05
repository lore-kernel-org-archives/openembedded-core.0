Return-Path: <prvs=2052f4dd8=alistair.francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC217F8B2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 18:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1572977434; x=1604513434;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=0PbXospGNhXXITn3kSRGp8Od/qYeFxihMD6zBN3hr5k=;
	b=h9jRWfb10fh7eEBklwSM4SDckeGi1vhBlPutc1v8v5J+IHwr5p8aQlQk
	WC97cdWzWcveifwxIj9ZGRqaWHKqbbDPpmGgqV/Hsway8+4CgfXkhkuQc
	Hhb6ggVa7PudY9TCBKAiEqWgOMF8hG7Bl6XQtnQovJrMfieZT+6x0iKF3
	3gQ+zpW74g0eIqMO2idEyGTG03fmDZUTBM3xVvG/saZ1kEnVjUFDLb9H4
	Kn7wUM3NciBzDpL6qiaOqEo7NvLQ2Y3KZnooxaxwscXWYzmAAvVfFBKWY
	vgfDg+pw//2JAUxOpI6NwvSURS5I+DnSTxps4FeT0pETvYwXfXH4l+CQz g==;
IronPort-SDR: b9/qNDZpoYAskDBChUFrDvC4Zub0HDJdhPpRDIu92KVj3i7wvWk7B+3GIKw7Wj4tu5j43IhB2Z
	5ljFnjPnSVImz/7DE2pmmOassl6MJW+Mn/bsyWkQ8U7sD16TN7ssTN6uyMyprAc0jvESL7+RED
	XoqNllq1kk5tEQQw38mobTCCNIi155rApVMjlpff4XDJd/HbcLpwQbSieimbYssyco0yx20/Ot
	wecTm/h2i/OJrRIT0uoxGhkn3W9zVhFFJRd8Na/XrQ3syfqdWrHzf026fia8hc+GsXbUI3NXvM
	I1Y=
X-IronPort-AV: E=Sophos;i="5.68,271,1569254400"; d="scan'208";a="229443794"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 06 Nov 2019 02:09:07 +0800
IronPort-SDR: RQrCwCxVz2NML74nRGgK4YxJF9CEhkfWoJPBXkaPaxtGoyazYGfXL3kNUa3j6GT7c4zMRtPGmK
	9aovicjwpd/MEkR9ri90I89ciGOgo/FSx/PovKB+xA6y97tc1BWVa0uNa0Y7y/VwfWCL/FkDxC
	ksSIU8GVIbUqTPkKkfg1FI1aJCUM7/YDQemfjjWzZQmQW21xaoRTyt551OLQaAlIggtDig+mvE
	shEADoToDVUbVP/Dx1TZp9UNnyX2fgC4orPKLvyGXBMJgL/CElCEwy5/yNLn/lkSGpiz0/e9PY
	EtY2xaIJbG5j5roAsKlGk263
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Nov 2019 10:04:20 -0800
IronPort-SDR: dHogAAG9tVB1cmM/Z3mNWixaZ+FwRS0sRLXbx6pEzgv4yReCdnkmTNURnGKRJcJ7SrZlIoYccB
	kEiXZBEEdK8GQEh6w13zYUJ7smV2EqKeTYmb6IqCwN5bGNXtEpLGsxPxjJnBH/AxinvZtKnS6O
	72T4xRRyg1tM8tHe6R4C+aTSHvT4rOysNXG9Y+0p10Yp4HM0rWsfvstLOvbPOyxTPtKa2G7IF9
	V6fdMDhyZ1WMAKF9cVWH7TSAwLIgB0k17R4+cqBh8sPDs/5MORS+Qia+ZFAb9DeRXD9gQablmr
	y6o=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 05 Nov 2019 10:09:07 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 10:03:48 -0800
Message-Id: <20191105180348.2868-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] machine/arch-riscv: Fix newlib and baremetal builds
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
X-List-Received-Date: Tue, 05 Nov 2019 18:10:33 -0000
Content-Transfer-Encoding: 8bit

Fix the following errors for newlib and baremetal libcs:
ld: unrecognized option '--hash-style=sysv'
ld: unrecognized option '--hash-style=gnu'

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/include/riscv/arch-riscv.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 19f8f3e211..8ed9874389 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -8,3 +8,8 @@ TUNE_CCARGS .= ""
 
 # QEMU usermode fails with invalid instruction error (For riscv32)
 MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode', '', d)}"
+
+# Fix: ld: unrecognized option '--hash-style=sysv'
+LINKER_HASH_STYLE_libc-newlib = ""
+# Fix: ld: unrecognized option '--hash-style=gnu'
+LINKER_HASH_STYLE_libc-baremetal = ""
-- 
2.23.0


