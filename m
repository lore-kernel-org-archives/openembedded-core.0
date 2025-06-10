Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFEBC5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:32:17 +0000 (UTC)
Received: from sonic310-14.consmr.mail.bf2.yahoo.com (sonic310-14.consmr.mail.bf2.yahoo.com [74.6.135.124])
 by mx.groups.io with SMTP id smtpd.web11.89741.1749569529038639793
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 08:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=ULZ7rRZS;
 spf=neutral (domain: yahoo.com, ip: 74.6.135.124, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1749569528; bh=OTqGfwtr3sKwThvY/ubpl4usMI2ZNDWMafaA2QPjyTs=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=ULZ7rRZSU9maC+4PT6wzHB5enu7bMjqLtywfCPz4xZmKS2d8qaP6femaDXNLXpeJyDv8glL9T/flxn+0PGF0AtgEmx/0psdv6CbUfpgfF0s39Xr6s8wOen0JNfGV8+j1uYgWHrr/iWPOM0pb4b9E1AGvUmPOirju9h2lQZzLnYgATGPkTQc6knr36O+pNY/hqUzgnHCVQig9uqciOAsk+yrrQL4/Pcfl2Zdgv+vBKGd5T+SfcWQL6OHQTGrRV39r6Vk6/vjScK4Bvvcx1sSrRMdAdQGG3z3/R90cqh/rQErGBmT3neVXFfBNwbKBbVzYNcPcKEMbGFI/mipg1F7gLQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1749569528; bh=+UGmjAn+JY2IMpUx/vh7q15wAkC0kriftUWq5HrbBtj=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=IvX/UBRM58fb3usPokHQHua+D8iZtGw0WlzUsmhHc5UrJgj4mpF7tZXNhf79ffs5hNcUX0kMOW4tttWrqUsvBETmsSS72kdK4RqVmyjCKeM/BEo09cLP1t9ahzzhTb/tmdN75TN0Q6fGCXblFtrduqK69QcoRcfYs0Ctq0nmWtA9J5OXtek5WwKDFMjE6MWYkMrA8YRuKnVKFn+rXw9kZWQP33wFuAOsYMUEJiDRL504i5fc2qZQ/xW6oJsCc/zUnfBilgUa6bjebgkyO7rhvcByZbWKaK9ZNQ77fR5LmJlVGDLTLUhNvSV/0N3G/G0SQur+6o6hUV8t1KiYeKPF0w==
X-YMail-OSG: BgIJSuQVM1m7DATvlFQcfx__A3Loavamntcy3fQkZndyweH1PM_TzJqdiOqz7Lm
 0FvznsH6MiGO7AFlVcI._FOgnwNUrEKdZr6zMV8c4IzP5OiHfAcP9_gIsYQROdw9WrAstphxGP4o
 40EhWhA9RhmKzxFbzFFLOp.FyD9MPXzCW_KDUrQ8B9K7ghpm_DWIvuTJ9N872nDZpl2QXmn1CrOW
 mG3ERLZlQn0xZ2TztRCTZXrmsXAjzVpV6G3Fm57TOKHAgfJ175JIbSFqd9SS1Pla5bjPyxczLfqH
 zrxKSmX_FZyUvimLCA3Nhc6lZYeJ.DlYg1Z0irXYaTYFMJ..c5DSjmwWlkWRjm3Is7DndzST1vwe
 UrB9lDcPnTL_TzzvGxctGwMXQa8j7qkV2eIgOgolnBo12teLhNoITCVJVi0bpweH7Sy6PJN_Ujc1
 Q4yp9ouNMHHi1Zt9cU2vWzdDD.dF98JJyB__DC8PMEEjqXAE48f7zy.05yVqKPcZ6hPFReOiO3WZ
 Xaf993eD9Y35eHYs2hAAsAftGDHMCajfLhYcr3J1RmBH7CqtKeSXZiRZ5frDDyGucBakcqxqo51v
 ci5R01G1F7np55hFzr3ahqNemCOzkEHwjRtas3oEo7PxfSbhKaO1ISE8F01PZ1tPaykdfGUpJVyY
 zVC3NJou9nWVRSGAw_qNzRDuuqQIg9FFwyrH8jm.7KA3tyFg_3jJb.zLKfOeyYhyQdZcf92Nkn6k
 ehMtaSm0p._IIk61In8XONnu0jY3bkFPhXmf37oQqV3gTl3AX6Q._ZAlcnrbAG9fTRwSUwKpeEli
 5lBz.Za419tA8rthTStG6Z0RRZ_zXRYKNkJZ0.OtM8vxBM27sjLJswtpplQE7R7fLkNGmroXAq9V
 A5ue0.ewSwbaJVE.OnhwiGcn0O7IksLfblzO4NT941hW2qA..RRjDtO.DHn9t3CgrS.tjIvWWp2m
 otSbX5SVEuzNV_gMfqOmjmVBnJRF11n.ekBXxrPj9SAqLWUXQ7PysLFzuuwhLUq7Uezes.EeZQUJ
 nAx3p3e5oTQXLC1a4A8TzTVJ7rryYL02xP6_ImNztlvshwRF6NSTyEPwhnTBNXsmSWbNaPCQ9rTn
 Dg.K5DGszhL_JHM5Tcpi8DuxG5WbO5yo6xnqJvbcSmXR0tulL2GoTf3eJKr8nZogPzlNTW5s0yKZ
 UElJr5yJTncqNT_PRIZqnhcrESIF4eRgc83mG2FonKK4OLEt1bQbGneB2w3dsliLNvsB5loJ8GW5
 4FQyG3rWNnw11DnWBRmlsZ1dv3jpywDr7tI5LQsx94679y6X3jDLTSYhqDSe95o_QyaD2YIeesVD
 gRt0uhxt8hgRtGeHDRqFd910tk9DbwNmQtXqV0WvlGOqAdxsIag8WdK8uzbRXNNap4Rl1xG6684V
 6gF7NTQaFve6WY96JZY5qZ1FpkyyqCzGQEO0LMsZmRB5hx9P22ctQqGcwdezh4kS7dGwBrRol9zE
 DFV4RYel6H3NMgfrtUHbCZlFKcs3X85fQpCmXq7N7zXlW5govrMkCr0QLU1hFJoofC32VUgHzKqG
 7YMRHb4epffDGYruMb1ss9hOdEUMyB7OFFVConwCkAolE.mrqS5fhgRkInUBu3gPK5PRCC9SjOUP
 jwYIzX7G525TOKzpFbvPNBHv.GShc0l8fR6Is996zup5jWpTp3O7d3nlkD9CEbdkIza2rtF4KZAM
 fMVPS1IohAXqiGUy9D0cRDqyTyc5DDTSYvSl1uxn94qwL0JDLXIZG7OkAl_160QHULY0OegWPgQv
 9pPF5XxCqp6i9V6FnoXPs0ufi0pbKufU09Q9ifWmKqJMWxBAr5Z.XZ_ncIVmtUnfExPUtDcljtJR
 zpPQ54th.Tqb6E0hovB1CAnCTLT7SOeu6F3mPRb5EfpMlXDa9f7Nl0zj5QJRXF9NCc4vVkOkeNIR
 G3zauG61DyUrxGIKxC92jqv8oAloO9aOkuakmG3A5_vwy.WMZGcsnPGZJz5GJkYDuKX5G__fryvN
 ArKubQXWisWEXGIWO5aQQAUxeEOkgh0VNRHhe6xL6xjdqNPGTKtwyBJrzIaWWyLPFLZhK_vts5xH
 qRAf6Y1SqN7QvrG9LGie_7gPUqchbdS8aJ5H3S73dnBX6bMuCLDJocyF9uoBP72A985Ddfq0lOs5
 vr8jGpkU387oV707d0H7afNugXu4q..cEA6NAN4IUJ2R0.3yLVZX.KKzjeTh01FOGm.cwZ6Bw2OS
 aQOK6D1kRkoRdK8OJOz9v83btCUd_MaelRLTbOwoWj4eN0YcHlbpDVE.B
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: c7fa21a4-b868-4fcf-bb72-62c8c1fcc671
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Tue, 10 Jun 2025 15:32:08 +0000
Received: by hermes--production-ir2-858bd4ff7b-g5qbj (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID f3ee2e915533c3a8245bad10f061864f;
          Tue, 10 Jun 2025 15:32:07 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] host_dmesg_logger: dmesg diff on BuildStarted and BuildCompleted
Date: Tue, 10 Jun 2025 17:31:25 +0200
Message-Id: <20250610153125.4858-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250610153125.4858-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 15:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218365

This class is used to capture the host dmesg output
when BuildStarted and BuildCompleted. Then computes
a diff and prints the result.
Fixes [YOCTO #15557]

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
 meta/classes-global/host_dmesg_logger.bbclass | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 meta/classes-global/host_dmesg_logger.bbclass

diff --git a/meta/classes-global/host_dmesg_logger.bbclass b/meta/classes-global/host_dmesg_logger.bbclass
new file mode 100644
index 0000000000..0caf5f0612
--- /dev/null
+++ b/meta/classes-global/host_dmesg_logger.bbclass
@@ -0,0 +1,86 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# This class captures the host's dmesg output at the start and completion of a build.
+# It stores these outputs in a variable and upon build completion, computes a diff between
+# the two logs to detect any changes that occurred during the build process. It prints the diff
+# using bb.warn(). The user needs to have privileges to run dmesg.
+
+def append_log(msg, d):
+    """
+    Appends a log message to variable '_dmesg_log'
+    """
+    current_log = d.getVar('_dmesg_log') or ''
+    current_log += msg + '\n'
+    d.setVar('_dmesg_log', current_log)
+
+def capture_dmesg():
+    """
+    Returns the current output of dmesg command
+    """
+    import subprocess
+
+    try:
+        result = subprocess.run(['dmesg'], capture_output=True, text=True, check=False)
+        if result.returncode != 0:
+            return f"Error running dmesg: {result.stderr.strip()}"
+        return result.stdout
+    except Exception as e:
+        return f"Exception running dmesg: {str(e)}"
+
+
+addhandler hostdmesglogger_eventhandler
+python hostdmesglogger_eventhandler() {
+    import difflib
+
+    start_marker = "=== BuildStarted dmesg ==="
+    end_marker = "=== BuildCompleted dmesg ==="
+    diff_marker = "=== dmesg diff ==="
+
+    # execute dmesg when BuildStarted event is fired
+    if isinstance(e, bb.event.BuildStarted):
+        dmesg_output = capture_dmesg()
+        if dmesg_output.startswith("Error running dmesg:") or dmesg_output.startswith("Exception running dmesg:"):
+            bb.warn(dmesg_output)
+        else:
+            append_log(start_marker, d)
+            append_log(dmesg_output, d)
+
+    # execute dmesg when BuildCompleted event is fired
+    if isinstance(e, bb.event.BuildCompleted):
+        dmesg_output = capture_dmesg()
+        if dmesg_output.startswith("Error running dmesg:") or dmesg_output.startswith("Exception running dmesg:"):
+            bb.warn(dmesg_output)
+        else:
+            append_log(end_marker, d)
+            append_log(dmesg_output, d)
+
+        content = d.getVar('_dmesg_log') or ''
+        if start_marker in content and end_marker in content:
+            start_dmesg = content.split(start_marker)[1].split(end_marker)[0]
+            end_dmesg = content.split(end_marker)[1]
+
+            start_lines = start_dmesg.strip().splitlines()
+            end_lines = end_dmesg.strip().splitlines()
+
+            # generating diff between BuildStarted and BuildCompleted dmesg outputs
+            diff = list(difflib.unified_diff(
+                start_lines, end_lines,
+                fromfile='dmesg_start',
+                tofile='dmesg_end',
+                lineterm=''
+            ))
+
+            append_log(diff_marker, d)
+            if diff:
+                for line in diff:
+                    bb.warn(line)
+            else:
+                bb.warn("No differences in dmesg output.")
+        else:
+            bb.warn("Could not find both dmesg sections for diff.")
+}
+hostdmesglogger_eventhandler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted"
-- 
2.34.1


