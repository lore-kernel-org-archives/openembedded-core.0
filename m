Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1GWk-0001F6-It
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 14:19:35 +0100
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 05:02:28 -0800
Received: by mail-lb0-f197.google.com with SMTP id gg6so4642475lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 05:03:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=J8t+3whIAuh2rPUhSPt86l7hkH3YP8eFPso7Mu49lEI=;
	b=SaYICEJnt+wgqtqUe7reP0PWK2e1UuW97RgPGoMR975XtQ8gLnlCCnpPI3ikd+36hu
	JDQhyv7c8wCTvdpYM2HZbvY/uL7yetJSRiwBooFi+mN7p1B4ynRzmQYvdbDrg50S6EqT
	3LuSGGZ9C1o4s1YRKHv0KyiV1YI9DTwqB5rcprgjfEHV+ETAFueShVe0dZtvARnHeSlB
	nWz+lY/V4BLshR0hGw4z2+2IyRZ4j9Pftt76TCyvbYgq3apHqgNoTqDnKttnY3YGM7Z7
	SNuzqzazZD6A1WSGo3649BQs8QCh+/XhFLoOsw3l3PgoSHyXwxL8J/TvXm3WU586VMoI
	pRww==
X-Received: by 10.194.109.10 with SMTP id ho10mr21798054wjb.16.1359723818605; 
	Fri, 01 Feb 2013 05:03:38 -0800 (PST)
X-Received: by 10.194.109.10 with SMTP id ho10mr21798044wjb.16.1359723818533; 
	Fri, 01 Feb 2013 05:03:38 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hu8sm3146594wib.6.2013.02.01.05.03.37
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Feb 2013 05:03:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2013 13:01:21 +0000
Message-Id: <5992d737b1599e30f96280a03f256eeea6e376d2.1359723526.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359723526.git.ross.burton@intel.com>
References: <cover.1359723526.git.ross.burton@intel.com>
In-Reply-To: <cover.1359723526.git.ross.burton@intel.com>
References: <cover.1359723526.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmbHo26FSA0fYPWPfCG47pS9Eip0Bm5OlB4yp184a8nTKPql5HpAO9weG1f4HAW7XtshU+u4VO8XS8jakmuiHypQLOxDI5eZVtb5ZzYQs79YUFVINLBWAEOByM3ogRp42tZYAShYmOq2p6kX8aha0roCaI3jJfYc0HTOyPgXYv2YFbmZJNNM+/P/qc5e4MNPT0Med3t
Subject: [PATCH 5/6] packagegroup-core-x11-sato: remove matchbox-stroke
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
X-List-Received-Date: Fri, 01 Feb 2013 13:19:38 -0000

matchbox-stroke was never more than a proof of concept, so let's not pretend
it's a serious gesture input method and remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 057be24..a4413be 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -33,7 +33,6 @@ RDEPENDS_${PN}-base = "\
     matchbox-keyboard \
     matchbox-keyboard-applet \
     matchbox-keyboard-im \
-    matchbox-stroke \
     matchbox-config-gtk \
     xcursor-transparent-theme \
     sato-icon-theme \
-- 
1.7.10.4



