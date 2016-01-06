Return-Path: <matt@madison.systems>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5C1C9731FE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 12:22:29 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id 78so241331100pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 04:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=KDW5foQPnUu6GWrSJwzd1Ccfn/hYfrXz/DIicUEZHiQ=;
	b=BQrBfaxOcD4GvG3YgP9OqWJRXaAfj4qpkr4w+Xo8lzaseDY1bGFzI5sZn7MttOXyiF
	q+h2aJVDA0pmjDAM7F7n8rV7zy2koiznrscs/TmA2U93g0FBpVmbIpaNRt1i2pUUZkFf
	aXDRCpjePESyStSoHyo9+ERYI1Ccetu7Sjazd+noSSy6M5XcqQBsnn6pFtFdz4M+rLC/
	jm+M+/bL2JTwEwG7GldYYjFMJpmkd2+gaaO3TEmuOTpqaqmC2eoyk+gIu0KdtMqzKQyg
	jHNV8L9XYJseq7S0c/ffnVy4StZ1GGRaXFhlvCuWy9t61DDpW8XShDe4lRM67fi4/6cs
	Gdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=KDW5foQPnUu6GWrSJwzd1Ccfn/hYfrXz/DIicUEZHiQ=;
	b=HTPTeFlkXyxSUP9wFwUarP4OyOvnB94nab5C4ZgwDZai+bdQ9SAvk48IeIPed2rDFH
	9jktZzaA9lo/tnYK56aGoESBR/rT3gYADspNO5Ps9W+N2j0uwDDKXmUpF79bO5nBYgHl
	yvVy+9wciif5AtI7PgkKAgtYJhxzZzPko1UIg5IG/jj75VhOBsaFYeKtLkxY2l+BMWRE
	qh6eOtqnaKV1e2NdSAobjr8NIXd5lRz3no7hexMcwlLQWkF3MikXb8QM0llARVsWnZrd
	FrnRTHNgg4JmLWlc4tNWDGWz8CaRsQ0Q1bgVcXVDSOJ2MZkHES0mrn6nO7nFgE0jTz0S
	cVDw==
X-Gm-Message-State: ALoCoQlSLbieW4zn3RmXtx/5q4ONAvlrl/3zTXCLfITqCXnanAAk8zqU56m83eBn7PLHeorkjnTwA1Wrw2lTl1Zo/1TygkOVRQ==
X-Received: by 10.98.75.90 with SMTP id y87mr140054943pfa.94.1452082949995;
	Wed, 06 Jan 2016 04:22:29 -0800 (PST)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93])
	by smtp.gmail.com with ESMTPSA id c5sm1479817pfj.89.2016.01.06.04.22.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jan 2016 04:22:28 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jan 2016 04:21:35 -0800
Message-Id: <1452082896-3261-4-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1452082896-3261-1-git-send-email-matt@madison.systems>
References: <1452082896-3261-1-git-send-email-matt@madison.systems>
MIME-Version: 1.0
Subject: [PATCH v3 3/4] package_deb.bbclass: add 'Multi-Arch: foreign' tag to allarch packages
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
X-List-Received-Date: Wed, 06 Jan 2016 12:22:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This tells APT that it can use such packages to resolve dependencies
from packages of any architecture in a multilib build.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/package_deb.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 8d27adf..25218d0 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -161,6 +161,8 @@ python do_package_deb () {
             return l2
 
         ctrlfile.write("Package: %s\n" % pkgname)
+        if d.getVar('PACKAGE_ARCH', True) == "all":
+            ctrlfile.write("Multi-Arch: foreign\n")
         # check for required fields
         try:
             for (c, fs) in fields:
-- 
2.5.0


