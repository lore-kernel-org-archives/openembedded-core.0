Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.12755.1602845655908697796
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SeGaUzrJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d6so1049420plo.13
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5TbN6eErbPCh2qIo2HYXqNZJvX8rFvKxzDEY8AVBfhE=;
        b=SeGaUzrJlh7wcE6h031m90o2mxCyUogiYzUOVwnb7sLrBmKQDBYmjbbSVRQfZz1ET2
         2dmxGyH7c+ArF0VzCJgloDXE4XfuYiIUY3bmHRxXib7PbW2BqwO9XiPCdP6RemXLrcpl
         SSu2Ieho5Cpx0jYb+qdwi2+pGRWa9EIj6+Z1nMDwIP/x9inREYoXalfgy3ykSAbywUPj
         Q8E7eR4NzBITzQf+w5420slXdOTH/wAJwccLy+XkaI95Og+6V6fp1jTsQ7HTIjFa6IT1
         vLQPkXzXN3VClkzynwgwyqK3ehNjQjULHPrpJvu8w06iYMFNsOI7NxAc7lTJj3oL1Xw1
         49Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5TbN6eErbPCh2qIo2HYXqNZJvX8rFvKxzDEY8AVBfhE=;
        b=mf0ymbAaDK/BbpqPlHZTLTgKFDKBzmX1OhCaPkTGHQpKpnAhuY1dA85HcNZ1EomYG5
         oybZWoWFIjBnwAD/law06zs+oeluHSCpoEh9EKt3aDpDDSI8C4/XcBdHq7bgHpxcFGVX
         g/gNDEANKv8DFa1MVwmxUTHhPI8k4LROU0EJuWsf+oOJuaqq5gvZjPX+QZzIHgOewYHw
         zqJed6UQv4ornWCKFMXn5NyyKOOVfYT+VsQVi4G2SXjNt7xJEd+G9gAJLjlG9Bhu7+EN
         8xEGvFe9dGAnG/UTFoW7FDU74rExaCp83jNP2kRdpysUIt1+ZHo6p+pJp4adb23dLSqY
         vYLA==
X-Gm-Message-State: AOAM532L2bqZn9Gt32q0b89Rwz6kp/ZQ/zJN5JBG/u8Jv+9oWkzp+EMM
	uH5KB4o20EQR2eTFeRePZSOtsZ3sJRrn9MfxEF0=
X-Google-Smtp-Source: ABdhPJwObPXjiSuUPd0NJgiS3nMHqbaTtMTSP5XMw72kiLS+apDjRuHUTE3o5Cl0+nxjbdGASm6i6WzAyhQDwZ1efGE=
X-Received: by 2002:a17:902:b601:b029:d3:e6c5:5112 with SMTP id
 b1-20020a170902b601b02900d3e6c55112mr3423902pls.65.1602845655383; Fri, 16 Oct
 2020 03:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201015200842.18834-1-idadelm@gmail.com> <c17959f4b0ac63d56b7b8d2c76d69af8025ae677.camel@linuxfoundation.org>
In-Reply-To: <c17959f4b0ac63d56b7b8d2c76d69af8025ae677.camel@linuxfoundation.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 16 Oct 2020 12:54:03 +0200
Message-ID: <CALbNGRSw_-9XwrsXWt462MeccFKiFCzmVYT4ESLBcitkpFC4Eg@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH v4] Update license file to match current SPDX names
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Meh Mbeh Ida Delphine <idadelm@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 16, 2020 at 10:42 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-10-15 at 21:08 +0100, Meh Mbeh Ida Delphine wrote:
> > Updated mappings of license fields of meta/conf/licenses.conf to
> > match latest SPDX naming.
> > Added missing mappings.
> > Renamed license files that were added in license mappings eg from
> > GPL-2.0 to GPL-2.0-only.
Is this intended to go into gatesgarth? As we see from the follow-up
fixes: This is an incompatible change at feature freeze time.
Asking this because up to this point I was happy that all my layers
are working fine on dunfell and master(gatesgarth).

Andreas
> >
> > Fixes: [YOCTO #13320]
> >
> > Signed-off-by: Meh Mbeh Ida Delphine <idadelm@gmail.com>
> > ---
> >
> > Changes in V4:
> >  * Renamed license files that were added in license mappings eg from
> > GPL-2.0 to GPL-2.0-only
> >
> > Changes in V3:
> >  * Added missing mappings to meta/conf/licenses.conf
> >
> > Changes in V2:
> >  * Corrected the email subject line.
>
> You've sent several versions of this (v5 and v6) however this is the
> version which is in my view the most correct at the moment. If we do
> anything with the "or-later" files or variables, it should be in a
> separate patch to this one.
>
> I did put this patch (the v4) in for testing on the autobuilder. As I
> suspected and hinted at in the previous email, it failed:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2606
>
> (see step1b and the errors).
>
> Basically the issue is references to the license files you (correctly)
> renamed. We need to update those references. There look to be three
> problematic references:
>
> step1b: ERROR: sysvinit-inittab-2.88dsf-r10 do_populate_lic: QA Issue: sysvinit-inittab: LIC_FILES_CHKSUM points to an invalid file: /home/pokybuild/yocto-worker/beaglebone/build/meta/files/common-licenses/GPL-2.0 [license-checksum]
> step1b: ERROR: sysvinit-inittab-2.88dsf-r10 do_populate_lic: Fatal QA errors found, failing task.
> step1b: ERROR: connman-conf-1.0-r2 do_populate_lic: QA Issue: connman-conf: LIC_FILES_CHKSUM points to an invalid file: /home/pokybuild/yocto-worker/beaglebone/build/meta/files/common-licenses/GPL-2.0 [license-checksum]
> step1b: ERROR: connman-conf-1.0-r2 do_populate_lic: Fatal QA errors found, failing task.
> step1b: ERROR: make-mod-scripts-1.0-r0 do_populate_lic: QA Issue: make-mod-scripts: LIC_FILES_CHKSUM points to an invalid file: /home/pokybuild/yocto-worker/beaglebone/build/meta/files/common-licenses/GPL-2.0 [license-checksum]
> step1b: ERROR: make-mod-scripts-1.0-r0 do_populate_lic: Fatal QA errors found, failing task.
>
>
> Cheers,
>
> Richard
>
>
> 
>
