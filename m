Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714AAC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 15:06:48 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.17680.1675955205235516753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 07:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ent9ubpU;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id s17so1853999ois.10
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 07:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Knms+DdjAXJ8Gq7MT9i5ymIzog/MDwxp3fLqkz4niDo=;
        b=ent9ubpUlyYZPbdHbvriHBzjdUxQF+srocW5mEIke+KRGh5ZSWox8NiJwzR/G/35r/
         yD8c3O1x6Z7vT9ZRGGqr501zekfMkSqAM+xVikJcffTYagDDNdYdMRG0Mz5N+nbGDR/w
         M2q1Pj+Z2pb73hxD9mFEdavEgeoX0TVB6lPr1D+ktxF1IOK7hn4ykQ5ZF8X80E+8sFWH
         Uz2Er8aZ6Er/c5Y+myq6vXES9eiY0zDHOY3rwTR7CyFkzkSd/csKTcsa25neDQ8Q+3eN
         61PMRlY+XcKn66Gt4xerj8y/zY3CqOH5mf0tNomW2vxgtOUtdwAOwaAU8R8r570qeQbJ
         ORBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Knms+DdjAXJ8Gq7MT9i5ymIzog/MDwxp3fLqkz4niDo=;
        b=J4QaJwNb+dHrr4G4M2yKDmo9QtalvgjJFIfAoxsAho3RuEqGqQ6TFCh0ji+kqx8YFx
         pUh/5wiS/oAtdzjBFCMkZrkYQZtbvEpkmgjL9Hi2bIyCKZHUWX8MpLi+X68+Yr/Nt8va
         8YaNDLhgUFU84xvo3qMwgk+UD2CfoBaJ43GmaXQ0r0aum28DDNVj9zps7OUWQCsMIRHa
         TF3+puoFGRPtZPZa0Ig0wB/QyADfeRlkoyI6RPgfHL5EIulnJoRm+xKHDI4M5ovqdwmG
         +rLcp08K0FWQUmNUXgedJxHwFmu/cJTfuuhc+ACWVgxOuwtP9Sz/9BwG7MEPtHqcFZg6
         Kwtg==
X-Gm-Message-State: AO0yUKWgVABgOXhK6w0AByBuDQY/PrI8I6gSZAOFFUnOlmIiA1yZcWaQ
	T61Oa87A6lO7ZZ1ahChN5q5C9iAKDc8=
X-Google-Smtp-Source: AK7set80efn/UsaF6UGc4oHcLyjtdK2q9pwikRq5fRJOILVY86O/pR8KPIa7NBDaZOo5gpdW4Jr0Mg==
X-Received: by 2002:a54:4704:0:b0:37b:77fb:235a with SMTP id k4-20020a544704000000b0037b77fb235amr3041588oik.50.1675955203792;
        Thu, 09 Feb 2023 07:06:43 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id o203-20020acaf0d4000000b0035b4b6d1bbfsm914168oih.28.2023.02.09.07.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 07:06:43 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/2] Remove unnecessary SPDX files from deploydir
Date: Thu,  9 Feb 2023 09:06:37 -0600
Message-Id: <20230209150639.114504-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 15:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176958

Per feedback from users, remove the top level image SPDX file and the
JSON index file from DEPLOYDIR. Having these files here is confusing to
end users because these files are not very useful by themselves, and
having them in DEPLOYDIR makes it unclear which they should be using.

Joshua Watt (2):
  classes/populate_sdk_base: Append cleandirs
  classes/create-sdpx-2.2: Remove image SPDX and index from deploydir

 meta/classes-recipe/populate_sdk_base.bbclass |  2 +-
 meta/classes/create-spdx-2.2.bbclass          | 20 ++++++++-----------
 2 files changed, 9 insertions(+), 13 deletions(-)

-- 
2.33.0


