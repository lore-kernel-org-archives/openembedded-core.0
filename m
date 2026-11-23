Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57343.1795450901536643820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 08:21:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xJ29qerc;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9496400270fso331189885a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 08:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795450900; x=1796055700; darn=lists.openembedded.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EgdcxwrlBuvWEOxib77CTqJ/QW+9fTnkwRdAGPIdjCo=;
        b=xJ29qerc7dICl1Jkiujr4kt/T0aPV7QNdU8m0HDWynMN9JIWb17LI29Ub2YHYhj/6s
         10wVV0n5bTtAHWWnPhxtPS6VJH419SfsavA8X2f0IlF5qATMguyum8M+/9thuBqrM99C
         6EFWugfdeWm7Hcq3eWyV+w192bRbrsaETUHLDIQZkb6mbnbMwCJyN2T1uZijeDkAJhWF
         XzJsYuJqO6E+RDTgMwFBFZZuMTTdtyDd0bvNrmL83mw18AdxOy/Qpd50Y1r5R7AG+YxX
         frnJKJI3WmaV7gOQ0mPFOuPFb3iygHCuxJN+tC/EvOFFkXwNHE4oSlrPL3HgEO1EodpX
         9TmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450900; x=1796055700;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgdcxwrlBuvWEOxib77CTqJ/QW+9fTnkwRdAGPIdjCo=;
        b=hRBrKU+pboRtcCH5zg3esKBezxRYJxF7AJWjWfC+prje5qJG91qFrotnQx0AOUjBkP
         LEThYVOV1oiYlMzAWDmGpg7RhFWIHFf7XJUozQ071z1nFwll+y7eavsP+Pew7jNw3yKc
         NnU4UpTLm45V45r3YRr07GprX7Ct5vPgW6SBQENsI9lJbE9J2HPtLxRYXhxBSRZWcf0H
         K2KjzBNmpkVWj4eSWr02MYbrX3jQGC2KdO2ZS7dhQ+yr4CQp4oPryIc30zBtB2lOfdrJ
         KzIVtaSGGzLdj6dvqpnqER0gJz/qak14dfnv5TUPh+TYhxDK77Ww3H4F9KxBmRQdskg+
         /pAA==
X-Gm-Message-State: APuU4Z+vj3JbwfJ+JsK6ojczxWEec09Vw2LYrSROhI95Bvn+OwbtX1E/
	AtTnmadC7CqK9PiR7XVJudsU0hnuhwb2K2dsrho49e1o1vy2lRuXPmiE
X-Gm-Gg: AZFdTZcd8Qe0yv6paQS6OxwXrEDHw4JjqSzhcMATZUSqOOgVzD0QJI2TjEUpkscIs2/
	7jz69fZU6JovTUTLffW68fhhJSFhvF4CwNDevtkgBfF3qXobR4xDJyVd/YrMaDQjifzALYPw85Q
	/SEGu88n2L79ajnqV2CfYaPfNMZCZ5Ux3sDWWkRIo80/qHCn36a9stOcrgSGDwtR3kYvxUQAroI
	C4pJl83NYLFQsausPqE51NWK8boOydonn+N2I0XuhSb5VQGl0L2B1v833zGBtgd0qDCGhXZru5k
	RzzHjFCWeOOyqdyklu+ry3WT1uNruVO7GELcb/0cWPcDV6qSat6/Akdl5W2OaLpXPBlcYK/xkQD
	FZGK1dQfUAdg7t+5NhdoRoS1JJss7nE7jIZ+7HgNH8hJzW1ASQ27rlizM4UIYzsjyMDXQJKhiRH
	C+DUUKt605HbnQoc/Dppwi0f73qOAZAIXLAT1TmLBEdKMbLCAXbKfjZ7lucjxy0HO9UYlc9SoHy
	OJUrQxm53RdHRuW5BMHJ0vWzVexqe0C+/fa09IX/yIOcNHage25tr1+W4Vx3Ep7HxjrNaMEWgj4
	/OJY/yqCTENBAonbhdCM/qOw7u5xchZurgw1p1tPLY8cRwToB1sCQ39pkmirlQDtqEzrqUGLvcC
	C5z4Fe2R4qrcGzcBzlAy+u1MEVzT9yK2z3seQrczYg6z+gbqVmg==
X-Received: by 2002:a05:620a:2690:b0:949:5e8a:313a with SMTP id af79cd13be357-949ba9b3966mr1914318885a.13.1795450900194;
        Mon, 23 Nov 2026 08:21:40 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-34-35.cpe.net.cable.rogers.com. [174.112.34.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0315f4sm831826285a.3.2026.11.23.08.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:21:39 -0800 (PST)
Message-ID: <6b046813.f3e70d7f.2d799.38cb@mx.google.com>
Date: Mon, 23 Nov 2026 08:21:39 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] kernel-yocto.bbclass: capture stderr from
 subprocess.check_output()
In-Reply-To: <20261113125300.1188997-1-mikko.rapeli@linaro.org>
References: <20261113125300.1188997-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 16:21:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250924

On Fri, Nov 13, 2026 at 7:53 AM Mikko Rapeli via openembedded-core
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
>
> Hard to debug failures without stderr in output.

I went and looked at what the tools actually send to stderr, to see
how much this would help.

Not a lot, as it turns out .. symbol_why.py and scc report their
errors on stdout (with a non-zero exit), which the existing exception
handling already prints. kgit --meta always exits 0, so that new
try/except won't ever trigger. Where this does help is a python
traceback out of symbol_why.py (Kconfig parse errors, etc), and
previously that was only in the task log, so it is still an
improvement (which is what bit Mikko).

One minor thing: with stderr=subprocess.PIPE, anything written to
stderr on a successful run is now captured and dropped, where before
it ended up in the task log. Nothing important goes there today, so
I'm not worried about it, but if you do a v3 for any other reason,
it might be worth logging it on success.

To be clear, I'm actually working on modernizing symbol_why (I wrote a
lot of that code fairly early in my python hacking career). So there's
an opportunity to make it throw exceptions, fix exit codes and better
separate stderr/sdout.

As a first step I'll look at having the tools send their errors to
stderr, so this gets more useful over time.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Bruce
