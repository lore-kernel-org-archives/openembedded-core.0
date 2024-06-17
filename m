Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C5DC2BB85
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 09:51:04 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.52611.1718617862133151388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 02:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NEXrYjn1;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a63359aaaa6so629452766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 02:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718617860; x=1719222660; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yzfrPqvoVtyJ6peGaqqQ9S/Oz7Z6CChr6TLmTPXV9b0=;
        b=NEXrYjn1Q3G6pYgVRgViabAZbgEs7h23NESvFHVnPn8qMr4dU8wbmd9GZGkYgj+nNY
         rRknzwmqnMSJnUfAKmwC+5lxk+wLAfWeGK9AcNM7gSrBJLQmyN5TwLR36z58FTpyn/wo
         vZb8URDXpnR4TgrHr5WMltjISU4dvm57E7pZY+c0Hn1CoGgpkiVuhz0ii+f3kU3NPr9m
         jf8zAY7IOU0uT+fcOwRIRUpKH96jaZcsfQClY0i02Ryup8mW0VoBmMALLsFiu+evj6A3
         VNdB6Hyk6SNqsKMeu7xDbp9kTmGjLPSh/Sme7jJN0A424sOn/gqApmMGZrFA/AvwRAIY
         SV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718617860; x=1719222660;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yzfrPqvoVtyJ6peGaqqQ9S/Oz7Z6CChr6TLmTPXV9b0=;
        b=HiJsYNFmMu/o1ojMfxo42/9l/diMJMYSerzjn3XBsO2lVUgcYWIyyBq0bKoQRsNlqJ
         kZ7G13Xnks6p3WVg9EIznJdrxDq3pELsgSEZG6aBpEypbEfE+REpvIO5dMIV272jFnZ4
         EQkVQpEGgAcsKR1IDGpV+qyj3Nl75DOP731BfdWIqftiuGnlKUWTWjE8a3l6CQTnJ+Wx
         L6c98gM3dAfoZmbzkVKmG18TKTMn7zn90vqN7gyp0XxIBNKrouCWkK/NGQzIZ7OgAAL4
         MvnJ5V/pafwW9HNkp7fGWU6LJYpWqVnkg6x8PIKylvUZhibuzstpEx7fu+U7pHEccL5l
         vTAQ==
X-Gm-Message-State: AOJu0YzeNFmrlh/MSeGeigiITfcL+CCObRvdKcuS3Rzeez4+DhKEtvzE
	WNEMyUOmeklTd6ZKuLZUy0ONlbB90cdJEjCPS728SopJ+PYG2MS6OAhLfZaqFNXhjYX+wM5nEM5
	+5unZYBlQdnAe4SVGloerXB82Bu8Bs/VE
X-Google-Smtp-Source: AGHT+IEfdJnDOzJsRA9D9lgWuxF8oxHwhbjch/dUTDUXs2AFXc127Ke4Vcwo2uhUAWO7dKzTCIKnPiHDi0CNRa9IzVc=
X-Received: by 2002:a17:906:4347:b0:a6f:59dc:4ed2 with SMTP id
 a640c23a62f3a-a6f60cf4028mr582213166b.12.1718617859879; Mon, 17 Jun 2024
 02:50:59 -0700 (PDT)
MIME-Version: 1.0
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 17 Jun 2024 12:50:48 +0300
Message-ID: <CALT56yPWE=nTn7jAPps+A7YCZ17Aw-U_OpfonSTYD90j5rwOAg@mail.gmail.com>
Subject: QemuPPC64 machine status
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 09:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200800

Hello,

Is qemuppc64 considered to be supported? We have been running CI over
a set of machines, it seems that PPC64 kernel build is broken for
quite some time:

https://storage.tuxsuite.com/public/linaro/dmitry.baryshkov/oebuilds/2hzrcO3QvnkeNPVouoptwe4sFZf/build.log

| /tmp/ccJSLBgE.s: Assembler messages:
| /tmp/ccJSLBgE.s:765: Error: operand out of domain (18 is not a multiple of 4)
| /tmp/ccJSLBgE.s:790: Error: operand out of domain (18 is not a multiple of 4)
| /tmp/ccJSLBgE.s:815: Error: operand out of domain (18 is not a multiple of 4)
| /tmp/ccJSLBgE.s:2435: Error: operand out of domain (19 is not a multiple of 4)
| /tmp/ccJSLBgE.s:2461: Error: operand out of domain (19 is not a multiple of 4)
| /tmp/ccJSLBgE.s:2486: Error: operand out of domain (19 is not a multiple of 4)
| /tmp/ccJSLBgE.s:3590: Error: operand out of domain (18 is not a multiple of 4)
| /tmp/ccJSLBgE.s:3616: Error: operand out of domain (18 is not a multiple of 4)
| /tmp/ccJSLBgE.s:3641: Error: operand out of domain (18 is not a multiple of 4)
| make[3]: *** [/oe/build/tmp/work-shared/qemuppc64/kernel-source/scripts/Makefile.build:243:
fs/readdir.o] Error 1
| make[2]: *** [/oe/build/tmp/work-shared/qemuppc64/kernel-source/scripts/Makefile.build:480:
fs] Error 2
| make[2]: *** Waiting for unfinished jobs....


-- 
With best wishes
Dmitry

