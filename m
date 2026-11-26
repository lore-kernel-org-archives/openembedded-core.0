Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7278.1795734435977831720
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 15:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JC6C7viz;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so61623245e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 15:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795734434; x=1796339234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KS/Axf+UgcBgQkrfJ42iW+e9uHdoU5uKTTqC6toSwg=;
        b=JC6C7viz/UMRqG1mBuxMxB4CyuwD8egaGSvAZRMsB6dtB1tjmILDoLCZjosahYCxui
         DEeVUP66S+NTPUbft+sOxt0Jbw8hjVTV6dgT2FzPs97c0CsUYjH0oA6/y1R7dO4oQaA7
         a6L6G/uc/aWKUAH/dIE5xAfojZGq7hCe8z7nZJA7USbeup7QIVFPrSd1YXWuu8FbEuS6
         NgBW22Z2cgEVML9hYhAOzE32bGNUzLshrsnXXbZSHL9dum4b7J3ySmy4KAY0v9/UDTaG
         fxFamrtO4v0W+yOxco7cq1QE2n5IPMG9+KyJhY4Jhgf8P8eMtwDPYd6zEHxbZFMjMDua
         EYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795734434; x=1796339234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4KS/Axf+UgcBgQkrfJ42iW+e9uHdoU5uKTTqC6toSwg=;
        b=GFAYUfKTQz1BzgmLODaez4DlyNNEuZYHEY97RqwDfffJ/CEbezI4GnT8P0Hym4kY08
         VfSTVgFHylDVf6Gs2qE99+l+jWX0GMYkQ/L1c62SNukwjgb3LRYL4Fv+csUBrQXYG8A4
         ADXT0tDQ8ruUvW2ZclsdqHKF/ahI5BR/qg5f0vyG3MT23M2/fVJA8bsdmV1kzGj9tudQ
         oNFwuwbnaiyfw2yLj5+g6cin9KEpEMpTGhjorpW6NuuolbyPvR9LZF5TUpTKB0U04Xo0
         b5nAf0r58yiZoJsk8dlTsRM256tGmu88T6Xoo3tm4NjaZ1SlTMWE2v6DqBmr6Wjj2SvK
         pkRQ==
X-Forwarded-Encrypted: i=1; AL+hErGPsdlfup4EE+FGGQ9F290H+PEZn6LjEuu01vwNA8PThmUH4n0xqr19yEjZrFiwUKKrCjKPZoRjCDBlpbMpWUg+0w==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+JW6zjlkoQH7c1l3/BM997IzGD+v8vjYHWNPslWgf5C/i1yH9i
	baogVBzgrGMOi/fqt7E2zkiiu2OctWSKJp9ooruIqU0eSyMi0qhLvFxS
X-Gm-Gg: AZFdTZcIbgnE8ch3b67yNNc3CSneHaqa0RvSYJxJUK+g05GQ94OPskqA1D725CQvVIZ
	ePz0OeapEEf4D2mcOM7awh9tQy4U532v6syVCAQtTRZvSbwoB6BDjSdamzOV2cAE6nHT4OjHCD7
	vYY/luIVF8hYbmQuKGXkpjHWJN6PaXV5lIvXh8BPeej4Qu47cFAQnpaQVQF4QllJX6wH9XDUNuC
	zRTj2TUj8QZ3M2eG8k91zcSXtQx6eyDaducnVvf7uhbBBrkT1jRfZvnvU3ngd13SnuKy1laDh4Z
	HUEf9SSlI81GcgsPWPV+VxSsyAV9G11sek6BKeik4hJPVrPRiJ/m8YYnkF39RDD+VpeO5Dpwmt+
	GUytiGVoBJGBg4EJB8dQNBfjyU/TzZJlvNjdbS4OvPXC6VTTyLmLW7yZ4MmgdyZOAFmz4blO/NN
	aPOzBDS2qDICqtLbNRqnTYkaoA5wpJ4NA5MTqHHx3RqxIcUgI9kq1U4MJ1/4VO2FkIeLd6KlR5Z
	whJX0Gwzm/kXfbCJC/twhLM1cYLQYhfk+l5ILS4t8XeHQv85Y/cH8RhcwyFIEnrmK4ESqPHeEA5
	LHbIxLeXf4Y=
X-Received: by 2002:a05:600c:4585:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb8881b8e4mr463974465e9.17.1795734433963;
        Thu, 26 Nov 2026 15:07:13 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm626525055e9.15.2026.11.26.15.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:07:12 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: Paul Barker <paul@pbarker.dev>
Cc: stefano.tondo.ext@siemens.com,
	openembedded-core@lists.openembedded.org,
	Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: Re: [PATCH v4 2/4] spdx30: Record the lifecycle scope of dependencies
Date: Fri, 27 Nov 2026 00:07:11 +0100
Message-ID: <20261126230711.2707108-1-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <DN56BR66WII7.34FC67CIINIBB@pbarker.dev>
References: <20261125183613.1335718-1-stondo@gmail.com> <20261125183613.1335718-3-stondo@gmail.com> <DN56BR66WII7.34FC67CIINIBB@pbarker.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 23:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251332
Content-Type: text/plain; charset="utf-8"

On Thu Nov 26, 2026 at 1:24 PM GMT, Paul Barker wrote:
> This is an interesting patch, and I can see the value in tracking the
> "lifecycle scope" for each dependency. That is a whole new concept to
> add to recipes though.
>
> I think this needs a proposal on the openembedded-architecture mailing
> list [1], so that the design can be discussed.
>
> [1]: https://lists.openembedded.org/g/openembedded-architecture

Hi Paul,

Thanks for the review. I agree that the scope is a new concept, and
that its design needs a discussion first. I will send a proposal to
the openembedded-architecture list.

I will send a v5 without this patch. Then the next patch (3/4 in v4)
adds the purls of all source downloads to the output packages, with
no filter. In the
RFC thread, Joshua called the filter optional [2]. Without it, a
package can list a crate that only runs at build time. But each
crate download that is built into the binary is in the list.

Mathieu, please drop v4 from master-next. v5 replaces it.

Best regards,
Stefano

[2] https://lore.kernel.org/openembedded-core/CAJdd5GZTCwr9VE8OmOw7RAki+Xu+kokCgtOHG+9ghE3frWPbqg@mail.gmail.com/
