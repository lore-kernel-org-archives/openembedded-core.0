Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.11522.1618754016569097517
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 06:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EYkwv5cw;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id mh2so27355502ejb.8
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 06:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=C/fjoiex0OVfoPzi2Fu5gPCePtfnqrzOxhs06IjlEws=;
        b=EYkwv5cwqjq0ty4dG1AiphZ+R07VuW5KaMT8XwCVXtd8GESl1q+emA2fv7enGkf1ur
         GWTySfr2CILVfyPGmn/YlCb2qNOil666xF+axZyAP7JcfFqOJQbQTVdigPePzxy5+PRO
         suNGaaRD9b7cwnqqGZcsEQKqG6EQTbdfaViKNvDtXTaIupvjZ0jQTLuE51RbJhh04Ono
         Bcv17eJx62DTbfArP/m9yJdJSQ+ysmt4iT6tUr6gRUpfwp26G13ZphTmfPCTeAAOM411
         rWeOD8+qQnm5I5e8ITlhrkWXrEmlogh87+Q0M5nCwgG8mN8Q45vHkXR+M4b366sx/FA2
         lYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=C/fjoiex0OVfoPzi2Fu5gPCePtfnqrzOxhs06IjlEws=;
        b=bGuFGsY4olWA6l5iV9c99OgkjhSlp3MlkmsP/epWL8vokyHiXtgourdysjMuouWPRo
         lRP08jyT78Td0CCQfEaJJlHIQWWIr+9g6HG2O/SDyUdxpVQNLfTq/UcWJMGlAasAFvbX
         9YCRxwC5SOIb/1cgFSr1PEtllD6bujZbNSY9H34uVGuQvKGzU7/kBkr7LlRMD2+2MSCV
         LLD0tC6bqDJfWNLeZG37b0xFg+ugCCwtH+1dc9eJ4lKMhSCMR0G4k3iKJPR8/kq6HNkA
         Xepvag2kxLMUJZjA6MUkziT1ohANviXpUhkgJtelXo/A9bgD0voDj63H0eSzFUaCpLRl
         0cYA==
X-Gm-Message-State: AOAM531nRa18BDcfFELcovvxk35QGiONoDM7ELqn8MlawIbFg/vTX5p8
	E5K2tJH5hW9/SGrwaz4jJgc=
X-Google-Smtp-Source: ABdhPJxQ/daJIamJBzckFkPH1c2frYtZZahqO7t/MCS/eteYQh+9PKfR90g3la8qTRVuh47T9+PkzQ==
X-Received: by 2002:a17:906:f1cf:: with SMTP id gx15mr18146440ejb.143.1618754015094;
        Sun, 18 Apr 2021 06:53:35 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id w1sm10604624edt.89.2021.04.18.06.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 06:53:34 -0700 (PDT)
Message-ID: <8438897677c280b503ecad1bd08d172c75c18c11.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: support uImage kernel
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Apr 2021 15:53:32 +0200
In-Reply-To: <CADkTA4O9o1-ivXKjUiidMh+b7qTegDnDwV0Y_dViwCBOz7aCEg@mail.gmail.com>
References: <20210416164310.275973-1-adrian.freihofer@siemens.com>
	 <CADkTA4O9o1-ivXKjUiidMh+b7qTegDnDwV0Y_dViwCBOz7aCEg@mail.gmail.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bruce,

Thank you for asking the right questions. This patch should be ignored.

On Fri, 2021-04-16 at 14:06 -0400, Bruce Ashfield wrote:
> On Fri, Apr 16, 2021 at 12:43 PM Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
> > u-boot's uImage kernel format is not supported by Qemu. Extract the
> > kernel from the uImage to a temporary directory.
> > 
> 
> I'd suggest that we should document in the commit log why someone
> wouldn't just build a kernel image format that is already supported by
> runqemu (which is what I typically do). I'm guessing it is some sort
> of h/w boot being re-purposed to qemu emulation, and this is to avoid
> building a second kernel image ?
> 
The runqemu script explicitly checks for the uImage type. However, my
conclusion so far is that Qemu does not support this format, or at
least it is broken. I've been thinking about adding more reasonable
feedback to the user instead of just launching the uImage and running
into an infinite loop of nothing. However this would need deeper
understanding of Qemus's support for e.g. uImage format or better ctest
cases covering this use cases.

