Return-Path: <andrei@gherzan.ro>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 756627F4F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 17:06:40 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p7so3444652wmp.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2019 10:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kkvSLvfOfwQB8Ih0rquxZLRqRCmQIowEvUjgLJ2YV3Y=;
	b=ZC1vJ7XPJ+gOWObHFfnAVx2CFebUzjmTBgDD7HB5V6VGCJC+ObrkzvkjZLjBzZJgGp
	WTtL4aeWXWfm8Cc6gPZ9aZtmnqYsln2rfFenJfaNexJgTqHrHEX+twaimpJKVTPNcN/0
	fYl1oANpC/pizW8OysReaAq2E89bkmHPQlr1N0dmCKRkOdkRI3K7ftzLjxtAPaI+PHIY
	E7htAToSwkm8hGYpePmx8Bm/aCm3FDABU04OFlPBEoGPIRhF0tqncOOrn75pHP7agDQH
	qYFAbIJC2gQAkeaTs7AUrm0BD/vtu//kxC8mGuBjOgX8p62t6q1VGobONOUPUOeOj7A9
	1Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kkvSLvfOfwQB8Ih0rquxZLRqRCmQIowEvUjgLJ2YV3Y=;
	b=I4X/J3dxG1Wf46a+SN8Jk0GZSaW9Rkjvll+jn0ssYFVGT2g7aR/FelAV1eqaB7mM43
	dkQc7Ms4TAAUO5ys+3vfz889AsBUtu+OAkWJC7ZEQgHKnymGvHFfhDjqcR8yMarRGlpU
	qxr/g1P/dLVzE8H/Tx6dQh2m35XO32Fg6DnB801u9IUh94KUu2SbrpSLVWTv0SwxWw2C
	eO+m6JvK0+NbC2PE215GY+pYLRc4vEVlw7WMX3dwqE7ZBI53HxJeC8GNeQu8LCNZHJq4
	hfF3amy8djGtMmto+o6uD10gMIhqDptgH5a4trkj0kgYfJJ1e47/40z+PLTKYrE+oOSH
	t4Mw==
X-Gm-Message-State: APjAAAWIER2+4x8GpgXSW7pee4g4/0ycVQcrrdPuZS/gnGBbEE88+RCA
	rkhIJ/9T1zwayp6U/Nx1kLWWTHhR92s=
X-Google-Smtp-Source: APXvYqw0pRHI/J+WuIv5vCJQKY9EDWQsNVr+Ams8sw1Nt9cxa9nvYZgQ6LBYmQ3hO6zEuSKid3iIxw==
X-Received: by 2002:a05:600c:20ca:: with SMTP id
	y10mr3414191wmm.82.1570640800652; 
	Wed, 09 Oct 2019 10:06:40 -0700 (PDT)
Received: from beast.hanover.local ([81.145.148.228])
	by smtp.gmail.com with ESMTPSA id
	j18sm2885835wrs.85.2019.10.09.10.06.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 10:06:40 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Oct 2019 18:05:43 +0100
Message-Id: <20191009170543.74807-2-andrei@gherzan.ro>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009170543.74807-1-andrei@gherzan.ro>
References: <20191009170543.74807-1-andrei@gherzan.ro>
MIME-Version: 1.0
Subject: [PATCH 2/2] image-buildinfo.bbclass: Introduce IMAGE_BUILDINFO_GITDESCRIBE
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
X-List-Received-Date: Wed, 09 Oct 2019 17:06:40 -0000
Content-Transfer-Encoding: 8bit

This knob can switch in between having full revisions and having git
describe references in the build info file. By default it is set to 0 to
maintain the old behaviour.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/image-buildinfo.bbclass | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index 94c585d4cd..fb8677fe69 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -15,6 +15,9 @@ IMAGE_BUILDINFO_VARS ?= "DISTRO DISTRO_VERSION"
 # Desired location of the output file in the image.
 IMAGE_BUILDINFO_FILE ??= "${sysconfdir}/build"
 
+# By default use HEAD revision. Set this to 1 for git human readable revisions.
+IMAGE_BUILDINFO_GITDESCRIBE ?= "0"
+
 # From buildhistory.bbclass
 def image_buildinfo_outputvars(vars, d):
     vars = vars.split()
@@ -45,9 +48,16 @@ def get_layer_git_status(path):
 # Returns layer revisions along with their respective status
 def get_layer_revs(d):
     layers = (d.getVar("BBLAYERS") or "").split()
-    medadata_revs = ["%-17s = %s:%s %s" % (os.path.basename(i), \
+    gitdescribe = d.getVar("IMAGE_BUILDINFO_GITDESCRIBE") or "0"
+
+    if gitdescribe == "1":
+        revision_func = base_get_metadata_git_describe
+    else:
+        revision_func = base_get_metadata_git_revision
+
+    medadata_revs = ["%-27s = %s:%s %s" % (os.path.basename(i), \
         base_get_metadata_git_branch(i, None).strip(), \
-        base_get_metadata_git_revision(i, None), \
+        revision_func(i, None), \
         get_layer_git_status(i)) \
             for i in layers]
     return '\n'.join(medadata_revs)
-- 
2.23.0


