Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7F10A792EF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 13:02:56 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id m4-v6so6847658iop.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 06:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YAfQsia0HPkpIlRX9ps+7QBAr5XR36WP1BeZXYEhUPg=;
	b=iX9wrWfzo5kBfx95RaGRbHUjQ1qXRVkNH8GVL1zGYTlnmgfdnNQJhRH8LUSGBV6Hmv
	9LLORqMaVuFCTx9/kkkNikMSjjtxUQRKA74HQWwJYNjQjyA8bMLI8ufknHLUpKNst4NS
	0IxbNcCXGJDjbA63HGrLTBT9fEYxEhr52dMF1p1orIqZ6DCdY6QVaD7F8ChIuqFnhi4J
	rG+64/41hIjKJu/iPzJ5rIUDAjKq9tnMw1ShrxoiW8jOSANRCBr3Qa23kmm7rkpYO77L
	kjDCg0s0NzqoyUag1nHEm8rtUy5rW6qPgAPTQ6UhvZod+ofznZND+Z/OalW890lbXCLF
	OxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YAfQsia0HPkpIlRX9ps+7QBAr5XR36WP1BeZXYEhUPg=;
	b=OfPK1GSI+OzeJZobiIQ7X+C5HB6iTUShNsEe/pkVnseFKESlRu+kJs5Ze7PIRM067G
	0ceKVb8oDmnLDyDrCFYqbiDGxQupp6hiVvCULhmdtbqObKBxYh5JigFmyrQsxErWQNAD
	fN/JV6DhWKaXKoDcOQGwbXkWVMIAzeq0DEJzquFszuaDqjdI7KIZ3RgvvhouqapEEgeA
	oyNSy1VwNu59b1L8FQwC+zEx96b9yrOGIOo2abdWO2r2Vpmo8NWrii7CZfvG7ItXczGV
	bYPYBQDBYp2s2lcxNVHb0GUZ57ug2v16MX5+e6Ni/cDxSrOWCU7ovNezE9lPj/QPqN3O
	RMIQ==
X-Gm-Message-State: AOUpUlE7NaZJO4ayxyYBXG0d+hM6zWJlEVUe2E99WEWbQllHDYfF8XP3
	rjFfjKuHgV90wJHgK7iGzkw=
X-Google-Smtp-Source: AA+uWPwzoS5uL2bm+Ch9QGpIG0YGA35ghd6KUVBaa2YlGcGRUr1RvW3Q57yB5iVrNOLUyDNzCAXIFw==
X-Received: by 2002:a6b:8dc2:: with SMTP id
	p185-v6mr29598038iod.98.1534510977226; 
	Fri, 17 Aug 2018 06:02:57 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	f15-v6sm836382ioh.64.2018.08.17.06.02.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 Aug 2018 06:02:56 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <efc419d6590ad42d2ecb83de37627d3e72b8a009.camel@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>, Martin =?ISO-8859-1?Q?Hundeb=F8ll?=
	<martin@geanix.com>
