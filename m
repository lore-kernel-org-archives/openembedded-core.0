Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 50C7974D6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 13:06:59 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id h20-v6so15703084wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 06:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=CCJj/h6dculr+x3uAwVuUiO+BtUjwP10kmV0ex1R0v4=;
	b=pGmW1EuI63FC/JjC2o8GgzRWv6QnJ6yljc1xMT+zVldLR1FAX6M+21VP+bnm0QBbqG
	tXpDCUT5daI4rbq0RCiNLJNtYy6/uD53WOvBVlJ4oWVH4VFHPKhi5aGJayrnbrXLPK3h
	ZVmshIrf5+WLOEasL1IKhYuJTPnV04VKF66FPUBeETRTbcQIIc7J0QRH/PSOPE94kNlu
	SaKBGkkDN6dZ+W/wa42cqwIMskDUDg6ZMWNrG7BJChAXT6mKfK7iOvS1hSQxX0jXeHGl
	tDeOQq1lw4ecDb+Dy3CzAl6wW8NTo8qy5h67JMDyg/JLum0O1lQbW3DfhBncEsl+JbIj
	p69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=CCJj/h6dculr+x3uAwVuUiO+BtUjwP10kmV0ex1R0v4=;
	b=q+GvijN5W0Yn5cJENsFpjKYPYLF9Lac8cb//Zt+GJ+6A+VbqjDfI4/sUvawiZe8Jzm
	TAlkhuyQzy4K7RNN2sAnn5WOWedTnDCtzfirHcSXGNjDk6QR8qz3mPsNWNfpZINexv9W
	DtkDnSLo44G3HKvD7ARga/Ay7DK7MRdRILNy2IcaSTXhMnIrI+z5T/sxuxxpJ9732jXO
	xB9HVRznoW97i1iufkIWdLMkqfsNq+pIKXFY4n9GszVIdmy9M6XvMGmWsxkkNBpJ9yjA
	qiIavX6ecz6t6NBdEckESSQYEIoFyqbKxsQS15c3lJYHXzW3NHQRkuiTQbDZKVEHk890
	clag==
X-Gm-Message-State: AOUpUlGmO7ZzGZw8SS+A10bWV5cpkFXp6lfWDpwRnjDOQFcf8MxF0Rbg
	nu1tCrqtofxJwpfTp76DC6cco46e
X-Google-Smtp-Source: AAOMgpeo+enqOKYHM30I0krWInpN+ZUAooRd0wookYpVuEAcS5kEq0kzrgV1Y0mHi03mrJ9kDWaBiw==
X-Received: by 2002:a1c:d844:: with SMTP id
	p65-v6mr9683942wmg.64.1531746419713; 
	Mon, 16 Jul 2018 06:06:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t70-v6sm11629248wme.7.2018.07.16.06.06.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 06:06:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 14:06:57 +0100
Message-Id: <20180716130657.13712-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gnutls: use HTTP instead of FTP
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
X-List-Received-Date: Mon, 16 Jul 2018 13:06:59 -0000

HTTP is in general more reliable so use that in the SRC_URI.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 7bcb9133ad9..98ec8d9667b 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -17,7 +17,7 @@ DEPENDS_append_libc-musl = " argp-standalone"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
+SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
 
 inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
 
-- 
2.11.0


