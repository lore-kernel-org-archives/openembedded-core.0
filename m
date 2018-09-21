Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 60068798A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 06:27:41 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 85-v6so2501280pge.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 23:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=o8Y7LkJl2pn29h7G6tgEF8LD9IrI+RGFlu/YI1APYb8=;
	b=A6TudAPlcOLWR6c5+wTZOfgsjQcJKfscnGDTQh8acKiVRmeQYp1wSEB87Pd1Vxz9VY
	RVOwRPAVFUayJawlsqKppEEyBxGOZRnEP6HM/ZRHXnEhIyRk2zfCt9ZiIzkQaXvWa1jX
	S/AVer53yeCjRPas5JiXPCaaFVGx5bGqWoxUzdImAm0yIZaeDxe39pNb9Cd0d0iso1tJ
	O20Nyo58PNH3PrEIdiB0NOy81BzrVPctOlWveh5/6DYfncRHU+Olqx+VI2Km/WV8eQTP
	PU0ixbeYbXc6j2GBuxMFlGRV7NH22MwYX0OwmEWEfx9dYDu6uIH0mzD1JXyXsn4a90q3
	iUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=o8Y7LkJl2pn29h7G6tgEF8LD9IrI+RGFlu/YI1APYb8=;
	b=j6Cb/KEOxAWVINaLuihAwvr0fSwrmoTm0cLi2anuCvUsXga7bVwpkFh2+e7zmcm+iQ
	zW8E6LtfyLJUP7WzVWYkG4zCxN/oARCwNxO8SBVzp8OA6jmg2pSddjSIF4hpeE0jhYA8
	cV6VNJEf1USV5lHhCc/jh2PDcdw55Pr8cTyWw5kdC536chTZjYp5/KeLxb8ptCqjc1TD
	jr+BgDQ+xmVSLuM9tKp6fA0jPFuOWgU3JAsudEg862Eo/+GO2tbN00miW0wKQoS6qZZb
	zAunMKxb5tuKO36AeHJs1YP6NhRkTs4uY7SPJ/axde6tMInQMx35Pv+JAGYm4fBk65ED
	mvPw==
X-Gm-Message-State: APzg51CXze4ehh6KVhWb8Y7tPMQ27zvvFk/l2YZTzf8IURx4UoVxxuK4
	DuWxndvo9iAVLhmPJFQuEa+frg==
X-Google-Smtp-Source: ANB0VdYz7/F3eH7vFP2uYY0bQwcWDiDcAd7wQK+Agjy2QRc35w3Yc2wikVDxS/JJb5pp+TDPLe3BcQ==
X-Received: by 2002:a63:9619:: with SMTP id
	c25-v6mr40485712pge.23.1537511262451; 
	Thu, 20 Sep 2018 23:27:42 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.120.183])
	by smtp.gmail.com with UTF8SMTPSA id
	o62-v6sm32946518pfb.0.2018.09.20.23.27.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Sep 2018 23:27:42 -0700 (PDT)
Date: Fri, 21 Sep 2018 06:27:31 +0000
Message-Id: <20180921062731.5149-2-nathan@nathanrossi.com>
In-Reply-To: <20180921062731.5149-1-nathan@nathanrossi.com>
References: <20180921062731.5149-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 2/3] lib/oe/elf.py: Add LatticeMico32 architecture definition
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
X-List-Received-Date: Fri, 21 Sep 2018 06:27:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Add the ELF definition for the LaticeMico32 architecture. This
architecture is 'elf' OS only as it does not target Linux.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oe/elf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index e63d268c35..0ed59ae05c 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -13,6 +13,7 @@ def machine_dict(d):
                         "i586" :      (3,      0,    0,          True,          32),
                         "x86_64":     (62,     0,    0,          True,          64),
                         "epiphany":   (4643,   0,    0,          True,          32),
+                        "lm32":       (138,    0,    0,          False,         32),
                         "mips":       ( 8,     0,    0,          False,         32),
                         "mipsel":     ( 8,     0,    0,          True,          32),
                         "microblaze":  (189,   0,    0,          False,         32),
---
2.19.0

