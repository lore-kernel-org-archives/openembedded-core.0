Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A63C2D0CE
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 11:58:17 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.95904.1719057491367317943
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jun 2024 04:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=V/MooF7m;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.48, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5ba33b08550so1309723eaf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 04:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719057490; x=1719662290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRL0ZXchDHh5ELXs605rXYjvRkB5oE2y0YQvBZM0BRM=;
        b=V/MooF7mc+cHC+2B+p/7aTc/79lHT07Wl46fG8v+Gbr+mUkrmZ9REoaWck8dLjLJL1
         NL3j0F4GTiw3r/WupLtWQJS/fBCpIAcV0T9RkbdNJ8/R57SXBASQMdpWkg6cjgLSXCoF
         4uJmrEpxO3JvDkWP1D7Wgaykn4A11vbXqY9Xe42mNkcsXFBfXJUUA/pJXQ0fZBh4YlJk
         3YWvC/bnEC3FMRBklTp30SD4VTdXpAYTr76KXHH+yGNGsYgreyE4iZLpvfY8hMha/uB8
         0ytDaOZE2rh7HW01RgKMTSjwcgjxmpS1j0En+Z1uVdVLYcmC8GpR40asCJJ7PWyNtOCN
         jq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719057490; x=1719662290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRL0ZXchDHh5ELXs605rXYjvRkB5oE2y0YQvBZM0BRM=;
        b=HKfSVw97bRcHrqd2dYpc0UbV+tAetUgK+CVk4urbFk4NsSC/xnHUCzAwQa476QVe++
         W93wX71xCUWJrqQgsAlFf4swKewN3Ty+WXuDK+/9y8D3chm7biziseWIy3W2m2CMBF73
         Gfa393vbYuHmjDQ1DKs4QotZCZQ3Y4chitRQuXHjs8R91lGcrql/totZ1QRPtpyKBA6O
         LyqbSkJgPdbqaEQum7IsJ/yx2w0FOL12xtCdzHbAwbqdIsAuUQfmA4PfV8OL9ZADa72v
         wssbe0pkC91R+sc0aSOhfFkzzVGTzXFrymWoUVUSK5WuJTKWkRxMa+LMIkiEWLg+ISiI
         5A+g==
X-Gm-Message-State: AOJu0Yw9ijVzJmzoOjshMA2JVZlNLtpE+K8Ecn5Lm55lUfNmzaqnZbOO
	w1dWGC7pOTetSCnVEiPULRcOgg/IdFPHjX5dVs7l6hsZL4yrf7KziGGd+I0gn8O59Ibr/xhxnoz
	r
X-Google-Smtp-Source: AGHT+IG7NAUCr+qdxMAfc09WG7au5JEU1VGnthAcb4OXe6CYvn4y4KlUZEQ59luNjiY7qlQylqjs/g==
X-Received: by 2002:a05:6358:94a1:b0:19f:54a7:4f0b with SMTP id e5c5f4694b2df-1a1fd45b46amr1219290755d.19.1719057490415;
        Sat, 22 Jun 2024 04:58:10 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716b364687bsm2101074a12.12.2024.06.22.04.58.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 04:58:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/9] man-pages: add an alternative link name for crypt_r.3
Date: Sat, 22 Jun 2024 04:57:35 -0700
Message-Id: <5160fb6bf6ef49c0c33b000f377a56effd398fd0.1719057291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719057291.git.steve@sakoman.com>
References: <cover.1719057291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 11:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201046

From: Thomas Perrot <thomas.perrot@bootlin.com>

Because crypt_r.3 is also provided by libxcrypt-doc.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ae5a8629ea72d6b3567047c7b858deae28623aba)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/man-pages/man-pages_5.13.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.13.bb b/meta/recipes-extended/man-pages/man-pages_5.13.bb
index c0198b77be..f8602c699e 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.13.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.13.bb
@@ -30,7 +30,8 @@ FILES:${PN} = "${mandir}/*"
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE:${PN} = "passwd.5 getspnam.3 crypt.3"
-ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
-ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
+ALTERNATIVE:${PN} = "crypt.3 crypt_r.3 getspnam.3 passwd.5"
 ALTERNATIVE_LINK_NAME[crypt.3] = "${mandir}/man3/crypt.3"
+ALTERNATIVE_LINK_NAME[crypt_r.3] = "${mandir}/man3/crypt_r.3"
+ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
+ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
-- 
2.34.1


