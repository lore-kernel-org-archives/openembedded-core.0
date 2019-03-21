Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D3BB27CF1F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 23:48:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p1so412267wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 16:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=IwCB1x7aQSBr5BUEuqWVyomHRu4rMWDYIBqhb5/rzNI=;
	b=HrVswmpAXFZ5isKL1hrhW3DTPdN04opZ7KGazEgkAL/GfHxQ1l4dfV3reFGRoX15pc
	D8MoQQuUoVTWR690ay8hC56iK1QLme1Hh/R81yuk2l2vR2fpvRe8j2Ge0mbm9cgcoZ6M
	Ti6ng16cqToVdgGGAdTi3dh+34sQTKc6ayDHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=IwCB1x7aQSBr5BUEuqWVyomHRu4rMWDYIBqhb5/rzNI=;
	b=fJmfgtjmrR/Q+E0vMyyvWmMNcP3X8FiyF61V3sphN1z0PEE+zG1xpGdwEQ6+jNmL++
	lxJjKo3bjiap2XW+gmdXvHfQjhk/I19RbXDNT0eFuKipxLm0aKe1FM6WpOSYMkb2ISqB
	2f0TDg+LbxbW/f9StZym9xcYOBSn/G50aeg4AFyIos8DnbVx0eBqKwniEp/6M6OuI3CH
	jAQKi3pbjBPC3IZDjK94mETniCI0YKlVNOjmXRwuFGh8iGjs68G4nPEvAbFzxx8phV5J
	08rhkfBJnrDZPgezJUZUoAmc9QBikpyhHYf1pAWUFH0mwpRm0LLhIyX0PF3HBV74Cjhl
	Bz1w==
X-Gm-Message-State: APjAAAVs0E7Ld+o0SKlY4nuNTHz80s9Ijr0sNWN7foUO9+r9gW064VQr
	28iVicFEaJCBonCC5Qjth4V9PbAA762KGA==
X-Google-Smtp-Source: APXvYqyjgMvLNcU9IACN0hSublNXYuD23RLgTuu7CGxIugvkgZrmXegBTi/LT2Mn6rc+682wODcG/Q==
X-Received: by 2002:a5d:6987:: with SMTP id g7mr4247341wru.61.1553212101581;
	Thu, 21 Mar 2019 16:48:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id h1sm5706607wmb.5.2019.03.21.16.48.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 21 Mar 2019 16:48:20 -0700 (PDT)
Message-ID: <610124108e316ad695639fff74fde6a35606c998.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Denys Dmytriyenko <denis@denix.org>
Date: Thu, 21 Mar 2019 23:48:18 +0000
In-Reply-To: <20190321203529.GB16294@denix.org>
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
	<20190320002240.GF11946@denix.org>
	<fd87289ca64fd8c35bcb2b70ea7cbf78cce8e131.camel@linuxfoundation.org>
	<20190321203529.GB16294@denix.org>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] qemuarm: Swap for an arm7ve (A15) configuration
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
X-List-Received-Date: Thu, 21 Mar 2019 23:48:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-03-21 at 16:35 -0400, Denys Dmytriyenko wrote:
> On Wed, Mar 20, 2019 at 12:25:02AM +0000, 
> richard.purdie@linuxfoundation.org wrote:
> > On Tue, 2019-03-19 at 20:22 -0400, Denys Dmytriyenko wrote:
> > > On Mon, Mar 11, 2019 at 03:12:26AM +0000, Richard Purdie wrote:
> > > > From: Jon Mason <jdmason@kudzu.us>
> > > > 
> > > > Add new QEMU BSP for a Arm Cortex-A15 system and use this as
> > > > qemuarm,
> > > > moving the old armv5te Versatile PB based machine to qemuarmv5.
> > > > 
> > > > The new machine uses the QEMU virt machine type, which should
> > > > be
> > > > faster to emulate and updates the qemuarm support to a modern
> > > > architecture.
> > > > 
> > > > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > > > Signed-off-by: Richard Purdie <
> > > > richard.purdie@linuxfoundation.org>
> > > > ---
> > > >  meta/conf/machine/qemuarm.conf                | 34
> > > > +++++++++++++
> > > > ------
> > > >  meta/conf/machine/qemuarmv5.conf              | 23
> > > > +++++++++++++
> > > >  .../linux/linux-yocto-rt_4.19.bb              |  2 +-
> > > >  .../linux/linux-yocto-rt_5.0.bb               |  2 +-
> > > >  .../linux/linux-yocto-tiny_4.19.bb            |  2 +-
> > > >  .../linux/linux-yocto-tiny_5.0.bb             |  2 +-
> > > >  meta/recipes-kernel/linux/linux-yocto_4.19.bb |  2 +-
> > > >  meta/recipes-kernel/linux/linux-yocto_5.0.bb  |  2 +-
> > > >  8 files changed, 52 insertions(+), 17 deletions(-)
> > > >  create mode 100644 meta/conf/machine/qemuarmv5.conf
> > > > 
> > > > diff --git a/meta/conf/machine/qemuarm.conf
> > > > b/meta/conf/machine/qemuarm.conf
> > > > index a5443126273..95550461899 100644
> > > > --- a/meta/conf/machine/qemuarm.conf
> > > > +++ b/meta/conf/machine/qemuarm.conf
> > > ...
> > > > +KMACHINE_qemuarmv5 = "qemuarm"
> > > > \ No newline at end of file
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > > b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > > index 07dc5b77a14..36761b99437 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > > @@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
> > > >  
> > > >  LINUX_KERNEL_TYPE = "preempt-rt"
> > > >  
> > > > -COMPATIBLE_MACHINE = "(qemux86|qemux86-
> > > > 64|qemuarm|qemuarm64|qemuppc|qemumips)"
> > > > +COMPATIBLE_MACHINE = "(qemux86|qemux86-
> > > > 64|qemuarm|qemuarma15|qemuarm64|qemuppc|qemumips)"
> > > 
> > > Did you mean to list here "qemuarmv5" instead of "qemuarma15"?
> > 
> > Yes!
> > 
> > > > @@ -40,7 +40,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
> > > >  
> > > >  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> > > >  
> > > > -COMPATIBLE_MACHINE =
> > > > "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-
> > > > 64"
> > > > +COMPATIBLE_MACHINE =
> > > > "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips6
> > > > 4|qe
> > > > mux86-64"
> > > 
> > > Ok, "qemuarmv5" - I see a pattern here! Was it a challenge? :)
> > 
> > It definitely was a challenge, perhaps not the way you mean it
> > though!
> > :)
> > 
> > Patches to fix up the mess I made of this gratefully received, or
> > I'll
> > sort it out tomorrow, thanks for highlighting it.
> 
> Submitted a patch last night:
> http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280345.html
> 
> Not sure if you got to it sooner and fixed it yourself (don't see it
> in git yet). Either way is fine. Let me know if you need anything
> else. Thanks.

Looks good, thanks. I'm struggling a bit after some travel
unfortunately but doing my best to keep the patches moving. Its testing
in -next now.

Cheers,

Richard


