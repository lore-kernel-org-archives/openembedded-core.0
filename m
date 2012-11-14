Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TYR8z-000846-NC
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 01:47:54 +0100
Received: by mail-pb0-f47.google.com with SMTP id ro12so4980103pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 16:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=wjs+GWX8tc6OZT4V69cYJtM9a79yoD+V/71PIOpnSXQ=;
	b=GN3KWueCtVHZBwyc5nSK/RSLWN/TkplTBqpWk+KZYVoDlF0p/u2PK67RRTmh5Pn5Kj
	w9G+SDamkbkZKZTNSc9ImDt/0HG5u4EJS+HiN9hHvyJhyhvG0E70L73TlYrWMqyKpMXg
	cz2/1GFjKxK7dZydVVLqxNP/yZoyOLuIrW6lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=wjs+GWX8tc6OZT4V69cYJtM9a79yoD+V/71PIOpnSXQ=;
	b=lsRYfqYSQvB47bcnrfBybvr+ftEH+o6auwB2uj9HN4ucMsGvow+lR/XeVwOR8lHQqS
	t7xXAzNknw//by94uX6LO0/rxqk3KKKvsFQq4TUthPSpGt6YkrGfjbouFJnyo/0tgcRK
	EHNUTZDjRHO+QaVkWzIwmyxgZTw1GjDovxJZB8y9YsIXYVQHzdPppuZVLXCcf7La6Ixh
	6uD4Z7titnk9d/6k8UGkjichXJbgRqEx+wiF8MODx8+0sL2BzEmYKGY/MZKi7Xp8t33q
	kJeh8WekCw34twpFgbcNe4Ke6EN7hGzuoC11HO7C4nXNO8w/cDFsThOVeNHuGLWl707h
	MvJg==
Received: by 10.66.77.105 with SMTP id r9mr1788527paw.76.1352853238310;
	Tue, 13 Nov 2012 16:33:58 -0800 (PST)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id c7sm6899553pay.10.2012.11.13.16.33.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Nov 2012 16:33:57 -0800 (PST)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 16:33:08 -0800
Message-Id: <1352853188-3018-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1352853188-3018-1-git-send-email-sgw@linux.intel.com>
References: <1352853188-3018-1-git-send-email-sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmGW1po4w0GfNn/zzL1XDIL/MwPuZbNAVoQYpLnwRjMKtjtBQIxSLaVFRDnw/ULdBIeRW/0
Subject: [PATCH] pulseaudio: fix string test
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
X-List-Received-Date: Wed, 14 Nov 2012 00:47:54 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 3003eaa..2fe7918 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -53,7 +53,7 @@ do_install_append() {
 	install -d ${D}${sysconfdir}/default/volatiles
 	install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/default/volatiles/volatiles.04_pulse
 	
-	if [ "x${TARGET_PFPU}" == "xsoft" ] ; then 
+	if [ "x${TARGET_PFPU}" = "xsoft" ] ; then 
 	     sed -i -e s:\;\ resample-method\ =\ sinc-fastest:resample-method\ =\ trivial: ${D}${sysconfdir}/pulse/daemon.conf
 	fi
 }
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 1c2c9f7..a10b953 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r6"
+PR = "r7"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.9.5



