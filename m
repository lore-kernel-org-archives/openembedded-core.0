Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC26C5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 10:36:15 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.46566.1748860173832969701
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 03:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fry6sk/j;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: samanfatimarehman@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a36e090102so2377567f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 03:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748860172; x=1749464972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VjexWlqpaIWa3pbNX+ElmNFsNxoXCRTOcjWAVLqECo4=;
        b=Fry6sk/j5cXCydlsjJVU87LQsPypeuI3RlFuTne8cqAfdCZ6tzj7Orq5euKs4DAo6a
         wnrJVFreC1twj+dKNVduFnW9rOHkEysIk4MzkYREqfeQ1NGbuhegaZ+PnQcDeDxH9SBg
         gP0ibPYaXb5kYZ9iCGFGUWQVrBx0GdiYZBYPtUcXnKCXbv88WW9+KnqNQ1IjrZ197jFu
         ZBltDIVaz8ENPeOP7gC2glINxsLhhsMeWxD5HAt966LOtl0vhps47osi4Tii49So+sNM
         LelsGqbuMKj2vOlzTg8nNLCoEam47A0ge78nKD9/eLPG2ycjq5HF+O7Vb2VD12otxh7l
         xl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748860172; x=1749464972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjexWlqpaIWa3pbNX+ElmNFsNxoXCRTOcjWAVLqECo4=;
        b=ghj4sS6F2bLl+LGDlkcZSDqiDLcGcr4YU5Cuk/xN8UEonopPSmd8EfwQPzrN0W3GkC
         HiKkHaSVWRbXV+40c2ucWWbqVXy32dnBdvxkopO+XmimcutvdCMdKvCkSi0OWvKPHXS0
         rTVPnbpoQYu8FHJyeyvSlW03w/OhYozEJUEIT9p5uKysCIvWtFHfSdUI6ALW0ta45XGl
         4qb6YpkXLx3AaRBIAttCwfbSM2oZk7vF8RB2E1SbnsQeKb/kdYOweKYbpR33T8nJNUNg
         xLlmTIUe82PnSpL4Qsd2aPKcLbPzxu1imEdNOaDAD59dfkprmGXrTkI+wdN7Y6BoHOT8
         Xe2g==
X-Gm-Message-State: AOJu0Ywu9+RhM9z668ok2sMXLJIMDqg2Zutu2X5c9KXhqWb5CXiKMLrV
	9kUSW6teS5HRaIgG7gUsodcet+/TyzTQUpzcyBY+vYWQx+j5sEH+FOYpgO91x0n9WjM=
X-Gm-Gg: ASbGncugzUuhNbi1iOzLMM0R3tCNrQOIlbmuLpM+fxy6KrRfTtp8po+za4UevuGDuKC
	0mjdkai5lU7TRmTULN6HcxciuSCe9O6Ad6tThCuySX54tQL5fL56f8MNYfqmX48D5KX9wawM0IC
	ONaGZJwiojww+qyT4AEi093j9C3MrrdNXYaHCdcyKfnasQrqVAN50GYDnfjoPEFNpaaGRcBkWIC
	IJEuHVjRWST6NNsSbY9lWd8f0QCmoI+R5S0ZTfz2t7Ruzws9w2/QlkAaLjsE0/XP6v5532IvxVl
	WTAmrsmXb5TyjaNad9XRjUelKR+m3pWqygtkl/AuC/ixsyxAXZZG4dE6oI+B3thj1+ybBV4Wcr+
	wfwoqlVZZMaTAi5fTy6ELQtoerXFkjggvPRk3rQFwBSofKnBhyuRiuNwBmEsH
X-Google-Smtp-Source: AGHT+IHWpRgBIxLixJiq4ZAFUpySdBd1uvzI2DgrGmfx2UVIRfnieRFKdbb2f9OJIWI7A/ksjGWwkw==
X-Received: by 2002:a05:6000:26d0:b0:3a4:e6c6:b8b1 with SMTP id ffacd0b85a97d-3a4f7a1bfa4mr9752494f8f.17.1748860171617;
        Mon, 02 Jun 2025 03:29:31 -0700 (PDT)
Received: from de2.fritz.box (ip-109-091-203-121.um37.pools.vodafone-ip.de. [109.91.203.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009757fsm14505428f8f.78.2025.06.02.03.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 03:29:31 -0700 (PDT)
From: Khalil <samanfatimarehman@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: samanfatimarehman@gmail.com
Subject: [PATCH 0/1] Corrected license paths
Date: Mon,  2 Jun 2025 12:29:16 +0200
Message-Id: <20250602102917.2424749-1-samanfatimarehman@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 10:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217712

From: Saman Fatima <samanfatimarehman@gmail.com>

*** BLURB HERE ***

Saman Fatima (1):
  Rectified license file paths for final images

 meta/classes-recipe/license_image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


