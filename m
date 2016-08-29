Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 14C1C6AC37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 11:03:52 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id i5so85764460wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 04:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LCODEU1ZSUesQhmvqM4pEbK2m5tJaIVVYvawoSU8eio=;
	b=MnCEFPFDMulGLeVJ3M7BsfZoJ1wSgDFBB3eJovNKtfSOudN99xp2Qx2myZcX/Pz3OF
	fKRkL1Iugc3adUNOJXLulUY6zYCkK9y0gMCK/myKQPCVrnHJXu1n+cHHHb9NZ1LK/OC/
	BVVclXasJt6lc6DcTKC3mQkPOl+rvJZfeVbeDeU5NQ4qg5qPj63t+MTh1ZxFiL0RQxNf
	KUUabJ+ZrhzbQCK6h2IyRAWEqBPqT+ArFqBGouyLgMP/9bB8Zn5/J7b6YGBSb9v+NSPl
	ma33KkEhgJrTAKvZeTJmTePSGzS5shYnrVYAKjvkaHBzyAkhldLj/S0guaMDWkowtXdY
	Ixug==
X-Gm-Message-State: AE9vXwNL+9tZbAG4+gXKQdHjhlcau3w+yUhR/wOqRuCrsaRHSGdFsmbJ1kUn6SGmiz/zTA==
X-Received: by 10.28.71.197 with SMTP id m66mr10338668wmi.26.1472468632363;
	Mon, 29 Aug 2016 04:03:52 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id m5sm13944169wmd.1.2016.08.29.04.03.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Aug 2016 04:03:51 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 12:03:38 +0100
Message-Id: <20160829110341.13100-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 0/3] boost mips16e and soft-float fixes
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
X-List-Received-Date: Mon, 29 Aug 2016 11:03:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

These patches fix a few issues, see patches for details.
All patches have been submitted upstream.

Cheers,
André


