Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.1346.1589353958816240740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 00:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hvJfuF8Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id u15so16553162ljd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 00:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZjYtkLL9eNg+/IM5nqjVXBZUQg7J/9YtMIS7l8axQoU=;
        b=hvJfuF8Yn1ans0/W4HlfKf3NH/zC2n4RRHpMkEGqVHLgG8FrKBA0s0cW97Na7anhv4
         JN0o4unWA8hWd7sAWrcjexSngitrJ7fU8VK79OuqKCAvGbNo4dsOTPipxzKv2/59R1kE
         luvftqyySEdvPgnVhbmattAIsH/UmEzZDEeFYaJGdC83a1PmKgEG4hDsXjAmt9N+wd4L
         eXd1UK1bpQzp7DCzcWoipWwSEup3FOs+01JOMaTnbYyKMWG41Sys/OpKwhJs+6v3XkWn
         l1DFFjDza1hlRfYDfBdbWfOuwHyZjUgLBTQfr2sWUMg7yPRHc9KiRo36BsB18GbNGgM4
         tjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZjYtkLL9eNg+/IM5nqjVXBZUQg7J/9YtMIS7l8axQoU=;
        b=r6cWAOan5angWtqxKqsXKrX9Eoow1rgC/Ie0LKo7v6qPHTTdfRJRg/hcfx+bIpgvmY
         VnMwWKlCKw5psrrwXeQX5ogcGVR8rCvITswIJ10e1YmoN/snaR6AawMxdKjujZprXLqH
         4lnq4AtMv5artkp8OZMUjNO7FVO6BhB0rKBCXsLx3PfUwvkGG6zLCILfMBkc3ZM2Z4ZY
         JTvgS9mBYjlUvAY85hGg9qy/STX4kd1lOqSngO5OR7GJt3GGiSiPTnCsXAcSYvCc5sDA
         DQ3iHELBJbkFE6tPokU/eOY5BauMZHX4Ec6k2GFAJyNY4bAhyzvP3sUgvPL7cMVi1XHR
         zTqQ==
X-Gm-Message-State: AOAM533+gmgrRUxsvHqdgxUNx5si8RvJ2ktjwcZUDCxX0JFihXf5pQnF
	+FoS3OmMZe1i4EiJtt6bXC4v7ddL43ziYnxrK30=
X-Google-Smtp-Source: ABdhPJyvp70p7n9KEubzkN6q5no+y4Bf1zXl/+bE1485fjUv3aACiYV//gzD1iCQtxROqMB1o8mqycnQTHrYXAhnWqI=
X-Received: by 2002:a2e:9984:: with SMTP id w4mr14398019lji.286.1589353956874;
 Wed, 13 May 2020 00:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200424133032.7181-1-ricardo@ribalda.com> <CABcZANkfogiK1+DoZ4r4RFr_mNpBySa69o0ZeTrTUvwu6DJRYg@mail.gmail.com>
 <CAPybu_1iontd3rYTx52Tqhs3TxVWF0J1nkO5P3LhywxNJJb8_Q@mail.gmail.com>
In-Reply-To: <CAPybu_1iontd3rYTx52Tqhs3TxVWF0J1nkO5P3LhywxNJJb8_Q@mail.gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Wed, 13 May 2020 09:12:20 +0200
Message-ID: <CAPybu_2RxmP8VAAASvG=FDToHcyX6wDNcynB_YS8V1VyMiQiGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] RFC wic: Support .wks files for multiple machines
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Henrik Andersen <henrik@newtec.dk>
Content-Type: text/plain; charset="UTF-8"

Hi

Even if it does not cover all the use cases. Can we consider this patch?

Thanks!

