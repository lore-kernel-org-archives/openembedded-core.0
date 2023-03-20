Return-Path: <zrc_work@qq.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DADC7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 08:11:32 +0000 (UTC)
Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
 by mx.groups.io with SMTP id smtpd.web10.8843.1679299887265867472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 01:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qq.com header.s=s201512 header.b=ptZz4wGX;
 spf=pass (domain: qq.com, ip: 203.205.221.240, mailfrom: zrc_work@qq.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1679299885; bh=8NwlSaf4gxxVMwB5ee3pceYlb51OkKJlQ2VJt8Cza6A=;
	h=From:To:Subject:Date;
	b=ptZz4wGXV9Ip6X6q3eb/iyeVYjYSyxuek+Off24/Jg96C/c24yFJrNruA8pK1aFEL
	 1OpKGfFOQ4jPYX0gm7mZj7QUbdDHM1DYrgmEkL3psMjjQ93W2X/XSd8Imevw7q1sRc
	 SH8yp+gPMy1LuzbP+XUzxkw2Ogywc8nlVElWd9Sg=
Received: from zangrc-virtual-machine.. ([122.193.52.21])
	by newxmesmtplogicsvrszb1-0.qq.com (NewEsmtp) with SMTP
	id 2D6A8E44; Mon, 20 Mar 2023 16:11:22 +0800
X-QQ-mid: xmsmtpt1679299882tvlzif9gq
Message-ID: <tencent_19A6F8263997FA6A9B8E458473071DF4800A@qq.com>
X-QQ-XMAILINFO: MaZu5Xhaz90xVqzY9EuRynKnGK7dtrat2ZtvKZ8KyWP2lOvJFn0lPLjZW4nZBk
	 7XTfwKUyMLs1OAsiSgySvG169YLpnTtlAIiFApvqZSYXgH+UIChbojJTplxJaptHxfvkyh5wGcW/
	 3dyyeNfNs0S1yhEOeTugHhYGbbXD8tUC2rZUHpW6zONeAk3mHLmfHQnwOwHfWmidQWrWH11Yl9H4
	 bwKJBRNKZN+rhjxLbUWt8txqxoXn4Y1QvG7ipYc+8pQh07d2IJFrAwSUuFB8zS14vSdWXEyZ4MeD
	 WAUrUsiDAX/01AVkD0gMZzoPe3pHycTiVXEBEqIHC09q5BJGDCnACKOoNAcTVNuxcsFZRaee9B5a
	 V7jva1FiySdI9Vd4YsSGaaQ2Y6LI3N8hpX/siZT3wpJCw2TGAiUQajH3iWOAyvPLH77yd8a/YgjB
	 K0h8zZYQfVBVoZFa2VcYtWmSZBHfeCJYCR7YfV4PRGV8EJEy6Z7qLQuxgnv/Ytlvfo5qNL4tDgdO
	 MGaQpL/pMr6+hL2AA/HGX2W4cf72knMA8SKrtKRDUcVF3JzRPK/bag5bq7B/HT5Q74rYjoYPv/r6
	 aP5jfyV66B2PodxnBlaimTbHvBLR7M/N35is4PA8Uyu55v3rkP3Yu3pEuM8iS7lCuCC/yDz9B8Bn
	 J5MCG7fQl/u8ocXKfxOJD/2Hz6aPKWsUEaOVLZoCNAFRbGdAbS/YWhfnoTL8Eb4w/dbzXrlz283g
	 gn7ENWD8edKdBWXkIj7RvS8IHJxWJFf2o4zBwBlHULmm7QAJJ3zXPzTR+y+fkL51j2VfTUfGIAQK
	 a79KxjyMAn8i01aoDHHZE4BrZcMJPQnGo8O1CHeMCYbhrJxuN/CfGns0wLDPiK6et16ShSdkjaMB
	 ak2VN4lUzedqb5/rNGyeeFsbkNOVIZGTvps1tqVTasie2l5hT1IhlpkBqHoCCBx3Bq41pro1EWIg
	 7UgX95m9fkymzNplA8n9VR9ICTecbeHgYR77UL4F8ciCLSPOtsUDIjHnVqWxXRZ/g1muAYYHxDmx
	 Hs6FLrMoWoBz8QgxIX
From: zrc_work@qq.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers.inc: Modify email address
Date: Mon, 20 Mar 2023 16:11:22 +0800
X-OQ-MSGID: <20230320081122.3354744-1-zrc_work@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 08:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178803

From: zangruochen <zangruochen@loongson.cn>

zangrc.fnst@fujitsu.com -> zangruochen@loongson.cn

Signed-off-by: zangruochen <zangruochen@loongson.cn>
---
 meta/conf/distro/include/maintainers.inc | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ec7ea90d16..d1bbb1a6a7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -158,8 +158,8 @@ RECIPE_MAINTAINER:pn-e2fsprogs = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-ed = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-efivar = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-efibootmgr = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-elfutils = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
-RECIPE_MAINTAINER:pn-ell = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-elfutils = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-ell = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-enchant2 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-encodings = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -414,7 +414,7 @@ RECIPE_MAINTAINER:pn-libuv = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER:pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libva-initial = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-libvorbis = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-libvorbis = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-libwebp = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libwpe = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libx11 = "Unassigned <unassigned@yoctoproject.org>"
@@ -608,7 +608,7 @@ RECIPE_MAINTAINER:pn-python3-chardet = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography-vectors = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cython = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-docutils = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-dtschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
@@ -647,8 +647,8 @@ RECIPE_MAINTAINER:pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-
 RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathlib2 = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathspec = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-python3-pbr = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
-RECIPE_MAINTAINER:pn-python3-pip = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-pbr = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-python3-pip = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pluggy = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ply = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-poetry-core = "Tim Orling <tim.orling@konsulko.com>"
@@ -656,11 +656,11 @@ RECIPE_MAINTAINER:pn-python3-pretend = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-psutil = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-py = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyasn1 = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-pycairo = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-pycairo = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pycparser = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-pyproject-hooks = "Ross Burton <ross.burton@arm.com>"
@@ -680,7 +680,7 @@ RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko
 RECIPE_MAINTAINER:pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-rust = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-smartypants = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.34.1


