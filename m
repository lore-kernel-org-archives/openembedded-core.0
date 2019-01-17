Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail.openembedded.org (Postfix) with ESMTP id EF7987C1E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:27 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id b20so8271967lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gdWFtyit1HxD1RJ4n6U6eerKvhG5d/Vj9gkhtK7yIdc=;
	b=aRK9RKrGZt5LK3nIVWb3QiQ8wf40ynYNs9FXubxOzK5jal6qNrLwNkTuW/wLrah3v+
	sfiMxQ4RtdcFiOXQoIFbDZGiFyrDTIzfZuJeXe09JM7xqOmHRuT3pi+jKvK5YmXvURez
	Vo2N9ymVpPbycpS06/RhwJrgLE5+nvjm2HB+HZxADrwt3ERGVGrKqylmpTjQZdkRL67A
	QflQNBl1eVBU3Pgk/G945LaXeVcgtvfhHVZC0ePpR7IjIMFTSMplo0GajOvlkbVneYHD
	dTNzm3blVu6UoD/87NKRx8XgF1YXaiSB7Df3R0gKtIaNXeXFdI/7C27Hpx7yD+kkhj53
	1pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gdWFtyit1HxD1RJ4n6U6eerKvhG5d/Vj9gkhtK7yIdc=;
	b=k5aycXW4w612WtP9rd1dz4CSm7GIuQ00q8Yvtmbl3aq6SCi3Mkxeo2GG5DAm/YLJQd
	wSintYdSlSdSZqj5kOE+E2poAKqsFJscwfzkLilA5u7Jc/GSUc/IDNDCWY/KKL0q0XMt
	eCncm6S3msmXiQkhcGRfXC/oF5HCN8FNINajp6QCeXr11Nno6SufYTIZjacgp9I+rUFE
	EPv6/mJdA3aUJu6QYv9MTq11ZIp8pNzKztlg5mAhJ3UrA6JIH2pdXZAcsaq9nyzFmbAf
	h/NH8zTLziIEnv5r/F85RmzPd27fjnHQqRfdnSZP2cgUJXQI3NYVnG7FKda7x55y6po3
	V5cg==
X-Gm-Message-State: AJcUukdNfxceMmQCs1VKRf8qSH+ohAZ9zt7gjKTqCkErL0zd/VV/wiMx
	QrETSqrZDGVaUGVXsGS7AaV5iIc8
X-Google-Smtp-Source: ALg8bN4+1r25KHA5dnnxTejwJu98VPNCVe/xsn2ZDDFH9gmWdr9czNvOFruxqrgSB403R3qtNgvQCQ==
X-Received: by 2002:a19:4287:: with SMTP id
	p129mr10985557lfa.135.1547743227908; 
	Thu, 17 Jan 2019 08:40:27 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:39:48 +0100
Message-Id: <508aa83ea79c50fbdb222e92f9e11201e362690f.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 03/27] shared-mime-info: update the database also in native builds
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:28 -0000

Otherwise glib-compile-resources fails when building gtk+3-native.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
index 344da7ea77c..3fe1a445b0c 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
@@ -30,6 +30,8 @@ do_install () {
 
 do_install_class-native () {
 	autotools_do_install
+
+	${B}/update-mime-database ${D}${datadir}/mime
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


