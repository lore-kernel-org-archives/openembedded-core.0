Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17416.1793382347321865679
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 10:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Yj7rE4S3;
 spf=pass (domain: snapchat.com, ip: 209.85.128.43, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso10566205e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1793382345; x=1793987145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DLzBJINZyglNMI1MDrLIiotaorFViGYTmo8hltdVH2w=;
        b=Yj7rE4S3hU1hs2tdYKUODK36D9ZnuXZ8gvtfRmBmqpnX03CuY+WkOQq/18+GEZR7/U
         xd718OXzMqHha5piLPRrVRr0zg/Y8vlexLJbvsFymIOeoGfelYBmBdzi1/NmzutEL106
         Sy+vN9xcgiZqVgFyom20obkZf1tRQbJ6BnjNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382345; x=1793987145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLzBJINZyglNMI1MDrLIiotaorFViGYTmo8hltdVH2w=;
        b=g+cbaHSXHDlizQ68S+yb9k/0vuC6gbUDJby0SYGhUGWNixBQy4FN2fUtvEHTLKSpGe
         xQZDCBWaGaxLjO2TeDXrRhXQntyEP1/MBit32aUSQSKTlcPi9BhFnMqq+3jU9UnaruHy
         LZxF7PTU3Ss6zWAkCunxjYR0VMvKyGtYl4bgeMS1R1QbBTj8n2MsTNf+qtnlUHZWuQmq
         ES2MblvxCm/+XP8XnWJ9PV4u8WV9tgxEQkfBER7tSLypwHJ2s8fMED+LEFLjxE8HBndk
         VKzdv96JDTmp2i4LCYnLw+nHP5CPs5GxrR/yyQZJahGsXanGRx7MaTJjws2O5vqNpJ3r
         zn3A==
X-Gm-Message-State: AFq9FYLDwJ6zb2N+UjVVdw6ENIPFptC2IerXm3BGzKz+yzhTuUmucce2
	DPqQ253rEn2kygieujRdLeZq0S7qoan1s98YImA58T6CXUnONlcYG4r9oUKxRrWpT8j4Ijpzorq
	pqrWw0kQ=
X-Gm-Gg: AYBFou1XSd+rlwiR5h/kY6GuAa+5mJxGVYeo9bBGvuPaTaAmwdv0omL7LYYShln5QX6
	jmgXPrZ1FwKmy6tePgo9cXJzWAdmNWtxwuZmDgeE/Je4bzT+hMjNRh2+ZBPOzzDpOKSP0cbcPcM
	Qq/IVkCNnO/usCQjWQEmfHFIssBfld7xPKBv1XOIb5HBecIILuGDGqL39iOgBqMO5hUCwalZ6j3
	k6VMjZrRtY5HoLbiTsv2VAPpy9SuKybPLAgw4JFMwPy63YQKYZV+34EilKIancWpTxAIKBElRxx
	yTCcK5DFgI0tgwrQ4x4KRAOPuF0Qp4u2t1cEomgVNQSKZ/bJk246/+E0nhmISbExC6pr9TBEv4B
	bQTgXOc8KRFb4XINu1gC9mEH2BwOUWp91NVGR/E3CuUzuich7gcrymgxmrS1iAbjl7/GpoJyFOk
	NuZTETDJxx2OJf54qLVIp5Khd0HGF7B+jvTmoOGCF7qUM9KDyX3KIwrKy56Ezr3PtNj0P6qC781
	w33fVw9xmAKk2agcfz+HzMBGy3iEEAmbQH0mPzvsYXSmsbnU6p0SEg5a9Dd/kY6xI24uoNNmV0w
	7mmTle2wuEzJSCbyb9GWj/BCEIadYa111e5p8Oh+K85MJ2vNkGEaw5d5BSnBDEN0y50uwEFAZw=
	=
X-Received: by 2002:a05:600c:1d28:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4ac1793fb6bmr81860415e9.16.1793382345380;
        Fri, 30 Oct 2026 10:45:45 -0700 (PDT)
Return-Path: <ecordonnier@snapchat.com>
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf751c2d2sm80991385e9.15.2026.10.30.10.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:45:44 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH v2 0/3] *** archiver.bbclass: archive shallow git sources which have no clone ***
Date: Fri, 30 Oct 2026 18:45:33 +0100
Message-ID: <20261030174536.2724008-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249061
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

*** BLURB HERE ***

Etienne Cordonnier (3):
  archiver.bbclass: archive shallow git sources which have no clone
  archiver.bbclass: remove .git from original git source archives
  archiver.bbclass: fail on sources which cannot be archived

v2:
  - Combined the two v1 patches into one series, as requested.
  - Split "archive shallow git sources which have no clone" into 1/3 (archive the shallow source) and 2/3 (remove .git), and 2/3 now removes .git for all git sources, including the .git files of submodules (kept for nocheckout/bareclone).
  - 3/3 ("warn about sources which are not archived" in v1) now raises a fatal error.

 meta/classes/archiver.bbclass            | 22 +++++-
 meta/lib/oeqa/selftest/cases/archiver.py | 91 ++++++++++++++++++++++++
 2 files changed, 112 insertions(+), 1 deletion(-)

-- 
2.43.0