> Additionally, this should have some sort of test, or the code is going
> to bitrot due to not being run by anything in core.
The current runquem-related test cases only cover the x86_64 MACHINE.Regardless of the discussion around this patch, it might be useful to
cover more machines there as well. This would make it possible to test
some more image formats, such as uImage and fitImage, which are more
widely used on ARM machines. I will have a look at that.

Regards,
Adrian
> 
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> >  scripts/runqemu | 24 ++++++++++++++++++++++--
> >  1 file changed, 22 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/runqemu b/scripts/runqemu
> > index ba0b701aff..fa630fc7a4 100755
> > --- a/scripts/runqemu
> > +++ b/scripts/runqemu
> > @@ -163,6 +163,7 @@ class BaseConfig(object):
> >          self.bios = ''
> >          self.kernel_cmdline = ''
> >          self.kernel_cmdline_script = ''
> > +        self.temp_kernel_dir = None
> >          self.bootparams = ''
> >          self.dtb = ''
> >          self.fstype = ''
> > @@ -1422,10 +1423,26 @@ class BaseConfig(object):
> >          self.setup_serial()
> >          self.setup_vga()
> > 
> > +    def dump_uimage(self):
> > +        if self.kernel and self.get('KERNEL_IMAGETYPE') == 'uImage':
> > +            import tempfile
> > +            self.temp_kernel_dir = tempfile.mkdtemp()
> > +            kernel = os.path.join(self.temp_kernel_dir, 'image')
> > +            dumpimage_bin = os.path.join(self.bindir_native, 'dumpimage')
> > +            image_link_name = self.get('IMAGE_LINK_NAME')
> > +            logger.info('Running: %s' % str([dumpimage_bin, "-o ", kernel, self.kernel]))
> > +            staging_bindir_native = '%s/usr/bin' % self.get('STAGING_DIR_NATIVE')
> > +            dumpimage_bin = os.path.join(staging_bindir_native, 'dumpimage')
> > +            subprocess.run([dumpimage_bin, "-p", "0", "-o", kernel, self.kernel])
> > +            return kernel
> > +        return self.kernel
> > +
> >      def start_qemu(self):
> >          import shlex
> > -        if self.kernel:
> > -            kernel_opts = "-kernel %s -append '%s %s %s %s'" % (self.kernel, self.kernel_cmdline,
> > +
> > +        kernel = self.dump_uimage()
> > +        if kernel:
> > +            kernel_opts = "-kernel %s -append '%s %s %s %s'" % (kernel, self.kernel_cmdline,
> >                                                                  self.kernel_cmdline_script, self.get('QB_KERNEL_CMDLINE_APPEND'),
> >                                                                  self.bootparams)
> 
> If the kernel never fails from the dup_uimage() command, why test for
> it ? I don't see how the routine could return something that doesn't
> pass the test. If so, aren't we going to run into more cryptic errors
> (or traceback) later if there was some sort of failure.
> 
> The existing code doesn't look like it is completely error proofed
> either, that just came to mind when looking at the patch.
> 
> Bruce
> 
> >              if self.bios:
> > @@ -1481,6 +1498,9 @@ class BaseConfig(object):
> >              shutil.rmtree(self.rootfs)
> >              shutil.rmtree('%s.pseudo_state' % self.rootfs)
> > 
> > +        if self.temp_kernel_dir:
> > +            shutil.rmtree(self.temp_kernel_dir)
> > +
> >          self.cleaned = True
> > 
> >      def run_bitbake_env(self, mach=None):
> > --
> > 2.26.3
> > 
> > 
> > 
> > 
> 
> 

