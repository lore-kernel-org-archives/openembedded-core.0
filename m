Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id E8B3465CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 20:10:10 +0000 (UTC)
Received: by wijp15 with SMTP id p15so109608060wij.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 13:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Oqi8V8BEp1vD2Ggc5fO1B4dIEYe5XV8+eRamqNZ+p7M=;
	b=dMQBTf0+XtdQo+Rqto34G4GMf7XqeJr+O3HWb4R0KCiHAcdbarXFvTCd1ytTIIH9JB
	7dI1puuXCK1L4HYDE1R1bli2ozVoqWW/agMS4tjFME2KcEgkVo68LdyPzm7tgLdKYGkw
	l+uDMxklZ32JkmynGoygNuzspHbfzJT03T87TjfEhbJTb+uVh/RHW9yKDOaxpXObG9Dr
	f2B76MB7+Gv2mKyZZic4xFWg8w0XQ1QVOiG2F8LRGnGSeq6YmWOthvRQ1xVOugWH2VUN
	PDSWwlmZUIxKgM6iyIsCQLnmD3H4W9JMMIW7+XvbjiIj1sEAMI9diP9I1b+HnH6Z/zhI
	B9rg==
X-Gm-Message-State: ALoCoQkU3ThPvtFpFjHR3IVRcaC18+dRDqJOd28CC0U0p6p3nvbGp0hFZlf9XE84248Sf3h/PM2F
X-Received: by 10.194.58.199 with SMTP id t7mr16729861wjq.45.1439928610529;
	Tue, 18 Aug 2015 13:10:10 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v8sm27894057wjr.15.2015.08.18.13.10.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Aug 2015 13:10:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Aug 2015 21:03:54 +0100
Message-Id: <1439928234-28554-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] json-glib: enable native builds
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
X-List-Received-Date: Tue, 18 Aug 2015 20:10:13 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/json-glib/json-glib_1.0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb b/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
index 4d2b613..7ae1fee 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.0.4.bb
@@ -18,3 +18,5 @@ SRC_URI[archive.sha256sum] = "80f3593cb6bd13f1465828e46a9f740e2e9bd3cd2257889442
 inherit gnome gettext lib_package
 
 EXTRA_OECONF = "--disable-introspection"
+
+BBCLASSEXTEND = "native"
-- 
2.1.4


