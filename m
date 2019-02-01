Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id A11A06B005
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 15:21:00 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id u4so7511330wrp.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 07:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g5a3QQeI5LvNKR4PMo0Ui6A17ai2OG3NZ6GLdnZyg+s=;
	b=BPgivE8t+xEHzdUPOpKb6sYCrhg3xsgNzxrgdY1DHGUiiCuYMIUIux1ko1aO0MZxE9
	6PustzYoTAMjoT8C7uUY+kNyb54Jo/99h4MgVo+TC+vjnyEE1LNIC7CDLp6yEub32CWB
	mb4ekWe+teTMN9tnk/MdGK9fimIeafJCdZNEA71TrVnNKXwU9hDB/gJBgs0CPdu63DS0
	2mOVdezwD8C/oInUX9So/fOE79Cy/rhuAvuLFcaNFHWe4SpkznHn4h3UYCpkQxQAMQpD
	N6IpKgKHo0b53poDxnXOqv+K6vbMBCcXK5R7gw51xPw0XHx+aPHTKTXDJB3fP6TT+dMv
	Rlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g5a3QQeI5LvNKR4PMo0Ui6A17ai2OG3NZ6GLdnZyg+s=;
	b=gnQuijD/CicQtXe3vUYguHgBxqb/FkgTmbFM1ItIMevcq+s/DK8w33FaxaItPDrEEk
	6tNTmIu1aS5cGxHMWxHQ5hf+R3gc5ycwAjJy6O2boBdj+PmNMyizKUSjHocSzXLqPYpi
	xFBLED61JbzLKC3Sxi/FIVgpru4pPY3Enyopmh0BSCod7dk/9+NAN/J5KMKtzyBv1NpR
	mKlvylAn/lOfJjn5UZjdFmEQfrqx+Y7QZvZ6AILdxO2iHJfj3WeRFnaiKE0peSuMUbxI
	QsRFUlram34iYN4uH/UgdmSEqZ06Ez8JnmB0vAZYA323Zt9ezK8WHmhQHPIAGnQxmUsl
	rSRw==
X-Gm-Message-State: AJcUukdb0WZXxqNoHndJ2KHq+KR4YiCVsLoAcpZJ0aIeffsiSBqv3mzY
	ClPiDJZASK3CS3fAMsM4hP12Vj4C
X-Google-Smtp-Source: ALg8bN7ORz/1Y/9nPeIBNueeD1i/5Vpq8OVtk0YgeN3pJqFPD+p4IZV4mq8R6TLmREMvKf2FHebbLQ==
X-Received: by 2002:adf:bb8d:: with SMTP id q13mr38804754wrg.183.1549034460912;
	Fri, 01 Feb 2019 07:21:00 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	l20sm14889040wrb.93.2019.02.01.07.21.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 07:21:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 16:20:50 +0100
Message-Id: <20190201152050.115214-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201152050.115214-1-alex.kanavin@gmail.com>
References: <20190201152050.115214-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] perl: add dependencies for optional modules
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
X-List-Received-Date: Fri, 01 Feb 2019 15:21:00 -0000

Particularly the LSB test suite was failing due to missing crypt() support.

[YOCTO #13160]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/perl-sanity/perl_5.28.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
index dc6689738d5..71653feb538 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
@@ -32,6 +32,8 @@ S = "${WORKDIR}/perl-${PV}"
 
 inherit upstream-version-is-even
 
+DEPENDS += "db gdbm zlib virtual/crypt"
+
 do_unpack_append() {
     bb.build.exec_func('do_copy_perlcross', d)
 }
-- 
2.17.1


