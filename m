Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id B46687228B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 23:48:17 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so19225001wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 15:48:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ccRZtX0u+KbyYtpMaA5R2EJ9UEQ2nR9QCdtsBXhUVKU=;
	b=bKw5KltBuUenk4ipVmoWlHCrbjidrzCFm+niDhAcDDHX8hldwU26vDtG/oY2P9sAvb
	2tRm2AQOPgFKK17HXCWhak1euf6nwzxIBJjvb0+kV+hCksBTymbBQGqNqjh7mWavbFz/
	2XRJ8BbelUDdVsV5QoG16rRAmmYJ0Cdf9hsB6PAG9CTDo3X/8g0RTxpOQ0tVp9q1vOpr
	h0Ymoi6T8BwK3VQnDQ5lYoRwmqeThKWXyWXviuDM3JTMBsdzZsIURfYA0QSCNwmfSo9b
	QXSELCsWUNEN3PgIO6cHG+9WiO9el+GqNKlpMFuMihnAAGmq3qETQUrhPJaWSAZvWWXb
	1Vfg==
X-Gm-Message-State: ALoCoQne9Wb28yCzH2u/nb1CvC38yuhkIvi2L7T7AZOIC8ATB941FvH/z0ez+TrVdYkZo4toAjvC
X-Received: by 10.194.92.176 with SMTP id cn16mr95520533wjb.62.1417477697779; 
	Mon, 01 Dec 2014 15:48:17 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	he3sm29570430wjc.15.2014.12.01.15.48.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 15:48:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Dec 2014 23:47:45 +0000
Message-Id: <7a96cd530d863cad7914fd74f49114e6e8c5e54a.1417477584.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1417477584.git.ross.burton@intel.com>
References: <cover.1417477584.git.ross.burton@intel.com>
In-Reply-To: <cover.1417477584.git.ross.burton@intel.com>
References: <cover.1417477584.git.ross.burton@intel.com>
Subject: [PATCH 2/4] uboot-config.bbclass: don't skip defaultval
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
X-List-Received-Date: Mon, 01 Dec 2014 23:48:24 -0000

This field is now internal and won't be seen.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/uboot-config.bbclass |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 8ac1b71..b467659 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -38,9 +38,6 @@ python () {
     ubootconfig = ubootconfig[0]
 
     for f, v in ubootconfigflags.items():
-        if f == 'defaultval':
-            continue
-
         items = v.split(',')
         if items[0] and len(items) > 2:
             raise bb.parse.SkipPackage('Only config,images can be specified!')
-- 
1.7.10.4


