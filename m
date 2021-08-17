Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web08.44857.1629231497315745483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 13:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=Dg9+mFpd;
 spf=pass (domain: qtec.com, ip: 209.85.208.180, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f180.google.com with SMTP id q21so799536ljj.6
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 13:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bqAsayJAnb9saeF59oOPOQh/Img6U7zo9WeNGRuHshY=;
        b=Dg9+mFpdmHSHRLvLdkDVC6zR0cwo0O4SMnKty0ulwSOAjf/w4llTVFTVMgd91TaE5f
         AY+7PY1bLgNiVExAishC+hGAlgoeo6Opr/9Y/cMQfaDaEOEebU7vgfGxCiyrQX+0L+sO
         T4mJ3gFTK+EpyJwDE5CjbnZ5wNVTIDTN/TpF8MFRBz+KmoCpD5WNYDBXpd+pzkyeQ+Cb
         75m/exw56Ti11sNEy0GLXiOUnJAqagP/9jC/0OtVE3YQMa8jdmjxiUWtV1mT+ErLSVzA
         M7dVAcj9JlR5AY1slCHN4u/LDn3XDS6QgV8Kx90E+To0Sjp9ZvJGenICz5ijzGQkCdTW
         SOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bqAsayJAnb9saeF59oOPOQh/Img6U7zo9WeNGRuHshY=;
        b=f1s1F1y7ibhY3eCtsmGwbPI7V1dTqAAejxF98+QfWSlVlRZkr/FGhGrmCsAW7DTPq/
         YxU4U73UQLiTnWtnkE/iRbX4hYcJVyIG1Rhe2zdjSfh+CO/MQuArWhNWmbfssXtGfTUB
         qNFyroC1xEnBpy3KO3wVHojy7sEwmcfCuiBLeiUlJxrBy/f0g1cGT9VPs2crMaB3Y54o
         wjn04jmgdbqb1G7cinC0P1bWT6RU1gWJmldmDv8XTkB9+ZGkJ+vyngtlvSxgMTLc0Q9v
         ajmpU7R4epqZ5eyZVyGq0O8Z/Qajg73Os3sWWArPBC4c0s6/XP/cUYwNzn1iAB5e0+Dy
         Nw3g==
X-Gm-Message-State: AOAM5318hJVF71lshI2ULZJ7y/GmfjGot0FH029RCuytZH+xOHaD70ke
	Wgkuibw5EdhEJ779qPFK7I6BJT3LYWi/LuwAgMO0aw==
X-Google-Smtp-Source: ABdhPJyYoQ4FC7gmjjGJUfvQ+vzkPoL0KeMgFDNbXEDvsTelJwxs6dGtQ/0wqsF7S7tTzaWoLyJ6vJkqOfXkVHRQNds=
X-Received: by 2002:a2e:9455:: with SMTP id o21mr4728487ljh.103.1629231494584;
 Tue, 17 Aug 2021 13:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210810201101.261132-1-daniel@qtec.com> <20210810201101.261132-2-daniel@qtec.com>
 <YRVNoK+utVN0kCH4@piout.net> <169AC73A6BE1C7BA.28384@lists.openembedded.org>
 <CAH1Ww+QFN-7ZoL3VbwLbOVY2TXVOnzj_7M2YRYgkd_Jqij6RLQ@mail.gmail.com> <YRu7AnMQZY5PysWi@piout.net>
In-Reply-To: <YRu7AnMQZY5PysWi@piout.net>
From: "Daniel Gomez" <daniel@qtec.com>
Date: Tue, 17 Aug 2021 22:18:03 +0200
Message-ID: <CAH1Ww+SX-OS0JQzKXvFtQjphK3_X+k5Mz7iEK+5bNKF9n=+PfQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 2/2] oeqa: wic: Add tests for --no-fstab-update
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Daniel Gomez <dagmcr@gmail.com>, 
	Paul Barker <paul@pbarker.dev>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 17 Aug 2021 at 15:34, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> On 16/08/2021 10:05:08+0200, Daniel Gomez wrote:
