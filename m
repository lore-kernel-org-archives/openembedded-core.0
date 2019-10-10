Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 468D07F510
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 11:18:57 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w12so7394138wro.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 04:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y9xd+Ao5nIeIcRh5vdiHlhZwoRdyTRU1TfH3Qi59Jy0=;
	b=GgD+C7HYWP+iKfnxROLAy34P8U3ZExzQwD7lntC7tfLeO2wOth0clH1mPgq4kgdioL
	0FO1+ALFmI8ED6mspZ1n772UeDLroKB6i35kKCEIr9V9R0Ia5wqf2Blngim8HGRX5dg6
	KPfXdUJVbdfQ74ww5mzckzbnj3Abi+NQSc6aVgNAtrl29QW1vCF1r7BoHX51p09orESO
	o4BL8qh7OsjJpP/PlyQ17tLY0vuBVU0zMkECKnjiDQIx0QASyFGy6Oug4P53Y7tkEduK
	LRHWRogyKSU3u8MnGcTPOQiNsuuctzmi4+/Sst38Xfkm3LuxOl+Zdp/PQMOe7D1IEg9F
	VVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=y9xd+Ao5nIeIcRh5vdiHlhZwoRdyTRU1TfH3Qi59Jy0=;
	b=dfung/ZLrq3YEI+6Agi0aHK9zl3BPjkhwG8MARTjc3hrFLdJn1isRNpSKqvirQ7s3h
	wff1yPyS/QkYZNkgRzV+UZ6YbsQRdbP1PGtSOJZZ8/KXsmaDsr96PlJg3O1hsAGXLTyu
	LfMqu/fxuPXblLbOuOwVVoBDfFpsA+1ufoWw+4kKr0chRDuo/KynXB4jUZjwZhcB0CP7
	tlW/hBRjXHIoS/bCLqgrnsY/BHQRQQ5M4ORmgVczapC/3amOhTjmWKcwxcGWeorG5sVa
	HuUnJG2NesU6UFQtKYp5fJDynx9Lon8d6GE24RzzPzMw21AqtQcZWUduWdJxCaeROhrg
	ROqA==
X-Gm-Message-State: APjAAAW5nfRkSP7JowrLwdrezDhr+wkWkD9CBLdv3hQ6d6g6rRhW0ZVw
	PfpobsRk463Kq4wz/GQj6MxDs3qcCJg=
X-Google-Smtp-Source: APXvYqyTPTzfV7oqze5t+IGCWHMtpYheuRtOTX6OVnxKb3Z/kPcjvrnVb6Kirz17OhHnOEuR+JnLRA==
X-Received: by 2002:adf:ec84:: with SMTP id z4mr8056257wrn.254.1570706337817; 
	Thu, 10 Oct 2019 04:18:57 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	l13sm5831372wmj.25.2019.10.10.04.18.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 04:18:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 13:18:42 +0200
Message-Id: <20191010111848.3825-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010111848.3825-1-alex.kanavin@gmail.com>
References: <20191010111848.3825-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/10] python3: un-break disabling the readline PACKAGECONFIG
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
X-List-Received-Date: Thu, 10 Oct 2019 11:18:57 -0000

Previously the readline module would have been built regardless of
readline's presence in the sysroot, and the recipe would
fail at package_qa.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3_3.7.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index 58e2fa5abff..09b942cf3ad 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -102,6 +102,7 @@ do_configure_prepend () {
     cat > ${B}/Modules/Setup.local << EOF
 *disabled*
 ${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '_gdbm _dbm', d)}
+${@bb.utils.contains('PACKAGECONFIG', 'readline', '', 'readline', d)}
 EOF
 }
 
-- 
2.17.1


