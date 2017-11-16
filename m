Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 72E47786E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 09:16:40 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id 9so8030176wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 01:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uGYYMFkNck6qF3/2SMkt9GWjCnl8gv4fUB7Ghw2teqY=;
	b=fbtW1aVMye0uxUekXsMPviBxEoVA/pfEOf77Whl7Luw+eO94gbCTQs6gMAzPU9xGRf
	fj1GK77kyPG/diWWgoakSveZpd6qWnp0vjBftOZdCe4yTyXZGhzoEiHdD2Z2BnrJH1CI
	ULkrgXCNtWxRo9u2z4K4n/qbIlix9zx9DwCbYu8ctQuYykeZl0+Uq1t7IVK7h75HFafW
	jC24JT4HWLf0MzHJQq88bg8DhyPhd8jiwYyzooFAmBwK7K4IrggQCglRIxgR/1qNxUP1
	WtexebrsfC0dsYmKdv4210nOfCACDSVuhgSC85ec4OYd33+RbDcfMjXkZ17yOnK5Eu7q
	6dkg==
X-Gm-Message-State: AJaThX4RyLl+hNTyvMDK12aDH51yNL/wCJicQ0umirPI+1aAdKZuKJzi
	v/9ItlLWsgqsiMyX02hGkLLfCpev
X-Google-Smtp-Source: AGs4zMZLmcWpe5CWolmhYr8xZmovav2xY7PpNLdJrDzxGyM4uBarkONp70MA3suXjimfPKdbkvxEJw==
X-Received: by 10.80.245.172 with SMTP id u41mr1740819edm.195.1510823800975;
	Thu, 16 Nov 2017 01:16:40 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id k11sm765126eda.18.2017.11.16.01.16.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Nov 2017 01:16:40 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 09:16:39 +0000
Message-Id: <20171116091639.16549-1-git@andred.net>
X-Mailer: git-send-email 2.15.0.rc1
MIME-Version: 1.0
Subject: [PATCH] bitbake.conf: add 'xz' to HOSTTOOLS
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
X-List-Received-Date: Thu, 16 Nov 2017 09:16:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Files in SRC_URI that are xz compressed can not be
unpacked without this, as we'd have no decompressor
available.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9696273acc..dfc4de56a6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -480,7 +480,7 @@ HOSTTOOLS += " \
     mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python python2 \
     python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
-    uniq wc wget which xargs \
+    uniq wc wget which xargs xz \
 "
 
 # Tools needed to run testimage runtime image testing
-- 
2.15.0.rc1


