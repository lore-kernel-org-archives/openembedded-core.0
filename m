Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17421.1793382357389934189
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 10:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=crhrQIrR;
 spf=pass (domain: snapchat.com, ip: 209.85.128.48, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso10925635e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1793382356; x=1793987156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Upk+wuxIPDAACVjtvC/iE5jL+I+YaJYzblxfw8evh3A=;
        b=crhrQIrR3y4aWbxtfgmGSFodCJbf4taUu6yNHKDaknHqcUJAIBQIDnM4vBDR8GJbDG
         wg1QVT77wj5F0zzNTsnUkPfx06kV+W+HrJA0zHk2hM3Z3VggtngiCxkqRXSaSot5v+MM
         O919y+5Z4pfZSxSG85FbYANI78xEHW6XnSGm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382356; x=1793987156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Upk+wuxIPDAACVjtvC/iE5jL+I+YaJYzblxfw8evh3A=;
        b=Xnc5wOauO39jM1edY7FG6jiRUZxC+wkzquSrf6FoAu8CHR1Yniv54lkYMoHaJ8wQVw
         WtGkIgd55KsCr3LBNiDh63LjFS7ZonIWxrNKoMRJplVkN56ELqowzWKvbIFWtH0A0RGF
         pFyC52doVCs0J9ZsDV/TfSn7pxACnjAPonvWn1urBhKyVOpA0QFCjw9EPiUoE8m34oW+
         3NYC8nxkuTAJJGxk6sHZpTy5m9H8QYYUU1XBaGx3bBKS5zJ4XaTIg1tDYKV68XZGV/Qf
         CJzDR+erbabDb96v6STMhiZm7nc9qeoRp76Rz0H/q5dhWUVjK/Yx0K2IOHhxAG3DcVg8
         icZA==
X-Gm-Message-State: AFq9FYIPPP4RuGrb2Ne43/var4nxkCD9jEn5sc6fDHTRFO/C+W73Twwf
	6Va/PDD1n05Z1wj00Lx1YeNVq7XEY93uzcVn0edM7ZqGdgB2uDtlgBPAxqULs8F5H6+tZd0jF5k
	dB1qvFNE=
X-Gm-Gg: AYBFou0zoe9kKDo9OF1u4ctP8Wg3b2BqxAX9vr4iEEuNGmYB+7o1ATrR5yDerTsBAru
	x1rv4rQxWnJS9cKYDKZokjmSeqtBr6/zRWghkXeNNfPOAjVUsFLpD4HhlDTcTG45iP3wb1nTzVA
	CYUIEpNCUb63s5icxIWkBtR1gI5xRqxBUFPY5Wm2K1MeK5AdITuqMmVqOrtuedu8NnIxYiFuagG
	Q2lVrvCv3M7SZP877F23JVdjuoli5YJ16nD+BmEfriH2IcPno+4d6rjQg9coaR64nt9HFw7UK/6
	6k82TqZlqvJWDwZ5Oami6gB0jEtZ9zxpopyjJFupYXbdXwIDeZch+zJwU+0XrbVrF/yowGnoj/i
	homm4SuxByt2Z0yGmh83prQix4u0qWE0ujSdaZqfQdrL42cxuskC7YhTnK8ccYCkEbRdsUCd+ly
	fuvS5wOWgOV4zHpuLK+ompU5Q9kO7ESqPQRjWkP4mqnZ7kjQGTiKEhDXW8X0u2m3Q2Xw1O/zTwk
	pJNtuuSMh6bKKrwlmMj9JWHXNemFa9lfEvoAVnaQBAD+pkZXWO6HoLWf9SIUpXsgc2GkGrXzyqx
	EMxj+DXVy0jA+bECSH11g1TSEkBw9IVrxl0FzAtblk+B7yrmRF3JJvMU8VuGFtL6+9n2Qd5t82M
	=
X-Received: by 2002:a05:600c:1f87:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4ac17b2be08mr67633825e9.26.1793382355522;
        Fri, 30 Oct 2026 10:45:55 -0700 (PDT)
Return-Path: <ecordonnier@snapchat.com>
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf751c2d2sm80991385e9.15.2026.10.30.10.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:45:54 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH v2 3/3] archiver.bbclass: fail on sources which cannot be archived
Date: Fri, 30 Oct 2026 18:45:36 +0100
Message-ID: <20261030174536.2724008-4-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030174536.2724008-1-ecordonnier@snap.com>
References: <20261030174536.2724008-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249064
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

In the original mode, do_ar_original archives a source if the fetcher's
localpath is a file, or a directory. Any other source is silently skipped,
and the source archive is incomplete without any notice. Until commit
"archiver.bbclass: archive shallow git sources which have no clone", this
happened for shallow git fetches, whose localpath is the clone in
DL_DIR/git2, which is not created when the shallow tarball is used.

No fetcher has a valid case for a localpath which is neither a file nor a
directory after do_fetch, so make it a fatal error.

AI-Generated: Claude Opus 5.5
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes/archiver.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index a6b5706abd..ec62b89400 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -249,6 +249,8 @@ python do_ar_original() {
                         bb.fatal("Cannot determine archive names for original source because 'name=' URL parameter '%s' is used twice. Make it unique in: %s %s" % (name, tarball_suffix[name], url))
             tarball_suffix[name] = url
             create_tarball(d, tmpdir + '/.', name, ar_outdir)
+        else:
+            bb.fatal("Cannot archive %s: its local path %s is neither a file nor a directory" % (url, local))
 
     # Emit patch series files for 'original'
     bb.note('Writing patch series files...')
-- 
2.43.0