On Sat, Apr 25, 2020 at 11:29 PM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
> Hi Christopher
>
> On Fri, Apr 24, 2020 at 5:56 PM Christopher Larson <kergoth@gmail.com> wrote:
> >
> > This will only work the way you expect if hte user's local.conf uses ?= or ??= for MACHINE, otherwise setting it in the environment will do nothing.
> >
>
> Good catch, You are right :(,
>
> Any idea of how could I fix it. I think I would have to change
> site.conf, or local.conf from wic, and I do not want to do that.
>
> Ignoring this bug we are still covering a big number of usecases:
>
> - bibake
> - wic with user provided rootfs-dir
> - wic without userprovided rootfs-dir and ?= or ??=
>
> At the end of the day this is just a RFC ;), so i am open to any
> implementation. I would love to hear your thoughts
>
> Best regards
>
>
>
> > On Fri, Apr 24, 2020 at 6:30 AM Ricardo Ribalda <ricardo.ribalda@gmail.com> wrote:
> >>
> >> If you want to make a disk image containing rootfs for different
> >> machines, the only way to do it today is by calling wic and passing the
> >> different rootfs-paths.
> >>
> >> Eg:
> >> combined.wks
> >> part /export --source rootfs --rootfs-dir=target-image
> >> part / --source rootfs
> >>
> >> bitbake multiconfig:arm:target-image
> >> wic create combined --rootfs-dir target-image=/workdir/build/tmp/work/arm-poky-linux/target-image/1.0-r0/rootfs/ -e main
> >>
> >> This has many drawbacks:
> >> 1) You need to know the folder location for the target-image
> >> 2) It is easy to forget updating the target (only running wic and not
> >>    bitbake)
> >> 3) It is slow
> >> 4) It does not scale when you have multiple machines
> >>
> >> Instead, wic can be given a hint of what machine to search for:
> >>
> >> combined.wks
> >> part /export --source rootfs --rootfs-dir=arm:target-image
> >> part / --source rootfs
> >>
> >> bitbake main
> >>
> >> If we ensoure the dependency of target-image from main via
> >> do_image[mcdepends], all the dependencies are automatically
> >> handled.
> >>
> >> This patch makes wic aware of the machine to use.
> >>
> >> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> >> ---
> >>  scripts/lib/wic/misc.py | 16 +++++++++++++---
> >>  1 file changed, 13 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
> >> index 91975ba151..51b43b49aa 100644
> >> --- a/scripts/lib/wic/misc.py
> >> +++ b/scripts/lib/wic/misc.py
> >> @@ -206,7 +206,12 @@ class BitbakeVars(defaultdict):
> >>
> >>          if image not in self:
> >>              if image and self.vars_dir:
> >> -                fname = os.path.join(self.vars_dir, image + '.env')
> >> +                if image.find(":") != -1:
> >> +                    [machine, img] = image.split(":")
> >> +                    fname = os.path.join(self.vars_dir, "../../",
> >> +                                         machine, "imgdata", img + '.env')
> >> +                else:
> >> +                    fname = os.path.join(self.vars_dir, image + '.env')
> >>                  if os.path.isfile(fname):
> >>                      # parse .env file
> >>                      with open(fname) as varsfile:
> >> @@ -220,11 +225,16 @@ class BitbakeVars(defaultdict):
> >>                  # Get bitbake -e output
> >>                  cmd = "bitbake -e"
> >>                  if image:
> >> -                    cmd += " %s" % image
> >> +                    if image.find(":") != -1:
> >> +                        [machine, img] = image.split(":")
> >> +                        cmd = "MACHINE=%s %s" % (machine, cmd)
> >> +                    else:
> >> +                        img = image
> >> +                    cmd += " %s" % img
> >>
> >>                  log_level = logger.getEffectiveLevel()
> >>                  logger.setLevel(logging.INFO)
> >> -                ret, lines = _exec_cmd(cmd)
> >> +                ret, lines = _exec_cmd(cmd, as_shell=True)
> >>                  logger.setLevel(log_level)
> >>
> >>                  if ret:
> >> --
> >> 2.26.1
> >>
> >> 
> >
> >
> >
> > --
> > Christopher Larson
> > kergoth at gmail dot com
> > Founder - BitBake, OpenEmbedded, OpenZaurus
> > Senior Software Engineer, Mentor Graphics
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
