Return-Path: <net147@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E8D897680A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Aug 2016 13:51:02 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h186so21766019pfg.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Aug 2016 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nyrNmdKZsWygZFYMY1vL+kveChu0a7K2KcuQbV6gCJU=;
	b=oWYZx9Q3bEAQA4zvLjylDvtfJT40EmmjAaPGCGzWPRi/8Q+k9tB8wCAzpH7tOu79Bm
	n49J5j7Qd8KUovTPn7dvzsanZJaZTGOyiEVZ3y2zTVUBHS2hE8U8T7KL/K5C+CgZ4Fha
	ZsjL/2e7z2OEi5omXczc4JjUIu/s3SeTE8NBU28FqfK+6DOsSKArvcrwaxFpghs50Kuo
	3wmsAPKRF/5R8cl8a13N39J+DnsiV6O3r12gWs+XrPT5l9WN78R0zt8ITZpzjIn4VwOY
	daLMNMOfXmd/dGa+XP1QgA35Ug1LkC9yDvrzUb6RsKROqA0P7zVc4bpLA4A5cyf6K7bB
	5YFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nyrNmdKZsWygZFYMY1vL+kveChu0a7K2KcuQbV6gCJU=;
	b=mbfTgxnEosTnaNNNF62/M9gZeHasdhI/URG32D3v9ObC8xU5nfhN/mTrVOs58ZLURD
	Ad2avPXeiD32KQbrHEWc1LQhcLh4+8cGjg0ReJk5nBkgcPzEEywzOcOAFLipYIDsLfnj
	PKi565YxlPEvCUv3mRyuwG2jq5JYcqi0y6fuO4k+YtWP39xX+y06iAgZOuygQOj3uQXe
	OM3xgXikvhn28zbOJpBPi5HbBj9waqweKQ7RNpwtx5Km6rCxrej6SUMwW0mnrn40SQU1
	+1cKSHlWvRGmB4Eq1RWP5YDvzetBRfTnySyZ+AbolayY0t1ijGtFA0uisBMIq//N4QZ6
	7K0A==
X-Gm-Message-State: AEkoousDkco+JXitFjqQEwyQEpa1njf08L8ieuIh3bdAOMyWYwbshHuzlcZXZvzCuMKj1g==
X-Received: by 10.98.204.74 with SMTP id a71mr144971852pfg.149.1470491463308; 
	Sat, 06 Aug 2016 06:51:03 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	r10sm35539117pfk.84.2016.08.06.06.51.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Aug 2016 06:51:02 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Aug 2016 23:50:16 +1000
Message-Id: <20160806135016.31822-1-net147@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [krogoth][master][PATCH] ref-manual: change SYSLINUX_ROOT to ROOT_VM for DISK_SIGNATURE variable
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
X-List-Received-Date: Sat, 06 Aug 2016 13:51:03 -0000

The SYSLINUX_ROOT variable was renamed to ROOT_VM in krogoth.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 documentation/ref-manual/ref-variables.xml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 1181d64..96ba530 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -3139,15 +3139,15 @@
                     by UUID to allow the kernel to locate the root device
                     even if the device name changes due to differences in
                     hardware configuration.
-                    By default, <filename>SYSLINUX_ROOT</filename> is set
+                    By default, <filename>ROOT_VM</filename> is set
                     as follows:
                     <literallayout class='monospaced'>
-     SYSLINUX_ROOT = "root=/dev/sda2"
+     ROOT_VM ?= "root=/dev/sda2"
                     </literallayout>
                     However, you can change this to locate the root device
                     using the disk signature instead:
                     <literallayout class='monospaced'>
-     SYSLINUX_ROOT = "root=PARTUUID=${DISK_SIGNATURE}-02"
+     ROOT_VM = "root=PARTUUID=${DISK_SIGNATURE}-02"
                     </literallayout>
                 </para>
 
-- 
2.9.2


