Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail.openembedded.org (Postfix) with ESMTP id A1B827C7A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 03:35:28 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id s49so4999462edb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 20:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=C0V08yQPNPSetC3eqTS3oHrkJCSl07NoMq5XkmDGAh4=;
	b=R2ZYa4F3Egz1nfDGstty4ppDFzgglMGSASIvOJYeedyGanlzibiLruBclGc8KS8SpR
	cOzmLzhTwUEDtj82k8ZvIicZJPiL4aJPbhnX1M7eZx9WzLxx7f1PBRszO2VHzY+IzaJb
	+SwYujcR1Xo8ZW9cR/Dn/z7vP7+ZkL2H/rDrJvKJhbnFawmEDdL/i+Ym+NAIRpkHAdM3
	Z2id9ijjtGL9YMdfaddUrDMRuZfaqIbJlEmhUuSYMQMdEAnNctE6DekIq3OTzy2fhGS/
	WnmqrpvO2I/Cq0Ey5sFPXJCRE0pQBbXb7F2ttTtvqMkYP7tMLPUkUpA1WcnEayYZ6Uea
	PROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C0V08yQPNPSetC3eqTS3oHrkJCSl07NoMq5XkmDGAh4=;
	b=d6RHa/oALvkIfRsXUj7h1yiNxQ+COBwj/3k9uYld+apoFY69DoenJdZ7fp4R0sb1H1
	OxJFXYPlLNSqzZYrrf3j6FMW+ThPuGIx55ZnkqYh70X3x4UUtDkk9ARZDR0YZdOhAvED
	e4zviDNJOSTqfJtx4eA2KvBHafWwi5WdWpd7DAluYgcQXl8TDl2nb3knCZ1LLACOj4JP
	GAKH1qHVIj/H52F2+FEsJD9UB/mNMD54ejaP/ZyetnTGyiisg8AEgdJZcRYCSNPpZttA
	pM54RW5FUvTCA5f1AYoJaH4+3h2qhCkfe9atNxrHam2ZuvKi1vHThw4hmzW09RnmwPSs
	kmCw==
X-Gm-Message-State: APjAAAXLzta9WOBa/g5OqkBdb2ZI8hY+tSiyr0CKq3odN9q9PX+/s4GB
	3YMGoCcFzIkvTJ1zr77SrlwIQn+tlIs=
X-Google-Smtp-Source: APXvYqxcrA7p3uKQVIFX3PmKIHDMUhCpl7l4dpOjBNZ/BjY76wOGkQ7jR6O5juqg2nyDZTWAtJm2ug==
X-Received: by 2002:a17:906:eddd:: with SMTP id
	sb29mr5691039ejb.278.1567740929135; 
	Thu, 05 Sep 2019 20:35:29 -0700 (PDT)
Received: from peterliu-Precision-7530.toradex.int ([27.191.200.184])
	by smtp.gmail.com with ESMTPSA id w11sm413555eji.2.2019.09.05.20.35.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Sep 2019 20:35:28 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2019 11:35:19 +0800
Message-Id: <1567740920-13805-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V2] weston: uprev to 7.0.0
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
X-List-Received-Date: Fri, 06 Sep 2019 03:35:28 -0000

From: Ming Liu <liu.ming50@gmail.com>

Changes in V2:

1 Fix a musl build issue pointed out by Ross Burton, thanks Ross for the testing.

Ming Liu (1):
  weston: uprev to 7.0.0

 .../wayland/weston/0001-make-error-portable.patch  | 80 ----------------------
 ...ch-Provide-a-default-version-that-doesn-t.patch | 47 +++++++------
 .../wayland/{weston_6.0.1.bb => weston_7.0.0.bb}   |  7 +-
 3 files changed, 28 insertions(+), 106 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
 rename meta/recipes-graphics/wayland/{weston_6.0.1.bb => weston_7.0.0.bb} (95%)

-- 
2.7.4


