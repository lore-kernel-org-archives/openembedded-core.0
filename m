Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id C3C557D123
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 14:09:30 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id j89so14539283ljb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 07:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dgiRRXoM/c6HYjp/s8EyNbFj6w8KnbHTkwgKRQQYft4=;
	b=edncpWusGz0eFF/IzfeWLHtbhgiKhVmv2gJXfKRHHRmP9Fzc+2wKt1Kub7IgIx0zbj
	NFuzpNt8a+YsTJ2CVm0yXU7T0rDjDTpancaqKTKgHXI+t1G3pRzni5mPdyDfNSbPl2VP
	M9qu+6WnJN+JetPg4JNkdaT1W2upwP95k21sV+JVmHXxPKTgIFEn6GoLENfc4W73MVRR
	Enjv+VvthEfbmejHXe5wjRimbTO4K6rkfPbAbsbVxxMnTXEgT5FrUxKN/sY1GfTokQMF
	ITv5U2UhBwn36I30o7/NetYzpPZjy1PTLP3Z2c/9HWFjowOL9KJiGaJRAMm80gc/uiBl
	tSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dgiRRXoM/c6HYjp/s8EyNbFj6w8KnbHTkwgKRQQYft4=;
	b=onrPC3Id5FaU2bCuVnJWDqQWA2ZPMgRAX1m7T2a2Cls/UtW7MGjd29VzsEvPjMZAyB
	mFI0/7+D8Geb6ujbmimLSup6Ij1UDebkQIqo4DcBb9pDA6zXExD6NA8RQZ4q4Rxie53+
	w0RbHb8K4SiC45yj1HM7hYaMlPCiRFr3F04V2txHCaXa6zVukhMIPMTZ5ncWEqCfK3ss
	pq9Xq5WBFREjqtqFfXxJfN0gpjLh8MnPgdJzIxTQ6pLidmf11ZE7lO4WHKt5Fwk3K1f4
	yp4Aa89o44cMc+BBZ7OVft9fTJphazPdcsE/JTNn5gizY97lmMaERWPcycgY4IIWDazN
	yurg==
X-Gm-Message-State: APjAAAVVsuVA84p6HnfeK/cbzP9A7stQYNbL+RBugy6z/6qTe6UoQX8O
	ZMc7LRwHBNchz2bbszvDCGQfbK0Y
X-Google-Smtp-Source: APXvYqwE9MWdQtvr7ezdK/mP6n6tSrMYI9/pjDdr7FjvAEV/z4LYHtds5zZyfPM03f4DjOct09XYfw==
X-Received: by 2002:a2e:94ca:: with SMTP id r10mr19167583ljh.118.1553695771328;
	Wed, 27 Mar 2019 07:09:31 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 1sm4704382ljw.56.2019.03.27.07.09.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 07:09:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 15:09:18 +0100
Message-Id: <20190327140922.109867-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327140922.109867-1-alex.kanavin@gmail.com>
References: <20190327140922.109867-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/8] bmap-tools: fix upstream version check
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
X-List-Received-Date: Wed, 27 Mar 2019 14:09:31 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
index a3f77d374f7..7c4db85b32c 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
@@ -15,7 +15,7 @@ SRCREV = "db7087b883bf52cbff063ad17a41cc1cbb85104d"
 S = "${WORKDIR}/git"
 PV .= "+git${SRCPV}"
 
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl python3-six"
 
-- 
2.17.1