Date: Fri, 17 Aug 2018 08:02:55 -0500
In-Reply-To: <CAJ86T=WJ=YDTjLTONCbDTb6EQOeKT9atKXWwpnazE0LDccgs6Q@mail.gmail.com>
References: <20180815115907.14045-1-martin@geanix.com>
	<CAJ86T=UJ1xqGDjeO+i9Qyy8sbA_027c2GZQtaqSwp15VAaoUHw@mail.gmail.com>
	<b55e3c9e-bcee-7466-5fd5-8f98f7233899@geanix.com>
	<CAJ86T=WJ=YDTjLTONCbDTb6EQOeKT9atKXWwpnazE0LDccgs6Q@mail.gmail.com>
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: fix wrong volatile dir for sshd host keys on read-only rootfs
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
X-List-Received-Date: Fri, 17 Aug 2018 13:02:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-08-16 at 22:33 -0700, Andre McCurdy wrote:
> On Wed, Aug 15, 2018 at 11:26 PM, Martin Hundebøll <martin@geanix.com
> > wrote:
> > Hi Andre,
> > 
> > On 15/08/2018 21.47, Andre McCurdy wrote:
> > > 
> > > On Wed, Aug 15, 2018 at 4:59 AM, Martin Hundebøll <martin@geanix.
> > > com>
> > > wrote:
> > > > 
> > > > When the read-only-rootfs image feature is enabled, and openssh
> > > > is
> > > > installed into an image, the ssh daemon is reconfigured to use
> > > > /var/run/ssh when generating host keys.
> > > > 
> > > > Fix up the creation of the volatile dir to actually match what
> > > > sshd is
> > > > configured to.
> > > > 
> > > > Signed-off-by: Martin Hundebøll <martin@geanix.com>
> > > > ---
> > > >   meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd |
> > > > 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/meta/recipes-
> > > > connectivity/openssh/openssh/volatiles.99_sshd
> > > > b/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
> > > > index a0d2af3c65..fcbc5ae9d5 100644
> > > > --- a/meta/recipes-
> > > > connectivity/openssh/openssh/volatiles.99_sshd
> > > > +++ b/meta/recipes-
> > > > connectivity/openssh/openssh/volatiles.99_sshd
> > > > @@ -1,2 +1,2 @@
> > > > -d root root 0755 /var/run/sshd none
> > > > +d root root 0755 /var/run/ssh none
> > > 
> > > This doesn't look right.
> > > 
> > > /var/run/sshd is the directory used for privilege separation
> > > (grep for
> > > --with-privsep-path ), so it's not correct to remove it.
> > 
> > I see - didn't know about openssh chrooting to do privilege
> > separation.
> > 
> > > Note that sshd_check_keys script runs "mkdir -p $SYSCONFDIR" (ie
> > > /var/run/ssh in the read-only rootfs case) at run time before
> > > creating
> > > any keys.
> > 
> > Yes, it works without the volatile folder; for openssh at least.
> > 
> > > What exactly was the problem that this patch tries to fix?
> > 
> > I am running a custom image with the read-only-rootfs feature
> > enabled, and
> > wanted to make the ssh host keys persistent across reboots.
> 
> That should be possible by following the steps described in:
> 
>   http://git.openembedded.org/openembedded-core/commit/?id=106b59d9f9
> 6f70d133fa1421091ad280d27a5b6a
> 
> ie add something like the following to a .bbappend:
> 
>   export SYSCONFDIR = "/data/ssh"
> 
>   do_install_append () {
>     sed 's|HostKey /var/run/ssh|HostKey /data/ssh|g' -i
> ${D}${sysconfdir}/ssh/sshd_config_readonly
>   }
> 
> The openssh init script has changed a little since then, but I think
> the same basic approach should still work (and if it doesn't we
> should
> fix things so it does).

FWIW, we use volatiles to accomplish something similar:

 # cat /etc/default/volatiles/99_sshd 
 d root root 0755 /data/var/run/ssh none
 l root root 0755 /var/run/ssh /data/var/run/ssh

> 
> > At first, I tried adding a bind-mount entry to fstab from /data/ssh
> > to
> > /var/run/ssh, but the latter don't exist when mountall.sh is
> > executed by RC
> > (/data is the mountpoint of a persistent partition).
> > 
> > I then looked at the volatile entries and noticed that it created
> > the
> > (empty) /var/run/sshd, so changed it to (wrongly) create
> > /var/run/ssh
> > instead.
> > 
> > That wasn't enough though, since populate-volatiles.sh comes after
> > mountall.sh.
> > 
> > In the end I simply added a new entry to volatiles to create a
> > symlink from
> > /var/run/ssh to /data/ssh, which works for me :)
> > 
> > Maybe I should change the patch to add a comment about the
> > /var/run/sshd
> > entry, so we don't end up doing mistakes like the debian-
> > predictable-keys
> > story.
> > 
> > // Martin
-- 
Joshua Watt <JPEWhacker@gmail.com>

