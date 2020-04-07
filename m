Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.2198.1586286162496115603
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 12:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Y4Q/0LFo;
 spf=pass (domain: konsulko.com, ip: 209.85.221.67, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f67.google.com with SMTP id 31so5140711wre.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2020 12:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=3V3K8h4O8hCUO4PJ2GkWWKYkMjBg1dKSoPpi6r4Y1zc=;
        b=Y4Q/0LFoKxnfKlEwh+aCiHVziefq94uuhNLgCW1G/Y23PVHS4nUoTv4MQ0tHflgZqy
         2NW+h9wVaLkeDpdchCDvP2b5nUWL5vjsatZGe3VlLpqxaRJta/xOiM6TUSiCU8R28px4
         Y8eDS0jF+rs+6s+pNb4XWEp8JYEtz9o10WThs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=3V3K8h4O8hCUO4PJ2GkWWKYkMjBg1dKSoPpi6r4Y1zc=;
        b=FZhAbj3PraLzuw25sZ+UVxpOMOWglgg1FduZ+gWLjAigK2TDKaPp+1pAp2fJYa6Gdq
         i2u3CJMJ7j7DUvH1TpGZEx++wbN4iuHhjXsSZT458j1bA6xEVMtzcSDCJoir7eQA635i
         +7j/JtjaMKWZiSD09mVsSYTqV3e8fawquQb8gEzkOftzVVvLaLBt2q3EkSYKUyJ8kMVa
         bKFHdJV8CmGIcPzcLrFbM0T3nBommUWinHsi4tez+NuEdcbnfjb8frK2ZR0Lbro/b00y
         WEGhheV+HS3jTT1ecaxd2C+T3tYocJycg+is3cqIMGjh70wurVofKVSgZhQhXD0BjlX4
         9pJQ==
X-Gm-Message-State: AGi0PuZAofGl9C5bvCCnX5iH6JXIQp3682oNgfRjoLMdrOdLBH9QkwwO
	dKDFN+nP6jiLMh4lfMheIMoEIw==
X-Google-Smtp-Source: APiQypICjboB1/HnuKO5SrUpNkbQv7U3gcEiWDDlx4DOud7H3wwEKgaEquN7asF11ncn/yOxD6A4Tw==
X-Received: by 2002:adf:db41:: with SMTP id f1mr4483323wrj.247.1586286160862;
        Tue, 07 Apr 2020 12:02:40 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id k84sm3604306wmk.2.2020.04.07.12.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 12:02:40 -0700 (PDT)
Date: Tue, 7 Apr 2020 20:02:36 +0100
From: "Paul Barker" <pbarker@konsulko.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] wic: Fix permissions when using exclude or include path
Message-ID: <20200407200236.748931eb@ub1910>
In-Reply-To: <CAPybu_3LK7Qj9qSYW8oR=21u5zDz2UbdSe6oV8s6hHQ_COXVxA@mail.gmail.com>
References: <20200304083438.1022216-1-ricardo@ribalda.com>
	<20200304095334.1f20ddd9@ub1910>
	<CAPybu_17EBoQH45Cpb+2UJ-Yoho062_5sGWAT1qmu4MPycOHBQ@mail.gmail.com>
	<20200305092855.1f9ccae8@ub1910>
	<CAPybu_0Avf3ckaFNvkmB6Q1FwLmQB_T886HSwNLrjCnu3tkh_w@mail.gmail.com>
	<CAPybu_03RzN3zyQuoHJorcnbqWfvC+cGvGo5yNiVC8pHP-MQ=g@mail.gmail.com>
	<20200407191256.6cb45445@ub1910>
	<CAPybu_3LK7Qj9qSYW8oR=21u5zDz2UbdSe6oV8s6hHQ_COXVxA@mail.gmail.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 7 Apr 2020 20:40:18 +0200
Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:

