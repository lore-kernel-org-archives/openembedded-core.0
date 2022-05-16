Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C56EC433FE
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 13:25:51 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.28727.1652707541603970399
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 06:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ma6Da6nM;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id g6so28693752ejw.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2kIqLhk/grpvfVs/nsK6INI9fnI6jI5fIqnud/yplwc=;
        b=Ma6Da6nMp6ptaqq9X6KPLZTwFFHGm+rqdYkv3Jx55xhAvUEM2lm16oizMQ5UyWvQ1H
         wD+XT7iX+4PO39b4QNjNN4nEEuF3ckco9Yhy1ewrNAjo3+TvZjesD4aHftpy2W1Ui++/
         SVMKD3K4rJdik+++xjO8a3/uec0WLgZ+zQLrUtqDb0Y9iLXYYz4ze8P22cu8dUSZQOo1
         KuV0evfh8iqyjdeiJK/jCrSjmFhOxHe3emkkvAxDxja7PQ59b7fCawBsdnKFznLGqe1q
         TGs0i4+UAgQoK1zfd1Nr42Flz4z5qW/8sO8AJ8Is6BiKi6xNUHFnUwa2/zzxsVSAhpKD
         g/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2kIqLhk/grpvfVs/nsK6INI9fnI6jI5fIqnud/yplwc=;
        b=0DlbbiUx6eW2UU4/nTBWGQ2vc+ngibv4mrggNIATIJUTRmNssvkeHyKdWydUstXZ5Q
         lXLws+DYIP87RA+3TN4kURWpgLUSOm3rlvORFS5U+k/M81NOGeuRRZhwBW1KqAAVo3u+
         izS8fef41MANUuUg31PjMz1xTF3nXjwxFwyDZ+DJxSu5PS84xt0/Wa0J/74srAh+baLh
         GBqOmWcDFeM5KeoX//FRD8CHC+JZ/5cKewblsebgx4/4/z+9WEzHTd92G9cq3HSif9eg
         Eyv8sO6UOdt+4++yXjT45XGrkjl6Vt1SrNeEWvHsIM38oz+w9cVHGwHBIKs5fypXZPWK
         vQPQ==
X-Gm-Message-State: AOAM530QxwI3j//bKO55NUwAyf5dui9Dz9tZQAOzLglxcTEFRHVXn1d0
	jst/bevnYl6uTTV6C5U3xmPAjJIDDSIkaLXB9eY=
X-Google-Smtp-Source: 
 ABdhPJzApwQ6D3y2ByfrgGdFM4CJmzUVmd1oeJ88K5EcfWRzfQccVfSva9TtjBw8e017b/6mMweBpweY8uEscjFvZPE=
X-Received: by 2002:a17:907:8a24:b0:6f5:2d67:4829 with SMTP id
 sc36-20020a1709078a2400b006f52d674829mr15129422ejc.512.1652707540039; Mon, 16
 May 2022 06:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220512054303.429208-1-changqing.li@windriver.com>
 <CAO5Uq5TO3gZQNkucAy9s8aiJ=0+nMJDe-zw=SBT+wOjbUQwniQ@mail.gmail.com>
 <dbf5957af1a1afd39a90465b47eeae90fa6f350e.camel@linuxfoundation.org>
 <SN6PR11MB25578B38EF44CB5A0D00A40782CA9@SN6PR11MB2557.namprd11.prod.outlook.com>
 <CAO5Uq5Tyakm1_Q26j93ok83of5Uru-J07i4657fg58AYxBTaQw@mail.gmail.com>
 <SN6PR11MB255731C22AC93F566A3FEB6C82CF9@SN6PR11MB2557.namprd11.prod.outlook.com>
 <16EF875D3CF1EBA0.26893@lists.openembedded.org>
In-Reply-To: <16EF875D3CF1EBA0.26893@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 16 May 2022 14:25:28 +0100
Message-ID: 
 <CAO5Uq5Sffo9-v-L_ZUrL5fTTskjXjoOtmX-Bf5AddBV5R6FXYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: "Li, Changqing" <Changqing.Li@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 13:25:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165683

On Mon, May 16, 2022 at 9:07 AM Alex Kiernan via
lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org>
wrote:
>
> Untested, but if its useful (I suspect cut & paste will have broken spaces):
>
> diff --git a/meta/recipes-core/udev/eudev/init
> b/meta/recipes-core/udev/eudev/init
> index c60dbbf6d512..64cd0ea3ef39 100644
> --- a/meta/recipes-core/udev/eudev/init
> +++ b/meta/recipes-core/udev/eudev/init
> @@ -23,6 +23,38 @@ kill_udevd () {
>      [ -n "$pid" ] && kill $pid
>  }
>
> +make_static_nodes () {
> +       kmod static-nodes --format=tmpfiles |
> +       while read TTYPE TPATH TMODE TUSER TGROUP TAGE TARG; do
> +       case "${TTYPE}" in
> +       'd')
> +               test -d "${TPATH}" || mkdir -p -m "${TMODE}" "${TPATH}"
> +               ;;
> +
> +       'c!')
> +               if [ ! -c "${TPATH}" ]; then
> +                       old_ifs="${IFS}"
> +                       IFS=:
> +                       set -- ${TARG}
> +                       IFS="${old_ifs}"
> +                       mknod -m "${TMODE}" "${TPATH}" c "$@"
> +               fi
> +               ;;
> +
> +       *)
> +               echo ERROR
> +               exit 1
> +               ;;
> +       esac
> +       if [ "${TUSER}" != "-" ]; then
> +               chown "${TUSER}" "${TPATH}"
> +       fi
> +       if [ "${TGROUP}" != "-" ]; then
> +               chown "${TGROUP}" "${TPATH}"

