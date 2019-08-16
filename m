Return-Path: <wesley.lindauer@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 589F17F376
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 19:45:25 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id o70so3622095pfg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 12:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4wpIIKUmaCgZAYI6dbv4l/lKJn9ZTrXFuTGUb4iZw18=;
	b=EkJ0I34z2zrSIssRD+4VJixXhdRxzaHtOghySH4Fyq5Xo3KKZ6rgYmi+nWokSr5igD
	JpVunfjLB/fT0PDQF4drO9FIJShEKw2ddWwX4mX7J8i0o4G7RAo9r8xfBkpg71E18i7G
	xfws38Bm9zO8fVYBXe5FOqcv14z0xXGzU476Qqw1SWTjbckmnoDoiEsefqDK4FOGsEVW
	d1V3drsFzGcSHwEjkDWXmqE2yJziZFOn9CgX50v57g+/i0pKQ789bdn477LAEMI1y/uH
	5JbKN/R7Wl06cM4RkKmjZWaxMQ79oPR8xbyIIfKphEIRcPTVMGZJVLmk45Rv5vrzKB8+
	X6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4wpIIKUmaCgZAYI6dbv4l/lKJn9ZTrXFuTGUb4iZw18=;
	b=qP8J4D61KzMHZJocNo7ffFmsdetH9EJLzjqOdzOS95/QEsE4PZCzwldAkxhIoTL9Z1
	oDvqMpAaz34DtP2w/LaZUwDbsvsqiREIPBd7I0wmyEgKZbgEz6kFRY2CQ/5Yf+VGQgBV
	a7s6lYgBlC6ugJQm/BRZCZ1GGArJRIFP6t+QLU8pSsBrqH0RFWaigdn6P1hWK4ZQF3QI
	rtpcr/IzAMol6glFZ+5+Yvel34HOeHpLnlgYvc2jO2nsSq1XWt2zubSb0IQQlY1UbCwe
	0B6m20yyo++QOk1bVez+/LqeYlpeGllkd4LBfHGN6ofO2F8ngoqTdTugKLyp/SxWtmPB
	wTdw==
X-Gm-Message-State: APjAAAW4fIiYROqCfkhyuNLp88ojDWkgzDRwq70tDAYV4Ru7yR+ceSx3
	2jPcYbTA+vnOXffDWsjWHXZHvyOe
X-Google-Smtp-Source: APXvYqz13jWgitrpRaKpDsVss0DeeJJqbYtMjcqlyKmjbpthe5ORZF13LfWeFpQxRL0Y/ni/wuIdyg==
X-Received: by 2002:a65:430b:: with SMTP id j11mr9035901pgq.383.1565984726468; 
	Fri, 16 Aug 2019 12:45:26 -0700 (PDT)
Received: from camaro.lpdev.prtdev.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id
	o35sm5537333pgm.29.2019.08.16.12.45.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 12:45:25 -0700 (PDT)
From: Wes Lindauer <wesley.lindauer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 15:44:02 -0400
Message-Id: <20190816194405.12751-3-wesley.lindauer@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20190816194405.12751-1-wesley.lindauer@gmail.com>
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
Subject: [PATCH 3/6] shadow: Fix BSD license file checksum
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
X-List-Received-Date: Fri, 16 Aug 2019 19:45:25 -0000

BSD license files must include the copyright notice.
---
 meta/recipes-extended/shadow/shadow.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 7f82d20826..6d9e300739 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -4,7 +4,7 @@ BUGTRACKER = "https://alioth.debian.org/tracker/?group_id=30580"
 SECTION = "base/utils"
 LICENSE = "BSD | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5 \
-                    file://src/passwd.c;beginline=8;endline=30;md5=d83888ea14ae61951982d77125947661"
+                    file://src/passwd.c;beginline=2;endline=30;md5=5720ff729a6ff39ecc9f64555d75f4af"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.14.5


