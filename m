Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3838.1795466176335394912
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 12:36:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=x7uAHR6E;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so36827435e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 12:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466174; x=1796070974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqetwbQe97KaiBfjf+91wuEEKOvtQcb0L83cLNr7g24=;
        b=x7uAHR6EkzG1umfLQ7/HYDr2sR11HZYfpFJxOhBfaYJY6Yz6+mNYyVeX85pXz65g7J
         Ce8zX1392JfaWrWCG9UTIduqN2fHqFQ3CtBbRGd3apGoC5CalRXZKB9wjpDDL6iryn5n
         23T0T9abULjqKHc78bscmtEbbOLZH7sSB/cZpyh0i35DVdDgO5af85szVYCDT15OTXIr
         elznZ+U9yOWUqX7sQZIzqaiz5GEbS5/lumLFdosd/hq4/bXWQ97bIk8ec9qHVljLlyHk
         mf3KLKLZpxvQdCJtu0DugUoTAkbzKe4brJYU3+O6yAQKF/JIDXz7/jpP4OplPWZ6fDJV
         h8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466174; x=1796070974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqetwbQe97KaiBfjf+91wuEEKOvtQcb0L83cLNr7g24=;
        b=PatfUT6FZH/VRoFesJHNYzlEpqYpB8vOTHdtOIawSWRssYhle+YpdgECFjYLdVE84f
         x/O3QJs7rU5LslF3xPH5Cc5d93bOalwvg3bb3aPuHnRsgyX+hxYU76XIfryOH+QlbqzF
         Xws+vfl+y+zTO9wPvctCUf11Aik6BfFe+a78Jfs6TJNBkHSNKfCn3Jb5mNL2EX7UiAai
         dtA/d209GJl1p0qlL6Okrl4SBUet94fRiTaYv8oSGn0LsMnR6Xbhqt0aFXLiE6EQ/KVc
         xx+Q9C9RJXGKe6MZ1h0dnyUjRPfbHgSgYeaEuvp4nqIbQQreM/0jTnIO3EjAFO+x4nVr
         XpDw==
X-Gm-Message-State: APuU4Z+uD9hSMhY1egKqSEML9PtpC8I8BW4kKe6mNEcxby1cSMB8px2y
	W6mZCc7VHc0Gie+PAmxADyJfeMigmWMKzv7JtcmrDXy9DcVaJE2VLHAlmT8SwVZ5
X-Gm-Gg: AZFdTZfzc6CslSpcjGIQpn+PqTDTFlqLDv71EyNLofis4sAGQ7V6bj/dcktg2jHfuye
	9kPg7uWVw9NRmq8U71f/o7LX3MOpGTyRi2Yz5iuh1S1UUaXwAWunnAcVhXXul33/t4BDoqMAUYm
	uaw98SpyhNWe+89cMIzw+IZWpNSpY0p+us9uSW6iLJave0LvqRGF7+qODUNQMSiT8NQHUrOCCQs
	2gtghYxwYGYVih/lMLSKSowBt/PJc/YEkOpsRsUX4VX7d4XlIfcYwrJIEY4wtLm4mDSbWAPQRhi
	kR608fIAMEBYKQWuhegYbOMOuD0nv+EuoEwq7Sq49EP+RgmkjVq26wMxWkW8UjzxKidhtqm+BnH
	YvSR0oECHVtwbXlsylnWydD3YfXs5V+byOGESPMSnr/X591DMwKJ7YtgyGePX6gLliuMrcKWh1l
	Vv4FioZUpu4aruOJJRrONl0r0WrYj4PkzGb5MeZ7p7G4L9uy0t9MUDmYf6wIEeyattOpsWoZp1P
	g+Zu4pdT4FIfTgh2OqbNc1zTaPltOF9jCE2Iux07t00l6BCCJbtZ5gPD5GGwYmAMiyO8oyozjKu
	9WjplUmn+LA=
X-Received: by 2002:a05:600c:6298:b0:4bb:6375:aa41 with SMTP id 5b1f17b1804b1-4bb88934652mr240091145e9.27.1795466174333;
        Mon, 23 Nov 2026 12:36:14 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm303916265e9.2.2026.11.23.12.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:36:13 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [PATCH] sstate: do not cache the exclude patterns in the datastore
Date: Mon, 23 Nov 2026 21:36:12 +0100
Message-ID: <20261123203612.867600-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 20:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250938
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

setscene_depvalid() stores the compiled patterns of
SSTATE_EXCLUDEDEPS_SYSROOT in d as _SSTATE_EXCLUDEDEPS_SYSROOT. When
bitbake calls BB_SETSCENE_DEPVALID from the runqueue, d is the cooker
datastore. Nothing removes the variable, so a memory resident server
keeps it until the configuration is parsed again.

The value is a list of tuples of compiled regular expressions. If data
tracking is enabled while setscene_depvalid() runs, the variable
history records the list. At the start of the next build, the event
log writer cannot serialize it to JSON and the build fails with:

  TypeError: Object of type Pattern is not JSON serializable

Compile the patterns in a local variable instead. They are compiled
once per call and only when the function needs them. The results of
setscene_depvalid() do not change.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes-global/sstate.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index c6d9459182..c35824bc25 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1106,7 +1106,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         bb.parse.siggen.checkhashes(sq_data, missed, found, d)
 
     return found
-setscene_depvalid[vardepsexclude] = "SSTATE_EXCLUDEDEPS_SYSROOT _SSTATE_EXCLUDEDEPS_SYSROOT"
+setscene_depvalid[vardepsexclude] = "SSTATE_EXCLUDEDEPS_SYSROOT"
 
 BB_SETSCENE_DEPVALID = "setscene_depvalid"
 
@@ -1160,6 +1160,7 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
         return True
 
     spdx_deps = []
+    excludedeps = None
 
     for dep in taskdependees:
         logit("  considering dependency: %s" % (str(taskdependees[dep])), log)
@@ -1187,13 +1188,12 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
             # them in.
             # See also http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146324.html
             not_needed = False
-            excludedeps = d.getVar('_SSTATE_EXCLUDEDEPS_SYSROOT')
             if excludedeps is None:
-                # Cache the regular expressions for speed
+                # Do not store the compiled expressions in d: it is the cooker
+                # datastore, which is kept across builds
                 excludedeps = []
                 for excl in (d.getVar('SSTATE_EXCLUDEDEPS_SYSROOT') or "").split():
                     excludedeps.append((re.compile(excl.split('->', 1)[0]), re.compile(excl.split('->', 1)[1])))
-                d.setVar('_SSTATE_EXCLUDEDEPS_SYSROOT', excludedeps)
             for excl in excludedeps:
                 if excl[0].match(taskdependees[dep][0]):
                     if excl[1].match(taskdependees[task][0]):
-- 
2.56.1

