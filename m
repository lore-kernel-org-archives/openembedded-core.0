Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 220FF7E5E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 20:27:15 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 7so6652372wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 13:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=02UNbZtUapc3hW59b7or4CNNjDqGajOo3vGnw7guOAs=;
	b=EmKxg9GazwOulkZyWXORtCedmcJ5YsvBO8EmCqcuZnIADn8xZs7RvwEemWJ6wJ5dBp
	uEc6AEUOKAAJdJrRtpttmJ9OTkBkjk2W7Y5hkaxmGP2vX9MnkzrOQ5A4/Ss0FH5ktgIx
	OEKJUuaFzHqxepJFeaDmQ3jcCUfq+H8jFdnf3uuSeyLxO1nIg0UvjFWyZgRaKYJCcyR0
	6F64gpZ1Vk68/3PX1USB0SE4y+9sTzKAryDUDoyx7e+KVt2fb4YfSirIiKBHYLwYBIHA
	cW0KTpxmx+uIkT0QHUPGrbuIHgsboFVB3WYEM4LgXhK7CYe+Vm4axF9QlmroSGV3mHGy
	uU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=02UNbZtUapc3hW59b7or4CNNjDqGajOo3vGnw7guOAs=;
	b=KoTZlCp4Va4cMx8YFK0QnAxewXtoO4iWgg3jknfWNQ7XxefY1/yTO2SGg0CXx6QVv/
	U7zdSvdUSq6V7gP9CZXatUHo8dO/YfGk8WxugsIH6O3e4hUzP6bcdO6ExG1P2+pCGj4/
	Efxk/tfat3VWRdATuyLkZG4y4+Pv30j8mKPM2iWkzX9JpqMtp7rjjIUnZtl6oJ8gMi3F
	gO94eXV4b8Cw0tCH7FpAYLwu65U3d3EXHsdfmfXysGcK5zNIBjm6PIK8agds6vPv+2Gj
	Va0w4txI5uoU/o/7wJw/4rhAEYIdL1CZ4TYfZ6SoFZxTA+rC+ldGLOCzZmUxa26CJ0NG
	sZog==
X-Gm-Message-State: APjAAAWNDpM/53TjRE/cs4y8VQdfORM8Tls+v33JB/VhLBhr9OdxkR7f
	/ATuvWqlYtI95STGdirXrMYwdLJtsl0=
X-Google-Smtp-Source: APXvYqwKHstidM1IOvif4XjM2NPNGPgyBq8OTprhDzfYUu1miV+F6CukVnuVe/pjooBpHcEbB04YIQ==
X-Received: by 2002:a1c:c587:: with SMTP id v129mr2232704wmf.72.1559334435704; 
	Fri, 31 May 2019 13:27:15 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id h8sm15355394wmf.5.2019.05.31.13.27.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 13:27:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 22:27:10 +0200
Message-Id: <20190531202710.98718-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531202710.98718-1-alex.kanavin@gmail.com>
References: <20190531202710.98718-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] Revert "ncurses: fix incorrect UPSTREAM_CHECK_GITTAGREGEX"
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
X-List-Received-Date: Fri, 31 May 2019 20:27:15 -0000

This reverts commit 91227184b59df30222e45abf2edf13e4e65164a1.

Instead of fixing incorrect regex, the commit actually broke the correct one.

Before the reverted commit:
alexander@alexander-box:~/development/poky$ devtool check-upgrade-status ncurses
INFO: ncurses                   6.1             6.1+20181013    Hongxu Jia <hongxu.jia@windriver.com> 7a97a7f937762ba342d5b2fd7cd090885a809835

After the reverted commit:
alexander@alexander-box:~/development/poky$ devtool check-upgrade-status ncurses
INFO: ncurses                   6.1             UNKNOWN_BROKEN  Hongxu Jia <hongxu.jia@windriver.com>

The code in bitbake/lib/bb/fetch2/git.py actually splits each tag
with '/' as separator and takes only the last part for some reason,
so the "debian/" or "upstream/" prefixes are never a part of the string
that is matched against regex:
https://salsa.debian.org/debian/ncurses/tags

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/ncurses/ncurses_6.1+20181013.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb b/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
index 928c47742ce..ef6ca9879bc 100644
--- a/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.1+20181013.bb
@@ -8,4 +8,4 @@ SRC_URI += "file://0001-tic-hang.patch \
 SRCREV = "7a97a7f937762ba342d5b2fd7cd090885a809835"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5 --cache-file=${B}/config.cache"
-UPSTREAM_CHECK_GITTAGREGEX = "upstream/(?P<pver>\d+(\.\d+)+(\+\d+)*)"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.17.1


