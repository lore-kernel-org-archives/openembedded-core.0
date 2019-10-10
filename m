Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id DA36A7F50D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 15:49:45 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x10so3938140pgi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 08:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XcOancrhepmhoCwcUI4lujiuE1xxfe3NajkiNt6NWnk=;
	b=sDAi4iFQ5og5GHikBAzO4d3amkKZQ2UU1GLHDgJoitWBUh4v9uOqE3bCzS7zixaI4h
	1S8995ok+tollTJ1U8SrJ49zZlJ+ICesQ5uPqVBzHEtWnvjoke4jYXmH8Kbw/zztS72Z
	bqW9bQF6dHtMcdeoul7QGpB3jbFR8SvEjCc5CHj0dAMjW0dME/B7JMVKpZtgcEEa5M0X
	XQfY5ni75Fr4Px3cGjnu4k/NEwn0o2Lx9Lc+U6PkJeJUQrOdchXMQ/eqfBOZ/H9gjB7p
	9DPEwLB8QBR20Mmi2ErfU/fo4kvqLT9qkbFrTrD6oRtUPVkMOxKoh+2DiOXjGoNAASv0
	Z1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XcOancrhepmhoCwcUI4lujiuE1xxfe3NajkiNt6NWnk=;
	b=bEBbxL0UWHOJuHtIcrPxXjChTBF7mt3KTIZV0lq5oisFju9X5sjOsfWfJnM8H7e/Ma
	RIn/mFNHPI6lFQCEDya5iOTmxHc7rMiMQe2auqdXpHjxYMgElfDnIYcXtvkZPLGCRYcl
	63vHvp/4WdhnFxyeSox3etubIIom6n8otUv4o/RiJ1RABxnqP75p+hbUnp2I453cVViP
	98aQ+5NPLMu50UoobnaEhqvMRnueGcyoiNrzsL5N9DEK8Auavv8AqE6JYMIfkx2sizSD
	CFu7Z7B9xFg/PpAT3t8x0dechzdNkSNU4fRVct3A630g/2R09h+i2+pnPrwf8X/7mFGT
	uweg==
X-Gm-Message-State: APjAAAWHckb+IjgW519oQ6YXn1psu4HyTKnE2G3MxuSXwlHTv/ZxR9Dc
	hMuAwiGtcaakMvv744/V4glC8u42
X-Google-Smtp-Source: APXvYqy1tH+GpZ4bbr/wiCcOJCuTUL/bXabfIzL+U8BVXOsErvd17aiz0iIp2/xM61WG8zoJo1Nffw==
X-Received: by 2002:aa7:9538:: with SMTP id c24mr11501494pfp.8.1570722586799; 
	Thu, 10 Oct 2019 08:49:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ac6d:f6a6:e34b:c619])
	by smtp.gmail.com with ESMTPSA id
	m26sm9872552pgn.71.2019.10.10.08.49.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Oct 2019 08:49:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 08:49:24 -0700
Message-Id: <e6728a873f1eef335a9e21bdface304f13f0c952.1570722439.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570722439.git.akuster808@gmail.com>
References: <cover.1570722439.git.akuster808@gmail.com>
Subject: [thud 12/12] uninative: Update to 2.7 release
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
X-List-Received-Date: Thu, 10 Oct 2019 15:49:46 -0000

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


