Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5CEA87EE24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:33 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id a93so17848604pla.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+HulGfqPwKhm2I9UKtZPDZsHeVWd0nok+am0VRPF7Wk=;
	b=Py5ZSyY8MDvGZbgIWOfY4GMsjhmF9cTl/blQzd92IkVMMYEM/6qDS+YG17rqn5g4Zi
	VANzPJbYfftbXt3PtcNBCKOJzU3J6BABLxob8ncQ3Ie9PfmDlYbU96eevFQ/df+YU+HE
	9CE4p+9Ql3qUU3M6+XOJglXOPYvopsTfQsEbPxR+7NKmQnQS7c0Fzd93QKexbQmAfTlV
	qCpM4LuYLlLd5HGKpyEXkrCPJFtHlNSbSeAVcrMgfQXwPk1QHME6PRJGneSN9IumiXC3
	mUB7p3HHNiCvTlL+NfzDukY8bZD0Mddx1F0ukO7XQZ66PIOTVfyhgMY/yZsizQE6nlBD
	WhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+HulGfqPwKhm2I9UKtZPDZsHeVWd0nok+am0VRPF7Wk=;
	b=hVS7RM6ntly4IO6bJ8tWLd9DDiir/SV8UHjhB8OEgCkOwvmqWTLU1bjNs3hN8IY7sW
	8vUYzN2DzdCUNbqNExz5a0qMyYgEoWvVFmOiojIcS/QUSDo86/Lr0tZ7nIMPbpQHPJxh
	iQPsbWNqgzvpco0PShFJ8GqRN2tWIorvyl5hp5Rnv/FZ+4chl7D/BJZdVQgYf1/NzHpw
	vttjXRpZEwncSfAfPrx0eSq7QlyxNhzYcs/jj+HlTBPxGIgtrrLR0WKP2gMqlT3v2zN2
	4VUnV+S+a1qWlQS/PQuWG0ojkvw+uRHnQ0BHz3NqvqpDzUqpXPuIa5o1TfVYksR7Wa7Y
	d1kA==
X-Gm-Message-State: APjAAAUH05p1KR1YTMDTo4ZABoDbeiRT2DHE5Bvgng1DH2g673Dm4v/v
	U2SsFzt1u82febllDy2xTTcPj8CG
X-Google-Smtp-Source: APXvYqwzhZLqsLkVhTwlA87/McINyD5Y/UBZOq3j60PZQt0NWkpRCnvd2EA8y8MGuuDAnHqyJNpTeA==
X-Received: by 2002:a17:902:7488:: with SMTP id
	h8mr48367159pll.168.1563719134282; 
	Sun, 21 Jul 2019 07:25:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:24:59 -0700
Message-Id: <85541b9ae8cff770e2c20a9132c0867a25d190c2.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 10/30] cups: upgrade to 2.2.10
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:33 -0000

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


