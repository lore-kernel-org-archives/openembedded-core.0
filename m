Return-Path: <akuster808@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0D477609
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Mar 2017 15:24:48 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u48so17224701wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Mar 2017 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1dOjGgBEN3gOUBx/WoXmih4eTk/WfBwgEZKfipd/f9s=;
	b=OoYDGdEfO6XTWSDEOuY13nK6K2IuE19xNrW9+uDUhUJxEvfHW7J2HjL6osuJRs04Q7
	Ztjk3W5s2eF0DZYQaQv5n6iKmS4+9l+PV7vWU1QGM79Qhpj+LFgHVFC1Hxt3NYtpLAw2
	oDEmpjYIY0xXNIb0x47XzYMJylv07N3xkVJEcYDEWOzIYA2Uz4eXkSo3Au+Nrn2DPBJ6
	eat4j1jMy0vgdH3HixPF2IEW6ag29u8uvgKMb94ZxBKAfR9W5jwJVXxW20tIWEPUpiXq
	xehRS6gpSlkQetUuU5cjvcdAfjcOZcXNkgNpvcBgWDx32AyWaQUPoc6JK+g9dmfELwd9
	2A6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1dOjGgBEN3gOUBx/WoXmih4eTk/WfBwgEZKfipd/f9s=;
	b=CDGn3oAhh3L0wet5bdhsDXHMNz38Y3Ub4edQ/CxuuIEktXX3Lkna/rwbCQuW3ff793
	YEpJV1ZSbqFViKSUmK/bug/YfqLMYgy14UbVornJwo/PkgbXqcgcvJWi+tbVZme6k3/x
	dBoXJBTMPvivbcUN1vbgXyFtc8vGLugg1Om32Y0nSVgsqQPEfUBhQM0LfdiAQSAA+qqS
	EP34I6+HJ0SDHCtggjEMXumaiM89gjz70w5C+NQRbbB94LMMM2E5yug6+Wb1YSrLQVny
	bXyaDyiv5DJRyHrBZik4ok53i+WM2J9jicAMYfgyMdszAMBpj+G8fZ6l1+eH2mYrzGBW
	03TA==
X-Gm-Message-State: AMke39liZMtqPfyZ3qDqRLbH5+a0PFrDx6/SpWyMPmCw1LYvkCVaKHO4dBcUgrwkGTF7Yg==
X-Received: by 10.223.142.40 with SMTP id n37mr22760735wrb.137.1489332289774; 
	Sun, 12 Mar 2017 08:24:49 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id
	b17sm7761051wma.33.2017.03.12.08.24.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Mar 2017 08:24:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 12 Mar 2017 08:24:32 -0700
Message-Id: <1489332272-19493-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lincese class: try alt encoding when copying license file
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
X-List-Received-Date: Sun, 12 Mar 2017 15:24:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Try another encoding if utf-8 fails in file read.

line 20 of irdadump.c contains:  University of Tromsø

fixes:
WARNING: irda-utils-0.9.18-r0 do_populate_lic: Could not copy license file /home/akuster/oss/maint/openembedded-core/build/tmp-glibc/work/aarch64-mvl-linux/irda-utils/0.9.18-r0/irda-utils-0.9.18/irdadump/irdadump.c to /home/akuster/oss/maint/openembedded-core/build/tmp-glibc/work/aarch64-mvl-linux/irda-utils/0.9.18-r0/license-destdir/irda-utils/irdadump.c: 'utf-8' codec can't decode byte 0xf8 in position 874: invalid start byte

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/classes/license.bbclass | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 0ff6560..01ab002 100644
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
+                            bb.debug(1, "Failed to copy licesne file %s using UTF-8 encoding"
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


