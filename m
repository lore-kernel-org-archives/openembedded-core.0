Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F26C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 10:42:05 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.13803.1702377720074491136
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 02:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YFWvPPsI;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c9f4bb2e5eso76030031fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 02:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702377718; x=1702982518; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9f79EOcqvICZYJDN9c+sMN4OVfI/e99MYn8r7WPDq0=;
        b=YFWvPPsIzX6NN5PxCn9iBu+8L9YhDhNtNNtie9jLg6vXHmYkJgiCFGc4BPVVdCrVxr
         OqWIZJn3Nep6IWX8wqVNqaSJqH7kIiDK2eFCBxjzLfQlNB/A+YYcLOKj0jxgDxVVDGQF
         wsPi4hguhgvB3Rfxy93ElpAAV4p6Xo7IkPAQO4NduklA73dwQrDzS5V4CF4bevOA3evP
         izaWzSs9VdE4XpcUYDx1WiLs3JsZhWu01cGCRa+nKn7hC3Y7nzOm3Lw0upv83kmzBSnL
         2os2nWZifF489Wl7JM8CBLgtmTn2hr+D3+TuFdZF+1BZtOeZiSYJAWczP4rUQ4dlo9UX
         xgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702377718; x=1702982518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9f79EOcqvICZYJDN9c+sMN4OVfI/e99MYn8r7WPDq0=;
        b=ZN6uZ9otpQ0lvJLrz9dOyvBykjYxsJWsJfwN47vD2/+lkEO8V8HzeqXEWfNBMtgKap
         k9sNAXxlt5Z68H3VSRBuRwaQxcM9BOq3OTEJPHUNoUMPDNxg+E3+WhuaGgLBcs7n7hif
         R4/tXQOnn4TszYqXhCrxiUOnbWzl3qbkfa65jSjaCjli1YHNU6TXEMqHXE28ChCMgEPv
         Q2+iCu+OviUYXb2DqEBluCu+sBpvZcU9jFtOSrGaOQTCYdZOIeTuK3/pun/90NezzQlR
         SGHNJSXsuC7op7/OqvKjZK0OMtOSZ2S2GJtfaezldvQXoxcPzn2Suo1TyN0R9gKvlW9m
         0iHw==
X-Gm-Message-State: AOJu0YyNZLREtVwSjroXGUEdXjJRfbvpGI3nCb/gU+4UpGtQs7t8nBPC
	9yUHH1a60rNzbgddBvNxyRY6XvgGIF5pHtCrjHw=
X-Google-Smtp-Source: AGHT+IF3Bi7NjmZvh4JtrfyxhKZ6G+s6VQtpvB8dT0A7+HRlxikPLgSnqS8XAgBPKwahAfMZzrEeSaatGNYttAiBNOU=
X-Received: by 2002:a2e:a907:0:b0:2cc:2751:a6b7 with SMTP id
 j7-20020a2ea907000000b002cc2751a6b7mr1705094ljq.21.1702377717983; Tue, 12 Dec
 2023 02:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20231208140349.3576-1-alex.kiernan@gmail.com> <20231208140349.3576-7-alex.kiernan@gmail.com>
 <20231209121845ed0bfb0d@mail.local> <179F2EEFE21E3032.26830@lists.openembedded.org>
In-Reply-To: <179F2EEFE21E3032.26830@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 12 Dec 2023 10:41:45 +0000
Message-ID: <CAO5Uq5QA+YaNQtOgtzjNRNLc4_YBG9CxNhopgvqie6OBAo-HOQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 7/7] rust: Upgrade 1.73.0 -> 1.74.0
To: alex.kiernan@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 10:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192191

On Sat, Dec 9, 2023 at 2:06=E2=80=AFPM Alex Kiernan via lists.openembedded.=
org
<alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Sat, Dec 9, 2023 at 12:18=E2=80=AFPM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello Alex,
> >
> > rust 1.74.0 is not reproducible:
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231208-rf=
bproj4/packages/diff-html/
> >
>
> Thanks, I think :)
>

One observation, which might be useful, these failures are all inside
the same module src/llvm-project/compiler-rt/lib/builtins which are
just a bunch of intrinsics. And as far as I can see it looks like it's
just the object name mangling that's not reproducible.

--=20
Alex Kiernan

