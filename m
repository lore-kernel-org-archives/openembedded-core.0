Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.618.1586281632875948605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 10:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KoY4BOf3;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id h9so4875402wrc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2020 10:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=ZR4fji4nh6UhildrBkBTbtZPYv6bXQESP3Zf2jRhn9g=;
        b=KoY4BOf3j5rfEc6OsD3O1tyVZGg6Yc/Y+rQ5PQCk0pgiDXA0MD5ippyCeQs/ZVmEKA
         32Y/ymBlPQD+x6/+JCG4DLhdJIaaUuH0w45SfK17luwcW2s0wdLDNDb8yxY5SGqLn0h+
         qsElAodPYUVTMji0rdCFQXI7UkoQICSmyvtAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=ZR4fji4nh6UhildrBkBTbtZPYv6bXQESP3Zf2jRhn9g=;
        b=JUOdVlVX+gOBGGab/Lhq39TDachM98QYO9w3hn9XZZQAz2mhbLnCvUEmuXoYWsM84x
         M4FGv4NaSAs/umEdQUlvTavrtHT1zufl0RPZJoT4vUu5lpLKpHceM/0l79VD2VXQC04f
         6XIF/V8OX9aOrhAVuL1gAgCCeg18UKHHEk3VfPsxESSJSXODmdx1NHw/8IHxr0cBEBt8
         W4aM87zeTb/eJpA9hTRct/AAk8Y/d/+truwS/fT+qs5ETCWk90laBoOP/EWa6l+Us5Wu
         EXkNz82cFr1EmmsUYqQ118qF1lumuAo7P9xgwc7ZUPRjxemyqG7mc4pJIz8SrnmF4zu1
         lWVg==
X-Gm-Message-State: AGi0PubHJlTG/8vHgEyGWIpx7CkHhN3DsNFwynN9AGdpVzxJ9lXCLg8f
	QTDyhNUCEJdEsay4QyQvi0/x5A==
X-Google-Smtp-Source: APiQypI2gx6QWEg99aJKO3v6iSgTNGwLwSKcQ4fn9EFgv5x4hkbM0/HPDnTYevSiUe4rxnG77gPjbQ==
X-Received: by 2002:adf:ce07:: with SMTP id p7mr3760563wrn.261.1586281631205;
        Tue, 07 Apr 2020 10:47:11 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id c11sm6679321wrt.24.2020.04.07.10.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 10:47:10 -0700 (PDT)
Date: Tue, 7 Apr 2020 18:47:06 +0100
From: "Paul Barker" <pbarker@konsulko.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
 <openembedded-core@lists.openembedded.org>, jpewhacker@gmail.com
Subject: Re: [PATCH v2 2/2] wic: Add --embed-rootfs argument
Message-ID: <20200407184706.7c205179@ub1910>
In-Reply-To: <CAPybu_3n3T9BypXoZexhaWWHX0nTQBy=hNkppKiUnvEGuLP8NQ@mail.gmail.com>
References: <20200304144936.2559106-1-ricardo@ribalda.com>
	<20200304144936.2559106-2-ricardo@ribalda.com>
	<20200305093329.1eed6cdd@ub1910>
	<CAPybu_0tE=pUhJjee7g=vPsmKxYiLSaFTbN25GRxw56DCkmULw@mail.gmail.com>
	<CAPybu_3n3T9BypXoZexhaWWHX0nTQBy=hNkppKiUnvEGuLP8NQ@mail.gmail.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 3 Apr 2020 21:52:52 +0200
Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:

> ping?

I'm still concerned that `--embed-rootfs` and `--include-path` are too
similar and we should instead have one option that can handle both use cases.

Has this already been merged?

