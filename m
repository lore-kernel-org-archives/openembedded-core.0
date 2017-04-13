Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 28BBE77E4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 15:45:27 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d79so13315774wmi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 08:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p44W75BTECCD+ZA/+uxJXoeRdmGaUfejML2F4rltrYE=;
	b=J433SkMchXgrHJAxjzyoSwdWiWfsod6hMC1PD3ezyUjmIU0TvfGHVKkXmrQu0xgOQD
	WEVGCc88xKQROqZhS+MHsxWh1Y0Ys3YMryDsTm4vhh06ojQDJp5d8a0xL6wkVFAUEJKG
	tH4qy0SIOuwxbx6wzAcM4ENp8IFsRUXRKxsWHIo3KcboLW7pEyBU4GX6S2jACAzmIrHS
	vl7JhcEZ0sOkImAwk3fG101SwE+81Kaylql9r1bENDG9/R8Qqi98Uy4QnUf1CNnJtV6I
	URl6a46WCHXlz+Semoq9kWuEopJM9fkXY7e9M4CzP7oPJuy5X+yvoUZxefDK6rxaBpkW
	Mq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p44W75BTECCD+ZA/+uxJXoeRdmGaUfejML2F4rltrYE=;
	b=sh+0FB7L9H+wU+0b4WGdl8o0AnEbOHXa1eHYUBkM90o1E4cVD4ALH9vGB+BLhsr0vf
	etiM1EdOQzz9FRRAWek+NR4XCCkU9vgWxVO7QixwxJVlczYMGexXYjFwyk/5lnkTciha
	O5IzB/iZ0PE43FmZzlqehJqoHLRqLboep4UzzYIBZrNGP/la/kZD9tNb4ZB1RV5CYLrg
	2mqJ4gS6WtrA58E9j0A7PrNotD7fVnqETqbslvfZ9qnx0uLPptum7eiFSyOAG9U5J3nD
	a5M9Mus/yxsfk9BhwpTg/ehxg2Y74InTFEccyLO0AKPA03Vh2qAlYzFdpXSn5MAGb2x4
	IvKA==
X-Gm-Message-State: AN3rC/4Qf4OebiPkTomanytU0Bw4KLG81uogeVEkdw1VpacwFjn7Qw5c
	flMCDXeOODusVsYH
X-Received: by 10.28.198.10 with SMTP id w10mr3828060wmf.1.1492098328401;
	Thu, 13 Apr 2017 08:45:28 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1051E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f105:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	w52sm30049522wrc.14.2017.04.13.08.45.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 08:45:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2017 17:44:53 +0200
Message-Id: <20170413154453.24792-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] bitbake.conf: add unzip to HOSTTOOLS
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
X-List-Received-Date: Thu, 13 Apr 2017 15:45:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes do_unpack for *.zip-files:

| /bin/sh: unzip: command not found

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index af3937a..1ea0dea 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -461,7 +461,7 @@ HOSTTOOLS += " \
     mktemp mv nm objcopy objdump od patch perl pod2man printf pwd python \
     python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sleep \
     sort split stat strings strip tail tar tee test touch tr true uname uniq \
-    wc wget which xargs \
+    unzip wc wget which xargs \
 "
 
 # Tools needed to run testimage runtime image testing
-- 
2.9.3


