Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id E5554705C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:08:26 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so1413696wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 14:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ifM4TGLfbDqsPtM0Kq7lEgE4fteagvDwzk8QYB6/qGc=;
	b=EZbbPJajDIJU2U29+fWFdF+m4BTnpUMbcQWdwCtw9SdukztDwFvGNorY2cQGDCKg/M
	tfySl5/xav0BVXHTDQn0cTBHyfdnWMG26YsgcCgnpOjJ88Z0Wdw4OeYkKBBmT4aMYSrX
	wxYHWF/3xptXJrrlenaDOHfB+HFC8N+W/Yc3tFFzWcTCI4VUhPTFdmiJBlx03as1dPgq
	pmnYtWpi3ZyN4ezIP2MYrra6IUYL2oLwUntKCGTC+KSTEDdJMaiYM3E/u5m5c6qgLink
	EB9kJ1i/le9CW6jlLJZrNlc66voPArGFHJgTf6TArY2hOzIDpOAZhtOcqSmxdgzx88MK
	QrCw==
X-Gm-Message-State: ALoCoQlav7tuVXr+BKQHFwVVfk2ZyIh8zYp83f01E4SvUMWa8mV+6cdaeMF+IvUunCSU9yA2DOJC
X-Received: by 10.180.149.161 with SMTP id ub1mr15210179wib.32.1405544903471; 
	Wed, 16 Jul 2014 14:08:23 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id m3sm13215918wik.7.2014.07.16.14.08.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 14:08:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 22:08:14 +0100
Message-Id: <934289b8ba6a8b7a0f1eec8aabf723f823d515d8.1405542583.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1405542583.git.ross.burton@intel.com>
References: <cover.1405542583.git.ross.burton@intel.com>
In-Reply-To: <cover.1405542583.git.ross.burton@intel.com>
References: <cover.1405542583.git.ross.burton@intel.com>
Subject: [PATCH 2/2] default-distrovars: update license whitelists to use canonical names
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
X-List-Received-Date: Wed, 16 Jul 2014 21:08:27 -0000

Now that all licenses are canonicalised to SPDX names when processing, we need
to rename the whitelists to the match.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 1bc8e46..8d24d66 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -23,9 +23,9 @@ IMAGE_FEATURES ?= ""
 
 # This is a list of packages that are used by the build system to build the distribution, they are not
 # directly part of the distribution. 
-HOSTTOOLS_WHITELIST_GPLv3 ?= ""
-WHITELIST_GPLv3 ?= "less"
-LGPLv2_WHITELIST_GPLv3 ?= "libassuan gnutls libtasn1 libidn libgcc libgcc-initial gcc-runtime" 
+HOSTTOOLS_WHITELIST_GPL-3.0 ?= ""
+WHITELIST_GPL-3.0 ?= "less"
+LGPLv2_WHITELIST_GPL-3.0 ?= "libassuan gnutls libtasn1 libidn libgcc libgcc-initial gcc-runtime"
 
 COMMERCIAL_AUDIO_PLUGINS ?= ""
 # COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"
-- 
1.7.10.4


