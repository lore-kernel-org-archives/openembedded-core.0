Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BCBC8303C
	for <webhook@archiver.kernel.org>; Sat,  5 Jul 2025 17:57:55 +0000 (UTC)
Received: from sonic306-2.consmr.mail.bf2.yahoo.com (sonic306-2.consmr.mail.bf2.yahoo.com [74.6.132.41])
 by mx.groups.io with SMTP id smtpd.web11.22271.1751738270287481061
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jul 2025 10:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=boSiSEyL;
 spf=neutral (domain: yahoo.com, ip: 74.6.132.41, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1751738269; bh=AcgYiALuTRI+1+0cQIW2QbJS1KRK301DH3XKT+Go+r4=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=boSiSEyLqxZnxRfbtPFAw2FY9qmsCAhCIKRL/ZMtTdf4ooC13iUKbTgpPz8IaE5p0S+qU5HIM/q9uy17d8+EcZ0CNaZddLSD/aQTd3EsuFjSBrkb+grjo3xuIBfcxEbqBCbhFqzUWGWPfP91W4GE7qImhICrZoffcuPHYsISsjpFbviF3Q8DMRdHzNYvY9tabUU8JyUxeiyUhrkH+/n6Jx+1e8FVW8gqZDXc/QnW8v5YnMctBpde780k2Xpa1AWiR89A+Gdxd6a9ithow/+UBmUg+qKrCo2DTFYYrdAZZ/hq/t3lbcen865iFwZHEFlaUUa1O8Tnp31dOoggyTUwkA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1751738269; bh=a3e7mxh5t8s7oYkKuWDAxRBuTVqxpilJDryzf9nJ9yz=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=ex1GcyySa1kCks2bivqZqPS0IlzUWLOBBZ4FRJQNrV/CSnsbk9/aI6f/ekOG2MnooFI2aWd5XQPC81kPteWoJyV/oSZTOM6E4MPFLuSm3X2Hm0XoX6eVV0skAmfb+AazYC/X137T0XIAQnMEXUZjieoMAq9juj5C6ouO/MilS7BBRJ+PU61zS9pOH2vxR1Tkw27C+N+LAX6ucPYhlZ2PlgV73k0KFugyc9Ie5nuSQjypA5j4a0DqWJ7q8cqQBfQi+/O9HzohuvYxscd7rMU+qr3DnQZFtuYMnCxs+HQsH+utTwLyYer0/bXaLi85I+DTm0AwZw6BoDlhzB7REV2syw==
X-YMail-OSG: C_P7pDwVM1ld0PPtjpQJKt5h.SGl3cwf6duAYgJQ.45f178Ih0PN5mQiy1TvZJB
 MYsVCsKBPkq5dNkgnJnCEajWjasBVBDsZ9gQkN59YPVbnbrHCQTkJ_WWyOQDJ44j85Ca0x2LmcPa
 w7nxHSJB1fR_1pCcqIH4qEu2IVVGQAvJBg2VR0ewgxaoNjHfR0V.S8QKVR70u0onU32WVYzCiL8A
 DfrfT.yFODSA82PbrKqI7fncCYRMe.bDUD0Lz1VpkwCb6eiAh56NqDMhdI13hSXW8WWesrWNLE9r
 h46jGfmSzjpvFaVhnbea5.br7tMvxaiwxN4dxYgQTM1MjVTGQI2wsqNbZ3VTX_MAHV42bZwSGLLF
 uW7CGlIyC6XfKA19yNj9U9yk5ct9WuaXrIxGtml_GaZLZhsDvvsObjHQRDBwkoMyWg5HhJdxpllw
 jA9gp1SOqSdI.WcF1LKRdgFJ_1.6._plmgdIQN72DgBpyY3T6v_KqoJHMbmkwkr76LW8tPFk5gVA
 i_R25OxPH3FJyhidU6bWtnafHKBXYgZqJueq5CqjcBy.VXr8tjHcRsCk5Vx4FDCkS9egYA9ORiD4
 z3F4bY.4.RQ4ErQrUha7A7q..yoHDKlddXF0FYzUPZdXAt1s0XdRhYFJjfMB45s2U0ZvkszZ6pNL
 MiXZKvurCWHMjJBIWS0JlmqhumoHxqX.J.g1N7PCJEEHLWKDA2MPBPA6YuDFM9Jdh.mXaH9B2cf4
 7QhqnWCVC3oQUq6ERidTrw7.WdqcMpfGkErayTBPXVS8Ggab0uQaLZee.qmw._AnA.HtMe5Vwa5D
 6P.FxHjMLsILkaYPjBHBtT2QBpFpEx9MzfQ6O41Kd_Da2nDM9d8Hcf75EMVaLd0p2SeLEe0i3HVa
 oo4tJAGNmGBCYdcTP_po_nh0mbr0ut2CCYeETgEblNDl5x8mLflchxJ1nmA8unWlKn2flE7SCJsA
 ScNbu10hF2SsE4yQ7bW.uUzjjk6oa2PBz3hl3qtVNKWGeI.qoehuzL2u5QZXW3Xfa_3ODzt7Z6AG
 2ru89Oo1_9aLiN83wvkCOKmjqLC1cxwQ76f5mDQPCWnHsXYwxPqdf.R.j5bY6HBTyxboF9fr2dXr
 aQ4kDJ2DPEXl2EG3mdDGsblZOQDLmHqsnf17iiwybh08TPqrOHeUDsNym8T31RNObXW6rh3EuGul
 wUWncfpSd5lvMgvSMtoz8O.EJZnIIQlNJVaWw89oc8cMtP6R8IGpRB8xpZ0o_.9jmh4bRagylgQ5
 DXAQNfIEE4WLhJI_pn2Ai7IOhCGbokysFzGxo_g_aD7AMsFmR0Aa_P_tnVVzmtOODhM5m7DKNemr
 ID0bBKpyGP7FhAr7QALCZipSY0NhZFs.JvosT9uPosyS3hnvUbxYPodcKgFw5jnensiZCaBtSSyz
 7MEzsG8rcP42t_suZ5xxWIcCPZz.o1PLv0GlkhQRFukCFwuahC66Qii8OQdHFnU6DfTrQWJtjGDm
 mYsRpkg4DJYIyjCh9vpmObyUSm5y2NZpaOeXbirDfUp5qS6aFKb4UVNfSqA7Xpqw_Wk2C5yBLcFt
 38tmEz7wKiWNTQrj9OXd2tyLBtlglMx92wseF0TOGacJylcby0.3fZb6Ek6O7WhCX.fVHzFsiCq_
 10HI7x8fizLiPa8PkYkiday8jWYEXeAHNAEoQ0cOH3kO_3M_99J3mJMVq._KXyJ_ECa_g3Wvm4MM
 eDk3B1Ky85W1rYntvk7l7_Jm37aoMDRptmbpWP0SMxaKjBA7iS8Upcz4S97A59vw44p_cE2utIHb
 .akXWiatNCo33UJVU6vayrU_g4M9JNTOgW1TT3r8AkC2n7BEhmaEnh5lYFzNitMKgO021xR.ZUKN
 hSHz74al7aKDq8mvzZbANRQyGt1bBt3WMjEHuM14iNsgdldjpFkuMPHE0WWKKdStMDnO6YzAeGnk
 J7L1rs439WJr06hlSLFPbJ3du7j0eNJUkx1f4Cs9gEunyZlSSSJofiOYpji4XbG9qkBIPllEJ1Sk
 WEAdoFotLWuamwJoJA38zv62iEl_SwSLTunAo4Y.o6Bs6ffOyqLdgwrl1XdvXwli0rfzqxkhYGao
 gnpUVXa5__bliEPSnH1kofqEoVbyXXGkxr2M2NmLB9dsmL5fQAqvn0c.NZQWMmWtuuVaBHx9O6bF
 XRll6tTwuFh01zhKQIBcqDV5SD5_q3vf.z9cMSwsuH5qt3IqyN93YVAQzSKf_SDDyRWy9j1rFiBn
 Mgw9ak3Re5wDAnng2705m3HxoMGav0JfLeSlzzwfuSLkwYyvusH6j3pANXIVyhJo-
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 725f7a6e-a323-4e7f-9cd5-837c4c7ffc95
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.bf2.yahoo.com with HTTP; Sat, 5 Jul 2025 17:57:49 +0000
Received: by hermes--production-ir2-858bd4ff7b-rsjdf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID b7137552bf604dbb3e5253eb81a7ad03;
          Sat, 05 Jul 2025 17:57:44 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v3] host_dmesg_logger: dmesg diff on BuildStarted and BuildCompleted
