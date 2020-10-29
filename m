Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web09.4779.1604009408953802851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 15:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dC8XpgUG;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: quaresma.jose@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id v18so4731348ilg.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 15:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XCvDL/dlyfvdaA69e0x3b9HwmK2vArW1yaDf91vUotg=;
        b=dC8XpgUGMMS6+7JsTqvtuF8bM36nxklegoaspLG1CazZmmcM2Jd66rkXwgJM8e7DJQ
         TLjpXu/OFZl1XkLC93e/bAQ97B1exKMinRNMC4vaXqRJZwj3n2sRXLI9guNbZNNMukNp
         C1cqS7nC+Jnmd+jvp9rpLH08GoGXNzmLRNIBT+0UP3spmq03hm1953KHVppFeI+wVC0v
         3PvOEQMplX+k2e5USdYub5bCboXupA2mHI3vnZIeQPkPUgWpJ5rkIkJGzMC+R5J/xwPS
         KCqa+FkOMbCTDtdis5N+K1bnuW5TzJkWSs7bt/CTsydVv8+me4lXgGTg1qNDWtlZmv5E
         zWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XCvDL/dlyfvdaA69e0x3b9HwmK2vArW1yaDf91vUotg=;
        b=e/WX0UfG6G9OxZVLU8mbEzC9YkIR3bBOTpEO4xxzh7SBCqOprHShskprJd9JGWlZMU
         VsLoULDcnAwW6VekFgd4mlvRFShDfH54dLLfjYJ3DKT2lhJEr5jKgGpWJi4KYaNyJWXk
         94oVKKBTCB2qOlP721p48XSv5YQINm/AGzoY/T/nMz3K7B5pMESsS30eccpXBlGarhim
         xZIg99lcdltyDJ9X9r+CoRXtzYS0c4BMV2RsnOa8rKRCQ4kXnptB9aEM7hVNYTKLtSSU
         +ofxHw5Q043hKueEgkv5fzBQiqQLbw09W0+mV0ZeK0v/hgDflU7n7LGrsk2yMQ2CxR//
         3qkQ==
X-Gm-Message-State: AOAM530LgCVTtkaxl03TJmkRxEgLsDXUb1mlruwlspIiNT9nG/Dy1872
	UKNmDWTd8ZLuK2At7vgQPK0RZLBgRNB+iW79+4g=
X-Google-Smtp-Source: ABdhPJxapgIvyGXwSwl/PwtoE5O+UlUqdtOiz1pvhY3fs9PYyjhugU/Wx8Rr+E7kAOtqjTKmJWFIICyGPPvcqnHTpCc=
X-Received: by 2002:a92:d302:: with SMTP id x2mr5062564ila.66.1604009408311;
 Thu, 29 Oct 2020 15:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
 <20201029142806.1830504-2-quaresma.jose@gmail.com> <7ff661d33eefed532bff3a1509f23fa26cc289a9.camel@linuxfoundation.org>
 <CANPvuRmmJ_kcFWErPue-Ub-N_F_8YM=MAO7n1s2DoYhuU9fwVw@mail.gmail.com>
 <968b3010cd55cd630332e3f5b43014cd3c8c0a5a.camel@linuxfoundation.org> <1642850E1E948AB3.32334@lists.openembedded.org>
In-Reply-To: <1642850E1E948AB3.32334@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 29 Oct 2020 22:10:08 +0000
Message-ID: <CANPvuRnBjAhF2MWmuQsXNiBrYucOEucaeQc2uqxi6=oka3Ovug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 01/22] gstreamer1.0: Fix reproducibility issue around libcap
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
quinta, 29/10/2020 =C3=A0(s) 16:58:
>
> I will need to rebuild and check if when setcap is enabled it will
> pick setcap from host on from libcap-
> native.
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> quinta, 29/10/2020 =C3=A0(s) 16:43:
> >
> > On Thu, 2020-10-29 at 16:13 +0000, Jose Quaresma wrote:
> > > It looks for setcap in /usr/sbin and /sbin but needs libcap as wheel=
.
> > > when we have libcaps on DEPENDS as with version 1.16 and the host
> > > system has setcap binary, it introduces a dependency on the host
> > > system.
> > > The patch fixes this situation.
> > >
> > > But libcap is only needed if we need to use the setcap
> > > So remove libcap from DEPENDS will fail to use
> > > 'ptp-helper-permissions=3Dcapabilities' even if setcap is found on t=
he
> > > host.
> > >
> > > In my opinion this a better description can be used in this
> > > PACKAGECONFIG, something like this:
> > >
> > > -PACKAGECONFIG[setcap] =3D ",,libcap libcap-native"
> > > +PACKAGECONFIG[capabilities] =3D
> > > "-Dptp-helper-permissions=3Dcapabilities,,libcap libcap-native"
> >
> > So you're saying that as long as setcap isn't in DEPENDS, we're ok?

Yes it's correct.

> > That means your patchset as it stands should be ok?

Yes it's correct.

> >
> > If the user enables capabilities, it won't find setcap from libcap-
> > native though will it? That is a potential problem even if its not the
> > default?

Yes it find the setcap on recipe-sysroot-native

The help of messon find_program said that it will find the program in
the first arg
and fallback to the other if the last one fails. In this case it first
find setcap on the PATH
setcap =3D find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap',
required : false)
https://mesonbuild.com/Reference-manual.html#find_program

I made a little change on the souce to check this:

+++ b/libs/gst/helpers/meson.build
@@ -67,6 +67,7 @@ if have_ptp
  endif

  setcap_prog =3D find_program('setcap', '/usr/sbin/setcap',
'/sbin/setcap', required : false)
+  message('setcap_prog: ' + setcap_prog.full_path())
  cap_dep =3D dependency('libcap', required: false)

  # user/group to change to in gst-ptp-helper

This give me:

# with PACKAGECONFIG_append =3D "setcap"
bitbake  gstreamer1.0 -c configure -v -f | grep setcap_prog
Message: setcap_prog:
/work/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/gstreamer1.0/1.18=
.0-r0/recipe-sysroot-native/usr/sbin/setcap

# with PACKAGECONFIG_remove =3D "setcap"
bitbake  gstreamer1.0 -c configure -v -f | grep setcap_prog
Message: setcap_prog: /sbin/setcap


> >
> > Cheers,
> >
> > Richard
> >
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>
>=20
>


--=20
best regards,
Jos=C3=A9 Quaresma
