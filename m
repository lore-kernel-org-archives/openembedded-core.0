Return-Path: <bkylerussell@gmail.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2B50E79DCC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 14:48:13 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id d11so8950811itf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 06:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vF8trbpcXih0xNDOOMoktScHTNxuBQXQtPYXVxdfBXU=;
	b=Nim4IcvGCCw+yeLx31wNccSG1VE9gueoEuoKePT/npWt3s3jcYxGQPKKcRxKPEgKbb
	wN+9eYfIpwBJdDF2d860OyTn+EcFxyMXw7vbM3uAxHXavvuWuNMTFY6BrvwQYXj2vHdz
	IlWtmfFn0E4MzT+Tz9oAW4XzofldOVpWhxVS6HWw1NgEgkLXbbP7QhO/CsFAF1Jb0BfC
	To0ybMO9mimV8aj5JUYt1ih5WcomQLS4x7eQMKrOavs/Uzxwt+hrCog3rx49cBfpXE5n
	HeIqF9F1d3rIXFKCFAQ7noAxmImaXx3ertMwSp2lrVCk93xUle+M/HN4gvUqzCftWiKH
	T33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vF8trbpcXih0xNDOOMoktScHTNxuBQXQtPYXVxdfBXU=;
	b=rwgUyJM2OcZv53a5XfSF0NrEoVBMwUplmGTxhPXZMQw5H/sUJmMUtoryzcJ16k5MuF
	fldCT9T3H+RsKOPhz5pMdtxqaKvDuJ7Hyp2wQ906485SHSH/cWC46eq3cclSczpzjaGz
	2wbuGo1mXhc9sPkgUpBIiX1PcyowXBWtM0rrcCBPhPPPrZKqUTIn2jvLa8eGVcQpb9Xw
	ekYRe+boWjxX8Dm6BEbqkq2HEWEDB6dI0F+G0nOh+2f/kwEwJncyHB7Q4puyPoziG6w/
	tzk0mEK4xrFW2/QLOx35MgwO/NdocNBqsBystVeaRH2us0vPRhAEO7BC8NTVS9Us6BCe
	CH8A==
X-Gm-Message-State: AHQUAubcZsrLLWt2yMzDy+5wRKl14tGrP+yTDbFS/bi1Pv5MoF8zVfUl
	9Y4MXY73WX4OxC/3HPf6gdOZWhNv
X-Google-Smtp-Source: AHgI3Iaqvs0kf7+5DKsrxTAsOWqvjY0X5H8yHxHTiz0Jz8eSzFVY9OVyfe6gaNTLeQlR45kTJsX5WQ==
X-Received: by 2002:a02:a990:: with SMTP id q16mr2840293jam.132.1549378094865; 
	Tue, 05 Feb 2019 06:48:14 -0800 (PST)
Received: from napoli.dhcp.lexmark.com ([192.146.101.90])
	by smtp.gmail.com with ESMTPSA id t7sm1506386iom.27.2019.02.05.06.48.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Feb 2019 06:48:14 -0800 (PST)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 09:47:52 -0500
Message-Id: <20190205144752.4956-2-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205144752.4956-1-bkylerussell@gmail.com>
References: <20190205144752.4956-1-bkylerussell@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libxml-sax-perl: extend nativesdk
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
X-List-Received-Date: Tue, 05 Feb 2019 14:48:14 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta/recipes-extended/perl/libxml-sax-perl_1.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb b/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
index 141830efe8..eccd0ad6b4 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
@@ -29,4 +29,4 @@ do_install_ptest() {
 	chown -R root:root ${D}${PTEST_PATH}/testfiles
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


