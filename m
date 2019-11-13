Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 278537F89D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:53 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id c13so1897750pfp.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5liGOUgBXnk64B6zwi3W99iC3+rhBcuBZjYiuJHcvgs=;
	b=VsmIHyHA8sGy4jMDorOcjKyzB6mG8dm4Ti8bJIzf4qSQhHyd+PYY9wFUMXmCrGk2As
	IFjpCoMCoPCGXFgOhoNpT36GOqTVXYAfXsKpYHgOdoMxHwms7+OkLpEouv2GCD9GtDEG
	4PrFq482Z/OpNjBPXG8S0pR6BsrHWiLYKXPwf+pndIhSm20on2fg6+B2DiiBthCfbfxm
	c2i8HPcHNg0F+k9YoqEdg7KxGRbpZN6NUbQhxdBx8oGRH2l35TK3HRKmqvtIcuxpnD+3
	xsdme+zeSxvQFi7IPVVWYAsn4/6h1ZhLe0a+NDAnz2wqOou7kozqJhgOS8zjo9qzLVOO
	7QhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5liGOUgBXnk64B6zwi3W99iC3+rhBcuBZjYiuJHcvgs=;
	b=AnHLjzryvShN+IJ1GNU0uQE1ZOBQnVw0C8Gh1uDQnOYjYiDcbyuxPHz2Op2yRH2GFO
	t/Jlz/em8XmPF1TkK5IjtUU9A8TKTZCz1o12kxlgQGkk/Pwigkg8YWD1Eyw1lSItt/td
	X5yGMJWHaq6HF6diujXuQPC7qjSZvBkHV7NeFE1ISdtyyNoYJCxTB445TWPjYVGdxucV
	MVMcRBR1P+hhg1WAUk8hode2tVvFYVAm9h9gVByaVE8DXdbGraqd+6rYjL7X3p57d1RK
	j22Fksbwo2Z8LV1Kz72TP5emgocBbvst4swR6asTz5NTUbDePs1CpfpiQuzLk2Eczcv8
	o3ig==
X-Gm-Message-State: APjAAAVYgIYNxGBUiw0Zjwm/ocqhX4rXa8Jpd8hkFC/6PElEsyWh5DNI
	oXYYQjW7K/OGHfG3/+xuF+MxvE7V
X-Google-Smtp-Source: APXvYqwLp+Xupl9IIZVc4pSF7ZDzkBG0g4qgqczBWQzGJeWYfcz2YG7S+QME+tIeOCscfGw5FI2wvg==
X-Received: by 2002:a63:1464:: with SMTP id 36mr4350807pgu.445.1573659173738; 
	Wed, 13 Nov 2019 07:32:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:32:10 -0800
Message-Id: <624897ee788fe026a04951baaf770daca43e892c.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 28/31] rm_work: Promote do_image_qa stamps to setscene versions
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:53 -0000

From: Jacob Kroon <jacob.kroon@gmail.com>

[ YOCTO #13212 ]

Suggested-by: Romuald Jeanne <romuald.jeanne@st.com>
Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/rm_work.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index a6bd3f7..0bbc450 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -64,6 +64,15 @@ do_rm_work () {
             mv $i `echo $i | sed -e "s#do_image_complete#do_image_complete_setscene#"`
             i=dummy
             ;;
+        *do_image_qa_setscene*)
+            # Ensure we don't 'stack' setscene extensions to this stamp with the section below
+            i=dummy
+            ;;
+        *do_image_qa*)
+            # Promote do_image_qa stamps to setscene versions (ahead of *do_image* below)
+            mv $i `echo $i | sed -e "s#do_image_qa#do_image_qa_setscene#"`
+            i=dummy
+            ;;
         *do_package_write*|*do_rootfs*|*do_image*|*do_bootimg*|*do_write_qemuboot_conf*|*do_build*)
             i=dummy
             ;;
-- 
2.7.4


