Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 27E4B6D2C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:53:04 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id q58so6959844wes.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 10:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Vcb6C5CY2q1XizJHvzKCQUh1ppXbXt1GLRIZHAoZpPo=;
	b=DDQY2yrVF5uWcUxiXoHPgs7bNCq26YoV1JNGRGTi31l72iJG9mns3kdTzP74JhYpPj
	vJG/kBTcdjFXXIjm9TJ0y45aIJq+61hbt9hWZ2mlgUo+dNC7WMnQH3WYgPZiFAIlhZ/L
	NQJNH3M+7TVuaRBBXMFwiZCXCggfM/zBxLo2EaxbLzQJRWv3vgkBaIuY3wQHs2yQ+W1S
	/ZCw+7Nb4W9ZcV/qQC0x6fw2/eWsvTQv/2o291Lu7HKK+y93+mGSH++3fj0+J1RV5Flf
	R87ogUh6V2OXBWhB9yi17UWTc2cE0l613bpEfg7YLDW0SYG0e73PoFK/uUNwJFHnrora
	8Frg==
X-Gm-Message-State: ALoCoQnEws3sShzgMtTmwow5wEmgjsAMaD3eQkE1p9vjUJp/A0Xd3BThIyULWIpPBo2kRnWHrsBl
X-Received: by 10.194.104.42 with SMTP id gb10mr19579843wjb.16.1382982785567; 
	Mon, 28 Oct 2013 10:53:05 -0700 (PDT)
Received: from flashheart.burtonini.com (188.29.164.220.threembb.co.uk.
	[188.29.164.220])
	by mx.google.com with ESMTPSA id ma3sm893790wic.1.2013.10.28.10.53.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 10:53:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 17:53:00 +0000
Message-Id: <1382982780-1242-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] gnome: set UNKNOWN_CONFIGURE_WHITELIST
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
X-List-Received-Date: Mon, 28 Oct 2013 17:53:04 -0000

This class disable introspection support using --enable-introspection=no but not
all GNOME modules support introspection.

This can cause unknown-configure-options QA warnings, so clarify the option by
using --disable-introspection and add it to the sanity test whitelist.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gnome.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gnome.bbclass b/meta/classes/gnome.bbclass
index a19dd17..0de22dd 100644
--- a/meta/classes/gnome.bbclass
+++ b/meta/classes/gnome.bbclass
@@ -1,3 +1,5 @@
 inherit gnomebase gtk-icon-cache gconf mime
 
-EXTRA_OECONF += "--enable-introspection=no"
+EXTRA_OECONF += "--disable-introspection"
+
+UNKNOWN_CONFIGURE_WHITELIST += "--disable-introspection"
-- 
1.7.10.4


