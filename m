Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3B18D61809
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 10:09:01 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z11so1614116wro.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 02:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=nvIYiOvquGySjh+J81UzNAnCf+c77sOd0GAY8SIhDds=;
	b=amoXJJgcviLHbYHVXD3WiQMaQJYw25g6gvkyIWVGcieZcbsFBVRxiHjlg6Eg+xUcQE
	87aPg6i/ABMd9bqinH4CEnz7V9/unYt0jsMDOAGZwuS0m6wJ4Cm+ec6XVAeT3vOXDwNO
	2rOczhR59IWFt+vOndQf5bqTJ8Qn0dnAN6+bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=nvIYiOvquGySjh+J81UzNAnCf+c77sOd0GAY8SIhDds=;
	b=BzDLuAYWP0hp0GSMQNRaqUW19m4Iw3mTgRRms9Q3q4F0Cxn+O4gxXHN7+DFFGHl2nt
	oXuF6tth3jMs8Xg07iT9M0PLRbKTMneXqi8XNZXC8tRLV9OBU9Jr4g0rdJyffGAa4jQU
	8v00gWUT6A4v9KcBlw7y2T6MVzXW38XTIb7xKbbxzHxbVppxjGHXIk480jHpYDw+NQqv
	UKZB/F2fpvgSkQKnFZ2UToLsIo4A+F5QWkm0KLqmHkCVnwkL7OCFsNBfdRxyI8AguPwF
	MnXw0gi8CbHunO3ZMq43NTv35PHIVvRaFouT8lEkstS5DXQoZw94L1hJpNeKoNdahqU7
	TI0A==
X-Gm-Message-State: ANhLgQ15/U//vAWC8wPXoxe5p7ay99/7TFoXfBuv0JnEjh+d9z4lExni
	RQ+VyIkZIFnNBiwnqRiJgGTnxg==
X-Google-Smtp-Source: ADFU+vszYQSvM2wXfKGdZnAET3prqQ3P4mqYQB06pZ7u6bbysY6XiG8g1DR0iv1vmJqQfNNoce9rHg==
X-Received: by 2002:a5d:69cb:: with SMTP id s11mr3206682wrw.47.1583316541745; 
	Wed, 04 Mar 2020 02:09:01 -0800 (PST)
Received: from ub1910 ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id o3sm4095365wme.36.2020.03.04.02.09.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 02:09:01 -0800 (PST)
Date: Wed, 4 Mar 2020 10:08:55 +0000
From: Paul Barker <pbarker@konsulko.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Message-ID: <20200304100855.637a61e1@ub1910>
In-Reply-To: <CAPybu_3Gno9FkfvKywooGQHh+5gQZL9iMq_MxnU93TX7Svh3aQ@mail.gmail.com>
References: <20200304083438.1022216-1-ricardo@ribalda.com>
	<20200304083438.1022216-2-ricardo@ribalda.com>
	<20200304094250.3eda52e1@ub1910>
	<CAPybu_3Gno9FkfvKywooGQHh+5gQZL9iMq_MxnU93TX7Svh3aQ@mail.gmail.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] wic: Add --embed-rootfs argument
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2020 10:09:02 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Mar 2020 10:56:20 +0100
Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:

