Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12517.1793933711511217251
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 18:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yz1XA3PH;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so353646eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 18:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793933711; x=1794538511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mIt+YgLzBpHHk0qTld3EIJ1svehXN/MJGTl50lruKaM=;
        b=yz1XA3PHhiD7apLRojY9D76OyfMxKao4UUK4VxpLiSipzzhMrfaBYpDm6F1+ZIox+b
         eNcciUKKW2SWllgLNHbLfGb5pqDW5sQeFnZjFHcsBKLznBrxX0OnIGkymoGFHxXRaLYY
         rIgd2ZeMHiFUEoTRTLVNDn5l0oHKTQ6G1mepNQVNnoTLBUpeVwVO51O7I9w7nVecrA3o
         77W5kPmPhv3NHo/rXitKAEJE9ugTZ6i+lZ/dEseFt++KMqD+9Yd0T8v9oDXNGT6fWAJN
         pGHAvxhuNjsdguJQzr8zDS2pqUeCBYRSzMMHwPpbeEKDsd6bRR7VP2xsYN/Dzyz+PLX5
         wgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793933711; x=1794538511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIt+YgLzBpHHk0qTld3EIJ1svehXN/MJGTl50lruKaM=;
        b=s3wY+2Z8yLJwdqhtAt4aCwwQ+W/XEbXkvvlPJqk/n2jyzTg99Gdd3dsfQb9b96vKce
         hZN21Pu1AUiiPEE+kuxu/WE/asgaBmSVgntqTo2NSnS135AkGey/xk84Z0eEleGjJu8W
         AGHLm5Q3YeP6AW0nnjTDVcnCc+erd2HrxcuZYtkhPGy0VTwoLFSwFRLb7qoyXHwwWLZU
         TGZ5kTATnziafr/zpc0TtejnZEHk/dmPHWlxjp/mJdibDZvlpI1zqXJ1vOqUgNhboqf2
         G8i9EJtaNxymW6mg/qmp0TpbkkscF5xm2R3hWOu5tlyMWpQOuyvq1DmeoEPBrw2yZhxF
         G/TQ==
X-Gm-Message-State: APuU4Z9bmO9H/8YkLv8Beut+/WlVeS+f/KJVMxUH5jxThq/GEVAlB88w
	WXvUefjp3w0QSS6a5D7IB0vy4UJyI7WQxu2pbb3OLMxVRezCOLWWB6vL+LVbvw==
X-Gm-Gg: AYBFou1lxITOcURMMXzgo8+3Ydl3RunHF/67Qa9i6k12EI7U8IphZuGj13hetgMcWiD
	YB19yHuPrhncYe+O/nr2UIWBJRgdTzPWRQmjeNuj9qQmqxuNhi9vBbad9uq3WKwv3tOXOr44DzO
	7QyanH9JRaPwqC5A1jGjABypASDs951w3TflegDR00q/rQKmuyd3qbT8l+NYwBBUIJGCkQnuojH
	MzagfyecX5g8Mvg7jKM1BvW3/fNQDEnIV/ClUBHBRLLXnTZUU0H3uSCFnXIfZAoaDlYVToFa3pg
	OMGDCJPHVVLkolyGgHOwbduJdLivaBOek2y+pXGDihEmpvr4xN60iiApzztJCXUwi9EdKaAkyat
	x7Kx9E4d8SOVFSGs9vnkrUAzH/sP+6cu3EDih6OKuSP5J24JEq3cC4D/PP9h3BB4id5A58K752S
	NznIcxELDJ0RS0XLBRROId3LYf+vhfTHsxd4ivqus44arraV0HtUgUJNCLYlfkJ8LYAlhWIchtn
	OeSgDyLgMfyKCJxjR6WH/PkV6RT8cfd9CWHs6+rqKaMLCxOuSw0+UFetwFM6ARCDOzPxQwBSvdd
	IILoYmQ1s+ptVoHG43lR3m2Mm+GNwjXWSYPelQRa09WNy0cdtuInG1j9wEZjknKA
X-Received: by 2002:a05:7301:4145:b0:36d:e4c8:8f04 with SMTP id 5a478bee46e88-36f76d128b3mr1294279eec.17.1793933710691;
        Thu, 05 Nov 2026 18:55:10 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922b205sm1577172eec.11.2026.11.05.18.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:55:10 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH] sanity: fix NameError when upgrading a TMPDIR from ABI 14
Date: Fri,  6 Nov 2026 11:54:16 +0900
Message-Id: <20261106025416.631340-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 02:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249583
Content-Type: text/plain; charset="utf-8"

drop_v14_cross_builds() calls sstate_clean_manifest(), which is defined
in sstate.bbclass. Since the sanity code moved to lib/oe in 4efa61f049
("sanity: Move code to lib/oe"), that name is no longer in scope, so a
TMPDIR with ABI 14 fails with:

  NameError: name 'sstate_clean_manifest' is not defined

Call it through bb.utils.exec_flat_python_func().

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 meta/lib/oe/sanity.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sanity.py b/meta/lib/oe/sanity.py
index c9149ec974..77cea4ed24 100644
--- a/meta/lib/oe/sanity.py
+++ b/meta/lib/oe/sanity.py
@@ -474,7 +474,7 @@ def drop_v14_cross_builds(d):
                 for m in glob.glob(manifest + ".*"):
                     if m.endswith(".postrm"):
                         continue
-                    sstate_clean_manifest(m, d)
+                    bb.utils.exec_flat_python_func("sstate_clean_manifest", m, d)
                 bb.utils.remove(stamp + "*")
                 bb.utils.remove(workdir, recurse = True)
 
-- 
2.34.1

