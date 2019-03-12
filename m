Return-Path: <tom.rini@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8CECB79D62
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 20:07:28 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id n14so3411750edv.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 13:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=INE86XbA7oebMb7l2Q3+qVGBHwmhuGB7aqYh/QR8gM8=;
	b=nekSDwMwllCCbG1qurfz18+WdjGBtN31VGw0Puw7tKQmzdkdgVnrAtp6a4xWIRAEBr
	ff+V8G7yclTP8i/PauhMrNJgGOP1/9zONgEP9oquaEtMih1B6RyONrDFO7Jn2SY6BICs
	bv31EknpFIvagx38trFOwVOk1fhs7TlSAqH/PE1FV2NJs95udC+eXgTOJeYaFldN7TYI
	DANAAw0Il1OB3SnE0ZxLUo/VRJi1tDSHAJDE3DQWGyK160wKkg16KZ3DJuIaEzIoKIlE
	rQZL4HvyDwW4MXIMIhoieH3s2RLVp/+6cJvr0ZfKHAIQReYuCaw8z/DojV99Qxl5OTxM
	DAGw==
X-Gm-Message-State: APjAAAVH/YJxrNJGRDnw38T6FPd7GsM/nTccyY+329eVdaxUNx7gN5K7
	BRMaUQ7ShFle3/cRd/BEBePN+qk=
X-Google-Smtp-Source: APXvYqzdfYpLgIwTJb+A/D6++hKAQvrbMePp/Z0AQOHl4ksGj3cA652Ao3/7lr2GcS0KO4JoEueDUA==
X-Received: by 2002:a17:906:4dcf:: with SMTP id
	f15mr13072703ejw.32.1552421248787; 
	Tue, 12 Mar 2019 13:07:28 -0700 (PDT)
Received: from bill-the-cat.local
	(cpe-2606-A000-1401-8115-DDFA-B95A-8656-E3E2.dyn6.twc.com.
	[2606:a000:1401:8115:ddfa:b95a:8656:e3e2])
	by smtp.gmail.com with ESMTPSA id
	e11sm3879621eja.54.2019.03.12.13.07.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Mar 2019 13:07:28 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2019 16:07:20 -0400
Message-Id: <1552421242-18570-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/3] inetutils: Remove talk / talkd from ALTERNATIVES
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
X-List-Received-Date: Tue, 12 Mar 2019 20:07:28 -0000

There are no alternative provides of these packages anymore.  To avoid
QA issues when building with musl, don't put these under an alternative
at all.

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index a27dbae2e688..4a00e2b71d9b 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -110,8 +110,7 @@ PACKAGES =+ "${PN}-tftpd-dbg ${PN}-telnetd-dbg ${PN}-rshd-dbg"
 NOAUTOPACKAGEDEBUG = "1"
 
 ALTERNATIVE_PRIORITY = "79"
-ALTERNATIVE_${PN} = "talk whois"
-ALTERNATIVE_LINK_NAME[talkd]  = "${sbindir}/in.talkd"
+ALTERNATIVE_${PN} = "whois"
 ALTERNATIVE_LINK_NAME[uucpd]  = "${sbindir}/in.uucpd"
 
 ALTERNATIVE_PRIORITY_${PN}-logger = "60"
-- 
2.7.4


