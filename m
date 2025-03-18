Return-Path: <makchrbiz@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAA5C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 07:10:43 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.5936.1742281839787856124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 00:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B5tNopYI;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: makchrbiz@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so873020566b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 00:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742281838; x=1742886638; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H2jygySdP0OsbQQN7FXg1+tRxa8Zc3ztihG32Tm4XCM=;
        b=B5tNopYIA0bL9XL7VG42G0cHDo2369uTQwwAI/vCoME701t0RQMs+yO6uWJ/TZ/J7W
         t5rLu/x0jUsfW5w7rlRqCy0wtAU5nFHzXn+SGG8sYuPMkeUbg3N1h3esIWR8AuSVKCsY
         QqAP0Ot3Tj6TgIb+EuSP3XoNO09LfLQREEzo9Qc4iMOEtmqeHgl03VcyKKlw8ApDc3NR
         gltH1yc6aJo84rk45iobMtPjuXU6ORduKN2+VKu++vYRLp1AHiy/mMPcw5QDOhvlycPg
         cgstvvIh9wkdRRH/I0jM2lReZ0T/gwdzy4H9iFQdOPXOb20kGFlL9CHih7oFlAb5A0JD
         sgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742281838; x=1742886638;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2jygySdP0OsbQQN7FXg1+tRxa8Zc3ztihG32Tm4XCM=;
        b=Kl8QGfeJtwvVp5Iaq1Ata8jEHTEEjH+4bZHr9JGT4FWegGRRP5zUIIuIAPwi+uZlCV
         SEXs7FpUijnAEXuRlzd5yJQNFl0lB01Cb5IiUoRh76zsQPQ/HboGAQdKjBvKY13R/PoY
         VfKn9iVv0z+Ro3gmGAB+umZCUkeBFlNsiG5l8Njj0GMni+vcPkCFKCqIUr4yMhTMJZk7
         dbN7GhiiP6Vl1LYWfNcJcUFBO8tT6p3oWhHGuKnMLhQNb7cPKQ/feBJbIDGMrJU5+hFv
         Ol2um+MxyQO0y/bOutmFQeS1HGKX6WvOAln0eoNY6pJC/rxZx/nDaDzRaRZiohEql9Sj
         BL3w==
X-Forwarded-Encrypted: i=1; AJvYcCWmn/viKDysZ7BUPLxnY9WH6bLYVNQI7Hn9+NzZlI17knde9GsBz/coo+SLS0/sP8GcFg9Mubbt8wS0oe2AVGuK1Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxgtzh0kLZ7E56aVPHlBX6NEAohm9/iU3AvuGqfE59LedvhVOok
	xmi2e4NBTNnZ4hggSwIF3sNpjhDIqHx4CqiMrvKViMYlWZLKpLdJqyOF5vZaMR6KNjihdLxHZjw
	reXJ49KDjWruw4QDpDcQNuHT7/hY=
X-Gm-Gg: ASbGncuolRNs1JYB20rUgyHFdYRR9MQoFpdhr1zfiOAfrcPtC8xP2d12uAsoCsILfEv
	hX95257JiAbcuyzmeSSgGfU42GRvItpbF20emFVVFX4OMoe7cX6a1fmYBJ5Se1SQjCo6a2qVhFu
	bXxvm+f9xE3/2kDU9DxwU639NXcQ==
X-Google-Smtp-Source: AGHT+IECPEUl1EQPOo/ULjYXM47xYJxxYRd7DQNPX9yqsU0JTcpS3469FbGN9e3ff5RPCQiekuEGpzLtmjFQXm1trXE=
X-Received: by 2002:a05:6402:4407:b0:5e4:cbee:234c with SMTP id
 4fb4d7f45d1cf-5e89fa29a4emr13713762a12.10.1742281837818; Tue, 18 Mar 2025
 00:10:37 -0700 (PDT)
MIME-Version: 1.0
From: Makarios Christakis <makchrbiz@gmail.com>
Date: Tue, 18 Mar 2025 09:10:27 +0200
X-Gm-Features: AQ5f1Jrd2xfWLcWRA2ZgQFQPKZmrD6tqx6fh13C0jpzrbhZyHhU_iCz_sKJcR8s
Message-ID: <CANpL8OsjDEO6gw_j+YphY9PNx3SV1AK0dTsG353spS6UDK63EQ@mail.gmail.com>
Subject: [BACKPORT] icu: Adjust ICU_DATA_DIR path on big endian targets
To: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 07:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213181

Hello Steve,

I would like to backport this bugfix from master to Styhead and Scarthgap.

oe-core master ref: 28cdc0110def011e3d690da1d591076385267ef7

Let me know if this is not the proper way to request this.

Thanks for your efforts,

Makarios Christakis

--
commit 28cdc0110def011e3d690da1d591076385267ef7
Author: Makarios Christakis <makchrbiz@gmail.com>
Date:   Sun Mar 16 21:13:43 2025 +0200

    icu: Adjust ICU_DATA_DIR path on big endian targets

    On big-endian systems the preprocessor define ICU_DATA_DIR
    is currently being set to a path ending with the ${PV} of
    the recipe.

    The PV version string has changed to a '-' separator
    since oe-core commit cebe8439cdc656d53355506a31a3782312bf03c5
    whereas the build system installs the data files into a
    path ending with the dot-separated version of ICU.

    This causes the ICU data file to not be detected at runtime,
    consequently breaking any dependant applications.

    We therefore substitute ${PV} with the dot-separated version
    string of ICU, as returned from the icu_install_folder function,
    on the ICU_DATA_DIR define on big-endian targets.

    Signed-off-by: Makarios Christakis <makchrbiz@gmail.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/icu/icu_76-1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu_76-1.bb
b/meta/recipes-support/icu/icu_76-1.bb
index 08dabde3ae..f0890fc890 100644
--- a/meta/recipes-support/icu/icu_76-1.bb
+++ b/meta/recipes-support/icu/icu_76-1.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF:class-native = "--disable-icu-config"
 EXTRA_OECONF:class-nativesdk =
"--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"

 EXTRA_OECONF:append:class-target =
"${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
--with-data-packaging=archive', '', d)}"
-TARGET_CXXFLAGS:append =
"${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
-DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
+TARGET_CXXFLAGS:append =
"${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
-DICU_DATA_DIR=\\""${datadir}/${BPN}/${@icu_install_folder(d)}\\""',
'', d)}"

 ASNEEDED = ""

