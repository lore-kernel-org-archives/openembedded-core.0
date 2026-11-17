Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16617.1794918310614626139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 04:25:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=GbnBAm8+;
 spf=pass (domain: snapchat.com, ip: 209.85.128.52, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so20293325e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 04:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1794918309; x=1795523109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzD5giFoUQwZDTq2lD/KGHPDvjhgt2pGYW8E9Gvsaw0=;
        b=GbnBAm8+kDajYceQ5FFEs8oeYW1OMDCXbA2WXsr+uAsmOIvrxmIW23cSZ8kGrJ+Hbq
         rXGeB6Uq2DWva8ocz8uiiIqGkXmprbb4++KtEclMiMpD/TCDmnSPTqp0XnhkqwIADOmi
         FTepUt2TYhekWN0iJIsvHrf/6kL3FpAAWhErw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918309; x=1795523109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NzD5giFoUQwZDTq2lD/KGHPDvjhgt2pGYW8E9Gvsaw0=;
        b=nfCaVFex2QQDy9yamq+i7uDsAekxMYNm9HAnYVP04oQnGMtGD7/bqva578EyC4sDf8
         uBjuSq9a8uWlGLLIkFKS+QwZ/7m6QMZFZET2/uPKioZgZO6WtCfMddZ2yJuXik63y7Cb
         QYiEQZYSse6Rss6oF02xb9a36KRJeHanDaSkCDrxbzxcXEC/MWNxFUHVuR7mRZJLs0df
         ShfCVtwy2T8m+sFcWHr9Ojl2LHFvAAAElvj1Q8GHL1AfoxNk8VwziI8w5o+gvjn9rnlC
         u9i/gP4X7KKM/wr+UNPMzbga2c1q6GOqDXElhnFHvDovs2XjZYfFse3gm7mDsJDHzzbt
         vwcw==
X-Gm-Message-State: APuU4Z8TSwLDOVyEipKXVEtBj4kWB9mCdz1nr1Q/kRoPS2s71xXaQQjp
	hIoZ4Ez2CdYMg3JqR8li4KEvp674g/Epv0AvsmWCpVa8rIe5EcT5OPsMGqdDM9nTlUO74jkJlYr
	tph5aVRg=
X-Gm-Gg: AYBFou241r86pDmqqFe29bosuHNnIxc53KPdpRGXMVrbeMb3SVGe4LvpCdAm/g1ipar
	stfV70zG9eOF2P2CDVkGG1aKWuvye3cLoDlM9/iIeO2xiwGp40+TREZeeGqOMWBNcPmtYU832AH
	OLstSIq9E2aSqgjalrnbQf2II6w6wxB0zES/KpuSdGrTwRHzFxcB2odL8ab0otiwpk+rLWHBZOD
	74CB/hVNPKWskxDVTi4sU32EurD96ARunwGnAhGo5V1QTJL8107WcmwWXlVECLMX0VRjWUTa6g6
	pT4+nz65PUiearV9YuHsz+k0j/z3NqIQEkQEoE5ye+unnyYwT66KF9MYH119g99IZRgfgpdtLJR
	Tgf8q+NGmhs7V06x9x4pqgsR7dknKAwpOda7iVgtS+4OVMzwD0IU75i5ZDDGnOEagzLqLsG+3WW
	ZdjZolGsKl8hNPRTKhxxM4J04TCx05EgR7Xhulf6c09ugzWXeg4XAQ3zplzlBSOZEKfsI2Wk3VJ
	qYZOvWAvVuzEBn3GILrILoNx8sth2E4rMS0b7UjHdubia47+09rchuSbjvgW3iYhcMCNtWjKl+O
	5aSDxSnQW0DC2I4uREolSE1hUgEzIZJn7jG9nQ4Sd9f4qjzy1QomsHuCnSRJg2RVtgV5B7k1UfD
	PKNFXYP6pwQix4if7QoJdJaYwJyf+C35dLg==
X-Received: by 2002:a05:600c:4e03:b0:4bb:6c5e:b006 with SMTP id 5b1f17b1804b1-4bb6c5eb406mr139529585e9.3.1794918308774;
        Tue, 17 Nov 2026 04:25:08 -0800 (PST)
Return-Path: <ecordonnier@snapchat.com>
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm26284925e9.4.2026.11.17.04.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:25:08 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH v3 3/3] archiver.bbclass: fail on sources which cannot be archived
Date: Tue, 17 Nov 2026 13:24:57 +0100
Message-ID: <20261117122457.435864-4-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117122457.435864-1-ecordonnier@snap.com>
References: <20261117122457.435864-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 12:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250441
Content-Type: text/plain; charset="utf-8"

From: Etienne Cordonnier <ecordonnier@snap.com>

In the original mode, do_ar_original archives a source if the fetcher's
localpath is a file, or a directory. Any other source is silently skipped,
and the source archive is incomplete without any notice. This used to happen
for shallow git fetches without a clone, which is fixed by commit
"archiver.bbclass: archive shallow git sources which have no clone".

No fetcher has a valid case for a localpath which is neither a file nor a
directory after do_fetch, so make it a fatal error.

AI-Generated: Claude Opus 5.5
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes/archiver.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index d22213be33..a54882eeb8 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -248,6 +248,8 @@ python do_ar_original() {
                         bb.fatal("Cannot determine archive names for original source because 'name=' URL parameter '%s' is used twice. Make it unique in: %s %s" % (name, tarball_suffix[name], url))
             tarball_suffix[name] = url
             create_tarball(d, tmpdir + '/.', name, ar_outdir)
+        else:
+            bb.fatal("Cannot archive %s: its local path %s is neither a file nor a directory" % (url, local))
 
     # Emit patch series files for 'original'
     bb.note('Writing patch series files...')
-- 
2.43.0

