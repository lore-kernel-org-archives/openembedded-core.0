Return-Path: <karem.ibrahim46@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DD8D75E3F
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 13:31:56 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.23985.1732282311977461448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 05:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hrAfG30m;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: karem.ibrahim46@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4314b316495so18356055e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 05:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732282310; x=1732887110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hZhhYjHShG5D/LynaCwXK872JF+A/7OQA3mlOCQNZBk=;
        b=hrAfG30m9jiaSGnKSsl8XvOjGSTHCivo2CydAGjLiefsv00nATzwCkfazePykLKq2q
         ppuX7WqNhPtqb3Q0neVYAzMdNglSKHn9+CnFLuBRM3TbD8KEN77nwaJzIbnLhy+sDM81
         zToVJH5pIgSPP8zHg0w+vMvl+Adkf8CtocbS8dqQuWeOEcGkWyO+luWVRaOHnutWLhxy
         FC6lt1EKe9rKKOjaVCG0OlrhU67qEGGdO5NNwOanw7YPlszT8fZ6oCAFdt6VfhAiNYOy
         rwG9VdY53u3odtSpIkuiHzI1k/Mz86Uh4ylrnICgsuZKfOAB5Vnljsbu0yH4p9JQ19zy
         pYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282310; x=1732887110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZhhYjHShG5D/LynaCwXK872JF+A/7OQA3mlOCQNZBk=;
        b=fxeN1U1/iK22QWfoWv0EU+gTm43zpv1hWU5qqd8UKkkyJp2f4wqBbkVFJ1qiXbZXo6
         2VwBVooD1eIiRty17Sq6wGEdpR996D+6h80JrSpnwRhPcmV0hg6rFeYQN1edkg6tVnfx
         Q5h9zGLWhhTRKkmDgFVXq0Ykd5dKbViO4VqiHpWCGlxI5T9CBxzd66yTM+AWbgcRj4fP
         z6xxs5569DHFsBL8ocwqxSo2H6ATZmkiFrDWLNnohGk7Tlp4rEUdfHA7UCoQkMOpKDHl
         nNQjugX6XLPYkmhRK+2uCs9XJw5apoUmWkfC6xliqtG9ywbPCC3TYymARFJqiF5Wr3sX
         L9RQ==
X-Gm-Message-State: AOJu0Yyp0TwlVnyryVXn5jbe8pPoZlHDZMn7ZjrpMylCczQCKCfd3ELJ
	mv0XExMjLbJsKHH2KLrsaqTDFXsI8Qp+qhU7U+6Qx0U38R614eSs278lhjue
X-Gm-Gg: ASbGncvhmNdXWo9a3O7rVshuvSokVeJyzftLy7/7VqcELwSWC2A6BVCDRwrwOdW55Nf
	Dq2egxCnn0opIW2b8NBTKiBHu9Tq2anHB+0+EIGR5Hp3I/gQ/KQkmUKOz6NOGbBLDFyksl8ruUm
	GgRZVHXH2t6F2L/N+Wf+vU+/xH0j+DPRIhkXW7VgX6aL3p+LxaqzlwOhWj6VjO2bv0rM2fj1yt/
	aeEiOlzOR50sPCMx01V9CDa4jtoZst8AoExl9dnIrjS27vawow7qJjafP88rEpJcgBTR4bULKnc
	XHml9HcugoJqTOwfa8JD+Cefzd6cgHAiNFM=
X-Google-Smtp-Source: AGHT+IGreXE7W5g8QT4Pcvup6YHadJm+7pNlYWOpaasg1IqYjlbXksi2pm4OL9Z3Aa8j2g3+YYIZEA==
X-Received: by 2002:a05:600c:1989:b0:431:51e5:22fb with SMTP id 5b1f17b1804b1-433ce425150mr24519355e9.14.1732282309922;
        Fri, 22 Nov 2024 05:31:49 -0800 (PST)
Received: from CAI1-L15933-Ubuntu-20.04-valeo-wsl2.vnet.valeo.com ([197.134.217.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde97c68sm27306195e9.36.2024.11.22.05.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 05:31:49 -0800 (PST)
From: Kareem Ibrahim <karem.ibrahim46@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Kareem Ibrahim <karem.ibrahim46@gmail.com>
Subject: [PATCH 0/1] *** SUBJECT HERE ***
Date: Fri, 22 Nov 2024 15:31:39 +0200
Message-Id: <20241122133140.1627-1-karem.ibrahim46@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207614

This is a fix for network error "Could not resolve hostname" error in recipes inheriting cargo that needs remote crates

Kareem Ibrahim (1):
  Added a new cargo-online bbclass for recipes requiring remote crates

 meta/classes/cargo-online.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta/classes/cargo-online.bbclass

-- 
2.25.1


