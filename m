Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0368A7FDCF
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:49:51 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id l35so581551pje.3
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=74rCtwQtiSnwIRYp71g7mA1/bolwhrIDKcQq2jHNBn4=;
	b=cB+bZnDEeSzRMweMTLpisl4NxR4kwNtpdlozzcxWgAgP/5VgpOVdyeloCSKm7PwSSG
	O0g9ZNSAj73lZg08D6IWxrAN5Ay5qNN5fw0EQl/YAcEccUvDf0a8yDqztz7GOR5MVJow
	JIpIT4J3FB/+FuJ3HcdKb74mahZcoM3LqNDSsT8zYdkHQfCAlDoLHL8U4udzpMWEOQCl
	wWSWcV5uHbwE0yQCAzlTUsei0h/tmSbrQh8qrxm2Es4FSOhWqCqKqWAD0/h8f3fBwb1a
	nr9ZRAxewZ/ZdTRpeqG5wTpCMcDjmOtFzCAS62j1kf+ExT1ywrEjCssSn8VBDX6NUa8g
	/Ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=74rCtwQtiSnwIRYp71g7mA1/bolwhrIDKcQq2jHNBn4=;
	b=DzzokBwcePlmrvfaKePXMzc75hDhyxpHRE9b95uzhV6kKFV12zeU2dLpbI+VgxeHVm
	VayzP4BShagpSOhoqHUMaJr4bxemk9WqejKoYt/fMxtF+vBHOrw/4XLfuEYsgVmUNQKb
	Xa70lE/PWrd2a6jqAYpTFRBBdQ5hKcp4dDqhbxZG+vbUeSc/9h1Zgm5/qnYOtzXcrr4a
	nN+U6uZWIjsnQ19BbKKZyVGuTUENb0aEHFj39vCmZp2NZw5LhpBMOIrA/V3BB5jHlNQ+
	i0dhKJMh4uAUk96wcEq3lGAjWUPT1vxicMXa1uNXMbJ3skjmaq5XQeeHJVSLfqzWqVFS
	FB8w==
X-Gm-Message-State: APjAAAXJNW/1fiayzkieapbqPmJEZquRZ/z94tjTze+BpzFxM+HDRqVU
	UwzG4gwqKjcgVguFLnIFG2HsHT4b
X-Google-Smtp-Source: APXvYqy05SshkpHiKvD0JmsBBn5ZdUcrONWuy/t/7QPudNNMsJn+dy80g4Ytrzv4/j3mLgHPtr9xYw==
X-Received: by 2002:a17:90a:23ad:: with SMTP id
	g42mr2902960pje.105.1578545392955; 
	Wed, 08 Jan 2020 20:49:52 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.49.52
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:49:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:20 -0800
Message-Id: <a67bd96de2b253c1d4c3bd82120f28dee06a4bf6.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
Subject: [zeus 01/28] sstate: Add ability to hide summary output for sstate
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
X-List-Received-Date: Thu, 09 Jan 2020 04:49:52 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Its confusing to keep seeing sstate summary messages when hash equivalency is
active. This adds an option to control it. A default value is given which
maintains compatibility with different bitbake versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 038004866ff6650bcff7bb1bde36de6c0f451d29)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sstate.bbclass | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index b47b9c23bf..64808f8e10 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -818,7 +818,7 @@ sstate_unpack_package () {
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
 
-def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, **kwargs):
+def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True, **kwargs):
     found = set()
     missed = set()
     extension = ".tgz"
@@ -951,16 +951,17 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, **kwargs):
             evdata['found'].append((bb.runqueue.fn_from_tid(tid), bb.runqueue.taskname_from_tid(tid), gethash(tid), sstatefile ) )
         bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
 
-    # Print some summary statistics about the current task completion and how much sstate
-    # reuse there was. Avoid divide by zero errors.
-    total = len(sq_data['hash'])
-    complete = 0
-    if currentcount:
-        complete = (len(found) + currentcount) / (total + currentcount) * 100
-    match = 0
-    if total:
-        match = len(found) / total * 100
-    bb.plain("Sstate summary: Wanted %d Found %d Missed %d Current %d (%d%% match, %d%% complete)" % (total, len(found), len(missed), currentcount, match, complete))
+    if summary:
+        # Print some summary statistics about the current task completion and how much sstate
+        # reuse there was. Avoid divide by zero errors.
+        total = len(sq_data['hash'])
+        complete = 0
+        if currentcount:
+            complete = (len(found) + currentcount) / (total + currentcount) * 100
+        match = 0
+        if total:
+            match = len(found) / total * 100
+        bb.plain("Sstate summary: Wanted %d Found %d Missed %d Current %d (%d%% match, %d%% complete)" % (total, len(found), len(missed), currentcount, match, complete))
 
     if hasattr(bb.parse.siggen, "checkhashes"):
         bb.parse.siggen.checkhashes(sq_data, missed, found, d)
-- 
2.17.1


