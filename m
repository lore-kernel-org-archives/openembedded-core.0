Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.898.1627507279606987946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 14:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kj0kxmyX;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id r17so6610714lfe.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 14:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bE25nYAMxD3anziSplPB9nLkEXoDpKsTBwnnTXKCypk=;
        b=kj0kxmyXlycSmcnpKrgWAMO5n7bgbo4kTK6iRu2FR/WPNwv5uelUXXWW25a1LXhMFw
         WwPuYr2HZYlF542YdY46QulOht6vMdmdPbE/9zs2SH5f1KGCsAeZhMNBvNfBqIRc1KLT
         DnwQsajTA5nV6YT54muNamXStRaNEw7aRUL58sUuyKmQx2OfpZhO4bsEkvEo0BitXf6A
         HSUN8NSeI5qAy3cr3NhqWmN9a9Q4YE38R11SzvpVeX4FrWB2kQXJUOGlcgEAuUq0sV90
         OisLLhG+4yBCwz4tdtB8YfTYX+aNWZHs1hGz3PBypsQU8/zBQQK3dkpluY6Lm0aigZTi
         BqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bE25nYAMxD3anziSplPB9nLkEXoDpKsTBwnnTXKCypk=;
        b=o6xKiHbLSBl4hxD1ZWESsO/r3kw4g5t2OBO9720UU9CQye3QTpDRUAbZGOf4KPQnvk
         1MR3GAi4i3WXvPa5nusdnyVzCODIH/bL4EmljhaM9/nzJHCDVx4EzUFPRFjkpxDUtYWH
         a55qPkK+OSO7Xu2RvuEvz52SgmK3vjxnxhX5+EuOsQB495scqdDCKiUEtvyiZchnGbaz
         XrTsfMh3MISFfE5e/etvaw/lE0Pcld8Jreppu5k1B6ephRH0wjrrwX/kCuLvtXG8hjmv
         4YF4/knLZkJCe6Fq885kC4X4x3oMzXLuvBAXezw9BbbRsp/3oCbjhKL47Tb6ClyJ4vg6
         NbrQ==
X-Gm-Message-State: AOAM5313VNYgz40/nKe4mLGwVc43/DhDnTZBCstUwD7A7f/CbywsXp/w
	C6+dkXFu5hCslD/2xDwwJmd6cDNYAvq3f9prTa8=
X-Google-Smtp-Source: ABdhPJzeyfboCjlbG0mt72iI5SCTkwDPdCjABC5k1ZedYMmlMMm12FbO+DJZqtobNum3RdUqlznYCRn1kJLfVYnnK90=
X-Received: by 2002:a05:6512:2205:: with SMTP id h5mr1147188lfu.257.1627507277240;
 Wed, 28 Jul 2021 14:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210728141506.3287158-1-richard.purdie@linuxfoundation.org>
 <20210728141506.3287158-3-richard.purdie@linuxfoundation.org>
 <CAJ86T=UNcf=Tzj4hq2uwXJzmtio71YZExLsr6zqOZr-ZAq9trQ@mail.gmail.com>
 <16960CD0F3F5D3AD.12099@lists.openembedded.org> <ca0a10a951237a41cda24eefa7300ea646f98c23.camel@linuxfoundation.org>
 <CAJ86T=WsJFYMYYuu9x4rrh+MfWufpmg2NWQk0rhuL0PS7626hw@mail.gmail.com> <51bf429c4259da7c57c70d28661c16d0ef68285d.camel@linuxfoundation.org>
In-Reply-To: <51bf429c4259da7c57c70d28661c16d0ef68285d.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 28 Jul 2021 14:21:05 -0700
Message-ID: <CAJ86T=WoknfuEhtgS3dOL=Xz1jsjPCViU5jXSTy703vK9cijCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] meta: Manual override fixes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 28, 2021 at 1:54 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-07-28 at 13:43 -0700, Andre McCurdy wrote:
> > On Wed, Jul 28, 2021 at 1:24 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2021-07-28 at 21:00 +0100, Richard Purdie via lists.openembedded.org wrote:
> > > > On Wed, 2021-07-28 at 12:32 -0700, Andre McCurdy wrote:
> > > > > On Wed, Jul 28, 2021 at 7:15 AM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > >
> > > > > > The automated conversion of OE-Core to use the new override sytax isn't
> > > > > > perfect. This patches some mis-converted lines and some lines which were missed
> > > > > > by the automation.
> > > > > >
> > > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > > > @@ -86,7 +86,7 @@ python systemd_populate_packages() {
> > > > > >          bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
> > > > > >
> > > > > >          paths_escaped = ' '.join(shlex.quote(s) for s in d.getVar('SYSTEMD_SERVICE:' + pkg).split())
> > > > > > -        d.setVar('SYSTEMD_SERVICE:ESCAPED_' + pkg, paths_escaped)
> > > > > > +        d.setVar('SYSTEMD_SERVICE_ESCAPED:' + pkg, paths_escaped)
> > > > >
> > > > > This is manually fixing the misconversion of _ESCAPED to :ESCAPED,
> > > > > right? If so then does it mean a bug in the automatic conversion
> > > > > script since overrides can't be uppercase?
> > > >
> > > > There are several bugs in the script, yes. The question is how far to go
> > > > in trying to address them and this wasn't a common issue.
> > >
> > > In case it isn't clear, this isn't as easy as you might first think. We need
> > > to convert SYSTEMD_SERVICE_${PN} which has uppercase characters in it. Can it
> > > be fixed? Probably, yes. Is it worth the effort/complexity? Maybe not.
> >
> > I haven't read the script but doesn't it distinguish between things
> > following an _ which might be an override (and will never be all
> > uppercase) and the variable name which is being overridden (which may
> > be uppercase)?
>
> The script is not a parser in any sense, it is looking for expressions using
> pattern matching and making changes based upon that. It is quite horrible in
> some ways, equally it is doing a reasonable job of the conversion on the most
> part too.
>
> > Since the script will be reused many times for many private layers I'd
> > say making it as robust as possible is a worthy goal.
>
> Well, sure. I have spent days on it and improved it several times over compared
> to what it did do. I have it working for 10,000 cases in OE-Core with around 40
> exceptions which I didn't think was too bad. I felt I'd reached the point of
> diminishing returns with it. As with most things, we can improve it and patches
> are welcome.

Unfortunately those most affected by shortcomings in the script are
probably also those least likely to submit patches for it. Just as
those most affected by the new recipe syntax were probably not reading
oe-arch when you proposed the change and asked for feedback. They will
instead find out about it months or years from now when they discover
their meta layers don't work when they try using a new release of OE.
At that point a lot of them will just shug and keep on using 3.1
LTS...

> I'm more worried that the patterns of metadata in the wild may be quite different
> to what we've trained the script with in OE-Core too, that may be a much more
> important issue.

Yes, that's a concern too. Looking at the script now it seems to be
mostly a long list of exceptions. The chances of it working well on
layers you haven't considered don't look too good.
