Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.617.1606849292076476156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 11:01:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P8GFsMpK;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id pg6so6406956ejb.6;
        Tue, 01 Dec 2020 11:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=88kbJJu2Jv4frbwGGFo8+gZMN3U+7GdXo1HwS3naZb8=;
        b=P8GFsMpK7OgMSzw5Sn/1P1G034n1iWBGK4y+sBYE8i97Yc4eeE8eowHwo3XkYxYe5Y
         gKR5bjMxNw2NfQBQo/8CB12kMoFeNEHTKkfCSMDsjgGMuAQi0/iTCz3KS83VFOuKiGwC
         YtSXEH5a/yvsA9yDURQ0VQXCUKhw7P3ohPpcIhKnj0TA/wo9yTGq7jh/F0XKRDKESPRp
         1v3fQ99R3qin1bfvHIuswvEyxQXRzXlD1eL9PlV8k/HpVzfU4/0UtQSSLrXntpAiX0no
         tXQPWkWC7v11EwdUWeZy0VjOVDfosrDkQmQaelgs0AvUVnLZvTK1eyUga0VaLNjAJwtg
         eY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=88kbJJu2Jv4frbwGGFo8+gZMN3U+7GdXo1HwS3naZb8=;
        b=qOl+y5kFtrLdQLTZYayF7/NKqzgNbXaD1UirKMinArtmM4W011mc7OY+G8crvfLIlV
         /aMLb4mkTNPLhwT6PiYJ3JObf0DnQqCZlqLzo4vlhgg71/HrTWYpaDQVdOgzPVU0dGI/
         lD5fATAlHJdrTur0N0Fy5sVmD61bp4+ipyH4OHdMrRPwKe0GLNs9pixVu5YwGtIlRuI6
         loy5bJ3zCbTz/fAKz5ZW8zV0nburbQdS6ZUozlE1JNsfWD8o4VbWEdC06fd8Q0xT5sxF
         ksDbTIbcleeJHZkO//dpBqGSlVWN3R9PY//aD9G4xM4D1dVlAvZE/dHirC9nsCD3d4rn
         TZwQ==
X-Gm-Message-State: AOAM533h1V3yYamwVrRQ0X4EtNmpod1ZSQLbIRjvTrxd4KhMU4iwFJdQ
	lS8G60257lwGR5KXfxHr9XX24gx2lt1ZgGzyXrY=
X-Google-Smtp-Source: ABdhPJxHvjgbAa1FuLUKDIyPg57/Ou1peVMgtOBWLD8fX5ODOc7hR289yhZuUE8kEKRdr2oR/8XuahuOA5X22kocQ5E=
X-Received: by 2002:a17:906:5e0f:: with SMTP id n15mr4405903eju.459.1606849290490;
 Tue, 01 Dec 2020 11:01:30 -0800 (PST)
MIME-Version: 1.0
References: <20201128004505.27619-1-scott.branden@broadcom.com>
 <CAK7LNATD0J3C_mFrXAju8-WmdCmrPmRFn7Um0yebnfL-_zcu8w@mail.gmail.com> <a5ea40a5-17ef-f037-16b3-177f01db6447@broadcom.com>
In-Reply-To: <a5ea40a5-17ef-f037-16b3-177f01db6447@broadcom.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 1 Dec 2020 14:01:19 -0500
Message-ID: <CADkTA4NTPJrvoFqumNjkU-o-ZTt8iVUzQec+=Qvm4J_59FFQqg@mail.gmail.com>
Subject: Re: [PATCH] menuconfig,mconf-cfg: Allow specification of ncurses location
To: Scott Branden <scott.branden@broadcom.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, Michal Marek <mmarek@suse.cz>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 1, 2020 at 12:19 PM Scott Branden
<scott.branden@broadcom.com> wrote:
>
> Hi Masahiro,
>
> On 2020-12-01 4:25 a.m., Masahiro Yamada wrote:
> > On Sat, Nov 28, 2020 at 9:45 AM Scott Branden
> > <scott.branden@broadcom.com> wrote:
> >> From: Bruce Ashfield <bruce.ashfield@windriver.com>
> >>
> >> In some cross build environments such as the Yocto Project build
> >> environment it provides an ncurses library that is compiled
> >> differently than the host's version.  This causes display corruption
> >> problems when the host's curses includes are used instead of the
> >> includes from the provided compiler are overridden.  There is a second
> >> case where there is no curses libraries at all on the host system and
> >> menuconfig will just fail entirely.
> >>
> >> The solution is simply to allow an override variable in
> >> check-lxdialog.sh for environments such as the Yocto Project.  Adding
> >> a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
> >> compiling and linking against the right headers and libraries.
> >>
> >> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> >> cc: Michal Marek <mmarek@suse.cz>
> >> cc: linux-kbuild@vger.kernel.org
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> >> ---
> >
> > Some people solve the cross-compiling in Yocto
> > by using pkg-config.
> >
> >
> > For example,
> >
> > commit 067c650c456e758f933aaf87a202f841d34be269
> > Author: Pavel Modilaynen <pavel.modilaynen@axis.com>
> > Date:   Fri Jul 12 13:52:19 2019 +0200
> >
> >     dtc: Use pkg-config to locate libyaml
> >
> >     Using Makefile's wildcard with absolute path to detect
> >     the presence of libyaml results in false-positive
> >     detection when cross-compiling e.g. in yocto environment.
> >
> >
> >
> > mconf-cfg.sh already allows the path flexibility with pkg-config.
> > Why do you want yet another hook?
> I hope the yocto community can provide more details on this patch.
> The yocto environment isolates the build environment from the host tools.
> Running menuconfig with the upstream kernel does not work on the latest yocto without this patch.

Sorry for not commenting on the origin patch, gmail buried it within
some other threads, but luckily this one popped up.

It is true that we've been carrying this for several years to deal with
the fact that the native sysroot is not searched by the pkg-config
called by mconf-cfg.sh (since it is separate from host and target
pkg-config).

As it turns out, in the past few weeks, we have come up with a way
to inject those native sysroot components into pkg-config without
the need for any changes to the scripts.

Scott: if you try again the the latest oe-core, and are still seeing
the problem with the mainline kernel, ping me, and we can see if
the pkg-config fix isn't holding for you, at that point, yes, we may
still need a hook like this to solve the problem.

Cheers,

Bruce



> >>  scripts/kconfig/mconf-cfg.sh | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>  mode change 100755 => 100644 scripts/kconfig/mconf-cfg.sh
> >>
> >> diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
> >> old mode 100755
> >> new mode 100644
> >> index aa68ec95620d..32448bc198a5
> >> --- a/scripts/kconfig/mconf-cfg.sh
> >> +++ b/scripts/kconfig/mconf-cfg.sh
> >> @@ -4,6 +4,14 @@
> >>  PKG="ncursesw"
> >>  PKG2="ncurses"
> >>
> >> +if [ "$CROSS_CURSES_LIB" != "" ]; then
> >> +    echo libs=\'$CROSS_CURSES_LIB\'
> >> +    if [ x"$CROSS_CURSES_INC" != x ]; then
> >> +       echo cflags=\'$CROSS_CURSES_INC\'
> >> +    fi
> >> +    exit 0
> >> +fi
> >> +
> >>  if [ -n "$(command -v pkg-config)" ]; then
> >>         if pkg-config --exists $PKG; then
> >>                 echo cflags=\"$(pkg-config --cflags $PKG)\"
> >> --
> >> 2.17.1
> >>
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
