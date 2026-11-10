Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14313.1794290605237517527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 22:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=R6yu0sLi;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1236281a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 22:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794290604; x=1794895404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19cJOjN8+Ynl36/vFayjXRYLaFmGSP6YGWQ7qenWBWg=;
        b=R6yu0sLisC0VktkVq71YEFH1LbuPDYFAD+A4K+IH81UcgI3YmYQB8FuQsnmyglHOG+
         jeaF2mbeRo4JyTaKzQszqmSgcd+KMGUw7sBU1MYjQrOdFC2xyo87xVsgHkr3JnCE+EkQ
         wgIOXLTf+KcWx+DwseQKpl414LaqAolrcEUmzu7bYQZ3Zmg04nxy5Z/42yazzvmtnY4q
         7Jb3F4fbbCVd7G1v7KT95R9i3WzmHGRfLywKpLsLn33QwXZV3djQy/TebaTV5uOnORwC
         K2HQ3L32RHeLzAocf43kQaSTWEHSSN2/gREbk2HOP1GcAM4w/ADZzPImgcbVvO94g7sD
         lCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794290604; x=1794895404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=19cJOjN8+Ynl36/vFayjXRYLaFmGSP6YGWQ7qenWBWg=;
        b=y/zmaKu15GjhIhIIU/k1/RLtPYco3sXKXpvSy9VkSoIgB2BruZ/8r4GMRlxr9Zh/UX
         qdkOySbD1S+5yKuc7WbkbZyXnCBP+N48xTtRuoQy19gUowux0FvBQNvzFK9YzMo4ycB5
         AbE7yZjqZJF0fxFy00qHm+O5l8CPVrkYrN/p0CKyhDDnksSvaS5QqDJtxVzpgHCCiyHm
         XJ9/HmudTbYfXFcvaXSqOlZrO7PVb0zCCKfl4ahIqYYQZV/CgB5h5i28ChYgeD2Dgf5k
         gTEBxWkfdviiEGCJj4Ih8yQn6Vf34Fzn5/U+DtalLSwh2ZbtdLgTPdSOurx0qWPxF3DY
         yzyw==
X-Gm-Message-State: APuU4Z+ZukznzqA0zI6HC8fPxesD5aZ/ZpuOw+Q351b1oy/VmiS9XkuH
	f1UdCXJ8vzmqHvLMLpPYJd4yOCeIvJ8q9z7kHwCtgOaAJdALTN0ovgwQ
X-Gm-Gg: AYBFou23UD+mH94YgfLxmu+zMT+lEVh6MGVsObHkhv//Ne4ikof/FYrAQijpLlkKcDx
	cKa2oOIBwcjeVSQLXgA3qE3CZkAvpWYIrxNajQAqo8ld7VMWLgaWWD0WpJp+IL3lY2G90QnQuZL
	Ksg5s0hc+QIoVVLnkspzVt2NbzfbUjzzZ3Uysblzb4o5bHBLCnFZEhcaU8yCuy7QXS0WY5TWzUj
	+LmK/jOpjfN9G36C3pCsEg7W9qn+8sTmNQ7pv6VQVVI3uTdTGActeF1Qdvn0wYVcPE899nsGulF
	jj4DO1olsz+09P18HIi74JTB9K4ytjcBCuKLc604pGzVuu8/CHDUq1QFBypJ3EQXGqzzH8zegBS
	98WfRlYg3dn/dXQPEp7rAjZgXui1GgaQfYG45owWG1fOL7SPt4QxskBCkkn8RBnPmro1p+WU5z9
	8TNuy0wgROets5n86UNupFPvi85laMOnPGT4mgGDWfa5zBQNLvqiBT5k1OHafhVSZgk0avtpGaS
	KdTbxlNkONQjgo+p8a3M4sVB8vw71vcOQpSFtY5cY0N4cVlQAZ6JgDab308nMVWE4cGrF3XWr1I
	C97ev2wWjRgZ8YkLyBXK/WOe10EabGq8Twy4kwiyXbYaGwv8RkmPLXJqupCyNx+nXfpZthf/aYp
	P9Ny2KL3q
X-Received: by 2002:a17:90b:3b4c:b0:3ad:50a2:9abf with SMTP id 98e67ed59e1d1-3b166cfd3cemr2172971a91.38.1794290604400;
        Mon, 09 Nov 2026 22:03:24 -0800 (PST)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from localhost.localdomain ([108.180.159.198])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d5eb471sm408651a12.2.2026.11.09.22.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:03:24 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: Re: [OE-core][PATCH 6/7] stress-ng: upgrade 0.22.01 -> 0.22.02
Date: Tue, 10 Nov 2026 06:03:23 +0000
Message-ID: <20261110060323.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110035229.2940188-6-ankur.tyagi85@gmail.com>
References: <20261110035229.2940188-6-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 06:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249899
Content-Type: text/plain; charset="utf-8"

On Tue, 10 Nov 2026 at 16:52 +1300, Ankur Tyagi wrote:
> Changelog:
> https://github.com/ColinIanKing/stress-ng/releases/tag/V0.22.02
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>

Thanks for this.

Tested-by: Babanpreet Singh <bbnpreetsingh@gmail.com>

Baban
