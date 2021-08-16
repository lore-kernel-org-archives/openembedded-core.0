Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.21190.1629101122289901578
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 01:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=aXAlmZ0q;
 spf=pass (domain: qtec.com, ip: 209.85.167.54, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f54.google.com with SMTP id r9so23262758lfn.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 01:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xub/PQO9qu+txh1vxj7/Tfl3a6lwjUjlu8FuYzzzq/Y=;
        b=aXAlmZ0q2Yxzf0ASzqmaLlnHHhytVvj59eMUDAzzl0+9gKMLChRJMdJ8OTeZJb9LBE
         raAaEI5x8hHYiko9MFtMrRgNJHLWSzOPMvKsnqnjxfMFb6vvn/+Ucz2q4bfYHpoAg4Re
         iv50N+lNMnWQzUl2lJAEOL5RXx/6ZnCSD8E7xshOABmbDQrsi28pNnkgnBjciE1yiL/R
         WEGnvunz0o8RUxDUV71A5U7B6c8DlR1cpbpJhAzHHmEZ6DvggUerF4XvfcDalKJjkWpm
         G5g8Khuqeblm8j+DH1+RjnIYW8xDM6X7kJ2ieP2vKj3xCqwOaV2eLCSelbfUhFSLxPen
         ZZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xub/PQO9qu+txh1vxj7/Tfl3a6lwjUjlu8FuYzzzq/Y=;
        b=TPmyOZ31qgP5R0hbcWLAUEqoHDrYMcAOVMzcWjn1ku4ODME7wAG7U/RHQ57LFz/g/r
         vrf503OU0D34Y2GL0sneTLgWrGwGti7qku/F6t7wp5eBLXhCWhLLJluB1maQcw7L/Jno
         Ayd3k7SZEkcWnl8KyezSNDkxXSktC4cHS1fNo8VgzAL9KJLCU02blRlFmEsf4tjP5tEO
         lYixvqfGvLlnBLHYX6ytdvDe26P4qISVw/XDWqbF2ARpndIqIyF3D4ZZI0xSDiDtBfgk
         3ATq898Pd8c+zVC+nTYSrr6NTO6awmbTA6N2RkRZCbEW0kYKlbM3NBk4qyilkDBcn62F
         7b4g==
X-Gm-Message-State: AOAM530HyRVSjHgia5vYSWjn0c1UxrP0Y+09gXqpGd2UsykA5UgE7YWH
	X5arnprQYUvj+ljSzX5okaH/Mm4sOTJT3RwC0OaeWg==
X-Google-Smtp-Source: ABdhPJys6n4AfuY0Aaa6yb9+29fFN0vLZrx/ZcZbn4iJVUFsAqNZm7ZyHRkcc/Ql7q9Y8IkhZEx7KHIi+zdo8mXR0mU=
X-Received: by 2002:ac2:5232:: with SMTP id i18mr10406653lfl.225.1629101119423;
 Mon, 16 Aug 2021 01:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210810201101.261132-1-daniel@qtec.com> <20210810201101.261132-2-daniel@qtec.com>
 <YRVNoK+utVN0kCH4@piout.net> <169AC73A6BE1C7BA.28384@lists.openembedded.org>
In-Reply-To: <169AC73A6BE1C7BA.28384@lists.openembedded.org>
From: "Daniel Gomez" <daniel@qtec.com>
Date: Mon, 16 Aug 2021 10:05:08 +0200
Message-ID: <CAH1Ww+QFN-7ZoL3VbwLbOVY2TXVOnzj_7M2YRYgkd_Jqij6RLQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 2/2] oeqa: wic: Add tests for --no-fstab-update
To: Daniel Gomez <daniel@qtec.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Daniel Gomez <dagmcr@gmail.com>, Paul Barker <paul@pbarker.dev>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexandre,


On Fri, 13 Aug 2021 at 07:41, Daniel Gomez via lists.openembedded.org
<daniel=qtec.com@lists.openembedded.org> wrote:
>
> Hi Alexandre,
>
> On Thu, 12 Aug 2021 at 18:34, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello,
> >
> > On 10/08/2021 22:11:01+0200, Daniel Gomez wrote:
> > > Add tests for the --no-fstab-update wic part command.
> > >
> > > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > > ---
> > >  meta/lib/oeqa/selftest/cases/wic.py | 56 +++++++++++++++++++++++++++++
> > >  1 file changed, 56 insertions(+)
> > >
> > > diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> > > index 2efbe514c1..a58360851a 100644
> > > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > > @@ -11,6 +11,7 @@
> > >  import os
> > >  import sys
> > >  import unittest
> > > +import hashlib
> > >
> > >  from glob import glob
> > >  from shutil import rmtree, copy
> > > @@ -686,6 +687,61 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
> > >                                        % (wks_file, self.resultdir), ignore_status=True).status)
> > >          os.remove(wks_file)
> > >
> > > +    def test_no_fstab_update(self):
> > > +        """Test --no-fstab-update wks option."""
> > > +
> > > +        oldpath = os.environ['PATH']
> > > +        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
> > > +
> > > +        # Get stock fstab from base-files recipe
> > > +        bitbake('base-files')
> > > +        bf_fstab = os.path.join(get_bb_var('WORKDIR', 'base-files'),'image/etc/fstab')
> > > +        bf_fstab_md5sum = runCmd('md5sum %s 2>/dev/null' % bf_fstab).output.split(" ")[0]
> > > +
> >
> > This failed on the autobuilders:
> >
> >   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/wic.py", line 699, in test_no_fstab_update
> >     bf_fstab_md5sum = runCmd('md5sum %s 2>/dev/null' % bf_fstab).output.split(" ")[0]
> >   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/commands.py", line 207, in runCmd
> >     raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
> > AssertionError: Command 'md5sum /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-15202/tmp/work/qemux86_64-poky-linux/base-files/3.0.14-r89/image/etc/fstab 2>/dev/null' returned non-zero exit status 1:
> >
> > Full log here:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/2374/steps/14/logs/stdio
>
> Thanks for letting me know. I'll take a look.

