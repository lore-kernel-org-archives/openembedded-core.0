Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A17C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 08:49:57 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17677.1754642992612218504
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Aug 2025 01:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dwaQhijs;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2405c0c431cso17673995ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 01:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754642992; x=1755247792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3symzm59eEajvUi1Pn4TRyMO2CgS8eRrdaZ/eXp3VI=;
        b=dwaQhijsP/Id9wKO0EBOYntrR7u681c9Hlc+wKWaVe0yXkOFymoumjJyo8xKFJP7x8
         GQ/Mz+t/vvTXDwfGagUCAlN3PnRyZTeU0pSfWjMc9zkfvQ2cua2wClQxXdIqVZPjQeTe
         wj5+9NhcjTzjniHvk49P2o9lfOsfOwQEK/jiwgNut6E7AWU+0kRlYM4QM2l22YTbk8a0
         N5v3MTPEuHHJa2Smt1hMtnT7WMx6FRlOhH8o1fQM5K7oVTp+R0TYV6Oc+ffZhHlG16SL
         ieCGCox6fSrAzGpcE8GjdmkoDAkKRKWVSs9T5fMMvKuS/CCRFObDTBYnZ/x6dlXR3mD8
         Srfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642992; x=1755247792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3symzm59eEajvUi1Pn4TRyMO2CgS8eRrdaZ/eXp3VI=;
        b=CvL2yL1ee39+nLM1Zzfusm3/vUq1f4062FbByxBna5Nx+0SytNUQHt59SMygOfiPvD
         OQy54PkASUkPutnuLTzAELytubn08/EHZcXPUp/pBQD5cCPMqypUZ9F8xHBnmNJAL6DE
         TbKzvntDN/jkAfz2Cydk0lqH6wzMiKjyEnRF2pWxh2HkrJngbRs3Ng5X4Pct0fwRKKlo
         +HZCosj2E9uM8qw6ODq45fragoFHHax1HcZ1GF5kWfizRHiq+cEMfHUByfSCgLTl+h/Y
         lM7ETOhltF7g2XRxsXrlohtRwjNVnbmVAnte5/7e8pUuMPzeGj2rDKk9WL+RBR0+aNSZ
         MSlg==
X-Gm-Message-State: AOJu0YwokUlE3xBQsymYTQic/mQfxmHMQpFbMUoxd6uU6NNCFV4uZ0Wo
	Q9KRStYaY94Ls1SynWYy5fTIRFLgD6/ya1O2q35arVoy/+OoqhdU/HI7ggRBbQ==
X-Gm-Gg: ASbGncs0imhx46WEs/qOUj4It/fV3OeSYriFCfoIA281aR4M2ZBluwgR5HNeQo8SHQL
	9g3g2P/eemM/6J4MHwQxfCTnNLqVUKboZAIsGh/iR3zjBW7XLDaN1O4gUxWWH3GOUUG9HeKBiR9
	5DIMhXW9CfNYVSKcRp99PFG6W3vRYapfehfUui6mRzHMnH8cn8JZagpp1X2nAEGDUlN9b7QOIUf
	b+11IBqmeSli6q2tthqVr/dZnOuamAGyUlN8GnviIeb8fewkzVkq4yeaxOnqsTixO2Gs+CMYn+k
	IT13Js8Z+WIUDv9AbHUxSTApXbbG9SLKu6flrWBChHvhWO1ENlTu7pxxGDE6DNcGTJNLuBmeYWB
	wwTZ9vh3QSRt/bh76tTnsKzdpXOlXeaoB
X-Google-Smtp-Source: AGHT+IF7UbLKTl1FgKuLI27R4LQTO2nof+njpDyXMfqAaawO/qFkO+8/s3/gkK7clvYXoP0q2R2ugA==
X-Received: by 2002:a17:902:da83:b0:23f:f39b:eaf6 with SMTP id d9443c01a7336-242c226cac3mr34832595ad.46.1754642991363;
        Fri, 08 Aug 2025 01:49:51 -0700 (PDT)
Received: from L-18010L.kpit.com ([49.36.49.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm188782455ad.63.2025.08.08.01.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:51 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH 05/23] bitbake: git: Clean shallow mirror tarball
Date: Fri,  8 Aug 2025 14:19:13 +0530
Message-Id: <20250808084931.2156763-5-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808084931.2156763-1-akash.hadke27@gmail.com>
References: <20250808084931.2156763-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 08:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221602

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
BB_GIT_SHALLOW = "1"
BB_GENERATE_SHALLOW_TARBALLS = "1"
$ bitbake utfcpp -cfetch && bitbake utfcpp -ccleanall

The downloads/gitsmshallow_github.com.nemtrif.*.tar.gz won't be cleaned without
this fix.

(Bitbake rev: bab7a8970a0237a9d24217685a595e76a1336c07)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd9d183621d583331cd17c7ea4c6dd7cc350e8aa)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 bitbake/lib/bb/fetch2/git.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index 5b678827ed..0ea55e139d 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -727,6 +727,11 @@ class Git(FetchMethod):
             clonedir = os.path.realpath(ud.localpath)
             to_remove.append(clonedir)
 
+        # Remove shallow mirror tarball
+        if ud.shallow:
+            to_remove.append(ud.fullshallow)
+            to_remove.append(ud.fullshallow + ".done")
+
         for r in to_remove:
             if os.path.exists(r):
                 bb.note('Removing %s' % r)
-- 
2.25.1


