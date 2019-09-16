Return-Path: <armccurdy@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2F17F2AD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 19:24:40 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id t11so350130plo.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 12:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gy1ED/WkHWduV/FvJ8G6coa/QrLXSEIxyT9UM6Ih1R8=;
	b=QYflG/jtpSR1R+uPKX4S7qicenSpbXx37hpYQkcN0JESFhMW4w3xxvG8eXqP1uzLc/
	gFBuzXQt/phYA5eOn1u2ZKtZ4nVq3Vd6TM2OlvCLpWO4jQxGBTFkMMXrYW4F5UfIRrFE
	QvFBw3+rgwZywSU8o31cJNqlEn2KG6VJFjjuAeDDhCcQtjVB020WbAKnnoYOC+ef5t+/
	be26FL94tNxjPqsRpLUeGSaxAqBTcHls4ixVPsGCexOmJ/4A+MfydiHd5HBUszLxRulF
	dt7HhI2wr7uj/62hoeBLUrsi0pCE20TTstwKxdv3LkjuIeesUonY7w/W190uISi3KfW6
	Q6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gy1ED/WkHWduV/FvJ8G6coa/QrLXSEIxyT9UM6Ih1R8=;
	b=sgQxw2tddQO+q5CVmeKvpefHiJdM85sAUWyZJkkrCiVOAdwegdLC0PF0poVe12+cUS
	W0n7opM1F1b6I4Au/KYHWxXk/Ie4gYvaeWVmRmJwFi2dWq54JNiX6QFjXOcn9LFMyPnW
	DdgyMIfK5vM/qhOnYHN0YW/ZMEPat5ZKlih80PrSVCKx2Xgtd0E5Nnypgu/TMOvIzcn/
	F+uHGqAgKtMDVkkBcDiI9OjpqfAk9iLhO7QKhgWxRD1wlumftSVpmW0cPJ+QkvwM2D7P
	VtKFnXOmbqni8JWZhkSMycGudREAYCcRNiibVK2X4BtfKag+S8y4J7iHXUxMoChtcslG
	DidQ==
X-Gm-Message-State: APjAAAVJ+xE1Jh+Y7Qc1Qa8b1+uGqciHl7Tt7ktS0cihawLRz/qhqHli
	Nhoee6hzlZP+nJIQAAkmg/2O4zZT
X-Google-Smtp-Source: APXvYqyqH/3cDEz87awnWEqdj8yLeKzDIrFvKN7clelJdHxNd3/q4fo3wZurZk8CQekIE9EwnCF/hQ==
X-Received: by 2002:a17:902:9001:: with SMTP id
	a1mr1525704plp.148.1568661881859; 
	Mon, 16 Sep 2019 12:24:41 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id d7sm5490494pfr.7.2019.09.16.12.24.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Sep 2019 12:24:41 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 12:24:26 -0700
Message-Id: <20190916192429.27294-5-armccurdy@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916192429.27294-1-armccurdy@gmail.com>
References: <20190916192429.27294-1-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] ffmpeg: enable more verbose build logs
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
X-List-Received-Date: Mon, 16 Sep 2019 19:24:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
index c4261248b6..2809f343b8 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
@@ -129,6 +129,8 @@ EXTRA_OECONF_append_linux-gnux32 = " --disable-asm"
 # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
+EXTRA_OEMAKE = "V=1"
+
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
-- 
2.23.0


