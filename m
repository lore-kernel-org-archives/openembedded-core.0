Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.574.1627505642462785168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 13:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I4CUn5X1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id b7so4099212wri.8
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=SSn8YpwUEfT6an/IuPKw5GULisslBoqzPRkBMyaoN4I=;
        b=I4CUn5X1JcFRWuUeZG502L/ND3x56iSI+x+upAOtMqxbxpEc+qbX2XX8Hn8A1WeDzs
         UcMbMQuDNy79SvntUMT49RA+0UUDrrEXniqpfWqHeCXME2Pa9jG+8O7DnLQSmLu8eRj1
         7OGGWxENuwywcFuO/TjrBbvLROCS8WLcjujRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SSn8YpwUEfT6an/IuPKw5GULisslBoqzPRkBMyaoN4I=;
        b=JAIOUdAszKx9UqWwrs6re/KAV7p83Y5/yf9S/fTzUZ9wFIGb5OIbqH2ncGvSnAzvsX
         GKViABK0Wb7Y7X9rz470OcaU2THmMU9OqheRuOexGPaL6N5WLxJ7TmN9Q0bli7PO23f3
         SPo0hMsMa8OiwYid/xfB1VcDWG+yysim/RimghIcmWUcHzucrDWOVBrOtvLU5ie+Efy7
         JQ0vvq2a8kzzMjWReai30nU96aiqxI1TdXlbTg77DHdvuu4Rz+S1eG2P21aEU/I4F1pE
         eDbJnyWDUsfKGBo4RCOqsHDKISVgiviuMLuFGc/tTtytFw8/J9Y0MpjVFUjq0cEdssej
         3isQ==
X-Gm-Message-State: AOAM530zSMy910FV8f+x6dPQgZ3CsMg9xNyNgukvYM4iv8SXHi7e7XYc
	PXNQk26FnP3QzNkQOzby6+ijqA==
X-Google-Smtp-Source: ABdhPJzIdI0OjsHACRLmDKHQcUhg4AJSwzfplSgKxlkwMDt+U/iubFXjmLT7izrFkQefcUq6D79ymg==
X-Received: by 2002:adf:c803:: with SMTP id d3mr1183986wrh.345.1627505640882;
        Wed, 28 Jul 2021 13:54:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:824:a750:d1fb:a5cc? ([2001:8b0:aba:5f3c:824:a750:d1fb:a5cc])
        by smtp.gmail.com with ESMTPSA id r2sm907799wrq.15.2021.07.28.13.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 13:54:00 -0700 (PDT)
Message-ID: <51bf429c4259da7c57c70d28661c16d0ef68285d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] meta: Manual override fixes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Jul 2021 21:53:59 +0100
In-Reply-To: <CAJ86T=WsJFYMYYuu9x4rrh+MfWufpmg2NWQk0rhuL0PS7626hw@mail.gmail.com>
References: <20210728141506.3287158-1-richard.purdie@linuxfoundation.org>
	 <20210728141506.3287158-3-richard.purdie@linuxfoundation.org>
	 <CAJ86T=UNcf=Tzj4hq2uwXJzmtio71YZExLsr6zqOZr-ZAq9trQ@mail.gmail.com>
	 <16960CD0F3F5D3AD.12099@lists.openembedded.org>
	 <ca0a10a951237a41cda24eefa7300ea646f98c23.camel@linuxfoundation.org>
	 <CAJ86T=WsJFYMYYuu9x4rrh+MfWufpmg2NWQk0rhuL0PS7626hw@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-28 at 13:43 -0700, Andre McCurdy wrote:
> On Wed, Jul 28, 2021 at 1:24 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Wed, 2021-07-28 at 21:00 +0100, Richard Purdie via lists.openembedded.org wrote:
> > > On Wed, 2021-07-28 at 12:32 -0700, Andre McCurdy wrote:
> > > > On Wed, Jul 28, 2021 at 7:15 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > 
> > > > > The automated conversion of OE-Core to use the new override sytax isn't
> > > > > perfect. This patches some mis-converted lines and some lines which were missed
> > > > > by the automation.
> > > > > 
> > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > > @@ -86,7 +86,7 @@ python systemd_populate_packages() {
> > > > >          bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
> > > > > 
> > > > >          paths_escaped = ' '.join(shlex.quote(s) for s in d.getVar('SYSTEMD_SERVICE:' + pkg).split())
> > > > > -        d.setVar('SYSTEMD_SERVICE:ESCAPED_' + pkg, paths_escaped)
> > > > > +        d.setVar('SYSTEMD_SERVICE_ESCAPED:' + pkg, paths_escaped)
> > > > 
> > > > This is manually fixing the misconversion of _ESCAPED to :ESCAPED,
> > > > right? If so then does it mean a bug in the automatic conversion
> > > > script since overrides can't be uppercase?
> > > 
> > > There are several bugs in the script, yes. The question is how far to go
> > > in trying to address them and this wasn't a common issue.
> > 
> > In case it isn't clear, this isn't as easy as you might first think. We need
> > to convert SYSTEMD_SERVICE_${PN} which has uppercase characters in it. Can it
> > be fixed? Probably, yes. Is it worth the effort/complexity? Maybe not.
> 
> I haven't read the script but doesn't it distinguish between things
> following an _ which might be an override (and will never be all
> uppercase) and the variable name which is being overridden (which may
> be uppercase)?

The script is not a parser in any sense, it is looking for expressions using
pattern matching and making changes based upon that. It is quite horrible in
some ways, equally it is doing a reasonable job of the conversion on the most
part too.

> Since the script will be reused many times for many private layers I'd
> say making it as robust as possible is a worthy goal.

Well, sure. I have spent days on it and improved it several times over compared
to what it did do. I have it working for 10,000 cases in OE-Core with around 40 
exceptions which I didn't think was too bad. I felt I'd reached the point of 
diminishing returns with it. As with most things, we can improve it and patches
are welcome.

I'm more worried that the patterns of metadata in the wild may be quite different
to what we've trained the script with in OE-Core too, that may be a much more
important issue.

Cheers,

Richard