> Hi Paul
> 
> Thanks for your review, It has been already merged, but if there is
> something wrong we can send a patch fixing it.
> 
> https://git.openembedded.org/openembedded-core/commit/?id=36993eea89d1c011397b7692b9b8d61b499d0171
> 
> On Tue, Apr 7, 2020 at 8:13 PM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Fri, 3 Apr 2020 21:53:39 +0200
> > Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
> >  
> > > ping?  
> >
> > I think that '../pseudo' should not be used here. I'll explain inline...
> >  
> > > >
> > > > This results in a rootfs owned by the user that is running the wic
> > > > command (usually UID 1000), which makes some rootfs unbootable.
> > > >
> > > > To fix this we copy the content of the pseudo folders to the new folder
> > > > and modify the pseudo database using the "pseudo -B" command.
> > > >
> > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > > ---
> > > >  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++---
> > > >  1 file changed, 19 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> > > > index 705aeb5563..40419a64b3 100644
> > > > --- a/scripts/lib/wic/plugins/source/rootfs.py
> > > > +++ b/scripts/lib/wic/plugins/source/rootfs.py
> > > > @@ -16,11 +16,11 @@ import os
> > > >  import shutil
> > > >  import sys
> > > >
> > > > -from oe.path import copyhardlinktree
> > > > +from oe.path import copyhardlinktree, copytree
> > > >
> > > >  from wic import WicError
> > > >  from wic.pluginbase import SourcePlugin
> > > > -from wic.misc import get_bitbake_var
> > > > +from wic.misc import get_bitbake_var, exec_native_cmd
> > > >
> > > >  logger = logging.getLogger('wic')
> > > >
> > > > @@ -44,6 +44,15 @@ class RootfsPlugin(SourcePlugin):
> > > >
> > > >          return os.path.realpath(image_rootfs_dir)
> > > >
> > > > +    @staticmethod
> > > > +    def __get_pseudo(native_sysroot, rootfs):
> > > > +        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> > > > +        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % os.path.join(rootfs, "../pseudo")
> > > > +        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs
> > > > +        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
> > > > +        pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
> > > > +        return pseudo
> > > > +
> > > >      @classmethod
> > > >      def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
> > > >                               oe_builddir, bootimg_dir, kernel_dir,
> > > > @@ -78,9 +87,16 @@ class RootfsPlugin(SourcePlugin):
> > > >
> > > >              if os.path.lexists(new_rootfs):
> > > >                  shutil.rmtree(os.path.join(new_rootfs))
> > > > -
> > > >              copyhardlinktree(part.rootfs_dir, new_rootfs)
> > > >
> > > > +            if os.path.lexists(os.path.join(new_rootfs, "../pseudo")):  
> >
> > new_rootfs is set by the following statement a few lines above:
> >
> >     new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
> >
> > Consider that `cr_workdir` may contain multiple rootfs staging directories
> > corresponding to multiple lines in the wks file, for example if a rootfs
> > image is duplicated into multiple partitions for redundancy. In that case
> > `os.path.join(new_rootfs, "../pseudo")` will clash between these different
> > rootfs copies.
> >
> > Let's use an explicit path instead, such as:
> >
> >     new_pseudo = os.path.realpath(os.path.join(cr_workdir, "pseudo%d" % part.lineno))  
> 
> The reason to have that path was to follow the same structure as the
> real image.bb.
> 
> If there are multiple partitions on the .wic file the different
> partitions are done one by one, not
> in parallel.
> 
> So
> ../pseudo will be created  for partition1
> then it will be used to generate the partition1
> 
> ../pseudo will be deleted
> ../pseudo will be created  for partition2
> 
> Even if they use the same partition, the code works (and ../pseudo is
> useless once the partition is generated)
> 

Having these separate is important for debugging though, it lets you look
through the different copies after wic exits if something is wrong.

> >  
> > > > +                shutil.rmtree(os.path.join(new_rootfs, "../pseudo"))
> > > > +            copytree(os.path.join(part.rootfs_dir, "../pseudo"),  
> >
> > part.rootfs_dir is whatever is given as the option to `--rootfs-dir`. There
> > is no guarantee that `../psuedo` is valid or if it corresponds to the rootfs
> > directory given. It's unsafe to step up the directory tree and make
> > assumptions like this.  
> 
> I think that if we do not pass a real rootfs to the rootfs plugin it
> is an error from the user.
> 
> We can add a more beautiful error message instead of a backtrace.
> 
> Or if you believe that it is a valid usecase to not pass a rootfs then
> we can continue with a warning/debug message and explicitly telling
> the user that the permissions are going to be invalid, because what he
> is using as a roofs is an unknow directory for bitbake.

This is a valid and existing usecase. This is how data partitions are
populated and how you separate /home or another directory into its own
partiton (e.g.
https://stackoverflow.com/questions/56187209/yocto-create-and-populate-a-separate-home-partition).

> 
> I have no personal preference for any of the two, tell me what do you
> prefer (or a different option) and I will implement it.
> 
> Thans again for the review.
> 

This patch needs reverting from master/dunfell. I hope it hasn't gone into
the M4 build...

-- 
Paul Barker
Konsulko Group
