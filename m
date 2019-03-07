Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id BC2E97CED7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 16:56:49 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id d24so14840109ljc.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 08:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uQTA9Rc4H85qBnRrb7vJGEftOT6LYFjJ1YMZ7IdlJ6s=;
	b=puMj6rVx+y8o4SRakTbLaIRHwkcncAGQCV9buxqawqK1LFdyTUIC79TUKXAqFY1dag
	UP4w8ArPV69392/Y4+IYu+1UmRBcLyxLdRrpC+yiRwClUBqY8rqsvKSg4SFdRcKIHeXl
	94h/8WzpzpAkPKpcimcLFgsqQXBaz64V4+v70EstvT1ChGjY5Zv2KUnoRzNb3OT1mA81
	IC5S/kuhvAUKl7IBT+R35DQ9mUmbCyVWRgU0BzSxtiHSSHtJQppoVqXdsp6GQ1tZC0Tu
	+SJJfzg3fAtp92CKOzuJwvg27O64S6BGJDplXHZBkqrUkEDcgpiSpSVUry/xj+Juwsyz
	57Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uQTA9Rc4H85qBnRrb7vJGEftOT6LYFjJ1YMZ7IdlJ6s=;
	b=VHlHKTni9eTvyy1+nnYT0spHC8gBqBC/ywxS+lDgYZefJIh0crXLkQ/7xjZ95nJfRM
	SOS7JxaBWZpQ7bZ866e3Jvk3ZMW6YWESl50wyBbsrKrTwmm8k81wXE5ApG/XP86QyfVk
	MLo1XY2WcuLxw6rf7RftYLPEofJmnAwzeQhdOm+4CccJte9PeAgznRHgTHb8PzuLlhTD
	8Zig9TqIZSqTouGN4wUFk2M1sDLhoc7z3Mju16pkniz2ppqFRXRLL7Nzkc4jI7kt9GTH
	cks5WGFbGUFib/CZlinDD7yWRZZ309A+LJXJABK/zxtZ3M8AtetksYnFrOLFE5Hp7/Uq
	nXVw==
X-Gm-Message-State: APjAAAUcBcHmb2MTwkRtx13193+lqRTmM35vIR++nxci4fQt4sgXvtGo
	izaNVlwFCfJLFP0HL3XTIGoS2qk7WEGVvw==
X-Google-Smtp-Source: APXvYqxZfkzRs83A3WfT2ryhiW2sZyhRY1qPDgwYGqyV5DEhRDKhYJ4eDrcaxfBIgFKhAqCpJILDgA==
X-Received: by 2002:a2e:7f17:: with SMTP id a23mr6204486ljd.175.1551977809863; 
	Thu, 07 Mar 2019 08:56:49 -0800 (PST)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id m16sm913419ljb.50.2019.03.07.08.56.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Mar 2019 08:56:49 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2019 17:56:46 +0100
Message-Id: <1551977806-7623-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: luka.pivk@toradex.com, stefan.agner@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] rm_work: sort the value of do_build dependencies
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
X-List-Received-Date: Thu, 07 Mar 2019 16:56:50 -0000

From: Ming Liu <liu.ming50@gmail.com>

This fixes some 'basehash changed' errors when rm_work is being
inherited.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/rm_work.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 10e134b..c478f4a 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -164,8 +164,7 @@ python inject_rm_work() {
 
     # Determine what do_build depends upon, without including do_build
     # itself or our own special do_rm_work_all.
-    deps = set(bb.build.preceedtask('do_build', True, d))
-    deps.difference_update(('do_build', 'do_rm_work_all'))
+    deps = sorted((set(bb.build.preceedtask('do_build', True, d))).difference(('do_build', 'do_rm_work_all')) or "")
 
     # deps can be empty if do_build doesn't exist, e.g. *-inital recipes
     if not deps:
-- 
2.7.4


