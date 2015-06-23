Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9E22B74056
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 14:35:21 +0000 (UTC)
Received: by wgck11 with SMTP id k11so11546313wgc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 07:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8F/olIzcHt1HZZWPeu5rcg2UsdOxk0GF3YvVRWwM6qI=;
	b=WOqCsp8VZMdBfikQwbaQUKP0BW3izwIzJ+6lv+Ko6dyXUoQ4C84KLkGnFl/saY+X3h
	N+yxRG0jnTCgeGcu860Gv9lXEH713vpvUSc6+qnIKXTbB+ab2eh2JSgHBvjUwu/j/OP8
	ipHLk4y8oNAkILNQHDaaoxP/8Yh6hpQa5OqxvD7z8VrLsbv3qjVWOuM3BxBRU3LiX59Q
	S2jgRRqIRiyd1yyGZv/PvHsVINWGuNKoVrbUZF4fDORyzhu6d8tHbkNE/RIjCMvAXufE
	VZmqwe6X8V3+8s0ZjnatsupQXaNW658/0JMjWbqjfANJJiDTj+nURobhGIY+x8aUtrhC
	5Efg==
X-Gm-Message-State: ALoCoQk3YPvNXbaOq1paxvxwkUpkspKbpOLu2zb9ITzL0UDPTrIupAq8jZGpxlXoh8gkGBcoVOAN
X-Received: by 10.194.78.175 with SMTP id c15mr11208100wjx.136.1435070122565; 
	Tue, 23 Jun 2015 07:35:22 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id z9sm12982900wiv.9.2015.06.23.07.35.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Jun 2015 07:35:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 15:30:03 +0100
Message-Id: <1435069807-13557-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
References: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/6] neard: remove libexec hacks
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
X-List-Received-Date: Tue, 23 Jun 2015 14:35:24 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/neard/neard.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
index 4042a69..4ecfd69 100644
--- a/meta/recipes-connectivity/neard/neard.inc
+++ b/meta/recipes-connectivity/neard/neard.inc
@@ -39,7 +39,7 @@ do_install_append() {
 PACKAGES =+ "${PN}-tests"
 
 FILES_${PN}-tests = "${libdir}/${BPN}/*-test"
-FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
+FILES_${PN}-dbg += "${libexecdir}/nfc/.debug ${libdir}/${BPN}/*/.debug"
 
 RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
 
-- 
2.1.4


