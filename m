Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 56F1177B8B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 19:34:37 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id o143so10058898ywd.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 12:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8NWXrS/5fE3/OGOP1QCLJNwrTwzcW9ZZ9fiIgzfnan4=;
	b=OY50qZCj3HkfLCDM3hBQ8Y1o3ThG9nuaktIgLIBIZOTqGlIFb+xGSP8Fu+wiqXTz84
	IyADqgXkM/4mLiECIdnOURNAJV+3tum4SyjnuPKQHfXwKZz2eBNaLxExPzhHAQV0s/wN
	zJXJJAFN1P3+QrBGAGfTTyf+UzImtezcE3oYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8NWXrS/5fE3/OGOP1QCLJNwrTwzcW9ZZ9fiIgzfnan4=;
	b=N/f+B5MsSJ9nbCmGBd3v5Pgm6Q/Nv6B/mLea9ibs3NnDUxLaMNu0zpK+DiQJ+5qT7s
	MWhBPG4kEY+o0xnu4MgQjiw/Do71CnBp+Q/YLgBY2OGsqUJ4iWlcZTtrDh0CttAYKWQk
	jn8zbexlcKOmn7txTS3WzZsLE3BhI0DKGpN07+i/bTg8Lg5nOSiqXMt4t8MbzsKbzZGj
	8+J4K576QiMFqtExY3DDjuPTvO0+05VGLx+L9Gmfv4ItURZ8RJPEHoxr2mGh2W0ETRbF
	1G7Zdk1mwrE5bEQ1+EAQFSd4lyrKzXCHeC2XvLmFuDRWe9ah/LOYAXzb07EkZ+nxGqFb
	wIkQ==
X-Gm-Message-State: AHPjjUgSrOYAl+bnP7BOloWO+ng6FyRJrY/f4fJGNT0QhVlnIDk5P/ej
	CHqYWSl8MP16FHU6TTuF+suIxw==
X-Google-Smtp-Source: AOwi7QA9DPLlGUtl3Ct0Wh3S8H+V4Hfia64MFC6hetj8NWlDfWnQVxKuOk0Y8rKa8YQlrqByHxc/vQ==
X-Received: by 10.13.195.7 with SMTP id f7mr1753340ywd.411.1506540879171;
	Wed, 27 Sep 2017 12:34:39 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:a523:8806:2b32:ed54])
	by smtp.gmail.com with ESMTPSA id z5sm4945552ywf.21.2017.09.27.12.34.38
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Sep 2017 12:34:38 -0700 (PDT)
Date: Wed, 27 Sep 2017 15:34:41 -0400
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170927193441.GA3112@bill-the-cat>
References: <1506531609-5917-1-git-send-email-trini@konsulko.com>
	<CAJTo0Lbw39PVXdjqvtksLxcsWWhYR4GGXO1+RAGuXcnH2QX4fw@mail.gmail.com>
	<20170927175218.GZ3112@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20170927175218.GZ3112@bill-the-cat>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Fix bmaptool support for RSS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Sep 2017 19:34:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 27, 2017 at 01:52:18PM -0400, Tom Rini wrote:
> On Wed, Sep 27, 2017 at 06:10:58PM +0100, Burton, Ross wrote:
> > On 27 September 2017 at 18:00, Tom Rini <trini@konsulko.com> wrote:
> > 
> > > With RSS we need to ensure that when making a bmap image that the
> > > python3 that we created is found via /usr/bin/env rather than the host
> > > python3.  Otherwise we're relying on the build host to have bmaptool
> > > support installed.
> > >
> > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > ---
> > > I played around with a few ways to try and fix this problem, and this
> > > was the best I could come up with.  Once this is in we need this in pyro
> > > as well as it's broken there too.
> > 
> > Doesn't bmap in Pyro use Python 2?
> 
> I hadn't tested my fix in pyro yet, only confirmed that it was broken
> there.  I'll check and get back to you on that part.

OK, I need to investigate the pyro failure I saw more to see what else
was going in there.  Just oe-core pyro is fine as bamptool uses python2
and .../recipe-sysroot-native/usr/bin/bmaptool is /usr/bin/env
nativepython which is also in usr/bin and is thus found.

-- 
Tom

