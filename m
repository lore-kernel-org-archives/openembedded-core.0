Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45129.1795622912618723806
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=pup8UZvH;
 spf=pass (domain: baylibre.com, ip: 209.85.219.44, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso79542086d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795622911; x=1796227711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R0OvViyUOcqQVRSI7Vz+I/ravB5us7LrClnuSiOhgnI=;
        b=pup8UZvHinas5JCrjlE8FKFqarmZ9ZQ4f3YO/NQYasrcdqDruF/6DFAdj4QCAj2xgI
         VTY7AozDfKnszaeyAquEdsDEkuzwAq0TxqZ3C58/Sie3ZXcTzbrtgyRobjroNCuUmof6
         s/aUSN84knLnx9WtcMhazA1lTvtECVEevCButSQkdgyG0IWDTqiwdESaJmroVWP2QzWX
         kaKnz/7qXFi1PL8nRjFWMZS14RL2Js5zdnZ/g76IQbGQIckbnTvt+F9kPMyLt1zuIzpM
         JRKIWzV6aa4t6slkxjzKhIS6DWHZ9IoaWBjGbz4sDlc6VcbcsGfmYA/UN2LXpaFJGli3
         W8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622911; x=1796227711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R0OvViyUOcqQVRSI7Vz+I/ravB5us7LrClnuSiOhgnI=;
        b=KVDYLKzTBD6gy47jRnpGLWTajZS7z9uUtcGrs2XAH6daeF+zkj4G+GjXxOg6Gk5hGX
         blGS5+KbPT2sE4MDXRErzjxhl5W1/l9L2vJwH9V/PbHqpqYNreGbXKtJ9fc0wEBLdqyk
         MHTjXNpds7aE4dKCTRP55wPH3L47++AagSWusKWGeLsDu2wFNAiJV6cBREyTEAPilUzi
         7hRYWFviRzxZ4OUWre9rgUi7PMpNYsLoXx92eNmx8fRYptD/5AMh2NRNuU7m6b20rr6S
         dYSn6565VtVjx6+7CPqr9bKLu+qh1fEqJ9CNONYCub5Kn2J+Vpus++L48lxdO7DMSNtp
         kq+w==
X-Gm-Message-State: APuU4Z+oqOCVLW1QP8IGspue0xfpWCZI8sHTwKpgwXShKPw3xuPpNTPS
	ZmMxj5dqn8lcFvVoUoDNg5Sl8ulk3vXBC+EqKTYI/mW6waJ4RmjraPV+GUX3OudcEfrSpoxgyME
	YR2In
X-Gm-Gg: AZFdTZeUMAT2coU1m+VB6iYDmImjx/t04PK+wEjzkeM0atHeIoDOs8g0dQG/5Y97T9R
	hHa07PgGudOveLlRq17IRwPY9JkD9E06blnMKzO0gA7JDKk2f8fLuM2a/hKy4MdoOjItBiuyiWD
	OrOFawnkwNS6jPeg36bcQ8wYUkwBmdErxfM6WA3oTDhf9FI5FWQ0VxdXE/6d8/91ApEjWj2Uu5U
	LusiH6iD+UXJ/QfFCeq2l+KtEabePH4Gww84Jjrh5Hdx/ZqsOTMCx9bQM71pfV99qkYCSRP8QvA
	039eC3LKu+f65c8CoCi+jUD+WyuDU7xHGbmRLtrMHe9x2qErqJavORflbDtZMsB2xvBeAaL03gA
	wuzSQruTxno220Yd8qM2d5l8n8eyFVXHo9zVNtKVehm89pQeuch+RFuw68Y0gvKNusTuXarwsyi
	5ng0Cj+rfsctgh1AlOWy5waF+VrtDyziaVaR2C9f20hFvhTbKwatoHO3H2yNDzzidEYW5v/6ReZ
	g3yHsqYdAwFPwXWI/g1VvldhhEg2PSbbxit5clUa0rY4pCGzJrQk8XO2oFWiinXR0k5HAmqQ41U
	Xm50R2XXfgiQA4NY7wy7r8fzQ5h6fGXckTjpSjHiJzc4K0UTXuQyYUvNLJVPLZJzKs1iH3EGyB6
	cuU0XeRgoGQ==
X-Received: by 2002:a05:6214:e8a:b0:921:7b18:106b with SMTP id 6a1803df08f44-9217b1810d9mr35444726d6.40.1795622911457;
        Wed, 25 Nov 2026 08:08:31 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.oryx-coho.ts.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921787f6847sm25849466d6.30.2026.11.25.08.08.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:08:30 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 6/6 v2] ptest-cargo.bbclass: don't follow symlinks when chowning
Date: Wed, 25 Nov 2026 11:08:21 -0500
Message-ID: <20261125160821.3028875-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125160821.3028875-1-tgamblin@baylibre.com>
References: <20261125160821.3028875-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251211
Content-Type: text/plain; charset="utf-8"

Use os.lchown() instead of shutil.chown(), as the former follows
symlinks.  os.lchown changes the owner of the link itself.
shutil.chown() didn't add the follow_symlinks option until Python
3.13[1], so we can't just add that argument.

[1]: https://docs.python.org/3/library/shutil.html#shutil.chown

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index cc82ea320b..8f4f003a9a 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -117,12 +117,11 @@ python do_install_ptest_cargo() {
     if not script_exists:
         os.chmod(ptest_script, 0o755)
 
-    # this is chown -R root:root ${D}${PTEST_PATH}
+    # Equivalent to 'chown -R root:root ${D}${PTEST_PATH}, which doesn't follow
+    # symlinks
     for root, dirs, files in os.walk(ptest_dir):
-        for d in dirs:
-            shutil.chown(os.path.join(root, d), "root", "root")
-        for f in files:
-            shutil.chown(os.path.join(root, f), "root", "root")
+        for name in dirs + files:
+            os.lchown(os.path.join(root, name), 0, 0)
 }
 
 do_compile_ptest_cargo[dirs] = "${B}"
-- 
2.56.1

