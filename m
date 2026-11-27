Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1572.1795801858671396143
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:50:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pd+4xpM5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso79831315e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795801857; x=1796406657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GScqTYBv+w9ZgGsSaSZ1K+lLH52pWWK0jdVsfdbIBU0=;
        b=Pd+4xpM58gvBRuZ8aKCCsFe1+B/ipDzqzRZxcAlteUyAqQz83vC0wSRaHUIsVTEz7E
         bod0RCQw5S/frLK/SwL29vATrUCk7mP8NM5nAKEyvGf7xFImjpWWU6mNEpsPKnXvInH+
         Nq0qC1++KBjhk1lg8C16YavDYQKNU5HGubHPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801857; x=1796406657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GScqTYBv+w9ZgGsSaSZ1K+lLH52pWWK0jdVsfdbIBU0=;
        b=ZdzZ4znyu/C4qSKQ+357a/fJYIL8SbQlD5bO/v1wAmZCMeRJkz2a86eKw7+BD25VNH
         R65wrSkcPfDPEN0Qy4gb6DTer3APjd5ohFh+/AubxTldbeSkOpN06mMYuO2If6Wc1tPU
         k3bzg94P+wngglAdS/Mw4qsl9enTiaZwTp+jg9NiagpDtbYASXDKZtYJ/odh+wRCLTsN
         /QesDRGokMuEmZyLZ/XIGXbivQjt87NKDRMbDhNYn4CtFNeP0J8WO07cFh64QlI3tvjd
         5CAxBEaG6amP15DOzJ78+DO2jEGawiOPXYKokF2xy5Avytg13m20RakTwlxfRIsb1H89
         dySw==
X-Gm-Message-State: APuU4Z9Z/kB0T0S+iNzZgHnd6UrVz8SJbKlBm1EHL1AvFXMoXk8imhRN
	Krhka53YY93fFiYMXEOW+noOhdb3+pUg1X3yUrFLpMrXAPyLS0qoVYXXFK8tUKypDdIL8pZey3X
	Alju7r8U=
X-Gm-Gg: AZFdTZcOqsiPPeYMN2fEm8uH/HGh/ZqKNbuiRHDhdqvi+YW24SYdPzWoiNeVQneEH8i
	XCGqprevso2OLbBAfkwHeSEL0gLZIjK1Z1Hc0azjLyt7zxtP+BjM6MOZPR/99LMsLoE3AH/hjrV
	VuxPdhYXFfx1/5/kkJVdP4+1MdOOqWEGviF+8tnOxjNcDMgmM+f0vAvvJoV6GJJ3v35xZDgZaXc
	V3n4VzicRB6zxnwgexPLkyo97GTxYvvZt1Q/6rNaUc2lB5ZzD5/9Bwl5Seo0HTQJVbPBZy9XjDE
	uwMUEoUyuZ9MqIILAPUCIbCgf3htqcjzDWiW+eiYKgzd3xtkENO9uwN+WoZAFzJ/0FqM3IBu0nw
	Wxo0MapsAe7s3UFePYuUpYW2lYGF8FgOWUO+6lk4S8xLUcj3bzhDIN/h4p36/ZPogyglAzKso69
	HZI/34uQlBq3WRBOrQZDTIB+VlOqlLU6k8CXvcXB1WQ4QVxBMwUZyYj7f1DjK0KbTalJeOUs2vg
	fe5vozkc0u5aaBfx1pJge12E+XK0s4SiXsGr+PFzkTwAxlomLjf0HogYNlMr511zg4BWm2r7Yru
	kzfoBLxC0+BycRZ6BhbsiSZUPKIPiga+zqC2/zn0LmqGrN891+H/HOqDeA==
X-Received: by 2002:a05:600c:4e02:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4bb88812b1cmr508780915e9.24.1795801856747;
        Fri, 27 Nov 2026 09:50:56 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:47cb:b596:3be3:8f97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm1105410965e9.14.2026.11.27.09.50.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:50:56 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] bitbake.conf/base: Add recipe hosttools warning to the start of builds
Date: Fri, 27 Nov 2026 17:50:54 +0000
Message-ID: <20261127175054.2271255-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261127175054.2271255-1-richard.purdie@linuxfoundation.org>
References: <20261127175054.2271255-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251445
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass | 27 +++++++++++++++++++++++++++
 meta/conf/bitbake.conf           |  1 +
 2 files changed, 28 insertions(+)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 3163db55195..98ef8d8b636 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -298,6 +298,33 @@ python base_task_eventhandler() {
             setup_hosttools_dir(toolsdir, 'RECIPE_HOSTTOOLS', d)
 }
 
+addhandler base_recipetools_eventhandler
+base_recipetools_eventhandler[eventmask] = "bb.runqueue.RecipeCheckEvent"
+python base_recipetools_eventhandler() {
+    recipedata = e.recipedata
+    needed = set()
+    for recipe in recipedata:
+        tools = recipedata[recipe]["RECIPE_HOSTTOOLS"].split()
+        for tool in tools:
+            needed.add(tool)
+
+    origbbenv = d.getVar("BB_ORIGENV", False)
+    path = origbbenv.getVar("PATH")
+    # Need to ignore our own scripts directories to avoid circular links
+    for p in path.split(":"):
+        if p.endswith("/scripts"):
+            path = path.replace(p, "/ignoreme")
+    notfound = set()
+    for tool in needed:
+        # Prefer gnu-prefixed binaries, if available
+        srctool = (bb.utils.which(path, "gnu" + tool, executable=True) or
+                   bb.utils.which(path, tool, executable=True))
+        if not srctool:
+            notfound.add(tool)
+    if notfound:
+        bb.fatal("Tool(s) '%s' are needed by recipes due to be built but are not available on this system. Please add them first." % (" ".join(notfound)))
+}
+
 addhandler base_eventhandler
 base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.MultiConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.event.RecipeParsed bb.event.RecipePreDeferredInherits"
 python base_eventhandler() {
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 31b3f6243b6..39dac165d2f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -522,6 +522,7 @@ export PATH
 # Build utility info.
 ##################################################################
 
+BB_CACHE_EXTRAVARS += "RECIPE_HOSTTOOLS"
 # Directory with symlinks to host tools used by build
 HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
 RECIPE_HOSTTOOLS_DIR = "${WORKDIR}/recipe-hosttools"