> Hi Paul
> 
> Thanks for your reply
> 
> On Wed, Mar 4, 2020 at 10:43 AM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Wed,  4 Mar 2020 09:34:38 +0100
> > Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
> >  
> > > This option adds the content of a rootfs on a specific location on the
> > > rootfs.
> > >
> > > It is very useful for making a partition that contains the rootfs for a
> > > host and a target Eg:
> > >
> > > / -> Roofs for the host
> > > /export/ -> Rootfs for the target (which will netboot)
> > >
> > > Although today we support making a partition for "/export" this might
> > > not be compatible with some upgrade systems, or we might be limited by
> > > the number of partitions.
> > >
> > > With this patch we can use something like:
> > >
> > > part / --source rootfs --embed-rootfs=target-image:/export  
> >
> > I considered using a syntax like this for --include-path but I chose not to
> > as it's not easy to choose a separator. ':' is a valid character in a
> > directory name.  
> 
> I think we have to live with not being able to copy files to a
> directory with a colon :(

I wouldn't like to place a limitation like that on users and I'd like to
avoid the proliferation of similar arguments here.

How about modifying '--include-path' to take two arguments, a source path and
a destination prefix? The python argument parser should be able to handle
this and you can build a list of tuples (source_path, dest_prefix) when
parsing the arguments.

The '--include-path' argument hasn't been part of a Yocto release yet it's
just on the master branch so I think if we're going to fix it with a breaking
change, now is definitely the time.

> 
> >
> > My approach is to handle this in two steps:
> >
> > 1) Add a new task before do_image_wic which creates an 'embedded-rootfs'
> >   directory and copies 'target-image' to 'embedded-rootfs/export'.
> >
> > 2) Use '--include-path=embedded-rootfs' in the wks file.
> >  
> 
> The biggest problem with that approach is permissions. We need files
> with UID 0, siticky bits, etc. We lose the pseudo database if we
> simply copy to a folder.
> 
> Also, if we have a complex system with multiple partitions I prefer to
> handle all in a single .wks file instead of a script + wks file
> 
> > >
> > > on the .wks file.
> > >
> > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > ---
> > >  scripts/lib/wic/help.py                  |  7 +++++++
> > >  scripts/lib/wic/ksparser.py              |  1 +
> > >  scripts/lib/wic/partition.py             |  1 +
> > >  scripts/lib/wic/plugins/source/rootfs.py | 20 +++++++++++++++++++-
> > >  4 files changed, 28 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> > > index 4d342fcf05..67a33e6a65 100644
> > > --- a/scripts/lib/wic/help.py
> > > +++ b/scripts/lib/wic/help.py
> > > @@ -979,6 +979,13 @@ DESCRIPTION
> > >                           copies. This option only has an effect with the rootfs
> > >                           source plugin.
> > >
> > > +         --embed-rootfs: This option is specific to wic. It embeds a rootfs into
> > > +                         the given path to the resulting image. The option
> > > +                         contains two fields, the roofs and the path, separated
> > > +                         by a colon. The rootfs follows the same logic as the
> > > +                         rootfs-dir argument. This option only has an effect
> > > +                         with the rootfs source plugin.
> > > +
> > >           --extra-space: This option is specific to wic. It adds extra
> > >                          space after the space filled by the content
> > >                          of the partition. The final size can go
> > > diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> > > index 650b976223..d422e2a6bb 100644
> > > --- a/scripts/lib/wic/ksparser.py
> > > +++ b/scripts/lib/wic/ksparser.py
> > > @@ -138,6 +138,7 @@ class KickStart():
> > >          part.add_argument('--align', type=int)
> > >          part.add_argument('--exclude-path', nargs='+')
> > >          part.add_argument('--include-path', nargs='+')
> > > +        part.add_argument('--embed-rootfs', nargs='+')
> > >          part.add_argument("--extra-space", type=sizetype)
> > >          part.add_argument('--fsoptions', dest='fsopts')
> > >          part.add_argument('--fstype', default='vfat',
> > > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> > > index 2d95f78439..13857df82f 100644
> > > --- a/scripts/lib/wic/partition.py
> > > +++ b/scripts/lib/wic/partition.py
> > > @@ -31,6 +31,7 @@ class Partition():
> > >          self.extra_space = args.extra_space
> > >          self.exclude_path = args.exclude_path
> > >          self.include_path = args.include_path
> > > +        self.embed_rootfs = args.embed_rootfs
> > >          self.fsopts = args.fsopts
> > >          self.fstype = args.fstype
> > >          self.label = args.label
> > > diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> > > index 40419a64b3..16359601dc 100644
> > > --- a/scripts/lib/wic/plugins/source/rootfs.py
> > > +++ b/scripts/lib/wic/plugins/source/rootfs.py
> > > @@ -80,7 +80,7 @@ class RootfsPlugin(SourcePlugin):
> > >
> > >          new_rootfs = None
> > >          # Handle excluded paths.
> > > -        if part.exclude_path or part.include_path:
> > > +        if part.exclude_path or part.include_path or part.embed_rootfs:
> > >              # We need a new rootfs directory we can delete files from. Copy to
> > >              # workdir.
> > >              new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
> > > @@ -100,6 +100,24 @@ class RootfsPlugin(SourcePlugin):
> > >              for path in part.include_path or []:
> > >                  copyhardlinktree(path, new_rootfs)
> > >
> > > +            for embed in part.embed_rootfs or []:
> > > +                [embed_rootfs, path] = embed.split(":")
> > > +                #we need to remove the initial / for os.path.join to work
> > > +                if os.path.isabs(path):
> > > +                    path = path[1:]
> > > +                if embed_rootfs in krootfs_dir:
> > > +                    embed_rootfs = krootfs_dir[embed_rootfs]
> > > +                embed_rootfs = cls.__get_rootfs_dir(embed_rootfs)
> > > +                tar_file = os.path.realpath(os.path.join(cr_workdir, "aux.tar"))
> > > +                tar_cmd = "%s tar cpf %s -C %s ." % (cls.__get_pseudo(native_sysroot,
> > > +                                                     embed_rootfs), tar_file, embed_rootfs)
> > > +                exec_native_cmd(tar_cmd, native_sysroot)
> > > +                untar_cmd = "%s tar xf %s -C %s ." % (cls.__get_pseudo(native_sysroot, new_rootfs),
> > > +                                                      tar_file, os.path.join(new_rootfs, path))
> > > +                exec_native_cmd(untar_cmd, native_sysroot,
> > > +                                cls.__get_pseudo(native_sysroot, new_rootfs))
> > > +                os.remove(tar_file)
> > > +  
> >
> > Why are you using an intermediate tar file here?  
> 
> For the permissions :(

Your previous patch handled this using 'pseudo -B'. It would be good to be
consistent if possible - either use an intermediate tar file in all cases if
it's necessary or use 'pseudo -B' in all cases.

-- 
Paul Barker
Konsulko Group

