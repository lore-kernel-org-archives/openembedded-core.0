Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8FB7E46D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 21:01:58 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p77so5604556wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 14:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=gYzhyyqbAE3iycCT/6wOXObDW88A+IH9xkmD4fr2v3o=;
	b=OGsGNwIEgKmsaGdo9CtJJ95ATTXc/MRdklLNqDJWo79CmpEGb/8OTEIl82sEGLZnLi
	3uYFjKdZN+im12aMDCe9Ly6kjs7pygOewcEnYCyAnBmSNqQFjQV7PU0bvxYEg5RmS9Jj
	629pzVvzp/UiP/4jiXJ7Kml0fgOo5zHzwveEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gYzhyyqbAE3iycCT/6wOXObDW88A+IH9xkmD4fr2v3o=;
	b=tSDPxff599xVMgp0XOmurA0pquDKOUzDeAME2mPgOSsfgle4oikbEgcrexDn+ZSiKq
	G+a8Bc3y05Y/wai6BoXC7Ta/1oF1/9nzIJMsgF0NTAE2zoUTKqiWjWQkBx+1hExq1F92
	ZREorzTGY0bTl6Z/A2DNPgyoU/VHy0UWXizBdkZBP2zy5iBQ9WX14KYctaTt8IfWJtE8
	83mYRrbGNdP1AsiLt4nndru++6evWiZMd+Y7UPWkoq5I59AlfgymFhS50s/lRTto5Z4Z
	fabaKk5F+Bs9dtjOV5oczTGCiyz2JCXQ/T5j5ZhhAZPcnS2mAhZ1KQRZAI2SxwxCCNlZ
	2Bmw==
X-Gm-Message-State: APjAAAUBIJUiCwMWRqEPIRnDMEeTgpiGV2lbFJYfnwXjPrULCQGfDdzG
	FKghQlFGzDpDYLdOdCK9VMLmIA==
X-Google-Smtp-Source: APXvYqy+JY79OEBV4nM4Os6GwPCMbvTjmXVg0aW6MPsN4cZ7pbYRR892Zti8D73TFHNjo1+nwEGSgQ==
X-Received: by 2002:a7b:cd0f:: with SMTP id f15mr2238187wmj.86.1566421319717; 
	Wed, 21 Aug 2019 14:01:59 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id w5sm764623wmm.43.2019.08.21.14.01.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Aug 2019 14:01:59 -0700 (PDT)
Message-ID: <9eb7ad288430f6ce1f35e185bda4db135e8b2772.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Mark Hatle
	<mark.hatle@windriver.com>
Date: Wed, 21 Aug 2019 22:01:57 +0100
In-Reply-To: <CANNYZj-G7CvxTSX=L8tDm87xoa=u6cuJ+7s1nbvydtPc+GOmNw@mail.gmail.com>
References: <1566221602-123706-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj9y6uP-=iSDLj=wQ-LTuAgBTsHL7F84eiCSs8=aycjZMg@mail.gmail.com>
	<28dbc362015c3cbae5b8550e8636e74802afbfc3.camel@linuxfoundation.org>
	<4cbf8a7b-f0b2-9a16-6a91-bead26ecef50@windriver.com>
	<CANNYZj-G7CvxTSX=L8tDm87xoa=u6cuJ+7s1nbvydtPc+GOmNw@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: decreasing default RLIMIT_NOFILE on qemu bsp
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
X-List-Received-Date: Wed, 21 Aug 2019 21:01:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-20 at 22:20 +0200, Alexander Kanavin wrote:
> On Tue, 20 Aug 2019 at 15:46, Mark Hatle <mark.hatle@windriver.com>
> wrote:
> > Looking at what my customers are doing, I completely agree.  I look
> > at the
> > design criteria for my customer's devices and I'm seeing 256MB as
> > -very- common.
> >  More happens, but it's rare still.  (But I have some customers
> > with GB of ram,
> > but that is usually to support their application, but the base
> > system!)
> > 
> > (Note, I do have customers -with- graphics requirements [X11] that
> > are in the
> > 128/256 MB ram ranges.  In most cases OpenGL is something they
> > would like, but I
> > don't believe it's a hard requirement for them.)
> > 
> > I do still have many customers with 128 MB of ram requirements.  So
> > it's
> > important for us to set a reasonable baseline (256MB).  So going
> > under this
> > requires 'work', but I think that is acceptable.
> 
> For contrast, in the kind of system I am helping to develop
> everything is measured in gigabytes. RAM should be in the ballpark of
> 10Gb. Disk storage maybe 10x that. OpenGL is at the foundation of
> display output and isn't optional in any way. There's basically every
> connectivity option enabled, multiple cameras, touchscreens and
> whatnot. The whole thing will eventually look not that far from iOS
> in terms of UI and capabilities and containerized 3rd party apps
> (except it *also* needs to support multiple screens and multiple
> users). And yes, it's all pulled together through bitbake and a zoo
> of layers, images and target configurations. Yocto is able to target
> cases like this, which is amazing - hopefully this clears up a bit
> where I am coming from in this, even if it's a 'minority' position.

I don't think its a minority and there are people who have both kinds
of system, sometimes in the same build.

We just need to be mindful we have a spectrum of target users and low
RAM is one part of that matrix. I want the project to support the
larger use cases too.

Cheers,

Richard




