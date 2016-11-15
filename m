Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id EAEA271A15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:52:42 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id w33so65167440qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 01:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=neaq+cjnP+R+q81lyY0LewyamOrEdJNy8UeGDkONmCM=;
	b=VJarlOBa7Hm/vh4DyAh3PPpPYR0zecFg1sz+JA/DGHFat0pG+Y5hU+qKxDNCl1duP1
	L7W00ELpGk1w2amlBoH890NiXqUW5yTCHO0tvfZoIoB1C4gqA9wt88PO4marzHjRBja7
	PDEKocNlA3ojpZUyH4j+Ds4fCyjtQp32cJPZIEOMuVUECKilZoBZetuaU/n/wHqfYvej
	GvTIFG5IC5XCBYK/2RvEPNV0sJpNvnkvvMqylFCx2eRvXmkkEgLE5BbfOCbU4KN18xwa
	Y0suIg3y/SlZ5uXOlxojcUqm5rm2DpmC+fgEW4+QHs5Wo76vTBQGbI11HfuO7VwDtRtZ
	OlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=neaq+cjnP+R+q81lyY0LewyamOrEdJNy8UeGDkONmCM=;
	b=R6EwMMVTEO4FSmPogJDSsKioCUDc+7sNUtbhAQZdCikqWl/pxWSrI1IMzaYrx8URTs
	E5ns0UfuNq/uTZKFrsy4GjhLScQIkhH81qXOYDfgi6m7HLwkb9yQmzDR242JGtvri9GL
	TrXCxVx5BWU3WeMPAUJ1BtkTm6b9U8WhYh2BO4amV80flCExNDuYLWm9VLG/H4LMT6jS
	NmECA9E4npGeW6j0TvyP4MKsZKG/gtfAMI4ya6JPB6iPTEn7kJCMd9emlfyVwdsVjLby
	zwTPoZxUf/dmIexfbLx9juuT3Ob1YCr+m2gLxTTV/PmV+IDEncA4X3+jeKTQa6l38Udr
	jLTw==
X-Gm-Message-State: ABUngvc+bO5mwMmcd/cq/4IIA8DqETv+quvyF3RGNu1z09zVsTY/iNAZEKUNe81T1lZRTg==
X-Received: by 10.25.193.196 with SMTP id r187mr9126788lff.21.1479203564003;
	Tue, 15 Nov 2016 01:52:44 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	u204sm6093118lja.5.2016.11.15.01.52.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Nov 2016 01:52:43 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 10:52:11 +0100
Message-Id: <f2fe10e28d627a0ed5d5c890ee546e206f7a748d.1479203195.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479201985.git.maciej.borzecki@rndity.com>
References: <cover.1479201985.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479203195.git.maciej.borzecki@rndity.com>
References: <cover.1479203195.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v3 11/11] oe-selftest: enforce en_US.UTF-8 locale
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
X-List-Received-Date: Tue, 15 Nov 2016 09:52:44 -0000

Replicate bitbake and eforce en_US.UTF-8 locale so that ouptut of locale-aware
tools remains stable.

Signed-off-by: Maciej Birzecki <maciej.borzecki@rndity.com>
Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 scripts/oe-selftest | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index c3215ea6592e128d17da550d778272985f5bd1a6..deaa4324cc888ea261687f90f83e8759c4436a15 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -468,6 +468,9 @@ def main():
     sys.path.extend(layer_libdirs)
     imp.reload(oeqa.selftest)
 
+    # act like bitbake and enforce en_US.UTF-8 locale
+    os.environ["LC_ALL"] = "en_US.UTF-8"
+
     if args.run_tests_by and len(args.run_tests_by) >= 2:
         valid_options = ['name', 'class', 'module', 'id', 'tag']
         if args.run_tests_by[0] not in valid_options:
-- 
2.5.0


