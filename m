Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web11.6785.1587245970528415384
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 14:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C2grJHQV;
 spf=pass (domain: gmail.com, ip: 209.85.167.65, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lf1-f65.google.com with SMTP id 131so4782825lfh.11
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 14:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qvWGDOr0+wr2GA6jpoZnjRY+cYJmuv/el9BfOMA1+0o=;
        b=C2grJHQVzI6eFoAFTnPhQ1BvW1tDL6lFs0qSURLDXRu5oYAld702raWoWiBDlIZyFy
         5ppfXhCI/RRmH5vY9pnrxq02m2IBFYr0gb1VpLcUfxhknc5Ssap3hPEqt1Z8puRFSUEE
         VdgrXFIXjTAp4T4RABYkKC2sifuXM+p4NF2CO+Z9mF+cPptsNyDOuSmp3eD7YaazYuwP
         3AtcSsIDILZ8dCgJ+3me+AcDDOVlRajJqroHAMIGZ/vYmAB9JUE1kvcufEQkqUFy5l7a
         U/J/d92cgVBE0Ah+lN726lwlEeMumkTdZOyR2+j7FbHZqUCe/kcrOz0kBeHsZYyG09ZH
         iAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qvWGDOr0+wr2GA6jpoZnjRY+cYJmuv/el9BfOMA1+0o=;
        b=GKMR4GZl7SZlJsGMeE87jT6wwuFcXniHXGiTxJMpx6lnQmFORm2H7tRzhX+1kYgOmG
         xT55C0ceRecUq3Kzc9zl9IS2ap8ibUP//wQv7UFLFgbw9y/NnDQvzTq/xmBPWiZKxbyJ
         G/HZTQSmmz8RN7ycK6X9aihh4IvCIl9B13pwoFGh8zGpnVdxolpvMeclpszsVrrCjlsu
         YFmJx+NDzDeSwBmy4N40sVXW69sd1fQH2lbnnHh8JHvEzDuxUWI2pBy2LwRFBWJ6O9ZZ
         M4KqGX9uKg8T1M3vjYyYm87nuSPovgfUuPffXkcZCwEwDXv6lufMddUmLJ1rJkVc72m4
         +KgQ==
X-Gm-Message-State: AGi0PuaSRlaVV1sUsasybBHJAgBNYnrnCdRkkc4Qpm+X7MoFxHoLXd95
	xsKspvXLMsSLfmfRnVjT5g/+/AvuQMpZJGRt19w=
X-Google-Smtp-Source: APiQypKr1gQ6aIFeqpYffglss4jWW73U1KD2ryVrzl7m2Pe3B6BbOcScnMMCoB/sPY7nu2OUqqFiKkXvmzVayWezeAo=
X-Received: by 2002:ac2:46d3:: with SMTP id p19mr5694663lfo.72.1587245968606;
 Sat, 18 Apr 2020 14:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200414133614.1830058-1-ricardo@ribalda.com> <20200414133614.1830058-11-ricardo@ribalda.com>
 <20200418211046.01deeb05@ub1910> <1607034A6B86A480.2683@lists.openembedded.org>
In-Reply-To: <1607034A6B86A480.2683@lists.openembedded.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Sat, 18 Apr 2020 23:39:12 +0200
Message-ID: <CAPybu_2QVBm95iWpBAD9YxShaOXF9o-oN3D-oFgD5Z_MK9Q70g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6 10/10] oeqa: wic: Add more tests for include_path
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Paul Barker <pbarker@konsulko.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi again

