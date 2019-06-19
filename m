Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id E9FBC7E91D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 12:44:01 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id h19so4558187wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 05:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=s5KbLmsDD5/YHxE2lQcfqb2HzxfC5ibY6ttxhNU5Xd8=;
	b=CZKxdWFdy+537pIFstdSES5R1+ZbUSKvc1OFHTkh0K9tHYcRRFCA3Ohqf8qQCweLCz
	mOFxSJphuWhLMLEuJlTFivcUtzVipPkVLxs6thn6eP0hveIJqEetywFBW4jWNnFK1Dh9
	OckytZAzp3WJG9FmP+ZdlCvdbBFORZRfy3BEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=s5KbLmsDD5/YHxE2lQcfqb2HzxfC5ibY6ttxhNU5Xd8=;
	b=uZKyI0vLYaORL2ujEBsufl9T9rIk5rUo+Q5vBha/B7BE3H4FIY++SAWaaBfvYeMXQ0
	BGbvtiUu7lXLSypfo3PNsjKe+/0KITM0b/bwYnl/OTPYGJ++39VKZXSl+ezcng6b+baV
	ZZqoo6Gj+iVNEDRalXJuZ+pGdyFkMbvIi/ld1pPYxBUul/zLJ8AEVqQl6dGVJhql5g/v
	845Kivq7R7WJyxl0rDAKBwx2eCixQzkMJETFNd3ke+R8QjlXjnjWOad4eJuTtBIiDtlw
	R6WyTBixnEz5LhRUtq9uQPWvFkCEX//Q/KayenKb08O9L3NWmvL3opXMkuftnizHDi09
	cdrA==
X-Gm-Message-State: APjAAAVSTAXOWH2pH0MHllDK+XlLDqoTVkNfKsSJsA50UJTkp+arR7SA
	J1QMx7jzrw3ZYCcO8sSj9DyTdw==
X-Google-Smtp-Source: APXvYqzsbGzosbtpE898mbx+Cm5iwnVrJtV6OokNHZBPTfP6UXJZnuYfyFfF/QPiBoOcyWZmXHrNuw==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr7783403wmj.133.1560948242669; 
	Wed, 19 Jun 2019 05:44:02 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y19sm1874106wmc.21.2019.06.19.05.44.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 05:44:01 -0700 (PDT)
Message-ID: <e46ddc1973d50d0fa73d8737d0c682501396bae5.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Jun 2019 13:44:00 +0100
In-Reply-To: <CADkTA4MAVbJ6H4uJXPmod+9NBt97YxZsgia3CnJMr8q7M8mJKQ@mail.gmail.com>
References: <cover.1560888312.git.just.another.mariano@gmail.com>
	<f0d52edc0d79dca6ed77b0ae587ca594ccb6ee39.1560888312.git.just.another.mariano@gmail.com>
	<5511748e8ce0af06eacccb81a90ee4563c307248.camel@linuxfoundation.org>
	<CADkTA4MAVbJ6H4uJXPmod+9NBt97YxZsgia3CnJMr8q7M8mJKQ@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto: Add SCSI support when ptest is in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 19 Jun 2019 12:44:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2019-06-19 at 08:24 -0400, Bruce Ashfield wrote:
> On Wed, Jun 19, 2019 at 6:51 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2019-06-18 at 15:10 -0500, Mariano López wrote:
> > > The scsi_debug module can't be built in some architectures as
> > > they
> > > have
> > > SCSI support disabled by default. This patch will enable SCSI
> > > support
> > > as
> > > well as the scsi_debug module when ptest is in DISTRO_FEATURES.
> > > 
> > > Signed-off-by: Mariano López <just.another.mariano@gmail.com>
> > > ---
> > >  meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 5 ++++-
> > >  meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 5 ++++-
> > >  meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 5 ++++-
> > >  meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 5 ++++-
> > >  4 files changed, 16 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > index 0836dc7ea0..e6c8ee320c 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > @@ -41,4 +41,7 @@ KERNEL_FEATURES_append = "
> > > ${KERNEL_EXTRA_FEATURES}"
> > >  KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
> > >  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc
> > > cfg/paravirt_kvm.scc"
> > >  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc
> > > cfg/paravirt_kvm.scc"
> > > -KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES"
> > > ,
> > > "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> > > +KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES"
> > > ,
> > > "ptest", "\
> > > +                            features/scsi/scsi.scc \
> > > +                            features/scsi/scsi-debug.scc \
> > > +                         ","" ,d)}"
> > 
> > Question to Bruce - can we mark scsi-debug.scc as having a
> > dependency
> > on scsi.scc?
> 
> With the goal that we can only list one of the fragments in the
> KERNEL_FEATURES append ?
> We can do something like that, I just want to make sure I'm grok'ing
> the end goal.

Yes, it just seems odd that you'd have to remember to list both.

If listing both makes sense I'm ok with it, I just thought it worth
asking that question as it does seem like a missing dependency.

Cheers,

Richard