chgrp

> +       fi
> +       done
> +}
> +
>  case "$1" in
>    start)
>      export ACTION=add
> @@ -51,6 +83,8 @@ case "$1" in
>      # make_extra_nodes
>      kill_udevd > "/dev/null" 2>&1
>
> +    make_static_nodes
> +
>      # trigger the sorted events
>      [ -e /proc/sys/kernel/hotplug ] && printf '\0\n' >/proc/sys/kernel/hotplug
>      @UDEVD@ -d
>
> On Mon, May 16, 2022 at 6:35 AM Li, Changqing
> <Changqing.Li@windriver.com> wrote:
> >
> >
> >
> > ________________________________
> > From: Alex Kiernan <alex.kiernan@gmail.com>
> > Sent: Sunday, May 15, 2022 10:59 PM
> > To: Li, Changqing <Changqing.Li@windriver.com>
> > Cc: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.org>; Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
> >
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Fri, May 13, 2022 at 2:42 AM Li, Changqing
> > <Changqing.Li@windriver.com> wrote:
> > >
> > >
> > >
> > > ________________________________
> > > From: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.org>
> > > Sent: Thursday, May 12, 2022 6:33 PM
> > > To: Alex Kiernan <alex.kiernan@gmail.com>; Li, Changqing <Changqing.Li@windriver.com>
> > > Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
> > > Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
> > >
> > > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > >
> > > On Thu, 2022-05-12 at 08:45 +0100, Alex Kiernan wrote:
> > > > On Thu, May 12, 2022 at 6:43 AM Changqing Li <changqing.li@windriver.com> wrote:
> > > > >
> > > > > From: Changqing Li <changqing.li@windriver.com>
> > > > >
> > > > > dev in modules.devname should be populated in /dev on boot.
> > > > > remove create static mode from udevd will make these devices
> > > > > cannot be populated. When use sysVinit, devices like /dev/net/tun
> > > > > will not be created.
> > > > >
> > > > > more info:
> > > > > udevd in systemd also remove create static mode in udevd, but using
> > > > > service kmod-static-nodes.service and
> > > > > systemd-tmpfiles-setup-dev.service in systemd to create these node, so
> > > > > systemd works well.
> > > > >
> > > > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > > > ---
> > > > >  ...dev-create-static-nodes-from-modules.patch | 115 ++++++++++++++++++
> > > > >  meta/recipes-core/udev/eudev_3.2.11.bb        |   1 +
> > > > >  2 files changed, 116 insertions(+)
> > > > >  create mode 100644 meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
> > > > >
> > > > > diff --git a/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
> > > > > new file mode 100644
> > > > > index 0000000000..19611f4e89
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes-from-modules.patch
> > > > > @@ -0,0 +1,115 @@
> > > > > +From 573d6c4106d5b3828da43d2843c1d599ae3cd1cd Mon Sep 17 00:00:00 2001
> > > > > +From: Changqing Li <changqing.li@windriver.com>
> > > > > +Date: Tue, 10 May 2022 14:04:35 +0800
> > > > > +Subject: [PATCH] eudev: create static nodes from modules
> > > > > +
> > > > > +Revert commit <src/udev/udevd.c: remove create static nodes from modules>
> > > > > +https://gitweb.gentoo.org/proj/eudev.git/commit/?id=2b7abd5ec9cc47a8b895df6db77fb1537c6f1a39
> > > > > +
> > > > > +Upstream-Status: Inappropriate [oe-specific]
> > > > > +
> > > > > +Upstream intentionally remove create static nodes from modules, it is
> > > > > +expected handled by tmpfiles services, refer [1].
> > > > > +[1] https://github.com/eudev-project/eudev/issues/229
> > > > > +
> > > > > +For yocto, when start with sysVinit, to enable systemd distro feature,
> > > > > +and install systemd-tmpfiles is not proper, so revert this commit.
> > > > > +
> > > >
> > > > Reading the upstream issue, I'm not sure this really is an
> > > > "Inappropriate" upstream. eudev has dropped this commit, because you
> > > > can use systemd-tmpfiles ("as it works without systemd and can be
> > > > compiled individually" - presumably using our unsupported musl
> > > > patches...) or opentmpfiles (which is dead and points you back to
> > > > systemd-tmpfiles).
> > > >
> > > > Feels like this is an engage with upstream rather than carry a patch
> > > > forever which just causes us to be perpetually divergent.
> > >
> > > I agree, this does sound like something we need to address to keep the
> > > project maintainable...
> > >
> > > I tried to suggest upstream to add this back,  but  upstream seems prefer to use tmpfile solution.
> > >
> >
> > Given how limited the output format which static-nodes generates for
> > tmpfiles is (just d and c! entries), parsing that output directly as
> > part the eudev init script wouldn't be horrible. Or make kmod generate
> > files in the format that volatiles expects? Though that would need
> > populate-volatile extending to generate device nodes.
> >
> > Thanks, I will dig more about the tmpfile solution, and send a V2 patch.
> >
> > Regards
> > Changqing
> >
> > --
> > Alex Kiernan
>
>
>
> --
> Alex Kiernan
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165667): https://lists.openembedded.org/g/openembedded-core/message/165667
> Mute This Topic: https://lists.openembedded.org/mt/91052396/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kiernan@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
Alex Kiernan

