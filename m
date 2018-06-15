Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4BA97753A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 07:52:37 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id v13-v6so8919050wrp.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 00:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=5jfaCxboNOOBGhwlcNDnnB/po2zvXoYHvGIv1e5qUis=;
	b=LdABiGTm3j7QOMoeHDsRhlK82xEkOyt2ieLYgA2hr7DLLPUqN3YQaLfhJBqSbIDyKm
	EIg5HiDKqe5iUZDAFfFc5RpPdJKnCXIQ2AMw3RBWkShx0mLi73h/hcNkQN8N2ESxEqqw
	Hur7TlqZh9jkA0NGUERLBzLdVrEF/DQUXlvlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5jfaCxboNOOBGhwlcNDnnB/po2zvXoYHvGIv1e5qUis=;
	b=Kd1FXNZGh4RlQqx6lVoxuapc2JVSQvef0LjT8JMrL22tWiRIdtr5PLYI4aMH7Buo+x
	6f497YDyfB/eLHldSlNaHPd8HsQX9poX5294eE4IKjN0KLneLqx4qgLIsyB+Wj/xNN48
	gk9Z7eIGdI/th4VlJF8dAaduv9eFmwe5dUug9EOVcGCUxdeiCssA9sEZcZGyBZkwInvp
	pCl5Ji+auI2lYJA5dfRHTArhTBghIGobH6C/uDKZz+sBa09WDhLOw44kP8aRLXZ2cDv3
	B43NleItb5pVUwLQ3tqHHhvUEg2xjXck29F2lD3nGiZwLvzGIw/Ne8epv5xUEKqkrCCM
	Sptw==
X-Gm-Message-State: APt69E2aQdiBOFz9gLj/rW1s114vrhrnM6hMRbW9RQSxi1GrANmaEMpW
	rnJlsYX4fMy6CRvGXC2XEk/9F2nd3Cw=
X-Google-Smtp-Source: ADUXVKJMD6/zWraW1UTVoBURR1ZvJUrujKznX2PnYhm+yPZpUxr3fQ8UU6BL8UpjmilobAOdRscErA==
X-Received: by 2002:adf:824e:: with SMTP id 72-v6mr639390wrb.127.1529049157611;
	Fri, 15 Jun 2018 00:52:37 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j131-v6sm1735924wmg.24.2018.06.15.00.52.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jun 2018 00:52:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 08:52:35 +0100
Message-Id: <20180615075235.4216-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] yocto-uninative: Update to version 2.1
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
X-List-Received-Date: Fri, 15 Jun 2018 07:52:37 -0000

This fixes issues with fontforge-native.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index a8e82cb5d75..dcd59f87ccc 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,6 +8,6 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.27"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.9/"
-UNINATIVE_CHECKSUM[i686] ?= "83a4f927da81d9889ef0cbe5c12cb782e21c6cc11e6155600b94ff0c99576dce"
-UNINATIVE_CHECKSUM[x86_64] ?= "c26622a1f27dbf5b25de986b11584b5c5b2f322d9eb367f705a744f58a5561ec"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.1/"
+UNINATIVE_CHECKSUM[i686] ?= "a90db17d8845ece764aaac19348cd78504c0e554cb998da39ebad03aeef76185"
+UNINATIVE_CHECKSUM[x86_64] ?= "d43555df8d5a056ef5b20c7d8e0287207974e09df1e969a3e19302c8b4ea6b4b"
-- 
2.17.1


