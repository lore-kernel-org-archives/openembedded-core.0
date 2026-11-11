Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7865.1794398329196493790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 03:58:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=g4a4d0VC;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4922523d1afso1851982f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 03:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398327; x=1795003127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NC8gcCH4tYv9mrm4qZiYwlg0BDE83Bo8qgWlDSNkkSQ=;
        b=g4a4d0VC6gtuf1wsar6FUATM4A6VZZei1nsC/raZovyvxzXOw8nW8M1kuQ1OAK+GeT
         KwHaDWPGI6n93s5GjjHz6Ia9n9vcZs3eIzZgNCgFjWU/U97wszB5b/Whbd62eMtjcYcG
         wzUPYVUD+VyMRhrGFlTpOgZvL8wLX6GXeYfWSxa2bg4lN6Rs47VaUG5KZnkXDuB4QfFn
         KeR1OxBMo6CgIanbDj36WrYajrAw+w0P7S+pRU5IOTbdUjQQHqwCeorMJeMySXHdgpN0
         IpmHSruKJa51tqzKV9WIcjw8tFTXgQwhsATgFtA0OTsJko9RjMG6Sif88sOBbEctT/LA
         ZHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398327; x=1795003127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NC8gcCH4tYv9mrm4qZiYwlg0BDE83Bo8qgWlDSNkkSQ=;
        b=w8dBJ/+qzsm1wDaVI/OKuW5gbstlSuxtdTqr2BtC5kyEOLyrjTzHYnWYZN8p26iFJM
         eZPazdWEi0FIy6WFUBy7K3cq6E5SPEXJU8mVL2NM28JMs1P+xRnsQDi8tCpC6ftyhm1u
         Dty7q893oxySi9pe7RrJ5kPqEp3WAmobMvWPt11wNBt7CLVC51I4ICBGb2vPZNoQ4kfD
         HBHYkDbONxW4CG8b6XWoaRl2Go/iI2k3z7vcriTwN1M6yNVft1BlJJhJYWJvBhlst67t
         0B0XqBuV6JRxctLvu3G0rENw9OhDspjb++lPQ5+GPy+eB8LrybVl5h/9wtlFD8p/rC45
         81Nw==
X-Forwarded-Encrypted: i=1; AL+hErEpg5trJOSCaIzW3dGO4ow5yhaAXKcu2B0+wOiuimwCCvxDiLRHTTOz9SzpWaevYmO5lE294QoC4jBPOnPvOY/P2Q==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8XfRaZT34XU/1UwUTYZI4WKuFWaYhGAeRZSw3vEOy3OhDefRUy
	GXfG3dMCI7WuYWBUcmuuds5TBDVvqkPtYA3GkA4x0TcP8JbtiMN08X+2
X-Gm-Gg: AYBFou2savZoZb7oKSiQ815Ee+dW5ijpm06m+MvxP2UOnw4CC1uIwPOVFp3YvZHLcuk
	DeP8oXN99kXP4OJl/RZNsZxX/OtcueR61jKcU+UP0nI5Ab9PES+NKQ2IR8w+DRzd66mo1AK7Ba2
	igGFKcYGBap31Z3vWrYinj8i05jUq2eq9PIOMm9+CuVEIchn9w0gDi8p4oHUfpuBkz6X9P7vZIQ
	6KVxGwnJs1NiW8rJHpJ72UFErjMQQfDmWAwn/gP85KoTdLDmsyvcK6Jrx4xrlOVcRjpUOKf0wtW
	sjfa+fij5BRXFKE/qrpQ7Ij3RSCuEXGIXFUu6u/e07it2a8uKaCLx4Yv88vnwAmgqXCarzF23Ft
	7pxOAgyyNtDDyRDZPEofwikPGaR7qVkKwzQDX6iCPK+VgQUu13ZH5Wx8VUUWGPeTSUgeDWHAk23
	phHRghDNzuFIr2IZ+4SfpIpg+BRZ1iaD6a3ECkLHCTSaxMn440V+XyvkdjRJxTsn83n7Z1fMAY5
	7E2lcxBpAwPOrxkmjJUf1Lvl9N6OIrM83n1p+cJw6SB1I6Ut/4mGuFNkPl4cXhC3DuKtStkWK4w
	FGIzVgQ0y3haMy3v3S1vnH5GMyaHflAtnSrG5KYjKeuB4A==
X-Received: by 2002:a05:6000:250b:b0:486:f907:ebec with SMTP id ffacd0b85a97d-499c7ef33famr3553679f8f.31.1794398326995;
        Wed, 11 Nov 2026 03:58:46 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836a9951csm10655967f8f.56.2026.11.11.03.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:58:46 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: stefano.tondo.ext@siemens.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org,
	bitbake-devel@lists.openembedded.org,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Peter Marko <peter.marko@siemens.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Patrick Wicki <patrick.wicki@siemens.com>
Subject: Re: [RFC] spdx30: name, version and purl for dependency downloads
Date: Wed, 11 Nov 2026 12:58:45 +0100
Message-ID: <20261111115845.1940227-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAJdd5GZTCwr9VE8OmOw7RAki+Xu+kokCgtOHG+9ghE3frWPbqg@mail.gmail.com>
References: <CAJdd5GZTCwr9VE8OmOw7RAki+Xu+kokCgtOHG+9ghE3frWPbqg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 11:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250023
Content-Type: text/plain; charset="utf-8"

On Tue, 10 Nov 2026 at 23:53, Joshua Watt <JPEWhacker@gmail.com> wrote:
> Perhaps, the better option would be to propagate the SRC_URI purls to
> the output packages, but apply some sort of (optional) filter that can
> remove a SRC_URI if it is not actually present in the output. That way,
> if we have positive confirmation that some input is not present in the
> output, we can remove its PURL from the output package (but, barring
> that, we include it).

Hi Joshua,

Thanks, that model makes sense to me. A purl stays unless there is
proof that the dependency is not in the output. For vulnerability
checks, that is the safer side.

The cargo prototype already works as that kind of filter.
cargo metadata --filter-platform resolves the dependencies for the
target. For python3-bcrypt, it gives the proof for 17 of the 42
crates: 5 are not used on the target, and 12 only run at build time
(build scripts and proc-macros). None of them end up in the binary,
so they lose their purl, and the 25 runtime crates keep it. For Go,
go version -m on each binary lists the modules compiled into it, so
it can give the same proof.

One question about the output side: how do you want the purls on the
output package? I see two options:

1. Add them to the externalIdentifier list of the output package, the
   way set_purls() handles SPDX_PACKAGE_URLS today.
2. Link the output package to the source download elements, which
   carry the purls, with a relationship such as contains.

Option 1 is simpler. But an external identifier says what the package
itself is, so a scanner can take python3-bcrypt for one of its crates.
Option 2 keeps each dependency as its own element. I prefer option 2,
unless you see a reason against it.

Thanks,
Stefano
