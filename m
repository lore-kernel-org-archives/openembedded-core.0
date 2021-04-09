Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.6608.1617960685605676206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 02:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=gEZ8XvfQ;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pemorrow@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1045)
	id EC84B20B5681; Fri,  9 Apr 2021 02:31:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EC84B20B5681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1617960684;
	bh=ePOJXUzzeTTauHmKJGfOHfUswLZCkbXPSg7oqN6Q4Xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gEZ8XvfQGcGBtfkO2oOehIJVUg1lxHbbIEgITq0fy7IbTvNyOps5kchFTodrJjMkW
	 wN4MOHAFF700faI3sB8Wr3ONcaa7FnHhcSZ3/2OyU8NNniwuhcGoPfVS+hEshGfG+2
	 vJHdaJinSg3sMfF1XpJST/2ZSEnGFErOS/gWMdws=
Date: Fri, 9 Apr 2021 02:31:24 -0700
From: "Peter Morrow" <pemorrow@linux.microsoft.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, peter.morrow@microsoft.com
Subject: Re: [dunfell][PATCH 1/2] goarch: map target os to windows for mingw* TARGET_OS
Message-ID: <20210409093124.GA32252@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1617714478-10348-1-git-send-email-pemorrow@linux.microsoft.com>
 <CAMKF1spzWbNYUOSNkwExTRF4H1dc7H7+1Yb3QQfNt_hWo-Qrgg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spzWbNYUOSNkwExTRF4H1dc7H7+1Yb3QQfNt_hWo-Qrgg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 06, 2021 at 08:21:59AM -0700, Khem Raj wrote:
> Lgtm

Thanks Khem!

Peter.


> 
> On Tue, Apr 6, 2021 at 6:08 AM Peter Morrow <pemorrow@linux.microsoft.com>
> wrote:
> 
> > mingw32/mingw64 is not a supported value for GOOS, so map from 'mingw*' to
> > 'windows' to enable building for windows targets.
> >
> > Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> > ---
> >  meta/classes/goarch.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> > index 1099b95..ecd3044 100644
> > --- a/meta/classes/goarch.bbclass
> > +++ b/meta/classes/goarch.bbclass
> > @@ -114,6 +114,8 @@ def go_map_mips(a, f, d):
> >  def go_map_os(o, d):
> >      if o.startswith('linux'):
> >          return 'linux'
> > +    elif o.startswith('mingw'):
> > +        return 'windows'
> >      return o
> >
> >
> > --
> > 1.8.3.1
> >
> >
