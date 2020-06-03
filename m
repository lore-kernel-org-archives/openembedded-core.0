Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.4408.1591214526373725606
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 13:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FzmfY/UZ;
 spf=pass (domain: konsulko.com, ip: 209.85.221.67, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f67.google.com with SMTP id l11so3724277wru.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 13:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k2s0QtTOD3fELUd2Et1r99ahCTCfA/pFfsFqoi3CRv0=;
        b=FzmfY/UZjZScq8Xc4OpZ6+dbw8Iw6ssbzwv2QY53iXdznzkvTz5fBgNje25f8GJ5f2
         4pavW3IFn5f87KVTRWtlyiSNoksRMj7WsEBK4RZ1RakJcEoSfgD6sCOh+8Roef3FfrIA
         bVTY1+eILA3Hh4UI9F+yaP4Gal05wrMAuuqbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k2s0QtTOD3fELUd2Et1r99ahCTCfA/pFfsFqoi3CRv0=;
        b=le17nzIkkOhpFT7Hs3zv8u46/klYo0JenpmcnIclR09bSdlg3LdhmfXncXky3DaSmp
         grH4RAVfPurNATYug9ZPfUSos1K6NWjjScQAEx0UfK9jzDWi1hYYXJfY5mYCqi8jKx6u
         +XeOBPeyNDSJ0Nd2SNhDgFkiYwqxyQAMgExFMBPWg5MAc39HnMMIvONnYzG9jAznNDgE
         Vhfp7jrm6ktsSWsu0Noqe9LE/ujDV2eptS0vMjicksQ3bA8cip3Z15yJfgoybq2VxZTU
         WbQSc3YU0WqX/+9AcRo/ATC4xNHdVXmMn8eR/d938oe2jbfAe8y03zvXiHw920b4UdA1
         bVhA==
X-Gm-Message-State: AOAM530xCqC1nYyGFnOpX+LnGGIeATWoYVVgaKiIB6tMBnhRDK+NP/tC
	qWFFZnOSAiTxGd71WZmqXEcKb9dPN5Z2Lw==
X-Google-Smtp-Source: ABdhPJw9emw7kF4xZxJijf023Lp/hm5/wisvrG3/kQ70GemdG3AfcQQ6SadSNGnUx4fWRPckOtMAjA==
X-Received: by 2002:a5d:49cd:: with SMTP id t13mr1100218wrs.292.1591214524407;
        Wed, 03 Jun 2020 13:02:04 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id a3sm4682716wrp.91.2020.06.03.13.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 13:02:03 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 0/1] archiver: Capture git submodules in mirror archiver
Date: Wed,  3 Jun 2020 21:02:00 +0100
Message-Id: <20200603200201.23110-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch depends on the addition of the Fetch.expanded_urldata()
function in bitbake submitted to the bitbake-devel list.

Paul Barker (1):
  archiver: Capture git submodules in mirror archiver

 meta/classes/archiver.bbclass            | 13 ++++---
 meta/lib/oeqa/selftest/cases/archiver.py | 46 ++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 7 deletions(-)

-- 
2.26.2

