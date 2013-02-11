Received: from mail-we0-f169.google.com ([74.125.82.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U4w8J-0004pM-TN
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 17:21:31 +0100
Received: by mail-we0-f169.google.com with SMTP id t11so5255164wey.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 08:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=sKAKT/vU2j35XtgdneFy9DU6LtjAH1KVynOZk8v3NQA=;
	b=PHDhwJxlOQtMi5jA7Klqo0l/4zvII+RO+wnh5x+VEs7OeqcFCIhrEv7ImT5+0j5Yq/
	uHoQL2vRqZ/FplZuyzWEKdmc5K8zvTylVQcqeXCnvj4D0hLdeVJt777Y7/LREBaWlAWD
	5qGKNk3BPvKwaaWokqXxcU2YtPrFrFIxngzrPhF/SANQZX88F83R/R13CjnptjuepWl4
	MbFPSweiHgalfD/RraQfOiJM2F0wYUNaGtvst+BRGcgVNWLzF86/ZNuc2sAtY8bL/cS2
	CQIuncgzTtLvR8kJ+T2HdZw7OqiIeG6W3h5VYNOCD8/4PkuzFx+i+neOrfzsZNNZoOLt
	909A==
X-Received: by 10.180.107.67 with SMTP id ha3mr17093163wib.2.1360598726950;
	Mon, 11 Feb 2013 08:05:26 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q13sm32487856wie.0.2013.02.11.08.05.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 08:05:26 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 16:03:11 +0000
Message-Id: <27fe822aa3e7bfc8523f9a074c623ee0270cbefa.1360598515.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360598515.git.ross.burton@intel.com>
References: <cover.1360598515.git.ross.burton@intel.com>
In-Reply-To: <cover.1360598515.git.ross.burton@intel.com>
References: <cover.1360598515.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmaEu5LPOgRjw3fHPBp90nRqAuTNQZnAaRlBtXfaUvXzzCfHQ2ikwYyfYAxefflSE/Ail+9
Subject: [PATCH 3/3] fontconfig: rename the patches directory
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
X-List-Received-Date: Mon, 11 Feb 2013 16:21:32 -0000

Rename the patches directory to files as we only have one version of fontconfig,
so the hassle of moving these files every upgrade can be avoided.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../Add-sysroot-option-to-fc-cache-and-fc-cat.patch                    |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.10.2 => files}/Add-sysroot-option-to-fc-cache-and-fc-cat.patch (100%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig-2.10.2/Add-sysroot-option-to-fc-cache-and-fc-cat.patch b/meta/recipes-graphics/fontconfig/files/Add-sysroot-option-to-fc-cache-and-fc-cat.patch
similarity index 100%
rename from meta/recipes-graphics/fontconfig/fontconfig-2.10.2/Add-sysroot-option-to-fc-cache-and-fc-cat.patch
rename to meta/recipes-graphics/fontconfig/files/Add-sysroot-option-to-fc-cache-and-fc-cat.patch
-- 
1.7.10.4



