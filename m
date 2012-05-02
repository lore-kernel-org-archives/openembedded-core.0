Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPaFU-0007Yj-VN
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 16:09:45 +0200
Received: by eaae1 with SMTP id e1so153728eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 07:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=C0M+m7gP6FWvEeURXb0vHpNvp/lntfpAA7oTbDSc3VI=;
	b=mLAUGkY8bS56CCjOdCYtp1reRW3SKUZo9eGEWCkmzHzXDm1dB+vyDW7rHDVBkbtDYd
	0rw1oh+A17KhIzXEfOOu4b+1SHN+53OGbizrUYRC74pFfjPFA9RuHaX0+0oVXdGXM5iu
	ZJlWsWZ7Lwu7g6zp014bGnG5C6GmLUQh7DHkiCVStCHY+E4cwYhtYcRz5oSdyTOlnfrP
	sEN13Fkne+UF4/o942OjE9yBWIYqc6vL/awrOzoiXk+icbm1Oi8DgcDn9iT1WDGoDSFZ
	TEUoMXF9VWFVY9ikz95KXPWFYmzfdXdHeKKEP+9cPskewcREtwYSqoQjW0ssG6ZZK6n5
	jSlA==
Received: by 10.204.152.75 with SMTP id f11mr9824005bkw.136.1335967200630;
	Wed, 02 May 2012 07:00:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z14sm4055100bky.15.2012.05.02.06.59.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 06:59:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 15:59:45 +0200
Message-Id: <eec6dc7f29ff7e5297e2827196cc81ffd9a76831.1335967122.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335967122.git.Martin.Jansa@gmail.com>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335967122.git.Martin.Jansa@gmail.com>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] site/arm-common: alignment values for guin32, guin64 and unsigned long
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2012 14:09:45 -0000

From: Tomas Frydrych <tomas@sleepfive.com>

These are required to build recent versions of glib-2.0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/site/arm-common |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index c3ffe08..cad8027 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -76,6 +76,9 @@ glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
 glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
 glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
 glib_cv_sys_use_pid_niceness_surrogate=${glib_cv_sys_use_pid_niceness_surrogate=yes}
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=4
 
 #gstreamer
 as_cv_unaligned_access=${as_cv_unaligned_access=no}
-- 
1.7.8.6



