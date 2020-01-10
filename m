Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB7B7FD69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 17:29:45 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id k25so1300091pgt.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 09:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5FJG1boMyGTjfcMWA7jez9ns8uxsKKHiZW6Gu9eHaJM=;
	b=BMeqZk/x0/91FE7BZembFLsgJYMsGkA/42dG/GLKrsQwmwbNGLuzRllkldIFngOyLs
	pYiVcaSHB1Am8Zz9efU9p4KVLQd5q1PggVhF2ngR6EmvsCp0yriquJN4AROqMwggjKhJ
	HXh9BQwG+ZMxiOh0AU9EGJ6M8bfWortx56p1cN5szx4gaJTLODeH8rE3EtDWfIJGrWri
	RJAO5F2E3W7uc4vGFmByTraR3CxLFf+2CaJFjZeDbSrdw0l0eRTpwAZedv5tDmn44xL1
	NXSCW6yc2lRK61219jmZlIviQn/Q30LKqCaieQ/QIxl95v8U63HirsA2eEslxjmzryMl
	cfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5FJG1boMyGTjfcMWA7jez9ns8uxsKKHiZW6Gu9eHaJM=;
	b=Uzg7ydIzpLMhy7wQqvQ4IAPBB2xhvIPq3CzEINzhGl3brShgr0X5+wYYd6JaQbPWt2
	6DjwWMlnRBtlSQVD6t86Kw+DWUY14M4QRHjhBxEoX6ivvq9Zd+J6SmaCz/gWmbRTBzgr
	rgJMxl8mje3h0DETOPtcTM1PoDmIn8S5O3cvlM5zIuQ9Ec4AnTOE/jTEYpSJOJlfSET5
	HdG2i6M42Fm9hU3BNKfgMOWnih7il3TLA+ijTs/Hwbi870W0GA2l61Ia4IP17gm3dZq0
	IWs/98xHr0jLsBY1JIu3s90j3xuCKvd10y0H9E0fGC5XnVHnFZNP8kys0XPCcPXvBAne
	Kswg==
X-Gm-Message-State: APjAAAWISBByUiQfzqVOkQ+XhyGgHbtz8EPPKf2hzHGC2mDxk1LgkkbJ
	TWfHJLdr6PZV3QToGJHX89OHt9URae8=
X-Google-Smtp-Source: APXvYqzhEu2Pcn+SGF77EtGo/mm2k/fL56NYQ8HW99B6ciwo3cP1HVNN9GnC9rUV4U7VqLXXBk+XkA==
X-Received: by 2002:aa7:9633:: with SMTP id r19mr5523495pfg.90.1578677386871; 
	Fri, 10 Jan 2020 09:29:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6f71])
	by smtp.gmail.com with ESMTPSA id 2sm3506119pjh.19.2020.01.10.09.29.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 09:29:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 09:29:38 -0800
Message-Id: <20200110172938.3060002-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200110172938.3060002-1-raj.khem@gmail.com>
References: <20200110172938.3060002-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] busybox: Update inittab
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
X-List-Received-Date: Fri, 10 Jan 2020 17:29:46 -0000
Content-Transfer-Encoding: 8bit

Add stdin/stdout/stderr symlinks in case when not using hotplug
Disable ctrl+alt+del, not used much
Mount swap if defined

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/files/inittab | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/busybox/files/inittab b/meta/recipes-core/busybox/files/inittab
index 2bc831c7c6..e8ec2ab68e 100644
--- a/meta/recipes-core/busybox/files/inittab
+++ b/meta/recipes-core/busybox/files/inittab
@@ -8,11 +8,17 @@
 ::sysinit:/bin/mkdir -p /dev/pts
 ::sysinit:/bin/mount -t devpts devpts /dev/pts
 ::sysinit:/bin/mount -a
-
+::sysinit:/sbin/swapon -a
+null::sysinit:/bin/ln -sf /proc/self/fd /dev/fd
+null::sysinit:/bin/ln -sf /proc/self/fd/0 /dev/stdin
+null::sysinit:/bin/ln -sf /proc/self/fd/1 /dev/stdout
+null::sysinit:/bin/ln -sf /proc/self/fd/2 /dev/stderr
+# set hostname
+null::sysinit:/bin/busybox hostname -F /etc/hostname
 ::sysinit:/etc/init.d/rcS
 
 # Stuff to do before rebooting
-::ctrlaltdel:/sbin/reboot
+#::ctrlaltdel:/sbin/reboot
 ::shutdown:/etc/init.d/rcK
 ::shutdown:/sbin/swapoff -a
 ::shutdown:/bin/umount -a -r
@@ -20,5 +26,3 @@
 # Stuff to do when restarting the init process
 ::restart:/sbin/init
 
-# set hostname
-null::sysinit:/bin/busybox hostname -F /etc/hostname
-- 
2.24.1


