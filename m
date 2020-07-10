Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.14059.1594396622655177206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 08:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pT3HBUuM;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id n26so6657329ejx.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 08:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7O+Qx150JoAsySEWmumtIXptbeWBf5uvLB/24rJIwqU=;
        b=pT3HBUuM7umafDIT9B6y4WDgXTwKDY6/kkr9LXQBdYG0doaIri0S0xskWMhp+mit35
         V5zKTOrz1hsWNYEkwyNvq0NyjgErmrRq15w6ST0UEGiLhWakmuesEQLp4XV3Uc9IKj1s
         ZC4DEQ9OqnCpbTW3W6kgxNfUnAdOl9LyVwP8gWCC4VixaNq59I3u1fxLsK9AXepxWRk5
         10WKoMUz/1zGPOPjDqkjSVyd/Mik9iC3pw1c2r59dYQceFoAxqr3XP6DVIbgR+fN7/bj
         tbmNe+PHp7OX+zIGMGjnJXAgmVboZO17bDekNpF2De+KmhICB5bUhCx1IVyw+pa4dIH4
         +Nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7O+Qx150JoAsySEWmumtIXptbeWBf5uvLB/24rJIwqU=;
        b=I2ftw9nm1r+OiZJegIbwOCp3bkELPJWaUiV7icZqHYH3gJDU1CHYzZXdN4B6iZKtZc
         ymlTYjme8MAVHLtbNY6J9Xled6Mwx5DiTwsYkVUfHF+WLnD5KDwxmba8lX6wMsfNEAOr
         J8h7+WYqtOubnGXT01VXCEE6hik5V0PRPlQYINsRoPUDsqA68jTUCvp9UbueNQ/trYFZ
         QKMfpGV2hhiU9DIECseMAd/MFz5zI/zRVLN8XQGdCojYsVoY1B/B9B27WcKvnu0CdFRO
         7JaomlgS6Nb1SWNQE29ZnYQH1ug4p3RoxPMgz1nDYS3EwYfS/PVzRfVKfFCaO5TwDAnE
         3aow==
X-Gm-Message-State: AOAM530n29IKLySjKcjbwVrBxxqFX7BXhQ11HgXYZrhiecqAsWvqSLn/
	eXiPOVtzKFsiIoZkkdQjVBdH00rSVEI6WzdLNsw=
X-Google-Smtp-Source: ABdhPJwf1pqguw5qeR7MtPMNoEWwWsbFZD+cG0XCFFNVyph7opHcXWBSbzdwddDuXe4n5totvhXvwbDmGh2TglKxGUU=
X-Received: by 2002:a17:906:1414:: with SMTP id p20mr60535527ejc.247.1594396620972;
 Fri, 10 Jul 2020 08:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200710090514.440-1-max.krummenacher@toradex.com>
 <20200710090514.440-2-max.krummenacher@toradex.com> <CADkTA4PA0N8W7+jUbV+ao__tY8Q_623=yLZ47YC=z4dD4fiGmA@mail.gmail.com>
 <CAHtQpK5GsbVg3pdNWoYtynvHjzCMMJVr7yRAx5mPQ674DS6N2g@mail.gmail.com>
 <bf4599cf6afab3338c6bdbc86855a424376d3c39.camel@gmail.com>
 <CADkTA4MDO+BCc3ZLDCTzpG6v-0F-c0BwyU068yb1CjTN84sg4A@mail.gmail.com>
 <CADkTA4P-y9n5LLFBmbwhVjV5eXqpM43oVL9KqJxzAUNS8VFZGQ@mail.gmail.com> <ffdc5289fd5629ead12ca61c865e769ef82655cf.camel@gmail.com>
