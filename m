Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.8853.1586341744795390111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 03:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I8fW5S8o;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id p10so7078372ljn.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2020 03:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1nVoWJhk99iT7mw4qs+c3CsML82dfSYo/WMKxvyjxp4=;
        b=I8fW5S8oCAE7P74Y7xMviMuth6NoLP+92+9AejV8AbCtfDaun7AjXradGrUGEqD30q
         BdUS/msFTZAyqCY1RiaNVq1cGEHAo+nCT5NivBer0PaPwkd7aRcniXZ29puj3vvfNsY+
         xT+qTQAX+x1iBfiAyfO1uN2RpQQpzUGGlJxDcsqi59y0J38hL7FFTRYIdqWpijAhCue5
         HptSv6cV5C6IIJd/6rqzZopIMRbKWAfq10jrOeR74c9QWhlIS0A3mMPnFh463xTmKFXc
         ms4JyZJOO8XwBsQH9Ze25uiGw8ruzdXVpHcnXFiT1yNG6ixEg3J6wu+ZzJx7MxKWcP8l
         74vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1nVoWJhk99iT7mw4qs+c3CsML82dfSYo/WMKxvyjxp4=;
        b=limOBDsbV9oIt30laswr+XEM6n4LVNKS2zwXV0js+ZNFlackKnvCbO7UUvyAONRhaC
         H3+8PfOBeu7VzWjl0D6ymgbr1jnL0UJMl19Va2sxfWjGVPNuuMyOdbWfnsAPSIQFNW2i
         kJspniF64FA7AvaoSRTpsOgB7nfLgvE7D0rukfEIjXvrFEXgxNTjLKi/WuA5pwyFkGKA
         Kgol7u6Zn+v6z36EO0BlSVgz0Tt0NuoPtN9ta5ZOr9rhmL6mfkiMYI72sDca6EwLX4Ha
         sez0INU2jlsl4gc9pTJkH6GTM9QvhBfO9uTiDQ2+KUio9flg3Qw1n1W6TsK7A6JLFKQg
         N8/g==
X-Gm-Message-State: AGi0PuYHuvRffEulet2qregXHbmYwRxiHOAV2e8bmPMIK0UfC2vzxa8+
	Bfun1YAhQeGEYJYBffS9wISXsQFtpmi7vel6ejk=
X-Google-Smtp-Source: APiQypLmskNq7gVDaxWrbVgQ1dcUh6JqBpv2Fg7dOpF0vwTvDhjGP24nZtQCYxSdNIrsCbMjBk4kK0hlhxf60YfrcLg=
X-Received: by 2002:a2e:9959:: with SMTP id r25mr4595483ljj.200.1586341742711;
 Wed, 08 Apr 2020 03:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200304144936.2559106-1-ricardo@ribalda.com> <20200304144936.2559106-2-ricardo@ribalda.com>
 <20200305093329.1eed6cdd@ub1910> <CAPybu_0tE=pUhJjee7g=vPsmKxYiLSaFTbN25GRxw56DCkmULw@mail.gmail.com>
 <CAPybu_3n3T9BypXoZexhaWWHX0nTQBy=hNkppKiUnvEGuLP8NQ@mail.gmail.com>
 <20200407184706.7c205179@ub1910> <16039C80250EF791.10037@lists.openembedded.org>
In-Reply-To: <16039C80250EF791.10037@lists.openembedded.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Wed, 8 Apr 2020 12:28:46 +0200
Message-ID: <CAPybu_1iQdfFRJus_WE35SsnuHDJFKBy6Qq2wHvOPhc-sgFvKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] wic: Add --embed-rootfs argument
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Paul Barker <pbarker@konsulko.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, jpewhacker@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Again



On Tue, Apr 7, 2020 at 8:19 PM Ricardo Ribalda via
lists.openembedded.org
<ricardo.ribalda=gmail.com@lists.openembedded.org> wrote:
>
> Hi Paul
>
> Yes it got merged
> https://git.openembedded.org/openembedded-core/commit/?id=efdcf94801f6abe8e4099e324d9a3deccd8d4384
>
> Even though the functionality looks similar, the devil is on the
> details ;). One thing is adding a file, this is  just  file/directory
> that is referenced as a path, and the other is a complete rootfs,
> which takes care of permissions and can be invoked with a path, or a
> bitbake target...
>
> But if you come up with a interface that cover both usecases I can
> help implementing it.

Looking into merging the functionality of embed-rootfs into include-path

I guess the first step is to modify include-path so it can accept 1 or
2 arguments.

If 1 argument:
the functionality is the same as now