On Sat, Apr 18, 2020 at 10:16 PM Ricardo Ribalda via
lists.openembedded.org
<ricardo.ribalda=gmail.com@lists.openembedded.org> wrote:
>
>  Hi Paul
>
>
>
> On Sat, Apr 18, 2020 at 10:10 PM Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Tue, 14 Apr 2020 15:36:14 +0200
> > Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:
> >
> > > Make sure permissions are respected.
> > >
> > > Add new test for orig/destination option.
> > >
> > > Cc: Paul Barker <pbarker@konsulko.com>
> > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > ---
> > >  meta/lib/oeqa/selftest/cases/wic.py | 64 ++++++++++++++++++++++++++++-
> > >  1 file changed, 63 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> > > index 8ef08c3d77..1036269b64 100644
> > > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > > @@ -486,15 +486,77 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
> > >              res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
> > >              files = extract_files(res.output)
> > >              self.assertNotIn('test-file', files)
> > > +            self.assertEqual(True, files_own_by_root(res.output))
> > >
> > > -            # Test partition 2, should not contain 'test-file'
> > > +            # Test partition 2, should contain 'test-file'
> > >              res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part2))
> > >              files = extract_files(res.output)
> > >              self.assertIn('test-file', files)
> > > +            self.assertEqual(True, files_own_by_root(res.output))
> > >
> > >          finally:
> > >              os.environ['PATH'] = oldpath
> > >
> > > +    def test_include_path_embeded(self):
> > > +        """Test --include-path wks option."""
> > > +
> > > +        oldpath = os.environ['PATH']
> > > +        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
> > > +
> > > +        try:
> > > +            include_path = os.path.join(self.resultdir, 'test-include')
> > > +            os.makedirs(include_path)
> > > +            with open(os.path.join(include_path, 'test-file'), 'w') as t:
> > > +                t.write("test\n")
> > > +            wks_file = os.path.join(include_path, 'temp.wks')
> > > +            with open(wks_file, 'w') as wks:
> > > +                rootfs_dir = get_bb_var('IMAGE_ROOTFS', 'core-image-minimal')
> > > +                wks.write("""
> > > +part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-image-minimal-mtdutils export/"""
> > > +                          % (include_path))
> > > +            runCmd("wic create %s -e core-image-minimal -o %s" \
> > > +                                       % (wks_file, self.resultdir))
> > > +
> > > +            part1 = glob(os.path.join(self.resultdir, 'temp-*.direct.p1'))[0]
> > > +
> > > +            res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
> > > +            files = extract_files(res.output)
> > > +            self.assertIn('test-file', files)
> > > +            self.assertEqual(True, files_own_by_root(res.output))
> > > +
> > > +            res = runCmd("debugfs -R 'ls -p /export/etc/' %s 2>/dev/null" % (part1))
> > > +            files = extract_files(res.output)
> > > +            self.assertIn('shadow', files)
> >
> > This fails if `shadow` isn't part of the image:
> >
> > 2020-04-18 21:00:01,411 - oe-selftest - INFO - test_include_path_embeded (wic.Wic)
> > 2020-04-18 21:00:14,102 - oe-selftest - INFO -  ... FAIL
> > 2020-04-18 21:00:14,103 - oe-selftest - INFO - Traceback (most recent call last):
> >   File "/home/pbarker/Projects/Yocto/poky/meta/lib/oeqa/selftest/cases/wic.py", line 529, in test_include_path_embeded
> >     self.assertIn('shadow', files)
> > AssertionError: 'shadow' not found in [...]
>
> I though I could assume that /etc/shadow was always part of
> core-image-minimal and core-image-minimal-mtdutil. Shall I simply
> change it to /etc/passwd?
> How did you managed to trigger the error?
>
> Thanks
>
Nevermind, I managed to replicate it wit the current master.

Thanks for catching it up. will fix all and resend.

> >
> > > +            self.assertEqual(True, files_own_by_root(res.output))
> > > +
> > > +        finally:
> > > +            os.environ['PATH'] = oldpath
> > > +
> > > +    def test_include_path_errors(self):
> > > +        """Test --include-path wks option error handling."""
> > > +        wks_file = 'temp.wks'
> > > +
> > > +        # Absolute argument.
> > > +        with open(wks_file, 'w') as wks:
> > > +            wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils /export")
> > > +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> > > +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> > > +        os.remove(wks_file)
> > > +
> > > +        # Argument pointing to parent directory.
> > > +        with open(wks_file, 'w') as wks:
> > > +            wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils ././..")
> > > +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> > > +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> > > +        os.remove(wks_file)
> > > +
> > > +        # 3 Argument pointing to parent directory.
> > > +        with open(wks_file, 'w') as wks:
> > > +            wks.write("part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils export/ dummy")
> > > +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
> > > +                                      % (wks_file, self.resultdir), ignore_status=True).status)
> > > +        os.remove(wks_file)
> > > +
> > >      def test_exclude_path_errors(self):
> > >          """Test --exclude-path wks option error handling."""
> > >          wks_file = 'temp.wks'
> >
> >
> >
> > --
> > Paul Barker
> > Konsulko Group
> >
>
>
>
> --
> Ricardo Ribalda
> 



-- 
Ricardo Ribalda
