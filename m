Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXOL-00079Q-EF
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:35 +0100
Received: by mail-we0-f172.google.com with SMTP id r3so2675551wey.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=OoRNB7fav6/sf4fOvX8wLFZ0mK7/GBm2ypsreIxORoA=;
	b=fxRjbJpvRE84BWN7ZU+UNjgy6efv289+86IYiEf7879hzQD9H2k/yqR4maa9/21qFC
	FAPSydGfj8poXJ5InSEAt09FHT8JNQOZFL3Ud/Ansi6ouwcGrnj+hf5PwhdFJsIOz4L9
	6shhgPwQGfoC8DHF4mAedhsHjAhMkvGgFaTABRn/lyH9687XmqmsW5J4Y7vmDkS2lCAj
	Tgi3+uSq4f6SIrXY2qiLS0VgGN5Y5WS9fdcZwauSQWfxjt4+Ka1HosTtlzK1ZmGFiDFx
	B7fPTRs53asCgHPcQ+mfWv+sx75xmz5kPNCg3y7UY/7M4pu7IjH+FDmMNT1HpckCA964
	fLow==
X-Received: by 10.180.108.3 with SMTP id hg3mr4454780wib.33.1364316813848;
	Tue, 26 Mar 2013 09:53:33 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.32
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:21 +0000
Message-Id: <45db3edec5022b5f99939bf192b7b8fb1d970052.1364316412.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkxPh5UromqEATTqAQwsjPVPGfSe8bubumPTZEGRfGHOMkXxWACH5WD2xnjXBW3MoXqYACO
Subject: [PATCH 23/24] busybox: order and group initscript variables logically
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
X-List-Received-Date: Tue, 26 Mar 2013 17:10:42 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/busybox/busybox.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index e936e59..655cb3c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -27,10 +27,10 @@ FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
 INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
 
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
-INITSCRIPT_NAME_${PN}-syslog = "syslog"
-INITSCRIPT_NAME_${PN}-mdev = "mdev"
 INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
+INITSCRIPT_NAME_${PN}-mdev = "mdev"
 INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."
+INITSCRIPT_NAME_${PN}-syslog = "syslog"
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
 
 SYSTEMD_PACKAGES = "${PN}-syslog"
-- 
1.7.10.4



