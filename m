Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC1C7C3D9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 17:47:08 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r17so4401309wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 09:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=LT84pF//vC4wed8+3x3v5D1SpOhRHHNv9OgCtH0oZvE=;
	b=ar0CUaADpPkCm6bECr2TLApxl52rNh6GEV6Nc1XEqy686fU8APLpkG4AFwNc/2JEZW
	gcYeST85Qpe6qvE6WAllqjgzvfm2pxl3yeDfF9nA5kzVG9hpXK6PFnnJPco0TBuDSt1K
	b6pQCozldWn3of3XbFhwTDHMGqQRTh4id1Psw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LT84pF//vC4wed8+3x3v5D1SpOhRHHNv9OgCtH0oZvE=;
	b=Oi/T5n7TQZD08XN9dmWypXJ6jbAETLGKyb1vqPF7MuKPczhA9jDyuxQvXPlflOWZfn
	V3jgI3neKuIGbblArI57K38d0kwDobnYrVu3LjfToxLTzMfZFF6etEVZbB0NmnO9tGkf
	nUgJkmkvWcVjG5zco1WAID/AMi6+M+qUCdETOg5rXWnV1qnvow5oetfOpr8SsfMCIqbf
	RqbRn4qF1Z447ePKy/Sqe+BekDcJU0sDmRMqoUt6Pt2laWi6WEhFkNTHbMipQXKQArmi
	Yka4vM5gj+g0VjlBRwizA4tJAuw+u94pKPrVMqs7jKxn/rXVkeiqDbwqvHjCr4gqOoNw
	QQuw==
X-Gm-Message-State: AHQUAuYSmSHv32Qw5sRB5k94a8yphVBp/qQgpOgrz7Uh56GC/zH0US0C
	ujxYcwyaNGG8DtizDXVKbQTa/Q==
X-Google-Smtp-Source: AHgI3IYLc/e3cE8WdlRbP1PH2iUmYepTa6N/2Tz0rBXaFA7tAGfs/nVtpAkiIsZwrsAfNqMbiOH1pw==
X-Received: by 2002:a1c:96ce:: with SMTP id y197mr13033876wmd.36.1549648029469;
	Fri, 08 Feb 2019 09:47:09 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q15sm1824735wmj.46.2019.02.08.09.47.08
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 08 Feb 2019 09:47:08 -0800 (PST)
Message-ID: <817180b3d2f75ad74df51ddd0b61d7cb4dacfcf1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 08 Feb 2019 17:47:07 +0000
In-Reply-To: <f37a095f78efe6e4c9033a430121de128a8871c6.camel@andred.net>
References: <20190208120210.31861-1-git@andred.net>
	<c637a3a45fb3d5f40e22a54f59649908f5500794.camel@linuxfoundation.org>
	<f37a095f78efe6e4c9033a430121de128a8871c6.camel@andred.net>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] sysvinit-inittab: support non-busybox-getty on serial consoles
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
X-List-Received-Date: Fri, 08 Feb 2019 17:47:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-02-08 at 16:55 +0000, André Draszik wrote:
> On Fri, 2019-02-08 at 14:07 +0000, Richard Purdie wrote:
> > On Fri, 2019-02-08 at 12:02 +0000, André Draszik wrote:
> > > From: André Draszik <andre.draszik@jci.com>
> > > 
> > > Busybox' getty has code to try to make itself a session leader,
> > > whereas util-linux' agetty doesn't. It expects this to happen
> > > from outside.
> > > When getty is not a session leader, many things don't work on
> > > the serial console, e.g. setting the terminal process group,
> > > job control doesn't work, etc.
> > > 
> > > Executing image tests also fails with AssertionErrors, because
> > >     Feb  5 16:12:55 qemuarm getty[590]: /dev/ttyAMA1: cannot get
> > > controlling tty: Operation not permitted
> > >     Feb  5 16:12:55 qemuarm getty[590]: /dev/ttyAMA1: cannot set
> > > process group: Inappropriate ioctl for device
> > > 
> > > Update the start_getty script to invoke getty via the setsid
> > > utility if needed, i.e. if /sbin/getty is not busybox getty.
> > > 
> > > [YOCTO #13058]
> > > 
> > > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > > ---
> > >  meta/recipes-core/sysvinit/sysvinit-inittab/start_getty | 9
> > > ++++++++-
> > >  meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb  | 1 +
> > >  2 files changed, 9 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-core/sysvinit/sysvinit-
> > > inittab/start_getty
> > > b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> > > index e15ae35f90..ae613f1e54 100644
> > > --- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> > > +++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
> > > @@ -13,6 +13,13 @@ active_serial=$(grep "serial"
> > > /proc/tty/drivers |
> > > cut -d/ -f1 | sed "s/ *$//")
> > >  # Rephrase input parameter from ttyS target index (ttyS1, ttyS2,
> > > ttyAMA0, etc).
> > >  runtime_tty=$(echo $2 | grep -oh '[0-9]')
> > >  
> > > +# busybox' getty does this itself, util-linux' getty needs extra
> > > help
> > > +getty="/sbin/getty"
> > > +if ! basename $(readlink -f "${getty}") | grep -q busybox \
> > > +    && [ -x "/usr/bin/setsid" ] ; then
> > > +    getty="/usr/bin/setsid ${getty}"
> > > +fi
> > 
> > The reason I'm reluctant to take changes like this is you just
> > added 3
> > fork calls above. This does have a significant effect on boot time
> > on
> > slower devices.
> > 
> > Is there a way we can do a shell string comparison rather than
> > using
> > grep? case statement maybe?
> 
> I've sent a v2.
> 
> Are you aware that there are at least 9 forks in this file for
> something as
> simple as forking a getty?

I'm not familiar with this file in particular.

I know we removed a lot from general startup but a lot has crept in
since then :( 

Cheers,

Richard


