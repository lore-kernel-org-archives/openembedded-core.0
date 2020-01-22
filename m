Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 29E949145D
	for <openembedded-core@openembedded.org>;
	Wed, 22 Jan 2020 05:48:27 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id q8so2780877pfh.7
	for <openembedded-core@openembedded.org>;
	Tue, 21 Jan 2020 21:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wYOndmW8PwdcJ3PKUOcEGaBSTPs+5MNBSP4Ch0YXVCI=;
	b=WndfiYwcpaYHuV9hRdyHiUrK1cCXCTI7KNaQEOsg80rztNqEmCQAu02xzuHXx/nWW5
	BcVMOkqWGI0wDetpyI3qRys4yosxWAM9u+nOA0Ao9SqerD/wXw1LpYoszSAWT23Sgp2J
	r6R9TudBDMsO4mfq6Nej3urwjwyYynVgSCju58Sl4JzvxgGtgKESweQA3reITu+SPY87
	ntM4aFWO9dOxhXJF0llmVKr1PfZ9jAcGC/xzlistp0HEvzW+9lpeVF9h+yHP5/QRUlT2
	KN0z2aSHzdqBCW/3hsA5Sl2aejNeLtJyYZnjPkCHxEaxkdbLkqSiR7fMeGAjfDCU1Onh
	sPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wYOndmW8PwdcJ3PKUOcEGaBSTPs+5MNBSP4Ch0YXVCI=;
	b=AFKZQyuCQ+V0pHs8YjD8+gFVNfCD3cBV9g659o6WSZQSdKkYCu7XFjuBRdefRtjIz4
	SaYDUUXwOfgKt35kDzmHLi31zZXjP1vAHk1X8KJfENdli2qPqB5jb7wB7ki2AJeZf3rv
	81tzHWMBvk4Tvyi8K8uW0LEvP98rlk/t9gvJOx52fVBDYJmDkMROvsr1pSVMNU5vdhKJ
	MBnAppVXjKaprhGzTQ2DQX5v7hFL7PMOKAMkoAsIkSOLQnJK6anXNV/357xPdFwkd1nv
	m1XA8DioSmCfOrSVB4RtSOnwE5aY+DeTDG+bkkQhZCf0bxdj6XZlBbLBGqTM5xubuDFo
	4ukQ==
X-Gm-Message-State: APjAAAX8+5KD1i6NjVxaGCp65ShCfBDxUn2+PzyQxTNBNJRj43NMn0R7
	bRz+sjvDaEmCgDAeWZg0GJQ3aGOM
X-Google-Smtp-Source: APXvYqxwsABXiMBldKJEZa2wSeQJV7Bs7k6E3j3KPmyIgwHLYMkPDaGnF2d3XY+EheWOEy1dxpUK8A==
X-Received: by 2002:a63:201d:: with SMTP id g29mr9682306pgg.427.1579672108072; 
	Tue, 21 Jan 2020 21:48:28 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:682c:76b9:6d8a:bbd2])
	by smtp.gmail.com with ESMTPSA id p18sm1413247pjo.3.2020.01.21.21.48.27
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 21:48:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 21 Jan 2020 21:48:16 -0800
Message-Id: <2bba0052597020ea887c84419440df11f9859283.1579672034.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579672034.git.akuster808@gmail.com>
References: <cover.1579672034.git.akuster808@gmail.com>
Subject: [zeus 11/11] sstatesig: Improve debug output if getpwuid() fails
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
X-List-Received-Date: Wed, 22 Jan 2020 05:48:27 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If getpwduid fails, we don't see which file it failed on which is key information
to aid debugging. Print this information when exceptions are raised.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9d7a5219713af8117eda145052c6d9abdf577d8f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/sstatesig.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 24a221eb1a..b2316b12b8 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -521,8 +521,12 @@ def OEOuthashBasic(path, sigfile, task, d):
                     add_perm(stat.S_IXOTH, 'x')
 
                 if include_owners:
-                    update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
-                    update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
+                    try:
+                        update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
+                        update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
+                    except KeyError:
+                        bb.warn("KeyError in %s" % path)
+                        raise
 
                 update_hash(" ")
                 if stat.S_ISBLK(s.st_mode) or stat.S_ISCHR(s.st_mode):
-- 
2.17.1