Date: Sat,  5 Jul 2025 19:57:07 +0200
Message-Id: <20250705175707.394405-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250705175707.394405-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 17:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219957

This class is used to capture the host dmesg output
when BuildStarted and BuildCompleted. Filters are applied
to these messages.Then computes a diff and prints the result.
Fixes [YOCTO #15557]

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
v2->v3
* remove message 'No differences in dmesg output'
* show message's log level
* capture messages from notice level and above
* include messages which contain keywords from list keywords_include_messages
* exclude messages which contain keywords from list keywords_exclude_messages
* the description is extended
---
 meta/classes-global/host_dmesg_logger.bbclass | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 meta/classes-global/host_dmesg_logger.bbclass

diff --git a/meta/classes-global/host_dmesg_logger.bbclass b/meta/classes-global/host_dmesg_logger.bbclass
new file mode 100644
index 0000000000..a7c8e04c63
--- /dev/null
+++ b/meta/classes-global/host_dmesg_logger.bbclass
@@ -0,0 +1,148 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# This class captures the host's dmesg output at the start and completion of a build.
+# It captures messages with log level "notice (5)" and above. Messages that contain
+# keywords from "keywords_include_messages" list are captured regardless of the log level.
+# It excludes messages that contain keywords from "keywords_exclude_messages" list regardless
+# of the log level.
+# It stores these outputs in a variable and upon build completion, computes a diff between
+# the two logs to detect any changes that occurred during the build process. It prints the diff
+# using bb.warn().
+# This class is intended to expose failures (e.g. segmentation faults) that 
+# are hidden or ignored by the host build system. However, it may also capture
+# irrelevant or unimportant messages.
+# The user needs to have privileges to run dmesg otherwise the operation is not allowed
+# and a warning is generated.
+# To enable dmesg logging, add the following to your local.conf:
+# INHERIT += "host_dmesg_logger"
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
+    import re
+
+    log_level_map = {
+        "emerg": 0,
+        "alert": 1,
+        "crit": 2,
+        "err": 3,
+        "warning": 4,
+        "notice": 5,
+        "info": 6,
+        "debug": 7
+    }
+
+    # keywords of messages which will be exclude in diff regardless of log level
+    keywords_include_messages = [
+        "over core_pipe_limit",
+    ]
+
+    # keywords of messages which will be exclude in diff regardless of log level
+    keywords_exclude_messages = [
+        "keywords_to_exclude",
+    ]
+
+    try:
+        result = subprocess.run(['dmesg', '-T', '-x'], capture_output=True, text=True, check=False)
+        if result.returncode != 0:
+            return f"Error running dmesg: {result.stderr.strip()}"
+        filtered_lines = []
+        for line in result.stdout.splitlines():
+            line_lower = line.lower()
+            match = re.search(r":(emerg|alert|crit|err|warning|notice|info|debug)", line_lower)
+            if match:
+                level_name = match.group(1).lower()
+            else:
+                level_name = None
+
+            # include messages which belong in the required level (notice -5)
+            if level_name is not None and level_name in log_level_map and log_level_map[level_name] <= 5:
+                log_level_ok = True
+            else:
+                log_level_ok = False
+
+            # include messages that contain keywords of "keywords_include_messages" list
+            include_message = False
+            for keyword in keywords_include_messages:
+                if keyword.lower() in line_lower:
+                    include_message = True
+                    break
+
+            # exclude messages that contain keywords of "keywords_exclude_messages" list
+            exclude_message = False
+            for keyword in keywords_exclude_messages:
+                if keyword.lower() in line_lower:
+                    exclude_message = True
+                    break
+
+            if (log_level_ok or include_message) and not exclude_message:
+                filtered_lines.append(line)
+
+        return "\n".join(filtered_lines) if filtered_lines else "No relevant dmesg messages."
+    except Exception as e:
+        return f"Exception running dmesg: {str(e)}"
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
+                fromfile = 'dmesg_start',
+                tofile = 'dmesg_end',
+                lineterm = ''
+            ))
+
+            append_log(diff_marker, d)
+            if diff:
+                for line in diff:
+                    bb.warn(line)
+        else:
+            bb.warn("Could not find both dmesg sections for diff.")
+}
+hostdmesglogger_eventhandler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted"
-- 
2.34.1


