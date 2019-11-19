Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0FA6D7F365
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 15:33:10 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c22so4194362wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=f7dVJchUgDxjAcO81haR7fRFZpirYhg0kshc9ekLis4=;
	b=IUeXSNpYGHv6y+dlQIWX4j9qZNx2uNrfu3jMPMGtJHWhdyTj+Py4bsn5W3QBsc2qA+
	xyOXSFctJomQrFjOeBR+KTNpquqfPGa5sTkViYcQJ8HyEgX7ynBT/71KHNPf2KEO37mC
	j5igH7E4QRZvY2UMir8oB303UWRueQY8jDYZao4f1rI5Y8uvdH27dA0ILTeL/pKaqNeL
	VGq+ynCd9HF5JzlUfjEVuTTv8HFVkykBSRKo7/K8S4Itm6dFq0iHh5gd4MFYJYS90MOp
	LgcaZoDW+4l8SfGDqU+Zs4AasOj+chE1quLLD2UPIhPCCTbzHtPTrGcostlyRODKhK9/
	Gsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=f7dVJchUgDxjAcO81haR7fRFZpirYhg0kshc9ekLis4=;
	b=noG8iXVtqORhq5KsoYNYgTm2cBmWtNfeSZIT+0+VOwmmXibY6V1DVLsWBfWABzdvlZ
	9HN/TRzIdrEk+4aH6ryz+xdQ1w5uy2CzDZLHjCokV+2GsY7GDukOrYbRZ0Ft2Ay3bwKY
	TE0UgkV7zg5t0X3ueBqB2+O6ZIdJzz9ou5rbjqU8dKremmNYxtsAVqfNDlcu/1DpZ6C9
	n8YoQ1pRcyIj9+e7TgBrBbZvp74ih+Iqy+r77Tt5RpxXNC/dDxxedK3rND6wHQh4wkga
	OTO40+Rz63Yo8AwQbGeQKw9C3vaMyFZ6pyk4LLZFG0e7WcIrDsoL44LEt2bhgbYhAnuy
	hPnw==
X-Gm-Message-State: APjAAAWkzD+v8QD/VGJHYOT7GoGloc475pr5mAnynNFRc31pWpXmzd4v
	qr//wmwCK8zbshEJFZIxy6b/V2D91SU=
X-Google-Smtp-Source: APXvYqzU87uYYdeMcHU7rtB9cHBcw6Zx5zhyljbRS7NyJiZzehlRtOOq6gB8377xyZFBHgxsGsnvGg==
X-Received: by 2002:a1c:96d5:: with SMTP id y204mr6209399wmd.63.1574177591262; 
	Tue, 19 Nov 2019 07:33:11 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r25sm3459753wmh.6.2019.11.19.07.33.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 07:33:10 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 15:32:42 +0000
Message-Id: <20191119153241.697-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] python-native: add python-misc-native to RPROVIDES
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
X-List-Received-Date: Tue, 19 Nov 2019 15:33:11 -0000
Content-Transfer-Encoding: 8bit

The package python-misc is not in the manifest file
so it needs to be added explicitely to RPROVIDES for native class.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta/recipes-devtools/python/python-native_2.7.16.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python-native_2.7.16.bb b/meta/recipes-devtools/python/python-native_2.7.16.bb
index 90103af8be..057567b08e 100644
--- a/meta/recipes-devtools/python/python-native_2.7.16.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.16.bb
@@ -79,6 +79,9 @@ python(){
     # Hardcoded since it cant be python-native-foo, should be python-foo-native
     pn = 'python'
 
+    # ${PN}-misc-native is not in the manifest
+    rprovides.append(pn + '-misc-native')
+
     for key in python_manifest:
         pypackage = pn + '-' + key + '-native'
         if pypackage not in rprovides:
-- 
2.20.1


