Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5B5A5798B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 06:27:46 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id l63-v6so5569228pga.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 23:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=U8JipvCX9SRKSmc/wmNsI6rXpiwtWhT7Cvkp28ygv6U=;
	b=YzFY4lOtx+z5OBduMJC762qZ2WCC8EzceUBYmWGq4hQQqgo8BL9BAd7t8EQ0lEEZaV
	/xFg1UTW9kJ9dhy9O3m/GJOq63WBCoH887wFd2LVmogKDovtUy+wudwAnvPFXhy9lTge
	pLAbFfgo56uSNwublk9D18Mf9pjlGa7glBuLUVe+KQJ3e0NyGTYEBpFjy2wjmmAE88W0
	QepfWwRBe4e+51aeA1yaVUTLTcxqeJ1hNEkbutZWDqvUDG4QAvDImRW4yEWJPXjuxsJQ
	w6OYz8CnS7s+28bZ0klfo1DD1RClX8+h8eJdwDb2N/MJQvL14S6ibyNb/2RBv2U4VP9P
	OuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=U8JipvCX9SRKSmc/wmNsI6rXpiwtWhT7Cvkp28ygv6U=;
	b=dOfBk/HC6UpYDUioNBQ0tqMs1GnB0p5W8h5j6vdLLnQxxANbO7UlRrqacAjqQmSWzd
	F1WANkoNKL+lAjANqgyZcoh3Uq7HrcrcYfNFAC0vJrOT1r7w/SYLiJQTayuZJmndW+ZO
	nrZfhxVjeDOAW9zL7G82v2z6EyKFuDgNLHNzVm5rfrk7enZ5G84cgYXE7o1ifbShM6/M
	raLdDUAaGo6nXV2JjH9ytqNzedSQyWAjt6RmQCX/g5Hk2C9mNqBVPUnuOmcGO/UXeXHp
	PyoIKf+ggBIfUyAJs30tDmgkk0rDYsEaks+UQkKZC+e8/wNkLrzRLXR2bsVToPiBZBFT
	0Fwg==
X-Gm-Message-State: APzg51BSrBm99hXP9RY/tXyVRX/oMwCH322zZdBHEh/1KXRvS9IPFcIM
	NepmWJVdDdB6YLa+AXgwj1RvBg==
X-Google-Smtp-Source: ANB0VdYdCEy0EkwCQ03mw5EXuWvav3rHpbpp0CB/wcntu3g9K37OY54xZ9YuYZ6yuvhhbKv0HOc0dQ==
X-Received: by 2002:a62:89d8:: with SMTP id
	n85-v6mr44624139pfk.83.1537511267395; 
	Thu, 20 Sep 2018 23:27:47 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.120.183])
	by smtp.gmail.com with UTF8SMTPSA id
	i76-v6sm12062067pgc.20.2018.09.20.23.27.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Sep 2018 23:27:47 -0700 (PDT)
Date: Fri, 21 Sep 2018 06:27:31 +0000
Message-Id: <20180921062731.5149-3-nathan@nathanrossi.com>
In-Reply-To: <20180921062731.5149-1-nathan@nathanrossi.com>
References: <20180921062731.5149-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 3/3] qemu-targets.inc: Mark 'lm32' as softmmu only architecture
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
X-List-Received-Date: Fri, 21 Sep 2018 06:27:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The lm32 architecture does not support linux-user within QEMU as it is
not a Linux supported target.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/qemu/qemu-targets.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-devtools/qemu/qemu-targets.inc
index 66dd675ed4..810401daa6 100644
--- a/meta/recipes-devtools/qemu/qemu-targets.inc
+++ b/meta/recipes-devtools/qemu/qemu-targets.inc
@@ -7,7 +7,7 @@ def get_qemu_target_list(d):
     archs = d.getVar('QEMU_TARGETS').split()
     tos = d.getVar('HOST_OS')
     softmmuonly = ""
-    for arch in ['ppcemb']:
+    for arch in ['ppcemb', 'lm32']:
         if arch in archs:
             softmmuonly += arch + "-softmmu,"
             archs.remove(arch)
---
2.19.0

