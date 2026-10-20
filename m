Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7611.1792503347935274724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 06:35:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B3BXvVI6;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: vgharaee@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df8fe8513so2818299f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 06:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792503346; x=1793108146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FEzndXKJORSYwbIfk5Fp/y9A+U6kji2QwWawxh0v4QQ=;
        b=B3BXvVI6fUsSZAXflUteLL0LMNxPIafmUuKEKR5HnJAoUEVSfwp8ResQiEcV1B0Dsg
         S5CrNQqSAzDYkFVj77CB7OqDmwEqpdHalDnWXvUwc0UKLcX19L9vJgao+Kt2inn8Chu4
         cgRaaw1bAuewvqJd6ZQwnZ78PIP6vdPWsKQGVdC1gC0Pi0ooeQSw8HZlR0THz3OnJT+U
         TtNpxu83Ex6PCZQWSh7wQzciUvc9pSaJxzNIvmaEbTXClBr2sKSEmccZJyRtlTsTs/to
         fAFLrqr3pDBJSwb/tIqG0FFFVTm5ZJpdqV4dh7q3Tkf8EK5IqOR95RlghsyDcFtBH27w
         wY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503346; x=1793108146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FEzndXKJORSYwbIfk5Fp/y9A+U6kji2QwWawxh0v4QQ=;
        b=XBiLZZnB1qWD2W9BcBtGf0FwiCKrsfJQMdqGnzj4WX6m1Dr05b/mut8qQguPaZRiqy
         NOqjOvsHT2hax55+BbwqamUMpIe7uP5Cf8nHZfdcBli+sc6OSAYLcUE46DPtqNQs5x0L
         0CHpzR80RTbxkyMYcKWZQNeujiCxKE6hUnt2kZnI+wCGJs1q2ShSDPKIU/viYaJckPvo
         O02X8KE55ZksliVgED105fVolvstZT00qgQXpuDI8dMuZ/RvrwVb4j2MbRwR2QDXS9h6
         J9XKuTgaElFusQuB4zCgnUY1qPA7xzoB9wvmk/Bptu3zseDibYHt+vP2qLc9WTlep24/
         JaKA==
X-Gm-Message-State: AFq9FYJz2Nr/neGyCwCtdN9K0WA8rUdF+J8pfj+xEkn/lpofEIxgP3O3
	UaHHyrEgmG7BkNVXkzEyRhs6Cak6Aey6Cmj0Ukpk17So+gNuNKxR9YD/wuj+IQ==
X-Gm-Gg: AYBFou25W5DUjKPAT0JnlSHQKLiaRueO3IYl+rHoebytBQfpWK3mHhBHNRio65t/h19
	tvzQ8MxiSoAJlIOxQ2Kk6vdFdHVN4zzcC6r5sM9wunCbdvBMj431IcDmNlush8bNkSU/2LkUn56
	ZXczA+TiJ7YMxxD3e0i45sdtXSV5CXZcXz5X87RHnje9rEOtoU5t2SQztGezY/nSs5JIQwGgXPx
	H8tK1Yz+Hvm+bBVhn+GyWSOPA02xan0IhPNZSuSSfLmsbGRqKZuIKnTHTK4UYu7v/9KSW2czeV+
	DjYHF1wWNpddnFnP5BLnq2mYL7HxyQ0Hwj299VHS0zEbRTnChnp8DK0Lt5dyZVtoptffxEeTbPu
	5p00fyeMTIw8feKqHh/1suXmhBjpIagXZIfJaz5vyHn/VU5R6DhO90Dlqm5HVnxCjm5AP2bokf/
	eI/Aubybmf44EkdxvTnu1iVGnN2GY8PYStiJBqA790qUrfkGQCM+4563I+iKVZefdbZ1uxI5Z/c
	bDkRTV4WA+vB4fogV3s++0/UHgQJL5RqPdspb5b
X-Received: by 2002:a05:6000:178a:b0:48b:e50:714e with SMTP id ffacd0b85a97d-48e07f9801bmr21469691f8f.36.1792503345655;
        Tue, 20 Oct 2026 06:35:45 -0700 (PDT)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.t-mobile.de ([88.128.94.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818d61sm6060209f8f.31.2026.10.20.06.35.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:35:45 -0700 (PDT)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/4] Add support for multiple kernels in FIT images
Date: Tue, 20 Oct 2026 15:35:47 +0200
Message-ID: <20261020133551.90185-1-vgharaee@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 13:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248287
Content-Type: text/plain; charset="utf-8"

From: Vahid Gharaee <vgharaee@gmail.com>

Changes in v2:
- Shortened commit subjects in patches 2/4 and 3/4
- Moved AI disclosure from the subject to the commit body

Vahid Gharaee (4):
  oe.fitimage: Support multiple kernel nodes and configuration selection
  oe.fitimage: add metadata for multiple kernels
  oe.selftest: Add tests for multi-kernel FIT config
  oe.fitimage: Add custom configurations and harden multi-kernel
    handling

 meta/classes-recipe/kernel-fit-image.bbclass | 129 +++++++++++++--
 meta/conf/image-fitimage.conf                |  55 +++++++
 meta/lib/oe/fitimage.py                      |  84 ++++++++--
 meta/lib/oeqa/selftest/cases/fitimage.py     | 156 ++++++++++++++++++-
 4 files changed, 397 insertions(+), 27 deletions(-)

-- 
2.55.0

