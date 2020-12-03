Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.8558.1606994270757157479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 03:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ej96vep7;
 spf=pass (domain: gmail.com, ip: 209.85.208.194, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f194.google.com with SMTP id t22so2142309ljk.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 03:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X7pY1/sw1g2xJ0Grgrzk6bgRFtrGVTjEeqjxI5KK7/8=;
        b=Ej96vep7HuzE8Xst6pAhzoE4oysigc67hQC6HkQSgcKPaqyfjlcd3+NX97xbwePHp2
         P/015lKUc0302KY85ACx6NQHO+KgO5QrAiD96NrhUXWPVxlsfg1frDd28im7IBuKeMvI
         qJLuuxXZ7rtuCOt1M6XbTYrX2hacOOFw7I+GjRVx9oUXaFZ4oz+gYVxDGLhETsd55hBd
         +tC5vH5+RQX9UqCvfL2gr2RHnwNNpwCOtmXqJLc96r52Rfeaiuvaxj8NQinlfxEaKOlr
         Kih4SOV6y4mYsWuqomO+HAz1jfqpbm19m3j2q67y8igV8V310bhsK2ccdFatSeFMGQ0k
         JM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X7pY1/sw1g2xJ0Grgrzk6bgRFtrGVTjEeqjxI5KK7/8=;
        b=FUFdv+D7pMkm3TSWr7B1OIUY5cKp0n3NBmFHwlCGPRu5Tkbm/cQ3iR77DyZebyQ7iu
         kXg/iFAsWhknFvelR084T4d38EsqKeylXo6NhTZfwwd/yjadGeqztGpgWozX3+FvoY5W
         GrWsMdk5mP0n4mJIQvo4l3ee9GBCJzUUDqz7VCkeq6JY2eakjpH+vXHJ+ememdg7bMSW
         1yYYpb7fh32yo70dotTN3EM2DE9f9j4rG/HS4nLFlajACPBvzvXQHIv8CyNsQyKGBtSd
         u+/CH171FFD0IGiK4HpLb1jkjlitYcmrCh8Lb78hmc+J0yXRdfd1Zqa5V8YqkT3S++S5
         iSbQ==
X-Gm-Message-State: AOAM530NZrsyvYt6T2BatOpEONStAe+Nfpd9HxfwcbLnh5m+y4xLmwG5
	xnheUz/ec16FkdGEsVfW9Y3h5OeksQDY+kKQ5OE=
X-Google-Smtp-Source: ABdhPJzQpneNe85vSIE4DYRgWXAIAFixNLz68J7vNbUl+1YKdr3jk9NywpK/2W49/jrnMhqY2LT2f1oPLkiggiSCUsc=
X-Received: by 2002:a2e:3316:: with SMTP id d22mr1053287ljc.392.1606994268824;
 Thu, 03 Dec 2020 03:17:48 -0800 (PST)
MIME-Version: 1.0
References: <bb945efa-f12d-6ff6-a783-8010269c9931@broadcom.com> <CA+aJhH20y3q84WkxfAb_-Dj2fpaankFD9VbskhyV8uPrQauPFQ@mail.gmail.com>
In-Reply-To: <CA+aJhH20y3q84WkxfAb_-Dj2fpaankFD9VbskhyV8uPrQauPFQ@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Thu, 3 Dec 2020 12:17:37 +0100
Message-ID: <CAHtQpK4+vozu5vbu+Qq3eG7e9VcLh4gsWARPCEuMPqZS7VYuPA@mail.gmail.com>
Subject: Re: [OE-core] commit breaks menuconfig on upstream kernel "cml1.bbclass: Handle ncurses-native being available via pkg-config"
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Scott Branden <scott.branden@broadcom.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hello Nathan,

On Thu, Dec 3, 2020 at 1:20 AM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> On Thu, 3 Dec 2020 at 05:17, Scott Branden <scott.branden@broadcom.com> wrote:
> >
> > Hi Nathan,
> >
> > Your commit:
> > "cml1.bbclass: Handle ncurses-native being available via pkg-config"
> > https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=master-next&id=ce447d70df386ca55ce1672478b245851556374e
> >
> > breaks bitbake menuconfig when using the upstream kernel.
>
> Interesting. The purpose of the commit was to actually fix that exact
> use case since previously the mainline kernel menuconfig was relying
> on hardcoded paths to the host ncurses libraries.
>
> Would you be able to provide the error messages you are getting (and
> anything else that can help to reproduce the failure), because I am
> not able to reproduce any failures with a mainline kernel, linux-yocto
> (with and without the below mention patch) or with other projects that
> are using cml1 (e.g. u-boot).

Just tried this with kernel recipe derived from kernel-yocto class
(linux-fslc) and pulling 5.10.0-rc6 from linux-mater, I've received
following errors from menuconfig:

# bitbake linux-fslc -c menuconfig
<inside devshell>
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  UPD     scripts/kconfig/mconf-cfg
  HOSTCC  scripts/kconfig/mconf.o
  HOSTCC  scripts/kconfig/lxdialog/checklist.o
  HOSTCC  scripts/kconfig/lxdialog/inputbox.o
  HOSTCC  scripts/kconfig/lxdialog/menubox.o
  HOSTCC  scripts/kconfig/lxdialog/textbox.o
  HOSTCC  scripts/kconfig/lxdialog/util.o
  HOSTCC  scripts/kconfig/lxdialog/yesno.o
  HOSTLD  scripts/kconfig/mconf
make[2]: scripts/kconfig/mconf: Command not found
/development/yocto-master/build-output/work-shared/imx8mmevk/kernel-source/scripts/kconfig/Makefile:29:
recipe for target 'menuconfig' failed
make[2]: *** [menuconfig] Error 127
/development/yocto-master/build-output/work-shared/imx8mmevk/kernel-source/Makefile:602:
recipe for target 'menuconfig' failed
make[1]: *** [menuconfig] Error 2
/development/yocto-master/build-output/work-shared/imx8mmevk/kernel-source/Makefile:185:
recipe for target '__sub-make' failed
make: *** [__sub-make] Error 2
Command failed.
Press any key to continue...
<inside devshell>

>
> >
> > It only works with the linux-yocto kernel due to this workaround which is not upstream.
> > If you revert this commit in linux-yocto menuconfig will not work in linux-yocto:
> > "menuconfig,mconf-cfg: Allow specification of ncurses location"
> > https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/scripts/kconfig/mconf-cfg.sh?h=v5.8/standard/base&id=1714a5ad9cf61f4d0f4b8432f327cca2998aba77
>
> This change should not be required to have menuconfig working when
> pkg-config is used.
>
> >
> >
> > Seems like your commit needs to be reverted or a change made to work with the upstream kernel.
> > Or, the linux-yocto change needs to actually be upstreamed.  I submitted it and the upstream maintainer questioned why the change is needed:
> > https://lore.kernel.org/lkml/CAK7LNATD0J3C_mFrXAju8-WmdCmrPmRFn7Um0yebnfL-_zcu8w@mail.gmail.com/
>
> The problem is if it was accepted, every kernel prior to its inclusion
> would need to be patched, as well as other projects (u-boot, busybox).
> This makes supporting menuconfig using that change for kconfig
> generically problematic. This is why the pkg-config solution is
> preferable.
>
> Regards,
> Nathan
>
> 
>


-- 
Regards,
Andrey.
