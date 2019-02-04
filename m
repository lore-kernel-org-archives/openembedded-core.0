Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 695477BF9E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 18:13:22 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id z9so293926pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 10:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G34WyfTbWy7UBjMV0Sa6olbOz6DstmlhbbO03P/2fCo=;
	b=aw159ecdr7dwxQfFltX+s4ryxp4rjESi4ZJiFCWz8cAYW6c2dJotzln3EyuPZIBh25
	gHR9xRTtGQylOObTuWgFW82tyjyh5IOF1vnJp5mPbQ/M+y62R+x6vLAfdOGIGjqrtolA
	e60ouC5r4O2+WoDvhfCq1ABIocrrwPRhAjOKGmAQnVW2wTldiZSf3IkEYW79dgX4HjxI
	0bhj+E9T1SvzkVnGzS8anOKoQ4sNRc2rk/IeHCVZoDDFrCbSxcJNsAfj2h4Z8ZImS1k3
	l7brM9sETqtq22EUkJlrvjfmvV+iwRmZdyyYhqHCvpmusg53A/D+inN4uJxs5w1rawbR
	urLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G34WyfTbWy7UBjMV0Sa6olbOz6DstmlhbbO03P/2fCo=;
	b=EqLZSJfVTFmjC42Q5p5noOhiHN8FnjALljlutXoZrMN+rFmM5irLH+881Vc1s4FvAU
	kzkqEKoERICxrQSPiOXOO+ES2KjXyiqtr+WV19psf3VsIur+05OWhQheidbIib8d/x3f
	BXgIYDvRhRQDrbIdKPuYOKSXvAVXQqJ73WkbOTYA2sL2UVGGy35LnceMRdGYAPLqoYKg
	kSlkOnFFAdsdb3fbuoEQsqHHI+n9jMEtRH3ExIvSxbgXvFFd+eWeR1UzLmmwCN4qYjEa
	aRfogKceD/5hE2njOMV13t+Ycb6XgtHymtYJkLdDzKGfxECOKqKzLUe0nn43DLrR142O
	/QVA==
X-Gm-Message-State: AHQUAuYju0Rf1i4cMsA0Vy3PbYEJapLxH+jGXPrJG4hGnuwRJqxaDKqM
	Zv24j9yE24vacbHn4+s6doR5IUS3
X-Google-Smtp-Source: AHgI3IaXFsCLuDliXmg4vM6BJQL3gZ0opvHzWZjP6eLOhxsbgYJYV5hpU0sltRqU2guS1Vl1YZYZwA==
X-Received: by 2002:aa7:83c6:: with SMTP id j6mr632419pfn.91.1549304003221;
	Mon, 04 Feb 2019 10:13:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1609])
	by smtp.gmail.com with ESMTPSA id
	w88sm1443747pfk.11.2019.02.04.10.13.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 10:13:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 10:13:14 -0800
Message-Id: <20190204181314.22496-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] send-error-report: Use https instead of http protocol
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
X-List-Received-Date: Mon, 04 Feb 2019 18:13:23 -0000
Content-Transfer-Encoding: 8bit

errors.yp.org can understand https

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/send-error-report | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index 8939f5f594..3528cf93a9 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -62,7 +62,7 @@ def edit_content(json_file_path):
 
 def prepare_data(args):
     # attempt to get the max_log_size from the server's settings
-    max_log_size = getPayloadLimit("http://"+args.server+"/ClientPost/JSON")
+    max_log_size = getPayloadLimit("https://"+args.server+"/ClientPost/JSON")
 
     if not os.path.isfile(args.error_file):
         log.error("No data file found.")
@@ -132,9 +132,9 @@ def send_data(data, args):
     headers={'Content-type': 'application/json', 'User-Agent': "send-error-report/"+version}
 
     if args.json:
-        url = "http://"+args.server+"/ClientPost/JSON/"
+        url = "https://"+args.server+"/ClientPost/JSON/"
     else:
-        url = "http://"+args.server+"/ClientPost/"
+        url = "https://"+args.server+"/ClientPost/"
 
     req = urllib.request.Request(url, data=data, headers=headers)
     try:
-- 
2.20.1


