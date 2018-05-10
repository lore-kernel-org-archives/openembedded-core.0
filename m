Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC8A74FAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 03:08:33 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id j20-v6so345593pff.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 20:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2greyArRTQRLqkz72w8RZMQlSl5XeoRWNqkVG3c5VwY=;
	b=ERSpQTDq8Wce3vdZkt7JXe9E6qCRbNyfFcg4cmbr/s6W/HWjqiCx4LwDfAPvuynliu
	70h55Vxdks0vcmNvXXF2BxSgHDhoUf68HP9rYomKFy5/MB9P8yeP9cynl7Bu3tNE7lPd
	CL1d5vXgJURs78pYGCUvH1sykfdxYKPIDrN3NWjWySH2VQGO3uRkt2BMLzQlIwbsC7OJ
	ft1wLQLrjSlxZbt75Gz/tMfegRBc30Vcr2Gw54SLH5dQngPavGvFEpeqTObT7VJ2rGPS
	20uGRRRnDPhjC4lKA+3iLLX4m8WP821p9AHg1LlmXgnX5nyJCSG60HQT+igIL7YPuQX0
	zk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2greyArRTQRLqkz72w8RZMQlSl5XeoRWNqkVG3c5VwY=;
	b=mkU4OWvvrO+a+/QaNVpNTxDZEaOEaVGu6U7QXRKGb8aZb3XOp3sbs+23yKJ5upKTR2
	osb+IIfdLrUK+ho6yemVEctYInIvpeDgseetTblKjkbl5JzfSI34A7sVjREBo4Wn9+zn
	4dn+QqKtKjY8aR2btCTPuzlA6Y8ZMLgg/YnUIzD1kBNjrlCfKFC6VjEZzfqca6EWAIpW
	ECoaQku4JZgw0LNV9qV+VyVAYfKN/HoNq4AwW0+07nctBr0UVwsq1ToqsYCxILKG2yF/
	ZiQLuifcw80s3KIUoGftd4RjlqMsW4bQ0X2A+H0uyT+J/srXU0icC8d389coV7lP95pn
	2zUg==
X-Gm-Message-State: ALQs6tDDCmelge8OD4MD+zwv1x8dNWGILjAk9MyLQs6AbP0+kdUNLYc2
	XdxAC+qTsNVcPY8WJ+LrgovfwA==
X-Google-Smtp-Source: AB8JxZr9UQeTd+BJtPI3oXvLpPSmB3+8oqmH1Qltv4wNHOeLE/tF0/eiEyT+WSxd/NjppSMrEdogjA==
X-Received: by 10.98.232.1 with SMTP id c1mr46096770pfi.184.1525921714966;
	Wed, 09 May 2018 20:08:34 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	e5sm56940846pfk.28.2018.05.09.20.08.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 20:08:34 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 20:08:29 -0700
Message-Id: <1525921709-15085-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] security_flags.inc: drop obsolete comment
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
X-List-Received-Date: Thu, 10 May 2018 03:08:34 -0000

The last ARM specific over-ride was removed in:

  http://git.openembedded.org/openembedded-core/commit/?id=e93765ffb5718b0fce84f0b8123963176dea95e4

but the comment was accidentally left behind.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index d66dd57..e6eb811 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -33,7 +33,6 @@ SECURITY_CFLAGS_pn-libgcc_powerpc = ""
 GCCPIE_powerpc = ""
 GLIBCPIE_powerpc = ""
 
-# arm specific security flag issues
 SECURITY_CFLAGS_pn-glibc = ""
 SECURITY_CFLAGS_pn-glibc-initial = ""
 SECURITY_CFLAGS_pn-gcc-runtime = ""
@@ -43,7 +42,6 @@ SECURITY_CFLAGS_pn-grub-efi-native = ""
 SECURITY_CFLAGS_pn-grub-efi-x86-native = ""
 SECURITY_CFLAGS_pn-grub-efi-i586-native = ""
 SECURITY_CFLAGS_pn-grub-efi-x86-64-native = ""
-
 SECURITY_CFLAGS_pn-mkelfimage_x86 = ""
 
 SECURITY_CFLAGS_pn-valgrind = "${SECURITY_NOPIE_CFLAGS}"
-- 
1.9.1


