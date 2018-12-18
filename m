Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5294D7BF29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 12:03:39 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m22so2527211wml.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 04:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y01JsgvtHdUmtIoi++ULMRfoJ6HJ1/AbUg8NiuDJoNE=;
	b=Qa0wyPqqW0QBeqwg/xB5KuxcLKhrhuhg0OVlz9C2gvdMvwOY0APRldvXvG2nZsADIn
	9F0r501oyniOg4URl+zQuMmuIq/WwAQRCkLZcAxjnE6ipCTn2hqf1AFPqP+Q/fj+Nn8R
	PuPh/juzyi7fr4wUC0+2jGZWeDcw06/OSkgqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=y01JsgvtHdUmtIoi++ULMRfoJ6HJ1/AbUg8NiuDJoNE=;
	b=kDT/MFS8AGMWi0NK/BYluqo6bHSKT3xhPBv3hQxzspJgfTguZcHDvPxaE/vXvgkjam
	c8z20B1mu+fx8m4Vogu0Po4372Z/190zO6HUmmmnVnmfNVcrAk12BVHh3+7//PZSMPt2
	j9UPZ+C3OlYnTLqWjcWvaFaS0RAv1pzjgVRk1auUUM/7L+5624mHqSCxE7uFwk8XMqBx
	iwDi2dbHwv4syqO43ZhA3PVzpP+Hrn8piD7uJ0j9ZQva57ha+RrSiObCt3bF+imbL2e4
	3/JEfckwsakGAbbOVzRtxd9fdgQCXDusLnkXQeG2Bv9RQbwAs/qFy2kECFThv90o4kJ+
	J99g==
X-Gm-Message-State: AA+aEWZIfbXncvUEIQY0H6TJtdnLDvgAubGnC2+TPgyWmhy8lqWfw/A7
	nGIESdHCEquzHxphT9BnQDwDfkOM7nO1ng==
X-Google-Smtp-Source: AFSGD/W1mk3iYBQ0+7Zu2rsmihuGoU/HopvGHryl8fF95TBNikp4hpMpfmQaTRWdc28PHyd6vGjs/A==
X-Received: by 2002:a1c:4681:: with SMTP id t123mr2947058wma.24.1545134619385; 
	Tue, 18 Dec 2018 04:03:39 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	10sm1684156wmy.40.2018.12.18.04.03.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 04:03:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 12:03:32 +0000
Message-Id: <20181218120337.25019-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 1/6] defaultsetup: Include maintainers.inc by default
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
X-List-Received-Date: Tue, 18 Dec 2018 12:03:39 -0000
Content-Transfer-Encoding: 8bit

There is little harm in including this file rather than having a
rather obscure and soon to be obsolete bbclass adding this information.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/distrodata.bbclass    | 1 -
 meta/conf/distro/defaultsetup.conf | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 59ee8cea660..c0d698febbd 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -1,6 +1,5 @@
 include conf/distro/include/upstream_tracking.inc
 include conf/distro/include/distro_alias.inc
-include conf/distro/include/maintainers.inc
 
 addhandler distro_eventhandler
 distro_eventhandler[eventmask] = "bb.event.BuildStarted"
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index ca2f9178d2e..20e61232e97 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -2,6 +2,7 @@ include conf/distro/include/default-providers.inc
 include conf/distro/include/default-versions.inc
 include conf/distro/include/default-distrovars.inc
 include conf/distro/include/world-broken.inc
+include conf/distro/include/maintainers.inc
 
 TCMODE ?= "default"
 require conf/distro/include/tcmode-${TCMODE}.inc
-- 
2.19.1


