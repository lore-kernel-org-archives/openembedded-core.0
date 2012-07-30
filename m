Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Svp6z-0007uc-H9
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 14:30:13 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 30 Jul 2012 05:18:36 -0700
Received: by wibhr14 with SMTP id hr14so1327827wib.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 05:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=UVg/JU+6jTeXQR/ZugxF8qMC7iylnf5qdTF0/1BJCX8=;
	b=pUge6Xx3U/qh0VE/+ykk94RS3GfY8NG8dc3ISE+6Boqg5SLvTX64QsDPegsR9K+ysc
	PF9d2zom6rjdjFugu3psjyIPnBLI+o4NrNba6Fr8mF6w4WT+NYYc4TjxDPD/jOu8WpNZ
	azTlkVrSyTYitfgtcSmJ4m9JW8kOJB/a0W3UqnHg+EPqTHapztCdQdHuMWeNx2/o0Yg8
	oc0bFojoYiSGuPJ9q9wZ/hYs1wmBxO/aRwFm+L3MLiymyK2Z+/AiO2lnftTrr3bamby8
	TAN6+tyqixoEJ1Z2wFApMvwmSDV4Yf0KOmFg9SZLyG2CkB8RLWPgcWck37ROnsPlmDbH
	UEEA==
Received: by 10.180.103.4 with SMTP id fs4mr26105929wib.16.1343650714347;
	Mon, 30 Jul 2012 05:18:34 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id o2sm23885626wiz.11.2012.07.30.05.18.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 05:18:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2012 13:18:07 +0100
Message-Id: <1343650687-2307-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1343650687-2307-1-git-send-email-ross.burton@intel.com>
References: <1343650687-2307-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl/8UsS0FNIyVoyoyiGoX/zT5+gVxZy3NINKmLi1t2gZhLh5UcCNkm4IZc8JJN3e0MrnPwU
Subject: [PATCH 2/2] buildhistory: reduce the numeric delta to 10%
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2012 12:30:13 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index d0e0808..0a50432 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -23,7 +23,7 @@ numeric_fields = ['PKGSIZE', 'IMAGESIZE']
 # Fields to monitor
 monitor_fields = ['RDEPENDS', 'RRECOMMENDS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE']
 # Percentage change to alert for numeric fields
-monitor_numeric_threshold = 20
+monitor_numeric_threshold = 10
 # Image files to monitor (note that image-info.txt is handled separately)
 img_monitor_files = ['installed-package-names.txt', 'files-in-image.txt']
 # Related context fields for reporting (note: PE, PV & PR are always reported for monitored package fields)
-- 
1.7.10



