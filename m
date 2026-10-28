Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.222.1793227708907009851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 15:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zaabnmJp;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1224385f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793227707; x=1793832507; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WrYyGYF33HnL60y4U4YbtLQz1pBssPRE5E1p6D9gV+8=;
        b=zaabnmJpNvzUsraMkNxWMick2utBfWmeyyuuqt4pwokspqhaKkY6fvEieVGtKizTSv
         RR3v377//LhTVebv7Y72b6Dl+OSdKrZWlxIt1wsfMGKKbg/vWnZlgaZ+LzXo257A0xzo
         x/EOgGa/wZmcUm5B7AC7H+OF4wIXceyl8STH3aJ+yKhm8A/8ssJeR9qGtEsBANVd8xjW
         G4iLsoJBgMCWvxAFWgve/xhTbLzI/wasGWG/acIU0W0Ma8QJk2mbMcgz4YtAqW3tfnXU
         vBnpiv1aSoofgnvvPeq2GbDFMZyg3oxBe9KeCgioIPXHGMcTovjz6BPt7GIYXGHFreEj
         vdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793227707; x=1793832507;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrYyGYF33HnL60y4U4YbtLQz1pBssPRE5E1p6D9gV+8=;
        b=Itbm7fgDMUwnOOqsw0+hJkemr7DLpi5L8/zvgl4piwvFClsHszh6CorFGeu82rw/+N
         gzW0KTMmNn7qvYULCY4RcLt0t6u5dAvb83o21fjcagttePkCrrseKIO2Xnskbk+zcw6d
         YY95L8XddqyKpsfz4P+IBTpX+DLdCvL3zueLxbj8LHPyIFqvmAA/tBAeI3tt8Reki4vL
         U6zBPDBEkWTXlG47IXTHo1T+o4tl7yuEBHhmzaiu0pJfWksw3+qqAEXC0rEKGbnoRuU4
         r+BE/gDAM7DnRYMbRhKtS0moSvHsJgQwiZ5b2Oxz2Coy+sFuyFVjoo1XsWrG1pW9NvD4
         7gUw==
X-Forwarded-Encrypted: i=1; AKwUvBygkTVx8iYBcUw0P8ZKsIGTZIRKxXFJWZZSOhZKfZ64MYCizxQuAoFeatrMj04mIKHZiI0THZSi0lJ9QkyydyYvjQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYIqugoTlG2rDSJGIk5atciPhlWdfSfQ3uX20y3jS1vzzJAfN98w
	cq0j1zhlxjmw2exsUSuukALV5uxhZYoipWalwJ4esklRUzWpmwOfQuRd
X-Gm-Gg: AYBFou3lvnElav4S+kAsTdwg0fE54RZ4npajSfAOHJ7qq7zzGEJR1Cb10Uk01t97OGB
	gPldWKVE9XnLL2a54nfOC4pw5yLvQPK0mUWWixarW7atbDDBq5NO++U5TLH5mgMghTf9KQYcfLS
	2OWYEyxqWXhzFQcPY9XZugL2CX/IOCrAhWXh0CcDUNtiYFQFWRtrYUqnT8pVW8zPQmFGo7pts7M
	du8faTTvwYPjhExPUbYcz3nDHvYWoxhFWMb5hyFd/+h4TxINmBwjRqsLWO1j8rkrS6oarEXJwcl
	G5Um/h8ryYcDr8POtn6bZAUVTDJ1PW5xCUBjwMwOlI9NlNap08KHlAHwnc5N66IZwjscDPDSfhp
	4nI1pNGoS9nhkNPCwst87p0rPc3G6UY1mUvjDQZzG6ntKg3WZY6L63cn+ZONJT+lXlaBYig/t4F
	pVLPr1IUxQ7UwochNENfUanWDxt8LkS5gqRfOD8zs0ujIBS31t5e7HC6zk1I/f+QH7uMBGP/HQI
	9n+l3RhrMMypykjXP/Ejmx7X/maMARvuQ52E37Qz69L0VrApHNy4HoBICiFcmp+fxF9rEB0BH3u
	6Z08Z/LNo6TFhHM52zPsEjZzBP6S/pjb9u+iQ6x9x96Cqzw7dhDbCHdyVS7sa7d8Wiym5iwFYqU
	A5A==
X-Received: by 2002:a5d:5f41:0:b0:488:8232:d16e with SMTP id ffacd0b85a97d-48e5d564866mr10107516f8f.45.1793227707063;
        Wed, 28 Oct 2026 15:48:27 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3c32sm32036720f8f.47.2026.10.28.15.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:48:26 -0700 (PDT)
Message-ID: <58d445ba98e817ff6ac0066c52496ebfccefd257.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 04/20] devtool: ide-sdk: recommend Rust
 Analyzer for Cargo
From: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
To: enguerrand.de-ribaucourt@savoirfairelinux.com, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Wed, 28 Oct 2026 23:48:26 +0100
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-4-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
	 <20261026-devtool-ide-sdk-cargo-v1-4-d4504e124d07@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 22:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248847

It also recommends ms-vscode.cpptools. That is only justified by the
C++ IntelliSense patch (7/20). For a pure-Rust crate, cpptools isn't
needed (see my reply to 7/20). Maybe it should be removed at least for
now.
