Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1E59171AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:17:19 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 75so5492126pgf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=4Kgqc/nnEbXYzZOL2uiJ19F2DtWuGZEYYTgiHsMQFi8=;
	b=EgWvVi7C7LgJ1S/MKhe4hBIGxzQo/COkSVzsQkSRN1ryPEblaoMN0ttITmiZLEHRJN
	WtfJmAQATkRMX5SuM08p42hcoME4XH9hP51R9/f2wApQGigkOSFdUNpr02gs5+4hJ0dF
	sFORrwd9allfHBHOyQiUPIbyKTrffYezCb+GFCFrTF4ZHs6tepCBD88k16iiJtxNDrOs
	ZoYHjr+T0+JmWz+cg45312k7rXkJI8wI593zd9H/SGuQeKbACCFEzWHTXVVtGqTM3H1r
	A2qh9k2mnXqtSeDOLQ8gYRGLr2EkYO86w4mvkSZ0dMiVTDSUbseAIxKqYwqugkXeqvLC
	ro5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=4Kgqc/nnEbXYzZOL2uiJ19F2DtWuGZEYYTgiHsMQFi8=;
	b=LO8Yf0UyjZLlWqvkiSgrR0S2TaE4fKX34CRWJf4tfQf2QY1vmlVa0sTeoW2VDjwZZY
	fkAcavmB5v8UkvWdVDskHda46zNu6FIESHH6gwUjSnxxmip9zvziz333yQ9bdRN5GCkK
	bigQoGQvuXN2WKpjUQnMUAfadneQ7CZ1jwSccXaL+46sxkbWJy3tlvNhFDv1sk5WV9jj
	scpS1QD9o/ro3z+9lBJzzHajMzuZvxZ1J2SFnInEgRBuUwc67MB+LR4q+sXZfMH9+dm0
	orlaPujzzDXsrsG5Q5yh9zBGiw/aokJbYJMwHm/VCF6+vDXOYDWnz2RAsX75lVvw47Nq
	jiwQ==
X-Gm-Message-State: AIkVDXIMsAkvjPnYaMpEM2Auz626WuGBr9G81DKeBI90P+9ovoou2UCN8MwZ6fayPMNkzA==
X-Received: by 10.98.150.88 with SMTP id c85mr37683687pfe.68.1484576239863;
	Mon, 16 Jan 2017 06:17:19 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	w76sm42592111pfd.74.2017.01.16.06.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:17:19 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-20-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 20/30] libgpg-error_1.25.bb: Handle packaging .exe files
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
X-List-Received-Date: Mon, 16 Jan 2017 14:17:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Handle packaging gpg-error.exe in the -dev package.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
index 278ec63bd1..3d142a1609 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.25.bb
@@ -56,6 +56,6 @@ do_install_append() {
 	rm -rf "${D}${datadir}/common-lisp/"
 }
 
-FILES_${PN}-dev += "${bindir}/gpg-error"
+FILES_${PN}-dev += "${bindir}/gpg-error*"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