I can't replicate the problem in my setup ('master' branch for bitbake
and openembedded core; 'qemux86-64' machine) . Could it be possible to
get the environment variables for the build?

The problem comes when executing the first md5sum command:

1. bitbake 'base-files' recipe.
2. Get the 'WORKDIR' for 'base-files' recipe.
3. Do 'md5sum' for the 'WORKDIR' + 'image/etc/fstab' file.

md5sum /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-15202/tmp/work/qemux86_64-poky-linux/base-files/3.0.14-r89/image/etc/fstab

If the file does not exist, md5sum will return the same '1' status
(assuming that's the error). Could this be bause the '${WORKDIR} +
image' for the 'base-files' recipe is located under another directory?
Could we get access to that directory to know if the file was present
there?

If that's the case, I could replace the command to be executed with
one of the following environment variables:
D="/workdir/openembedded-core/build/tmp-glibc/work/qemux86_64-oe-linux/base-files/3.0.14-r89/image"
PKGD="/workdir/openembedded-core/build/tmp-glibc/work/qemux86_64-oe-linux/base-files/3.0.14-r89/package"
PKGDEST="/workdir/openembedded-core/build/tmp-glibc/work/qemux86_64-oe-linux/base-files/3.0.14-r89/packages-split"

Otherwise, any ideas or suggestions?

Thanks

>
> >
> > > +        try:
> > > +            no_fstab_update_path = os.path.join(self.resultdir, 'test-no-fstab-update')
> > > +            os.makedirs(no_fstab_update_path)
> > > +            wks_file = os.path.join(no_fstab_update_path, 'temp.wks')
> > > +            with open(wks_file, 'w') as wks:
> > > +                wks.writelines(['part / --source rootfs --fstype=ext4 --label rootfs\n',
> > > +                                'part /mnt/p2 --source rootfs --rootfs-dir=core-image-minimal ',
> > > +                                '--fstype=ext4 --label p2 --no-fstab-update\n'])
> > > +            runCmd("wic create %s -e core-image-minimal -o %s" \
> > > +                                       % (wks_file, self.resultdir))
> > > +
> > > +            part_fstab_md5sum = []
> > > +            for i in range(1, 3):
> > > +                part = glob(os.path.join(self.resultdir, 'temp-*.direct.p') + str(i))[0]
> > > +                part_fstab = runCmd("debugfs -R 'cat etc/fstab' %s 2>/dev/null" % (part))
> > > +                part_fstab_md5sum.append(hashlib.md5((part_fstab.output + "\n\n").encode('utf-8')).hexdigest())
> > > +
> > > +            # '/etc/fstab' in partition 2 should contain the same stock fstab file at base-file recipe.
> > > +            self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
> > > +
> > > +            # '/etc/fstab' in partition 1 should contain an updated fstab file.
> > > +            self.assertNotEqual(bf_fstab_md5sum, part_fstab_md5sum[0])
> > > +
> > > +        finally:
> > > +            os.environ['PATH'] = oldpath
> > > +
> > > +    def test_no_fstab_update_errors(self):
> > > +        """Test --no-fstab-update wks option error handling."""
> > > +        wks_file = 'temp.wks'
> > > +
> > > +        # Absolute argument.
> > > +        with open(wks_file, 'w') as wks:
> > > +            wks.write("part / --source rootfs --fstype=ext4 --no-fstab-update /etc")
> > > +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> > > +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> > > +        os.remove(wks_file)
> > > +
> > > +        # Argument pointing to parent directory.
> > > +        with open(wks_file, 'w') as wks:
> > > +            wks.write("part / --source rootfs --fstype=ext4 --no-fstab-update ././..")
> > > +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> > > +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> > > +        os.remove(wks_file)
> > > +
> > >  class Wic2(WicTestCase):
> > >
> > >      def test_bmap_short(self):
> > > --
> > > 2.30.2
> > >
> >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> Daniel
>
> 
>
