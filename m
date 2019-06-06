Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1536D52B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 22:17:33 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id h19so2777881wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 15:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oDHwZ2Ioud8VKeQhOtINbFX66UZMttQFSpDEnDJ5Buo=;
	b=fEj8zBuvRckWft754uAg+a/HjRnn2yXSpPQXidP7BmBMmeSxS8AuTZJ5ul/r9rsAQM
	NHExM3Mrm513UVAYZiOR3EgvTaRAzMcqB4I3AKDq0Z13sfUR1JnFUBczfnh67Gmxv/fD
	7CcnQmggpZXlnP6yRWxila6uKioHN4twITMUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oDHwZ2Ioud8VKeQhOtINbFX66UZMttQFSpDEnDJ5Buo=;
	b=sDkuNNHckh8pOfP/bXzOkmxl6GJU/pQaDaZDy7WViVlGPofYD67i5qWtYUzWzPdvoU
	4VcUSIqhzL+cZZxrZOsPj+y0WmsMsNZNs8YZaPhc89Xj000frVXk+/vvYAryDTDZDOXr
	owZ/iEv9O/SsXd/0B3Rw8j8kVs+g6OQdnmzJywf/lATyybxzgEmyIT+4S0Q5dnucONxW
	10/O4in1lK6AISCCYwe3Nx3waWqDw+LS0YzoMTvF5GCBbm6TKg9JpShOt/aXQwCTFc2M
	0kj9Eq3Qbs4n7p0b1w7Nj1XOHXpUJeExONbtm8dIFPPjDF98kokjV1MKziosjundkTbj
	pR0A==
X-Gm-Message-State: APjAAAUSWaYcRF5EqWKyMiGiDDjGEcKgraOPUxhEjA2e916Eyx+3GScb
	//hu41kdZWEGB1llipPmL0YOnJUTGhs=
X-Google-Smtp-Source: APXvYqzkkhJgBO8y/WCRqVXQCFC1aqn9l7CxTOB30tOi4hC7hW67VbX7B6aHda0QKiUtjRtYQI3N8w==
X-Received: by 2002:a7b:cae9:: with SMTP id t9mr1424121wml.126.1559859453583; 
	Thu, 06 Jun 2019 15:17:33 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w185sm156667wma.39.2019.06.06.15.17.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 06 Jun 2019 15:17:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2019 23:17:29 +0100
Message-Id: <20190606221730.19043-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] openssh: Add missing ptest dependency on coreutils
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
X-List-Received-Date: Thu, 06 Jun 2019 22:17:33 -0000
Content-Transfer-Encoding: 8bit

This fixes the openssh tests in minimal images since they use options
not present in the busybox versions of the commands.

[YOCTO #13295]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh_8.0p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
index 39848ea98b7..3e99dfa5754 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
@@ -145,7 +145,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 RRECOMMENDS_${PN}-sshd_append_class-target = " rng-tools"
-RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo"
+RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
 
 RPROVIDES_${PN}-ssh = "ssh"
 RPROVIDES_${PN}-sshd = "sshd"
-- 
2.20.1


