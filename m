Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id B3E817FBCD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 19:41:23 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id s21so11327873plr.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Y090qyfLIyKjOufwz0aqiR9w0s4eH0wN9FuYscnw5tU=;
	b=CqAPHIJrWIVX4aS7gyKo4FWc9ZIFV5IFj46qT40hO9eRDFeaX3NTyFeOVRmwv9xok8
	dPI4oVvfw5LPV58Drni0OoVPFetiZNXW9qc9V0eXpapV9axy5sqiLza5wWYs/xdPiH6W
	CRz8fp7wnJLSmMmx7vf3vID5FqBBNiC6cNF1RBeTqOLp4MRIn/8QR17+RDcndEZbY8wH
	5cRMV6kS+9nPNhlY5ISubtS1HXqJNheF44J7MCP97GU8P8Amoc0+E1u0G1F9syQfNjQo
	ZPWxgZWy5YEFE/o//EUGPbHBHtylSPpYUU4P7wf8l10ie+fGd4B+y6CdlVXKgNWln4Nf
	ymkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Y090qyfLIyKjOufwz0aqiR9w0s4eH0wN9FuYscnw5tU=;
	b=LK6hxizut+yQCKsAvVARWWLzBz1iIsm0aHg2Aq+6Uz4LLCTF+P/TRAdYCWxOqQ+bOk
	aium+MrAAQ37dZ9vGcoX+VkkrEW2nLzXHWZl1Br9A8IbSg7ma1xhIeDzyCQGl60zdk/J
	om0nJJxphgO7ksriQExfmIqYNgaL1pnbdQ1V2oUcRIv+UxyOT6Ad9L50uuzrQgM2gU1P
	wGemU5dcvKNZCylSKGNV35QrujdFOg5dCwxchFTVvhQ+4s5l/sK4Y1hr7tJm/zQKwji1
	vXtHHkiOh198EhpCJBUYIpVd0KquB/MFwPVA+jF9r6+C6pngPzs/V8/6n+FqtSFyC431
	PA6w==
X-Gm-Message-State: APjAAAVYyd5o2f7wjxFj6RyIHmRFqYm7UHnvK+VnMijmsg5aVukUIXo+
	qwURzc1xczDEfYj21uWK7N5TjPMOU48=
X-Google-Smtp-Source: APXvYqwfeK6KCeSq0ryz7s4GkZZ24wFQwXWILQh98dU6x0yQzATkWiM7ppexqiYlQ5ebnn5xqnDPTA==
X-Received: by 2002:a17:90a:35e6:: with SMTP id
	r93mr13945963pjb.44.1579376483849; 
	Sat, 18 Jan 2020 11:41:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id l8sm751610pjy.24.2020.01.18.11.41.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 11:41:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 11:41:18 -0800
Message-Id: <119ac1147dbb2274069050316f5518c3bf38e11f.1579376298.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579376298.git.raj.khem@gmail.com>
References: <cover.1579376298.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] classes, conf, lib: Add support for powerpc64le
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
X-List-Received-Date: Sat, 18 Jan 2020 19:41:24 -0000
Content-Transfer-Encoding: 8bit

LE is default for modern powerpc64, power8+

PowerPC64 Little Endian Linux ABI specifies Power8 as the minimum ISA.
The basic ABI can run on earlier versions of the 64 bit PowerPC ISA,
but it was helpful to define a new, minimum instruction set for Linux
distribution releases during the switch to Little Endian.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/libc-package.bbclass | 1 +
 meta/classes/meson.bbclass        | 2 +-
 meta/conf/bitbake.conf            | 1 +
 meta/lib/oe/elf.py                | 2 ++
 meta/lib/oe/package_manager.py    | 1 +
 5 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index de816bcec1..de3b4250c7 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -248,6 +248,7 @@ python package_do_split_gconvs () {
                 "sh4":     " --uint32-align=4 --big-endian ",    \
                 "powerpc": " --uint32-align=4 --big-endian ",    \
                 "powerpc64": " --uint32-align=4 --big-endian ",  \
+                "powerpc64le": " --uint32-align=4 --little-endian ",  \
                 "mips":    " --uint32-align=4 --big-endian ",    \
                 "mipsisa32r6":    " --uint32-align=4 --big-endian ",    \
                 "mips64":  " --uint32-align=4 --big-endian ",    \
diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 71f9de1a57..1ef34a999c 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -45,7 +45,7 @@ def meson_cpu_family(var, d):
     arch = d.getVar(var)
     if arch == 'powerpc':
         return 'ppc'
-    elif arch == 'powerpc64':
+    elif arch == 'powerpc64' or arch == 'powerpc64le':
         return 'ppc64'
     elif arch == 'armeb':
         return 'arm'
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 62b5466b71..3bbe42c2c0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -11,6 +11,7 @@ baselib = "${BASELIB}"
 baselib[vardepvalue] = "${baselib}"
 BASELIB = "lib"
 BASELIB_powerpc64 = "lib64"
+BASELIB_powerpc64le = "lib64"
 
 # Path prefixes
 export base_prefix = ""
diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index 2562cea1dd..43c962c697 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -34,6 +34,7 @@ def machine_dict(d):
                         "armeb":      (40,    97,    0,          False,         32),
                         "powerpc":    (20,     0,    0,          False,         32),
                         "powerpc64":  (21,     0,    0,          False,         64),
+                        "powerpc64le":  (21,     0,    0,          True,         64),
                         "i386":       ( 3,     0,    0,          True,          32),
                         "i486":       ( 3,     0,    0,          True,          32),
                         "i586":       ( 3,     0,    0,          True,          32),
@@ -68,6 +69,7 @@ def machine_dict(d):
                         "armeb":      (  40,    97,    0,          False,         32),
                         "powerpc":    (  20,     0,    0,          False,         32),
                         "powerpc64":  (  21,     0,    0,          False,         64),
+                        "powerpc64le":  (21,     0,    0,          True,         64),
                         "i386":       (   3,     0,    0,          True,          32),
                         "i486":       (   3,     0,    0,          True,          32),
                         "i586":       (   3,     0,    0,          True,          32),
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e15e3c4a31..e96c28b46d 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -107,6 +107,7 @@ def generate_locale_archive(d, rootfs, target_arch, localedir):
         "sh4": ["--uint32-align=4", "--big-endian"],
         "powerpc": ["--uint32-align=4", "--big-endian"],
         "powerpc64": ["--uint32-align=4", "--big-endian"],
+        "powerpc64le": ["--uint32-align=4", "--little-endian"],
         "mips": ["--uint32-align=4", "--big-endian"],
         "mipsisa32r6": ["--uint32-align=4", "--big-endian"],
         "mips64": ["--uint32-align=4", "--big-endian"],
-- 
2.25.0


