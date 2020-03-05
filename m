Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C9AE5606BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 09:32:34 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 6so662363wre.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2020 01:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=MWa1Nr8hKN/DyDdhQWz3cy+Y8ejq30IwJGBVUeLA5TE=;
	b=GsAjf872uIHTf6F379xvq77ZATKnk7IE9GG8EVeeAWQ1/5HMqhtBM8ZybZk0uoIOBA
	BzywcM1lbpCzPoCyTTffyuWJUa/xnWq0joL7ARH1EvgLrNm3ybieCPxxhHyp7njE57LB
	u6eaLSLXl2MbV9lRZE3PUUD7+foksJqz1FO5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=MWa1Nr8hKN/DyDdhQWz3cy+Y8ejq30IwJGBVUeLA5TE=;
	b=SIrjhy+NGwhbSLuSfPmgBZHxAPysOoa7YIKk5u3ewZGbqNlTx4q0ZSf1J7b1QYP+Mv
	OCOtpUDCPmjfOFY+VIOX+SccuLApEIXpt4ra/9X7BlBo4fJJtlBe/S92rDADSaEzU+V/
	w4DpRbwiIaw0n5X5LmlRXwlPra9FkvCl44eXvDZJgXnkq3vLFCpNG1PBe4ieR621qQkb
	DbVSBFLrj3k8iuCnsgpqIkUbNOmRSQCGOKK6wbR+s1Wq20Y9H4STD2GegEFMwhGHBArA
	ZonTLIGpuPZ8Z3F1ATafuWWWCV1DqIacH28T2NXl8PPC64TyTtwZ06aThSxeQT9lGAXw
	I2LA==
X-Gm-Message-State: ANhLgQ2uSmEP/FkrBUsu9N1uc8eXzs8wKYFTCndbJZT9H83U4JzoUkMT
	YzOWFkV61xyaHZEymlx2AxjbdA==
X-Google-Smtp-Source: ADFU+vt37a1CeLQspwd019UbrKuO8s74ArtLwoYKF6VN76FIdL2wTCiBJakYqbYJWYq/EPoXuL9eHQ==
X-Received: by 2002:adf:df8c:: with SMTP id z12mr8991879wrl.174.1583400755282; 
	Thu, 05 Mar 2020 01:32:35 -0800 (PST)
Received: from ub1910 ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id 25sm8426072wmg.30.2020.03.05.01.32.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 01:32:35 -0800 (PST)
Date: Thu, 5 Mar 2020 09:28:55 +0000
From: Paul Barker <pbarker@konsulko.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Message-ID: <20200305092855.1f9ccae8@ub1910>
In-Reply-To: <CAPybu_17EBoQH45Cpb+2UJ-Yoho062_5sGWAT1qmu4MPycOHBQ@mail.gmail.com>
References: <20200304083438.1022216-1-ricardo@ribalda.com>
	<20200304095334.1f20ddd9@ub1910>
	<CAPybu_17EBoQH45Cpb+2UJ-Yoho062_5sGWAT1qmu4MPycOHBQ@mail.gmail.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic: Fix permissions when using exclude or include path
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
X-List-Received-Date: Thu, 05 Mar 2020 09:32:35 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Mar 2020 11:02:47 +0100
Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:

> Hi Paul
> 
> On Wed, Mar 4, 2020 at 10:53 AM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Wed,  4 Mar 2020 09:34:37 +0100
> > Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
> >  
> > > When parameters include_path or exclude_path are passed to the rootfs
> > > plugin, it will copy the partition content into a folder and make all
> > > the modifications there.
> > >
> > > This is done using copyhardlinktree(), which does not take into
> > > consideration the content of the pseudo folder, which contains the
> > > information about the right permissions and ownership of the folders.  
> >
> > How are you running wic here? In the do_image_wic task it's executed under
> > pseudo so all this is handled already. Executing wic outside of bitbake may
> > need some more testing here.  
> 
> I am running wic outside bitbake. But even if it is run under bitbake,
> it should also fail. The pseudo directory needs to be present on the
> target image

