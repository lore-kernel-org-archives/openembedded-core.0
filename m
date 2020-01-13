Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id DBA927FC93
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:35 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id bg7so4417433pjb.5
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XKPji6M0rhJQkrhg0efpBpgvZ8XAe34bP83Dj8zwtoY=;
	b=R4MItH1LToaJOsdSvf1t6uryP5MSBLdClH0Tr4zD6NCs+bDiqZ723ErKoV/lxqVg+c
	GpdS8SBFaZhMfLTlYnLeCvwP9IFQMZv2XLUvqfhahmRCPkfioD8WmC/qYazNor567uPD
	BrQrKGGE41ctdB0vifDj/HFygygNTfbfGJhT747PhnC4toCkyVWLTG9Q1/tygfCEiiql
	bOPInQZXk5zyM7lneLIJJ4/m6g91Ydfk+T9Lo9jpRMoy5TN2mhJus1xqhvUTx1sc8FE3
	/i5uC382JbVbwx7T2BiBcT+7AQE4oNoAwZndgX2k0hymsLJgzW8WRBGVEymUkgMRI5W+
	Vx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XKPji6M0rhJQkrhg0efpBpgvZ8XAe34bP83Dj8zwtoY=;
	b=e+eWlH9vDfCpKaS9Uq9Ne/iN9WVeKaRFNYPhYAf9w53FCYjCzMXeNmAIoewB31tPmU
	2EkeKfBoS/8jQ0pyqePlOElKKsJyZzo2zP5/V7TS/HASWL+vAnFn9jsuJHd4d9iFYjTA
	ddQPHQ9MOuItf4kEH6Co8qFSPFxlQamZMoiscHHz2avtaJMvzulqlT6dJdBHGmXff4bw
	u84J9qTERXMX4rM0BquiWWnPyVviAtpQbeEp3sgbymKNjbuXLXfqCDtTOX/HmFtAIM1/
	jT4X4vDlO09MCqEOjAQTkXqUnhv37tRDXqCbQG5aWJtlL1ePRHs8M1cazXBJVJfpLvdu
	O8/Q==
X-Gm-Message-State: APjAAAXs44aXUA9OWtv5rbrGKrEMzzCkNe90OJsnw3ZTi7vN8NMPPoSM
	IQ23ui5vXALAGDZcuDHHxIgPeN5z
X-Google-Smtp-Source: APXvYqxhhzZYK6UdyFLxiBLxUOWwIrXjCGclwLSFCP2cVwRnUEt6ASm2JWnFp0fsP0fM6BoS32WExQ==
X-Received: by 2002:a17:902:7603:: with SMTP id
	k3mr14457082pll.93.1578929436815; 
	Mon, 13 Jan 2020 07:30:36 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:04 -0800
Message-Id: <154e286042c289cbd225ba82aaf1247714aee857.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 05/28] ed: set CVE vendor to avoid false positives
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:36 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/ed/ed_1.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ed/ed_1.15.bb b/meta/recipes-extended/ed/ed_1.15.bb
index c79310325f..886c3ddcab 100644
--- a/meta/recipes-extended/ed/ed_1.15.bb
+++ b/meta/recipes-extended/ed/ed_1.15.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
 
 SECTION = "base"
 
+CVE_PRODUCT = "gnu:ed"
+
 # LSB states that ed should be in /bin/
 bindir = "${base_bindir}"
 
-- 
2.17.1


