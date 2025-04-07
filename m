Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2DBC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 16:46:02 +0000 (UTC)
Received: from sonic315-13.consmr.mail.bf2.yahoo.com (sonic315-13.consmr.mail.bf2.yahoo.com [74.6.134.123])
 by mx.groups.io with SMTP id smtpd.web11.52420.1744044355560071646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 09:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=r5f6rFzS;
 spf=neutral (domain: yahoo.com, ip: 74.6.134.123, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1744044354; bh=pkIMXRoFmL/Us4iNiTys2zMc0SMKITLNNtA5jsLu4kg=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=r5f6rFzSS0HfNBaCTvj35LWIVspcvUy0GGdkwe8VQrkJ47QQIEgCQRX4XhmcU8ZUHgDNy0sncqzhsAk7P0MIssjKmRfimhWssNHLVGCkegJ9pvXa/4q8wpmsTJQCldkmRuIi8s75JaiOfI6JHAGI01LG9esN4yR1Pg7bny3T4651pkB+94xwAJOvraz+AnDULL21PvvJzVUXKqlKnHNm4F+kOLf1vmh1zVaYe7xmIRUC8WpBaaUOUJ5SRYPpHtCfUsTCDTAh8CokTKjoW4NbTY5HaTbj1WqkVrbyn7zLGivobAf22J8tCmZjj0UrS/hYUYy8DpFGMCD98hUw3x0IoA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1744044354; bh=xCrvOv4jor4pSf9ANT69tQx/c8LTeIUaIpWLZORCBL5=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=hh/fY1zlvxq7N4ENUkUCeF8c/Wmh27M+8oh8noiZRf8GB5/0tI7NO63GVSV5qPPfwmsbFoiw4Dm+DceH7xJEgZBf+FN+gTLslVLBo1Jkvf61ozxd83Y1aohngBc94y2vIGpfe51YwgyF0CLD9rr6O8CqfVHFH9LbM/rNEOo7sS3FYM7XNJbxH40bhuaEdUD4/rqi5mY/0SZqH7t2E6t/8Q0dTKbYw25ALI0pHSML/SxiyFwvmTz3vxkyVFjyELsTbCecj1aZTLd2WBoJiIVDQAAWnqTnQNhhyxRgqrdMWmCdNpIm/ke0kGEmQmA1md8EuorBqmToJiWNSdzVh2h6hQ==
X-YMail-OSG: IkgQ8EcVM1nxKVSnRbOnTtXg0PUZJGh7z6Vj75dKX9TnwOBj3hx_zPsN7r9MRvE
 VAbq.lXYi.RAiWKBzG29op5XWt66odsG7IHw7cqbBlGDRt3vxRj5.T08kIe6cjoWVx57XEWUgXst
 NsK3H9JIXRKx4Rdk6Tn.9WyoEIqE1eIxSMwjFiHmelfdRmDu0xsPaEmoDVVI7iyeAW7xHD_x1znP
 VYTQcAsm0kbNafioanb_WTxbMpoTjngyBB2f9bzoWbHEF2K00nrtAXyW5QnXGs9jaHdIZmfSybIh
 AfBLULtYZ0JbYoWX69UtQCY3GSwWiLZBV_9Alnkf_t3ES3_F.zIa5L17iAUIEJfi77Z5v3y60MBB
 qMw.Y9x2AS6fwptPA0hFG269oeid9Sr5oG_l9gfV6g3XtXP4U6Jvo7Fsa.W8aVMTQ89TyJ3zFKXi
 .CPmUAt.F6XblFA.QS.v_7fI8jMddL7YyFRV4NHs6ySebzHREk8GK0YC1rPKoEfH_OThuWlvzIyn
 BEQEC0wE.DQz_cBFKJUdvoEJPiNEBRyQ6V.WAvcQw90aWipTyRorsmNSQqlpJyPBugTDsCHixS.W
 c7PpIB1ubEtVfwbSCr31FvVZvxdNNQfuaxRkBh._NYt.I7vIAgktYpDzbVLfOajFYHB.lROFV1Lm
 A2bh9iAlfCxKomF8nbm99fgVlV2t2M1yiNHNd_IYS8xeIMaJNj9BJXyIqjEpeleGpra9HNBm7EPT
 pHQn5lMBm39UNLiGqtVtAsUn9.Q6Wt8eirdVPkgCDj.2FNsX5Btwz_9X0N0.FIFCeJgrJC92Z3mE
 jPZDbxlMATstPCWIfOWgEHwQ2byzKbFg90XHsTWkgy0WqeyOUqWStGTVOz8Q8l878wVQVTIxmcwo
 Q2b89qT7q2QlgTSK8FoHcP5yc_r4NHxY.LmEtEgmSCSdeIWI5_TGBeXCwgbdr.9na7dgkXVyFIKy
 KJNntba2Ysb0uVQimoXqo5idk1qnA2FSyOLY.bl4Bw9BnSxOc6sDKrePX.WpAbbD8jPSMkX3bv0M
 m_4Cu1rDtR4LWnnZZkMmwWWf5nc4h2GScKH0oFhi_rXox5Kpopwo.UkwX.c01kYa2vDeJSzCwADJ
 0FQIxkGPdEyYtffphbdRXBVTQp7B9Jw31M6eGRnjsmW.sYeFklPeUfByHa_wlheFARM7EgKhonPK
 ECWR77qtS2E.gMugJx.1uGP4618IjAoVOPoM9oLxEq0jOyNIJNYwpGTRVD4BNHonMDTtnnyEDsQP
 rZaV6Eb92BKCEHUqTwG2Xu_n.U863VwqQdxfQmG3iCE8Yz62zFyZyD6H6w1OT5zmgWYE80.Ip_xR
 jsVyC8kOqjWmPv5JO3E29FXg0xctbmrSNTwLLPazz3LJ3Zmn7IkTNjJyy7lASBTAJXLh8J5VikGI
 NH8tPieSmMdWXFFQQ963RlXc9zqBOD6fTAcw.5dwFO2cAtmSGOXXQ9pnsMuQl0BpGH063FEqgeia
 nayJJczM8g8qFWnUVx7VmWNNXnTJT4LCN2gaejSak2Ym4zEnDpInAH3wABQiidqc4u91OQ2AYYLZ
 NxeD7nZq9VKokeKG0OcbFvvundTFkZU3bZH7fGS5ByShVvMQo.kXYqpAIW1yNJEu3GmBNMgGFeqx
 o3MedVDGtSwgl_C1oZ5l1.2mK2SCxZnaqhFAVGEVkxjGS7XwcnDHQHKAUcDIi07KrXU0lg42q_s5
 DnQAY0MiZPct97Jjpx4Io2kV.GIswa.JFdLedLda9UzhFH3y0CBNBYCkZZLrTP50lCV3NgtuKhFo
 I9oNlH1WyFYxjOL8XRsNiAJEcpUpzI0BsxWC9_nY7qxgcvg_M_7tjMsyIUsxSzqCy7mj9xP_4xEo
 DdIpWYiS2icjlGoi4sEIF4ZwGNKmT1ljyi7Dg0TN_olR_Lrnnwdzyc2fqjY_ZP2UMe5Ow.ujyhUj
 _TJvutr5taxbM_otEc59SmXNRncVo.DXIWgF5Mdx1UKgoQXsnm8NnOmjwpWwWmUz0nAK4Ssytn.h
 56Bkx9Env0xYpfp6sITDQ2Ej4f7IhgQIMqRzsf10Hz6k0tJ97ZiAURkYyNaV3noneV1FK64rHdMg
 qT4xEDUm4_7FYIqUUmxOOXBSFlTr83CmF79Y5cKPWbG_jL74vqwQEIR5oo5qmQlmnurtYuzRHAJL
 ij4GRhGKvRHSQ88X9VmKHCseA9J0hwHIjYvnzor6asQFMtrOAZfdvIaIm1ZUJHejhi6dQT5tPV.w
 Ds7.zbny4Fd0Rp7U6dKbOz7vTpEP6TNv1l1EfoAwjoAT860dpDTKWAFPPQ24-
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 0f9e4f6c-e7a0-4c26-98f0-66fa365afbcd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.bf2.yahoo.com with HTTP; Mon, 7 Apr 2025 16:45:54 +0000
Received: by hermes--production-ir2-54ff696c44-l2pfv (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 6bce5cfcb11f058010887bed0518737e;
          Mon, 07 Apr 2025 16:45:50 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	jbk <jbk@mm-software.com>,
	Raj Khem <raj.khem@gmail.com>,
	Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: [PATCH v2] initramfs-framework: remove hard dependency with busybox
Date: Mon,  7 Apr 2025 18:44:56 +0200
Message-Id: <20250407164456.4845-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
References: <20250407164456.4845-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 16:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214464

In 'finish'script the Switch_root command with option -c is busybox specific.
When package-core-base-utils is selected the boot is breaking with message
"Switch_root: invalid option — ‘c’.It was reproduced using qemu.
Remove -c option to make it compatible with both providers.
It is tested using qemu with busybox and package-core-base-utils. In both cases
qemu boots successfully and filesystem is accessible.
Fixes [YOCTO #15716]

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
CC: jbk <jbk@mm-software.com>
CC: Raj Khem <raj.khem@gmail.com>
CC: Adrian Freihofer <adrian.freihofer@gmail.com>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
v1->v2
* the commit message is extended with more info
---
 meta/recipes-core/initrdscripts/initramfs-framework/finish | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index ac0de9f996..716c2f44af 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -41,7 +41,7 @@ finish_run() {
 		mount --move /sys $ROOTFS_DIR/sys
 
 		cd $ROOTFS_DIR
-		exec switch_root -c /dev/console $ROOTFS_DIR ${bootparam_init:-/sbin/init}
+		exec switch_root $ROOTFS_DIR ${bootparam_init:-/sbin/init}
 	else
 		debug "No rootfs has been set"
 	fi
-- 
2.34.1


