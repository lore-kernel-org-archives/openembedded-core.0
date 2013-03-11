Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF7g9-000099-3j
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:42:34 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so4084881pbc.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 11:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=nxI9A4XZivd7+zTzK7IdFiDO0eKsWQodBxKlcuGex98=;
	b=WJK2XVWwZzyNN0cHGwCQuia1WJ2DF55CikFvD0kVm1QHK8pQUuQ//6IQpys5jEEgqm
	sYuPmfXkcmHtN6SxICtdS6Tuz5D23aJtu26l6dKPZ/LFDD9m+nadqTBO0ylDEjCZb8ln
	R05qgEFRmCXfTwn2NkaRqzP6Tvsg+dcTmy+ovIjvGTrTMB1vrm2VjQEBsxHMpFJ4m5o5
	3yupaIdSXVARN/O7vUFUSi3Q4MDUj7uepE58x5vtZMPbTSUoq9XRpVzXckDtt/L2V4EU
	+WAzCsTKiAMHI0JhnvxR57hkbaZtSYwS3kzH85La2vAbuX4ItL1C+yMrnGJwWHDwVCi2
	WPww==
X-Received: by 10.68.225.73 with SMTP id ri9mr30885944pbc.70.1363026353541;
	Mon, 11 Mar 2013 11:25:53 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id hu2sm21402014pbc.38.2013.03.11.11.25.33
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 11:25:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:24:53 -0700
Message-Id: <8aba674c794e26182cdd0a949632e2ffd739da24.1363025917.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmvwF9smD04MsDs8YVeJvpBYq5iycPwX4Ll4RNm9STwktnPeHJ7fCgt0tE+zghxS/1t88Br
Subject: [PATCH 10/12] systemd: set the location of the kill binary
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
X-List-Received-Date: Mon, 11 Mar 2013 18:42:43 -0000

Otherwise systemd uses AC_PROG_PATH and finds it in the sysroot, which won't
work on the target.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 5473666..e2bf415 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -64,6 +64,7 @@ EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
                  --disable-microhttpd \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
+                 ac_cv_path_KILL=${base_bindir}/kill \
                "
 # uclibc does not have NSS
 EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
-- 
1.7.10.4



