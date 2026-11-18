Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14352.1795013707004788699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 06:55:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VEGejllK;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b244fb7fffso1132897c88.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 06:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795013706; x=1795618506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q4E0Z32K71U/fWWkY7HAAlA9EXsathrazFTMCht+5Ig=;
        b=VEGejllKjct7Ny/4Z4fiIEbK10lakYN4a3G8hbh47jZQvF1lO28XS9xoj4lHe1m3nM
         duRAd7f13FjvR6FgEgE3AbNf+dPJJLalR4gxEoRb7VwA22yCs70KPDnTnpoPYgFbII2r
         X8W3phiNtTi35OeadgHGO1lwEMJ/5UCZ3RHPJ23NMHNpdkqUee6u5pkTO68ERroVYecQ
         9kM/lHMCQ2RgXoGZxu6nsUNWc38WHezKFwPRSSUd/TXjio0ZAA+4fTb77vWMHPf4Lpz8
         ShhAMQMA4nw7J5jKbLlL5znJ5EyGAOasc95iDA7OkkRSi97xQgtxRNrvLxclB0zXftSE
         oTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013706; x=1795618506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4E0Z32K71U/fWWkY7HAAlA9EXsathrazFTMCht+5Ig=;
        b=pY/imHKzLyb9Fn0V/yjOLrHMiD1/F0YYL0gCaqIo5yD5GU3xATlQB11IA7iPzKIn2S
         rcXBSIN3pbrydO0V/+dIQOhm2TZJGEtT2SpxPTkJI0l2LSCboYMoagR0p/tcFNYTO9D9
         Jw59NcTU8Y01+BvR0CWc6sWP2CcRQeY+WSz0XOW69irgkixO2GnjolycuflImzmW7LsC
         yDX+6W05l4J6yRZH+ZXTwAp1g1vuKTp3Ch9txGtmza4CetcrlOrsubj7evlmQJUwCxBd
         owMZ5Qy1rpj7YCoNX9mTOzd0HI9ifHrnB1REvLGQeu47674ckjp/CMRs9cLOBDcDzcEw
         f++A==
X-Gm-Message-State: APuU4Z/0+iocI3dxi4QT8VwYUsKRV+QW3H4TGUkPpFaa6coil9Fb7DGq
	mbIF3l/jSPAa/+AI664lZ6ZL4Qet/4Rbnb/YrG0xjT/iChWl/d0DYAx8gwQiNfiO
X-Gm-Gg: AYBFou23yLca99AK4no/GzmXZTfpKy/iav30GsH36Su4TuNj0Dp2EIW5+3vOBxSHDT7
	sJLSP5uhB+MM6+kdMPA0Dlb5x33woHP8anmJGooNbnF88TYwXPjxGR+J4Ted4HJoFAQ/s0rBFth
	vGvO5Sz9p8Jm85nSzMky5INQ160I6tNk1J3zKWN86RrMSIUZJpG0rWJesNZSZq673ZkEafA6Eng
	fVmm4zSp4RHjKBWdcbxSZUUNlgYq1IADiAY3259V1jq7oslYmfOpR5EsH4maUZB1MSiOjgjm5/G
	EOTcwlcX8VFpXRRNsmHwUo/F86uBdzTtTQCK9qKh059zwbW9Ad5qJ0ZulRqYT4RjwRjVCiz8+uM
	slPmaB+H9kbRXVGXn+1/7yNasw0DqDqUItL3FygYSZz+RimtYkkv46+iYfprd5TsaX1cBkqHXQ6
	P+IZXeUkgHeWEb/1DCQoXzMe+vKr4RlpX3QhJjvLld7+3f00U5ppbAQFJdnlGJjW3WSrfy3RRK9
	MgUFwpf1Z3sfs9SXwXrjvBuaEd4OxgoyzWkBtl0EdowMM6fkpQMVZs9QYCUpZtF7fS2pFeYpYqu
	cky/baLxZlZLpqjIHTJDA8OGfia5TWdUU7UbRmBmqphuBeD7fCe8se2yI5CDQQO4vL+MqWSL4gC
	DbGAAenhEvBh0AXaGalbkgQszIJUg5inFJZIISl/Zl4gZscQW67htfAXy4JeQDHFcppr381E/xY
	53v8tCNKusXCnHnOrASmmz5e9vdYPJy/ULD+6EB9qKk8i1RazGyhUKnz+OP94BCfgC+WMkVjFJC
	uCN2GcQMWpvnv3DCWHW/SohpWQ2EkU+cAOMnzhQqOWkY12I7vNVk1Y0Tt6Y+n8rBdgpp1mgtzi3
	ooarXx7YzqllSsBrh8aa0jbJrQ==
X-Received: by 2002:a05:701a:cccb:20b0:187:efba:9ba2 with SMTP id a92af1059eb24-1b543d10232mr2724904c88.44.1795013705866;
        Wed, 18 Nov 2026 06:55:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304ff2sm8678804eec.6.2026.11.18.06.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:55:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 1/5] libtasn1: Enable linker version script explicitly
Date: Wed, 18 Nov 2026 06:54:58 -0800
Message-ID: <20261118145502.3243739-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 14:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250551
Content-Type: text/plain; charset="utf-8"

configure's linker version script check links an empty program with a
script that assigns versions to an undefined symbol 'sym'. lld defaults to
--no-undefined-version and rejects it, so with ld-is-lld configure
decides version scripts are unsupported and the library is built without
any symbol versions, silently changing its ABI. Consumers linked earlier
against the versioned library then fail file-rdeps QA, e.g. openldap:

  libldap.so.2 requires libgnutls.so.30(GNUTLS_3_4)(64bit), but no
  providers found in RDEPENDS:openldap? [file-rdeps]

Every supported linker handles version scripts, so enable them
explicitly instead of relying on the broken probe.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-support/gnutls/libtasn1_4.21.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnutls/libtasn1_4.21.0.bb b/meta/recipes-support/gnutls/libtasn1_4.21.0.bb
index 236948a861..ed568464fa 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.21.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.21.0.bb
@@ -19,4 +19,6 @@ SRC_URI[sha256sum] = "1d8a444a223cc5464240777346e125de51d8e6abf0b8bac742ac846091
 
 inherit autotools texinfo lib_package gtk-doc
 
+EXTRA_OECONF += "--enable-ld-version-script"
+
 BBCLASSEXTEND = "native nativesdk"
