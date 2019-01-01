Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9956A6B3D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jan 2019 17:38:56 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id k15-v6so25391298ljc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jan 2019 09:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=8iyZGL5Kz1fz2gyTRK7PXoociKpzctnRnrqGvZgGJJU=;
	b=bivjQB1sZUO/GGL2r3oCy9ctBgeyP7pzXr7jndIWb05elBIaoPNrfQrTncJ2EutAJC
	3Yll6a4FpI+NDXE6k11iS/O6n1T+izM0lbUtVBQhRa6WM9Ppnt5ucT5bYDh6RAPLGUZ9
	7Z5f/f5YriaOeCcqc7saPkNsMMzKS9TkyvrCh0PR//oyjXjx+4/NRvioD6IdL2/4mKbf
	eVO36aWPeNjLQqmN/xrObPpAj1E0vaeB3O7E/5N6FVG9HgMr1zq1YG1Slf1ekqWWznsi
	miC7qwUCtuaYGDfBQT+yFqJGBpLrFIEtlKvMYkX1xc2pV529AkriFK1Zq0OixUfMmjbn
	+4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8iyZGL5Kz1fz2gyTRK7PXoociKpzctnRnrqGvZgGJJU=;
	b=fsB0IiFoSR+4Mf6ydi5v42NFLhXdyCQW2MOnBx9cpBnQC58NhMQ43nXK9xJ4yUI5tW
	3rPqGy0YIPVbHT0NOo+2gGUJJmbL+PwsHxE5gGeEhVIUGGAJ0AfZlef/bLCznx1AhFou
	qI01+bA/Xlz7DHBl1JEJG8pZZVtbbo7t2Tk12qzpTp+1vLgk+dP2nsAuTf5AQdy8/vsb
	8+8kFLZ4B06Z7b7mwTfLij95C9wam3n966EKwWp+Re+g597M5kdK16BH0/Sighbih8Pe
	rByhZef7Uz08Uwj0IdLM5G8ji06mOn79FPPdevNWAL79kV7MHzn7JROr3d0HnVgA6F6r
	daww==
X-Gm-Message-State: AJcUukfcLXZtws7N7U2O2Iw8SdsCSt0x7KaVa5+XupfIla5nepnpWVuv
	0L4i0sPDWH+lE+jz4p+WiNrc96oN
X-Google-Smtp-Source: ALg8bN44+jsZHhqn7wLCSiWx589qjlA/G7e/mfvd/0GouhDZGLit4oifV2sUL3bfZANh9MBlrcL5BQ==
X-Received: by 2002:a2e:94ce:: with SMTP id
	r14-v6mr23134233ljh.34.1546364336612; 
	Tue, 01 Jan 2019 09:38:56 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	c5-v6sm10662642lja.62.2019.01.01.09.38.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jan 2019 09:38:55 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Jan 2019 18:38:44 +0100
Message-Id: <20190101173844.15373-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] os-release: don't import shutil
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
X-List-Received-Date: Tue, 01 Jan 2019 17:38:56 -0000

The line was added in

  os-release: add the public package-signing key
  f7359ad6bec82d4aa761287a6c6d53cbc25adab3

but the actual usage was removed in

  signing-keys: Make signing keys the only publisher of keys
  1e38068ac38dfd067655dfd41464e28439179306

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/recipes-core/os-release/os-release.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 7f3d9cba00..d5793c6fed 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -30,7 +30,6 @@ def sanitise_version(ver):
     return ret.lower()
 
 python do_compile () {
-    import shutil
     with open(d.expand('${B}/os-release'), 'w') as f:
         for field in d.getVar('OS_RELEASE_FIELDS').split():
             value = d.getVar(field)
-- 
2.11.0


