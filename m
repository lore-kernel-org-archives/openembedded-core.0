Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 72AD8785EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 23:38:11 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 136so8315316pgd.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 15:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NUgld4NL/4mbYbLoE07Ce7ti+ReFAYReP6Dkc/H+P74=;
	b=e8S/yzWtkMLNFTZDs3PJnUYjnaGOym2hkYhPCuyVYnpLGB/oQZRocIgpBBdcs0utHw
	MO9mMXpvME92psFlbd+C5NYSNKYugLSMCcMah2Tgrts3GeWRKXtAExGeeJAalVrlIO8g
	crt/bomi+4IEOSUFcJWzBMeJFHlAA/6fvNaWItPN4XhmeFyH8ohXhVnjSRvikl3B42uk
	MaEJFyKrWnpb7SzFluaUHXazx7bzi234T1HQNTSL+nRPq4bjrT6GAZqyxDSU4PJJjECT
	qK9IXXSdiJBYM3MCfB+svgX9hEzA6EZKWcvCl//A2FjiKXPcbJ6eYMpAaswAGassavJJ
	OKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NUgld4NL/4mbYbLoE07Ce7ti+ReFAYReP6Dkc/H+P74=;
	b=tZBdgLovxoDnPk5k37auf4q7uHdw5RTErF46yMGwh6I2q2oIuG0cAt9LjufjPmiJZW
	MMwVBJrllSR9Hl2JwmK/7VYHh6e7AAThKPQWx2GrYs6/0aDXc0gZ6FhqEL+iASlASX4c
	oiOPKdS8igGUexaaI9+wQnw8Tb3lpBT5IPn8NHiwz0JGzZlMGY+eBwTGYm0YPFsjKdtd
	JmUB74Yn07IK+COa+jkGgJhjBZV+0KagPZg5yoovSdd6fRyVy5+8sGf2VUdY4IofrHrJ
	4FyYV4Ec7JKqCumPwXrnVH0YECQM8DmRxCGjyZrKVlk/XHuBiuEQZmvKOR4dtHSSEAgk
	t8kA==
X-Gm-Message-State: AKwxytcUNz1v6dVpZ8hqugY0uUbaMHOMZR3hOTUFnQX9g7qJ1lFX5+iv
	R2pDAgVcOxAWKFw6pHG1GRUO7A==
X-Google-Smtp-Source: AH8x224taTAZ8mNub+Ks+6ZX6ni6vY3Da811ZZQHSP9dYUosCzzAO9dFf2v30sFGhUt7Qha9uWWdkw==
X-Received: by 10.99.65.65 with SMTP id o62mr4122586pga.392.1516664293066;
	Mon, 22 Jan 2018 15:38:13 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id x4sm1941654pfb.13.2018.01.22.15.38.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Jan 2018 15:38:12 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2018 15:38:06 -0800
Message-Id: <1516664286-19332-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ruby: fix typo in gmp PACKAGECONFIG option
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
X-List-Received-Date: Mon, 22 Jan 2018 23:38:12 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/ruby/ruby_2.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby_2.4.2.bb b/meta/recipes-devtools/ruby/ruby_2.4.2.bb
index b471154..239d775 100644
--- a/meta/recipes-devtools/ruby/ruby_2.4.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.4.2.bb
@@ -20,7 +20,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
 PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
-PACKAGECONFIG[gpm] = "--with-gmp=yes, --with-gmp=no, gmp"
+PACKAGECONFIG[gmp] = "--with-gmp=yes, --with-gmp=no, gmp"
 PACKAGECONFIG[ipv6] = ",--enable-wide-getaddrinfo,"
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
-- 
1.9.1


