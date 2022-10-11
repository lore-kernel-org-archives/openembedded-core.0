Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EA8C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 07:58:39 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.4799.1665475114275119906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 00:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oO7XL36c;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665475112; i=@fujitsu.com;
	bh=JF2+JwsD8eaDHNWjNIH8RSglmBUDfsRN/kamxukrO2s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oO7XL36c++LbiWarvsBJWAIfUeK8rjFiSjzt5Fbpm1sm0dpTqM9xOKk2KxbjEzw9W
	 6HMlrTjTcSlNHxkY5C7rhlA0bnb9RRKRS3LGWuFa489SllkiAxgBRoF0SYO6MRsvhR
	 F+rQUoyfnpXQgkX2xshiu779JS/zc6xu2QC9VXGGzSXqnOSsXvuoXZRORZ/PAXWU/r
	 qkNqOKxG00V5lDb98qM9WioV052evb2VLE11qT1H/WUR13cthu7WSY7YmYoI967GjQ
	 SaYwlLvTp1c4RGcmKAQdPhydU3ZFcTk/oRLdlgwgtRy871Eqhqp9Q3KWDcEA7eGwdj
	 Cmew/u/hFnPxA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxSVddyTX
  Z4Od6fYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPGk6iCEwIVP/bdYWlg3MbXxcjFISTwmFFi
  79L1bBDONSaJRzcXMEM4exgl1i2/AZTh5GATUJOYfusGaxcjB4eIgJ7E1X+iIGFmARWJF7972
  EFsYQFLiRuTZrOA2CwCqhJ3zl8Gs3kFnCS2/1gOViMhoCAx5eF7Zoi4oMTJmU9YIOZISBx88Y
  IZokZRYvblZhYIu0Ji1qw2JghbTeLquU3MExj5ZyFpn4WkfQEj0ypGm6SizPSMktzEzBxdQwM
  DXUNDU11LM11DS2O9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwUvbzUkk2MwLBMKU44
  uINxxb5feocYJTmYlER5rz53SRbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwXtc3jVZSLAoNT21I
  i0zBxgjMGkJDh4lEd4eKaA0b3FBYm5xZjpE6hSjLsfMr20HmIVY8vLzUqXEeWUVgYoEQIoySv
  PgRsDi9RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd48OaApPJl5JXCbXgEdwQR0xMmrTiB
  HlCQipKQamOy815pO3JBdNfOg0t9PtneE5Q5ffLx1g8DPa2rdbXOiYgoYLs/5Z+rvkpxeyCP/
  pcXK/NmtFxJuxhK96UmbamXdey++bvwRZHv1rqu8dPTJT8X8bsdctpZ9eVQx1fHr5Hytq/ZlK
  QcNZp1TMFbTO6RbzKTMfEBvsuqMsPXh21zzJv1mXZK3RvvaFxcPsfRj66vbdt7tDr37SYzLgX
  9264qnc5c+8mn9e1PlxmWdgOmLih9+cmGccNFD6mONt53F8V9/F06ILu9o5soM17vG4OUQ0sz
  lJRG18rm60Ka7t0KX8svkBp65eT0zrlJc7OEmxTLep9FG3AcX/ZJz3Fy0/b5feNfcSx4be65y
  myddVWIpzkg01GIuKk4EAFYX0jBSAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-745.messagelabs.com!1665475111!97459!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1286 invoked from network); 11 Oct 2022 07:58:31 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 07:58:31 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 354C21000EE
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 08:58:31 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 28B331000E9
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 08:58:31 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 08:58:29 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gnutls: upgrade 3.7.7 -> 3.7.8
Date: Tue, 11 Oct 2022 15:58:10 +0800
Message-ID: <1665475094-16329-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 07:58:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171595

Changelog:
=========
** libgnutls: In FIPS140 mode, RSA signature verification is an approved
   operation if the key has modulus with known sizes (1024, 1280,
   1536, and 1792 bits), in addition to any modulus sizes larger than
   2048 bits, according to SP800-131A rev2.

** libgnutls: gnutls_session_channel_binding performs additional checks when
   GNUTLS_CB_TLS_EXPORTER is requested. According to RFC9622 4.2, the
   "tls-exporter" channel binding is only usable when the handshake is
   bound to a unique master secret (i.e., either TLS 1.3 or extended
   master secret extension is negotiated). Otherwise the function now
   returns error.

** libgnutls: usage of the following functions, which are designed to
   loosen restrictions imposed by allowlisting mode of configuration,
   has been additionally restricted. Invoking them is now only allowed
   if system-wide TLS priority string has not been initialized yet:
gnutls_digest_set_secure
gnutls_sign_set_secure
gnutls_sign_set_secure_for_certs
gnutls_protocol_set_enabled

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/gnutls/{gnutls_3.7.7.bb => gnutls_3.7.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.7.bb => gnutls_3.7.8.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.7.bb b/meta/recipes-support/gnutls/gnutls_3.7.8.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.7.7.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.8.bb
index 01fd4dba3d..f2e916fc4e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.7.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.8.bb
@@ -24,7 +24,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
            "
 
-SRC_URI[sha256sum] = "be9143d0d58eab64dba9b77114aaafac529b6c0d7e81de6bdf1c9b59027d2106"
+SRC_URI[sha256sum] = "c58ad39af0670efe6a8aee5e3a8b2331a1200418b64b7c51977fb396d4617114"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.25.1


