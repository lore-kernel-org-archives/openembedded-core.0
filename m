Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.2923.1622831076724495573
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 11:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DTjvMJws;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id ho18so4903535ejc.8
        for <Openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 11:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YTFa/PPQPV9M9c4Es4lFXJh8gDZXaa9sDXi4ygAtfjg=;
        b=DTjvMJwse0OsxbDtJnjXiiHaPw3X6dETvUeP2LMm0fF8TBXrcLCs62WOLg7ipksv1I
         qVoCGTq2DQZtq+MXZZaspUYvKbuID9DewDEe/hsCQPN1qQsFxRPYLio/opEkTnpVg2xo
         S/Xx+cjJiT/gdvJUco5WLmwTGLabV25crtFbDtPAhrEQ7fnnZm13wZTBbrmyXCJueh5s
         v6nFMdY6GPhlMuMIw54RULhqA8eS8HicvHKFKkXdQ01tg9z1uwh5M/lB/N1I3gruvP+R
         js9NlIh4wU91AW4fMvJKfVtdYjhkpmoK7tV5Sen9c7eP12WNxu74ms3pDHZHxY/ea4hL
         kakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YTFa/PPQPV9M9c4Es4lFXJh8gDZXaa9sDXi4ygAtfjg=;
        b=f0FMDZtqGqlpPZpUJyheRQwJGlikuE3bNlSsEr7EsxhDaIu+9/J6UDbKNz9PBfAuA2
         slPlNA2sBGYpZZh4JRs43NwJ44Nrhog63xis9cc3Nku9OYECOkbpkRVG3yDkEWN8RCdM
         FH8kmypyOuyuAd4tI0DXVozjwa+rQKhsqM9C/7kblfIFPo4D1GPlGJo6d0uVmFa15cW9
         CzH1UcrRmdkbTk1lnBjnHVhNQl++7A085AR2gWO3uFCv5Vti5+2nyxgdGTftJaEBbw8r
         dv4XVQC7baTOArcKVfsN8VAwoA9HbamQg9Is4AjmHZTk7wMcSxGFv78Y807J2k173sLU
         MYtg==
X-Gm-Message-State: AOAM531dP3ZSu4bX53z0OhVFcFjCRjXE90IpKxeOJ9wnX+VwMCbgXyFH
	xGnuFDyY/DodSiaWCHVz2TQM3+g+Qmzt5ULTH8k=
X-Google-Smtp-Source: ABdhPJx6jv02r08UxbGGhpFs0eT1gCWG/dS+r9K01wgK+cllydBL5poI7GysQc0wirheLpRR8SQ3+FQAeQBdZBHQoyU=
X-Received: by 2002:a17:906:b0c9:: with SMTP id bk9mr5463879ejb.517.1622831074855;
 Fri, 04 Jun 2021 11:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210603142106.115932-1-uvv.mail@gmail.com> <CADkTA4PF=kie6Q=sqUkZjyX=NB-yq5Ccqy-XryhZ6DNVgcrRFA@mail.gmail.com>
 <e661a550-5977-9ffe-f30f-98cfd2f1ac4e@gmail.com>
In-Reply-To: <e661a550-5977-9ffe-f30f-98cfd2f1ac4e@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 4 Jun 2021 14:24:23 -0400
Message-ID: <CADkTA4PWkAMsRwMOVu=_DgOZ9KJ9pKNqgVPm0Qro6OfwmYrEBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] overlayfs.bbclass: generate overlayfs mount units
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 4, 2021 at 1:22 PM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> Hi Bruce,
> Thanks for a quick feedback.
>
> > Hi Vyacheslav,
> >
> > This looks like it could be quite useful, but a few comments came to
> > mind on a really quick scan.
> >
> > Since this is systemd based, it should probably have
> > REQUIRED_DISTRO_FEATURES = "systemd", to ensure that the rest of the
> > system and packages are consistently enabled.
>
> Will include it in my v2.
>
> > As part of getting this into core, it needs some sort of test cases /
> > test suite (and one that covers the different modes you describe in
> > the class) .. so something like a test image (a user) and the tests
> > themselves.
>
> Could you please give me a few hints as to where current tests are
> stored and how to run them? Is it meta-selftest layer?

