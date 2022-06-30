Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BCBC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 17:14:02 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.27793.1656609240688578989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 10:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UPxxxoQY;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id z41so8893732ede.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 10:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DvHrFtk0QF0gwccmDA8vYN3a/lXgyrzTvLvP3HROfkg=;
        b=UPxxxoQYKPVHF669qpvA0WxIp4dY1GY5DdV9CQWDzSYqicnGcWvCzkZ1R+A+W2tj02
         lgNtNZFESk5Odi5JouDlLrIk5rGaH6hucdeSnSCbIqfOWTPOeR0ydNKYSOKhLez2mW6a
         Hri6c700CA/BnmrwLJA4c1r84of+SWAsGwzG1bxJFyLELjgwaUaWA4Po6GTLuXkT3hXh
         q/D4B/tAX+c7NkPeNO58WyPeaoxhtplZg3jF/CcBrWZ4tHnDYyqW0Gxsgi45FvBnFwnL
         p2oh8ARY4rzbr5QVU/5CBmOCg80z9Wc4YiA7SM24ckT7MGPUJm8uVoDf4i4aT7lqFmfi
         nJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DvHrFtk0QF0gwccmDA8vYN3a/lXgyrzTvLvP3HROfkg=;
        b=Y4dtIfCXKQR4d00RJTxX/a7D1UrrEZ8jV/zlxlTLwEK9cZF/ZOrdG640Wyxq8+K2oA
         PBATZkdKUJ3P0CxmndvEy27N79PPTShi9n1/vZduTS3OVzCM/3oV5kLYb2SKT2xToaMp
         jteMlN5x+L+wGRjhL8l3l80H/Dswhm/nfa+9TOX0GElc2ySSLsQKJBx0uF/OftHtQqNt
         jZ9o3jIVZqS8nmRxnTQ+GmpApUn2IOYAPZW109HUIbXFbDG2ijFT0QNYrLpzXE9tWwqV
         5GWPh0box1xFqoCs8lxo3E9HFJM5lcFom/YDb7YexxF2emB2q4RovPjeT9m4+6aIGRMS
         Psdw==
X-Gm-Message-State: AJIora+YHdsbSFCaR9yPMaXzY+eW5/YtZR+TMx8Nctizd/PoP5pG3/Fw
	5gtTQizd3y6ouAXdyaV723HhNXNJH9HQG3fF9Hxy3A==
X-Google-Smtp-Source: 
 AGRyM1spQpYtIINKx/gSP/UPvti3njWWztcqPQ1GlS6xjepmM6sUYJY6EOXMMqQC9MIHIt72pCoWRyQLbvTbJBC4pQk=
X-Received: by 2002:a05:6402:698:b0:435:75d9:f94c with SMTP id
 f24-20020a056402069800b0043575d9f94cmr13448702edy.330.1656609238771; Thu, 30
 Jun 2022 10:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <16FB9273F36F7F78.24408@lists.openembedded.org>
 <7bdfec55599094a196f35ce4e84e651b8179d120.camel@linuxfoundation.org>
In-Reply-To: 
 <7bdfec55599094a196f35ce4e84e651b8179d120.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 30 Jun 2022 07:13:47 -1000
Message-ID: 
 <CAOSpxdbBwbBCHFxvFCvww=+J+v7PB0T7ENBHAGy4iZt3Jcm3Fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] packagegroup-core-ssh-dropbear: Add
 openssh-sftp-server
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 17:14:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167430

On Mon, Jun 27, 2022 at 9:14 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-06-24 at 14:45 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > Seems sad to have to do this but openssh is moving to use sftp instead
> > of scp to move files. This means scp from Fedora 36 will no longer be
> > able to move files to/from a dropbear based image. This breaks a number
> > of our key QA tests and I suspect will cause users pain too.
> >
> > The sftp server from openssh is small and standalone so adding it to
> > the packagegroup seems to be the best way to preserve user sanity. If
> > people really don't want it, they can just use dropbear instead of the
> > packageground.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  .../packagegroups/packagegroup-core-ssh-dropbear.bb             | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> > index 4f844ad9255..b969ab7ca01 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> > @@ -3,4 +3,4 @@ PR = "r1"
> >
> >  inherit packagegroup
> >
> > -RDEPENDS:${PN} = "dropbear"
> > +RDEPENDS:${PN} = "dropbear openssh-sftp-server"
>
>
> If we want kirkstone or dunfell to work on Fedora 36 we're going to
> need this. Unfortunately it will break images with -dev packages in
> them.
>
> The fixes for master for that are not appropriate for
> kirkstone/dunfell, they're quite invasive for master.
>
> As such you may need to disable the -dev package dependencies for
> dropbear/openssh, something like:
>
> RDEPENDS:openssh-dev[nodeprrecs] = "1"
> RDEPENDS:dropbear-dev[nodeprrecs] = "1"
>
> in the appropriate places. I mention this now whilst I remember the
> context!

Any hints as to the "appropriate places"? ;-)

I assumed you meant the openssh and dropbear recipes:

diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index f306b1245a..2178c4868f 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -162,6 +162,8 @@ FILES:${PN}-keygen = "${bindir}/ssh-keygen"

 RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS:${PN}-sshd += "${PN}-keygen
${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit
pam-plugin-loginuid', '', d)}"
+RDEPENDS:openssh-dev[nodeprrecs] = "1"
+
 RRECOMMENDS:${PN}-sshd:append:class-target = "\
     ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
 "
diff --git a/meta/recipes-core/dropbear/dropbear.inc
b/meta/recipes-core/dropbear/dropbear.inc
index 78f9f9adbd..a93d247caa 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -9,6 +9,7 @@ LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=25cf44512b7bc8966a48b6b1a9b7605f"

 DEPENDS = "zlib virtual/crypt"
+RDEPENDS:dropbear-dev[nodeprrecs] = "1"
 RPROVIDES:${PN} = "ssh sshd"
 RCONFLICTS:${PN} = "openssh-sshd openssh"


but I still get failures on do_populate_sdk:

Error:
 Problem: package dropbear-dev-2020.81-r0.core2_64 requires dropbear =
2020.81-r0, but none of the providers can be installed
  - package dropbear-2020.81-r0.core2_64 conflicts with openssh
provided by openssh-8.9p1-r0.core2_64
  - package openssh-8.9p1-r0.core2_64 conflicts with dropbear provided
by dropbear-2020.81-r0.core2_64
  - package openssh-dev-8.9p1-r0.core2_64 requires openssh = 8.9p1-r0,
but none of the providers can be installed
  - conflicting requests

Steve