In-Reply-To: <ffdc5289fd5629ead12ca61c865e769ef82655cf.camel@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 10 Jul 2020 11:56:49 -0400
Message-ID: <CADkTA4Pyb6BMV2wDdSk-MGwKr4ZA+eA0GO7obT-ZbFS=M3h7_g@mail.gmail.com>
Subject: Re: [OE-core][Patch 2/2] kernel-yocto.bbclass: force creation of config.queue
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 10, 2020 at 11:52 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> Hi Bruce
>
> Am Freitag, den 10.07.2020, 11:28 -0400 schrieb Bruce Ashfield:
> > On Fri, Jul 10, 2020 at 11:21 AM Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> > > On Fri, Jul 10, 2020 at 11:12 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > > Hi Bruce, Hi Andrey
> > > >
> > > > Am Freitag, den 10.07.2020, 15:21 +0200 schrieb Andrey Zhizhikin:
> > > > > On Fri, Jul 10, 2020 at 2:47 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > > > > On Fri, Jul 10, 2020 at 5:06 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > > > > > In the case of no patches or no configure fragments, during
> > > > > > > do_kernel_metadata() scc is not called, and thus
> > > > > > > kernel-sources/${meta_dir}/config.queue is not created.
> > > > > > > Later do_kernel_configme fails because the file is missing.
> > > > > >
> > > > > > This is a really strange case, since in tree and defconfigs go through
> > > > > > the queue.
> > > > > > How are you ending up in this situation in the first place?
> > > >
> > > > I have a kernel recipe with SRC_URI = "git://kernel-git file://defconfig"
> > > > As far as I understand it no configure fragments kick in from anywhere.
> > > > Whith that the above case is what happens, i.e. none of the variables put together to
> > > > form 'elements' have any content.
> > > >
> > > > Notably, $sccs is empty. I.e. if I add some bbwarns after the sccs assignment
> > > >
> > > >         sccs="$sccs_from_src_uri"
> > > >         bbwarn "sccs " $sccs
> > > >         bbwarn "sccs_from_src_uri " $sccs_from_src_uri
> > > >         bbwarn "sccs_defconfig " $sccs_defconfig
> > > >
> > > > I get:
> > > >
> > > >    WARNING: sccs
> > > >    WARNING: sccs_from_src_uri
> > > >    WARNING: sccs_defconfig  .../recipes-kernel/linux/linux-toradex-4.14-2.3.x/mx8/defconfig
> > > >
> > > > sccs_defconfig has been removed from the variables which form elements in commit
> > > > 23dcff0d396c (oe: e6845327b693) (kernel/yocto: ensure that defconfigs are
> > > > processed first). Was that removal not intended?
> > > > In which of the variables would you expect an out of tree defconfig to end up?
> > >
> > > It goes into the config.queue just like the rest of .scc files.
> > >
> > > The changes I made recently were only to ensure that it was at the
> > > bottom of the queue, so fragments can logically follow and adjust
> > > settings. So no, the defconfig is not removed from the processing, it
> > > has just been order adjusted.
> > >
> > > > I admit I lack the big picture of what kgit, scc and do_kernel_metadata and
> > > > friends really do, I wrote the patch under the impression that without
> > > > configuration fragments or patches one should not run scc here.
> > > >
> > > > > Can this be the same issue that was solved when defconfig is not in-tree?
> > > > >
> > > > > I guess this could happen only when the list of elements defined as:
> > > > > elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
> > > > > would contain nothing at all, which means that even a defconfig is not found...
> > > > >
> > > > > Max,
> > > > > Can you reproduce this issue from the latest master? Fix for searching
> > > > > for OOT defconfig is already merged there (see [1]).
> > > >
> > > > Yes, I can, actually without your patch the build errors out earlier.
> > > > You could reproduce it too if you removed
> > >
> > > I can build here with a defconfig only kernel, so something else is wrong.
> > >
> > > If you can send me (off list) the details of your build (your
> > > bblayers, local.conf settings), I can fire up a build and see what has
> > > gone wrong.
> >
> > Actually, I think I see the hole that this managed to sail through.
> > Can you try the attached patch ?
> >
> > It isn't the final one, since I'm also going to add a message and
> > error if no configuration elements are found, but I wanted to see if
> > this addresses the immediate issue.
>
> I don't have to test, this was actually my first approach to make the
> build succeed. I thought it to be to invasive for all the other use
> cases which I do not fully understand.
>

Aha. And right you were. It always used to be accounted for in that
test, and when I jiggled it, I missed that side effect. *sigh*

There's lots I don't like with the routines, they were written quite a
while ago and have some nasty conventions that I wouldn't use now.
Hence why I'm working on some medium size changes to it .. but there
are so many use cases I risk breaking, the effort is slow :)

> If you're working on anything that includes the effects of the attached
> patch just drop my submission. Thanks for the work.

The report was useful, so thanks for that. I'll clean up my effort and
have it in my next pull request.

Cheers,

Bruce

>
> I put a workaround for this issue in our kernel recipe, so for me there
> is no rush to have it fixed in openembedded-core.
>
> Max
>
> If anyone would need the quick and dirty workaround:
>
> +do_kernel_metadata_append () {
> +       touch ${S}/.kernel-meta/config.queue
> +}
>
> >
> > I'm actually in the midst of re-working quite a bit of this flow for
> > the fall release, so I'm trying to keep changes to a minimum at the
> > moment, since they could end up being tossed in the bin shortly.
> >
> > Bruce
> >
> > > Bruce
> > >
> > > >     SRC_URI += "file://0001-perf-Make-perf-able-to-build-with-latest-libbfd.patch"
> > > > from meta-freescale/recipes-kernel/linux/linux-imx_5.4.3.bb and rebuild that kernel e.g.
> > > >     MACHINE=imx8qmmek bitbake virtual/kernel -fc kernel_configme
> > > >
> > > > > > I'd rather not force create this, but detect the misconfiguration and
> > > > > > output a useful error message.
> > > > > >
> > > > > > Bruce
> > > >
> > > > Max
> > > >
> > > > > [1]:
> > > > > http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7dbc62a672909adce316bb4a8772be0ee9b480fe
> > > > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
