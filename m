Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 507EC700F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 15:17:15 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id o80so41656372wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 08:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FdATh9x0JckCn6ZKQarJZveGG48/yh0tBj3hQN9xmE0=;
	b=RGg3kjpxAUExPFjQji6i/CM5MpwGKzZICXCWLIlk/UU85eD4jQE29Z34ztXxKZD6ar
	+bBSzDeFaf43j3vpLSXjjEqnL1sGYtFWKBK6Aj+cdnx0fdIIghWYdBpftAHa815ahOS+
	UamrF6gc/g6ZzclXunAEJI2ryJoWrOIHV+ha5Y1wZnkZoOiYfUs7H149A/C2U5SIkgUX
	T0rw+X1yBPILkIKMYoazUQoc6P2T9h/DmGRUWNnrO54wHLNoQYyM9JCIMyfnK3oGW28v
	py1aQalcl2kktyDEH/TkKtqQvWF7T7/WsJSVDsc2JGwCt4VNvzNnH9dKMeul1dwwDhrU
	bdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FdATh9x0JckCn6ZKQarJZveGG48/yh0tBj3hQN9xmE0=;
	b=i3mDxt6U8cAqwVT+QJli8VUBzE4M4K3oTm1yIYuo3XcECGSOjAYS/PyZRB+Rc669G8
	ygnNcDn7tXRqtaHyqmfh2X16d209r49ui95DXDFw69573DTJKybFXrsgoSt2BXNOEtzi
	gtK1YEOV+0DaSZIMPPjb5jNQ3qsHj3Rm4IVMtQt6v58ZdBrP9BMxa5OUbjUvHb6jFFxx
	zY/Xg5LWIakq+9CFXMwWAzSBqKoWw4CQ3GIzfVEp3wU6svwg4tztPM5cVh884yeiiSP1
	91LJsTZYvsIPwtD5/Y4fF6Crsdjs0eEze120Fb8IpqsEywpqcwa0ntpvyexSjvDyIDZx
	qOiw==
X-Gm-Message-State: AEkoouvDPqGPT/ZuonO7FYTDCjouO6mqjMoNuNDekHgOlnKzJ2ha4z3/WOlcxHaQqLFZR6dW
X-Received: by 10.28.208.140 with SMTP id h134mr4191759wmg.101.1470410235306; 
	Fri, 05 Aug 2016 08:17:15 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	qe2sm18285249wjc.28.2016.08.05.08.17.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Aug 2016 08:17:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 16:17:08 +0100
Message-Id: <1470410231-21681-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1470410231-21681-1-git-send-email-ross.burton@intel.com>
References: <1470410231-21681-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/5] intltool: bump serial for aclocal --install
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
X-List-Received-Date: Fri, 05 Aug 2016 15:17:16 -0000

We modify this macro and need it to be used over local copies in tarballs.  It
appears that aclocal doesn't quite want to do the right thing just yet but
increase the version just in case it does in the future.

Upstream typically increments by one, and autoconf handles point versions fine,
so bump it by 0.1.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/intltool/intltool/remove-perl-check.patch | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/intltool/intltool/remove-perl-check.patch b/meta/recipes-devtools/intltool/intltool/remove-perl-check.patch
index bea0895..5f57ea3 100644
--- a/meta/recipes-devtools/intltool/intltool/remove-perl-check.patch
+++ b/meta/recipes-devtools/intltool/intltool/remove-perl-check.patch
@@ -12,6 +12,9 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 --- a/intltool.m4.orig	2013-07-02 11:22:23.000000000 -0700
 +++ b/intltool.m4	2013-07-02 11:22:32.000000000 -0700
+@@ -26,1 +26,1 @@ dnl IT_PROG_INTLTOOL([MINIMUM-VERSION], [no-xml])
+-# serial 42 IT_PROG_INTLTOOL
++# serial 42.1 IT_PROG_INTLTOOL
 @@ -131,27 +131,6 @@ if test -z "$xgversion" -o -z "$mmversio
      AC_MSG_ERROR([GNU gettext tools not found; required for intltool])
  fi
-- 
2.8.1


