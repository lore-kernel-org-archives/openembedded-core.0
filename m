Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1457.1793986365214501572
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 09:32:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hFGU0rw7;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cccb2c96d0so279287137.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986364; x=1794591164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NxZlANjrzQJJGGkjrlP+SUdlJFi1hRiCoykc1gIjs0=;
        b=hFGU0rw71i0tUKX4fOhRo4rsgsMpkDtiaU14yA90RjQrw2VwKnvEWY2QP2BxEdzagT
         lVdDX4ovsHEEAELeW4FFFatZ/LyIvX5dgMck6thK615Jhi43uH8wFVsSVQ5lhJvbbVRC
         31MBSVN0ltlG/h6ZwxeoZXHZOTWP5jvVDkWvQL0hRuY8t2fe7U8oBxPthd6KqGjsL3Oy
         +OT+n/30qJ8WLgbJW9ifthE/vomuuPlKxFGDtkGbeNCXwN7s/y+I6av6UKc+fDiP7hX5
         NI6WWxl1jjPj2y1fvRkmcDtq/omTg0D2axskNN8tIlplWZnfvAuvBzBAk5BPWkQULvCP
         4FJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986364; x=1794591164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6NxZlANjrzQJJGGkjrlP+SUdlJFi1hRiCoykc1gIjs0=;
        b=ASgKVXI77Ja2rb8Xe1the3aE6Ffyib8bO1J0A0BmVBrAS9hlKzvdBwxB57CfIr96+W
         8ZY7r6/WlqReM9mV9KePDp6Bu1dde8GQv10DIPvKAtOZ4ToHqK4qLNRkSnylhxfxpVkY
         8Ipagn14TWz03w0uKaXuMIu8LDK+AfFeqLhfiEOXa/k2KMHMkZrQAc9gnHJYtM5ul3l+
         D2dgoplhq40ZEG/wRprBsTDWAeH7pzyy8mTTyzRF9GhO360xfgMDngeoCepbLdTzfNl6
         NQ7fDBVgplSUfe13sK2CsHGe7pEmh3lTgbsL/6qrZxxf9VknUWzsQEtt8CPU/TK0jh7Q
         KHnA==
X-Gm-Message-State: APuU4Z/xHHpXGuS8YkJn94a1FS4GQzxKKj//qcSOxqM4D5+SU4BXOKSJ
	/zGCYpPGn50brfetmAIdX+bNxfApcGqMiteSNi9rO1xgIVjmPj9e/gQy
X-Gm-Gg: AYBFou3QlAu8OI1kHW5c7vqiWqRoIq12UF2xy2QUe7Bctk6EpNjwTsF8y1BvcbsxThN
	Mp8ngkl/BHvisqVPtx+qSVL63o/dnJWrm97JWzW649eHkpuLuOjS5P8Vl/Lx/qN+DN2zlz2y721
	BYIv5O+baTSBUoixEl0aghFAmEnh5yraXKV7+MooOU61zlfpQwiAbDvtwE3ElnjdqQ7FP91J0Vb
	0Ul/3aQ3ENSQBBsB75Y0Are+lPscC9PRdWqqldOlnBo573EHqvXoxj0GZLiTBNPN0OQyLSxiFth
	n/mlJORfnkq4ab28saEwU/DlQAhtHGrk9Tw2pjhMAxh88K7JOI4H8J46dAjlyjfdPta/4BUo+Zc
	6cCkRKxU4xK/XGgI25tS/43KFlCcUjVhMm/+QMxGYhm4MSraarILViKRQxwpwtsaD5d3X2g8/Al
	dqYJriBGZhXy4d69Koyt99tG7uP/X6zx3vc04hmXLq1aA0ht5UPf63zP5Ql3YHO1qMLklcxvETu
	5501ugrJbSnMHvD7WWL2cITIg0Aeb8Tow1M0FL4ZK5O6rtZ+3+3yvVp98udZ8dtOQJ8/lfqeYNO
	B3ry/OlDvR3BpXA9dRTRF2PrTlA37W0EWzvKpZ/LFpeC3U+WMGVaQRV+TwOSrDOnNvewLZHVlNb
	kzXocxXK2QdW9WjY4Z9Zl97cSUSaxcxdM2ux9j/ZbSyKIakdXQYbyRu9Vxk5LAMcGhc8CTXYHvm
	V687tfAU+mM926ykkrpftUk88aznne/br3lh+sYI+eKPLjTQ==
X-Received: by 2002:a05:6102:94d:b0:7cc:ccb:ce5a with SMTP id ada2fe7eead31-7d2a165e180mr1684220137.28.1793986363855;
        Fri, 06 Nov 2026 09:32:43 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99ba74a6964sm2335848241.0.2026.11.06.09.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:32:43 -0800 (PST)
From: bruce.ashfield@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC PATCH 08/08] rootfs: fail if an IMAGE_INSTALL_DEBUGFS package can't be installed
Date: Fri,  6 Nov 2026 12:32:35 -0500
Message-ID: <20261106173235.4155305-9-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
References: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 17:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249708
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

IMAGE_INSTALL_DEBUGFS packages are installed in attempt-only mode, so a
package whose dependencies can't be met is skipped (dnf --skip-broken),
the image builds, and the package is silently missing from the debug
rootfs. The only trace is in log.do_rootfs:

  - nothing provides /usr/bin/foo needed by <pkg> from oe-repo
  Skipping packages with broken dependencies:
   <pkg>

These packages are asked for by name, the same as IMAGE_INSTALL, which
fails the build in this case. (A missing package already fails earlier,
since the image RDEPENDS on them.) Install them normally, so a broken
dependency is reported as an error rather than leaving a debug rootfs
without the package that was requested.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/lib/oe/rootfs.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index aac93dc42e..a28c888070 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -165,12 +165,14 @@ class Rootfs(object, metaclass=ABCMeta):
         """
         Install additional debug packages. Possibility to install additional packages,
         which are not automatically installed as complementary package of
-        standard one, e.g. debug package of static libraries.
+        standard one, e.g. debug package of static libraries. They are asked
+        for by name, so like IMAGE_INSTALL, it is an error if they can't be
+        installed.
         """
         extra_debug_pkgs = self.d.getVar('IMAGE_INSTALL_DEBUGFS')
         if extra_debug_pkgs:
             bb.note("  Install extra debug packages...")
-            self.pm.install(extra_debug_pkgs.split(), True)
+            self.pm.install(extra_debug_pkgs.split())
 
         bb.utils.remove(intercepts_dir, True)
         bb.utils.rename(intercepts_dir + '-orig', intercepts_dir)
-- 
2.43.0

