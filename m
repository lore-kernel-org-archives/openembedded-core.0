Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E689A750D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 03:15:03 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q22-v6so353757pff.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 20:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=az2xi8zybTRxIfJkMHzzR2KMjtANbZThVsbpeAsX3cw=;
	b=NvWxl2rP27r1AgFF78Q5dpiaZF5/xITnpiwlCm76NdiWlgbQUTwHHCZASns8Kz/uSn
	ZOq0mqZsZlYgEv4XKV0jK+Q51WvtZHf0mWV9w6tR3rqwRbnEUbiDUu8TMLsHy7bH3USk
	i4dYzM664K+Kia4hbfQoGtl1SFKzRSCmMsw/8/qz00V8WQru0HgPKnV+4X+LkcrDee3U
	T15mzspNAWLMEsP5Tz9FJhBYmWU959w1V7xLusyhQsR4EtBZdo70V0McSMWv0DOW+Cb8
	dNMYPA4ghhuMFUhPho16XNPUd8cRgT+3AowUT06YegP6u7T+0dAvX0YJCB5unZxpFjpZ
	TQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=az2xi8zybTRxIfJkMHzzR2KMjtANbZThVsbpeAsX3cw=;
	b=XM3IYlZRm+F082TQTVIN+NnDVPn3h+9zbiVRhHcXWYApWzc5o0qWGNa/Cc9h/1aMxS
	NOEFivpVz956cCpWKfE13TgfAa+A8AUJs3OUcH5IM+kOtwXBAPRi+kq5KIwHCrkWrYpn
	ony1np1hULoHouDHVMja/qbJYcZFp3qD1/tZlII8WvQJxSKWkQkPMfSeo6LxJZ6N+zVi
	KTWdhaEZW19DhFsemu2lWI/aT8fuWG66LK+wHwEl2sTEDWVy1OZ4fAhAP66z3jqs4OBa
	8Mn25t+9QJai/jUStp9Em6TQY3NfCQw0zc6VlJpfLL95Sky+j0ubS6RZ0IgH8SkaIoIc
	8VMQ==
X-Gm-Message-State: ALQs6tC3OI9Or7qXRZhdy3A/VAaii7/mU85O2i3bE19fo3m6ANFtATfn
	BX2RpN42BbXMSZujqrQAoJYqcg==
X-Google-Smtp-Source: AB8JxZrXON8H/w0FO1UFy0W/DQL7jh7Sr4f0Uwwvmr3rgwhuEn31WSUiGpf3CBmMBoQB6SdRYHCzOQ==
X-Received: by 10.98.171.16 with SMTP id p16mr45669450pff.211.1525922104730;
	Wed, 09 May 2018 20:15:04 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	203sm55271472pfz.131.2018.05.09.20.15.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 20:15:04 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 20:14:56 -0700
Message-Id: <1525922097-15292-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
References: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] native.bbclass: drop _virtclass-native and _virtclass-nativesdk overrides
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
X-List-Received-Date: Thu, 10 May 2018 03:15:04 -0000

The _virtclass-XXX over-rides are problematic in that they are higher
priority than _forcevariable, which is documented as being the
highest priority over-ride.

Since they are now obsolete (replaced by _class-native and
_class-nativesdk) drop them entirely rather than try to fix their
priority.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/native.bbclass    | 2 --
 meta/classes/nativesdk.bbclass | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 7f2df17..ad7e98a 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -154,8 +154,6 @@ python native_virtclass_handler () {
                 newdeps.append(dep)
         d.setVar(varname, " ".join(newdeps))
 
-    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-native")
-
     map_dependencies("DEPENDS", e.data)
     for pkg in [e.data.getVar("PN"), "", "${PN}"]:
         map_dependencies("RDEPENDS", e.data, pkg)
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 69fb45c8..ab566e9 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -78,7 +78,6 @@ python nativesdk_virtclass_handler () {
 
     e.data.setVar("MLPREFIX", "nativesdk-")
     e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN").replace("-nativesdk", "").replace("nativesdk-", ""))
-    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-nativesdk")
 }
 
 python () {
-- 
1.9.1


