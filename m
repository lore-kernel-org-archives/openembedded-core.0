Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1A7C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 17:16:50 +0000 (UTC)
Received: from sonic314-13.consmr.mail.bf2.yahoo.com (sonic314-13.consmr.mail.bf2.yahoo.com [74.6.132.123])
 by mx.groups.io with SMTP id smtpd.web11.638.1750699002260107479
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 10:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=C+mpzbhD;
 spf=neutral (domain: yahoo.com, ip: 74.6.132.123, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1750699001; bh=W01g9K8H/cD0XiPbmTOK2K1WXjW+wtzr4AUfaGJYeMY=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=C+mpzbhDl5+UMxSiTbKWPpB+ukvzES5qMaFcgf53/aYFvMvEN+MGjuIoj365jyOwXx8JhWRVMgKXqRrnDPATnmV2Bp+GEKDz+8lQCVyC1uZkx8qG0a7eQK+/JKXX1qeXO6Dyj/u/Z9E6seOzXKaGOA/rloKa/U1ftum7t7OBSOk5FBXmUk24Q9WlUnPKJB2+V805zyWv3dCDKiUMw2klDHZ/tg5hbaE4OOIUUPTdA76y6HJNgRcnBvSEtvqjrNNs9OmtDNOjhjZhSTJRnQFrJfJNMj1HF/nLDKipKtPqlt56wfU+6deoKmHc47zm7so73/ta9byUYADAJp6qYcrzEQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1750699001; bh=0RxwnLxFAgfJwN3m6wRW0fC+3cqNPfY3S7ua8zuXajV=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=KQ00BJYlAS1D79v2EDozR8xsO6zfop4xHRZV2HKO/cDn5Pmeg+7YDbkKrMVRZS5oeeS7oF4U2+1bCHXTr7S/w23CH0B9HJALHyJQiDDMZuhsfx95KWu52zckGfXw2ncCfm/By38qgURUT2d2O7j8DYUOkxw8NJ1RoBvjCO3UANQw0m3GutugI6ekUF3dPvUHry6G+I6GUeGkpFCnfIVFQJtmEFbUFY9MCF4cB4IlhBcQBLHx7pdA4d9HIhvDtZMpic2rERYKIscKwBz65n03M25Krfd6cMXKZc4MC9oKq5M+9UHEcM5p2Ea7bKyUvzGWDXehILqzE17brMsrOZPMaw==
X-YMail-OSG: QsuERAoVM1nryr5N2U6dLN4b_fXQA9F.mBusCMjMXvaYSSYkbFBT10baNWohdn2
 fEdP41.nnHqxl9Ap7hkMTvFf4oh3_FIKrM72T_ZoXeB8Yv8PB1S6cG4jg07SPjodIFM2.hvC1Zoo
 6rzlG.et6gqb_3DMB0KtTSBtXC._0hbzxNzFLZM26TcjcszpT.vUE7.tHpL6SO0BYptvaR1EASB.
 a5W1KIlZgL6NcQ7tKVhJM1z9aMSflhVyWFMrEaHnqWIMWAOZIOkGRTgM6muWaNtGXoPG3bLZsTdg
 VKPQcG_Z5QiW1SrZpyrj9v2HAFmHWSLzE7Qt321kIHEKsvq2Arih5SnqbzfjdIboMYRANadUVk5t
 qnWkzdIrSNgA4sxCYZmHvxHo.3NoXKg4LKIkd857OgYBK_NeDsT_0ldmsHGld96_EMaP0vFq3MrP
 2Ksd74mHVg7iwSc4aCX.u1KhysNy_px2a3mSIhgaZnShPPMnpVtCF5Mh9IvbfX4ZxuetM6SmA3TA
 OlLZ0qqlUB_K4KV6Rv7sJQikP4DErgude5Jv1wem_qYDlTK66heZZjS8OKcLAkDfdNqu2nc0T1fb
 7G6YlAVgrLNDo2AS.gvmEQrYj6VrgJvZ73SKrgr3JDoOE9ZnA45CIQHfL0bWwY.KKpm4zJ3c4nEh
 7tqGr9ULba7T8UDthBaZHz6fbd09KH44FFiZmGgEXiymOSgEX3m2wPaIq.MJjapcE5ANWLfyRC9U
 FymdcrSrU9tTJ1kbf3eR7.dkTgty1b8dIDdCkXOcdB76PKgDlccfipY5.N5_jKIaqWwDg2yu.bl_
 nwT6_vGnTf21SKnxNjeW_mChLz763QpQt9NtoBPE3kjZoEPFV9hYWT.gevrHR9qYp0b4X4gcPoIm
 ouELMATu_PbWInnpaKSSzroPa3yEilKW6WmHA6q5v7v6KbEhVNz_xNkmmwTKi5PyOC_04VZfTYyG
 UjcEd3oB_.9AOv67a0FPjgnZJsit29n6q23zUqcWFFD6nju10K1DC.KrWIGrZ8JH8j_BM48Hm_1N
 aMH6GAc.rOiNN3zE3x1KCTMzPq3Oba_mG3VKTrT56VmDjlssBiltM61Ihosul4kiBweHBck.qwlG
 v1JZz0M0GxnZ3gmgoVWYaRIEhEiwFfuWpVgseqUiOC1BRthdIo0DyLvGzIs5xGmXf3rJQmZ2di_p
 lkVfZR87CDjyP6c7VUJdwHmNL17wE6fLcleZnhIjhE6RCkkc371Ac9THGZTy9T52LLfOc8f2o92r
 DRaL45JEsfqP2jafVxT6eeN6N6LSQGSczC5iFb1BkENSsKwdjB3a.EC2RhYqJVcoEJNrcIaRnm_6
 x798cilnoRhG6_ujog4_dtvikx5Thr7YqySJyYCD0GKCO8r.w1E..j.xyk3dTITuhyGM63IcsLyd
 Liv_h1swaD0aQynRQgyKWZR31W79UMVbJQ_uVdWx_.mt7lY.2PvWUZqYIsRyU6RAw26FNcYsOwW7
 xfA3ybRzuMg3Q0joHIsyUjofQek5wPUDIlGTLB8GvLsSDG4GgHnNS7SUxzTg3T4mQ5ptVftzpgC5
 viF_nNEYvNuFc0tz6_JbszYJjafxUN.MMlEBJ8fXoc8pdFRzIJARRKOFfVBzTMjCOZzqeBlsLiGR
 rHSproe9OF4QeTSFl3QqEcKlQanp6tMJnyvyHK9VyJhptS0DvDTPx97e6FPBF_ST1yryThenZCR4
 E7MtPkLt6fjAQkhHwlt1nhLXz0I6iChAb6vLHcjQFDw260zcCtjk8nhVjhWtKAoUm.2p4KFa6Xm2
 RbTFXn98M57K1VMX.TB.PRLTQYexmP4da1UM.eDtqCnqYGFOY3sT_Dqd55iMVrZpYgJ4vd754ge1
 aQA4HYPAz.2mYoLng8nF5wa948QSy95ES_3duMfoK8D0_78qWVYe4HvjkH7vXgq305Z7lZ1V8Zfk
 Yz.h9j.jQAlGxshlnP5cvFf36OcJFAjgpwCTk7NzPOi7FtNmQ9ZXA3waTHcxSnO21mqrpJbkhwlS
 _O1UDdxKBzPwdLFUTVrhocZnmEZ6QTj1jqmrF3EotxLa7.DbrRIC1Fe8Arc4ed.6jTVgf.NgTCnj
 labBUgga1tvsdflcOdFsufDvGDZAFg45tJsfDBCzNtnIhui0TyUVJi31tvFc5PEw99eOLiAgXnVL
 Hfm4VVrHi85IH7Xb.ocL_2wlr4etAXyvt.8Lho.pgAf3ngWhBzpqfSIKi7xQz0iEIsxS8VKYIYVo
 HtVgU5pEeksae.2LEFL5ojtPPv8HuE3JdeyOp050NzD5e7iJIfCioZ2zr6Psu1t6W
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 36a5e78f-fa3a-4e0e-a7fd-6b54b40ea82d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.bf2.yahoo.com with HTTP; Mon, 23 Jun 2025 17:16:41 +0000
Received: by hermes--production-ir2-858bd4ff7b-xdmpn (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 746bc07846a319d1b1179db2d730f38a;
          Mon, 23 Jun 2025 17:16:35 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2] host_dmesg_logger: dmesg diff on BuildStarted and BuildCompleted
Date: Mon, 23 Jun 2025 19:15:52 +0200
Message-Id: <20250623171552.28824-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250623171552.28824-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 17:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219218

This class is used to capture the host dmesg output
when BuildStarted and BuildCompleted. Then computes
a diff and prints the result.
Fixes [YOCTO #15557]

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
v1->v2
* add in the description class's usage and drawbacks
* add in the description how to enable the class
* add spaces around "="
* run dmesg with '-T' option
---
 meta/classes-global/host_dmesg_logger.bbclass | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 meta/classes-global/host_dmesg_logger.bbclass

diff --git a/meta/classes-global/host_dmesg_logger.bbclass b/meta/classes-global/host_dmesg_logger.bbclass
new file mode 100644
index 0000000000..fd4261c53d
--- /dev/null
+++ b/meta/classes-global/host_dmesg_logger.bbclass
@@ -0,0 +1,92 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# This class captures the host's dmesg output at the start and completion of a build.
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
+
+    try:
+        result = subprocess.run(['dmesg', '-T'], capture_output=True, text=True, check=False)
+        if result.returncode != 0:
+            return f"Error running dmesg: {result.stderr.strip()}"
+        return result.stdout
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
+            else:
+                bb.warn("No differences in dmesg output.")
+        else:
+            bb.warn("Could not find both dmesg sections for diff.")
+}
+hostdmesglogger_eventhandler[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted"
-- 
2.34.1


