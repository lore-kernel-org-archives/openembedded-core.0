Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170DFC021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 18:59:09 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.24409.1739386745443337775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 10:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QyL3S2FP;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-545075ff6d5so4017458e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 10:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739386743; x=1739991543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9emNE70hJN+6BWT6l8z0V1o+P7L8D8SxuLuYyDHGYA=;
        b=QyL3S2FP0v0YLJmw9geXLxVAbA4OqnxWegX2x/aFtSCb9sKReUXSp64OP0t9tiah/B
         DYg762ItoJtoN+UH98uosUk5+AOX3JfLm+3aIkPJaZirArDQPck9UwSWA1ykdskIU4wR
         Jn8sRPXnvnjj6BfZ6ITUm8hq338Rewc6EW6N283vF6xNUwIlHeTcHSaARlXMTQAEjraP
         FTK8VSJCmHx+tGjrM8r/Nx7Hq9arB9r9QGskNSaGIGgrC6EHFjjzbl3FI4s6AaIFp/Mt
         BHndnsQcj/Ejfe2Bi9d16wtXIbyW8pKQyqW19jZXDnFrGciR6/jdjmRkemYIXp2fHMGc
         5OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739386743; x=1739991543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9emNE70hJN+6BWT6l8z0V1o+P7L8D8SxuLuYyDHGYA=;
        b=qviwfXKLfiLe2yCh10wI4X53engB7wZnDBX7jLRLYD3ccipuKRPelkhYslJSL+8uXk
         tbQ/oE95Za2PHhX5BXFksLiMJwyqjxTPJr0N8GlKfq9rcCjjmQg1GL6tFHVx9NFKnYNg
         rox8R6ly1bHQr5XxU+Yv7xnUxV10Sn6z+XcoS+yvlFzOLvAkdOG7cNXC6Q5wsBjM5R0T
         I0LkreCdXcmgqfmdJ+RetklRmFKfC1bnNn2F1qn73Z0ltD9Ns0Ein6fNhLbPRIZYtiSy
         qwDRLhU/ByVmuce48ZULjD689Eoe10SoEHANVANSBhBI/PDt9evabikhycBTLfDvOntC
         qnPw==
X-Gm-Message-State: AOJu0YzjRNvkiUHkUf+Xolx6murxiUNG75e0SEDMLxd0inzvIfkrnmot
	L5VlXRqdBOcahAMi2N4qD6CKpryeaL4DUdQ2AHZOJ0p/wNK74LPIKnoQYUoM
X-Gm-Gg: ASbGnctzbSKuLy5UGLinWRZ5O4uwIUxNwJVwTdfAoPfmcXgayNd60+wpTLVOMVy4Jkj
	cWXxPA4LJz/wiMyk6ssdP5CuO4iDdhQXBs5OfcGLNpNWhIgHtAacc7jkdWS3X6kKLXEHu2etB+D
	plXDwxp+AMTADzhY01UN1sEZfC2xjxa+lV8Gt9zMoNZTfKysVSLQi9Cms9mNfuJOeS4G43Q6uvg
	sLhcEu6Q3HC0CXdfBOf5h2//dBvpPjfiJbMe4JW+oD5/JQnHXcoMFSSvbMBJ8uOq93/BenOm6bG
	g0/CR6/1+nkTzSuPwcGFKtyrFMXOnCZI232jM6/8olRg0ueP5HI00eQj4ll9MNukOVZq6qNhVA=
	=
X-Google-Smtp-Source: AGHT+IEHUZxWdjlSu5MgT//tvOGl/dhiIHd9jl6j6ZU3N8jbrNt6aizm1nNMHeLHNuwMWMPIJIjkLA==
X-Received: by 2002:a2e:a586:0:b0:308:f53a:ed41 with SMTP id 38308e7fff4ca-309036f2ceemr19879631fa.32.1739386742748;
        Wed, 12 Feb 2025 10:59:02 -0800 (PST)
Received: from peterliu-Precision-5680.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308f7503e3bsm7969681fa.104.2025.02.12.10.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 10:59:01 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [kirkstone] [PATCH 1/1] scritps/runqemu: Ensure we only have two serial ports
Date: Wed, 12 Feb 2025 19:58:52 +0100
Message-ID: <20250212185852.35486-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212185852.35486-1-liu.ming50@gmail.com>
References: <20250212185852.35486-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 18:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211272

From: Richard Purdie <richard.purdie@linuxfoundation.org>

I have a theory that some of the console boot issues we're seeing are due to
starting images with three serial ports yet only starting gettys on two of them.

This means that occasionally, depending on the port numbering we may not get
a login prompt on the console we expect it on.

To fix this, change the runqemu code so that if serial ports are passed in on
the commandline (as is the case in automated testing), we don't add any other
GUI serial consoles.

We do need to make sure we do have at least two serial ports since we don't want
getty timeout warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1b0348535dce3b776efbcf26406b94730a51eb85)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 scripts/runqemu | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 8a417a7c24..9f7827565e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1408,6 +1408,19 @@ to your build configuration.
             for entry in self.get('SERIAL_CONSOLES').split(' '):
                 self.kernel_cmdline_script += ' console=%s' %entry.split(';')[1]
 
+        # We always wants ttyS0 and ttyS1 in qemu machines (see SERIAL_CONSOLES).
+        # If no serial or serialtcp options were specified, only ttyS0 is created
+        # and sysvinit shows an error trying to enable ttyS1:
+        #     INIT: Id "S1" respawning too fast: disabled for 5 minutes
+        serial_num = len(re.findall("-serial", self.qemu_opt))
+
+        # Assume if the user passed serial options, they know what they want
+        # and pad to two devices
+        if serial_num == 1:
+            self.qemu_opt += " -serial null"
+        elif serial_num >= 2:
+            return
+
         if self.serialstdio == True or self.nographic == True:
             self.qemu_opt += " -serial mon:stdio"
         else:
@@ -1419,10 +1432,6 @@ to your build configuration.
 
                 self.qemu_opt += " %s" % self.get("QB_SERIAL_OPT")
 
-        # We always wants ttyS0 and ttyS1 in qemu machines (see SERIAL_CONSOLES).
-        # If no serial or serialtcp options were specified, only ttyS0 is created
-        # and sysvinit shows an error trying to enable ttyS1:
-        #     INIT: Id "S1" respawning too fast: disabled for 5 minutes
         serial_num = len(re.findall("-serial", self.qemu_opt))
         if serial_num < 2:
             self.qemu_opt += " -serial null"
-- 
2.43.0


