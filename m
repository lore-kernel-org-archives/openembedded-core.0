Received: from mail-wg0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAi7V-0003e9-EX
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 15:36:57 +0100
Received: by mail-wg0-f47.google.com with SMTP id dr13so510361wgb.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:20:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=y9U527oKRKPNDCZSJBwuc6kGYeGrniWTaI+pWGBfQNw=;
	b=NtFM+hb0CNca8fUFcjjnIXRoUrUajtmxwLIPpRwFLigqw50zw6HHdY9sS8bOaee/Xt
	OJa5QgUT+qtBirYXUWER6U4hL31bSZDRMiULCzFvTDHNrcdvW15Emf/gVp1+BTmYbT0t
	1FX88EZbFcfMJN23kBCpwQxh0eAjZMEeVf1pyC2JJxw4qddaNAbiLRgvmSC/G0G8gfRS
	UJxmqcxPvWt6nyvnm7WHg8JWwzSNGReP3RExc1Nu6KFm4M7DkCbofvKSN+1UuR/GR9Rl
	vndceIJOkl/cerupKK2lUczZFvAalXvo0WncdFYiMdinsY/k0OKqZEDHNZNgmtY1u19V
	Yr3Q==
X-Received: by 10.180.93.168 with SMTP id cv8mr4236684wib.5.1361974812930;
	Wed, 27 Feb 2013 06:20:12 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bs6sm9053829wib.4.2013.02.27.06.20.11
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 06:20:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 14:17:41 +0000
Message-Id: <a4ec8dc8fcdaa379c4abe77debb003ad49f1115d.1361974597.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
In-Reply-To: <cover.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkmInOCE3aFaSomC1Mx++e4HQSH8OGKw//yVd05i/ea5V7gP9FQd5LlX33g7T9ONq1YY+g9
Subject: [PATCH 2/7] systemd: don't recommend IPv6 kernel module
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
X-List-Received-Date: Wed, 27 Feb 2013 14:37:10 -0000
X-List-Received-Date: Wed, 27 Feb 2013 14:37:10 -0000

systemd doesn't need ipv6 support directly, so don't pull it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 880fbcd..c871bb5 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -182,7 +182,7 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
                       util-linux-swaponoff \
                       util-linux-fsck e2fsprogs-e2fsck \
                       util-linux-mount util-linux-umount \
-                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
+                      kernel-module-autofs4 kernel-module-unix \
 "
 
 PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
-- 
1.7.10.4



