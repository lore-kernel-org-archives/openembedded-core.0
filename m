Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id CDBCA74B7E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 19:31:44 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id j20so3867125pff.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 12:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u6sGQXn+uao6Gbb+Vkj83Oa4Ah6IgvSFm/1yrzkRE/0=;
	b=tLfxE0HLGy3x5mc8XbrGuUUSsP/JTkAlMdhngvwLaugtI/9NbMoCqiIXaUWu8RUTSc
	hicHM1G4QxzJSNvIEqWa8wSSK6iOYDwL7YnzQoM+3GrrhJ3A3rwHHSxaO5QEtNxUvAcP
	pp6mO8SDhUGm5NWesjLMK3mC0tHQymz854FfblfpUQjDheDhJe1l30NbzA3mKJbzEEWT
	naGFNXm9/hRYc57w1ze8iIUByEhoOQ/vg8HMm17CjO1I6bWmx8qewHBvtlEjVkNq77rq
	gICosp3wuRxBqlQiGiq8rWDYwpa5QNZCsNsEVMeT0nA2IVPxrSDqDJ5ApC5qgU0CXvA4
	xWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u6sGQXn+uao6Gbb+Vkj83Oa4Ah6IgvSFm/1yrzkRE/0=;
	b=GnzAFNJ6yeyY++D98Cg20wbwES0z3XYb6kt7MMOIkmDYjPXApevqZZ/M5rnD/GHlaV
	g5+Evn2ngKMJ9XMNe6JqQDjkXsk3n22V/AxcOk4t5EJqoOMzk7w3hklPGrE+adoiofw8
	j5WkcRxKfpI78SSO7sh5/cTmQg/PMzv1wbbRh6BAqAikc4mHKrJvA3Dqr2Nwl0X/ou7c
	z/xq9t4WcSWg1N57EITRJ/STidXfADSKqgr1q23QOnlUriqAMKWevO6twEqup9umzvxH
	9m5SxJ2DcHPz/JF+kYvUyZcze5ucoNgPuefipf+ZvMAqBvZf7y/C7G0D+gVWKWVjSuR5
	1XSw==
X-Gm-Message-State: ALQs6tCx2DoD6iGCWuWrCbASwl+mqDv0TuewOioBEo/QiTO4rje+RtEb
	WptFs6zFcAvavaYkpzhNgn396g==
X-Google-Smtp-Source: AB8JxZqqZhAbBEsBv3OG9ZzfMm4L2P+97nS4EAtyExz76vwmI1VT3z4Rmqy45GWRBmQBMa09FN2mwg==
X-Received: by 10.98.127.145 with SMTP id a139mr28142764pfd.25.1525462305415; 
	Fri, 04 May 2018 12:31:45 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	g207sm32105371pfb.18.2018.05.04.12.31.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 12:31:44 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 12:31:33 -0700
Message-Id: <1525462293-28047-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525462293-28047-1-git-send-email-armccurdy@gmail.com>
References: <1525462293-28047-1-git-send-email-armccurdy@gmail.com>
Subject: [rocko][PATCH 4/4] package.py: use single quotes for path passed to file in is_elf()
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
X-List-Received-Date: Fri, 04 May 2018 19:31:45 -0000

Align package.py is_elf() with recent changes in package.bbclass
isELF():

  http://git.openembedded.org/openembedded-core/commit/?id=7877761534b0c2492da6289e9f2269d41b6ed464

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit ab056c7f6065f310be4dd256ceb45f85ff981f69)
---
 meta/lib/oe/package.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 599fca6..4f3e21a 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -72,8 +72,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, qa_already_stripped=
     # 16 - kernel module
     def is_elf(path):
         exec_type = 0
-        ret, result = oe.utils.getstatusoutput(
-            "file -b \"%s\"" % path.replace("\"", "\\\""))
+        ret, result = oe.utils.getstatusoutput("file -b '%s'" % path)
 
         if ret:
             bb.error("split_and_strip_files: 'file %s' failed" % path)
-- 
1.9.1


