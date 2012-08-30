Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1T7AvQ-0000DG-Vk
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 22:01:13 +0200
Received: by pbcwy7 with SMTP id wy7so3768499pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 12:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=V/4Oh8NlixcewTVeTUdv+8Zs5kNTXbDhfY+5nwRpzRo=;
	b=I8ThwTUNlqkn+SVKRsgxZRbPElBF+o0qb3lo/L8swcHOzSzziPsXBVetWZVjgcGFy0
	i9LUVHbI64zSSkHKKlfbTSJrJCFRoSOUfDTVJI1vuyJeujvGySGkXeWSXjekUmDC2REv
	bIrqTbUFTtTJ+e9n3NgavtVhLWI0jaWTmq5uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=V/4Oh8NlixcewTVeTUdv+8Zs5kNTXbDhfY+5nwRpzRo=;
	b=Wd3qMdS0xRFBNE9tZbFeScXdQgSBVq6WpGK5zQt/qN6moU2YdaavDiKyOXEW2SVliC
	T1uFHA3R+BQe9BkxhMogpPJYoIRL4049UAvNWHtPDDqCJsc7VJmn0NPDlctqzK8gYP+P
	MiEu2+tY8QuPL/nOYeNelk3roCTakrSFPagRnMUXpa34DiGC492umgtaX84SZsqvqok7
	hZRf7hOspADDQi/bHcqnFEOexlwMtVfV7DnwckCIH4/4ZXO86hNetvx0sMgghF6mV7eJ
	4JTKz5cwd7Czz9+96Tq935xuVU6A4OS91sJwNdQprhoHHgJn8K6aPpEemlFG985+DNzg
	HGCg==
Received: by 10.68.222.170 with SMTP id qn10mr12914182pbc.114.1346356136510;
	Thu, 30 Aug 2012 12:48:56 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id pf10sm2062757pbc.56.2012.08.30.12.48.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 12:48:55 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2012 12:48:10 -0700
Message-Id: <1346356090-13811-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQloqpmArDDIQK49kGhBUTaHoCWaYRmsk9F5/UbNBlIWSXmH4kE1rdiL2OX96YnJl6+JvwhH
Subject: [PATCH] poky-tiny: Enable x86-64 to build eglibc correctly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 20:01:13 -0000

The libc-libm-big option allows eglibc to correctly configure
itself to include the correct math functions for 64bit operations

[YOCTO #2943]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta-yocto/conf/distro/poky-tiny.conf |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
index 8ae1d85..bfb4432 100644
--- a/meta-yocto/conf/distro/poky-tiny.conf
+++ b/meta-yocto/conf/distro/poky-tiny.conf
@@ -63,6 +63,7 @@ ASSUME_PROVIDED += "pkgconfig$"
 # Reconfigure eglibc for a smaller installation
 # Comment out any of the lines below to disable them in the build
 DISTRO_FEATURES_LIBC_TINY = "libc-libm libc-crypt"
+DISTRO_FEATURES_LIBC_TINY_append_x86-64 = " libc-libm-big"
 
 # Required for "who"
 DISTRO_FEATURES_LIBC_MINIMAL = "libc-utmp libc-getlogin"
-- 
1.7.9.5



