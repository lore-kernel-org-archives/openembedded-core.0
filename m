Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7145.1795184886624265463
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 06:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=I9XVkWTP;
 spf=pass (domain: mvista.com, ip: 74.125.82.46, mailfrom: vanusuri@mvista.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so1124443c88.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 06:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1795184886; x=1795789686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7j0e6fZX6aWzVzDZHIH7p/pEfnSA9XP532MGo56bSJM=;
        b=I9XVkWTPaDlHIWZ5Bo85z28Q/YkZ7FJyB93VYnfbzog8/1VPop7cxzO0+dl78Sbglr
         a+jVLjsdGXeqi/xTMOc2Bz690coD5ecyvbPrVjHH7IMBKYIp5b6RkUl3hnS6ubPUBu/J
         SRR/DNmH78SmuIcpnuc8llxdEvDMo1+vmKu9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184886; x=1795789686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7j0e6fZX6aWzVzDZHIH7p/pEfnSA9XP532MGo56bSJM=;
        b=elanXyvvXCSq4wqovw6bOYnp8LVAZ56m5upxTj8Tp7x+Uxx6TGjB4I3bjAx7jHhO9D
         fC6jqzouYSX1px/ezmx6BP/n964Ue76MGXNUiC+lT/PSoxdn20EqJtgOEqXH05C+VLd7
         ZXK/bsyapFzSvMKZtpD99MV+ZEnn0aCxkf9gEEinCIqvGW3thqW2AZKuLPkzoJCBUV8H
         0cwWCe1e7wvgZyd8YW1LVY0WZe/Dd/4TIJSBm/g22hzy0TDhzKya9JzFQ1tC37N4nyhE
         ceK6CurhbiG5FnfpbBdzEEEQUJ3Pso2RTJ8ZjCGPm3BrHVRtVuR6mri50Uh5e5RB9Civ
         rdJA==
X-Gm-Message-State: APuU4Z/iQ/V8qyu/NrIFIdAgN7nWTkLj5mgBA1yND5LRl6MXiI60WpAj
	tpbbkQ7XKjs4a+DqTH1bf/2liXn2enUlPkZNAy/Y4XFdf3R7aqcDwexpmKnq36T/DDiONEtmAin
	53985zks=
X-Gm-Gg: AYBFou11D/jVWFM3P3DDIJVNeFntztYajLBhmsobyxnj9pzSMDEG7wo6uoS2JdZF3eY
	90niS9Ph/peEBgYPem23riW7oR39mUfBJom2HH0PTmZoF+7gPPR3ZRoHuDJcsYovW5Iux+0SipU
	r9wpTatPI5e+xsDfZuEuA+vckdeWK0W5TXObWVKcjp6FTAzsHdSLRUBG1CkbGAyeVs9YvaKNBIi
	yTwrhm8fSMAklsggHDsYJ1mvjo1AF2jlbcktst8C5nfLOsEO1Ug23NUQoVqc47CNTTDSwimV1uP
	vWVs/digRLfWHt/1qRaAB6+qLufbE19PAHyecPNwwCTBcWlHcBtpTqxZ8r66DLN2xphLa7sHecA
	WVOrfGED7edoxv/NwKlQeNfUhx8hJ9B7ze8MZ38KSeoYj/gJVb+4so9KJHP57c2FfaQ1vRJbVd8
	W579e3+w62MwOkuutvObxGw6sk5sd4uRoww55ruiUkj7jB7LT/BXC++Ceq0RHH+MQe9b8csFhIr
	GNzwLu+sJthjlTnNeD1kp92dCt+abUqt3HlRECDhAGWEE8yk9vML6mYRVB3rvPbHwaucTOtxNFl
	l0lIK45uC0CP919MoOBifRw8gdkhBfB05wLoSSHpAPjojw==
X-Received: by 2002:a05:701a:ccda:10b0:144:fb42:52 with SMTP id a92af1059eb24-1b5568fd903mr3010068c88.28.1795184885804;
        Fri, 20 Nov 2026 06:28:05 -0800 (PST)
Return-Path: <vanusuri@mvista.com>
Received: from MVIN00352.mvista.com ([2401:4900:1f29:ccc7:8a94:96a2:5354:9da1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e644dsm11338488c88.5.2026.11.20.06.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:28:05 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] tzdata/tzcode-native: upgrade 2026e -> 2026f
Date: Fri, 20 Nov 2026 19:57:53 +0530
Message-ID: <20261120142754.1434910-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 14:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250805
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026f

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a5c5781d51df60bbb3d9945c9b3ad89f4d9502f4)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 704d6b603f..a3c981f8ef 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026e"
+PV = "2026f"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "cc3d27ca2a0d8399504551b920970d80af83bfb9c216e8082a15491921935d54"
-SRC_URI[tzdata.sha256sum] = "b26882805f26aac59d5b222978e6580484b834ccdc98be89df2f05a6dc53a652"
+SRC_URI[tzcode.sha256sum] = "5a18da01393679ef2559214dc687563f7f3d05691f6f58b7fbc0166f3e796cd6"
+SRC_URI[tzdata.sha256sum] = "01b4a91cec5167ed48c11e8ab78f2048cead78ce94b0cafcad0ae8c5a3044d3d"
-- 
2.43.0