If you're running wic outside of bitbake, is there any guarantee that pseudo
is available?

> 
> >  
> > >
> > > This results in a rootfs owned by the user that is running the wic
> > > command (usually UID 1000), which makes some rootfs unbootable.
> > >
> > > To fix this we copy the content of the pseudo folders to the new folder
> > > and modify the pseudo database using the "pseudo -B" command.
> > >
> > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > ---
> > >  scripts/lib/wic/plugins/source/rootfs.py | 22 +++++++++++++++++++---
> > >  1 file changed, 19 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> > > index 705aeb5563..40419a64b3 100644
> > > --- a/scripts/lib/wic/plugins/source/rootfs.py
> > > +++ b/scripts/lib/wic/plugins/source/rootfs.py
> > > @@ -16,11 +16,11 @@ import os
> > >  import shutil
> > >  import sys
> > >
> > > -from oe.path import copyhardlinktree
> > > +from oe.path import copyhardlinktree, copytree
> > >
> > >  from wic import WicError
> > >  from wic.pluginbase import SourcePlugin
> > > -from wic.misc import get_bitbake_var
> > > +from wic.misc import get_bitbake_var, exec_native_cmd
> > >
> > >  logger = logging.getLogger('wic')
> > >
> > > @@ -44,6 +44,15 @@ class RootfsPlugin(SourcePlugin):
> > >
> > >          return os.path.realpath(image_rootfs_dir)
> > >
> > > +    @staticmethod
> > > +    def __get_pseudo(native_sysroot, rootfs):
> > > +        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
> > > +        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % os.path.join(rootfs, "../pseudo")
> > > +        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs
> > > +        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
> > > +        pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
> > > +        return pseudo
> > > +
> > >      @classmethod
> > >      def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
> > >                               oe_builddir, bootimg_dir, kernel_dir,
> > > @@ -78,9 +87,16 @@ class RootfsPlugin(SourcePlugin):
> > >
> > >              if os.path.lexists(new_rootfs):
> > >                  shutil.rmtree(os.path.join(new_rootfs))
> > > -
> > >              copyhardlinktree(part.rootfs_dir, new_rootfs)
> > >
> > > +            if os.path.lexists(os.path.join(new_rootfs, "../pseudo")):
> > > +                shutil.rmtree(os.path.join(new_rootfs, "../pseudo"))
> > > +            copytree(os.path.join(part.rootfs_dir, "../pseudo"),
> > > +                     os.path.join(new_rootfs, "../pseudo"))  
> >
> > I don't like stepping up the directory tree like this. We should be more
> > explicit with the paths.  
> 
> You are thinking on:
> os.path.dirname(directory)

No, I'm wondering why we're taking a step up the directory tree from
`part.rootfs_dir`. I can point that at any path using the `--rootfs-dir`
argument and there's no guarantee that ../pseudo exists or is relevant to the
path I gave to `--rootfs-dir`.

> 
> >  
> > > +            pseudo_cmd = "%s -B -m %s -M %s" % (cls.__get_pseudo(native_sysroot,new_rootfs),
> > > +                                                part.rootfs_dir, new_rootfs)
> > > +            exec_native_cmd(pseudo_cmd, native_sysroot)
> > > +
> > >              for path in part.include_path or []:
> > >                  copyhardlinktree(path, new_rootfs)  
> >
> >                    ^^^^^^^^^^^^^^^^
> >
> > If this is the right approach I imagine you would also need to fix things up
> > with pseudo after the copyhardlinktree call above.  
> 
> I do not think it is needed. include_path does not contain its own
> pseudo directory

That's not necessarily true. The include_path could have been built by Yocto
using pseudo.

I can see that there is an issue using these arguments to wic outside of
bitbake but I'm not sure this is the correct solution.

-- 
Paul Barker
Konsulko Group

