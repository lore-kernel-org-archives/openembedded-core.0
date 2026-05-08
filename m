Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDBECD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 19:19:08 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2249.1778267941051783590
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 12:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kruq7Nlv;
 spf=pass (domain: konsulko.com, ip: 209.85.167.196, mailfrom: trini@konsulko.com)
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-4645dde00a7so2923172b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 12:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1778267940; x=1778872740; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9kOxDZ8D1BlaNyCz2XeU5x8by6oJ7jdUTli6BkMc+T0=;
        b=kruq7NlvmthJWJmtyK5mwSnCzjzliL6Xf+39NVGxZlBXB0khNnC0GNxzzZEkiJy1eo
         ZcDWAbxcSYeuBM+m5bKMHHJ8QoIWjCXUboVC1YSnaC/Hc2mKJsie/632AEG9ByJGS7S6
         Y9/qt4gld8xfHZ+KrjOzmXIhcPvKLAbODyy4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778267940; x=1778872740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kOxDZ8D1BlaNyCz2XeU5x8by6oJ7jdUTli6BkMc+T0=;
        b=rJ9Sa2euhGJqbU+UviiJ7PWRS4o8Nh4ZS2uUxQAKW5yo1GkqaJdqCxSgGad1WPU5VU
         IPD81XoRyWbFh5NOs5GlMT+1D2A/TAryjQsQVIAj2MdxY1YBWRd8g4hlT2WCJPMu+eL6
         kknACE5CUCsoPVAIN43YGak95vXrtWzhNbCdP+RMWKF0RQ8mlcRdCfz3nSVxQYjQ2nKu
         6YjK6uDKaOVZnCQuA14P1nyvcsOoK4ZAzCAzyVu+ec3OHS4oORTJo7suZl/rfMrhxZV0
         1eVZTo99YIxzKly86+XVhenrdU99EBO/BALHW6i30baeiDGqb3MJHrJK4bEOSY/hLUc+
         Sf5w==
X-Gm-Message-State: AOJu0YwwodNmGl29UMIaMqtnRFiZpkKd4pJfEmjG4uMZ5utgtpBidrkT
	vQ5ubu0Yl/4QOppLLb+MJtWalq9nW7YmZ3rFM4qcUzWzZ6yH752eJZS/6G01PMjfF9c=
X-Gm-Gg: AeBDiet+2oNsqptrZN+QMech2rkcZZfw/TAlHpHvWYJTsZci21MwNkZOUJGXN5r3YBS
	HQtdrDEmgDZhCCxGhVVEN900E/1PPRVDHs0a6278MOsoBozAQ8AMWJVJQADPbB3DUp0LAIbmySK
	UAruBvOserW1GLrEAP8WjU+M0vIzivH8vx9+5UYTw/pifuUXz/SAcd9nFDwC6JekpfwjyE+qUrd
	yKE5UfO8d+GiYfjQ/SqQxySPpH6JpZvfdeoWyo3fZYZItBeFzhAgNj9DQ9AX1CAiPRXtY4xvJT/
	OU/F4o6VtTxy1K1vpbOdod9AZ2+N3/OxAEne0QS+LpBVxYSeWKlmr7/yAv54HtN1Oyy2MgJMp7b
	b6pcNlDfQqYYFXMBmM7tBOazxcRoe95LH29k1dgSSu8+ydEm8WNlge0OOuj7+Ase5A+U3od9t3D
	goyG3rMLGUvrJdRi/8cuYlEdVvfx1TxGrwH6fqy3+CRRPItif9xICPnGhXzN9Z4UV35MwxxlTUK
	C9DKCpoI8v95V0rLyIhKtnQMQR6Kq/5e1veOQCa8PtmcAUmeNk=
X-Received: by 2002:a05:6808:1909:b0:479:fca7:465d with SMTP id 5614622812f47-48061cebfa1mr4754538b6e.30.1778267940237;
        Fri, 08 May 2026 12:19:00 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-106-235.totalplay.net. [189.203.106.235])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c76935904sm15000304b6e.11.2026.05.08.12.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:18:59 -0700 (PDT)
Date: Fri, 8 May 2026 13:18:57 -0600
From: Tom Rini <trini@konsulko.com>
To: Paul Barker <paul@pbarker.dev>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"openembedded-architecture@lists.openembedded.org" <openembedded-architecture@lists.openembedded.org>
Subject: Re: What to do with vim in openembedded-core?
Message-ID: <20260508191857.GE1858239@bill-the-cat>
References: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 19:19:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236734

On Fri, May 08, 2026 at 02:29:43PM +0100, Paul Barker wrote:

> Hi all,
> 
> We have a vim recipe in openembedded-core to provide:
> - An editor without the limitations of busybox vi.
> - The `xxd` command, used as a runtime dependency of dosfstools-ptest.
> 
> However, vim is difficult to maintain in our stable releases. There is a
> regular stream of CVEs that need fixing due to the large UI and input
> surface of vim, and backporting fixes has proven difficult. This isn't
> just a Yocto Project issue, the Debian tracker [1] currently shows 14
> unresolved CVEs in Trixie and 15 unresolved CVEs in Bookworm. And, it's
> very difficult to share work between distros, as vim tags every commit
> as a new release, every distro ends up on a different release and needs
> to re-validate any backported patches.
> 
> So, I propose we drop vim from openembedded-core on the master branch,
> post-wrynose.
> 
> We can use tinyxxd [2] to provide xxd, this is based on the vim codebase
> and frequently merges changes from upstream.
> 
> We can use GNU Nano as our default editor where something more capable
> than busybox vi is needed, this has a sensible release model. The much
> simpler input model and lack of scripting facility means that CVEs in
> nano are much fewer and further between.
> 
> If we do this, what should we do with vim? We could move it back to
> meta-oe, but that would simply be moving the maintenance burden. We
> could stop backporting CVE fixes to vim and recommend that an LTS mixin
> layer is used to provide newer versions of vim for stable branches. I'm
> open to ideas.
> 
> [1]: https://tracker.debian.org/pkg/vim
> [2]: https://github.com/xyproto/tinyxxd

Not an objection, but a note. The motivation behind bringing vim in was
for "exclude busybox, have identical functionality". Changing that to
"almost identical functionality" and pulling in nano is probably fine.
Probably just means adding another virtual which busybox provides with
"vi" and nano can also provide.

-- 
Tom

