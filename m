Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6BDF165C9F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 15:54:00 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ex7so28485111wid.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 07:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=eSgkMdZLCExpzyitSIds1a4JkWhUJQbh3m/DWe42tQU=;
	b=iflzyxSbDqnjaXcUhkiXbjrEVB+CmPgtDKQ2MCSeW/TZCojsntX5XE1z/xS0ZsgH3/
	No8Edko9GncuwzBy+kbFU3tWU/yxvLg9H7fNLkmtTScCxiCjW3coK2qtlLbnHAEiBeMW
	5gJwaWzoYRzqSphLVWtHl5CScTHik1Q0K5N1jASs0WcfFUpTdICM1NumJV4I4qOa5g3V
	saWVuS/OhQOmBYaoTG5xlS8ue3v58iFmzzPj4TDKMGlKYuFfKD9mskmSpQXPImq6QGsi
	Rdthh8UOfA5aPzV7+naZkseLXrQBhcLscYC4nZpsPWnAkkTSMeYsK42z/97zCO3Db8zw
	/YuA==
X-Gm-Message-State: ALoCoQnVSLoQzpEFqEkyH0iD3qKhDWmehI5Lls3xZ+WJQ2R+8jo+aCZV6zATV252s+OJkg+PPOq+
X-Received: by 10.180.11.97 with SMTP id p1mr6462827wib.22.1417535640913;
	Tue, 02 Dec 2014 07:54:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id j2sm32437034wjs.28.2014.12.02.07.53.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Dec 2014 07:54:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 15:53:26 +0000
Message-Id: <ed5b853fc4626afabcad8171f478893d5fb438f5.1417535164.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1417535164.git.ross.burton@intel.com>
References: <cover.1417535164.git.ross.burton@intel.com>
In-Reply-To: <cover.1417535164.git.ross.burton@intel.com>
References: <cover.1417535164.git.ross.burton@intel.com>
Subject: [PATCH 4/4] bitbake: set libexecdir to prefix/libexec
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
X-List-Received-Date: Tue, 02 Dec 2014 15:54:00 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0ccaac0..a3a8988 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -38,7 +38,7 @@ export systemd_unitdir = "/lib/systemd"
 export bindir = "${exec_prefix}/bin"
 export sbindir = "${exec_prefix}/sbin"
 export libdir = "${exec_prefix}/${baselib}"
-export libexecdir = "${libdir}/${BPN}"
+export libexecdir = "${exec_prefix}/libexec"
 export includedir = "${exec_prefix}/include"
 export oldincludedir = "${exec_prefix}/include"
 localedir = "${libdir}/locale"
@@ -52,7 +52,7 @@ bindir_native = "${prefix_native}/bin"
 sbindir_native = "${prefix_native}/sbin"
 includedir_native = "${prefix_native}/include"
 libdir_native = "${prefix_native}/lib"
-libexecdir_native = "${libdir_native}/${BPN}"
+libexecdir_native = "${prefix_native}/libexec"
 base_libdir_native = "/lib"
 datadir_native = "${prefix_native}/share"
 bindir_cross = "/bin"
-- 
1.7.10.4


