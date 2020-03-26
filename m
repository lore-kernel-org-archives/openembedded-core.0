Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.2570.1585247442491544147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 11:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oiMi4S7r;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id k13so7897091qki.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 11:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lQOQRf7ymfjYfQVeL0v9BQSdlbQcS1EKv5GFYYkS8/k=;
        b=oiMi4S7r37Ah2Pi3kgXu128t8XS4Yk465Sid4rIKlvfu8B6Bp0rDBCPB1g9v/YuVHK
         U61m/OO7YEXXccbG/ZfGF4DFjD90nVxTWy64ke93FtxxXlh4CSQIkfaHNc9esDwic8kV
         dEEDVpO03cYcIsk7PFgF4Ky1TrSIKBcOPeoC9bsLSpDswlu0bG5D7NOuqAxwkSeOLJAL
         1r7DvVn/a7CfYbycuv1Py4QoTY05CUn724x/7FWONL1yuAfWwMfdRf5IPkpKrMbNhWn0
         Yl7IfwMbu0GKUu2jrXH2Fdxp+LqncmeD/gRQvHIEzGZlK/aAEp0zT418d25mvrXVEje9
         2cMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lQOQRf7ymfjYfQVeL0v9BQSdlbQcS1EKv5GFYYkS8/k=;
        b=FTmjp77zwefxI3OY7xt43im43xKogAXUevs74f0JFUIeIFPdOC4weSLDMuKUe6xRE5
         x0YGlJjB2YXbKevTKi/IjkzEj+U1tU7vipMBZIdl3iPppxD358OJj/z01mmGpMHRu0q8
         PLp680/0gSu1FT2iJi+ksH7Epf/lVCe/lgJOP4XYUx/KArLaobnv+XD3aCfLm7DOSmPZ
         /O/QmNiOG+guFk9sn0y6bSxulK1NWw4OE788rMkEzBP6HWlMdlOFGx8TGf9lq3pK3nh1
         Sogj3pPy8akFg2UeVCDt2x8E7bIb44WVY9Eiqs6apCWuYmJiOIbM8eJbMFEMqAKwRHQN
         bmkQ==
X-Gm-Message-State: ANhLgQ2WCIpOv/wNcsGtYfVPbFTTDexvFAj4ClwLfIT9dOP4r6/lyGgG
	/EdBTCvdZBUCzGDGMRC37AgnMTiyR0hTq3xAtWHVV6Md
X-Google-Smtp-Source: ADFU+vvD/PisQ7cNMm5vFc6BlhYg8FQ4MO8s709IoQtMfmcyBxf3SQJmofzHFeN8Cbk3g4jFr0JEMoElJbvsNIiAVdY=
X-Received: by 2002:a37:bec5:: with SMTP id o188mr9695496qkf.165.1585247441413;
 Thu, 26 Mar 2020 11:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200326062919.1929050-1-raj.khem@gmail.com> <20200326130754.GA17705@localhost>
 <CAMKF1sptRDswkw=GAsE-S0o-s1WHMFVdh1zO-oXuaSOhzsF5JA@mail.gmail.com>
In-Reply-To: <CAMKF1sptRDswkw=GAsE-S0o-s1WHMFVdh1zO-oXuaSOhzsF5JA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 26 Mar 2020 11:30:14 -0700
Message-ID: <CAMKF1spivW-WEtRJdBrbg5bvPHb7YBbcriJSdmHgWtCpsawauQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Backport patch to fix ifuncs on risc-v and gcc10 builds
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 10:09 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Mar 26, 2020 at 6:07 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > >...
> > > + configure    | 2 +-
> > > + configure.ac | 2 +-
> > >...
> >
> > This shouldn't patch both.
> >
>
> why ?
>

Yes, there were few more, so I have rather sent a new patch on top

> > cu
> > Adrian
