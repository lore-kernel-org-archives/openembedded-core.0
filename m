Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.3996.1618541531006464325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 19:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yuA/VYiS;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618541528; i=@fujitsu.com;
	bh=WvAE464L4BWFBLfHkMdqF4KrNdLXYISzRWzZYQeKzBw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yuA/VYiSyVx7TZdvLbsCKD3b2I1nl0iJBCoJ+dR3i+G3Aw3OA5nTqEoEkkZt1+Kw2
	 0uuj1HqMTFkEOJjXy+7WHgYyF+nAJmKFaw/WtixJtpIPES6PozzgOz0wczVk+MCSTA
	 spqSr/kKpVbEJUMaB9rRhvoYRosy0OQHmMp5ugiAOmpqSyH9MWL5uRw8phux/vxpo5
	 xM5k+hVBPUNPNcBvST2GQmpgp+EDREYZ7M+eR4Wms5Wvrcv6yZUoV4MBBFle9Co/EA
	 hPplN7D/rm0DQnspUxkuGVadvZzeax77wPkDkqnUQj0nJnpwjzuEmtL2xVnAO5ToCD
	 O5Wjmi75yr6qQ==
Received: from [100.113.6.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id FF/82-38008-8DBF8706; Fri, 16 Apr 2021 02:52:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRqnv9d0W
  CwbVJNhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bXpaesBW2cFff3PGJqYFzL0cXIxSEkMItJ
  4vvMZywQzm5Gif83Whm7GDk52AR0Jc49XsvexcjBISKgJ3H1nyhIWFjATeL07n9sIDaLgKrEk
  b2rWEFsXgEPicYNR8FsCQEFiSkP3zNDxAUlTs58wgJiMwtISBx88YIZZKSEgKLE7OnyEOWVEt
  unnWWcwMgzC0nHLCQdCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa65rpWpjrJVbpJumlluomp+a
  VFCUCJfUSy4v1iitzk3NS9PJSSzYxAoMopZAtfAfjmdcf9A4xSnIwKYnyHlpRliDEl5SfUpmR
  WJwRX1Sak1p8iFGGg0NJgnfBz4oEIcGi1PTUirTMHGBAw6QlOHiURHhf/gJK8xYXJOYWZ6ZDp
  E4x6nJcWbVkEbMQS15+XqqUOO8KkCIBkKKM0jy4EbDousQoKyXMy8jAwCDEU5BalJtZgir/il
  Gcg1FJmLcUZApPZl4J3KZXQEcwAR1RsaoU5IiSRISUVAMTw74HVvlKNhca7nQoC100XDzl/LO
  COcJamYubz15IuaA5o1NoU/LESVp3vOTldXwPpc6pnPF07d7lvU4zzrquaDK/kxxx/WSpdVoy
  S20jd0V+GLPQ59u6Px7bGm1zL38/f+eNvCexeotWC87kUIuL6ratS+GOPPhG9N/mtd9/xT5Pv
  Lo4bNnMr/G1j5X9I/rWHTW2PnJ8bnjh5Kw9MtXz9ym/5mrl3Cn34rmNwCKnKpe/8e83/bnwdK
  KUf4to7houxaLt7cXmBxRezr7y33Ri+XHvJpE/rTYSZX2/0s/2rfeJjtAOj9K/zfcs7w/7hBO
  bLYv2PnC2fqrQc/2hf33QqaudzRUM0qapcQLcdXuVWIozEg21mIuKEwHVOrunKQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-238.messagelabs.com!1618541527!2550732!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20912 invoked from network); 16 Apr 2021 02:52:07 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-15.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Apr 2021 02:52:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13G2pxG5012084
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Apr 2021 03:52:07 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Apr 2021 03:51:58 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-pygobject: upgrade 3.38.0 -> 3.40.1
Date: Fri, 16 Apr 2021 19:23:46 +0800
Message-ID: <1618572226-69259-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-pygobject_3.38.0.bb => python3-pygobject_3.40.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.38.0.bb => python3-pygobject_3.40.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.40.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.40.1.bb
index 8df3150e37..f5679a4ba2 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.40.1.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
-SRC_URI[sha256sum] = "0372d1bb9122fc19f500a249b1f38c2bb67485000f5887497b4b205b3e7084d5"
+SRC_URI[sha256sum] = "00c6d591f4cb40c335ab1fd3e8c17869ba15cfda54416fe363290af766790035"
 
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
-- 
2.25.1