Richard can guide you better on this front than I can, but the tests
can be in a number of forms. ptests (i.e. if you create the reference
image that uses it, that recipe could have a ptest), and there are also
the lib/oeqa/selftest/ tests.

How they are fully hooked in, so they can be tested with core, I haven't
looked in a while, and might steer you wrong, So my recommendations
are to checkout those components, and follow what is on the wiki and
in the docs (https://wiki.yoctoproject.org/wiki/Oe-selftest),
https://docs.yoctoproject.org/test-manual/intro.html, etc

>
> > It really also needs a maintainer entry, since otherwise the
> > maintenance work falls to the same already overloaded folks.
>
> You mean just an entry like:
> MAINTAINER = "Vyacheslav Yurkov <uvv.mail@gmail.com>

Yep.

>
> in the class itself?
> Because meta/conf/distro/include/maintainers.inc mentions only recipe
> maintainers.

Richard could advise better on this, but yes, even if this isn't a recipe
we'd want someone to look after it if it merges to core. So if we are
breaking into a new category here, that is probably ok.

>
> > Since this is intended to be used on a per-recipe basis (at least that
> > is my understanding from reading it), what happens if two recipes
> > create conflicting overlay mounts ? or if the mentioned data.mount is
> > not present in the image ?
>
> These are good questions. I guess if two recipes would try to use the
> same mounts, then do_rootfs should simply fail the same way when two
> recipes install the same file.

Yes, the image would definitely conflict during package install in that
case. It wasn't entirely clear to me that they'd have to have exactly the
same file.

> As for handling a mount.unit, that has to be done on an image level, I
> guess. The other question is how to do that.. Perhaps a QA-hook in
> ROOTFS_POSTPROCESS_COMMAND, which checks the file existence (not
> validity though!)?

That might be feasible, assuming that it doesn't always run, or if it
always run, that it doesn't take much time.

Cheers,

Bruce

>
> Vyacheslav
>
> > Bruce
> >
> >> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> >> ---
> >>   meta/classes/overlayfs.bbclass | 132 +++++++++++++++++++++++++++++++++
> >>   1 file changed, 132 insertions(+)
> >>   create mode 100644 meta/classes/overlayfs.bbclass
> >>
> >> diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
> >> new file mode 100644
> >> index 0000000000..7fac3e696e
> >> --- /dev/null
> >> +++ b/meta/classes/overlayfs.bbclass
> >> @@ -0,0 +1,132 @@
> >> +# Class for generation of overlayfs mount units
> >> +#
> >> +# It's often desired in Embedded System design to have a read-only rootfs.
> >> +# But a lot of different applications might want to have a read-write access to
> >> +# some parts of a filesystem. It can be especially useful when your update mechanism
> >> +# overwrites the whole rootfs, but you want your application data to be preserved
> >> +# between updates. This class provides a way to achieve that by means
> >> +# of overlayfs and at the same time keeping the base rootfs read-only.
> >> +#
> >> +# Usage example.
> >> +#
> >> +# Set a mount point for a partition overlayfs is going to use as upper layer
> >> +# in your machine configuration. Underlying file system can be anything that
> >> +# is supported by overlayfs
> >> +#
> >> +#   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
> >> +#
> >> +# The class assumes you have a data.mount systemd unit defined elsewhere in your
> >> +# BSP and installed to the image.
> >> +#
> >> +# Then you can specify writable directories on a recipe base
> >> +#
> >> +#   OVERLAYFS_WRITABLE_PATHS[data] = "/usr/share/my-custom-application"
> >> +#
> >> +# To support several mount points you can use a different variable flag. Assume we
> >> +# what to have a writable location on the file system, but not interested where the data
> >> +# survive a reboot. The we could have a mnt-overlay.mount unit for a tmpfs file system:
> >> +#
> >> +#   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> >> +#   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] = "/usr/share/another-application"
> >> +
> >> +OVERLAYFS_WRITABLE_PATHS[data] ?= ""
> >> +
> >> +inherit systemd
> >> +
> >> +def strForBash(s):
> >> +    return s.replace('\\', '\\\\')
> >> +
> >> +def unitFileList(d):
> >> +    fileList = []
> >> +    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
> >> +    for mountPoint in overlayMountPoints:
> >> +        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
> >> +            fileList.append(mountUnitName(path))
> >> +            fileList.append(helperUnitName(path))
> >> +
> >> +    return fileList
> >> +
> >> +# this function is based on https://github.com/systemd/systemd/blob/main/src/basic/unit-name.c
> >> +def escapeSystemdUnitName(path):
> >> +    escapeMap = {
> >> +        '/': '-',
> >> +        '-': "\\x2d",
> >> +        '\\': "\\x5d"
> >> +    }
> >> +    return "".join([escapeMap.get(c, c) for c in path.strip('/')])
> >> +
> >> +def mountUnitName(unit):
> >> +    return escapeSystemdUnitName(unit) + '.mount'
> >> +
> >> +def helperUnitName(unit):
> >> +    return escapeSystemdUnitName(unit) + '-create-upper-dir.service'
> >> +
> >> +python do_create_overlayfs_units() {
> >> +    CreateDirsUnitTemplate = """[Unit]
> >> +Description=Overlayfs directories setup
> >> +Requires={DATA_MOUNT_UNIT}
> >> +After={DATA_MOUNT_UNIT}
> >> +DefaultDependencies=no
> >> +
> >> +[Service]
> >> +Type=oneshot
> >> +ExecStart=mkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR} && mkdir -p {DATA_MOUNT_POINT}/upper{LOWERDIR}
> >> +RemainAfterExit=true
> >> +StandardOutput=journal
> >> +
> >> +[Install]
> >> +WantedBy=multi-user.target
> >> +"""
> >> +    MountUnitTemplate = """[Unit]
> >> +Description=Overlayfs mount unit
> >> +Requires={CREATE_DIRS_SERVICE}
> >> +After={CREATE_DIRS_SERVICE}
> >> +
> >> +[Mount]
> >> +What=overlay
> >> +Where={LOWERDIR}
> >> +Type=overlay
> >> +Options=lowerdir={LOWERDIR},upperdir={DATA_MOUNT_POINT}/upper{LOWERDIR},workdir={DATA_MOUNT_POINT}/workdir{LOWERDIR}
> >> +
> >> +[Install]
> >> +WantedBy=multi-user.target
> >> +"""
> >> +
> >> +    def prepareUnits(data, lower):
> >> +        args = {
> >> +            'DATA_MOUNT_POINT': data,
> >> +            'DATA_MOUNT_UNIT': mountUnitName(data),
> >> +            'CREATE_DIRS_SERVICE': helperUnitName(lower),
> >> +            'LOWERDIR': lower,
> >> +        }
> >> +
> >> +        with open(os.path.join(d.getVar('WORKDIR'), mountUnitName(lower)), 'w') as f:
> >> +            f.write(MountUnitTemplate.format(**args))
> >> +
> >> +        with open(os.path.join(d.getVar('WORKDIR'), helperUnitName(lower)), 'w') as f:
> >> +            f.write(CreateDirsUnitTemplate.format(**args))
> >> +
> >> +    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
> >> +    for mountPoint in overlayMountPoints:
> >> +        for lower in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
> >> +            prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint), lower)
> >> +}
> >> +
> >> +# we need to generate file names early during parsing stage
> >> +python () {
> >> +    unitList = unitFileList(d)
> >> +    for unit in unitList:
> >> +        d.appendVar('SYSTEMD_SERVICE_' + d.getVar('PN'), ' ' + unit);
> >> +        d.appendVar('FILES_' + d.getVar('PN'), strForBash(unit))
> >> +
> >> +    d.setVar('OVERLAYFS_UNIT_LIST', ' '.join([strForBash(s) for s in unitList]))
> >> +}
> >> +
> >> +do_install_append() {
> >> +    install -d ${D}${systemd_system_unitdir}
> >> +    for unit in ${OVERLAYFS_UNIT_LIST}; do
> >> +        install -m 0444 ${WORKDIR}/${unit} ${D}${systemd_system_unitdir}
> >> +    done
> >> +}
> >> +
> >> +addtask create_overlayfs_units before do_install
> >> --
> >> 2.28.0
> >>
> >>
> >> 
> >>
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
