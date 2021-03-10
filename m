Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [])
 by mx.groups.io with SMTP id smtpd.web12.7524.1615376831624833368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 03:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: <nil>, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id E9/D2-03420-CB1B8406; Wed, 10 Mar 2021 11:47:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRortno0e
  CwbfDMhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a5hXNZC/o5K05MfcncwDiDo4uRi0NIYAaT
  xN2O52wQznFGiTVn9wI5nBxsApoSvVu2MHYxcnCICOhJXP0nChJmFlCXuLSuhQXEFhawkZi0t
  I8dxGYRUJV4eGQ3WJxXwEVi+tFtYGMkBBQkpjx8zwxicwq4SvTdvwJmCwHVvN2yghGiXlDi5M
  wnLBDzJSQOvnjBDNGrKDH7cjMLhF0psWfzQ9YJjPyzkLTMQtKygJFpFaNlUlFmekZJbmJmjq6
  hgYGuoaGxrrGuoaWJXmKVbqJeaqlucmpeSVEiUFYvsbxYr7gyNzknRS8vtWQTIzAgUwqZD+1g
  fPL6g94hRkkOJiVR3r4CjwQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryBS4BygkWp6akVaZk5w
  OiASUtw8CiJ8PZtAErzFhck5hZnpkOkTjEqSonzOgFjSkgAJJFRmgfXBovIS4yyUsK8jAwMDE
  I8BalFuZklqPKvGMU5GJWEeUVApvBk5pXATX8FtJgJaLGCgRvI4pJEhJRUA9NpFfVHSe1r3Np
  Xdd7VlTq8/tBynism0h6nxW9NWMG4PvPGZwuppdwXPE3dsy15JMt0l/3u+sJ6U55vlf6xQqfo
  VfYpFUe1Z8od2nO/4ti22b7+rdxvdZ3zN00Nvfq7sk/mtFKAaEe3Srj3I4FbfibzRHbPMYqe7
  pAf/HrHaQWGzNrvr9kfTrg8m6FoW7y1K4dC13SehSslC9p+5y3ke/GRw7nOlePP0ncNJlf6D7
  EfuTMjtmz2oe7w6QyJH3uOh7DcWyFksD53mruK/JmtUw/a3K7Ql5bjrQ08cGHWvNW2C5+W/Wf
  rezzpz/ScV/6X1N5FuPobVjzqyRbZnNTe6/Noy5e5DLNUX604/PZxwislluKMREMt5qLiRACt
  lNjlQwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-226.messagelabs.com!1615376827!95626!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32437 invoked from network); 10 Mar 2021 11:47:08 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-21.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2021 11:47:08 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ABl2kY024118
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 11:47:07 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Mar 2021 11:47:00 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] gnu-efi: upgrade 3.0.12 -> 3.0.13
Date: Wed, 10 Mar 2021 19:46:03 +0800
Message-ID: <1615376771-3093-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615376771-3093-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1615376771-3093-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gnu-efi/{gnu-efi_3.0.12.bb => gnu-efi_3.0.13.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.12.bb => gnu-efi_3.0.13.bb} (95%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.13.bb
similarity index 95%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.13.bb
index d27126603f..6b8b910946 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.13.bb
@@ -19,8 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
            file://gnu-efi-3.0.9-fix-clang-build.patch \
            "
 
-SRC_URI[md5sum] = "926763ff37bc9db3a9035cec41eb2f45"
-SRC_URI[sha256sum] = "0196f2e1fd3c334b66e610a608a0e59233474c7a01bec7bc53989639aa327669"
+SRC_URI[md5sum] = "8ec4221f505c78e6fc375c2fd7f0c549"
+SRC_URI[sha256sum] = "2fccf715279c46ee69c4859186af8150d07a13f4d19876e5459cd65be82d3b7d"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.25.1

