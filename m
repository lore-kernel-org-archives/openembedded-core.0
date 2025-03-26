Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05739C36012
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:22 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.33390.1743020958988769369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CzE3kT8s;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3031354f134so253569a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020958; x=1743625758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ADLK4h0Y8H0HMd/dnycDFDkpksC4FpDMAwajY4JfmI=;
        b=CzE3kT8s1x8RJThUEvXGIoHVwUumCVVQmJPY4SUYxDFjZOAyCGzl7BS8HWhjlx0CAz
         FWpDNJ1OE7cCrlN1pq3uifKvfyZYcHxuf+DZSBKEfqqYp84YNlcyzmPLQUSTJAhhU6n0
         PieRynFXSwahk3rbKGpmgHGgRQPoJgKJ5T85iDrpbECZ9RNcktMB0nmUA7CiNgH/CN3s
         kMryh7TrrH6SeHNI+H068iXUvTP/KKehsoP+HYEczkz6SA5Iehs4W4+01AKxHFy+ad3X
         pmTfgwyqNH8Rgxnewq9d196sMaKrpxfCyl3PdqfsCScfg6wKswx6lZty7NpeAn86yTtu
         h0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020958; x=1743625758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ADLK4h0Y8H0HMd/dnycDFDkpksC4FpDMAwajY4JfmI=;
        b=uiII5XmFTF0WVjU/9585D1WrWgzX09IQ72ZtZkPbBB1WOR/AXfxf58AG8wGqchy0Aa
         CcPIo6oSFU/clCEM5uRrLN4I4LYGIzKYuwPgOlhZyvblYvOj1f8ttFRhM0WcRmGjeqKl
         yLPIMTGzQhlD83k/GBWcIb4Qz48sop7jJHAIImgo9EHCf4FLN12MQZM0jdbxgWzEhRYX
         GsMOsjkDSPyBG6evf92UNDMz3uCvXzIKnD2vjj/fxhtaMzbaIltlqG+d2YrKir09Pno8
         iQ2GfoORCt6xSGUSsYcLfWfxb4tEG/4ewT/lfqAFtmVXL+TTR+U/rt4mi1WFrEByy8iX
         aRpw==
X-Gm-Message-State: AOJu0YyGfymnvNGsr93F0trSn6WaYg2ys/KRsOgke3bokWdxYpolgiFj
	TMy7QmV9OzIdaH7TZvQda0uirCb3htfGvJ22QV5HTe9NThBQh40AJdWRsXtz
X-Gm-Gg: ASbGncvR+kNhF7nIwrI3ds7e7DSn8bhcOLAKm+c1/dN6pJd8VnXMLg06DbbMVb2LXi7
	J9cEa54olyQPamJbSqPHenzPcP59i+ky+HZpjtIdGA7Y0sBcUucUwY5Jhp4zol3BeD7nRkUi91A
	lqFGZMH7G/0i2O1dlnZhbdJzXKeXDcNxOeUUy2dIkdOHmb/WZe6uau0DJJRFKZCMOrot5nzOjpe
	OPw9eh5hYXEzbq7CFMd60X3ShwtxEB8r+Dz1qMVfi+F2rxUNhFCWkxz9hZKn8ZTmvQQKZSFqXJs
	XEyOqAl/kmqf5Z4+Ifqn1AVb47a2/nksP1oI1U4Km5c34q7eTH3sZGgTyyhoYhc3FqM=
X-Google-Smtp-Source: AGHT+IE5VU9M7fPOGThPqacivEP/nKw3x4hglbVhKFTjzvjLAD1OyO53c5CsOF/5rnewiRd0OJE0QQ==
X-Received: by 2002:a17:90b:5686:b0:2ff:698d:ef74 with SMTP id 98e67ed59e1d1-303a906c60emr1325848a91.26.1743020957947;
        Wed, 26 Mar 2025 13:29:17 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:17 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [styhead][PATCH v2 05/31] linux-firmware: add battmgr.jsn to ${PN}-qcom-qcm6490-audio
Date: Wed, 26 Mar 2025 17:27:51 -0300
Message-Id: <20250326202817.64437-6-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213665

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

The battmgr.jsn file describes one of the services provided by the audio
DSP. Add it to the ${PN}-qcom-qcom6490-audio package (for the reference,
see the ${PN}-qcom-sc8280xp-lenovo-x13s-audio package, which also
incorporates corresponding battmgr.jsn file.

Fixes: 1d421fa263bc ("linux-firmware: Add qcom-qcm6490-{audio,compute} firmware packages")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 57da7cbf63acff744beb2b01e5847b62a9fc350d)
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index 9dcb0313a9a1..d75a587db931 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -1498,7 +1498,7 @@ FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/
 FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
 FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
 FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/*"
-FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qcm6490/adsp*.*"
+FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qcm6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/battmgr.jsn"
 FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qcm6490/cdsp*.*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
-- 
2.39.5


