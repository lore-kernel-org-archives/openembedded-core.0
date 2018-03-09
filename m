Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6C178954
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 11:00:56 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e9so3406919pgs.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 03:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wIdSerEtesjpcYU+vN62pbwKk18ikIKY7RdT/iE9/K4=;
	b=Il4M91AcjLJoj5kdbg8UIn5dBRiCO3gtLqo1UnJ8uGuPIYfbrMWbfxxSMzit7PaTeI
	76nwi73wCYa3cAsX252qfA7QWL40A9rw5zbdEr+br0O/+pqKibdWAGu/CEn/jHToqtEP
	iml54Tl0jBClHdmpO5gefTsh+jn65Bqb64JfLutErtw8UL2Y5h5gnLk7roKgFje7ZfhC
	44QxPudA9h5FUyME/i/Y5qLlOn+xNo7nOyhBuTFASL/QKurlORD3fnKNG0AFdi/XblEN
	w54YB2LBLjxsM3/eXul4a/fmlGeTY8BPbbcyweo/syKDSdj5GawM6rCDTHqP1zq2wrEP
	recA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wIdSerEtesjpcYU+vN62pbwKk18ikIKY7RdT/iE9/K4=;
	b=rSIld8KCag7sx3AGxZtAS7yBd4v8wqKwki3b5nxlEsFBuqYfFj8ydRzQD41HX3kW38
	3yIGkcMAvcEccIsAc6J/vIzejO4M6NCNEfyv86Ag1HFKXUAXIktyTafg3VwxikceUvoX
	82eeSG1yqd7VVmj+ztNzxVR6EFeiY2NA0aKV/aqDu18gQjvEtH+apznOL1c7nwTF+O0g
	8auT5YzQEQ5CB4nzxWceKF2oYXG0x13rpesm2R1sAMEXgH+iMgAo6ZxyyRE+5pEyXMrn
	YVaTM8GSe14SIbt+V2G6HcWUiA/YW3V7v1begMptH0Owv9iuYOkAhNxCZ3APjOVAaGoy
	ZmJQ==
X-Gm-Message-State: APf1xPC7sQM5kum0iDdtGK7Y9GRwYybqfdERn1vcjv2PJW2IhiFgCC/w
	243en9Fo8DFzAYJoOJnRG0gAgA==
X-Google-Smtp-Source: AG47ELuMG8bor17D9n7CY7iIAnlbTPJBViwu/Aq7Zq0sJt7ylfqdNprportp9JTBSWtO4Qc7SConpw==
X-Received: by 10.98.58.129 with SMTP id v1mr29637427pfj.203.1520593257610;
	Fri, 09 Mar 2018 03:00:57 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	205sm2447295pfy.117.2018.03.09.03.00.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Mar 2018 03:00:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 03:00:47 -0800
Message-Id: <20180309110049.10725-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH 1/3] packagegroup-core-sdk: Disable SANITIZERS for riscv64
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
X-List-Received-Date: Fri, 09 Mar 2018 11:00:56 -0000

Dont build yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 393f0d3d13..a137e7748f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -33,6 +33,7 @@ SANITIZERS_mipsarch = ""
 SANITIZERS_nios2 = ""
 SANITIZERS_powerpc64 = ""
 SANITIZERS_sparc = ""
+SANITIZERS_riscv64 = ""
 SANITIZERS_libc-musl = ""
 
 RRECOMMENDS_packagegroup-core-sdk = "\
-- 
2.16.2


