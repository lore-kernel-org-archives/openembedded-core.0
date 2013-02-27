Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAi7Y-0003eD-4Q
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 15:36:57 +0100
Received: by mail-wi0-f172.google.com with SMTP id ez12so6315674wid.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:20:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=cJpOPvSMmqsh2Ns2VtQuHI0t+dhTsRdn2VZ5hhpkIUg=;
	b=SukfAQmmiQKXuBZ+aekCchi4Z2eG7eF9pO5TuXAKbfvfssj/7enRkwXjCxVj2TncFL
	V2AG6pWh7yInAWFn0whq1faAze+pwNqPpk3wmvf/Er0nMvPy1Ogz5s07X+gcrgb0YoW1
	tOcOIgvqlymTu/yPrJZ3NLCO4Gd2JxYmF34G7p7/HdUziAY2in1wpv21Se90YrnCHz58
	P067yWB8QSp+mY2lIzQ9qqFq9HyLRm5I59SVgSxXT946bQDq/abmcPK2ckfHsj3o5pJS
	qz3WMfJPoih9kJP7TYO/CltnGq21Qy+1ImhQFD/CTMXVoFywOJwiaRg/zERAdnn0cqv0
	ZUEw==
X-Received: by 10.194.157.42 with SMTP id wj10mr4372893wjb.12.1361974815724;
	Wed, 27 Feb 2013 06:20:15 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bs6sm9053829wib.4.2013.02.27.06.20.14
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 06:20:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 14:17:43 +0000
Message-Id: <46b8c51e64f47c1aa188ad9c2a91d8ed60aec636.1361974597.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
In-Reply-To: <cover.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmFC1LAlxhU7IbtWjm0um2W/ViJ2P0iHT7LIvtCX0Yo/t2Ug3B3gxLaa9iOUFsqzzMHrMQ7
Subject: [PATCH 4/7] systemd: remove unused cached configure variables
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
X-List-Received-Date: Wed, 27 Feb 2013 14:37:11 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 2232b60..7a11c8c 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -43,10 +43,6 @@ LDFLAGS_libc-uclibc_append = " -lrt"
 # This will disappear with systemd 197
 SYSTEMDDISTRO ?= "debian"
 
-CACHED_CONFIGUREVARS = "ac_cv_file__usr_share_pci_ids=no \
-                        ac_cv_file__usr_share_hwdata_pci_ids=no \
-                        ac_cv_file__usr_share_misc_pci_ids=yes"
-
 GTKDOC_DOCDIR = "${S}/docs/"
 
 PACKAGECONFIG ??= ""
-- 
1.7.10.4



