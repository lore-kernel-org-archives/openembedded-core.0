Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.16739.1592224298917554805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 05:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IemGJX/w;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id gl26so17196165ejb.11
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=s9Boz/OO0EFgycQFY9mI5Lgos+eKoX2XCXQ68OzS+4Y=;
        b=IemGJX/w2fMO1lMGeubADmen37QKNxoHCWJlalLmgAPLuIs4LWim4oASmqzWBbUXyd
         PzBo1toL+KMqS8bEh18V7C8vHA/BU6jQYd7hP70KKbuSumHPaJV5FdCIWm+tQGBdAZTZ
         XOB9klurUKW52dWbrMcvVwiSJNNWDyMRt7XqTQ558N4GBYGXiZhCLfgQWc+PthElywRO
         +bVqMEoJEoWzNyba+IQrron70INdDMFR4LrE4LV9YvXKbLmrt4GKDukGgao6lio6ngCO
         fcd/RMeUITNdX/PnT9Fhei6mt/uDhhTzRblcWYsF/70iKJ9YWQ23udQLAIGp+qKvnULc
         K72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=s9Boz/OO0EFgycQFY9mI5Lgos+eKoX2XCXQ68OzS+4Y=;
        b=kP/JMoBaIfpsKs/YcQPSRmT0noloMUEAM7XgNPBPcdIW2shqCl/RHnpVf9ca2YNfZX
         CzFJ1UVyfjLCd+2ibE+Rm/99AxEVQ5Ez8CSbWJsrOoBKGqm2u9U0WKJF9+ozGbd1uJf4
         PoLTgjiAK3m0eD3UZYQdoYc0oVGOs0tE8YmR5a6c0p4wTYqQdCQ19dNxsgLGMneQ9j21
         Y8+rXul843tQnKn0eGl0AQ+F8klpxiJYpBjw6YxYZ90jZpKef0LnTeWnxuWc03dX8+Dg
         io4pcE+26tOojhgHZoVpMuzB+4TjuyMGG53MYo1Zr6jTCixTLQeoygFXRH/kQoJyCxCx
         QnOw==
X-Gm-Message-State: AOAM530bpjE3R4iNLiuGJSMizW4WGxRQRfsh1P4EYkLx+3gyZx4CQeTe
	JOxavA5CqS5BT4oMWlit0TIDeaO5VMcl4yPpZAU=
X-Google-Smtp-Source: ABdhPJwcAzwH0TmBLeGmhE8uIRskZFujKEpdWkgL6B7HrHNj7wJLEHBUXeZhTC/sFBb98YjQ0f2yYwbcXf6OJJO1vck=
X-Received: by 2002:a17:907:9d8:: with SMTP id bx24mr24877896ejc.517.1592224297313;
 Mon, 15 Jun 2020 05:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <1616D997B5533366.13968@lists.openembedded.org>
 <cbb726f7-954b-bdca-66fa-6ab9996eaa1c@windriver.com> <CADkTA4NX63Fgs-C23z8=uFmxsaR4PQY9WsRFNJk2jLHt6g47ww@mail.gmail.com>
 <e7f82bd0-9e1c-2e0e-bd81-f820f9bfc975@windriver.com>
In-Reply-To: <e7f82bd0-9e1c-2e0e-bd81-f820f9bfc975@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 15 Jun 2020 08:31:26 -0400
Message-ID: <CADkTA4NGmvcPCmh0RZfZkGEjEont+Z5OoeKZ0v-m=8tJoGExtw@mail.gmail.com>
Subject: Re: [OE-core] kernel: update rpm failed for the vfat
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: He Zhe <zhe.he@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 7:44 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>
>
>
> On 6/12/20 9:27 PM, Bruce Ashfield wrote:
> > On Fri, Jun 12, 2020 at 3:47 AM Xu, Yanfei <yanfei.xu@windriver.com> w=
rote:
> >>
> >> Ping Bruce.
> >
> > Hmm, yes. I did miss the original message.
> >
> > gmail isn't as effective at highlighting messages that are to me (and
> > also to the list) as I would like.
> >
> >>
> >> On 6/9/20 6:32 PM, Xu, Yanfei wrote:
> >>> Hi Bruce,
> >>>
> >>> I encountered an issue that updating kernel rpm package will fail wh=
en
> >>> the /boot dir was mount with vfat filesystem. The root cause is vfat
> >>> don't support symlink.
> >>> --------cut here----------
> >>> error: unpacking of archive failed on file /boot/Image;5eda8385: cpi=
o:
> >>> symlink failed - Resource temporarily unavailable
> >>> error:
> >>> kernel-image-image-5.4.43-yocto-standard-5.4.x+git0+f8c88c4331_9961c=
c8b79-r0.bcm_2xxx_rpi4:
> >>> install failed
> >>> root@bcm-2xxx-rpi4:/boot#
> >>>
> >>> Currently I have two ideas to fix it:
> >>> 1. we use 'install' cmd instead of 'ln -sf' in kernel_do_install to
> >>> avoid generating symlink in kernel-image-image*.rpm. And then add an
> >>> postinstall to this rpm. It will check if the /boot dir is vfat, if =
not,
> >>> we remove the copy image* and make a softlink for the image.
> >
> > Note that for this option, you have to make sure that it really is
> > done in a post install or you end up with overlapping file errors in
> > scenarios where multiple kernel packages are installed (i.e. an
> > upgrade).
> >
> >>> 2. we specially add an package type which doesn't contain symlink fo=
r
> >>> the vfat filesystem.
> >>>
> >>> For the first idea, I met an problem when I try to add
> >>> pkg_postinst_packagename function in kernel.bbclass file. Due to the=
re
> >>> are not package name variables defined for the kernel-image-image.gz
> >>> kernel-image-image or other type kernel images. So I can not add
> >>> postinst functions statically why that how many packages and package=
s'
> >>> name are not certainly.
> >
> > You can still generate the package names in python, i.e.:
> >
> >          d.setVar('pkg_postinst_ontarget_%s-image-%s' % (kname,
> > typelower), 'ln -sf ' + type + '-${KERNEL_VERSION}
> > /${KERNEL_IMAGEDEST}/' + type)
> >
> This is a piece of very useful code!
> Thanks for your detailed suggestions, and I have implemented it basicly.=
 =EF=BC=9A)

Good to hear!

If you run into problems with rpm complaining about packages that
don't exist, let us know, I may have a hint or two for that as well :D
I just don't know if it is a problem with the latest rpm and
package.bbclass.

Bruce

>
> Cheers,
> Yanfei
>
>
> > that's from a patch that I've had locally for a while, that deals with
> > kernel upgrade issues.
> >
> > Any logic that deals with this really does have to be on target,
> > otherwise, information about the image (and partitions) is leaking
> > into the packages, and you'd need to carry specific image package
> > lists for the filesystem layout.
> >
> > My suggestion for the post install is that it simply try and create
> > the symlink, and if that fails, then do a copy. That way there's no
> > need to detect filesystem types, etc.
> >
> > You also need to ensure that you test the kernel upgrade path, since
> > with copies, you may end up with more kernel images around boot and
> > not get some of the implicit cleanup that you get by simply
> > redirecting a symlink (but if you are always copying the active kernel
> > to "image", then simply overwriting the target will get you that same
> > cleanup).
> >
> > Cheers,
> >
> > Bruce
> >
> >>>
> >>> Do you have any opinions about these?
> >>>
> >>>
> >>> Regards,
> >>> Yanfei
> >>>
> >>>=20
> >>>
> >
> >
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
