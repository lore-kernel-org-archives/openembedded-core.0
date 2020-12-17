Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.2489.1608173537550075666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 18:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=mDLmx4dP;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id B500420B718C; Wed, 16 Dec 2020 18:52:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B500420B718C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608173536;
	bh=B2j2KsI3+/4aChLa6wWHYJhqHOsnn743QGGcqjwcon4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mDLmx4dPFyC2ry8z1d4aWo6/iH1RWA6ZUVgdHggVXiW/nsaJfpDwiaUSVDFzNofV9
	 Tsm7/LbmO746M0e4+eztiWPmQ5g/Nl0nsecTwkz/s7LzCIjKvbni31pMkWe8RbvRSj
	 ERM8vOC49gwJNbmggOyzVxRf/IdTTuwJBupxSbhU=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Usama Arif <usama.arif@arm.com>
Subject: [PATCH 7/8] oe-selftest: fitimage: Test for FIT_DESC
Date: Wed, 16 Dec 2020 18:51:41 -0800
Message-Id: <f4febec53413964bd192043df28d0c9a82181f94.1608173226.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>
References: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>

From: Paul Eggleton <paul.eggleton@microsoft.com>

Add verification of FIT_DESC to the existing test for kernel-fitimage.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 2c3803d..2a02c60 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -35,6 +35,7 @@ UBOOT_RD_LOADADDRESS = "0x88000000"
 UBOOT_RD_ENTRYPOINT = "0x88000000"
 UBOOT_LOADADDRESS = "0x80080000"
 UBOOT_ENTRYPOINT = "0x80080000"
+FIT_DESC = "A model description"
 """
         self.write_config(config)
 
@@ -59,7 +60,9 @@ UBOOT_ENTRYPOINT = "0x80080000"
         # The order of fields in the below array is important. Not all the
         # fields are tested, only the key fields that wont vary between
         # different architectures.
-        its_field_check = ['type = "kernel";',
+        its_field_check = [
+            'description = "A model description";',
+            'type = "kernel";',
             'load = <0x80080000>;',
             'entry = <0x80080000>;',
             'type = "ramdisk";',
-- 
1.8.3.1