> > Hi Alexandre,
> >
> >
> > On Fri, 13 Aug 2021 at 07:41, Daniel Gomez via lists.openembedded.org
> > <daniel=qtec.com@lists.openembedded.org> wrote:
> > >
> > > Hi Alexandre,
> > >
> > > On Thu, 12 Aug 2021 at 18:34, Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > On 10/08/2021 22:11:01+0200, Daniel Gomez wrote:
> > > > > Add tests for the --no-fstab-update wic part command.
> > > > >
> > > > > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > > > > ---
> > > > >  meta/lib/oeqa/selftest/cases/wic.py | 56 +++++++++++++++++++++++++++++
> > > > >  1 file changed, 56 insertions(+)
> > > > >
> > > > > diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> > > > > index 2efbe514c1..a58360851a 100644
> > > > > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > > > > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > > > > @@ -11,6 +11,7 @@
> > > > >  import os
> > > > >  import sys
> > > > >  import unittest
> > > > > +import hashlib
> > > > >
> > > > >  from glob import glob
> > > > >  from shutil import rmtree, copy
> > > > > @@ -686,6 +687,61 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
> > > > >                                        % (wks_file, self.resultdir), ignore_status=True).status)
> > > > >          os.remove(wks_file)
> > > > >
> > > > > +    def test_no_fstab_update(self):
> > > > > +        """Test --no-fstab-update wks option."""
> > > > > +
> > > > > +        oldpath = os.environ['PATH']
> > > > > +        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
> > > > > +
> > > > > +        # Get stock fstab from base-files recipe
> > > > > +        bitbake('base-files')
> > > > > +        bf_fstab = os.path.join(get_bb_var('WORKDIR', 'base-files'),'image/etc/fstab')
> > > > > +        bf_fstab_md5sum = runCmd('md5sum %s 2>/dev/null' % bf_fstab).output.split(" ")[0]
> > > > > +
> > > >
> > > > This failed on the autobuilders:
> > > >
> > > >   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/wic.py", line 699, in test_no_fstab_update
> > > >     bf_fstab_md5sum = runCmd('md5sum %s 2>/dev/null' % bf_fstab).output.split(" ")[0]
> > > >   File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/commands.py", line 207, in runCmd
> > > >     raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
> > > > AssertionError: Command 'md5sum /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-15202/tmp/work/qemux86_64-poky-linux/base-files/3.0.14-r89/image/etc/fstab 2>/dev/null' returned non-zero exit status 1:
> > > >
> > > > Full log here:
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/2374/steps/14/logs/stdio
> > >
> > > Thanks for letting me know. I'll take a look.
> >
> > I can't replicate the problem in my setup ('master' branch for bitbake
> > and openembedded core; 'qemux86-64' machine) . Could it be possible to
> > get the environment variables for the build?
> >
> > The problem comes when executing the first md5sum command:
> >
> > 1. bitbake 'base-files' recipe.
> > 2. Get the 'WORKDIR' for 'base-files' recipe.
> > 3. Do 'md5sum' for the 'WORKDIR' + 'image/etc/fstab' file.
> >
> > md5sum /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-15202/tmp/work/qemux86_64-poky-linux/base-files/3.0.14-r89/image/etc/fstab
> >
> > If the file does not exist, md5sum will return the same '1' status
> > (assuming that's the error). Could this be bause the '${WORKDIR} +
> > image' for the 'base-files' recipe is located under another directory?
> > Could we get access to that directory to know if the file was present
> > there?
> >
>
> I did run the build again and:
>
> debian10-ty-1:~$ md5sum /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-32220/tmp/work/qemux86_64-poky-linux/base-files/3.0.14-r89/image/etc/fstab
> md5sum: /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-32220/tmp/work/qemux86_64-poky-linux/base-files/3.0.14-r89/image/etc/fstab: No such file or directory
>
> debian10-ty-1:~$ ls /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-32220/tmp/work/qemux86_64-poky-linux/base-files/3.0.14-r89/
> deploy-rpms               license-destdir      source-date-epoch                        sstate-install-package_qa         sstate-install-packagedata   sstate-install-populate_sysroot  temp
> deploy-source-date-epoch  pkgdata-pdata-input  sstate-install-deploy_source_date_epoch  sstate-install-package_write_rpm  sstate-install-populate_lic  sysroot-destdir
>
> I guess the issue is that we reuse the sstate cache and so the file is
> not present at all.

Thanks for the hint. I've just sent a v3 patch where I execute
'bitbake base-files -c do_install' instead of just 'bitbake
base-files' so, I make sure the file is being installed even though
you use the sstate cache.

>
> > If that's the case, I could replace the command to be executed with
> > one of the following environment variables:
> > D="/workdir/openembedded-core/build/tmp-glibc/work/qemux86_64-oe-linux/base-files/3.0.14-r89/image"
> > PKGD="/workdir/openembedded-core/build/tmp-glibc/work/qemux86_64-oe-linux/base-files/3.0.14-r89/package"
> > PKGDEST="/workdir/openembedded-core/build/tmp-glibc/work/qemux86_64-oe-linux/base-files/3.0.14-r89/packages-split"
> >
> > Otherwise, any ideas or suggestions?
> >
> > Thanks
> >
> > >
> > > >
> > > > > +        try:
> > > > > +            no_fstab_update_path = os.path.join(self.resultdir, 'test-no-fstab-update')
> > > > > +            os.makedirs(no_fstab_update_path)
> > > > > +            wks_file = os.path.join(no_fstab_update_path, 'temp.wks')
> > > > > +            with open(wks_file, 'w') as wks:
> > > > > +                wks.writelines(['part / --source rootfs --fstype=ext4 --label rootfs\n',
> > > > > +                                'part /mnt/p2 --source rootfs --rootfs-dir=core-image-minimal ',
> > > > > +                                '--fstype=ext4 --label p2 --no-fstab-update\n'])
> > > > > +            runCmd("wic create %s -e core-image-minimal -o %s" \
> > > > > +                                       % (wks_file, self.resultdir))
> > > > > +
> > > > > +            part_fstab_md5sum = []
> > > > > +            for i in range(1, 3):
> > > > > +                part = glob(os.path.join(self.resultdir, 'temp-*.direct.p') + str(i))[0]
> > > > > +                part_fstab = runCmd("debugfs -R 'cat etc/fstab' %s 2>/dev/null" % (part))
> > > > > +                part_fstab_md5sum.append(hashlib.md5((part_fstab.output + "\n\n").encode('utf-8')).hexdigest())
> > > > > +
> > > > > +            # '/etc/fstab' in partition 2 should contain the same stock fstab file at base-file recipe.
> > > > > +            self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
> > > > > +
> > > > > +            # '/etc/fstab' in partition 1 should contain an updated fstab file.
> > > > > +            self.assertNotEqual(bf_fstab_md5sum, part_fstab_md5sum[0])
> > > > > +
> > > > > +        finally:
> > > > > +            os.environ['PATH'] = oldpath
> > > > > +
> > > > > +    def test_no_fstab_update_errors(self):
> > > > > +        """Test --no-fstab-update wks option error handling."""
> > > > > +        wks_file = 'temp.wks'
> > > > > +
> > > > > +        # Absolute argument.
> > > > > +        with open(wks_file, 'w') as wks:
> > > > > +            wks.write("part / --source rootfs --fstype=ext4 --no-fstab-update /etc")
> > > > > +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> > > > > +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> > > > > +        os.remove(wks_file)
> > > > > +
> > > > > +        # Argument pointing to parent directory.
> > > > > +        with open(wks_file, 'w') as wks:
> > > > > +            wks.write("part / --source rootfs --fstype=ext4 --no-fstab-update ././..")
> > > > > +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> > > > > +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> > > > > +        os.remove(wks_file)
> > > > > +
> > > > >  class Wic2(WicTestCase):
> > > > >
> > > > >      def test_bmap_short(self):
> > > > > --
> > > > > 2.30.2
> > > > >
> > > >
> > > >
> > > >
> > > > --
> > > > Alexandre Belloni, co-owner and COO, Bootlin
> > > > Embedded Linux and Kernel engineering
> > > > https://bootlin.com
> > >
> > > Daniel
> > >
> > > 
> > >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
