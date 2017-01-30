Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7DD4777225
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:45:56 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id e4so88338749pfg.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=lzZ1yoxprapwJbh13k2fyuglNZ31xzQWFVtOJsDSaxg=;
	b=K28XHbgSJvrYcr4UTkZ4u4bsVIZTDKxbBQGIJ6wGlosHj529jPc1b8AUW3/+mCs9OO
	hs9fPMP93t2QrKoNHJp/VVAi6aX3vOBFV/9lgmbFl/QOKk/jlXSdXUTyncBySF616cCu
	GgpEMtiDZolxj3QsjZpMF16VlnrbH5Tss218/LIZwNsKpdURm4MrGcQCZ+f0gNLwN3fA
	pE4KOcHnjBSZ86OOa82pDRyL+f7xL+8ufwLiJXAsc3fbFqZ//vErbyNNPjcxw3fSKT2A
	sg7SHoLonZ5aZbqSjAhH/MFj8dMnjrL919E8jpK5bjHPS2GSSJsjF91827RqJh+5mrKm
	6RbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=lzZ1yoxprapwJbh13k2fyuglNZ31xzQWFVtOJsDSaxg=;
	b=RRw0T7N3VTQi4sD3Raqxlak5ULjhIMoR2+vDSQX9veWmDuu/Fo+rPeZH/vv590VX76
	RWdRpiblRYcLccyBMrtCaFVvUWYiCf3mDxkMxGXY9TUfpLs35ia6rx3irYotCHmE98/g
	QVvnqm4KJYh1eSgSbu5jisVMpB7IMRvKG/ph/2ucpBKjys2jENa32X3KH7PrUx1MUm3W
	gDOq6illkr4hK6b1TBzoneN+SHNe4gA3ISKDOdTyd5Iei3KXDeFQBhnpXODjuO8RBpqr
	dJOdG0IJW773LX4d8KVaw0iKjr60N+JGy9AmUgZd2DpIkDn8F2qGQ/mAw6Uq2IIehkmS
	+8Ww==
X-Gm-Message-State: AIkVDXIXITC+i0Aj7zSSWlCEyk0Fnj5SL4YUIqASQQN6lPmu+rcAN6dmj82vw8vQvC5VIg==
X-Received: by 10.84.217.18 with SMTP id o18mr29992663pli.51.1485762357714;
	Sun, 29 Jan 2017 23:45:57 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	c204sm29609426pfb.51.2017.01.29.23.45.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:45:57 -0800 (PST)
Date: Mon, 30 Jan 2017 17:45:52 +1000
Message-Id: <20170130074552.32419-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 0/2] glib-2.0 changes for nativesdk and packaging
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
X-List-Received-Date: Mon, 30 Jan 2017 07:45:58 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

This series contains two patches. The first fixes up the renaming of
gio-querymodules so that it is only applied to class-target (so that
'nativesdk-gio-query-modules' is not generated). The second change makes
the removal of 'charset.alias' occur for all targets including musl
since it is not packaged by default and not desired in cases that it is
generated.

Nathan Rossi (2):
  glib-2.0/glib.inc: Only apply MLPREFIX renaming to class-target
  glib-2.0/glib.inc: If 'charset.alias' exists drop it

 meta/recipes-core/glib-2.0/glib.inc | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

-- 
2.11.0

