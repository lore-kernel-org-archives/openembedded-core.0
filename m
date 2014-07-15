Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9804A70579
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:40:37 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id q58so928019wes.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/k55LqxA5zjVOzGayNB0IgvJZ9eGW4Gd5YnbirYD+Yc=;
	b=afqbrSqspMy3zMsg4tN8gCicTqm7BWBScwy12cCVln8YRalEIgI+/8sNtnwCuCz+Pf
	SV6r8lRw2ZVubWApfWXH8o/u62x1vrU2JKySKJMjDz2qeehF7jz2/UgIQinfcqZRETsT
	+m/JBDbamhkhDtYCx0FgNG/y10a1DiOjKgwH60RikRtz/RWadxSYnlgfj24A7OuU5Zc+
	ZuNB5L9AoSw4wBYhcE4nFcxx82uffqYHxOcvz//3DHR+UjdmEtGjx2ysfZXgOcKdXCw0
	RjCrASHeqhCHel16G702ra3NmGozBcs9UgmLlGnH0gAQpPgTEjSWpXLMtEAwwo5e6OHz
	sHfw==
X-Gm-Message-State: ALoCoQlVmNzxzwEkKgQ8iajDCVlJ+U1NWwpZ8zQF7i2Ut3yoV52WVh/3nxL8oHvrteuZ+MwGuC7a
X-Received: by 10.180.92.9 with SMTP id ci9mr6756530wib.61.1405442438635;
	Tue, 15 Jul 2014 09:40:38 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	eh10sm40897932wic.0.2014.07.15.09.40.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:40:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 17:40:32 +0100
Message-Id: <1405442433-22848-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405442433-22848-1-git-send-email-ross.burton@intel.com>
References: <1405442433-22848-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 2/3] default-versions: remove xf86-video-intel
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
X-List-Received-Date: Tue, 15 Jul 2014 16:40:39 -0000

Setting PREFERRED_VERSION to the latest version available is redundant, so
remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-versions.inc |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index a9a931d..53ec2e7 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -9,6 +9,3 @@ PREFERRED_VERSION_python-native ?= "2.7.3"
 
 # Force the older version of liberation-fonts until we fix the fontforge issue
 PREFERRED_VERSION_liberation-fonts ?= "1.04"
-
-# Intel video stack 2013Q3 and newer need a version >=2.99.902
-PREFERRED_VERSION_xf86-video-intel ?= "2.99.910"
-- 
1.7.10.4


