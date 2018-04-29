Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A75FE74499
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:21 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id a11so5121924pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=O5KBnxFMWhmfySvERECp+R0R+BKCVklfQA3PTfW6eZg=;
	b=JP5J3gHMYGEwnmMSZsvePy/cnYzXjJEj2gVLjxk+7N8PuBq/+oqtBKeEvLOoHj5Vbf
	5mqsyZgr0TYu1SULogRTqNoZvJ4PqJdgO8GVr/X50Axet1+qVwQMSICXQUmloUclTcmL
	o4vI1oDM7C8jj9+JdgXtdSfvj3DuelnpoRDlrXUES+EnltlULRjOhKjbXNF6YXj8OYLn
	h8gRsyXwVa2LUzS5mcH1+LSr7SsDV+TGgPELfhzdUFShQ1+G0e7q0DQoWXuxaReCdk1P
	fgy6AtU3EHm9s1oNtXz++tlSgLSFdpZgMNTiTjMGy8Ymd7ChWnwuWjknjKlFRbZ27Wos
	RUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=O5KBnxFMWhmfySvERECp+R0R+BKCVklfQA3PTfW6eZg=;
	b=KSI97wpgDWo5og/6378cnqARH/imIxhYKCqOr+oTMOm6ZIcCv4FXbgGtlSuQFfWgea
	7nsi0v+mHLpPvQmoO+xPyu61rck2Dg5+EfipZ1iJj18vokEHau2iY/2moPSfcSKFP2vN
	K2ndAd3hK6j2d9V+KlOYJpFNPHwJnvX8H2brpaaqiduH4cM0UJovgcOf9OWstrE5W59e
	qnPZ5mbdFK2z3FkL/Wm+38CeKlPZ6SDhnCFQg+fvwjBEHWl7AImlaZhy2hMpNFQAtBRz
	O7wrZNb1QujRw1XY4pHXRdhlv0cAfqaun0g63Q+r7EbAjbIIIrC7obXGm+xAzqPRXQz5
	xmDw==
X-Gm-Message-State: ALQs6tAufRA6sbnB9cS2wHDJke0Q0/wQVLpAWJfi71FSjCOa0mZsgfsR
	7yu12BT9Omu6X924rB9gsTvslw==
X-Google-Smtp-Source: AB8JxZqRy5qlvBtwbH9dnricCagrNLYUMjsfEy57rq2lWtzSiBR8flebuWyow3HmS4bHdwaLtKiQXw==
X-Received: by 2002:a63:6fc9:: with SMTP id
	k192-v6mr8240196pgc.143.1525030582176; 
	Sun, 29 Apr 2018 12:36:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:35:52 -0700
Message-Id: <f240d9dbe59a76f14cce2a12be68f8a6bd4fdc98.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 05/24] musl: Upgrade to latest
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:21 -0000

Changes are here
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=55df09bfccbfe21fc9dd7d8f94550c0ff25ace04..9be4ed5d89ecca80123311a4ec73781e5cc97a9c

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index a57460ddd2..f12ca16b0c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "55df09bfccbfe21fc9dd7d8f94550c0ff25ace04"
+SRCREV = "9be4ed5d89ecca80123311a4ec73781e5cc97a9c"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.17.0


