Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web08.1282.1626192927247242614
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jul 2021 09:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fU9Ok9Qn;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id v189so27207119ybg.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jul 2021 09:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6eSPSygEGgQ1pcr18EoeAPeF0LF8x9ip9grl9wceBsM=;
        b=fU9Ok9Qn6zgXMcNkzmNRZPtHJRTKSggipLVLjwj1gFcoMdAECY/rWZKyJkk4SjyuL0
         pxZauvgnd2sYy0kT1CiIQayHjeZM5KnzgzVUWoJAyJYCr3llyCqa4PS3GyClQY6RDpnI
         R1Jl95cQoT/5POj+ruSuZuunTeZuFDPif5fUlMGixHgx3jTOH3f/wfch/s8tIO1UqBJK
         UHnQj7ijPjfcyU6eNVL03S+moP1oIjCZ/E1Aw0TOTlUDWOQbfWZiAua1g0XrDvT/FfGq
         8iIP0ls/f0PWPP2oJwpC3HH8zv1WWPaOGW2JApUBNH6PTs7o87XNTq0H7hI2u5Hm7KW/
         x2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6eSPSygEGgQ1pcr18EoeAPeF0LF8x9ip9grl9wceBsM=;
        b=Fo/ArRWpF6jGqPGB7CZrIYC104PJeiQrgW9jOL1Rqu6Kfi40s8oiUxK5O0zglMGmuh
         Cg4cFFcAlYmdUaeU8jVNNBgT1wqkM9LMPQNjXIMSBcV1gZqKyDAEkX4zHWYlwBdmlgRs
         aw06kwY+e6912yKx5dEzFuQkFc58XLdS47clA8Pytzabc+xBE+FF0Wi0hfswwHSGz7w4
         AtB7NrqlW+oKzF8RWuZaZE8VEtR2YPYIiPTfKkv8vVNghspAp+vhIl1QliMTfl9FeKLk
         G/jJSIsVfmXe/elSphq3M9XlVf/Gcr+64DpNoyBVqsU4xc5uZN8ax8fcXVmxlMAhWP0r
         mvqQ==
X-Gm-Message-State: AOAM532/hFVQi7G+q/Tc3UbJpnNUeSAMJtpb78Lh4TCkc19oaIikh3Np
	vMjYWaaAtrviOgFK8ZbxD0oI1op90f43A6gkdgw=
X-Google-Smtp-Source: ABdhPJw4uD45Z4xEa+bZWIg3tW/B8asF/sKzSlIHOaknZS0AU2DLYYXcxA7WJETdVQd8t32vgNtHSyO/0FZL+GozkWY=
X-Received: by 2002:a25:3d01:: with SMTP id k1mr6930453yba.401.1626192926451;
 Tue, 13 Jul 2021 09:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210622121531.13424-1-andrej.valek@siemens.com>
 <20210625061011.10871-1-andrej.valek@siemens.com> <bdb3cd51-b2b7-f5d6-4353-287d339dcbc6@gmail.com>
 <DB8PR10MB39779534C416E7949A0AEEC192149@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB8PR10MB39779534C416E7949A0AEEC192149@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Tue, 13 Jul 2021 06:15:15 -1000
Message-ID: <CAGDS+nnoHSxSqVAKxnqX8OUD1dzn4GDCZRo=LG3DALuKQJv=BQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] busybox: add tmpdir option into mktemp applet
To: Andrej Valek <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 7:57 PM Andrej Valek <andrej.valek@siemens.com> wro=
te:

> Would it be possible to include it into dunfell branch too? Or do I need=
 to submit the patch again?

This patch doesn't apply cleanly to the busybox in dunfell since it is
a different version.

I've dealt with the issues and created a version for dunfell.  If it
passes autobuilder testing I will include it in the next dunfell patch
review cycle.

Steve

