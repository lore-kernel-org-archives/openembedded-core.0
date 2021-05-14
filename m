Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.11891.1621012828713463543
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 10:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=acU4ve5d;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.51, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f51.google.com with SMTP id d11so30692973wrw.8
        for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 10:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ekcsW9KMj8QhjHQnBHJNS+iV2lZBmYBuHu+1tQxAZHA=;
        b=acU4ve5dU0OuW8ctGiyY3WmHKt7NJzvGWV1+coh6+S5yUsFugc0b3Jg5TEHz1DzOC1
         WQY0mDEGKX7oNFqdMe58VDWNArxd6kaOylaZhZwfHATrd3MPErb4uo4tjQUAUVEw0xQN
         p9kNJarIESzHrYOjLcVEsz7Bey+c8qOWLqHlxz4IEaInh2+Q8U+BRzd2omLFTJDk/Z9s
         qZFfB5N9tnQ+Fgm+gir4vIK8lV5+jd3ZGTe6pP16EXnhSrNBNlf0VQIWI6tW4frJ6Md5
         WjXatbigETSWVVRm6nPtum+wvAsD/QpBEBRknqYIFZA7zxjPMIjKIzWdDq8sDXan+6+d
         OINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ekcsW9KMj8QhjHQnBHJNS+iV2lZBmYBuHu+1tQxAZHA=;
        b=OSK86KWwzxvBz4kSvCsbp2VGEvaXEVEbuv3mrWCnEEL6RHosmQRCYp2J6p7u+yt7jy
         L1wX7vB+4N+/72FWA0jUzbCRlMT9WJWN1eNgsv+oCaTNf6ZHGtce+tb4cXqSfPpu+9FH
         qmnnqqrDsssR2O0Npc8vpIUBk4McjguXDhBgwF7QWh2t4c2Zl/EDF5ZEGzHZWQ7g5WgZ
         kTUNZDPHJWpBjbxrp4SyBmFCuAkgXBSK6NLQnY/eUUee3zqr26/JaiHl/EHkDZ/WdDqL
         LJcAKVDwvw2OvjxRP//wtlnYfOOovQHv4bcYitJCRq1PQc+pgy72a1TowJIHFQKR/m07
         U0kg==
X-Gm-Message-State: AOAM530YhaCQCFy/My7b5Ii9ZTJCWnhwSlu75p/ubALkzUM/xv3dIn7u
	Jz9uTnKpKnbdF6BZ/4FYmP85swsWxqJqzCYltXP8gw==
X-Google-Smtp-Source: ABdhPJyElIzM9NCth4B2V01bDJTq+2U5OaAM0VJgLp9bFMIwt2JZ1ujVQIoEP+inaKJ+uzuscKiUWkXCEooepIWJJyA=
X-Received: by 2002:a5d:514b:: with SMTP id u11mr16449746wrt.350.1621012826849;
 Fri, 14 May 2021 10:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620830796.git.steve@sakoman.com> <9fd94de1240096c57c37ee3a02742167b1319ecc.camel@linuxfoundation.org>
In-Reply-To: <9fd94de1240096c57c37ee3a02742167b1319ecc.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 14 May 2021 07:20:15 -1000
Message-ID: <CAOSpxdbTLKOiKHC0YabeD9_s2uaeH_n2-uDz3btRF0u8H-wWWQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/25] Pull request (cover letter only)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 13, 2021 at 11:11 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-05-12 at 04:47 -1000, Steve Sakoman wrote:
> > The following changes since commit 834a8e357bc999a0163e7c5bafbcc1a8816448d4:
> >
> >   license_image.bbclass: Fix symlink to generic license files (2021-05-03 04:56:23 -1000)
> >
> > are available in the Git repository at:
> >
> >   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
> >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
> >
> > Alexander Kanavin (5):
> >   diffoscope: add native libraries to LD_LIBRARY_PATH
> >   Revert "oeqa: Set LD_LIBRARY_PATH when executing native commands"
> >   ovmf: update to 202002
> >   ovmf: update to 202005
> >   ovmf: update edk2-stable202005 -> edk2-stable202008
> >
> > Anatol Belski (1):
> >   tar: Fix CVE-2021-20193
> >
> > Bruce Ashfield (4):
> >   linux-yocto/5.4: update to v5.4.114
> >   linux-yocto/5.4: update to v5.4.116
> >   perf: fix python-audit RDEPENDS
> >   make-mod-scripts: add HOSTCXX definitions and gmp-native dependency
> >
> > Christophe Chapuis (1):
> >   rootfs.py: find .ko.gz and .ko.xz kernel modules as well
> >
> > Jose Quaresma (1):
> >   ptest-runner: libgcc must be installed for pthread_cancel to work
> >
> > Joshua Watt (1):
> >   classes/image: Use xargs to set file timestamps
> >
> > Kai Uwe Broulik (1):
> >   gstreamer1.0-plugins-good: on wayland qt5 needs qtwayland
> >
> > Khem Raj (1):
> >   cml1.bbclass: Return sorted list of cfg files
> >
> > Lee Chee Yang (1):
> >   binutils: fix CVE-2021-3487
> >
> > Mark Hatle (1):
> >   kernel.bbclass: Remove do_install[prefunc] no longer needed
> >
> > Michael Opdenacker (1):
> >   sanity.bbclass: mention CONNECTIVITY_CHECK_URIS in network failure
> >     message
> >
> > Richard Purdie (3):
> >   yocto-uninative: Update to 3.1 which includes a patchelf fix
> >   pybootchart/draw: Avoid divide by zero error
> >   oeqa/qemurunner: Improve logging thread exit handling for qemu
> >     shutdown test
>
> I merged this branch apart from this last patch above as the author of the
> patch messed up and you'd need the subsequent fixes too ;-) It can come
> together, later.

No problem!  I'll include that patch and the subsequent fixes in my
next review set.

Steve
