Return-Path: <twoerner@gmail.com>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9E5EA7F7B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 03:13:21 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id a194so7207149qkg.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 20:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bJf8cmHpd56urQN6fruMEJpVyaWUZ1GfFdeah/5fyFk=;
	b=sCg64EGYXb4rkvD4E7buXV/kC6LkklQn5mHcKp4+K+8UCnQ1g5yEem5kyBCf78S6jJ
	1lHx+WriJrq9IBpsy42dFa7/i5ilpEzt8p6nvsmvAQt5eEDVRamXpr7MEdNeSX9z7svq
	nNZnlYZ132JGG0Tm3XfutaJyfcLPuwlFU8wK4h2CV+FZnL/fnNngT6q3YIaRq1bgcuq+
	KLlffLwF5BDPaVXaXqKyR8i9QTkEj+vjeOjkkZTtUH2nAerIxxq/CFPuPO/JD3MOv3Oi
	23QUhnkUJZWhHuA+a6RoJ5WXJTKJr+j9KJg17pgfPruOQ0xgomlBoWzrtuZckh5XxElE
	R2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bJf8cmHpd56urQN6fruMEJpVyaWUZ1GfFdeah/5fyFk=;
	b=hDJKAkLYn8+c0wyOqbqWuNh4kVfyfcWqsDsYBloa67cxlSZMXgb9vScRDgMo84JoGL
	byeRot3FMRo/FscFtWZa+TZxRtvrSdkdoGOLCvyg5GmPa3zJeCUFjHuXV08mM+qzUufk
	0U5IceUFXL/1OOLcWJsK9atClmwALOz4nMkX2vazFJMN/ALCL8J1/oQV/F0PBmCj6Jdi
	CelFzOHOIoW9iLFET6KPKj5oq8cLri9AtiVYIDj0KqrEwsf2bSeC5fAKVDMAuRrLnLRG
	tvGbMlY8eu9gFIzTuCHOW1T+biMHuQ//gAVxUorcrbO70rgNXo9ALbn9LaJYqQfbnFBH
	ptnA==
X-Gm-Message-State: APjAAAWkOnAigVypKQEEPzsWPjqAluHilII/NKlfwi6BcHxRs9p+nXJi
	mWWpgMtoygagL85Vg17VwZmXFi4e
X-Google-Smtp-Source: APXvYqy97zGyD7PjX4rvwpiZ2VxpQyUePVWRiF10UL0a8e9ImwL0t/MAH7LVGeundcancY+7tdG1vw==
X-Received: by 2002:a37:6189:: with SMTP id
	v131mr13169144qkb.489.1572232402067; 
	Sun, 27 Oct 2019 20:13:22 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	x12sm4855755qtm.32.2019.10.27.20.13.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Oct 2019 20:13:21 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Oct 2019 23:13:13 -0400
Message-Id: <20191028031313.2405-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.23.0.37.g745f681289
MIME-Version: 1.0
Subject: [PATCH v2] libcap-ng: undefined reference to `pthread_atfork'
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
X-List-Received-Date: Mon, 28 Oct 2019 03:13:21 -0000
Content-Transfer-Encoding: 8bit

Some hosts need -pthread in order to link properly (e.g. openSUSE 15.1).

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes from v1:
	- replaced "-lpthread" with "-pthread"

 meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
index 6e6de45494..a9a046571f 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng_0.7.10.bb
@@ -3,6 +3,7 @@ require libcap-ng.inc
 inherit lib_package autotools
 
 EXTRA_OECONF += "--without-python --without-python3"
+LDFLAGS_append_class-native = " -pthread"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.23.0.37.g745f681289


