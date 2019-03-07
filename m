Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 36B817CEBC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 20:45:57 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id i12so19036788wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 12:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=OWwjPnEXI7LtC0PVypE0FcWP60yXE8cd48trn+ON+H8=;
	b=V+60v/SKov2Fvd6uhLM8N0ZOjlodocYSuAwszapqosTCJ6leetyExW1orIFFjnV5X3
	dYHoN00oHhj41jmkh5gSAV82HjZ7EJKb+gDtoI/SsRThEfZ279bKMEt8U9gNNjrdqe4I
	iZeoVPMqBkNVhnnadHirBfN5+vfGBnlnQ6nYBEL1YvWYDDHo5+41I7O8G4NtEzmvgVhv
	yCNB3dkMgghQjycjhZdULbmSM3qXB+SGG/7hoiJzRDcZm6OjWKWNl5iiCcS8yzCT5dSf
	ZioYC2vUCHyjEC4S1cSmZfK4TNqDXidgRXQOak0sbWu/oH0vRvOQ11ke8FZfapWTb9DM
	LciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OWwjPnEXI7LtC0PVypE0FcWP60yXE8cd48trn+ON+H8=;
	b=dLNU5a1JK1NEnzPwIFQMweZqUuyj5ZN9Xln7+GSTuR4VE6Lsv4JwRjwbcP3bdb6d3V
	oHHIAl3AJdQgsJjGZLNm3t1h+epaYuu8aMdl0TJr/m01WSs2rXMRJyfgUpCddaWfcNNy
	z0gdtf7OnCWn++WOlnRON9u4IKTz3nsnZ7bSSsZEUfYepaAN1rofGCkxwvgR8c2qEdl/
	ku9Yp9MgKzGVkfQHCuwxk9sSsPxCw6RtEYFebyV+htCvCssZIe7gPOTLSwSC595ftjYx
	B8Lc3rkzmaEVNof1b6K82A0JzGz8QDYKsMJzusXo99GaELTUFtTbQWPGsLIfkk38sHhu
	0bOg==
X-Gm-Message-State: APjAAAVbPwupJS5ayeiozqAhMuSflrYlQBSvH/O9e0VB3FdyfnAMoCBZ
	1ZQ/ZPzuAhp9rD8pFKZonZryQxW95GQ=
X-Google-Smtp-Source: APXvYqw+RFGKwMK6Pqe9Rdn9ShKAuiI9AuYU6LAoa+w7rBfI0mvikgnqQ80kLLMN30bwB7BXbcUuIg==
X-Received: by 2002:adf:d08e:: with SMTP id y14mr8262346wrh.306.1551991557564; 
	Thu, 07 Mar 2019 12:45:57 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m16sm9843518wro.78.2019.03.07.12.45.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 12:45:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2019 20:45:55 +0000
Message-Id: <20190307204555.5022-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v2] bitbake: add realpath to HOSTTOOLS
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
X-List-Received-Date: Thu, 07 Mar 2019 20:45:57 -0000

If systemd has EFI enabled it needs realpath.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5a4c4bbde94..c156587cbaf 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -495,7 +495,7 @@ HOSTTOOLS += " \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
     mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python2 \
-    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed seq sh sha256sum \
+    python2.7 python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
     uniq wc wget which xargs \
 "
-- 
2.11.0


