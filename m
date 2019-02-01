Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 50C3B7C4C2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 12:59:03 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v13so6982055wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 04:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s0NULJuzk23ocOpo3jIukq0rJRapsetZmC3GarQFteM=;
	b=dO0vXDP+VMEeagYOdqJFKLxaqZN1WP2DLJZYHraYhkfTDAcU5mkDEAaAy/+Gszm4vQ
	lsXAe5peDNJDBzIE/UX/+Nt2vQvc7WOB5rOsYaqR/rzahk4amcpNk1+BcB+SsOqfg6Va
	32nQmgYkUP33VtV+h+hI315F2aXa+6VyIY+oqTd6VbLj1L8L8NBeomd3KBVpKd6FvDwh
	0pDbCL8eZ0K/OpeSD9Z16xsfRhCs216yzH91A7oLPIsbPnwKWfIwwJxdEixUM55eN2WJ
	0qDhH4bwOJ8NRUXCceLKYdNcHTiNSOFBJrFw5Bvh3Ew1KENoG3y5dep8WOPQ7Rdfnpv1
	glig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=s0NULJuzk23ocOpo3jIukq0rJRapsetZmC3GarQFteM=;
	b=Wb8bzXk/AS2L74Oip1TNyPp1gd4HTeB6FWnF8vFZF8NSdTJsgXahyC73yM2qEE+qZb
	0TOqj+ptt8owoQtn3vO4ahFxKS683daDkYtNvpaohSCHuARY3/2ctu+ya2xrX0HYNeR5
	3brhprM7zfGvip9fAFklX/6qiTyXszeNm/3H4NNiekic0Eljah9Lxro5XSCb6aTbzPPX
	QAHEl0BmDd5rVLKE2C+rIx8pUi0YLPc3h7ojStML4DTKRRqf4l0bobYzD4FszWtPA2ue
	YVZz2pZPDnofbL6Cj/eX3M9Omi0zcm5CO4ztlAPtc18QbedFreYclzJFAvLiIBXCd8kS
	GBDw==
X-Gm-Message-State: AJcUukdiW/Md4cV5ivVQxTlZZSEGELH0+p3EwTQ8auexsYMBJ7YywCEO
	Y7B2pab9AQnc79QFkSQBc2etWsdy
X-Google-Smtp-Source: ALg8bN475zYp6mCSiHWrtQPnc8eJZLCUuPsYg6hrHd9TsdPx7RrodxCXK2LFvDYsrxiA+8RhiP0d6g==
X-Received: by 2002:adf:e608:: with SMTP id p8mr38803005wrm.166.1549025943845; 
	Fri, 01 Feb 2019 04:59:03 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id p4sm6898056wrs.74.2019.02.01.04.59.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 04:59:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 13:58:54 +0100
Message-Id: <20190201125854.88741-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201125854.88741-1-alex.kanavin@gmail.com>
References: <20190201125854.88741-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] lib/oeqa/runtime/cases/gi.py: fix deprecation warning
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
X-List-Received-Date: Fri, 01 Feb 2019 12:59:04 -0000

With newest Python, the following is printed:

PyGIDeprecationWarning: GObject.markup_escape_text is deprecated; use GLib.markup_escape_text instead)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/runtime/cases/gi.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/gi.py b/meta/lib/oeqa/runtime/cases/gi.py
index 19073e52cba..7e16651df74 100644
--- a/meta/lib/oeqa/runtime/cases/gi.py
+++ b/meta/lib/oeqa/runtime/cases/gi.py
@@ -9,7 +9,7 @@ class GObjectIntrospectionTest(OERuntimeTestCase):
     @OETestDepends(["ssh.SSHTest.test_ssh"])
     @OEHasPackage(["python3-pygobject"])
     def test_python(self):
-        script = """from gi.repository import GObject; print(GObject.markup_escape_text("<testing&testing>"))"""
+        script = """from gi.repository import GLib; print(GLib.markup_escape_text("<testing&testing>"))"""
         status, output = self.target.run("python3 -c '%s'" % script)
         self.assertEqual(status, 0, msg="Python failed (%s)" % (output))
         self.assertEqual(output, "&lt;testing&amp;testing&gt;", msg="Unexpected output (%s)" % output)
-- 
2.17.1


