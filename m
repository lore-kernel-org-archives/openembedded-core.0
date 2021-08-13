Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.43291.1628892050588401897
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 15:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=h0UBrURZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.49, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f49.google.com with SMTP id k29so15087108wrd.7
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 15:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fbJA/+KQ5KSa/Njn16WW4yxwXrx49J0NJp+9hvRYbv4=;
        b=h0UBrURZU4vWm9V2+IgBxsOHQbi7Jns0nCXwTuLEjLzsFgQY4lvYwI0RW5QPIcrQx+
         jUGSleh9x3mjeBHNpV0LPFEoaZ7RPSPqhZHT8V6mEt6UWg7RFJMwU7u7e2iCUHHU62Wl
         wkEB1a/pJQ80P5xDzsjg0grGQuQzA5ycG8Q2jgvnIP0l9keSqwk8BIG2u5sRU26noqzP
         eYc7me4FSGcBFaHj/aDifJxeqK6bAk1TS6AXWKJaoFP4H2PRhs2kGCZtH6nZWaVnX3wD
         bEUcdFgaSgyflNyAeIZiaw723SYxarBVeawHNRhAmX6uIwPl/7liBfUsTzGlY95ZduKS
         kDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fbJA/+KQ5KSa/Njn16WW4yxwXrx49J0NJp+9hvRYbv4=;
        b=hRlp9a0ir4CKYKLMub+w00Yo/qNq1oZq3tMCLCQYsD3fVKy2ETYRAQY970OWdBEj+5
         mJQsjwgVUJ3vCMkJYtWvEHR7w+9D/Cpcr4wmArRpTbEjtLoUK8N1MTnvRriayh10bOO3
         3nAnK01UyaymzOP310enoKh5LCPAKr3eWD51C1G0AoTdAsPnJjkYpngk74BWTElyV1m7
         6Uk82cWy5sDWKy1eDs+oAdevLZx4IrPtmrVVc35IBUhp6BHWFShaM0sYFYFN5pyovCQS
         Gq/RaD1bRm4lS+c5RVKhyb1qVIfpNTZmne1AJ4YZ629XnydvI/TefB6KdIUW2TbVJDI+
         /Ekw==
X-Gm-Message-State: AOAM530i4Lq1qftpcU1cPrIhGC9HedffjrWCt3ujEwdbmi8MZIbupwG0
	ekmAWFZrkV5BXLIpew6uA/1UWDvBWlVuwL5CaSDObw==
X-Google-Smtp-Source: ABdhPJzc5aiHWW1jP/T3dgPOzHnOaonqRvu4QqgCEB7pgCJPJbFKu9oQZnPEBuDM6i0AqOP3vvc5N6vMW+faW8xcHAQ=
X-Received: by 2002:adf:ebcd:: with SMTP id v13mr4508142wrn.400.1628892049197;
 Fri, 13 Aug 2021 15:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628863869.git.steve@sakoman.com> <3ebaa86707ea99e8272dafc442318e3a5f483018.1628863869.git.steve@sakoman.com>
 <00a408d147c98960dbf2bb8980bd20a1b6616b7a.camel@linuxfoundation.org>
In-Reply-To: <00a408d147c98960dbf2bb8980bd20a1b6616b7a.camel@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 13 Aug 2021 12:00:37 -1000
Message-ID: <CAOSpxdZ0Pqu+MbYkzD3Fur=Xf1TZgrnc4RHeMb8nyYoRXXSzKw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 07/17] image: Drop COMPRESS_CMD
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 13, 2021 at 11:57 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-08-13 at 04:29 -1000, Steve Sakoman wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > This was replaced by CONVERSION_CMD a long time ago and is no longer referenced
> > in core. Remove the references to it.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 576d52cdaca047d290c3b10b26aa2244da230dbb)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes/image.bbclass | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index 1900eff412..0e252e99ff 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -460,11 +460,10 @@ python () {
> >                      # Create input image first.
> >                      gen_conversion_cmds(type)
> >                      localdata.setVar('type', type)
> > -                    cmd = "\t" + (localdata.getVar("CONVERSION_CMD_" + ctype) or localdata.getVar("COMPRESS_CMD_" + ctype))
> > +                    cmd = "\t" + localdata.getVar("CONVERSION_CMD_" + ctype)
> >                      if cmd not in cmds:
> >                          cmds.append(cmd)
> >                      vardeps.add('CONVERSION_CMD_' + ctype)
> > -                    vardeps.add('COMPRESS_CMD_' + ctype)
> >                      subimage = type + "." + ctype
> >                      if subimage not in subimages:
> >                          subimages.append(subimage)
>
> Not sure this is appropriate for a stable series?
>
> Yes, we got rid of this a while ago and there are no core references but
> there is a small chance other layers might.

Good point!  I'll drop this patch when I send the pull request.

Steve
