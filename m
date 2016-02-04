Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0A93D77156
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 16:23:02 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id r129so219726981wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 08:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MW/26QWE86vld0KBWtann2MN69TqyAniRZR2iCb50ic=;
	b=Z99HXJPqdiCIjeUY5DUAZJHva/bOWzQf1X8tHvp3fynIO8uiPiB2prxU/6isg+CHN/
	Yw5uF+4dYjsc9J8kMew6gHiPzR/xdH1ZtQK9iSxICs232VdtDa6e6NTlSAGeP1mEJKbj
	yOaJhifnMtZtLgyZodvthtZ+kQ1tKsOfsos5j2iW9T/8a3iWsnLPN06/2wQ6dD1AKIEK
	7xu64Ww9kwd5wYTfjKqlLzhQFLvS+sIPkwKOBfZlrIsZpx2yTVetTuJ2cQz3079TwlpU
	4vsNeWntRlP7D+vblPhHVJbIBA4rFQ/T0bdi1Qozy/3bMMHMj/1APWH3DV0Jd5+S1yZW
	XAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MW/26QWE86vld0KBWtann2MN69TqyAniRZR2iCb50ic=;
	b=ibEhyH2IPdprgQL8Gaw2ye9rXkrm8TmhKQUszSmoZWRLkWoQykM0rukutEWMGsgAXi
	oKprELX8Lw0gz41ZUKc69cXnza6jqfEwDXzbx3douSMsdJW+cY1OWAMIRjmtH86LAlqa
	nkTb3LY85xGWy9Uu7OeKFF9y5rl1XhdWue8DAHKOnk8moDytvhQ+Gcjq78YljMGY7pLm
	SaUVyObgifF+DhtUVzw7uyWGWDohihusQqY1P+f8Z2vLHqMGd59TQM+9OeQ1ZAucluQ6
	ZZigQnQmfJQZqHlSgYcSsXYuzvDY8F8pRk4ToWrHYapb9qlFOh+ub8V2LhHiimNJmhzk
	UOmw==
X-Gm-Message-State: AG10YORLGZya17iBaioLmxZ7SX6xKbmXsyHQw5nxVNLYZ6L6QheolH6GTbSRXOt+OtF9bYNI
X-Received: by 10.28.211.136 with SMTP id k130mr33082680wmg.84.1454602983239; 
	Thu, 04 Feb 2016 08:23:03 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i2sm11951507wjx.42.2016.02.04.08.23.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 08:23:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:22:51 +0000
Message-Id: <1454602972-13669-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1454602972-13669-1-git-send-email-ross.burton@intel.com>
References: <1454602972-13669-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] libffi: move from recipes-gnome to recipes-support
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
X-List-Received-Date: Thu, 04 Feb 2016 16:23:03 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch  | 0
 meta/{recipes-gnome => recipes-support}/libffi/libffi/not-win32.patch     | 0
 meta/{recipes-gnome => recipes-support}/libffi/libffi_3.2.1.bb            | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/{recipes-gnome => recipes-support}/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch (100%)
 rename meta/{recipes-gnome => recipes-support}/libffi/libffi/not-win32.patch (100%)
 rename meta/{recipes-gnome => recipes-support}/libffi/libffi_3.2.1.bb (100%)

diff --git a/meta/recipes-gnome/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch b/meta/recipes-support/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch
similarity index 100%
rename from meta/recipes-gnome/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch
rename to meta/recipes-support/libffi/libffi/0001-mips-Use-compiler-internal-define-for-linux.patch
diff --git a/meta/recipes-gnome/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
similarity index 100%
rename from meta/recipes-gnome/libffi/libffi/not-win32.patch
rename to meta/recipes-support/libffi/libffi/not-win32.patch
diff --git a/meta/recipes-gnome/libffi/libffi_3.2.1.bb b/meta/recipes-support/libffi/libffi_3.2.1.bb
similarity index 100%
rename from meta/recipes-gnome/libffi/libffi_3.2.1.bb
rename to meta/recipes-support/libffi/libffi_3.2.1.bb
-- 
2.7.0


