Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 692AC78900
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 23:37:02 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 9so24349177wme.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 15:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=qbcVkrNibyAthCrvTgJsqcJ5pXLpqJSxbZoF9lwn2mc=;
	b=FuSKVksq6x3eiZRJCGCwOT8qJX+ua+fLyFAX4en2XDzqo+RKL5Zps2u3jPs50ZDi8A
	Nf41sjnyF/q+stjzAk+mGpjPDOBTWp5I8nnZT6lwixMJF+OyN0FUGjvZM8srfFzkVIqi
	oow5ihAvcptozU/xEFY3AFok1DnV8ND9pdIG2DIfiVzEQACDYM1xfGBuc/WeT++foPSO
	Z5k5OJpC+RKXB7wCvCEo3h73jDgpXlj1fM8FpBnoHGnyRtFt7+7UiaOW4Pui6XYRAqS+
	JePqXtEBo+JNVKbnS2uwrtwzzWdZMZMJ8B0mueHhgRS1ZUKhvpfDdQQem9KDuY+4sCYe
	5icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=qbcVkrNibyAthCrvTgJsqcJ5pXLpqJSxbZoF9lwn2mc=;
	b=WEk/j0v/f5mDcsPcJckG9tk+RYD2ukovB2DsXhgW13rtvSqZ5vqyPHiSFExQl6e3aU
	FUjHXxKyz9kHfwSL15WDf2TbfmhkBg3D8gx6X/Cw4PVOQQM+6zX+ETWJqdKka1U1IP7u
	O06HqvJp5rNjNOcPMRejjmeOMOOQE02ALRdglMLni8y3WWX4NXMRQNHomsAUzJKmbLBE
	FUfSPylkLCUNMBKhvCKvCG/mv8qVhuHgg+Naex2AgQAI5voBBaRW00YZm7IZxfWF4bmk
	6ToDmYch1XH0HiAz9zIf4ypROjYb1MWAEQbP8mb6hL9e6Pj4GhtPASljm9D4cZt4Nzs8
	/N0A==
X-Gm-Message-State: AKGB3mIMGktqBSaXAKOr+s60SM3K5/vcUscgiH/RqjY/szQX7u6Qr2jJ
	R9A4wdtJDCv8t+AUi2an6nzKi9L8
X-Google-Smtp-Source: ACJfBosIe9ELBqIBj134ezCJHsoqCYWXeEKGnhcnfSOOMQCFiLSZCttmewmUwylo0wgXFyYOM57xTA==
X-Received: by 10.28.168.88 with SMTP id r85mr13916289wme.63.1513985822893;
	Fri, 22 Dec 2017 15:37:02 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	y42sm26864699wrc.96.2017.12.22.15.37.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Dec 2017 15:37:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Dec 2017 23:36:59 +0000
Message-Id: <20171222233659.6615-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] rm_work: remove debugging statements
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
X-List-Received-Date: Fri, 22 Dec 2017 23:37:02 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/rm_work.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 59180829abf..31d99e4554a 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -183,8 +183,6 @@ python inject_rm_work() {
         # work in the recipe itself.
         # In practice, addtask() here merely updates the dependencies.
         bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
-        if "initial" in pn:
-            bb.warn(pn + "2: " + " ".join(deps))
 
     # Always update do_build_without_rm_work dependencies.
     bb.build.addtask('do_build_without_rm_work', '', ' '.join(deps), d)
-- 
2.11.0


