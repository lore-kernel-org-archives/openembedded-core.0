Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3A172C29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:30:27 +0000 (UTC)
Received: by igbhl2 with SMTP id hl2so2803906igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=sj/zF+6GVM5egNMX2knIWQWoQ6kKtqhAdKCucwDUt3A=;
	b=W338nDIX5zQbXU8LRyFN8+cgOXevB80FigECMvDGVemFw4ZwQB3QhTUxXdF7hDgLmz
	y/YPVpXkLDgE9ME3cyKYfUrZEEoQCk0wSOctFzk6nHDl5IDfFvKnC1DZzAilmjOlVE1+
	fp2c+4Xx1GLIIm7LGcsYrXBM8Uf4pEswSwSQpvmLjH4CjuHi0vUrbrq2tya/L5ZzGzFi
	hpu6tJfKFHb3BEldaXRPUy4fl2QgPbZFBQp6jut4i2/dEODxMhzB/nd2++nDHwfz7LBD
	lEQU9ZhNj/HI9z9mQQjmxHNnUyJFfLvUfHzV4H5FLR6ISNiMIxV0O32tBJ0+3Zlj+fIF
	jPKg==
X-Gm-Message-State: ALoCoQk2biMhE/Icke6kgZQm+oHcUU6NaFsjMlOsdkgvp1RBwtd5xngb6uMhLTUH4p6ugwC9sHBo
X-Received: by 10.107.128.35 with SMTP id b35mr55597886iod.25.1426253429256;
	Fri, 13 Mar 2015 06:30:29 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C8C2.dip0.t-ipconnect.de.
	[93.232.200.194])
	by mx.google.com with ESMTPSA id h15sm1257487ioh.27.2015.03.13.06.30.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 06:30:28 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 13 Mar 2015 14:29:39 +0100
Message-Id: <0b4c9cfb5a59eadfd3d6f14c151aea670f3b60c6.1426252888.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
References: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1426252888.git.patrick.ohly@intel.com>
References: <cover.1426252888.git.patrick.ohly@intel.com>
Subject: [PATCH 10/11] combo-layer-hook-default.sh: beware of embedded patches
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
X-List-Received-Date: Fri, 13 Mar 2015 13:30:29 -0000

Patching the subject line must be limited to the subject of
the main patch itself. In particular, git formatted patches embedded in the patch must not be changed.

Achieved by limiting the replacement to the lines until the first
subject in the patch, just as it is done for modifying the first
Signed-off-by.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer-hook-default.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/combo-layer-hook-default.sh b/scripts/combo-layer-hook-default.sh
index 9dd5aed..46f2b70 100755
--- a/scripts/combo-layer-hook-default.sh
+++ b/scripts/combo-layer-hook-default.sh
@@ -9,5 +9,5 @@ patchfile=$1
 rev=$2
 reponame=$3
 
-sed -i -e "s#^Subject: \[PATCH\] \($reponame: \)*\(.*\)#Subject: \[PATCH\] $reponame: \2#" $patchfile
+sed -i -e "0,/^Subject:/s#^Subject: \[PATCH\] \($reponame: \)*\(.*\)#Subject: \[PATCH\] $reponame: \2#" $patchfile
 sed -i -e "0,/^Signed-off-by:/s#\(^Signed-off-by:.*\)#\($reponame rev: $rev\)\n\n\1#" $patchfile
-- 
2.1.4


