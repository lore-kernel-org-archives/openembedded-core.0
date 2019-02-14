Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C74C7C4A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 15:05:28 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q1so6828339wrp.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 07:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=xCAEjuHlXY+KgupF+/4F8gih5goXHBtBZXj7hAjrTME=;
	b=mGnZrYe5CYe0vdARwiwPBf+dYlyvUPBrNbkUNhl7o+FGisBpMdgwiOzEvay2rCbA21
	jAgIhaq1l3WOKPXTkV6dPmYC+/35rsLJIlG2eTXpGtY98Ro3H59jGzeqQ/jT3xY0nwEx
	whrl/OKlSJJmfSgq8WJXOYOngqC+XH1iZHCGdGs8T9wyWzyIRYvVYUAumr3IFEk+pcex
	QZyuIPrSSQF+77aWXZnrltVM10akNrzM7PSMysxACgz2E4uuXyWWj4GoIhQzACUoO0Pq
	XsVTnDGgTddq/LE/WIGsYA5KWWNh9y4myWXPWxR0Cckzmos5RW7X8ikh5UI1GV/6hCiM
	qYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xCAEjuHlXY+KgupF+/4F8gih5goXHBtBZXj7hAjrTME=;
	b=EaU5fU5lUBopA3vq8MjbvMhNYuGwroRMUIXaGpoN5gEHtLN7xAUAUpuYVevCmHJ7V5
	10qTkWa+JJDzv4/g9dtMS17yfONJKzCcM1o0x14HSjg5XHadAjtxWGkDeR88OmDmaHfW
	JGQ2b+ZptORVLWTej2JhmUuhL79uMhow8TeEgSfH1FN2MRQxGV/yedsXMKP4HxS378eh
	azH+2l1+VQLCn/tjG6yWfEAfcpC/LcSIrShR9vtoYV4KaU6CCKoK9l1yQG1pHOBEzekK
	64zSSitH1BywPSzj2CVqbIaPS5pq0MRGJTHykgBaOdc/LypE3zRWmNzSACHxpSxp8Cco
	rPPA==
X-Gm-Message-State: AHQUAuagrFXdmened5OIE8jQ6DN4WCkXN79h+iMiFh889RJrXxQht48+
	E0opTm12YINNUq3brNjkozUeo/qPQ0U=
X-Google-Smtp-Source: AHgI3Iam1VESBGGEXxTnKzR7Jv0zq2j4WyUXgT1O6JT6+OTDkFEEjxiJjGdzBaZQ3yXLe0rdRFl7OA==
X-Received: by 2002:adf:f4c8:: with SMTP id h8mr3449250wrp.6.1550156728742;
	Thu, 14 Feb 2019 07:05:28 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h17sm1769264wmb.29.2019.02.14.07.05.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 07:05:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2019 15:05:26 +0000
Message-Id: <20190214150526.5401-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] default-distrovars: set CONNECTIVITY_CHECK_URIS
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
X-List-Received-Date: Thu, 14 Feb 2019 15:05:28 -0000

Connectivity checking is useful, so set a default value of https://example.com/.
This checks both that we have connectivity and HTTPS makes it through any
proxies.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-distrovars.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index f5ec6cef91e..76edff64800 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -52,3 +52,9 @@ ARCH_DEFAULT_KERNELIMAGETYPE_x86 = "bzImage"
 ARCH_DEFAULT_KERNELIMAGETYPE_x86-64 = "bzImage"
 KERNEL_IMAGETYPE ??= "${ARCH_DEFAULT_KERNELIMAGETYPE}"
 KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
+
+# The CONNECTIVITY_CHECK_URIS are used to test whether we can succesfully
+# fetch from the network (and warn you if not). To disable the test set
+# the variable to be empty.
+# Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master
+CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
-- 
2.11.0


