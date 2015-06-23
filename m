Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0358074056
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 14:35:23 +0000 (UTC)
Received: by wicnd19 with SMTP id nd19so108150164wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 07:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3pDZ1dAu7pX6HkgCiESg688q1x/sriIVKukIbJlIdM8=;
	b=R0D1vImtxg1j01A5L1nZq03xLiK1/Z7SP6BoHJji/NSYLg2mFBYBKUVPN3USnGnnnI
	OOc6zPkhKhbAPufIOHZr1dJVW0ZnJoFn4U9/CrML7Q9B4C9Dsj+6V1McsLV68xdRtha6
	dBp50ELZw5BJsv7OfatNDjr0kTHPNuwtf2xOBlc2lTALXmTJkb/VgPE4lI624Lam9Khc
	3Kj5b7O0dG6ptoCB81Z8KKPRtQz4LbpjuuNp4h0JwOOSYJjcCoSJA/oBdo0JJc3OMv1K
	9wEH+/gKhzqm5/HCf3kml8iEhjWxmqspS64wFwR1VqrvM0HimKToGCC6ta+0ysRh0I8C
	ZpWA==
X-Gm-Message-State: ALoCoQlYuUhw3fPN00oBaCAPwiWQaXlqwUyUwT6DeHUN2O8hyzOuUOUOuuXr8XZ8V0fQQhBHHFGy
X-Received: by 10.194.58.7 with SMTP id m7mr59466089wjq.109.1435070123705;
	Tue, 23 Jun 2015 07:35:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id z9sm12982900wiv.9.2015.06.23.07.35.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Jun 2015 07:35:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 15:30:04 +0100
Message-Id: <1435069807-13557-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
References: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/6] bitbake: set libexecdir to prefix/libexec
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
X-List-Received-Date: Tue, 23 Jun 2015 14:35:24 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d42cd55..97ae0ef 100644
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
2.1.4


