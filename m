Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A348F60191
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 08:46:55 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b184so9591802wma.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 01:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0+eR0UV+HmaFPlZfHuNa+2cLc0cmdFzRXZmTejvANjU=;
	b=cILBBwe645geUTW5SIvyCiKUXCDRLSlyRlSL+lOcr6zlRJxdxn9ziBm63ddXbcMryL
	hGHb1yWded06YfkWB+TIVF8bJG9oyQi3N49z1XIEtawiZgbdzRxsInULYlAzDhFDAyRR
	hck0RZya1PPl3hJ0V11Z/UFZWbksbmbNyjPQDRllEY9j7o+DWeo5nH3EApbl+2vwHb2d
	J2nYiV+IMgdYlit9Bp+PeC/b2jyjkDpkVIpk+A6AOlnxrOVa2OI5/lt9A1mjy4oy0l7M
	rTWzpDPMYeFeXInZgpHdA+72gV/Tv0Xu3hVo7ZPbCSV3zg4O3B+/6RfaZNV6/wgvum/7
	9Wrw==
X-Gm-Message-State: AA6/9RmMAVFVb7mjEQKFErK/2fL0696AGTUbgSaGy09ejVKMPo2YKlXLSvjLx2jmfKrBww==
X-Received: by 10.28.87.16 with SMTP id l16mr1505104wmb.75.1475138815931;
	Thu, 29 Sep 2016 01:46:55 -0700 (PDT)
Received: from tfsielt31850.cork.rd.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e12sm26895947wmg.17.2016.09.29.01.46.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Sep 2016 01:46:55 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 09:46:54 +0100
Message-Id: <20160929084654.29562-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] image-buildinfo: restore trailing newline
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
X-List-Received-Date: Thu, 29 Sep 2016 08:46:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The last line in the generated /etc/build doesn't end
with a newline anymore, restore it.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/image-buildinfo.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index 83d0db3..3003f5d 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -71,7 +71,9 @@ Build Configuration:  |
 Layer Revisions:      |
 -----------------------
 ''',
-            get_layer_revs(d)
+            get_layer_revs(d),
+            '''
+'''
        ))
 }
 
-- 
2.9.3


