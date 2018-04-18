Return-Path: <armccurdy@gmail.com>
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id C20976058C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 22:10:30 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id a14-v6so3694919otf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 15:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yoPawdvVdZ1ttOfyzJ4I5Poj2PzQrzYE0g4P4ldPic4=;
	b=nxcLgjdv+YsVt7NVMf59+fQOu37Opmmox/UbRrB6qXPpw7afUEmTipK/D1d8gwjAqv
	b+ayqWCq4S33ZDROk8mLaX6fVdhF3qAUq15HaTGnUQhk9Dt/iZbIhRwUFCIfobrNddGD
	LGGaEkJbsRmF5WBd723JxebnohjpyoSCVxN5yDx4kTwhOgWSuz0QxD++O93HURVkYaaX
	E+q3JeXj/geV31QFa56Y5DPuS0dM4JkRSSsMqPJVMTsuo+ZxMwkCLhbLtYJ0yhkVahXH
	5HHZaLKSr2+RLkVZLwOp0gixZiv9zoQi28Jlfj59pdzA6uVRfotafCI0953OLQE8CQDM
	cuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yoPawdvVdZ1ttOfyzJ4I5Poj2PzQrzYE0g4P4ldPic4=;
	b=DwZBHTRDgBtBrwvW78Ewouw9G1LGWrEZYYA4ybL794gGpJId8XuqfoeNoe1zF27oZv
	e7Eo9kuVM7XdRoBHbe8h8n7E7sPn3qxJsOgu/AQ1jOjz/oMaC5WoXnae6R4zvpNSfhmR
	0M8UE1dwyUMwB38PAQ+KYISElXu58od8MEoeYDArp2gVtHmPTYKnxpo5Z9KEhq9BMHXH
	5eBLKPjNhhtVa1Qo17Fygr8HOu+HdUFTKXJkFgv/J6qElS9G2m4BXdQnu+tTwM98q0iM
	Ok0+xEycwQj7HPIEMyjv+LmNGc2HAZKrlxFukxVQamVe9KC6QsjRtFdVgHWVjhoPuzV/
	iMzQ==
X-Gm-Message-State: ALQs6tCkA3zVsNZqa/4yBJ8glbe/DjWocYNNlAgIhlRRMGOYJakoILjk
	rtAaRhDg8am4+cbet8B6sNWo7Q==
X-Google-Smtp-Source: AIpwx4+uD16uQ0Q6oXBELNM2D128P5cncQWZCPbZ4TqmkhUHTGMa9m0HvzSEzsoB2H0L06DZgaIzMg==
X-Received: by 2002:a9d:3d07:: with SMTP id a7-v6mr2325028otc.54.1524089431210;
	Wed, 18 Apr 2018 15:10:31 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	a69-v6sm1241710oih.31.2018.04.18.15.10.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Apr 2018 15:10:30 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2018 15:10:23 -0700
Message-Id: <1524089423-2108-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] package.py: use single quotes for path passed to file in is_elf()
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
X-List-Received-Date: Wed, 18 Apr 2018 22:10:30 -0000

Align package.py is_elf() with recent changes in package.bbclass
isELF():

  http://git.openembedded.org/openembedded-core/commit/?id=7877761534b0c2492da6289e9f2269d41b6ed464

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
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