If 2 arguments:
The second argument is considered the destination:
eg: --include-path home  /home/


The second step is to accept not only file/folders but also images.
The challenge here is that we can name an image in multiple ways:
- path: tmp/work/machine/core-image-minimal/1.0-r0/rootfs/
- name: core-image-minimal
- keyword that it is provided by wic: -rootfs-dir target-image=/workir....

Which can lead to a name collision. What do we do in this case? We
prefer the directory among the image?


The third step is, as you mentioned on the irc,  to fix also the
permissions of the files/directories, not only for images.
- Maybe leave files owned by root if no pseudo database exists and
clear setuid/setgid bits for safety.

Am I in the right direction ? something I am missing?



>
> Best regards.
>
> On Tue, Apr 7, 2020 at 7:47 PM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Fri, 3 Apr 2020 21:52:52 +0200
> > Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
> >
> > > ping?
> >
> > I'm still concerned that `--embed-rootfs` and `--include-path` are too
> > similar and we should instead have one option that can handle both use cases.
> >
> > Has this already been merged?
> >
> > >
> > > On Thu, Mar 5, 2020 at 1:26 PM Ricardo Ribalda Delgado
> > > <ricardo@ribalda.com> wrote:
> > > >
> > > > Hi Paul,
> > > >
> > > > On Thu, Mar 5, 2020 at 10:37 AM Paul Barker <pbarker@konsulko.com> wrote:
> > > > >
> > > > > On Wed,  4 Mar 2020 15:49:36 +0100
> > > > > Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
> > > > >
> > > > > > This option adds the content of a rootfs on a specific location on the
> > > > > > rootfs.
> > > > > >
> > > > > > It is very useful for making a partition that contains the rootfs for a
> > > > > > host and a target Eg:
> > > > > >
> > > > > > / -> Roofs for the host
> > > > > > /export/ -> Rootfs for the target (which will netboot)
> > > > > >
> > > > > > Although today we support making a partition for "/export" this might
> > > > > > not be compatible with some upgrade systems, or we might be limited by
> > > > > > the number of partitions.
> > > > > >
> > > > > > With this patch we can use something like:
> > > > > >
> > > > > > part / --source rootfs --embed-rootfs target-image /export --embed-rootfs target-image2 /export2
> > > > >
> > > > > I like this but it still leaves confusion between `--include-path` and
> > > > > --embed-rootfs` as they're similar but slightly different. Can we just modify
> > > > > `--include-path` to have this syntax?
> > > >
> > > > I think they are different enough.
> > > >
> > > > - include-path ads a file/folder
> > > > - embed-rootfs adds a rootfs, which is either a folder or a image.bb file.
> > > >
> > > >
> > > > >
> > > > > >
> > > > > > on the .wks file.
> > > > > >
> > > > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > > > > ---
> > > > > >  scripts/lib/wic/help.py                  |  8 ++++++++
> > > > > >  scripts/lib/wic/ksparser.py              |  1 +
> > > > > >  scripts/lib/wic/partition.py             |  1 +
> > > > > >  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++++-
> > > > > >  4 files changed, 31 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> > > > > > index 4d342fcf05..140dc504cd 100644
> > > > > > --- a/scripts/lib/wic/help.py
> > > > > > +++ b/scripts/lib/wic/help.py
> > > > > > @@ -979,6 +979,14 @@ DESCRIPTION
> > > > > >                           copies. This option only has an effect with the rootfs
> > > > > >                           source plugin.
> > > > > >
> > > > > > +         --embed-rootfs: This option is specific to wic. It embeds a rootfs into
> > > > > > +                         the given path to the resulting image. The option
> > > > > > +                         contains two fields, the roofs and the path, separated
> > > > > > +                         by a space. The rootfs follows the same logic as the
> > > > > > +                         rootfs-dir argument. Multiple options can be provided
> > > > > > +                         in order to embed multiple rootfs. This option only has
> > > > > > +                         an effect with the rootfs source plugin.
> > > > > > +
> > > > > >           --extra-space: This option is specific to wic. It adds extra
> > > > > >                          space after the space filled by the content
> > > > > >                          of the partition. The final size can go
> > > > > > diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> > > > > > index 650b976223..64c8c1175e 100644
> > > > > > --- a/scripts/lib/wic/ksparser.py
> > > > > > +++ b/scripts/lib/wic/ksparser.py
> > > > > > @@ -138,6 +138,7 @@ class KickStart():
> > > > > >          part.add_argument('--align', type=int)
> > > > > >          part.add_argument('--exclude-path', nargs='+')
> > > > > >          part.add_argument('--include-path', nargs='+')
> > > > > > +        part.add_argument('--embed-rootfs', nargs=2, action='append')
> > > > > >          part.add_argument("--extra-space", type=sizetype)
> > > > > >          part.add_argument('--fsoptions', dest='fsopts')
> > > > > >          part.add_argument('--fstype', default='vfat',
> > > > > > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> > > > > > index 2d95f78439..13857df82f 100644
> > > > > > --- a/scripts/lib/wic/partition.py
> > > > > > +++ b/scripts/lib/wic/partition.py
> > > > > > diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> > > > > > index 40419a64b3..089aaea477 100644
> > > > > > --- a/scripts/lib/wic/plugins/source/rootfs.py
> > > > > > +++ b/scripts/lib/wic/plugins/source/rootfs.py
> > > > > > @@ -17,6 +17,7 @@ import shutil
> > > > > >  import sys
> > > > > >
> > > > > >  from oe.path import copyhardlinktree, copytree
> > > > > > +from pathlib import Path
> > > > > >
> > > > > >  from wic import WicError
> > > > > >  from wic.pluginbase import SourcePlugin
> > > > > > @@ -80,7 +81,7 @@ class RootfsPlugin(SourcePlugin):
> > > > > >
> > > > > >          new_rootfs = None
> > > > > >          # Handle excluded paths.
> > > > > > -        if part.exclude_path or part.include_path:
> > > > > > +        if part.exclude_path or part.include_path or part.embed_rootfs:
> > > > > >              # We need a new rootfs directory we can delete files from. Copy to
> > > > > >              # workdir.
> > > > > >              new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
> > > > > > @@ -100,6 +101,25 @@ class RootfsPlugin(SourcePlugin):
> > > > > >              for path in part.include_path or []:
> > > > > >                  copyhardlinktree(path, new_rootfs)
> > > > > >
> > > > > > +            for embed in part.embed_rootfs or []:
> > > > > > +                [embed_rootfs, path] = embed
> > > > > > +                #we need to remove the initial / for os.path.join to work
> > > > > > +                if os.path.isabs(path):
> > > > > > +                    path = path[1:]
> > > > > > +                if embed_rootfs in krootfs_dir:
> > > > > > +                    embed_rootfs = krootfs_dir[embed_rootfs]
> > > > > > +                embed_rootfs = cls.__get_rootfs_dir(embed_rootfs)
> > > > > > +                tar_file = os.path.realpath(os.path.join(cr_workdir, "aux.tar"))
> > > > > > +                tar_cmd = "%s tar cpf %s -C %s ." % (cls.__get_pseudo(native_sysroot,
> > > > > > +                                                     embed_rootfs), tar_file, embed_rootfs)
> > > > > > +                exec_native_cmd(tar_cmd, native_sysroot)
> > > > > > +                untar_cmd = "%s tar xf %s -C %s ." % (cls.__get_pseudo(native_sysroot, new_rootfs),
> > > > > > +                                                      tar_file, os.path.join(new_rootfs, path))
> > > > > > +                Path(os.path.join(new_rootfs, path)).mkdir(parents=True, exist_ok=True)
> > > > > > +                exec_native_cmd(untar_cmd, native_sysroot,
> > > > > > +                                cls.__get_pseudo(native_sysroot, new_rootfs))
> > > > > > +                os.remove(tar_file)
> > > > > > +
> > > > > >              for orig_path in part.exclude_path or []:
> > > > > >                  path = orig_path
> > > > > >                  if os.path.isabs(path):
> > > > >
> > > > > As said in my other email, if you're running wic outside bitbake I'm not sure
> > > > > you can guarantee pseudo is available. And now I think about it, if you're
> > > > > running wic inside bitbake (as part of do_image_wic), you'd be running pseudo
> > > > > under pseudo and I have no idea how that would work out.
> > > > >
> > > >
> > > > pseudo is warranted because wic launches "bitbake wic-tools", which
> > > > has as DEPENDS pseudo-native.
> > > >
> > > > scripts/wic:        subprocess.check_call(["bitbake", "wic-tools"])
> > > >
> > > >
> > > > I have tried to run it inside bitbake with --exclude-path and
> > > > everything seems to work fine.
> > > >
> > > >
> > > >
> > > > > --
> > > > > Paul Barker
> > > > > Konsulko Group
> > > >
> > > >
> > > >
> > > > --
> > > > Ricardo Ribalda
> > >
> > >
> > >
> >
> >
> >
> > --
> > Paul Barker
> > Konsulko Group
>
>
>
> --
> Ricardo Ribalda
> 



--
Ricardo Ribalda
