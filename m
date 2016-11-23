Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id E129171A88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:47:18 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f82so10031233wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=neaq+cjnP+R+q81lyY0LewyamOrEdJNy8UeGDkONmCM=;
	b=aIck2PUmaIIfU+YAP0WCxT+u6aH2F9eKfRmn5zPXA0480NRGQgXxGReF8Y0ilNi8/Q
	CvuQmqIitcEbnyJc2YQ6yIMHX5mKSUkuKcjywg3vzOzjwUYfuwpgwTYog4FrlX1P/5QV
	jao5wnQb7SJqCp3WFh6uM2a7yqOx4DgBcJWRoT2wEYFhlVEe9H2/pTTE+IGpz1iXDTOk
	K9M4Ezy5EOlpeOVNEq4Z2QXe78R+Wqayk+TxR9wjYigZQm+/wOXTa8oouxPjIVgS0OYP
	/b5Eto6IsBpbgj2jo/Y3MlcvGD7KlTgMEXvVcD/ogTapY0YT06e3gXmiO+fX7fW9FAjx
	4vZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=neaq+cjnP+R+q81lyY0LewyamOrEdJNy8UeGDkONmCM=;
	b=Ft6whdzJjjJtsjO0wkPycIL8o1WqnhksoLSnCci4lyUOIQG3yM9zsufl/KvS0cOsRk
	hn7wgOdoYHflqFPO+hpQ9nPf+0+M31O68t0nw10SeUWwGyBKOwzMkWH4SAXei3cv3/My
	YVxamds0/AEPEfXG8RAuBE8YNmso3sRbDA1HWureRnbZwOtHJgbb1t1pk9Bx9tIh+4EE
	BQ3rVHeY6bnlDM5DNcM85gA3Z4oWZB9XWHXgK2jxfY5Rx9FI18oQCZnMsJ/cI1S17dhI
	K4xXpJEN8xAf/g7qB36DhEJQekfcFRwLtVlr+to2ozshI05qEQKtPOqYdoc92umgo88N
	U+Gw==
X-Gm-Message-State: AKaTC01ZG6Xs8DIDiT8KjO9d6vtvLgVJxHAxJlrXGFFTxKhJV6dxMZaH4/huoYNCZxEzRw==
X-Received: by 10.25.208.203 with SMTP id h194mr435445lfg.26.1479887239743;
	Tue, 22 Nov 2016 23:47:19 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	f25sm6988635lji.47.2016.11.22.23.47.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 23:47:18 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 08:46:27 +0100
Message-Id: <7cd0e82525439243112a255ea52747a062adf4e1.1479887010.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479887010.git.maciej.borzecki@rndity.com>
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479887010.git.maciej.borzecki@rndity.com>
References: <cover.1479887010.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v4 1/7] oe-selftest: enforce en_US.UTF-8 locale
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
X-List-Received-Date: Wed, 23 Nov 2016 07:47:19 -0000

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


