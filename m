Return-Path: <yaoxp@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 450C36CC37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 13:36:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,467,1378828800"; 
   d="scan'208";a="8715144"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 10 Oct 2013 21:33:02 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r9ADaIEA014289
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 21:36:18 +0800
Received: from G08FNSTD100620 ([10.167.226.76])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013101021341033-2154317 ;
	Thu, 10 Oct 2013 21:34:10 +0800 
From: "yaoxp" <yaoxp@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Oct 2013 21:36:14 +0800
Message-ID: <008a01cec5bd$b1797160$146c5420$@cn.fujitsu.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac7FuMMqqoLGy8lcQEu+cZcgDZ1keQ==
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/10/10 21:34:10,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/10/10 21:34:10,
	Serialize complete at 2013/10/10 21:34:10
Subject: [PATCH 1/1] cronie: build cronie with --with-syscrontab
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
X-List-Received-Date: Thu, 10 Oct 2013 13:36:23 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset="UTF-8"
Content-Language: zh-cn

Hi all,
=09
If build cronie without --with-syscrontab, the /etc/crontab will not =
work.

Signed-off-by: Yao Xinpan <yaoxp@cn.fujitsu.com>
---
 meta/recipes-extended/cronie/cronie_1.4.9.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/cronie/cronie_1.4.9.bb =
b/meta/recipes-extended/cronie/cronie_1.4.9.bb
index 7db0381..0fbb815 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.9.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.9.bb
@@ -34,7 +34,9 @@ SRC_URI[sha256sum] =3D =
"bd7f6f118460c452bd1217a24b80fd3c000425d3de28731b98354a81a2
 inherit autotools update-rc.d useradd

 EXTRA_OECONF +=3D "\
-                ${@base_contains('DISTRO_FEATURES', 'pam', =
'--with-pam', '--without-pam', d)}"
+                ${@base_contains('DISTRO_FEATURES', 'pam', =
'--with-pam', '--without-pam', d)} \
+                --with-syscrontab \
+                "

 INITSCRIPT_NAME =3D "crond"
 INITSCRIPT_PARAMS =3D "start 90 2 3 4 5 . stop 60 0 1 6 ."
--
1.7.1

-------------------------------------------
Yao Xinpan
TEL: 8559





