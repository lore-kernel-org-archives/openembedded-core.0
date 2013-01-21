Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxJaP-0006b0-Bl
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 16:47:04 +0100
Received: from mail-wi0-f200.google.com ([209.85.212.200])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 07:31:33 -0800
Received: by mail-wi0-f200.google.com with SMTP id hn14so7495993wib.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 07:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=ndXDqCjS5+fcOtjS1nyn6BuLoc8c+3wwbJRTuspLx5A=;
	b=DQwkYo4PraGzOr1VK8MaWS17bhsPlqqNdDPhswNbQ4dGAaLJXNEiBBp0RN7v7WkQ1K
	NyWsZYmhAgXsrASUMNLJO3CK3gNuE4s3nFS9xbtdFVDJe5sPtagvMb8aU6Kw8H4MJuFe
	Ubu5SBRkeg2XcOnuiNfjHoFvW+r7TCqBcS/zwzx+8YE1XuF33uWCOmyLUlLKsyd0zRWc
	hTFogKd7UTrHokau6DK6xm/lnFa1FGtUb+HC643bXTnxoROHrFH5QB5PlHNuS2gO0txe
	0mi8OeUe76PPp8I69+4MHVQ9V2Tl6wV5hsGXwKqZ5FjZgT2BADk6yFe/TvnHHOYws11j
	LUTQ==
X-Received: by 10.180.108.236 with SMTP id hn12mr16179015wib.6.1358782290623; 
	Mon, 21 Jan 2013 07:31:30 -0800 (PST)
X-Received: by 10.180.108.236 with SMTP id hn12mr16179005wib.6.1358782290560; 
	Mon, 21 Jan 2013 07:31:30 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hg17sm17327964wib.1.2013.01.21.07.31.29
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 07:31:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 15:29:31 +0000
Message-Id: <17d63fe6f27fbf6719b3c6d7344ba896e6b45a58.1358782098.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <3f5517fd31e3342dcbd4743b88bc115cebb98492.1358782098.git.ross.burton@intel.com>
References: <3f5517fd31e3342dcbd4743b88bc115cebb98492.1358782098.git.ross.burton@intel.com>
In-Reply-To: <cover.1358782098.git.ross.burton@intel.com>
References: <cover.1358782098.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkKgFjIXgPI2bZasqwCoWGMHzoA44t5unwZdtbUtXxolzZJVY2a563iei4nUNV42YwvZCSshCmrELhqm1Bgeo+/PTo4OOk58Jfr4wpc0BXUEoKMUT0IfaQF5p2bS+1cBMBLqjuum1y+lz1D4GKhDN8KCY/0sq6ckRF4f+9mEOimzxhurHVSjcHkKh9wDPebFxwIPFC2
Subject: [PATCH 2/2] packagegroup-sdk-gmae: remove GUPnP stack as it's no longer in oe-core
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
X-List-Received-Date: Mon, 21 Jan 2013 15:47:06 -0000
X-List-Received-Date: Mon, 21 Jan 2013 15:47:06 -0000

GUPnP is now in meta-multimedia, so remove it from this SDK packagegroup.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
index 58bc05b..416e05d 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
+++ b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
@@ -10,10 +10,6 @@ SDK-GMAE = " \
     libxi-dev \
     libsqlite3-dev \
     gnome-desktop \
-    gssdp \
-    gupnp \
-    gupnp-av \
-    gupnp-tools \
     libart-lgpl \
     libtelepathy \
     pulseaudio \
-- 
1.7.10.4



