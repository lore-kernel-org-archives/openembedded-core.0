Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6jOK-00077E-Fy
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 16:37:12 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 07:24:56 -0700
Received: by weyr6 with SMTP id r6so351397wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 07:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=xMZKwcOJ8WSWn+TKgLtDXgnCE87HWx+QKOvt+xmgYWk=;
	b=cu3djmO9m5LQwIK9WLBUZSqVqHtbZCI0a3StgoaAXIQcSgdU/sCJ/nuRb06+SOWmK7
	YDN1vuKOkMIQ5SsUMMsYTCpyZ1bwm92W1/RB6XmzpjScffHbRQAFSSl/nOEVrN/v11AD
	jIzvW53RF4jGPGXJ7uUgl2AtvffA1dvYMVViiOguEdsIUAemLiioK6ASEpZyq9Hd0Aii
	mq1rD5nIhJu2F2luJonfFGKHvFGgcwF0tFL7iZQfjCJ3AeCJB1RhR32Opv0V4XIdK7un
	ZtJ4HmKFPnHwbXOLn9RO0mpXrT4HeDOdtvMITS1YlM7sJp4c/2ZeGGaBylOgEBA65cIm
	TNGw==
Received: by 10.216.133.130 with SMTP id q2mr1096321wei.131.1346250294675;
	Wed, 29 Aug 2012 07:24:54 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eu4sm10501531wib.2.2012.08.29.07.24.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 07:24:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2012 15:24:13 +0100
Message-Id: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1346250187.git.ross.burton@intel.com>
References: <cover.1346250187.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQknpVFk7jV+5UX6LXcDHxWkxSrI6Sl0s+VoZYFnQu31qMJjYUiWXOZnI7D1AI+YMGaN0dac
Subject: [PATCH 1/2] tzdata: this package isn't architecture specific
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
X-List-Received-Date: Wed, 29 Aug 2012 14:37:12 -0000

The data files are compiled to a binary but architecture-independent format, so
this package can be allarch.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/tzdata/tzdata_2012d.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tzdata/tzdata_2012d.bb b/meta/recipes-extended/tzdata/tzdata_2012d.bb
index 605bf24..31e1266 100644
--- a/meta/recipes-extended/tzdata/tzdata_2012d.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2012d.bb
@@ -5,7 +5,9 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
 DEPENDS = "tzcode-native"
 
-PR = "r0"
+PR = "r1"
+
+inherit allarch
 
 RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarctica \
              timezone-arctic timezone-asia timezone-atlantic \
-- 
1.7.10



