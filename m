Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id BDC5C7E271
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 22:04:13 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c77so163579wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 15:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XotZA9Hq2sd8jCFgmP6jF7kQ34iiRd2NUsvLjF48Ark=;
	b=LJnf4ZzyyYlcBorvHr64iGQ6BMdEFFhRgjIphHVEAsAoGojsfwWhvcUrMahUhMEeIK
	q9qlmRXplUhce8+Ul+YOLJaN2CA8hLIXjy4PFnLZQEagQQ6L8oYOasZYXNZ7CfkAJ/u7
	qqP3igLiN0jZi8ZzM9pDpA5CUqGxXcmjH++p8tC9iHNW17qEgvvtsmta/C7imk2bZ+RH
	sdnbs/9/6W8WNn6UShYKzh55gmeMlsdStI/zshZGDrl0JrqzU29TsNsWek9xj4W3/8dv
	o9Z0jJYwFCYF4jxOT2nC2n3a2l4y7cOKmxGIBAG/Uz8nKjkvjJHnGYv7RQh+a9RIKXhi
	nUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XotZA9Hq2sd8jCFgmP6jF7kQ34iiRd2NUsvLjF48Ark=;
	b=CEAQO/IlJTH3wM9GOwUNjWyDWQ4KkN3Qs0iawFE55A695qEp3vY5zJ2KlQUie1aKjz
	2ZeTf9ojnNThgRzxRLnhrOyM+YoJwpKtejVGfN7rAfOjXWXBzvrIrfU2FxNevxCdVsrb
	8NFJxwXHA044E7iCaWg5QVehX2aqzpEqrDcVwKWwNQxxAPlrhzehsehWNYIXDodGlt1X
	JMnJiPCiQRd7qgmBxIV11fu2+aqIrzJWp/8nW0/YHAOaewbis0G4E3sRr+25D9aOoqOw
	tDpbDfrPyil20SqbBBQoaxZbnnfYETszALJgjHzaQ/bgErNXmhVrBPhOPVYKMeVAejV7
	5XGw==
X-Gm-Message-State: APjAAAXoF8mNkRQpZ4GOpc3C1XYBuXmk+k5KjJPtzsSSljmFSbVC3mxS
	/EyjgpN71Tsf7tzmSAOMCWEh4mV+
X-Google-Smtp-Source: APXvYqzQI/HvYZFyC+870Ftgnzq2Ytnk0RHABBe6kxwEsYXWur/jqI+7D5DtSx5lcfC/518qeIlEgQ==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr4906938wml.108.1558476254080; 
	Tue, 21 May 2019 15:04:14 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id a9sm5682378wmh.5.2019.05.21.15.04.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 15:04:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 22:04:20 +0000
Message-Id: <20190521220420.19726-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQfRhi2jaTgTnUNzE637-vP6MreC_ojyAe3xsO=e20YX7Q@mail.gmail.com>
References: <CA+chaQfRhi2jaTgTnUNzE637-vP6MreC_ojyAe3xsO=e20YX7Q@mail.gmail.com>
Subject: [warrior][PATCH] Revert "acpica: use update-alternatives for acpidump"
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
X-List-Received-Date: Tue, 21 May 2019 22:04:14 -0000

This reverts commit c3a325b5c2d9315629d014e5ebba552fe045171c.

This seems to be causing:
WARNING: acpica-20180508-r0 do_package: acpica: alternative target (/usr/bin/acpidump or /usr/bin/acpidump.acpica) does not exist, skipping...
WARNING: acpica-20180508-r0 do_package: acpica: NOT adding alternative provide /usr/bin/acpidump: /usr/bin/acpidump.acpica does not exist
WARNING: acpica-20180508-r0 do_package: acpica: alt_link == alt_target: /usr/bin/acpidump == /usr/bin/acpidump

because the 20180508 version in warrior unlike the 20190405 in master doesn't install acpidump binary.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/acpica/acpica_20180508.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/acpica/acpica_20180508.bb b/meta/recipes-extended/acpica/acpica_20180508.bb
index cd5f466262..b5c89fafc5 100644
--- a/meta/recipes-extended/acpica/acpica_20180508.bb
+++ b/meta/recipes-extended/acpica/acpica_20180508.bb
@@ -29,7 +29,7 @@ S = "${WORKDIR}/acpica-unix2-${PV}"
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_${PN} = "acpixtract acpidump"
+ALTERNATIVE_${PN} = "acpixtract"
 
 EXTRA_OEMAKE = "CC='${CC}' 'OPT_CFLAGS=-Wall'"
 
-- 
2.17.1


