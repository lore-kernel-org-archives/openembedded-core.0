Return-Path: <zrc_work@qq.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CEAC6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 08:08:32 +0000 (UTC)
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
 by mx.groups.io with SMTP id smtpd.web11.8772.1679299707198064753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 01:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qq.com header.s=s201512 header.b=P+c7dpx3;
 spf=pass (domain: qq.com, ip: 203.205.221.202, mailfrom: zrc_work@qq.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1679299705; bh=8NwlSaf4gxxVMwB5ee3pceYlb51OkKJlQ2VJt8Cza6A=;
	h=From:To:Subject:Date;
	b=P+c7dpx39R/XxlDq9pOeQUiobKnnNeocscUjeTdrFTuVdCz4ghgWxuYADb/MfinTL
	 IPpMiVNKKFHNMfsCjsgCh4ySQHeft9hZFeen228szfaFRhuoP6rX8cIEA9/nd0eUR4
	 Y/OApFsJxBhs9n26Xj6S+J64Fr71Kc7kc7U8iC/g=
Received: from zangrc-virtual-machine.. ([122.193.52.21])
	by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
	id 21782C6B; Mon, 20 Mar 2023 16:08:23 +0800
X-QQ-mid: xmsmtpt1679299703tcdd27z41
Message-ID: <tencent_998F6FAE73B2AFB12947441237D4C107E806@qq.com>
X-QQ-XMAILINFO: OYji31yNgomxHDpl6/53WqSgZDwWvCG6BwuvD4qwT4PtyPaV5VcYb9Voo8v0I3
	 Zb4VfHBSHs7Ug5LBkZE6NGe1afKSG3e3avo6JbK47dWC/amlm9bF/08cr7Ie+Sa2oSEOaRlxkx7a
	 e8kUghZctHoT4SaZvq+d6EbhDU/aCKuFlzCCIVkgDPjsaxPcx3XGJHSy+dFCPUda0HI4uPXlz14I
	 LMcE0vpLI879HZMku4l2Mgp0HVn1X18igRZb8Haq7DDf6NVRtbqLl73g09gxFKGmyLhKOmTxCOBb
	 J/jCIL8mUL19JF7WvF5sLQFt1CuwdmNt6ZG4deYJ2fAjZYoCmahBQicZrTGaGVO9MBtLWha7R3UA
	 xutrEPYKYBNo+/Z0BxZfXwHTsu+Q67YiwLpIfW/bA00PbAWNJGnCyLc0ZeCDAge/jbYejiRt1yKz
	 xwAtt5gwniJUTohw8Ad2T825D4ixEpHBXQf6P1oJyY3o4LFkgdPVjkyWAySJt3Y0MTGOHbA83fHT
	 q+qjN+gSAWT0R/j2LGt2vTnXMtIJNHXH7tZUOIFklkB7fvXTv2AoJxjz0VecfNJudGDJP/2S4vE2
	 0hxpViXKUL0X4EdCbgDeziWttE3LnWE2eHYAMtDqeUYtPln3HAHVRAB0nByapZ/215u8DtD57xh+
	 JmSnyWe0XgNkr6K8RUBy99I+is3cYxvWI3LezbbCmP3tjngwyyHm2dX7r+RWH2zPnlMznNkY2m1L
	 nA3R2QVz6xduE/lqMdFGWmeGgcgi4Z7aLQ3RNKfS208N5v0p1zSvnWlMseSkyN9tIqi4BJ1SiV/h
	 O0a2Y41TDuQqXC0PI8YeuPFINubu4POKO1GQos+ARPl3F3pdS4tsufJTbS93AwaKwDImm13heEpf
	 HKAL2ysAqd0KcuFGKC7thJmCQdmR+JnwDIL0X5Y+ardH2xagi1CakrtraaoNAcnI6VuT3zpHm8eW
	 wYuA77uOHMe3ThgqJaUGvH+1KTIL/XP1N19ihooQdxv2uKQOy8btdVXz+03+YNmTInVHaH7Txyxz
	 RiGm8NiJAh8vSOkADemeiZokOXYMKbWEzKwuV/m1vac9Oj2HGv
From: zrc_work@qq.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers.inc: Modify email address
Date: Mon, 20 Mar 2023 16:08:23 +0800
X-OQ-MSGID: <20230320080823.3349470-1-zrc_work@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 08:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178802

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


