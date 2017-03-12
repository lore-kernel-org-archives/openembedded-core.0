Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9F48A7771E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Mar 2017 15:27:43 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id j5so16284000pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Mar 2017 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/+l/7OOR//jNTVD9JITrqO9FfTW44WQMVxWbhfSNtAE=;
	b=DzBdUFq/M6wVkxrL1hkhhgiyq5OvTTXbkx4QqmrC8rcinJk++NqfTHZM98/8L26yqk
	CWPI430S1iZQrSWGKsed95yjTTYixDRJTbWEpC0jSr5NQRKx10gP2Tpfhm1Py2pXXjAK
	ADj7Qp7MXh1IjhWe4WBlxT61kq+iaNPsd24DKgRDuvi9MminCZe5HcGK7cYzLg6AODpo
	TntivBbUZP8JuXX8rQLkaXc5+1jbS8d5cKjQXuj8VbLG7lq2/DPJQmJYjYygp/2/r3NP
	0Rly56F3syOOfK9ZLnsHYTmH8WkvraKTMwVrVVHwigTUKNDNMBiU/PkRItPSKo2HgtIS
	NxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/+l/7OOR//jNTVD9JITrqO9FfTW44WQMVxWbhfSNtAE=;
	b=fvjpmWgZ6a8pH9ASEtLwNcADjzFYIx474OZSWZn/RDX52rKwmc5ASGFzC1v1Y7j3tX
	edDukpD7BQrNnePRu8laL6MIJMCHsTzaJRGb3Yr0RdBT2aPToT37VVVVWQLUHiwJCrtW
	9R0OQMcGRkWE4L5HygR1vIc/r6oUojZBL9GnGdYoLDuh3WXbO9eNFhoiY1i5mFqqAT56
	6cj75HcrJXwlIRaBA1oReXANquuhC6U12Wo11QZW2FKUF5xHR2UmBbxwmvIpnRxdS5ez
	VvcwlVSpgT6aEDQKOPM3TmGMI9gewm7AHM65wLWJ0mXSZ7LY425GWL0e2tep3m3dKE++
	j+OA==
X-Gm-Message-State: AMke39k4LQmSe4f+H+LffbZwIomTj0/cEFD1v0FMkWo+xDAAyRT1G3p0AycpZG3AFCEhow==
X-Received: by 10.99.3.16 with SMTP id 16mr32351848pgd.150.1489332464639;
	Sun, 12 Mar 2017 08:27:44 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id
	b70sm28855324pfc.100.2017.03.12.08.27.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Mar 2017 08:27:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 12 Mar 2017 08:27:32 -0700
Message-Id: <1489332452-19584-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [v2][PATCH] license class: try alt encoding when copying license file
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
X-List-Received-Date: Sun, 12 Mar 2017 15:27:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

v2: fix typos

Try another encoding if utf-8 fails in file read.

line 20 of irdadump.c contains:  University of Tromsø

fixes:
WARNING: irda-utils-0.9.18-r0 do_populate_lic: Could not copy license file /home/akuster/oss/maint/openembedded-core/build/tmp-glibc/work/aarch64-mvl-linux/irda-utils/0.9.18-r0/irda-utils-0.9.18/irdadump/irdadump.c to /home/akuster/oss/maint/openembedded-core/build/tmp-glibc/work/aarch64-mvl-linux/irda-utils/0.9.18-r0/license-destdir/irda-utils/irdadump.c: 'utf-8' codec can't decode byte 0xf8 in position 874: invalid start byte

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/classes/license.bbclass | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 0ff6560..3dab8d9 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -386,9 +386,19 @@ def copy_license_files(lic_files_paths, destdir):
                 if begin_idx is None and end_idx is None:
                     shutil.copyfile(src, dst)
                 else:
-                    with open(src, 'r') as src_f:
+                    with open(src, "r", encoding="utf-8") as src_f:
+                        try:
+                            src_chunk = ''.join(src_f.readlines()[begin_idx:end_idx])
+                        except UnicodeDecodeError:
+                            bb.debug(1, "Failed to copy license file %s using UTF-8 encoding"
+                            " trying with iso8859-1" %  src)
+                            src_f.close()
+                            with open(src, "r", encoding="iso8859-1") as src_f:
+                                src_chunk = ''.join(src_f.readlines()[begin_idx:end_idx])
+
+
                         with open(dst, 'w') as dst_f:
-                            dst_f.write(''.join(src_f.readlines()[begin_idx:end_idx]))
+                            dst_f.write(src_chunk)
 
         except Exception as e:
             bb.warn("Could not copy license file %s to %s: %s" % (src, dst, e))
-- 
2.7.4


