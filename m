Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id B592F7089E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 11:37:19 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so5411483wgh.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 04:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=03iwZOMYYMfBzOko0aw9c1T1qXjMtQqirA32rxGeJv4=;
	b=VW2k0J1bAX8WEgBz2IQGwyjSgClsk3Fp+BaMKM7m4HsRkWopJB2KP0s/pJKmEnrhAU
	6oD8Sh52gQh6hfXUwILDvMkAviCq37dcvGX5Bah9lvxuXWrViBqd79wGvV1b9HyFlA5X
	NahQHpkdouPwrBiIyF/gcmDjUd8rEcaU+eVjP8MfHxQm3OWRhHXmUG0EJ2F8BmcwxGcY
	VIUyK3INS3I3HJvNKzRQifWrVi0KMG7hrNa8gaKlMYd0YkYFklK8B+CT8oDVfZCVTe6o
	YlXFMTAyokUVxQzfaskeHQRHdretzz6wy7sHCb8HPbzej877W6Yn+WTwQW/TwHxO7ozJ
	waWw==
X-Received: by 10.194.7.167 with SMTP id k7mr30741801wja.11.1407497840330;
	Fri, 08 Aug 2014 04:37:20 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id qa2sm3670889wjc.45.2014.08.08.04.37.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Aug 2014 04:37:19 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 11:37:09 +0000
Message-Id: <1407497829-9330-3-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.0.3
In-Reply-To: <1407497829-9330-1-git-send-email-paul@paulbarker.me.uk>
References: <1407497829-9330-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 2/2] opkg: Add runtime dep on gnupg if 'gpg' is in PACAKGECONFIG
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
X-List-Received-Date: Fri, 08 Aug 2014 11:37:25 -0000

The 'opkg-key' utility requires gpg to manage the list of trusted keys. The
ability to verify package signatures is not much use without the ability to add
keys to the trusted list...

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index ba21d84..56c54b6 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -27,7 +27,7 @@ OPKGLIBDIR = "${target_localstatedir}/lib"
 
 PACKAGECONFIG ??= ""
 
-PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,gpgme libgpg-error"
+PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,gpgme libgpg-error,gnupg"
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
 PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
-- 
2.0.3


