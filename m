Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.145.1617720911510399505
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 07:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=W0vpqF61;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.45, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f45.google.com with SMTP id f12so8578708wro.0
        for <Openembedded-core@lists.openembedded.org>; Tue, 06 Apr 2021 07:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TcKrOFDNHUFANIkDcaUt3kPQCiMheyLH3AlbHl42sJo=;
        b=W0vpqF61QkXvTmgomcNjYMRMKk1L/jlrq89+fwzYDaFFfIcKtBrqLnNxzI5j662qKZ
         5Hrdk8J8iGXIy9gZS7vXgaf8MgYNU1MdgOg8B1maUWqJEqMSyX4mmjw4T2eL7yfo88rL
         W9JmfUVKGlyRgnPplKhM9PgA8w2Y4D+oqWaQPAyq/lMDsxcZ9fOtYI4AjaHUNCRdocWZ
         Nqav8kbPQZDM0fvcCL5AgQNRsmpgR12HvulegQqKeLDXqlFn+CZ1wk4zgJFvTTXnjqVI
         /K/hIbTMXcumHM6Fhw3Tm3+qz7z1BgTbK2YrHnRikddj9Ba5vKHhYW6vET7me5DG1k4p
         0X3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TcKrOFDNHUFANIkDcaUt3kPQCiMheyLH3AlbHl42sJo=;
        b=DNxldoba0UTKIDKZzQ0J/7ap2e7ybzRiiwofesMTM8y1fgAxNBmCivot0deuMfH9T+
         MAeE9zWFY1lmIlBcbYdO5709ZQVt6+jgbUZLfTaFjyMyj7DX2LEoJeXwUXglRj60VdSR
         YoOe1xKA4UnHDJb4WIr0UXpHhose23s936PJ7mcPH3AcV/yDPJoRIumvMGU2l9PWghQF
         4FV/yowgspSPaB3FaA8/lVYQGsKrqrKu2PjybaXjI7qGIhPkSW4YRo0nZa7/SNIDeQY1
         SPuOqj2MD3nqXr+2SxpSwUkWe1et1AA+xwSi1k73DwCY0ZibVTLYcR2mNWkPoBpi+XuN
         xz9g==
X-Gm-Message-State: AOAM533tCVest9DYb5PZU7GhDlecHs0zoXFv7gflb/kLt6CrGA1SvwUQ
	Gj6SkQ5q9xsF27qqkzFN4QW6S4AphTINaZFrY1qWPg==
X-Google-Smtp-Source: ABdhPJxerQCDpHXZnA9KTgVTzDifJLEqvTEPhYX2VlgbV9UIwj9HHJKrczBVySY03uMkanqr3QcgZFFKsNVy9Nzb2yQ=
X-Received: by 2002:a5d:6306:: with SMTP id i6mr1645894wru.400.1617720909976;
 Tue, 06 Apr 2021 07:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210405132946.22548-1-Sana.Kazi@kpit.com> <CAGDS+nkyKZpj-Q8ux-bS+Cy3Hjm_sggNRFCLvboeV=dZZtfg8w@mail.gmail.com>
 <BMXPR01MB32219E974A7341B0BD7ECE7E99769@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BMXPR01MB32219E974A7341B0BD7ECE7E99769@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 6 Apr 2021 04:54:57 -1000
Message-ID: <CAOSpxdaFUoTBE3p5YGVO+dvSGJQWzXdOWY5M9nZKDdeh0hLdMw@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] openssh: Whitelist CVE-2008-3844 and CVE-2020-15778
To: Sana Kazi <Sana.Kazi@kpit.com>
Cc: Steve Sakoman <sakoman@gmail.com>, 
	Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <Nisha.Parrakat@kpit.com>, 
	Purushottam Choudhary <Purushottam.Choudhary@kpit.com>, 
	Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 5, 2021 at 7:07 PM Sana Kazi <Sana.Kazi@kpit.com> wrote:
>
> Hi Steve,
>
> Whitelisted CVE-2020-15778 because it is reflected in recent CVE metrics=
 which you mailed on Sunday.

Yes, it is in the CVE metrics report because the openssh version in
dunfell has the vulnerability.

You haven't explained why we should whitelist it, i.e. an explanation
similar to what you did with CVE-2008-3844.

