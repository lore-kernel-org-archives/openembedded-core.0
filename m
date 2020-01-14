Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 14FA17FBEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 15:49:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z7so12616016wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 07:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P40EEB1gZAODuYcEuiQcAxY0LYLVLKSGEe35WTDswNE=;
	b=cGhPIPic7+3j0CFvJuMussr9TcM0ZNrEj4CVoRrjOshLTBL3gXhjKaoHzg+lOhelBS
	O7CLsYiiEz7qyMWygbtpY0xcI6sLxlpHrOaZgpr6maButgN/3NjEHLiNfJavZmAaku85
	qK+0texv4398BVGJV76INFmUDAczQLRv0+sqrQNqDo46SlGYdaeUgHgfMD9AMKfi4Ddq
	wkZmzhD7IIpJ7yp/CFtrWu31d6kSDTwp0ZdslE9bbb2jKOx7XZqeVyNby1QKm8Lo8fTQ
	lin9TJfSXrhuKlvOBGTvAuBTG28g4Fm1JND/sOqv8yVbZFCiTlDZZccX3Ej/rQGjCghA
	Oo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=P40EEB1gZAODuYcEuiQcAxY0LYLVLKSGEe35WTDswNE=;
	b=K+5huruUMVNMhHhsI1OVryWtwYI7FwmLfyN7yEI5VK83c7kVkldbBMbzScZsmWX3/m
	goLHKcahBXSLR83mZ8RDoO+AaT8F2ByHMuzLdRgYViRLJSkCSWJ03YMCPv7oN4f9UC/D
	bb1EpBIcQOS7Q9tGSpJ8LKMn+wbd8wBj6XZq3BUMjbGPVMQ+eRlYQzGN7mINVPtse1Jb
	5UIzoJCJIk6lGCch9JZYnT+nf29srgfcoiUrs1kDOzjvyYO8W6rcO+yn/Rb9cB47kIRi
	Ylezy+t1KinpFoy6O6qJ2uumJru78ipl/GvMS0aquEDBAD2GrVjO0AEaF1PncgBuOsyH
	QTKA==
X-Gm-Message-State: APjAAAWNnhRvRijNYOrenKiayZFqahnEGwicoMHrIpUaqTUmE+iIpTYd
	lY6/JTKdyl84NeYsCSHCKBsnm1UP
X-Google-Smtp-Source: APXvYqwzQClGFUlML8U76ikEB3sUReu4n9u2d4f3iD3jD1wqCwGbX/tt1tHd4q6d+Cc+6YXeDcRkJA==
X-Received: by 2002:a05:6000:11c9:: with SMTP id
	i9mr25243612wrx.164.1579016986469; 
	Tue, 14 Jan 2020 07:49:46 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f17sm19240311wmc.8.2020.01.14.07.49.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 07:49:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 16:49:37 +0100
Message-Id: <20200114154937.78532-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114154937.78532-1-alex.kanavin@gmail.com>
References: <20200114154937.78532-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] gstreamer1.0: set the name of the test suite for ptests
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
X-List-Received-Date: Tue, 14 Jan 2020 15:49:46 -0000

Otherwise gnome-desktop-testing-runner starts testing everything
unrelated as well (e.g. glib).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
index 74368c4cd87..b6980670410 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
@@ -5,6 +5,8 @@ RUN_PTEST_FILE = "${D}${PTEST_PATH}/run-ptest"
 
 EXTRA_OEMESON += "-Dtest-files-path=${TEST_FILES_PATH}"
 
+GST_TEST_SUITE_NAME ?= "gstreamer-1.0"
+
 # Using do_install_ptest_base instead of do_install_ptest, since
 # the default do_install_ptest_base is hardcoded to expect Makefiles.
 do_install_ptest_base() {
-- 
2.17.1


