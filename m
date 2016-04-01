Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id CADB06FF97
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 05:01:09 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id e3so16425938ioa.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 22:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=efysnLrY+nexeu4Sbe3sD8i9BtUG86FPmzPtFS06nGo=;
	b=g9N0BrCWEn4ElfclKpimofUYv8EZ0Hb0jpHbYnapX12Sb/spnLOn6dSF0Ti4NknWgD
	kspcqETRuUv+C1XoWrIeHqNqPof3vNDXqC73RczKk1xQQ6t+9JF212828+Bu7pT3ZgwJ
	3WjrcyjWkU3oUNkQpNGhd3MKoXTbXCiPGZwu1x0s6bGKv1jFfhy1yUlAz6xmszsuzUAS
	wGvkvyk3zIZAPjw2krIJrvzuOq7q1MFfyKHrpQjRtHeISZblM5xgf+pogpqh5J5n4ioE
	8VRHJ8jvEFYAR+hipgmNFep+DTqHUjO5sZLQyoZ24RubX83d0sTdepaHTgAxn2KFE+b5
	xiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=efysnLrY+nexeu4Sbe3sD8i9BtUG86FPmzPtFS06nGo=;
	b=cjvKLEtP/ngTUg92IXcHBvDHxFQf6QE4sPZElWXh1o7BhBDsighyYED9eBz2zUj9Ta
	SoOwBAp5ZGXVylh91uOlG6jDxJyj03Yci4+1r3tm66f8qZOv9dP8T5twWVSwZL0W9tx6
	Z1Uwo3cDYNWfFopY4hsxzeXj7cxLbeXOBqxp3YLju2w2ASdU75r0akXzsAF/+2FBxs/4
	XLjr4hxcXuTegq3nb+BgZBkMXuE2UwCHPjCY22nikMkSRWfIIvq2l4Qu84VzQmftpdbj
	N8Xy1rtydt9hiwmEdCI0wktFjBsCaQe0gSnhqiOOjYqOdWXRUjYphKuPq8sUSuJ5qqwu
	EO1g==
X-Gm-Message-State: AD7BkJJi6cRnWZvPj7mMez8YbGAUzZhNvYdIZtJC8aWv5HUYnwe0OdL2lg2brWL1dlDk+g==
X-Received: by 10.107.30.71 with SMTP id e68mr887241ioe.145.1459486870706;
	Thu, 31 Mar 2016 22:01:10 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id z8sm5150069igp.3.2016.03.31.22.01.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 22:01:09 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 22:00:59 -0700
Message-Id: <1459486859-14736-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459486859-14736-1-git-send-email-armccurdy@gmail.com>
References: <1459486859-14736-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] default-distrovars.inc: remove libassuan from LGPLv2_WHITELIST_GPL-3.0
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
X-List-Received-Date: Fri, 01 Apr 2016 05:01:11 -0000

The libassuan recipe is now buildable in distros which blacklist
GPL-3.0 without needing to be explicitly whitelisted (since it
provides at least one non GPLv3 package).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 84cdaca..fac4deb 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -23,7 +23,7 @@ DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 IMAGE_FEATURES ?= ""
 
 WHITELIST_GPL-3.0 ?= ""
-LGPLv2_WHITELIST_GPL-3.0 ?= "libassuan libidn"
+LGPLv2_WHITELIST_GPL-3.0 ?= "libidn"
 
 COMMERCIAL_AUDIO_PLUGINS ?= ""
 # COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"
-- 
1.9.1


