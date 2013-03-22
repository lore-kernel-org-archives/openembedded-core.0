Received: from mail-we0-f182.google.com ([74.125.82.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Et-0007iY-SK
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 18:59:29 +0100
Received: by mail-we0-f182.google.com with SMTP id k14so625761wer.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=BPhTDuj2b0pLsBkzje6rzeUIIH3OMKrQz5kJKrVtvLY=;
	b=mAK5tb9R7T2ikFqiCNcrXT20A+dbaKP3UfcGGBYd+rBpIEKNIYmIfRI0vLoRfVEbHj
	AnZTXfqu8kykpb+1z8qMhQnGMfgqmbsObD5YEH9FieFaljyw6GieKWIjZV6gND1uaMyv
	BrgDg4AbUkTW48eekD9C2NM4i9GYnNrpCh3DGPB1PHEXM57wEmodK6BzOLXMgW0bdMyL
	uCBS3t9n7ovNf2KZxaQNZQFuneJp7UCcXThbjpRG0Fk1RM8gqTKF+u3rSAqM4OlK1PSe
	3EF+ixglsxTCWtlVtRsTcffdqfKrycT2fgrCOtoIERh3yUzCOOLO5w79LJFbxNgtO8RI
	CMFA==
X-Received: by 10.194.237.129 with SMTP id vc1mr4781211wjc.20.1363974118055;
	Fri, 22 Mar 2013 10:41:58 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.56
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:41 +0000
Message-Id: <e4580eb21f5a7679b7fb0970ac11c0de0848e0cd.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlMEAzKwC/+a14YsB6cRQuaLQQOp3g809WFartdVeHRxy6wwkXh1idbqCPq+2B1ebU8N7ES
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 21/22] systemd-compat-units: disable dbus-1
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:39 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 19a1ea1..9b4a8a4 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -34,6 +34,7 @@ SYSTEMD_DISABLED_SYSV_SERVICES = " \
   hwclock \
   networking \
   syslog.busybox \
+  dbus-1 \
 "
 
 pkg_postinst_${PN} () {
-- 
1.7.10.4



