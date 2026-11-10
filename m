Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14730.1794294022564328298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 23:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ksjqi//B;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so364061eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 23:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294022; x=1794898822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NeTuHPwL6oFAtpem8qJUw1pz33nsNTuT1v456QzRfbk=;
        b=ksjqi//BcFo2VEE98GAaPr9Y0IQy3xhlgfRYQYGI1xFBNlnZ8313NOYYG/WzDii6c3
         O25zYLzc2dljxshKDh/FPQr8O8Jt8lkQw1lSxFycTEKHpHT/NCU3L3rFpmZfrTM8bo7v
         dokFg7kZcu5m1es0yVXpwgnLXqe7nJDC1Dy3FEJLlQ2HqJHVGlWZZQ9/KAykXml3aqtE
         ImYkuRaEkhOwoVGR0sdYrQ+9Yu0mRUvoLuipOFwvbORMF48KDN64nvIRCot51EgEJyIq
         YVgkpewLhRuw6wuvI/sqR2hkYjxQu07lHfebGAVN630k8Gn6+AJcIe/ID1PVDyVzwnsH
         IK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294022; x=1794898822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NeTuHPwL6oFAtpem8qJUw1pz33nsNTuT1v456QzRfbk=;
        b=O5GohcPeayehtgam4H0looXXU7RjliFbrNOn/yFC4aqSRERGkFgMZnkhJXyxFMQ6Ao
         6Ekk5tpjMWcclLUXNvUb1Oy+c9H0nc1hM7Y22rTzmhLdJH/o+v9H4DdTxFWBX3N++EY4
         BpWrHUojhC1fLdxQSFeI0lhMSg7DilpLvSQByB7HCoBsO3q49y0pRGZW1l2IwQLp0Qe7
         CYdMsYFXpQ9IDTHni85Z2QLKtkhpdNzwdQ9Ty4m/q0q+lmDx8OoGiSVdG7nwYh1cjugO
         /XJBhPIDKcY7SMK+y9dWs6bGlNij4WYnWsaHHN/A/lxehr/tmNeSoHHXkLuzib6oHsti
         JyMg==
X-Gm-Message-State: APuU4Z+vaR0h1W5bSusEomlEUQSQjLCfSceppcQ2oFHTd9CwCU7u+LD0
	GU1AEFq3IHtHNGrwGPa+8HG4vf3dIGCP2BI95lMkAr85gBbYHvCmc6v8N3U2Q1k4aKU=
X-Gm-Gg: AYBFou10KmH1D2xDxRGKK5Z50AfbGO+tc9+DOMxepJYeDiTzWW5emG4Rxs/HzHJalYa
	k65DXZ/KgBWa/icA7nHZCVacmHuKwN3Ql03591HAPoYSiNzOaJYvjhVA9lFuUDF2Co1C6X5VZ1e
	dc3DlTad7Ep7w8i1GsFr6+QPiquzit5som5lZ5rPcqeBZdTYuAQV3i3lKpXyrQb+Ihe1zz5qNnO
	TklN9W45i7NeCXuN6lcl5YGshKCJxGbj402D65nerJzgEBjf64zzPilDeIk7SxqwEm8u+vG90Bj
	bwYXjLYpU18UwyQ0FYurSHvyIkDCNiZM2CGh6rpoFVwF/9a7erVdS0pOosy1obJ9PtazFaFrgjx
	ryHFNuGbB8EZwjKQjj/9TlRwpj+/2gTJn5yhB+OeWe4U7dZXQ1Zx1u8QiOT0K60QeD/pfV1QE3i
	LMzhgwoW3Gr7nleO1LH5mrlmk8gPd86zzZGSXHHzf9zMDJkfKwh2/WbG4XmCXe6nZIquMS1UuGc
	jhmTdHlcCl0aN7bzh3RWOBwYOXKNZl93hT62jOKHTFLHewyurp7WSjLcYAsXsh+IhPhcIRS44uo
	qLuyBVJz5TINehM2D8YN12ntpkNdZy9jJBvX5qL6Pps8zOL4Up7038KY0TcdylrdiG/hCkeWj7Z
	WHofxyOHB3tOrUcoZVvYrvC4r+1fWMokq7egQIx/07wZ9iYcaFoPC5E03u4izSIa2/K/lqgUw5S
	159mJOjt4xATb+tSgO/HFzMIC8DClxV8x7JMwhZhmIATLEz1EEkfG6GzVgHlMTxwdasZu2QWQgA
	XnH9u/JMcMYsT3sC/nWgO+zhh/VJWV82caNaUpJ9hFcIBnnuUiZkugW4JGQEIHsCZKqMBbQjiv+
	IQLctA==
X-Received: by 2002:a05:7301:a01:b0:36d:a466:9d0b with SMTP id 5a478bee46e88-3751ef7c90emr2385273eec.19.1794294021447;
        Mon, 09 Nov 2026 23:00:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ff2ab59sm4532278eec.6.2026.11.09.23.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:00:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] libfaketime: Fix build with lld
Date: Mon,  9 Nov 2026 23:00:17 -0800
Message-ID: <20261110070017.3292688-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 07:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249905
Content-Type: text/plain; charset="utf-8"

The version script names symbols that are only defined through .symver,
so lld fails with:

  error: version script assignment of 'GLIBC_2.2' to symbol 'timer_gettime' failed: symbol not defined

Allow undefined versioned symbols with lld, the .symver definitions
still get the expected versions.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-support/libfaketime/libfaketime_0.9.13.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libfaketime/libfaketime_0.9.13.bb b/meta/recipes-support/libfaketime/libfaketime_0.9.13.bb
index 7280d58cd3..bcbf53181f 100644
--- a/meta/recipes-support/libfaketime/libfaketime_0.9.13.bb
+++ b/meta/recipes-support/libfaketime/libfaketime_0.9.13.bb
@@ -11,6 +11,9 @@ SRC_URI = "git://github.com/wolfcw/libfaketime.git;branch=master;tag=v${PV};prot
            file://0001-Mark-write-only-real_-pointers-as-unused.patch \
 "
 
+# The version script names the symbols that are defined with .symver
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
+
 do_install () {
     install -d ${D}${libdir}/faketime
     oe_libinstall -C src libfaketime ${D}${libdir}/faketime
