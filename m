Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 42CF678687
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 13:05:42 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b21so16687958wme.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 05:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=IVEuhK0WORcRuh3mIdRvJB9vYbHSfyGNz37RKi0IQSs=;
	b=ax778wvVLmGLZKoIjDBeYzhw8YJVGnlrd9SJwuTmY/2S1RSYfJMZwiLpE2PfadlGZI
	0K+DuIlcFvj9xhz1S51UZhIm+qPve/2/8br5NeeWeI1x+1ASnVFzyxqFmfLaBHthzbL+
	ip6guS0YzgPgYn667qmHEh8LwUQ2gRNraDR1xbDSTsaqA8MgizvC4QB9aTnE6rNBs/L3
	KGY7PlG/vBrLN4nvwKjRx4aSgiVk2pnUkqHjnnuVpobYbAt6bh2DYEZYHIl1QvmCIHLR
	9fOOtGh33TXfiV7e1iOm9/0tb4KOybTlYIFiDanHREMhsKYFcsWEnegjW9UuMJMK4c27
	Ya8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=IVEuhK0WORcRuh3mIdRvJB9vYbHSfyGNz37RKi0IQSs=;
	b=pG1i7k87NiOwY9ITE5+ZJLnnFJzgiNA5vZlEuJVqsHDXWK6pdUavFndI4NXkXEzH3f
	YKb/QGI6oq0dfdKFcoD3LPtFyvUYIbkJ+ixDN19iQcBujNKqAoQc/FV1wXzG/V1C1e/A
	VjKGjTZWKbKLAV+hj++aeMEineh6wpIDKfwhiIbP5VPh/LzIsW3X5AjpU1YC9MrZoZuV
	2AEke/PZ//v1KXKDUnvKiCaxcHy6PHduaSydRFOq5uSYfEGaXJgt8qOg83FGBwL3irMg
	0y6VWhUVbVZBS/YuGa/3MTs3xywx32hpCC4cqmN+2kvjR4uprciSY7pKAbyPErHaiH9P
	MTRQ==
X-Gm-Message-State: AKwxytfiRqFYOSoBMcqEoI+Ow2DX8oBGeqJ28QmOucZ+aZm8rvflwDPL
	BK/CZ2VF6QDthcOotTRFyQK6xduU
X-Google-Smtp-Source: AH8x224mpZrQRGVqubbBJh+WHmW+RKK8Tpt9ArrU85qXKnKlioF9aSeBK2U8N8/GXP0+CjHRdC902Q==
X-Received: by 10.28.180.4 with SMTP id d4mr5771821wmf.13.1516626343519;
	Mon, 22 Jan 2018 05:05:43 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id e6sm8950862wra.41.2018.01.22.05.05.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 05:05:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2018 13:05:39 +0000
Message-Id: <20180122130539.16319-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] buildhistory_analysis: colourise more output
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Jan 2018 13:05:43 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/buildhistory_analysis.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index c05841b804c..6c0bca8d05d 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -124,10 +124,10 @@ class ChangeRecord:
             lines = []
             if renamed_dirs:
                 for dfrom, dto in renamed_dirs:
-                    lines.append('directory renamed %s -> %s' % (dfrom, dto))
+                    lines.append('directory renamed {colour_remove}{}{colour_default} -> {colour_add}{}{colour_default}'.format(dfrom, dto, **colours))
             if removed or added:
                 if removed and not bitems:
-                    lines.append('removed all items "%s"' % ' '.join(removed))
+                    lines.append('removed all items "{colour_remove}{}{colour_default}"'.format(' '.join(removed), **colours))
                 else:
                     if removed:
                         lines.append('removed "{colour_remove}{value}{colour_default}"'.format(value=' '.join(removed), **colours))
-- 
2.11.0


