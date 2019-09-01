Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 883957F41C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:26 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id h3so5413192pls.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1Su/5nV7II3Jkg0RaUvRENr7KKJ3ROXXmUd3eBh3R4w=;
	b=oRyp5JRnxWPL59Zea3kraukvWefqx4FOn2JoM1xV+ElQS3iiJ/77bUwYYp85+qGyty
	TKW+GB3bYVP9dcjGPR9qdcVuwpwUo0BjVvkS7j/I/+5P2hhVjJptbRov4eGVOve7sJhk
	3EGn/SnGCXUSeTgkYfOxyrni0YitNYVKkEotkJN3FD3UvANUFxy9H5X5KJgcfTR+JLPd
	XB+YC/17l82GubVIvgigJPWn/qgVxLw/20lHcIhX7IYSmKXpj3xMsUtV7Swns6Kywtx7
	gCzDjK2+vDts6NvU2pH8hG+SAz8DOmsNmHtB79acLUbor9lyGGjwWufxs+ElrRzefOsb
	Ly6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1Su/5nV7II3Jkg0RaUvRENr7KKJ3ROXXmUd3eBh3R4w=;
	b=fmZyMfNt440OMCZl2XnmRyRh476uO5FAknjRf6d3C5lhY1gXWzThXZyd/3DX0qhfEi
	6yJlvigyT269FphcUauNspuiXkUbVfLrdhCgMo1QS0IzmfhptjcwlRW/BVsCN+sSTpDS
	0iS4Y4zk1zRRx+Fg4ZnH5GmtLAAV+T6cVitJlaEaUfNGaSyjKuXPHCDlp3TKDZ/e4Ei1
	2Y+rmhwk/7siNjoIZiQyJWXYKNXP0Ui7l+9ptFLh84eu/F/j4TtEyRQrTGD+eIXRYwsQ
	ijDm/oXswgneGgFF5HY+458y60SH2Jey5tT/A0LWeqTpf2HwFmSVNxoUqiMa51QW7CQp
	pLaQ==
X-Gm-Message-State: APjAAAW/hrEoeQ+ijvIUQAV9W7fdnMLarWRrZxKW3Enr3rfhHzQCr2ga
	2SfbzEBD5Ey/HMSISsKOngwnFxLd
X-Google-Smtp-Source: APXvYqwPEfpvyx6bFSX899s2N6lqYS/W8c3Bb01gbhliOaznyR1bozkXn1AuYWn8pmilt36zwCeqJA==
X-Received: by 2002:a17:902:bcc2:: with SMTP id
	o2mr25609820pls.127.1567348587632; 
	Sun, 01 Sep 2019 07:36:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:40 -0700
Message-Id: <4f115b2495339f8cb24b922a83e69cfc0795b8ea.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 02/43] binutils: CVE-2019-9070 is same as CVE-2019-9071
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:26 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

See:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=89395

(From OE-Core rev: cef180de3684491f1ac4180ddbcc102121222181)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
index 26f4809..f025399 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
@@ -16,6 +16,7 @@ Subject: [PATCH] Pull in patch for libiberty that fixes a stack exhaustion bug
 	reached.
 
 CVE: CVE-2019-9071
+CVE: CVE-2019-9070
 Upstream-Status: Backport
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 ---
-- 
2.7.4


