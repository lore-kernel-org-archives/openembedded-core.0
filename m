Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 308A26CF03
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 14:13:36 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id t60so3336418wes.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2013 07:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tJPYlsdDRFDS97LyVs016j+YIfomdNNjd9ncjpm7Jgg=;
	b=M1jBrVcvVVOdIUwxZp3S3e5WRjBRZgALPGe4QPGqM+LyqXR0xTzPRYCHOMovyLjBmL
	Kxc5Q7Yz5Q/ARBZz91hZzSuTmky4YuRaBrghfzWeZfPsLm0Afy9+JUuSJBGqhjxAhHni
	Isq10QKBhT1A3RHGwPYo32nziqY4EO7+YcX9Wyt/GoxpXPBCKTfSbgbsKLc2oA/60v+4
	oHjVNxt8yYZKyMC+6ZfLgukFBUNAFs1cLK3u2ECxgwR8We3Fv72n09zERIjmnVKJYvXs
	3WadttWc+Wr4vByLwT2L3bLmR7gJOVSKxpfEfZVSWEp5txeITniDGrzHV6REwW3mssqK
	zXxw==
X-Gm-Message-State: ALoCoQmtNrmDBalYCKvq3ZSCYjcHfbOQkKlnHAhPDSafha+GA24No8WdFv3fTJmINSlViNQQdfb9
X-Received: by 10.194.23.73 with SMTP id k9mr2079323wjf.24.1381241617532;
	Tue, 08 Oct 2013 07:13:37 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dq11sm5551459wid.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Oct 2013 07:13:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2013 15:13:23 +0100
Message-Id: <1381241603-29429-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381241603-29429-1-git-send-email-ross.burton@intel.com>
References: <1381241603-29429-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/4] libxt: remove unused configure option
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
X-List-Received-Date: Tue, 08 Oct 2013 14:13:36 -0000

--disable-install-makestrs was removed in 1.0.8, released back in 2010.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxt_1.1.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.1.4.bb b/meta/recipes-graphics/xorg-lib/libxt_1.1.4.bb
index c3373f4..9c1aaa4 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.1.4.bb
@@ -27,7 +27,7 @@ SRC_URI +=  "file://libxt_fix_for_x32.patch"
 
 BBCLASSEXTEND = "native"
 
-EXTRA_OECONF += "--disable-install-makestrs --disable-xkb"
+EXTRA_OECONF += "--disable-xkb"
 
 do_compile() {
 	(
-- 
1.7.10.4


