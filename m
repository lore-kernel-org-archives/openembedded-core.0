Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 99AA271A8E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 16:34:41 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id b12so3351058plm.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Dec 2017 08:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=O1LpsJigohIuvnpwlms7j2X6SlFHEYPbtmOkeMO1Xlk=;
	b=XMct5uV5FwULPTzoEv3Z+E3rUO7D4p43MHQnyff6xbOj7IYyEmy1kSQ5j+IUvwCdzM
	yh8hQjP+YKygWeanwXJffOw2XW9C6jyk662eMqzVHyaqma2TcsZTWfx8ef4ZTb/4SEh4
	g4kk07Kq8pcyQtkpd8CrEkqu4+dAs4c9OdUttFoABoJvDvlqa5mepNq2gtXSCq9V7vTV
	n0WWYS2xdHFeO35dNM5qiG5FDV4uFCO6mmdWssE4DK9LT1t8fNphDQ2kEB9HX+BS+nS6
	gb4BG/9MVwi/YRUbpvkif1CRQzQayUN09l0Aet4SHdxO8I1E5rMyWzkO30Loz9KEsKeS
	mSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=O1LpsJigohIuvnpwlms7j2X6SlFHEYPbtmOkeMO1Xlk=;
	b=Di49D7tPrvzMSx6GyuEEeV2foeYGWBZGTsc2LvUz/DRWACixNoYdY62wUOHlGicXew
	/wTgXYBCQro2/iHmqxhRvpV/Czuo/qYXR4j4UNv2fTLY/M3dC5kxgJX5oQPLU+deU2v0
	3xETXPySFiMB4imqmwRe7wuNjEFUE6tvfTNjmBHUOkA1Do3vQAW1VJWyyZahPtj8/mvd
	H28YdEP9gzPlFfFsc0VAgq+7I//l4k90qcNdL+mBWh6GK5HkE7yPD+ceVw0gclJrh3or
	qPv1yZboxvx8OTwNpY69Wr/PrQarBY5Ki4DqP2itndd3l2SIUv5ebH25SABelho2JBcT
	ySHw==
X-Gm-Message-State: AKGB3mKcdD2K2Foq0f2SmsQZvDcVBmk/kyfwJKKDCqQxY+MdBGU8sDKn
	fxNZvhZfMO9251yoBD2IxDU=
X-Google-Smtp-Source: ACJfBot9gqmIc/svoM370iL8v2XFAIP1yX9nD1upTpg0KtRlzeaSvBvCe0vNzfGAQLEqg2mgGBTe3A==
X-Received: by 10.84.174.4 with SMTP id q4mr20028529plb.306.1513528482860;
	Sun, 17 Dec 2017 08:34:42 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:35e6:5321:54f2:87e6])
	by smtp.gmail.com with ESMTPSA id
	t202sm18393035pgb.75.2017.12.17.08.34.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Dec 2017 08:34:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Dec 2017 08:34:30 -0800
Message-Id: <cca8d5a0cebcfe93f82c1e77571c3effe8e7a3fd.1513527416.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513527416.git.akuster@mvista.com>
References: <cover.1513527416.git.akuster@mvista.com>
Subject: [PATCH 1/8] nss: update to 3.34.1
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
X-List-Received-Date: Sun, 17 Dec 2017 16:34:41 -0000

From: Armin Kuster <akuster@mvista.com>

The following CA certificate was Re-Added. It was removed in NSS 3.34, but has been re-added with only the Email trust bit set. (bug 1418678)

CN = Certum CA, O=Unizeto Sp. z o.o.
SHA-256 Fingerprint: D8:E0:FE:BC:1D:B2:E3:8D:00:94:0F:37:D2:7D:41:34:4D:99:3E:73:4B:99:D5:65:6D:97:78:D4:D8:14:36:24

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/nss/{nss_3.34.bb => nss_3.34.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nss/{nss_3.34.bb => nss_3.34.1.bb} (98%)

diff --git a/meta/recipes-support/nss/nss_3.34.bb b/meta/recipes-support/nss/nss_3.34.1.bb
similarity index 98%
rename from meta/recipes-support/nss/nss_3.34.bb
rename to meta/recipes-support/nss/nss_3.34.1.bb
index 6243f0a..ae52a95 100644
--- a/meta/recipes-support/nss/nss_3.34.bb
+++ b/meta/recipes-support/nss/nss_3.34.1.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://Fix-compilation-for-X32.patch \
            "
 
-SRC_URI[md5sum] = "1e30b8e5b13b5b08bbc489c265948d82"
-SRC_URI[sha256sum] = "0d45954181373023c7cfc33e77c8c636d394ec7e55b93e059149ed7888652af5"
+SRC_URI[md5sum] = "5922468bb1c54e4c8067f153fcf467e5"
+SRC_URI[sha256sum] = "a3c15d367caf784f33d96dbafbdffc16a8e42fb8c8aedfce97bf92a9f918dda0"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4


