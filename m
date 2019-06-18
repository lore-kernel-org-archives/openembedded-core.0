Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0CC7E8FF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 10:43:50 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f9so13344097wre.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 03:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=CNmvupkKf7ZB0Zo//FlK6bQX7FSQxwKJM5P9WiGoS1w=;
	b=VOQsBFphgL/lM3ryl69YjbA0xoXAnATo8/dKqpUCWQA2H3wckc5CPSKRqdGyRPzRhk
	QFB5wdHvc/WSBMHeQwJKocEL5WelJKgrnjrguEqBOfrvaFl2wb8dy4P3II+NaQuJx2bZ
	Y5KC7AprYYV++aA674vUvWVOUODzHg10rxjmQq3Qw1OuihUzFkz4xLT7sPEt5ao6C0HN
	+LCESAVZXJK4j5Hi7Zz03N/PXqZ2FwSKKXoA5TTY0tgT68mTN4kBGOJ1I+wvRL0JVJG+
	2SRXiN5CgHz06e+of/lsL3dIXHTVrIf8JstnP9xPk/1FJXS8YGEyTfSeeNNhYhim5gMu
	rxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=CNmvupkKf7ZB0Zo//FlK6bQX7FSQxwKJM5P9WiGoS1w=;
	b=l3dhtfDv1t8C3DmrZRVOv+KGaCY8XsW8f31GoEzJxXG+ZE4diMUh4VIENK+xYluKFl
	H00k0atn7Er7IOfW+/AlgunlFkPhRBAqQ02F5uTGYNMvvCfHWBff5Ll+KpX7pHdDD05c
	iirGSIirjextl9FnA7HPT8b2A7pnRQPbU/zAsllxIJHTPavY1nss3x+RM3m4ZKwafRKF
	YapLFrM/82robUTIGyUbmLTGPxf/Wzh6Iv8sCByfq7KqDQ5RCjSpwd16u5ATr78xhnW7
	/XfnNMQxam6Lgd7D1b6v69aSF4iKErt/DN9TZDpuSwmP0oPUgjw87IStlF0ZYxa/N/HQ
	MgIA==
X-Gm-Message-State: APjAAAUCt8H3vHARkjSou4X40+1m3GvLX9Am8wjpaLMaBHuokEXbs7gs
	vEz3373CVyJhYhELRQAFzLuqYi3dS3Q=
X-Google-Smtp-Source: APXvYqyq4zBZ7f3guTpydfL5+yJAJffafknAkwCNCgiudasoiPLU71SD7l37FxN5kw5tNhWLZPLldQ==
X-Received: by 2002:adf:e843:: with SMTP id d3mr1816108wrn.249.1560854631610; 
	Tue, 18 Jun 2019 03:43:51 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 72sm8559473wrk.22.2019.06.18.03.43.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jun 2019 03:43:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 11:43:49 +0100
Message-Id: <20190618104349.24279-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] insane: remove empty test that does nothing
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
X-List-Received-Date: Tue, 18 Jun 2019 10:43:51 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index fdc20c41a52..6e32db00314 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -259,13 +259,6 @@ def package_qa_check_dbg(path, name, d, elf, messages):
             package_qa_add_message(messages, "debug-files", "non debug package contains .debug directory: %s path %s" % \
                      (name, package_qa_clean_path(path,d)))
 
-QAPATHTEST[perms] = "package_qa_check_perm"
-def package_qa_check_perm(path,name,d, elf, messages):
-    """
-    Check the permission of files
-    """
-    return
-
 QAPATHTEST[arch] = "package_qa_check_arch"
 def package_qa_check_arch(path,name,d, elf, messages):
     """
-- 
2.11.0


