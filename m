Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.448.1627504998502171938
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 13:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RbrtyoOh;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id r26so6430691lfp.5
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 13:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3b6P/oV0SBNw8d6ecgB4pPdorX2cIujUN4hSO+TWSz0=;
        b=RbrtyoOhef2EghXpStrTrpqnsIygwb1F+myYBsH/bX2AoyDwRcAmuALMLXqcrcDtkS
         rYPJrMPWQ/d6X4lJwbIWNActZF6lMDZATNY8kcY+03rdvus3e1GeHufF0u1U7ngYyGAW
         rsUuUzVEI1rdg0mx7PBwcuSShCStWAKs0T5HqvB7bs/8aZno6Sg+lFRPvz4A5NFdsDM9
         9TR7MlsSy/RP88Fep4yvpEcZOe7Pl7T8sAVQG3v9+Vbbk+bN2yFQ49gV59OUmsNXXK+U
         4Gk3BNA/yPIuYiMPIFPtdlVwmVgYgkQ9TMv5MTgIX8KRVpGYx891hmfBW2+RbTEXwovN
         caCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3b6P/oV0SBNw8d6ecgB4pPdorX2cIujUN4hSO+TWSz0=;
        b=tEluCX7duuozGpiMeCaB/aYVqozgfcGkpbRwdwlzbLEOORtIK5nz0ru5toH6edj+qI
         IzdbWKTOhD6KImbraPbTycLlc86hbaK48xh5xr8iXT1fJN83dYMkSlpj5MFAJWt/aO83
         VU/1sjhPz0yRZ7Fk1xtzFcrzgnPWyxQuCIKln0f76ttXFTj0jwCaHcnTLIg/SEJaTW8/
         Mu6mtPzt9WCYfIgH8QNRmS59WT1uzWSRgpq4ICS/OoN1io8HmrALNbIyHEEELSxoxHM0
         vswX9QJdtBbe0U1xhjD7hNMRny6xdmXZ/1PR2nY0EVxSGQsEhU8Jceg32dPX1YZaALps
         CLVQ==
X-Gm-Message-State: AOAM533X2bigrmyM+HGPqjtmYxWbNRxKoats8GOLufOWJAHRifI0C/mU
	OV5HrRELG9p483jpB4cgfoRR7ciFp+D0JOkcel4=
X-Google-Smtp-Source: ABdhPJw0KgtTR/R1qLhdKScVinRJk/czOPzumqD8LAxY3BUHDOiajuQMT040W+I8jwaiMdc7tzhT6JeipYkURr467dI=
X-Received: by 2002:a05:6512:34ce:: with SMTP id w14mr1022976lfr.482.1627504996450;
 Wed, 28 Jul 2021 13:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210728141506.3287158-1-richard.purdie@linuxfoundation.org>
 <20210728141506.3287158-3-richard.purdie@linuxfoundation.org>
 <CAJ86T=UNcf=Tzj4hq2uwXJzmtio71YZExLsr6zqOZr-ZAq9trQ@mail.gmail.com>
 <16960CD0F3F5D3AD.12099@lists.openembedded.org> <ca0a10a951237a41cda24eefa7300ea646f98c23.camel@linuxfoundation.org>
In-Reply-To: <ca0a10a951237a41cda24eefa7300ea646f98c23.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 28 Jul 2021 13:43:04 -0700
Message-ID: <CAJ86T=WsJFYMYYuu9x4rrh+MfWufpmg2NWQk0rhuL0PS7626hw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] meta: Manual override fixes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 28, 2021 at 1:24 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-07-28 at 21:00 +0100, Richard Purdie via lists.openembedded.org wrote:
> > On Wed, 2021-07-28 at 12:32 -0700, Andre McCurdy wrote:
> > > On Wed, Jul 28, 2021 at 7:15 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > The automated conversion of OE-Core to use the new override sytax isn't
> > > > perfect. This patches some mis-converted lines and some lines which were missed
> > > > by the automation.
> > > >
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > @@ -86,7 +86,7 @@ python systemd_populate_packages() {
> > > >          bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
> > > >
> > > >          paths_escaped = ' '.join(shlex.quote(s) for s in d.getVar('SYSTEMD_SERVICE:' + pkg).split())
> > > > -        d.setVar('SYSTEMD_SERVICE:ESCAPED_' + pkg, paths_escaped)
> > > > +        d.setVar('SYSTEMD_SERVICE_ESCAPED:' + pkg, paths_escaped)
> > >
> > > This is manually fixing the misconversion of _ESCAPED to :ESCAPED,
> > > right? If so then does it mean a bug in the automatic conversion
> > > script since overrides can't be uppercase?
> >
> > There are several bugs in the script, yes. The question is how far to go
> > in trying to address them and this wasn't a common issue.
>
> In case it isn't clear, this isn't as easy as you might first think. We need
> to convert SYSTEMD_SERVICE_${PN} which has uppercase characters in it. Can it
> be fixed? Probably, yes. Is it worth the effort/complexity? Maybe not.

I haven't read the script but doesn't it distinguish between things
following an _ which might be an override (and will never be all
uppercase) and the variable name which is being overridden (which may
be uppercase)?

Since the script will be reused many times for many private layers I'd
say making it as robust as possible is a worthy goal.