>  Thanks & Regards,
>
>  Sana Kazi
>  KPIT Technologies Limited
>
>
> ________________________________
> From: Steve Sakoman <sakoman@gmail.com>
> Sent: Tuesday, April 6, 2021 4:05 AM
> To: Sana Kazi <Sana.Kazi@kpit.com>
> Cc: Patches and discussions about the oe-core layer <Openembedded-core@l=
ists.openembedded.org>; Khem Raj <raj.khem@gmail.com>; Nisha Parrakat <Nish=
a.Parrakat@kpit.com>; Purushottam Choudhary <Purushottam.Choudhary@kpit.com=
>; Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
> Subject: Re: [OE-core] [poky][dunfell][PATCH] openssh: Whitelist CVE-200=
8-3844 and CVE-2020-15778
>
> On Mon, Apr 5, 2021 at 3:30 AM Sana Kazi <Sana.Kazi@kpit.com> wrote:
> >
> > Whitelisted below CVEs reported for openssh:
> >
> > CVE-2008-3844 was reported in OpenSSH on Red Hat Enterprise Linux
> > and certain packages may have been compromised and has been fixed
> > by Red Hat. This CVE is not applicable as our source is OpenBSD.
> > Hence, this CVE  is not reported for other distros and
> > can be whitelisted.
> > Links:
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fse=
curitytracker.com%2Fid%3F1020730&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%=
7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502855c7%7C0%7=
C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DAGj3kr88jZBCf2UP=
TYmok1x2orsmrY6AuLMBoTAmKSI%3D&amp;reserved=3D0
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fww=
w.securityfocus.com%2Fbid%2F30794&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com=
%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DCNOSXhh%2BTAlkW=
krnEpxS3v2p7JTwQH%2BL5idJyir1GOE%3D&amp;reserved=3D0
> >
> > For CVE-2020-15778 OpenSSH through 8.3p1 is affected.
> > Hence, it can be whitelisted for 8.2p1
>
> This explanation doesn't make sense to me!  If 8.2p1 is affected, why
> are you proposing to whitelist it?
>
> Steve
>
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnv=
d.nist.gov%2Fvuln%2Fdetail%2FCVE-2020-15778&amp;data=3D04%7C01%7CSana.Kazi%=
40kpit.com%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502=
855c7%7C0%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DOwC%2=
Flt6FcUUdt6aCUIk7mxk8a0QSC5%2F%2BLCX99yqZG2w%3D&amp;reserved=3D0
> >
> > Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> > ---
> >  meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 14 +++++++++++++=
+
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta=
/recipes-connectivity/openssh/openssh_8.2p1.bb
> > index fe94f30503..f8037db986 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> > @@ -32,6 +32,20 @@ SRC_URI[sha256sum] =3D "43925151e6cf6cee1450190c0e9=
af4dc36b41c12737619edff8bcebdff
> >  # and when running in a Kerberos environment. As such it is not relev=
ant to OpenEmbedded
> >  CVE_CHECK_WHITELIST +=3D "CVE-2014-9278"
> >
> > +# CVE-2008-3844 was reported in OpenSSH on Red Hat Enterprise Linux
> > +# and certain packages may have been compromised and has been fixed
> > +# by Red Hat. This CVE is not applicable as our source is OpenBSD.
> > +# Hence, this CVE  is not reported for other distros
> > +# and can be marked whitelisted.
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsecuritytracker.com%2Fid%3F1020730&amp;data=3D04%7C01%7CSana.Kazi%40kpit.c=
om%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502855c7%7C=
0%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DAGj3kr88jZBCf=
2UPTYmok1x2orsmrY6AuLMBoTAmKSI%3D&amp;reserved=3D0
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fwww.securityfocus.com%2Fbid%2F30794&amp;data=3D04%7C01%7CSana.Kazi%40kpit.=
com%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DCNOSXhh%2BTA=
lkWkrnEpxS3v2p7JTwQH%2BL5idJyir1GOE%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2008-3844"
> > +
> > +# For CVE-2020-15778 OpenSSH through 8.3p1 is affected.
> > +# Hence, it can be whitelisted for 8.2p1
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2020-15778&amp;data=3D04%7C01%7CSana.Ka=
zi%40kpit.com%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61=
502855c7%7C0%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DOw=
C%2Flt6FcUUdt6aCUIk7mxk8a0QSC5%2F%2BLCX99yqZG2w%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2020-15778"
> > +
> >  PAM_SRC_URI =3D "file://sshd"
> >
> >  inherit manpages useradd update-rc.d update-alternatives systemd
> > --
> > 2.17.1
> >
> > This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print, retain copy, disseminate, distribu=
te, or use this message or any part thereof. If you receive this message in=
 error, please notify the sender immediately and delete all copies of this =
message. KPIT Technologies Ltd. does not accept any liability for virus inf=
ected mails.
> >
> >
> >
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>
