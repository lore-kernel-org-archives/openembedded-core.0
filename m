Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id BB4507FC10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:24 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id q22so9977317pgk.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5liGOUgBXnk64B6zwi3W99iC3+rhBcuBZjYiuJHcvgs=;
	b=Szro6TF5Jcn//jV95bk6Z/qfaTWe2C1FAMHQw9mpYgI1zvlpQzpzi/4nrOBjFT0gUf
	++kF6dUIWDR3hJ6H7+BBamHzFBlyJyCAj34FSJZssmGNn4z3+Z4MJOB2wHqASuJ4IjTe
	IshNeT29RKdudQsvCeRfO7w2ZjKnSjcIetrU1GNZ1vLNYqcNew6t6tzABta3ydQ9RFSl
	XkHd0uNHkClF/qmDP5nBa3EqRNt6b4LrsPE1sJpzYgl8AJqp1pjZ+1eHq2tjEUfG+aQb
	OBO6ufIOgJckGjH1u89gyny4z2XFc/LRt7p1WlC7Z3nqCgc/91Jtt6bY6riJ9BE8AG0c
	z5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5liGOUgBXnk64B6zwi3W99iC3+rhBcuBZjYiuJHcvgs=;
	b=ARwcIv76+E31xuLKiyEZ3o5B903qoDr9woLytDWTeKtQd+DKwuAF+rSLIh/TmSwcti
	j7trLUyby5aqyBZwYGydNGZYvMTD5MMaI4dXePSEv90XgY3TN9rVVQOTjYLpExEqunEW
	E8impNVysJc/LKSbnCktxJZgbcGspaErdcqHVZX7mZKwyUpvglBtuTeoQyMiiq2+evIt
	Fd1ZriB/tszrpkKx8M6CItoePSKZKH2ZMiEo5IMPYlyAXfNUdzJGFISQ30jRZZYY4OQ+
	jfOLpgflfbwxpH+c+4hshYIdnEM7BCmPXsJoyx/59h6Cg/aIPutKITNKK0B2MUBvt1O/
	X/ng==
X-Gm-Message-State: APjAAAUWx7ox72r/hqJ6yg+gR7I9KJ1Uh7b+30gkvq3uordcuEgx7y4A
	M+JxpBO27v0G5j8wuNiAhFEfJ6Nh
X-Google-Smtp-Source: APXvYqx6PyrsWa6v/VnxjaCRqXU8WVoaMQg3yd1Sbm5eL4mHtpDLC+S0FZ+5fadPu75ZNqY2CSxQ6g==
X-Received: by 2002:a63:3c9:: with SMTP id 192mr15214298pgd.375.1573497025711; 
	Mon, 11 Nov 2019 10:30:25 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:30:00 -0800
Message-Id: <624897ee788fe026a04951baaf770daca43e892c.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 18/21] rm_work: Promote do_image_qa stamps to setscene versions
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:24 -0000

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


