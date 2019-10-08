Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2CA797F39A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:04:51 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id u12so8565126pls.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XcOancrhepmhoCwcUI4lujiuE1xxfe3NajkiNt6NWnk=;
	b=sIs0Zuj7lTZMFNYtbCp4ya27RyrjTzIe6o0kNjfTVlIi5esBR5S6/mgbFZnq5VwVT3
	700EoPbNlFESGjPrK6B6YHQPRF8zUd8/ArWHPaL1IsH1KyjA5Uom8yd2m4i5t+gtkgiq
	w+b2TcE2A/sSTWEV2GriHfJb1pXVxAVqn6TPqBvfIGV/9vek9MSgy3P81pOCaZYngAVg
	g5xbQmdmcRzUukMAylvyO6OMVA35EwAqgInsAGIQWGvZZwrZ2YUkynGTvtCsZXuwGBE6
	nYc/b1I18QeaALjcxpbpmBKNOJ18yTsjQGJ9Cpv6PXqNJZmTuMOpkVrkjfqnq+luL8dG
	l5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XcOancrhepmhoCwcUI4lujiuE1xxfe3NajkiNt6NWnk=;
	b=Blz7UeWgicHEGIA+5+JGq35boE1hkwyvhK8G5P6ljBgMArPySArTp/XH22MfBO6+JE
	xT11OUiQWz4/4DMzwKGTV+FOi8U4AULW1rH5n92P0gY6U7U1fvXBwSLuTJaf8whqbd15
	ZOan5sV6fIhTxP1BnWd3H2awyQxsAvNbulMw8hc2TG0RUspAlqIzeWHaSRl0FWQkgjid
	krpzX4K7uWCsqy5JLr21+SK9Qc2JVmviahQ210kIl0lW5xW3GxWqe3SstK9WDDAesiLh
	HJCM++mgdBhVlugObVDJUJsXDyhqPsv0TQw4a0xxXmrLgRJLwGQbEU5uRCFXa8F7vNoa
	r1Uw==
X-Gm-Message-State: APjAAAWoUy1avGGfGsG70v4Xyn1wgO9sBcD/6ImTMZmySAFX/khwMxxh
	EFQ7cMKGa28wQTVppUPhEg5vv8oPMKU=
X-Google-Smtp-Source: APXvYqy1F5ea/EwAprbkFyVuslfvzGyKVXlc1NfPTMM3MKQ1QDT9lJwCwz+5ef9DsRgH8S+9hTQb4w==
X-Received: by 2002:a17:902:9a45:: with SMTP id
	x5mr4315314plv.92.1570547093019; 
	Tue, 08 Oct 2019 08:04:53 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	a8sm17675579pfo.118.2019.10.08.08.04.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:04:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:04:37 -0700
Message-Id: <b6e17afc06d7a44dc9774ee98de7f186580ddf0d.1570546808.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570546808.git.akuster808@gmail.com>
References: <cover.1570546808.git.akuster808@gmail.com>
Subject: [warrior 10/10] uninative: Update to 2.7 release
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
X-List-Received-Date: Tue, 08 Oct 2019 15:04:52 -0000

From: Michael Halstead <mhalstead@linuxfoundation.org>

The 2.7 release updates glibc to version 2.30. Recently added to openSUSE
Tumbleweed and needed for Fedora Core 31.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index df24346..ad75d3e 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.29"
+UNINATIVE_MAXGLIBCVERSION = "2.30"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.6/"
-UNINATIVE_CHECKSUM[aarch64] ?= "a37118fc8b423f48146120707b81dd15017512c3e8ef9e6ca2cb3a033f4f4046"
-UNINATIVE_CHECKSUM[i686] ?= "3234fc3ded810225071f23a0e9a99f4f8c2480059945a848eff076ce78122ade"
-UNINATIVE_CHECKSUM[x86_64] ?= "133387753a9acf3e1b788103c59fac91e968e2ee331d7a4b9498e926ada7be57"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.7/"
+UNINATIVE_CHECKSUM[aarch64] ?= "e76a45886ee8a0b3904b761c17ac8ff91edf9811ee455f1832d10763ba794dfc"
+UNINATIVE_CHECKSUM[i686] ?= "810d027dfb1c7675226afbcec07808770516c969ee7378f6d8240281083f8924"
+UNINATIVE_CHECKSUM[x86_64] ?= "9498d8bba047499999a7310ac2576d0796461184965351a56f6d32c888a1f216"
-- 
2.7.4