> On 6/24/21 11:10 PM, Andrej Valek wrote:
> > - Make mktemp applet compatible with --tmpdir option in ca-certificate
> > update script.
> >
> > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >   .../busybox/0001-mktemp-add-tmpdir-option.patch    | 81 ++++++++++++=
++++++++++
> >   meta/recipes-core/busybox/busybox_1.33.1.bb        |  5 +-
> >   2 files changed, 84 insertions(+), 2 deletions(-)
> >   create mode 100644
> > meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
> >
> > diff --git
> > a/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patc
> > h
> > b/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patc
> > h
> > new file mode 100644
> > index 0000000000..4a1960dff2
> > --- /dev/null
> > +++ b/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.
> > +++ patch
> > @@ -0,0 +1,81 @@
> > +From ceb378209f953ea745ed93a8645567196380ce3c Mon Sep 17 00:00:00
> > +2001
> > +From: Andrej Valek <andrej.valek@siemens.com>
> > +Date: Thu, 24 Jun 2021 19:13:22 +0200
> > +Subject: [PATCH] mktemp: add tmpdir option
> > +
> > +Make mktemp more compatible with coreutils.
> > +- add "--tmpdir" option
> > +- add long variants for "d,q,u" options
> > +
> > +Upstream-Status: Submitted
> > +[https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fl=
is
> > +ts.busybox.net%2Fpipermail%2Fbusybox%2F2021-June%2F088932.html&amp;da
> > +ta=3D04%7C01%7Candrej.valek%40siemens.com%7Cd0399684a66a4ee5460508d93=
7e
> > +fbf1f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637602325103746151
> > +%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6
> > +Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dljy4RuZ8pCX8keUHlquCLCJ1hoj=
Hg
> > +v9qfY%2BcXPB6T5o%3D&amp;reserved=3D0]
> > +
>
> lgtm, this is right approach
>
> > +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > +---
> > + coreutils/mktemp.c | 26 ++++++++++++++++++--------
> > + 1 file changed, 18 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/coreutils/mktemp.c b/coreutils/mktemp.c index
> > +5393320a5..05c6d98c6 100644
> > +--- a/coreutils/mktemp.c
> > ++++ b/coreutils/mktemp.c
> > +@@ -39,16 +39,17 @@
> > + //kbuild:lib-$(CONFIG_MKTEMP) +=3D mktemp.o
> > +
> > + //usage:#define mktemp_trivial_usage
> > +-//usage:       "[-dt] [-p DIR] [TEMPLATE]"
> > ++//usage:       "[-dt] [-p DIR, --tmpdir[=3DDIR]] [TEMPLATE]"
> > + //usage:#define mktemp_full_usage "\n\n"
> > + //usage:       "Create a temporary file with name based on TEMPLATE =
and print its name.\n"
> > + //usage:       "TEMPLATE must end with XXXXXX (e.g. [/dir/]nameXXXXX=
X).\n"
> > + //usage:       "Without TEMPLATE, -t tmp.XXXXXX is assumed.\n"
> > +-//usage:     "\n    -d      Make directory, not file"
> > +-//usage:     "\n    -q      Fail silently on errors"
> > +-//usage:     "\n    -t      Prepend base directory name to TEMPLATE"
> > +-//usage:     "\n    -p DIR  Use DIR as a base directory (implies -t)=
"
> > +-//usage:     "\n    -u      Do not create anything; print a name"
> > ++//usage:     "\n    -d                      Make directory, not file=
"
> > ++//usage:     "\n    -q                      Fail silently on errors"
> > ++//usage:     "\n    -t                      Prepend base directory n=
ame to TEMPLATE"
> > ++//usage:     "\n    -p DIR, --tmpdir[=3DDIR]  Use DIR as a base dire=
ctory (implies -t)"
> > ++//usage:     "\n                            For --tmpdir is a option=
al one."
> > ++//usage:     "\n    -u                      Do not create anything; =
print a name"
> > + //usage:     "\n"
> > + //usage:     "\nBase directory is: -p DIR, else $TMPDIR, else /tmp"
> > + //usage:
> > +@@ -72,13 +73,22 @@ int mktemp_main(int argc UNUSED_PARAM, char **arg=
v)
> > +             OPT_t =3D 1 << 2,
> > +             OPT_p =3D 1 << 3,
> > +             OPT_u =3D 1 << 4,
> > ++            OPT_td =3D 1 << 5,
> > +     };
> > +
> > +     path =3D getenv("TMPDIR");
> > +     if (!path || path[0] =3D=3D '\0')
> > +             path =3D "/tmp";
> > +
> > +-    opts =3D getopt32(argv, "^" "dqtp:u" "\0" "?1"/*1 arg max*/, &pa=
th);
> > ++    opts =3D getopt32long(argv, "^"
> > ++           "dqtp:u\0"
> > ++           "?1" /* 1 arg max */,
> > ++           "directory\0" No_argument       "d"
> > ++           "quiet\0"     No_argument       "q"
> > ++           "dry-run\0"   No_argument       "u"
> > ++           "tmpdir\0"    Optional_argument "\xff"
> > ++           , &path, &path
> > ++    );
> > +
> > +     chp =3D argv[optind];
> > +     if (!chp) {
> > +@@ -95,7 +105,7 @@ int mktemp_main(int argc UNUSED_PARAM, char **argv=
)
> > +             goto error;
> > +     }
> > + #endif
> > +-    if (opts & (OPT_t|OPT_p))
> > ++    if (opts & (OPT_t|OPT_p|OPT_td))
> > +             chp =3D concat_path_file(path, chp);
> > +
> > +     if (opts & OPT_u) {
> > +--
> > +2.11.0
> > +
> > diff --git a/meta/recipes-core/busybox/busybox_1.33.1.bb
> > b/meta/recipes-core/busybox/busybox_1.33.1.bb
> > index a71ff530cb..4c2bc1106d 100644
> > --- a/meta/recipes-core/busybox/busybox_1.33.1.bb
> > +++ b/meta/recipes-core/busybox/busybox_1.33.1.bb
> > @@ -38,6 +38,8 @@ SRC_URI =3D "https://eur01.safelinks.protection.outl=
ook.com/?url=3Dhttps%3A%2F%2Fbusybox.net%2Fdownloads%2Fbusybox-%24&amp;data=
=
=3D04%7C01%7Candrej.valek%40siemens.com%7Cd0399684a66a4ee5460508d937efbf1f=
%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637602325103756104%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C1000&amp;sdata=3DN3SXB3FD0hAF7wAV7Hv4AgT5f%2BEHAQr%2FRVNv1KcZqxs%3D=
&amp;reserved=3D0{PV}.tar.bz2;name=3Dtarball \
> >              ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev=
_manager') =3D=3D 'busybox-mdev')]} \
> >              file://syslog.cfg \
> >              file://unicode.cfg \
> > +           file://rev.cfg \
> > +           file://pgrep.cfg \
> >              file://rcS \
> >              file://rcK \
> >              file://makefile-libbb-race.patch \ @@ -45,9 +47,8 @@
> > SRC_URI =3D "https://eur01.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fbusybox.net%2Fdownloads%2Fbusybox-%24&amp;data=3D04%7C01%7Candre=
j.valek%40siemens.com%7Cd0399684a66a4ee5460508d937efbf1f%7C38ae3bcd95794fd4=
addab42e1495d55a%7C1%7C0%7C637602325103756104%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3DN3SXB3FD0hAF7wAV7Hv4AgT5f%2BEHAQr%2FRVNv1KcZqxs%3D&amp;reserved=3D0{P=
V}.tar.bz2;name=3Dtarball \
> >              file://0001-testsuite-use-https://eur01.safelinks.protect=
ion.outlook.com/?url=3Dhttp%3A%2F%2Fwww.example.org-for-wget-test-cases.pat=
ch%2F&amp;data=3D04%7C01%7Candrej.valek%40siemens.com%7Cd0399684a66a4ee5460=
508d937efbf1f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C6376023251037561=
04%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DxHlfVfFwwfCPyRhSt%2BjwIHpJHxpCW8T52kP=
fwJZyo3U%3D&amp;reserved=3D0 \
> >              file://0001-du-l-works-fix-to-use-145-instead-of-144.patc=
h \
> >              file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc=
-sys-ne.patch \
> > -           file://rev.cfg \
> > -           file://pgrep.cfg \
> >
> > file://0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch
> > \
> > +           file://0001-mktemp-add-tmpdir-option.patch \
> >              "
> >   SRC_URI_append_libc-musl =3D " file://musl.cfg "
> >
> >
> >
> >
> >
> >
>
>=20
>
