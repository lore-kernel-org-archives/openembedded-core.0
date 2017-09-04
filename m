Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id CBC587807A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 21:06:53 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id h21so1018282qth.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 14:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=lUL3ACjZDkixhtwg/XfgVmG2byctHOkPqv/58XUyn4Y=;
	b=Jc8uKMsMh2UOlircFzHxspHhLVnRoPWFTNWfpMIUuXJlXhec6n+VGvpBdfLD2j8gbB
	BDDMaleUlbCJThTbOKTMgTofpgOGfxNWW6aHQEgfNToW+KyeOkhYYazeV7gmBoS5gYpV
	prvgREDKNgtS7miJ9Fy/hX6UJLoIeuNqC3rXqSRMIB8nb2Lzau0vi/J8aFeuX4lAJzIm
	CYEgkXexjgi4vWtx411+RmU1E+PyMWmZ8RGHzJkbzcW1/8tKAHREOZZzWyJfCRk4ILxK
	QnNT3s2QodzzdghwbvLqqju6WuBpg2TIua69ojGcNvcm8LdFqkCokffzuUAsjF3BntFB
	1jwA==
X-Gm-Message-State: AHPjjUicqlTzapPsrJrwIByELSBmdZ5G1eE84TjtNUWL3ZSBEHjlekHM
	bkmDsgiuhyAs4ohz
X-Google-Smtp-Source: ADKCNb7vaALkoaQibGg8KM4caa6Rr4CKu2fmx93DOqJ2grqnvK/oXpoXf+ircBfSU8U0v3QNGnISGQ==
X-Received: by 10.200.16.146 with SMTP id a18mr2622195qtj.8.1504559213058;
	Mon, 04 Sep 2017 14:06:53 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id 25sm5663114qtv.0.2017.09.04.14.06.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Sep 2017 14:06:52 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 04 Sep 2017 18:06:46 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  4 Sep 2017 18:06:05 -0300
Message-Id: <20170904210608.23764-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170904210608.23764-1-otavio@ossystems.com.br>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/7] goarch.bbclass: Add support for ARMv5
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
X-List-Received-Date: Mon, 04 Sep 2017 21:06:54 -0000

This adds support to return the proper ARMv5 format.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/goarch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 7960ac5f9e..dbec6ee2c8 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -47,6 +47,8 @@ def go_map_arm(a, f, d):
     import re
     if re.match('arm.*', a) and re.match('arm.*7.*', f):
         return '7'
+    if re.match('arm.*', a) and re.match('arm.*5.*', f):
+        return '5'
     return ''
 
 def go_map_os(o, d):
-- 
2.14.1


