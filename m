Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2363.1794418547776109723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 09:35:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GpjcNSdT;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a208d93758so36832305e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418546; x=1795023346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNUEKGe7bl0YrBpCPzTPfkgN7y1r4wOvWLu+6J3xMIo=;
        b=GpjcNSdTZtzp6WcusL8KHQn8kZu/dx0l1FJFTnAGubjhjqg9xorp6NmoGFB0nJUK6n
         Yp08HFZdhZyf5/2/aoTabCerbViKEIBfSz87+FbtIB4Qd0oS13GNOFJ49ARBkmiD4zNe
         TdTXQuG+1c76k/r2/ul+9H9zocNOdTn5e/wJFxq4tKOfVCUFbomyVpbXbi8SO4DSKFQe
         4MjJ9vZOqeBIl5JjYXQ3ottsJKUEExACHm8pECX8j/SNZyV/TFRToFLR8iT9AOTbItNA
         hGx2c83J8Gm3v9XcyeiVakPs2eMrf2i4jia6ZZdop6HkUQC8GaKEj36hAVBayOcenZsd
         potA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418546; x=1795023346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NNUEKGe7bl0YrBpCPzTPfkgN7y1r4wOvWLu+6J3xMIo=;
        b=zhJkNUWjE4Fxkaj40j94kQar5g6YthX4M8Z9YAT3OHFLyOmx1SHeLZZ2TM8HvjL2Pj
         dTMyLYz/loXssYhhGYHzHSWZ9u2Ne6UjsNqobufkF+gEqNj9fQDtSQhDKEfHWiiVLlg1
         shKBF4UmmE+dt4zITqpWECh3HYc7IyHzqlsSpTpaOk1PGR+bYnb2XwcjfqqBj00MqjJ1
         EmEuE0hfHB8ax6JuRbgAexgdliODG2dBxW+ft+v3FycEnlWhMFujbwsj2ZhUVcxYeyY9
         iHNy0hcSKQtxM1uDbl/DnhStnc8AkbNACrR02H8ayPh2OYVowDvebUFbtEaDoTcxjP5N
         cOVw==
X-Gm-Message-State: APuU4Z9RZTaxCFhatBBBh9YBoLkJ6Xu2fu0w/Xb0yviMr0zd0iOUBDTN
	iE8uGhiir71hSy6boWDcnFaj7xHb0ErClXeEW/0ptGzHrqbzwMVWi1VK3JtqD1R2
X-Gm-Gg: AYBFou1NFtU34BzVs/gUhETIauTny0LgQnFUJrdOHTIvTa5/A7am2JJJJdFkYgGhXJM
	kLeH9nSfBFKlIKMxz2baN6WpDu/ZBTb2He+oJUW1fLL4noiPwdog8EDotL2ZcURhAGZNHKUcz0T
	kPgI2d6QO3azWTUqqB5ys6HVkDtQK1zcKaVqWGOwZ37hsay65BrZGKAKC/Orzg2WjKH5d+Tl3tl
	0otjoGzQfVJaSpZ/9FOAk8D0xrlzr8hmxhi0ienzx2PfVnKPOy0y5xWaKrWZARIWItEAjPCoKEL
	Jk+Ehb7RLf5EUkROeXuQNLiB0b6PiuFbFh+Khl9WWSB8FP/y1mcwfW3oEHrSq78JfsvwkMeOPOL
	A0cJyJ+rKmzqH/OFR76MD0cLI2xfqZSIVkU5RNcVGC/Db0AgGc0Gu8U5eWtFAy2I0F6zXrDYWoj
	ikFOv64jfkGkINRBaci8SbwSUU7PiZ3j6TQK3dLpDFnKQVaXDbNiJoYk31pnWsipUgDV6JzPQhO
	ecQdtMMmd6y1enpetx8ROUsxLaBT/zADiOtxWnhffl9Deriw6ANgFcsgDYjvg0eFTe9XI2Fw+7L
	BKZZ7FTwO9n1q7vL+0JUErw8h3wLCTFSnkXdyEnzpTkfj1ZmAm0Vt0P5yqXbMV0wv5Y=
X-Received: by 2002:a05:600c:1986:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4ba0937a886mr56705555e9.17.1794418545950;
        Wed, 11 Nov 2026 09:35:45 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0950394fsm54823785e9.2.2026.11.11.09.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:35:44 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	jpewhacker@gmail.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	patrick.wicki@siemens.com,
	stefano.tondo.ext@siemens.com,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH 3/4] spdx30: Enrich gitsm source downloads like git ones
Date: Wed, 11 Nov 2026 18:35:36 +0100
Message-ID: <20261111173537.3653558-4-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111173537.3653558-1-stondo@gmail.com>
References: <20261111173537.3653558-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 17:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250048
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

The source download enrichment only handled fd.type "git", so gitsm
downloads got the VCS external reference but neither the SRCREV as
version nor the PURL. The gitsm fetcher is a git fetcher with
submodule support and carries the same revision, so treat it the same.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e5146d8f9111416c3fc9247b152d1d70b55c7fe)
Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 9fb2dcc36f..dbaccd0e34 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -449,7 +449,7 @@ def enrich_source_package(d, dl, fd, file_name, primary_purpose):
     version = None
     purl = None
 
-    if fd.type == "git":
+    if fd.type in ("git", "gitsm"):
         # Use full SHA-1 from fd.revision
         srcrev = getattr(fd, 'revision', None)
         if srcrev and srcrev not in {'${AUTOREV}', 'AUTOINC', 'INVALID'}:
-- 
2.56.0

