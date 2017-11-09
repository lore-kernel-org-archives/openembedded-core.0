Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B3E4D784E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 02:26:38 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id o7so3502273pgc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 18:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+AxKLq0FpsMwo+scdb5nZXPWYsx5CCAwmG+O0fBmKlw=;
	b=Qa4n06xwZqE+74pHN1qT+FkxMppJtW0YkvnXWKIsarva8Mhsxk1QksmPT7S6mp3c+0
	R0178ZNmSJ0ZgHhFIi4qTAz8ohlvKsu0lDDbwu4JpUnkaD49p2udDea7eiXume8iQE3U
	kNuLC2DS1hrZ4erjeJkQ0CVtxg0pAJ3rE4CJZHvsfMOxgWKwq1HOwvWLndHnU5CIPKH4
	vtHG18f8UoW942cOinPhkCeYdVKYexpCvJ4cITWCz7E8tE8xLlvoLTxJaAknMvSnVfeJ
	2kgL/+CNGFOqyKhCnKJC52AiRoZ4tLQbJ9WiQ58H1OKUmeW2wGTLJzlOszhCvRLK2NLn
	wGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+AxKLq0FpsMwo+scdb5nZXPWYsx5CCAwmG+O0fBmKlw=;
	b=bNs0DOn9ywhgtPZdUhJbcwuv7mUcN6VTL+UEDMW7g9SODYGfv942hXvKqeIGB7JzOy
	HJkEj0QCPvvJsCAYLbfGeQMdsKaFEjU425ILcYMJKwGgG0W/d/uZMju3roFioErTEftT
	ZGD8wlsfyp7/e2D1clV4wX+G+Co23wzENeKSM2EdjOMTcbscXvSpFo8a5XQTSBx/UlcQ
	cIFTk9OYDFx+d65GpWjZyWWylbPTmT/Y9XTfPUeDkA4pMx+JE6cAHG3i5/nqBcbld9yC
	QmhU7qctIi/LIKCfHIcDCKc/yXlgGUe9ob0JG6Wd7py2alGhOtmdD8JKFJ6iBNRdFtEp
	GqaQ==
X-Gm-Message-State: AJaThX6zLJfHcTGyOuqPvOOr9V1q0nsazNnimOYcQhsUOqSHZDeWkqpS
	9iuY4fLSr4nOMRpZD6qZ6J6qDA==
X-Google-Smtp-Source: ABhQp+Q6LV9MiR45HI5TreoBah/k67YLqUX1ImOXfyjLBLgIpT1TxPZ3jZWP3FXcgxj4esJOWSPXBg==
X-Received: by 10.84.218.200 with SMTP id g8mr2254200plm.23.1510194399345;
	Wed, 08 Nov 2017 18:26:39 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id t80sm955638pfi.98.2017.11.08.18.26.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Nov 2017 18:26:38 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Nov 2017 18:26:32 -0800
Message-Id: <1510194392-9197-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] base.bbclass: increase indent in get_layers_branch_rev() and buildcfg_vars()
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
X-List-Received-Date: Thu, 09 Nov 2017 02:26:38 -0000

Although it may not appeal so much to users to prefer 80x24 consoles,
the general trend is for screens to get bigger and the current output
has started to look a little cramped on a modern HD display.

Increasing from 17 to 20 is obviously arbitrary, but does give enough
space to cleanly display layers such as "meta-nodejs-contrib" and
"meta-virtualization" while still keeping the output fairly compact.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 07734ac..a7968d9 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -178,7 +178,7 @@ def pkgarch_mapping(d):
 
 def get_layers_branch_rev(d):
     layers = (d.getVar("BBLAYERS") or "").split()
-    layers_branch_rev = ["%-17s = \"%s:%s\"" % (os.path.basename(i), \
+    layers_branch_rev = ["%-20s = \"%s:%s\"" % (os.path.basename(i), \
         base_get_metadata_git_branch(i, None).strip(), \
         base_get_metadata_git_revision(i, None)) \
             for i in layers]
@@ -206,7 +206,7 @@ def buildcfg_vars(d):
     for var in statusvars:
         value = d.getVar(var)
         if value is not None:
-            yield '%-17s = "%s"' % (var, " ".join(value.split()))
+            yield '%-20s = "%s"' % (var, " ".join(value.split()))
 
 def buildcfg_neededvars(d):
     needed_vars = oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
-- 
1.9.1


