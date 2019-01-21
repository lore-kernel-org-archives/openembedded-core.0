Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 86C1C79CF3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 16:52:54 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id b63so8246413ywc.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 08:52:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TCUN4DRSzbmv90VbKkLF4ytJ/tLnGfM3XQUMGYTm2ew=;
	b=q+r4DQbLom+gdSES+noGyC5VBbQ4GPjofi7beDQQDuzlrcNyDRzQwJgQYN8Wv/cKfK
	ABlxno4mw5awlOldLsZUYMrkkNIUtkS3Jqm0BjtvD4hW6NhD9NSk8JHfrrzTXT3S+wrS
	Jw7OQWNvIwRdE0cuRLzy/KxseveDAZ8DtdmZ7WmtqmRIxUPdQ2eXJJwwBlVSztk106po
	unbF2ruGSSMqDpHB+KgAN3iyIutxXFi8ODXBSFiBsn2IbW/CjaI/U0oIOqkyeroIT9XC
	wodAZ3VQQD6nHgxvdBZCG16yXoICqQ509P9w7sxbPzf49JPIrwTZYjasZVkLywSJcGgM
	BvDA==
X-Gm-Message-State: AJcUukfeH1TOzNlUfXAvU2GWluNDQw8ZG9WFIEIWTpo7L4itX429Rwdw
	kngV350YYxUqZXzztdA+bi8fPH9r
X-Google-Smtp-Source: ALg8bN5GLd4Wda8oko5dEbxUeTwmibo60mYRUHuVWlNosL67lwp3dj+75IfsUy4XifZDshHPbJvjTw==
X-Received: by 2002:a81:37c3:: with SMTP id
	e186mr29119818ywa.506.1548089575451; 
	Mon, 21 Jan 2019 08:52:55 -0800 (PST)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	x203sm7181391ywd.41.2019.01.21.08.52.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 08:52:54 -0800 (PST)
Message-ID: <baf32fcd872f60c16cc9b3bfb854b3eeeb68bbbb.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Jan 2019 16:52:52 +0000
In-Reply-To: <CAMKF1sr+VTsroSm_CNG+qZadFv1nXXj4TJ9RUY3d9rmWuf_JHw@mail.gmail.com>
References: <20181129175214.3041-1-raj.khem@gmail.com>
	<3287314d6f8a7a23be48eb9ea168b3f148da7ae5.camel@andred.net>
	<CAMKF1sr+VTsroSm_CNG+qZadFv1nXXj4TJ9RUY3d9rmWuf_JHw@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] musl: Update to latest trunk
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
X-List-Received-Date: Mon, 21 Jan 2019 16:52:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Thanks Khem,

So is it actually user-space that does link state detection? I thought it's
the kernel.

I use connman here, I'll have a look, maybe some memory corruption causing
this so...

Thanks again,
Andre'


On Mon, 2019-01-21 at 08:17 -0800, Khem Raj wrote:
> Hi André
> 
> this feature was implemented but does not emulate full
> glibc behavior and its possible that app is expecting the glibc
> behavior, I have fixed nfsutils app in past see for details
> 
> https://patchwork.kernel.org/patch/10707759/
> 
> I think you can start with suspecting app, I dont rule out libc bug
> but thats less likely
> 
> On Mon, Jan 21, 2019 at 1:14 AM André Draszik <git@andred.net> wrote:
> > Hi,
> > 
> > On Thu, 2018-11-29 at 09:52 -0800, Khem Raj wrote:
> > > Complete changelogs are here
> > > https://git.musl-libc.org/cgit/musl/log/?qt=range&q=c50985d5c8e316c5c464f352e79eeebfed1121a9..39ef612aa193cc6e954ac5a01574300ccd4b7ef9
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > V2: move to latest master ( 3 more commits for regressions )
> > > 
> > >  meta/recipes-core/musl/musl_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-
> > > core/musl/musl_git.bb
> > > index 0d8f8eb2a4..b416ec45bf 100644
> > > --- a/meta/recipes-core/musl/musl_git.bb
> > > +++ b/meta/recipes-core/musl/musl_git.bb
> > > @@ -4,7 +4,7 @@
> > >  require musl.inc
> > >  inherit linuxloader
> > > 
> > > -SRCREV = "c50985d5c8e316c5c464f352e79eeebfed1121a9"
> > > +SRCREV = "39ef612aa193cc6e954ac5a01574300ccd4b7ef9"
> > 
> > With this, link detection doesn't seem to work correctly anymore,
> > instead
> > constant messages in the syslog:
> > 
> >     Atheros 8031 ethernet 30be0000.etherne:01: attached PHY driver
> > [Atheros 8031 ethernet] (mii_bus:phy_addr=30be0000.etherne:01, irq=-1)
> >     IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
> >     fec 30bf0000.ethernet eth1: Link is Up - 1Gbps/Full - flow control
> > rx/tx
> >     IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
> >     Atheros 8031 ethernet 30be0000.etherne:01: attached PHY driver
> > [Atheros 8031 ethernet] (mii_bus:phy_addr=30be0000.etherne:01, irq=-1)
> >     IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
> >     fec 30bf0000.ethernet eth1: Link is Up - 1Gbps/Full - flow control
> > rx/tx
> >     IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
> >     Atheros 8031 ethernet 30be0000.etherne:01: attached PHY driver
> > [Atheros 8031 ethernet] (mii_bus:phy_addr=30be0000.etherne:01, irq=-1)
> > 
> > etc.
> > 
> > I've tracked it down to commit d1395c43c019 ("allow freeaddrinfo of
> > arbitrary sublists of addrinfo list" in musl.
> > 
> > Even latest musl master de7dc1318f49 doesn't work for me with the same
> > problem. The only way to make it work is to revert d1395c43c019 in musl,
> > even with latest master.
> > 
> > link detection should be a kernel thing, or not? So how can a user-space
> > change affect the kernel's link detection?
> > 
> > Any ideas?
> > 
> > 
> > Cheers,
> > Andre'
> > 
> > 


