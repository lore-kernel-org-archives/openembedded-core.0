Return-Path: <cjp256@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA6178263
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 18:38:53 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id j42-v6so8285711qtj.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 11:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oyT7wb9ene27UesNNUVfmXDpoBzRi7P+7Vlgj7fmDKI=;
	b=C3nQfTddFqOMMyDd1axQbImj2FfyordMUpy9L0QKzhG89ThNQdYa6ld7E3L53R3Kxf
	0Q3zGeETpvL8W27ePxRv92MUNsA25LIkqwPswYfk0MftELEmMaRPai0I/VdqZJ8M+kOr
	6xvIcX1/a9llZf2n//KpV52upVfWyU62vEUtTbFOCtgCp4y5clGinbv8VzBRRHJfW1Q+
	OyvnjWS3Z9fYpniSnXRp7QSh3zYZxZc+1FAYE1xqcuMYUdKFHStf7mDSDRwGYkabk+zI
	SSxDCC/ziN98Gb2BsXxc8d6+PG4FJU7DrYXRCpR9dSfhbRo+UT0FHzy/CNm9LYir7swd
	n5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oyT7wb9ene27UesNNUVfmXDpoBzRi7P+7Vlgj7fmDKI=;
	b=KCWvCAeZtJcbIdIUAEwwlLRx3Iwe3r2dT28kBlmRsyfk2AqcO2wxv4djastcuHAjbY
	lJsR2/5QBQDl6/CZPSIhPMYam6w4oJ1Lzta3VtJ1prZufYjjJva7vWy001AdxyBKJTM9
	SWsuJQ8a9RUrWqh6tmEoUAdavWbRuhix27TxeyR1A+N63ir4Se/eyH9/HgwZ9qahrpmw
	rwUZyUEe9cck2/JvFOkb1eORr2qzHHz6NhDzEODnG6X4s29eCLUQrosIIgvVn9swegAW
	5TpCLllOXfO/VplGrhfB1JmkXEgjWyOFePbgbsnnLbdEX9TtesypqomaC3d9wSJUweZW
	cxMw==
X-Gm-Message-State: ALKqPwcgqAfSy+ww3kI0W30c9vSZqKTEqJHmdg57cmkxoCiHPEPXkdiH
	HEKSchUreB0MSsrik0V+v6E99RK0
X-Google-Smtp-Source: AB8JxZpaOacx2kl7uu6gWQVoc4+dymu8yuEXyrLfMD17KxGuVoAt8A8/u9mSwTYMr+3dfnGWP3s52w==
X-Received: by 2002:aed:3ac3:: with SMTP id
	o61-v6mr6679118qte.335.1526063934504; 
	Fri, 11 May 2018 11:38:54 -0700 (PDT)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	c4-v6sm2633651qtj.49.2018.05.11.11.38.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 May 2018 11:38:53 -0700 (PDT)
From: Chris Patterson <cjp256@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 14:38:43 -0400
Message-Id: <1526063923-32176-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [meta-oe][PATCH] strongswan: package up sbin debug files
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
X-List-Received-Date: Fri, 11 May 2018 18:38:54 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb b/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
index f2fe1f1..5cae6ac 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.6.2.bb
@@ -46,7 +46,7 @@ inherit autotools systemd pkgconfig
 RRECOMMENDS_${PN} = "kernel-module-ipsec"
 
 FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS}"
-FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
+FILES_${PN}-dbg += "${bindir}/.debug ${sbindir}/.debug ${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
 FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*.la"
 FILES_${PN}-staticdev += "${libdir}/ipsec/*.a"
 
-- 
2.1.4


