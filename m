Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.12485.1591273111221640470
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 05:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EJHkZOdV;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id t8so5810169ilm.7
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 05:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qBXGHAS6m8ZXt/40Jy8bc/N+QSCBD6ZTujiUY7azmMI=;
        b=EJHkZOdVpC00p/AkF2Q6nI6YSMT9oxv89DkXG2SBDyjSCLfMIafWk2zYBZNTto4vZF
         tAFTeOZSJgO8vxmKSPjS8JVz8WM6ETA81ABKJ/dMzaCsDThvyUcF7a4A/jqKS/qIyqzM
         TlPZBykUBjLsaspv6ivUSPqE0szYWe1ooylJ2yIOdHRhGxzH5DqkG6a64J9IT5kXzuzT
         yVF/QEyjRDz4gBWF7vRVO8+7tZSHe3d1e6/CuXFNlASe8xwXGn+WOqayycg7AxMtJyCR
         teSxtTrbGIQ+vFx+jIKSu9WZ35mPUB1Ubka7U373p17gWb/A5kxaZVnOWTGbwPqglm+P
         dHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qBXGHAS6m8ZXt/40Jy8bc/N+QSCBD6ZTujiUY7azmMI=;
        b=EXfZRpUY6HR2nw4Z7gopqab4dRMPtkrxhsjsp5JOHJK1KmhpoDQpb7EeV/samRUjik
         BRbNsYI8cZxz13SBLTwOpURrGCToG+kv4/nFZHXtpG+ej4qOVrkUSBDR2BUx6YE6wwC1
         66f5KMDPQ3iiaP2oLqHVahGQ1T2E/yXjNPXYo7XFKd4sezIqmGiVSx8LMT8KnYxTLmcm
         aKbKiT2p/oxWd63QLxaVxBoBW+I7s0MELSfW8dzIqEfqbYckU1WIr9PYP8WZgb9QK+Ml
         hXc+QXdaFUA0Y3y8mTjJNGDjNgpIOdIwePZIz/jYRbKwV/b1G1m3EscKZXxj28NQdJRl
         UB9w==
X-Gm-Message-State: AOAM5315DfnuakCI41SbUQi4x00k4pW34YnO+lCnTJa53MKF6Anelprw
	dEgRXTHlaB9mtDDvvPCPEOm4ki4G2/V6n/TAVGA=
X-Google-Smtp-Source: ABdhPJyw7uMpreBWzHVechUxzQye+JmPBYDId8OuPR8mqUTMqOYIO6a8tJmZLr1qJ1527bvFZi4qFi2epa1cXgtoH6Q=
X-Received: by 2002:a05:6e02:11a5:: with SMTP id 5mr3835107ilj.108.1591273110748;
 Thu, 04 Jun 2020 05:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200604120349.17455-1-schnitzeltony@gmail.com> <faaa5a2d120eacab6825cf079e92aa220dd7b151.camel@linuxfoundation.org>
In-Reply-To: <faaa5a2d120eacab6825cf079e92aa220dd7b151.camel@linuxfoundation.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 4 Jun 2020 14:18:19 +0200
Message-ID: <CALbNGRQDVCm4zDJ6NPw=+-mQ8xibCDh+pqjToPcrnXRvJcYOkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][warrior] pseudo: Fix enum typedef
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2020 at 2:11 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-06-04 at 14:03 +0200, Andreas M=C3=BCller wrote:
> > From: Jacob Kroon <jacob.kroon@gmail.com>
> >
> > 'pseudo_access_t' is a type, so use typedef.
> >
> > Fixes building pseudo with gcc 10 where -fno-common is the default.
> >
> > (Backport of OE-Core rev: a7d519f742aadc9110c2401f359254210a784f6b)
> >
> > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>
> Does warrior otherwise work on gcc10 hosts?
Not yet but I am working on it.

Andreas
>
> Cheers,
>
> Richard
>
