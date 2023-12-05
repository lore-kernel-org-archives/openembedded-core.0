Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E5A6C46CA3
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 04:40:47 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.92287.1701751240119227787
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 20:40:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VY8b+Scx;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-67ad891ff36so5133616d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 20:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701751239; x=1702356039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ua6+eq76ZXAGAOervEKpnB5MxOYKYFVKvoj/nKtr5VE=;
        b=VY8b+ScxiBYz63B9l1jD2NxPLair50cNb6pfRJxIh7tP9cl+0L+Ct7Fh5QQk7JbDWA
         NwzlAtChtQ8ieYuDk+ckOS/PcKZnQgb/QKiz9XRYY76jfzIVOeApFmOOROc6gwfr70tQ
         TmqVCFZ1ecrN8+Od74BZnWUeOMbtAdcgfs8lj5LWGV209SwBtOTVjTMU02AHV3gOzsTC
         oOWEJtkAwef1MZn4xEcot60zolTyvw+ClTYy2NHJ5Jhx14afZ01E4TROyh8iDVA3801E
         h3ScVuattFZBJFtTZHPt26i97uOCdaEq3CJZLt9l0YTYyn8QmU8P+F8JB6C6+ciAsBwQ
         ehVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701751239; x=1702356039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ua6+eq76ZXAGAOervEKpnB5MxOYKYFVKvoj/nKtr5VE=;
        b=BJ+JAVDovDbuyXPv6UWFHv7NNoeterSK9uLSrdO+qQ34+pzmEl2T6uMGkYskuRp3Ld
         T1i1yPFHqRwloy47tWoDM35f74NXlQ3Z+qA9mIycExEDt8XJ5CYwWKJHjKhEB372z/0w
         /1H23kwJye4btt5qUEMC0B4Xb4S+Nye9YItduQHlJDP0gJrYgmmUrO7cvdrpj8phpApP
         /ElRRnOxg/hK6GYIfcpVav/jPKvFuxWzmm98maENQ1CC69MVlPMy7X1SInZaD/Tha7kJ
         WSSwTD9a1FpCgSelpOeERFtA/s4V3WqgtrocFICSblYDFyIa0q/HQyNPmHBFTorat36K
         uHkw==
X-Gm-Message-State: AOJu0YxyYK01ZO5GmC1pcQNnmCsxQXvev+EgyT6/RlHey0vPkg8Xzqij
	Q//CMdyBmH5vG5ORg8Dm+34sqpyEcPI=
X-Google-Smtp-Source: AGHT+IEizcAAI531DXk2WiAfu5BM8cXgsAL6Jjam68HSdZi59SZn2oFO7/RUKxIcRaWt18+yovBVbQ==
X-Received: by 2002:ad4:434d:0:b0:67a:a99e:b87a with SMTP id q13-20020ad4434d000000b0067aa99eb87amr827602qvs.89.1701751239031;
        Mon, 04 Dec 2023 20:40:39 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id cp3-20020ad44ae3000000b0067a9cb527b1sm3718824qvb.13.2023.12.04.20.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 20:40:37 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/4] linux-yocto: -stable updates
Date: Mon,  4 Dec 2023 23:40:32 -0500
Message-Id: <20231205044036.4163615-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 04:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191785

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Steve,

Much like my last pull request to Richard, this has been
generated from a newly provisioned machine after my old machine
of 10 years had a disk failure.

Let me know if you have any issues with this, and I'll debug
what I missed when configuring the new box.

Bruce

Bruce Ashfield (4):
  linux-yocto/5.10: update to v5.10.198
  linux-yocto/5.10: update to v5.10.200
  linux-yocto/5.10: update to v5.10.202
  linux-yocto/5.15: update to v5.15.141

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 6 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.39.2


