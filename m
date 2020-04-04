Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.8477.1586006292268555631
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 06:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DFxXHRb3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id h2so2024124wmb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2020 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+Xn94/W5MilAcMa7YHXG8qEHy+Cr+JuqKf4hPnUhZlI=;
        b=DFxXHRb3UrAdwRT97oloVE8Y1OOQFTE9F5NkUw9pan8APSW37K54O5fHG1CYlC9n6e
         YHxAvIHMMUWocFW2AXjIWXo/0lL6Lp3anAwOmHXVDOuHveBRsuR9VIUybgyYGtX7axDS
         6ncvHVi7V3OQrWQr3pPFixF3vO+DvHtA6c8Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+Xn94/W5MilAcMa7YHXG8qEHy+Cr+JuqKf4hPnUhZlI=;
        b=WA58ICvtGdaDjn/VLE9IR5Gaq/KOsUDnYyKjprp+7/uXMkmsACuo76JxInRmsrfk+G
         WR/XalIjBQhe8ilx/M/NYjJQPlFz2unFy6C+X/Qz7OViN//Pwd8RdibR3pYh5hC/31dl
         MLH9Jxv1MuwsXm3mbLhLVRnqsSWy0JhrdjsfAe4ybC0aTNRQ6pHkt8zG2maZtAiU9eqv
         dA3zWC8GU+jTqpRraZr/6Jk1vqmCxKeg8tO4I6FJHrGdskP5xAWknsAOa6GZonwFga2w
         bzAtgyTFTN8CmnJjmissj2oS4Ra8vjmheDp1eS2lg0WyqYMinSjAZAOl47XeSXzUV1h0
         pfYg==
X-Gm-Message-State: AGi0PubunqzX4PJPY2chVdLWUecqOtfdB7aFYlbsSOe9aHTS9oELbS4o
	wDG8uB4kTBRU5FlYTgaNXOOOiQ==
X-Google-Smtp-Source: APiQypKXXw1hGnQBr8eyaYpR7YJ6kvUkv7SDqQXc2+yMOCouIyz3lkJdtnKdv8n7kcWd330xuZLb+w==
X-Received: by 2002:a1c:2203:: with SMTP id i3mr3055807wmi.0.1586006290592;
        Sat, 04 Apr 2020 06:18:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a2sm7515120wra.71.2020.04.04.06.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 06:18:10 -0700 (PDT)
Message-ID: <5f1c53fb3f52a4d124bf9a8bf646639b6edfccb8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bin_package.bbclass: emphasize setting of S with "subdir"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Sat, 04 Apr 2020 14:18:08 +0100
In-Reply-To: <alpine.LFD.2.21.2004040856460.14065@localhost.localdomain>
References: <alpine.LFD.2.21.2004040758090.11753@localhost.localdomain>
	 <e67a1e376aacd73587ebc4f6c938b732e87a3fd8.camel@linuxfoundation.org>
	 <alpine.LFD.2.21.2004040856460.14065@localhost.localdomain>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-04-04 at 09:01 -0400, Robert P. J. Day wrote:
> On Sat, 4 Apr 2020, Richard Purdie wrote:
> 
> > On Sat, 2020-04-04 at 08:00 -0400, rpjday@crashcourse.ca wrote:
> > > Clarify the setting of "S" so there is absolutely no confusion.
> > > 
> > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > > 
> > > ---
> > > 
> > > diff --git a/meta/classes/bin_package.bbclass
> > > b/meta/classes/bin_package.bbclass
> > > index cbc9b1fa13..4e74557967 100644
> > > --- a/meta/classes/bin_package.bbclass
> > > +++ b/meta/classes/bin_package.bbclass
> > > @@ -14,8 +14,8 @@
> > >  #
> > >  # SRC_URI = "http://foo.com/foo-1.0-r1.i586.rpm;subdir=foo-1.0"
> > >  #
> > > -# Then the files would be unpacked to ${WORKDIR}/foo-1.0,
> > > otherwise
> > > -# they would be in ${WORKDIR}.
> > > +# Then the files would be unpacked to S=${WORKDIR}/foo-1.0,
> > > otherwise
> > > +# they would be in S=${WORKDIR}.
> > >  #
> > 
> > I strongly disagree actually. Setting subdir in SRC_URI does not
> > change
> > the value of S. What happens is what the comment says, its unpacked
> > to
> > ${WORKDIR}/foo-1.0, or ${WORKDIR}. The value of S remains at
> > whatever
> > its set to.
> 
>   so if one inherits bin_package and uses a "subdir" option, what is
> installed (via tar) is the entire subdir directory structure, as in
> 
>   foo-1.0/*

That sounds more confusing.

The source component of SRC_URI that has subdir set against it is
extracted to ${WORKDIR}/<subdir> rather than ${WORKDIR}/. Nothing more,
nothing less.

> unless the recipe explicitly sets S to match it, is that it? that
> might be worth noting in the comments, then.

S has nothing to do with this so stop trying to include it.

Cheers,

Richard


