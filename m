Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id D65B47D1E9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:13 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id y8so20149156pll.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=74rCtwQtiSnwIRYp71g7mA1/bolwhrIDKcQq2jHNBn4=;
	b=d5iVjP5PumGtRngFaPgLHrwnrTVWRJHH/ZigcSmdX+bJml4Bk4dOKs2rVJF/IK62Tf
	pLwlJknE3b284O6AeCkMPLpefPRDLXzGoW+z0uNkptfLHJSDHSCMiwW/86j5E6GV9r4v
	GFuAN+1Kob5NIKsXUpgW/64H7WgHpwaFlXcIkrckzYQxFatLbjWR2P+ZgT+XDHWJU8q1
	Z70y2ASHoWoO+0yss1Cz/pixtEewPj9ayEK5BhxSeMJJtM7WVnktl0X57t6SlMmvhfAr
	lNhKfo6x+LZrDu/6UTxd8PiagwioLmfGgK0sGUbIV/dtGLAbXvyzcIfr9tmWvwE1kAlh
	ak8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=74rCtwQtiSnwIRYp71g7mA1/bolwhrIDKcQq2jHNBn4=;
	b=cOAWj4KVFOkefYvJV94KepVTlB6gM8fDJn4Dp7KY1FZjCHcfcqWzgl+zaINwCrkR+P
	y9nyeNy68mtSL38cB7fjL98+lb6c7kHzS6klWLp2qfLjtH9XFDLC2jTFNwlOzdzqAow8
	zpF0Rbi1cTUhImkm5yovZWL/usHOUMKm3LTroqGzOFp//AwmVu6jyZnPGfMZFp/ZBGy3
	m0IAo0bzTA35p0mhmfHJt+mAgnC8JvHH67p7fKtVPh01HZe8pmlUiBVLfFddbVzS8FlS
	FKMpv5XjgFZTgdYGm9CegEFbEEX9Y3tAKul4vG8QGvN5rWyeDB7+bCYvq7gWnydPTKl1
	oQmA==
X-Gm-Message-State: APjAAAUaQ4JOmhV1mMsxFa6ZQ1Zi+hyD/KftMjfSIiGBnC2H0463blsi
	A0XGs70mASw/BHjlnFBrXyqNWFxrjrM=
X-Google-Smtp-Source: APXvYqwLjlXKnxfZqXj10Su9/xRqLxufmPRajEK5kbthr59/MsXizhnqxmn+8ieb3f3UAwGEXUcuUw==
X-Received: by 2002:a17:90a:ac0e:: with SMTP id
	o14mr34351241pjq.11.1578155174839; 
	Sat, 04 Jan 2020 08:26:14 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:25:42 -0800
Message-Id: <a67bd96de2b253c1d4c3bd82120f28dee06a4bf6.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 01/29] sstate: Add ability to hide summary output for sstate
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:14 -0000

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