> 
> On Thu, Mar 5, 2020 at 1:26 PM Ricardo Ribalda Delgado
> <ricardo@ribalda.com> wrote:
> >
> > Hi Paul,
> >
> > On Thu, Mar 5, 2020 at 10:37 AM Paul Barker <pbarker@konsulko.com> wrote:  
> > >
> > > On Wed,  4 Mar 2020 15:49:36 +0100
> > > Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
> > >  
> > > > This option adds the content of a rootfs on a specific location on the
> > > > rootfs.
> > > >
> > > > It is very useful for making a partition that contains the rootfs for a
> > > > host and a target Eg:
> > > >
> > > > / -> Roofs for the host
> > > > /export/ -> Rootfs for the target (which will netboot)
> > > >
> > > > Although today we support making a partition for "/export" this might
> > > > not be compatible with some upgrade systems, or we might be limited by
> > > > the number of partitions.
> > > >
> > > > With this patch we can use something like:
> > > >
> > > > part / --source rootfs --embed-rootfs target-image /export --embed-rootfs target-image2 /export2  
> > >
> > > I like this but it still leaves confusion between `--include-path` and
> > > --embed-rootfs` as they're similar but slightly different. Can we just modify
> > > `--include-path` to have this syntax?  
> >
> > I think they are different enough.
> >
> > - include-path ads a file/folder
> > - embed-rootfs adds a rootfs, which is either a folder or a image.bb file.
> >
> >  
> > >  
> > > >
> > > > on the .wks file.
> > > >
> > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > > ---
> > > >  scripts/lib/wic/help.py                  |  8 ++++++++
> > > >  scripts/lib/wic/ksparser.py              |  1 +
> > > >  scripts/lib/wic/partition.py             |  1 +
> > > >  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++++-
> > > >  4 files changed, 31 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> > > > index 4d342fcf05..140dc504cd 100644
> > > > --- a/scripts/lib/wic/help.py
> > > > +++ b/scripts/lib/wic/help.py
> > > > @@ -979,6 +979,14 @@ DESCRIPTION
> > > >                           copies. This option only has an effect with the rootfs
> > > >                           source plugin.
> > > >
> > > > +         --embed-rootfs: This option is specific to wic. It embeds a rootfs into
> > > > +                         the given path to the resulting image. The option
> > > > +                         contains two fields, the roofs and the path, separated
> > > > +                         by a space. The rootfs follows the same logic as the
> > > > +                         rootfs-dir argument. Multiple options can be provided
> > > > +                         in order to embed multiple rootfs. This option only has
> > > > +                         an effect with the rootfs source plugin.
> > > > +
> > > >           --extra-space: This option is specific to wic. It adds extra
> > > >                          space after the space filled by the content
> > > >                          of the partition. The final size can go
> > > > diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> > > > index 650b976223..64c8c1175e 100644
> > > > --- a/scripts/lib/wic/ksparser.py
> > > > +++ b/scripts/lib/wic/ksparser.py
> > > > @@ -138,6 +138,7 @@ class KickStart():
> > > >          part.add_argument('--align', type=int)
> > > >          part.add_argument('--exclude-path', nargs='+')
> > > >          part.add_argument('--include-path', nargs='+')
> > > > +        part.add_argument('--embed-rootfs', nargs=2, action='append')
> > > >          part.add_argument("--extra-space", type=sizetype)
> > > >          part.add_argument('--fsoptions', dest='fsopts')
> > > >          part.add_argument('--fstype', default='vfat',
> > > > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> > > > index 2d95f78439..13857df82f 100644
> > > > --- a/scripts/lib/wic/partition.py
> > > > +++ b/scripts/lib/wic/partition.py
> > > > diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> > > > index 40419a64b3..089aaea477 100644
> > > > --- a/scripts/lib/wic/plugins/source/rootfs.py
> > > > +++ b/scripts/lib/wic/plugins/source/rootfs.py
> > > > @@ -17,6 +17,7 @@ import shutil
> > > >  import sys
> > > >
> > > >  from oe.path import copyhardlinktree, copytree
> > > > +from pathlib import Path
> > > >
> > > >  from wic import WicError
> > > >  from wic.pluginbase import SourcePlugin
> > > > @@ -80,7 +81,7 @@ class RootfsPlugin(SourcePlugin):
> > > >
> > > >          new_rootfs = None
> > > >          # Handle excluded paths.
> > > > -        if part.exclude_path or part.include_path:
> > > > +        if part.exclude_path or part.include_path or part.embed_rootfs:
> > > >              # We need a new rootfs directory we can delete files from. Copy to
> > > >              # workdir.
> > > >              new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
> > > > @@ -100,6 +101,25 @@ class RootfsPlugin(SourcePlugin):
> > > >              for path in part.include_path or []:
> > > >                  copyhardlinktree(path, new_rootfs)
> > > >
> > > > +            for embed in part.embed_rootfs or []:
> > > > +                [embed_rootfs, path] = embed
> > > > +                #we need to remove the initial / for os.path.join to work
> > > > +                if os.path.isabs(path):
> > > > +                    path = path[1:]
> > > > +                if embed_rootfs in krootfs_dir:
> > > > +                    embed_rootfs = krootfs_dir[embed_rootfs]
> > > > +                embed_rootfs = cls.__get_rootfs_dir(embed_rootfs)
> > > > +                tar_file = os.path.realpath(os.path.join(cr_workdir, "aux.tar"))
> > > > +                tar_cmd = "%s tar cpf %s -C %s ." % (cls.__get_pseudo(native_sysroot,
> > > > +                                                     embed_rootfs), tar_file, embed_rootfs)
> > > > +                exec_native_cmd(tar_cmd, native_sysroot)
> > > > +                untar_cmd = "%s tar xf %s -C %s ." % (cls.__get_pseudo(native_sysroot, new_rootfs),
> > > > +                                                      tar_file, os.path.join(new_rootfs, path))
> > > > +                Path(os.path.join(new_rootfs, path)).mkdir(parents=True, exist_ok=True)
> > > > +                exec_native_cmd(untar_cmd, native_sysroot,
> > > > +                                cls.__get_pseudo(native_sysroot, new_rootfs))
> > > > +                os.remove(tar_file)
> > > > +
> > > >              for orig_path in part.exclude_path or []:
> > > >                  path = orig_path
> > > >                  if os.path.isabs(path):  
> > >
> > > As said in my other email, if you're running wic outside bitbake I'm not sure
> > > you can guarantee pseudo is available. And now I think about it, if you're
> > > running wic inside bitbake (as part of do_image_wic), you'd be running pseudo
> > > under pseudo and I have no idea how that would work out.
> > >  
> >
> > pseudo is warranted because wic launches "bitbake wic-tools", which
> > has as DEPENDS pseudo-native.
> >
> > scripts/wic:        subprocess.check_call(["bitbake", "wic-tools"])
> >
> >
> > I have tried to run it inside bitbake with --exclude-path and
> > everything seems to work fine.
> >
> >
> >  
> > > --
> > > Paul Barker
> > > Konsulko Group  
> >
> >
> >
> > --
> > Ricardo Ribalda  
> 
> 
> 



-- 
Paul Barker
Konsulko Group
