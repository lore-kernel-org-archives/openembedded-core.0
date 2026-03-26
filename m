Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCA2109E532
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 00:12:04 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37522.1774483917568267780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 17:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=USpviUY0;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50b3488fb31so19560961cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 17:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774483916; x=1775088716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BIBZBNEyQ8Y4+TgUu2ZOKyY5jeik1GFN3RpWlhlrekA=;
        b=USpviUY0TQs5DAuZGb08Jdhbb+vhbT7cTkE+txnkQ4/FskVXdcYal6KSb3Ai0ohiIZ
         HRymqETAaAXFCo2+jYYRwIGQM8XAgXh3D11mN67ezmD9PG5k9noG/+bRCurzhdk58eYl
         wA7yR5m8ggxsluhh+65dDYuCVUTf9C9jCMpvlm18dkZ7e6myWWVsXqO3TkIcUnhrfgnJ
         LK2YnZ2Sw4TvGBXKROZqqe/dviOQOJP1SYP/Ww3nuUKcm7IXr//5GAGKB6KslEwN5Qmw
         q5abkZ0tXtFp/CipadYIXFqD5nrMSxEgb6JocV/1NQQhjzDL8KctfzO6IWTKtBJ6rJBW
         DySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774483916; x=1775088716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIBZBNEyQ8Y4+TgUu2ZOKyY5jeik1GFN3RpWlhlrekA=;
        b=CKsrP6NXIfUoAiLcPfOPvQVGlEfjPHXMgmauOs8Ob/2qmP54aax1ib06y1WWysel4a
         xqeiLtCW7gPubVO5xz8K5el1tr1VuOiTeOSh7DcFbvz//3grxrsW5uABE+KqbPEsjqGx
         lTgSik9PkJVza4DTQFc8HfoBZn1SvgXTlVJTy8kaU/t8NPLkGIYizOpwaUm3lYt1/Md2
         bZ6FPFdzgXyPrvH8nmsWZeo/q37hz736n1icNdnhZjv1MeFiOdgisgNSOeGY7azFqnuq
         OzcdKwuhs+LWV6xEe7eScck4z3etA1DYwIRtYqSWX/04f6LT2GLldEh/EGMA/IAZIn82
         ORew==
X-Gm-Message-State: AOJu0YypW8mFp95qDn0mSxcuWW3zHXyk5JZqiJ7KzWLORZu518IrQEMf
	BMJK7C6UKjLOBj8AyRp+PlUb8JN3K3Qa9VLLrdoWUIZil09fMjE//J466i6gkg==
X-Gm-Gg: ATEYQzxoiPzGiIafaz5fiPUdPs8veV8CGWloGtHPdhuO5UCoUI6mG9s/t5EQRZ8QxEY
	1bPkl9XVPSxF1Odw8zwRNJ30UO3rDtcsQhhGinoiBmdltC0rVZMEC87N0t5R9wzjw7/wlYdPrQk
	8Pb1CB8XXMOgUxLXh5wUMbPzfZYIG6nZwOLGBinFNLeAmK19cNUvIVCQkamVc+G9zH2nVJETRB5
	c+wHtvsPPRqp/77eXJk2w9yM7PHA8hHp59Aa5tbji6ybRlJ8toPDnLN9IJ8Q/lls1/zOMzSAOqD
	ja0JQwU4MdF4e+cpnItvhQmMgUjTCWY8HibdRh9HJkBPJhQyG5Yrfaw7ZgxIxMWXzgtJwQ8agj4
	MO5BLq6CHGTExweebtZIlmQTC9LuIlieLB1BFUPLp2jnJMkrEI5PyphDIMfFSRGUtOI3lVljIrY
	HCJxX+jmr8ApXmNAu22Wg3R9fVRVtR8cTbVhBl6zLwRWzdhipMpiiL7aWENhXv3MhPYA==
X-Received: by 2002:a05:622a:9010:b0:50b:88ee:2a9b with SMTP id d75a77b69052e-50b88ee3f13mr48057381cf.8.1774483915893;
        Wed, 25 Mar 2026 17:11:55 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b920f77dasm11638521cf.3.2026.03.25.17.11.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 17:11:54 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v8 0/1] re-implement sector-size  [was: standalone wic]
Date: Wed, 25 Mar 2026 20:11:49 -0400
Message-ID: <20260326001150.203099-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 00:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233938

Seven revisions of a patch set have been sent to split wic out from
oe-core. As part of that patch set two other pieces have tagged along
for the ride:
- fix a wic bug found with python 3.14 in Fedora 43
- re-implement sector-size handling support

The wic bug fix has already been sent and merged, therefore, in an
attempt to make the splitting-out of wic more palatable, here is the
re-implement sector-size support on its own.

The previous patch set can be references for all the (non-relevant)
details:
	https://lists.openembedded.org/g/openembedded-core/topic/patch_v7_0_9_standalone_wic/118086344

Trevor Woerner & Mark Hatle (1):
  wic: re-implement sector-size support

 meta/lib/oeqa/selftest/cases/wic.py           | 78 ++++++++++++++++++-
 scripts/lib/wic/engine.py                     | 60 +++++++-------
 scripts/lib/wic/help.py                       | 23 ++++--
 scripts/lib/wic/misc.py                       |  6 ++
 scripts/lib/wic/partition.py                  | 63 +++++++++++++--
 scripts/lib/wic/plugins/imager/direct.py      | 18 ++---
 scripts/lib/wic/plugins/source/bootimg_efi.py |  5 +-
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 11 +--
 .../wic/plugins/source/isoimage_isohybrid.py  |  5 +-
 scripts/wic                                   | 41 ++++++++++
 10 files changed, 246 insertions(+), 64 deletions(-)

-- 
2.51.0


