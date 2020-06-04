Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.20019.1591291995696596715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 10:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FO1hgMBM;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id y17so7007499wrn.11
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 10:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WRxSE4NfZOyWBui0TPkm8820ie2hgL2KP5A+Vd/PvIM=;
        b=FO1hgMBM7Z/CRLEGkEL2SYqW5V5fbAR91qT4f7uK5+R1eLa09kReR89vyuIrjY4tm4
         e1+ckcRw8TULSxjyH/T+PICmMDqMH+eCRouzw2P+LUkSb2taHwEPjLpR7dOfePd0tluY
         CO3ChxrHWTbiFo9Lh5hKc4VK3i4EujfZuCiLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WRxSE4NfZOyWBui0TPkm8820ie2hgL2KP5A+Vd/PvIM=;
        b=RAbgzh6nbMlGyWWl5J96aFW1G5Vs6NdtduKGtb/5/2w/kvIAoZlVuioAblXz3S4T6H
         cI5LUHSkSG6c+Tp12w0cJYaniPEEiwmp+rlWBZ108iFsCIF3UJvjxEC+nYRGUskwX2IR
         MnRT6sE1GlJUTPQYoEAIORW8kuGW9xJAfEjUpX5CO5QN+ILrJgU+kb8YI5UD9p5wffrh
         qkhScJRFaGqQQzGEVMXpBb4YDHQMPMt20QRzFjz3r72/Fg23ytU03ZxstdYfEpUnT2cW
         0RtEalluCqBoWj/XUzHOcYw4rb5/9MmSX74yCTELubOJ0JxXWocRy+2YrXA1Irl9GB9f
         c4Iw==
X-Gm-Message-State: AOAM531giRVHAmPdJQQgRFPs81ZqKRAO/IJD8DF0023dP/Ikb2yKpmrs
	AVqUnLQvnH39gzgVac744CpxnvEN7zii7w==
X-Google-Smtp-Source: ABdhPJzmEoVYU99wRlicKkTap2lXxMKgdDx8Xx3Mf/AlG3/0/VE/lox+HWFS2S9PtkHIvfNKYKNxnQ==
X-Received: by 2002:a05:6000:10cf:: with SMTP id b15mr5329385wrx.214.1591291993906;
        Thu, 04 Jun 2020 10:33:13 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id o10sm8868339wrj.37.2020.06.04.10.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 10:33:13 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 0/2] Capture git submodules in mirror archiver
Date: Thu,  4 Jun 2020 18:32:59 +0100
Message-Id: <20200604173301.12364-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:

  * Use the git-submodule-test repo on git.yoctoproject.com instead of
    ovmf so that the test doesn't take forever.

  * Fix test_archiver_mode_mirror_gitsm_shallow. As the
    git-submodule-test recipe isn't likely to change we can be explicit
    with file names instead of using globs.

Paul Barker (2):
  selftest: git-submodule-test: New recipe for testing a gitsm SRC_URI
  archiver: Capture git submodules in mirror archiver

 .../git-submodule-test/git-submodule-test.bb  |  8 +++
 meta/classes/archiver.bbclass                 | 13 +++--
 meta/lib/oeqa/selftest/cases/archiver.py      | 54 +++++++++++++++++++
 3 files changed, 68 insertions(+), 7 deletions(-)
 create mode 100644 meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb

-- 
2.26.2

