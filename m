Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id BC3DF7C675
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 16:13:50 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id e74so6468676wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 08:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=B1IhEaZPsS6ajPnOytdSPWjeDmeiZu3SgbnUe80WqE4=;
	b=UNoGCBYxIIcwbL/kH1bfyDDmC8AYUkTD+d4Q5StYmoprbP7fsXIuWg7eL5Wn0caxYN
	qtQxKy1nnFsaqRXwIHxQTb8v4TEUAANUsOT1P9yC5YLDNJInjw61hAlk6ZSYYr1+ui7a
	ep9BH/NwqidJMnF7RAxp7izpTVjiSrzBMut2LAkaOaQ5m7b9nhyVATDqylr0LtmEzG/4
	BI/gGnnL1t9NPRQo7/5LyX7SJW8oIFpyGmKmuV6kwT3NeXIwl9R7Pe6Y3wuwmXrf1K4R
	TrnZReKGU4IM8fjXrCb5zX3C2tEkCbJg/LH83MF+x/IR/XJXADlJKvWSuuOj5zM0kzOv
	e0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=B1IhEaZPsS6ajPnOytdSPWjeDmeiZu3SgbnUe80WqE4=;
	b=LJv7fBaxiM6wsDrWrw1woDIKKnnQ4If5fQS4iyZujrjhRxZwLP//OpcKaPIIWbwFbM
	7MD7V5sEHdegwvJSz8fD/OzuKx4XGA1M7EsnL26XqunyOGEv+5UrZk2x4twJ7g03R9NZ
	NaMqY3y9LOf5+8pyVyzCMUth/Yd+EOan4200dEZBjvJAmm2rp7+Tykh+RUd7SUji3+Vt
	lzHcp3jbvFuB2mtxuHwNQqbP+PJtvfh0xJidHzLNBAvN7IFz4CoImyPh0sF1Y4ozfUxK
	rcB6GsmK+5+EIa04zwNqke5U2Q7C8tT58V36EJxVisIEADy1QUy99r+HvAU3K1Rkp3Hz
	LC3A==
X-Gm-Message-State: APjAAAV/2+vRPC6VsC18Si5fa3wm7y0+dJ7wvjGg5q1EoaQ+EUBmF30x
	JdcldvM3nlKScVhC1I6BEMkgTsk+QeE=
X-Google-Smtp-Source: APXvYqztlPNGHlN5AV634cOZ5yQZwFIv8QJmzhwA4fjF7HZA/K4ILAQw9M/DVzkwF2ee4rD0haY/7A==
X-Received: by 2002:a1c:2283:: with SMTP id i125mr2844107wmi.24.1551888831212; 
	Wed, 06 Mar 2019 08:13:51 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id g3sm1065616wmk.32.2019.03.06.08.13.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 08:13:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 16:13:48 +0000
Message-Id: <20190306161348.24575-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] bitbake: add readlink to HOSTTOOLS
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
X-List-Received-Date: Wed, 06 Mar 2019 16:13:51 -0000

If systemd has EFI enabled it uses readlink.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f1540a0acf7..3d1434931d1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -485,7 +485,7 @@ HOSTTOOLS += " \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
     mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python2 \
-    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed seq sh sha256sum \
+    python2.7 python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
     uniq wc wget which xargs \
 "
-- 
2.11.0


