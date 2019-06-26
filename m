Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 030737E553
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:43 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id y72so1481081pgd.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+HulGfqPwKhm2I9UKtZPDZsHeVWd0nok+am0VRPF7Wk=;
	b=JJ497Ez3eY3f5CEbhu9eQiqEDiEmKk+OOjmw4AoBMdR9kYRw55vDznCrOaH2Q7xmAe
	HZvDXO9t1kzMtsqe4I/0v9oczd9iFKSP+VPifLTHI6kCMNPIJa4pwUfDwrvhLPup+xST
	zEQB1dhssrY805Th1PduE/azvW+rp4/EtkyHjlEm+DuiaAEUa89JhrH8EW3Lm/BMNaQg
	FgX5BWB2K8Y71ZGdAvWCsx8Yk6n3EJnUsGDyVe5YcyoE3mwtXqf2N2ggDs2PI+qxoyZw
	OnR8dsEK5CaCHxuQpBBQ907rRFZO/yg+zJ6rW/IkMT6n5PfLlm9TtxnY/Ho1ZrWB2uGI
	vylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+HulGfqPwKhm2I9UKtZPDZsHeVWd0nok+am0VRPF7Wk=;
	b=lKZE5e5roE7JVc3lPjmWNsLlmMwRBqzqWdUsBvnVFhGJdV+BiYOwIUn3HuSuwmf5ns
	ulj4Sz7AO9iwyJ4wjZIUKlReXhno9nZe0i+EAfyoCMlfbRxrO8/SIuSf+W0zjAA11FUV
	+cTMRiGJ3GJdhoc41BMTwwP+01X5zYFlQ9VbdfNbrBr0QT0WqasP5OVKRO3VKt0khT8d
	/AvTYyo3yEhcMok7OAMB/WdJCbui6jgEzQTciXxl3lairvjQvRRoXepBjU8zXNzFErfV
	Qz2lJx27WCBbw4qxUSLSgK0Xjsr3uj1nYa0jh3/mT8PPLejMqxzDFzIbTrFuLBVmC9Za
	dnhg==
X-Gm-Message-State: APjAAAUGVPGc2J5YYqkRJaseWXDLiMxjmAa1LoLOrHCA+DO4HqWWBTq5
	tHQURDeSvAAE5Oz+Jw1agSsVfphQrmE=
X-Google-Smtp-Source: APXvYqwInrlGbbIWzr7fZ0z/CcvR+EM3Km/x04DgXWydeD7IezvlsJBwfilVhV+LJqPYZAB7XEeA5g==
X-Received: by 2002:a17:90a:22aa:: with SMTP id s39mr25797pjc.39.1561568025015;
	Wed, 26 Jun 2019 09:53:45 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:11 -0700
Message-Id: <85541b9ae8cff770e2c20a9132c0867a25d190c2.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 10/25] cups: upgrade to 2.2.10
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:44 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Source: OpenEmbedded.org
MR: 97351
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-extended/cups?h=warrior&id=fbe7a0c9bab7c9be7fd2c0da8b2af61e66de1ebd
ChangeID: fbe7a0c9bab7c9be7fd2c0da8b2af61e66de1ebd
Description:

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

CUPS 2.2.10 is a bug fix release that addresses issues in the scheduler, IPP Everywhere support, CUPS library, and USB printer support. Changes include:

    CVE-2018-4300: Linux session cookies used a predictable random number seed.
    The lpoptions command now works with IPP Everywhere printers that have not yet been added as local queues (Issue #5045)
    Added USB quirk rules (Issue #5395, Issue #5443)
    The generated PPD files for IPP Everywhere printers did not contain the cupsManualCopies keyword (Issue #5433)
    Kerberos credentials might be truncated (Issue #5435)
    The handling of MaxJobTime 0 did not match the documentation (Issue #5438)
    Incorporated the page accounting changes from CUPS 2.3 (Issue #5439)
    Fixed a bug adding a queue with the -E option (Issue #5440)
    Fixed a crash bug when mapping PPD duplex options to IPP attributes (rdar://46183976)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/cups/{cups_2.2.9.bb => cups_2.2.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.2.9.bb => cups_2.2.10.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups_2.2.9.bb b/meta/recipes-extended/cups/cups_2.2.10.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.2.9.bb
rename to meta/recipes-extended/cups/cups_2.2.10.bb
index fcd96ef..490c84e 100644
--- a/meta/recipes-extended/cups/cups_2.2.9.bb
+++ b/meta/recipes-extended/cups/cups_2.2.10.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f212b4338db0da8cb892e94bf2949460"
 
-SRC_URI[md5sum] = "798e83bb1a240f5417a252903d83ae0c"
-SRC_URI[sha256sum] = "6d22d5da253b97643320da0bf95574acd85ff2abe3ec1a51d36093841d891156"
+SRC_URI[md5sum] = "3d22d747403ec5dcd0b66d1332564816"
+SRC_URI[sha256sum] = "77c8b2b3bb7fe8b5fbfffc307f2c817b2d7ec67b657f261a1dd1c61ab81205bb"
-- 
2.7.4


