Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C724C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:58:21 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.101485.1701788296576884782
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=pFfCkU7y;
 spf=pass (domain: baylibre.com, ip: 209.85.218.50, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a1a0bc1e415so533606966b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701788295; x=1702393095; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfxOlXniGM16TxYcUBzMqNiTDs8nM+cIATZS4+t1mss=;
        b=pFfCkU7y1ADutysTnoBgAs5ZcKmZaCe7JKN9ZA1xb8RxWqQdh+B+omth557iLdaMVN
         06DCNTY5VBe9kToGnkZrWCvjicAHFzp7uNOSrCef2fVoUDFhyfeEyQexK2zK2hxgzyej
         2XLJJasV+gH9GTO8w68cKxwOsam1Wph2sMSTmhhAC6WoyBnd/VeQEJ91QuhDnJMMGmIn
         Ri1XCLzp68v4QZbEKTD2ad6NFHaH93nH2j7y3mWhXmsPi5cUH05/S+jMpmjX9tcShxSM
         TatTXMpFjSltuTgcbzBemTegjpfNdLnN+RWsPdIN69OnU7gpw5q3qu7SI9QaHRhwMAsq
         0N7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788295; x=1702393095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfxOlXniGM16TxYcUBzMqNiTDs8nM+cIATZS4+t1mss=;
        b=JdBZS4lLk4NTNVidLroSzAVEATMuoxebg8pI/GDJLpAQRBbZxz1HpQuMMI3dNPpKrU
         n6qP8JvlJfFxqzj5sGfpISQ1sonfdbfluSZKAmVmhYm0X5l/8riBVQdNUpZqUSNbJ6ry
         tV5jy3FfAq+erNYTAeGMRYGgpyz3r8FNer3fOv2wMI9PhvfCkai/nvUwmtagKViNwzak
         MCwD2EpVsWRzYGcAsl73rZdj8H8LxJsN6ySGe+FNrIlI5OfzAMPvmeN9P11R2it9HDGA
         2XPOeCL0BymEV5MZ1Ru/j7zLI4d/CV5m4OBLv5wyOFAPcBhjLzSs66MOSyyEOBlQ0xGI
         fE4g==
X-Gm-Message-State: AOJu0YzwpMrNgHBvBfv8AtFVGYvYNUhpj4sGLH6DpKcIL3nHuHxZoy61
	N8hOmSf1VvSb4wWsH+rLQ4L/gspQdNkFsfNozM/Q2w==
X-Google-Smtp-Source: AGHT+IHjoEcq72ImvnpK8EPEhnugIfuENJU3yHnKALodHHm7rnzuOFC/1gX7pVKWWimZ8ouIPokA+ytmrlYXnP8YAKU=
X-Received: by 2002:a17:906:26c9:b0:a18:616b:cc3b with SMTP id
 u9-20020a17090626c900b00a18616bcc3bmr3614383ejc.38.1701788295038; Tue, 05 Dec
 2023 06:58:15 -0800 (PST)
MIME-Version: 1.0
References: <20231204155934.836992-1-jstephan@baylibre.com>
 <20231204155934.836992-2-jstephan@baylibre.com> <202312050750270cac2691@mail.local>
In-Reply-To: <202312050750270cac2691@mail.local>
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 5 Dec 2023 15:57:58 +0100
Message-ID: <CAEHHSvb2aKwWmS50G4QZ57oaBJmdkHME01ju4Wa-Nuo+Unnz0A@mail.gmail.com>
Subject: Re: [OE-core] [RESEND][PATCH 1/7] bitbake: utils: remove spaces on
 empty lines
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191840

Le mar. 5 d=C3=A9c. 2023 =C3=A0 08:50, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
> Please do not send bitbake patches in the same series as oe-core patches
> if there is no dependency. Those patches are applied on different
> repositories.

Hi Alexandre,

Noted! Do you want me to resend the series without the bitbake patch?

Cheers
Julien
>
> On 04/12/2023 16:59:28+0100, Julien Stephan wrote:
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  bitbake/lib/bb/utils.py | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
> > index b401fa5ec7a..61ffad92ce3 100644
> > --- a/bitbake/lib/bb/utils.py
> > +++ b/bitbake/lib/bb/utils.py
> > @@ -50,7 +50,7 @@ def clean_context():
> >
> >  def get_context():
> >      return _context
> > -
> > +
> >
> >  def set_context(ctx):
> >      _context =3D ctx
> > @@ -212,8 +212,8 @@ def explode_dep_versions2(s, *, sort=3DTrue):
> >              inversion =3D True
> >              # This list is based on behavior and supported comparisons=
 from deb, opkg and rpm.
> >              #
> > -            # Even though =3D<, <<, =3D=3D, !=3D, =3D>, and >> may not=
 be supported,
> > -            # we list each possibly valid item.
> > +            # Even though =3D<, <<, =3D=3D, !=3D, =3D>, and >> may not=
 be supported,
> > +            # we list each possibly valid item.
> >              # The build system is responsible for validation of what i=
t supports.
> >              if i.startswith(('<=3D', '=3D<', '<<', '=3D=3D', '!=3D', '=
>=3D', '=3D>', '>>')):
> >                  lastcmp =3D i[0:2]
> > @@ -347,7 +347,7 @@ def _print_exception(t, value, tb, realfile, text, =
context):
> >          exception =3D traceback.format_exception_only(t, value)
> >          error.append('Error executing a python function in %s:\n' % re=
alfile)
> >
> > -        # Strip 'us' from the stack (better_exec call) unless that was=
 where the
> > +        # Strip 'us' from the stack (better_exec call) unless that was=
 where the
> >          # error came from
> >          if tb.tb_next is not None:
> >              tb =3D tb.tb_next
> > @@ -746,9 +746,9 @@ def prunedir(topdir, ionice=3DFalse):
> >  # but thats possibly insane and suffixes is probably going to be small
> >  #
> >  def prune_suffix(var, suffixes, d):
> > -    """
> > +    """
> >      See if var ends with any of the suffixes listed and
> > -    remove it if found
> > +    remove it if found
> >      """
> >      for suffix in suffixes:
> >          if suffix and var.endswith(suffix):
> > @@ -1001,9 +1001,9 @@ def umask(new_mask):
> >          os.umask(current_mask)
> >
> >  def to_boolean(string, default=3DNone):
> > -    """
> > +    """
> >      Check input string and return boolean value True/False/None
> > -    depending upon the checks
> > +    depending upon the checks
> >      """
> >      if not string:
> >          return default
> > --
> > 2.42.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191754): https://lists.openembedded.org/g/openembed=
ded-core/message/191754
> > Mute This Topic: https://lists.openembedded.org/mt/102972946/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

