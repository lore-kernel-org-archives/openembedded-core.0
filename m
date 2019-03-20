Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E1B2E7CE21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 00:25:03 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t5so785966wri.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 17:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=tE4zcr8MkilwkJNwMlK7nIWZhZlxAIHEV1kzPDbuWgw=;
	b=KJcnZeE/O5nrhQnTyA7tcDnvbcZ1C6+WFR51m6t8yEXxQYzQtGsOETktFxpGG1e+OP
	OuNCk4OL6iZ84+/EvRNpQnHeQB8W+kEpivh7UmPQtAO6+5ys4rfBLRor0Gw0clxd2tF2
	cNosrVHLhM9hu4Hn8Tn0mkG+H1ClWa5vN1tM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tE4zcr8MkilwkJNwMlK7nIWZhZlxAIHEV1kzPDbuWgw=;
	b=ZyiHxMbxpAqvki9r+VSVmG4CknNrQyMvH3iKVaiQ5RTkgmfwSkR7dPwxw+f+ue2hx7
	/f99VPEtN74/9LEYPu3PNLdO5cIgPCq8Y+l9QtnwEH1i7Pz2ksesEnjkqwginEq2WVbZ
	XBv4J1awwx+4/QJHSihRWnSspFJWGHFkQbfWeNyfhuOakBJK0lemuiMYgILlsF4VecEv
	7jiyzlcJBUY4b4BYQrnNbmNHPGWEgUProYqHWbae+1aieT5zUD9oK06c07nvlj1ZpjVN
	ovj11YgX8zTcBOuvhQFu+Y10pnLNtdrTSNqt89H9siJBoLgJ+Dlth3pNv3WM4mkqFdIQ
	DjOw==
X-Gm-Message-State: APjAAAWfHGE4NC28LFydgkwTHL6GNb78q9L2Xw+sS/BASBRvqVvNkf3E
	Fy+Oc72vfGVgrW8HFUTy3YdEWw==
X-Google-Smtp-Source: APXvYqwN0izD42bvEJk8gxwkogelBhDYDHqzK1LPf4Av24S5xCdS0wQLaFfHKSJtcbRfW4Ljlt5MPA==
X-Received: by 2002:a5d:4f91:: with SMTP id d17mr20599471wru.67.1553041504276; 
	Tue, 19 Mar 2019 17:25:04 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id c126sm818777wma.0.2019.03.19.17.25.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 19 Mar 2019 17:25:03 -0700 (PDT)
Message-ID: <fd87289ca64fd8c35bcb2b70ea7cbf78cce8e131.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Denys Dmytriyenko <denis@denix.org>
Date: Wed, 20 Mar 2019 00:25:02 +0000
In-Reply-To: <20190320002240.GF11946@denix.org>
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
	<20190320002240.GF11946@denix.org>
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
X-List-Received-Date: Wed, 20 Mar 2019 00:25:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-03-19 at 20:22 -0400, Denys Dmytriyenko wrote:
> On Mon, Mar 11, 2019 at 03:12:26AM +0000, Richard Purdie wrote:
> > From: Jon Mason <jdmason@kudzu.us>
> > 
> > Add new QEMU BSP for a Arm Cortex-A15 system and use this as
> > qemuarm,
> > moving the old armv5te Versatile PB based machine to qemuarmv5.
> > 
> > The new machine uses the QEMU virt machine type, which should be
> > faster to emulate and updates the qemuarm support to a modern
> > architecture.
> > 
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/conf/machine/qemuarm.conf                | 34 +++++++++++++
> > ------
> >  meta/conf/machine/qemuarmv5.conf              | 23 +++++++++++++
> >  .../linux/linux-yocto-rt_4.19.bb              |  2 +-
> >  .../linux/linux-yocto-rt_5.0.bb               |  2 +-
> >  .../linux/linux-yocto-tiny_4.19.bb            |  2 +-
> >  .../linux/linux-yocto-tiny_5.0.bb             |  2 +-
> >  meta/recipes-kernel/linux/linux-yocto_4.19.bb |  2 +-
> >  meta/recipes-kernel/linux/linux-yocto_5.0.bb  |  2 +-
> >  8 files changed, 52 insertions(+), 17 deletions(-)
> >  create mode 100644 meta/conf/machine/qemuarmv5.conf
> > 
> > diff --git a/meta/conf/machine/qemuarm.conf
> > b/meta/conf/machine/qemuarm.conf
> > index a5443126273..95550461899 100644
> > --- a/meta/conf/machine/qemuarm.conf
> > +++ b/meta/conf/machine/qemuarm.conf
> ...
> > +KMACHINE_qemuarmv5 = "qemuarm"
> > \ No newline at end of file
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > index 07dc5b77a14..36761b99437 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > @@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
> >  
> >  LINUX_KERNEL_TYPE = "preempt-rt"
> >  
> > -COMPATIBLE_MACHINE = "(qemux86|qemux86-
> > 64|qemuarm|qemuarm64|qemuppc|qemumips)"
> > +COMPATIBLE_MACHINE = "(qemux86|qemux86-
> > 64|qemuarm|qemuarma15|qemuarm64|qemuppc|qemumips)"
> 
> Did you mean to list here "qemuarmv5" instead of "qemuarma15"?

Yes!

> > @@ -40,7 +40,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
> >  
> >  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> >  
> > -COMPATIBLE_MACHINE =
> > "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> > +COMPATIBLE_MACHINE =
> > "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qe
> > mux86-64"
> 
> Ok, "qemuarmv5" - I see a pattern here! Was it a challenge? :)

It definitely was a challenge, perhaps not the way you mean it though!
:)

Patches to fix up the mess I made of this gratefully received, or I'll
sort it out tomorrow, thanks for highlighting it.

Cheers,

Richard




