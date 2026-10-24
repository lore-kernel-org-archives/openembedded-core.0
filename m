Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8873.1792858240324071354
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 09:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jqQ5WvOx;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36661f953e4so3223602eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 09:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858240; x=1793463040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qHyLtXrAjbhpFKwuFBLh8tt/+Dmmg5PVknJLKegP44=;
        b=jqQ5WvOxwl7+T1bR4z8ZhvWkoRH8qUulUVDXJbYaLoVMEIMiWvqQiENYBZqxYePzQ/
         Odtjo25ASI6Yv06OUHO94przNa535ff4Gw9uzYjhIMH3oJ7qB0SZWOjCRmPJpJZR21g4
         pPNJfzf/R5iQFgD4V/L/NIt3t7+eQuFJqmqk7jFJ7sEamxf5b8Xzt9T0R2N/WJDEox/0
         nOuaTXZFzySipZj93PYfXQSXY4EvXApQxVq6y7/TmtGwXrd54SFwVU2IVn8bnHmNaif8
         i6YpgHxwHzEoF+IO3K2CQ/nLp3IJ9UpMTmqUfjvQZHB4ANGw1tQISIeRY+bpbhsver1s
         UwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858240; x=1793463040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qHyLtXrAjbhpFKwuFBLh8tt/+Dmmg5PVknJLKegP44=;
        b=cskDRat4LzXOo0sHDL28+t24NXeCFb5qUa6jUCTHUiUQRCOVwNhD+S4PJy5iVJjxw0
         2yLkHVtfJPhrc/iS1N/ZM9XTu5EwdL+FigDUWZSVUkGwLN5sdL+8c+un9vdabyKb4kfH
         wyX7S53vTV15FaiBZy6r786yMHwhD9tEWc/AKkSQu6i7hLs99JIqax38n/A0GsQxuNa6
         AXjdgBhpdGbENSyYlE+wgAsY1LVRHwN2xVTOEfKMiu4BCq+43w1DBudnXIVF2U9rRomR
         LyVFdWXVk3d/DkbinP+gyWuR4CJ9+D0M7VLfoxMvjqaFIIFE5fjmNH0gL231pKavYAkU
         6utA==
X-Gm-Message-State: AFq9FYKVfLqYNGDOO7+jlYWHrCHrctwY7THj2Vx3DdcIn2F/wY5hSt1f
	kq6LS48BPXqXw5SdT/Bd9GWKRa0Weex9rZADFuVffpalGB60qBodf4RpLvNbGz/upWo=
X-Gm-Gg: AYBFou00MVw7SdDRFYQCd6TjpoQHOz8DZJi4r5qUp5sTK4i5Cpd8vldQ2y1rUeFob5F
	TYgmy/NXZxtw/TFxnLOeSvrrWoU5HMblQR6877tB0T3dcehjXQ7k2H/9QdOtsq5ARQsmnYkCMUQ
	hF5q7Yikox3rQAgTSZ/ie+ufxjLyIT2FfxybBj0Kq6gGeu6IqKPwLIbSCHeFhhe19XDicP4RYG1
	OAgJvJ8ozH4VT8q4+c0SjdWbYUAS210uT3s6g2zccYGhl33DA+hyaSxmMyTgvdWQNS+NcY0qLTp
	g9mQcDGnV5LVhXZgOw7VK/DAKz8m87G87w6NzEbkJNbadvz8v4jpxLSEtpN1/II+6y3wOXCPe3F
	WNduHHa/IoKvEoEJpMxKz5NM/Al4loyXKVmDC1dbfE+wlEfxWM0+zCI5R1wgxsECv0GXWEn+4gQ
	2xij6i6Dr5KBOtbEz/KE/svqR9uq3/0jACZkRdJ3xjSsi6KghkKnlo6tLfpjzlBPnMgKubDhxfs
	9++0J1shkuaC9SeXxQQaiHQ99GQbLrMjGPYFCyhUxA/mTKx50wLqgZPGiprimXe/Vg9Q4eGT/WS
	6iqSe1YUpUsGzPTvjnwXdPa0tIcjKYe5TfZm0WZwrMi41e7obAflNK02D4LbuOgLjckabPuXuTg
	v8b2UrgPJ4CzOv1VkCqoUgRyLjVyhlSad8NmZhO6lHVnnmmWMZb5ipBpM2chalsNLIlSm5fKSb9
	N/3gT3dMczvH0G+mE5kelC1k98WdF2r1dys1XITCCQ+8qoe9oHv7s/IOXZco7nXYExZJesEqyRN
	3iFPWxXBcOwZJvoF8AZFQ==
X-Received: by 2002:a05:7301:d816:20b0:369:f18f:3492 with SMTP id 5a478bee46e88-369f18f35f2mr1128822eec.35.1792858239473;
        Sat, 24 Oct 2026 09:10:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee71f5sm10400190eec.28.2026.10.24.09.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:10:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 3/3] piglit: Fix build with glibc 2.43+ and clang
Date: Sat, 24 Oct 2026 09:10:33 -0700
Message-ID: <20261024161033.4140130-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261024161033.4140130-1-raj.khem@gmail.com>
References: <20261024161033.4140130-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 16:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248596
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

shader_runner assigns the result of strchr() on a const string to a
non-const pointer, which clang rejects now that glibc's strchr()
preserves const. Add a patch to declare the pointer const.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ader_runner-Keep-strchr-result-const.patch | 31 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-shader_runner-Keep-strchr-result-const.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-shader_runner-Keep-strchr-result-const.patch b/meta/recipes-graphics/piglit/piglit/0001-shader_runner-Keep-strchr-result-const.patch
new file mode 100644
index 0000000000..3e1a579691
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-shader_runner-Keep-strchr-result-const.patch
@@ -0,0 +1,31 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 24 Oct 2026 10:00:00 -0700
+Subject: [PATCH] shader_runner: Keep strchr() result const
+
+The include path parsing walks a const char cursor and stores the
+result of strchr() in a plain char pointer. Since glibc 2.43, strchr()
+preserves the const qualifier of its argument when C23 features are
+enabled, which _GNU_SOURCE does, so clang fails the build:
+
+  tests/shaders/shader_runner.c:1665:10: error: initializing 'char *' with an expression of type 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
+
+line_end is only read, so declare it const.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1281]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/shaders/shader_runner.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/shaders/shader_runner.c b/tests/shaders/shader_runner.c
+--- a/tests/shaders/shader_runner.c
++++ b/tests/shaders/shader_runner.c
+@@ -1662,7 +1662,7 @@ leave_state(enum states state, const char *line, const char *script_name)
+ 
+ 		cursor = shader_string;
+ 		for (unsigned i = 0; i < num_shader_include_paths; i++) {
+-			char *line_end = strchr(cursor, '\n');
++			const char *line_end = strchr(cursor, '\n');
+ 			unsigned path_len = line_end - cursor - 1;
+ 			char *path = malloc(path_len + 1);
+ 			path[path_len] = '\0';
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 8f02496b4f..9fe29c8192 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
+           file://0001-shader_runner-Keep-strchr-result-const.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
