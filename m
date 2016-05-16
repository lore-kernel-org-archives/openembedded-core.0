Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC046018C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 09:42:26 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id n129so93984312wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 02:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=/FLLAJT7Kyj905u2K9EStDqVC9NH4IsdKZ4e5J+gNjw=;
	b=BwrvfecD2IoxuOwcdZl92X5X9APY0YVHxXVzH7hgz0gVgarr7hwCGbh4WFxte5PUzl
	+S8LZpV2MKMrLn79+4+l/LKcGshmuMxDpQRNBdkCN8/9OkuGKvsU/0pjfuvV83rBcdYH
	V3Ftbm1rj76OzM2oB4TaihH/T56XRaNmhILZNQtXPWyurGTaf9+a6kJBWMyUfvZSDtd9
	3+T4Q9338znqR3q5zjdSK+nB15CmFq3hmCv6EyVjE+kJ23jczmjW5WN7Co7iDSryOB1i
	ANxEbyoYO2YaPN9GaKHUjpwUB9xX+i8999qAqhrcHAPr7/oDCYL3dSjrhIgwJ0Dnc/KX
	reGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/FLLAJT7Kyj905u2K9EStDqVC9NH4IsdKZ4e5J+gNjw=;
	b=NFr9Yvx42LsHwC/5psBaOiIo5k4cL2ecxKsqQL2duQ6KOy4DALEyrtcxovtgj5TGgt
	9q4oT3WGuKnu0PInlQypnT8qPL3yK9wmKaHbtqQb2CT2x8+OOZU/8PgA1h4RriTFk6yH
	dlBOutpvXdSJcvfGfXnKwt2kBjLDs9XB4GdUQKx6bGSZ/M/FIn1KpwCkprPY6VfDri1Z
	p5KbOU3bBYaLyYm94Uf/oA32YyAHb7Q05abuL/hy3akP86BeRMDy0275lL6J019hdfLH
	qb1OqRcL91Xc/PzQigQ7NQh5M8hwvHTfFP6dKtOH8BAe9f2WG5XvZGsYct47up+p79ap
	QA2A==
X-Gm-Message-State: AOPr4FUDSlLiFiiOkNmbNVahn2QO3VoZkLV4y0/O2aXbWVXTbRR0p2sAl3glYKP3GPMGBDcE
X-Received: by 10.194.75.197 with SMTP id e5mr32559230wjw.154.1463391746911;
	Mon, 16 May 2016 02:42:26 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	y91sm17401486wmh.10.2016.05.16.02.42.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 May 2016 02:42:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 10:42:24 +0100
Message-Id: <1463391744-19130-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] openssh: change URI to http:
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
X-List-Received-Date: Mon, 16 May 2016 09:42:29 -0000

The OpenBSD FTP server isn't accepting connections from wget, which breaks
fetches.  Luckily they also have a HTTP server on the same host.

[ YOCTO #9628 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
index a5e06f5..162ea7e 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
 DEPENDS = "zlib openssl"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
+SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
            file://sshd_config \
            file://ssh_config \
            file://init \
-- 
2.8.0.rc3


