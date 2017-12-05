Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6B39378710
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 15:45:10 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id o2so777920wro.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 07:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=phoBx+Z1ZJrH+Q3Mg34LD9sVzTrCyJRdhuJiHIaX8Fw=;
	b=KmjMoqbVU5VrCE9fZhSQGL/6KoXAI3M2yKcvQyj8Tw+QvlP9C0lzxA8Je+s7OWgvCW
	e77OJm2p6MzcdClfXu/5TXsXb+1l8NUyVEVPAR/YvXhBIRuse7FtToJcekL4mJb4CqRc
	ejeee/DB7Sw5tAP/dkRhgjEGRMTnotbq0g0BWsYBcmQ0TE6updN7rQfMQvZBv4nnFgwO
	Kk/QoGub21mj7NEP4iIrSR4idpN03EZ4ZF3+Bm/u8RSBFHZtJ1LX/taMoQTCEHF9LYOd
	cjjO+D62LdTb6Uqid3qZasVG48YJPSA9TVfPONcby+4ZF+rCPYkTs3LyMrMSdjk1PA97
	6zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=phoBx+Z1ZJrH+Q3Mg34LD9sVzTrCyJRdhuJiHIaX8Fw=;
	b=e3iKt03pbdfXnyLmnYd4tBvqZJe5rYdadYf+LMYnrIDTA8h+tF6ssqDzI6RcDwv/5H
	t6k1zxAKBS0pblOXNpXeot07mVPiIUoKZ6kxqMn9ZJGjQiQJKdB6WadQOSeOC/tsESfW
	qo67N7gW7TcivziEAa5R3fo6trSBIpLXTVk5iyF7AZZBnMyabcXnpEji+SS+cgylRlwV
	IlW8pNNJshP8Tu5fkhOA43bkVRrvQkr6UMFakkvaDSaTShKvR+/67Gt7euLNsIj3voax
	jfvCTJ/kMWj6qvMclnjPNJbNQ+GivkYfSUc85TYasFtmhZk7T98xZg/ZoKTDXcUzy5iZ
	bZLA==
X-Gm-Message-State: AJaThX6Tm95ozSXt+8cHYPpjcbwYOArF/GVWND1AJ+CV//WjMDCK5o14
	MSJbTZc93t13MxDQm+t5cm5TDg==
X-Google-Smtp-Source: AGs4zMa0SJ5jKPYI2/NIJODw8R+4e3YXGbprGBNebT/SF+QCgiu+AxfT1Bxlp8ljHzJHT7Fzyy4ZRg==
X-Received: by 10.223.159.15 with SMTP id l15mr18843780wrf.155.1512488710910; 
	Tue, 05 Dec 2017 07:45:10 -0800 (PST)
Received: from VPR-VM.fra.hager.corp ([212.51.167.132])
	by smtp.gmail.com with ESMTPSA id y89sm832428wmh.0.2017.12.05.07.45.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Dec 2017 07:45:10 -0800 (PST)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 16:44:55 +0100
Message-Id: <1512488695-19237-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] GCC 7.2.0: Fix 0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
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
X-List-Received-Date: Tue, 05 Dec 2017 15:45:10 -0000

Patch fails to apply on peep-ldrd-1.c and peep-strd-1.c.
First chunk replace ldrd by ldrd\\t then second chunk copy peep-X-1.c to peep-ldrd-2.c and try to replace already patched ldrd\\t

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 .../0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch b/meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
index 0212507..1995f64 100644
--- a/meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
+++ b/meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
@@ -158,7 +158,7 @@ index eb2b86ee7b6..6822c2b1454 100644
    *p = a;
    return a;
  }
--/* { dg-final { scan-assembler "ldrd" } } */
+-/* { dg-final { scan-assembler "ldrd\\t" } } */
 +/* { dg-final { scan-assembler-not "ldrd\\t" } } */
 diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c b/gcc/testsuite/gcc.target/arm/peep-strd-1.c
 index bd330769599..fe1beac7229 100644
@@ -187,7 +187,7 @@ index bd330769599..bfc5ebe9eec 100644
    p[2] = a;
    p[3] = b;
  }
--/* { dg-final { scan-assembler "strd" } } */
+-/* { dg-final { scan-assembler "strd\\t" } } */
 +/* { dg-final { scan-assembler-not "strd\\t" } } */
 -- 
 2.15.0
-- 
2.7.4


