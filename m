Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id BE9E97F168
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 16:48:31 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id z4so8763872qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 09:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cygkhp1XRA2A8HJy7lIhwLaHrV924rEY8HYYqrYA2/w=;
	b=p1zDW34lWnSrqtM+4nu3dKCLYyrdfJsamMltMsP9sim0+nhjparx/w+7vdSibYL03I
	ZcOLDLV44tl2k8XPfD1XbxA+jqx6c62yMbG6ecZtKCSZEo0P5e1sqhdQ4z9TM9ClHh2q
	jLYLN2sa8OgIKymt80uY1zcEFreVdpgZHljTqk4+SZpeParZ34IO6ROsJl0FvH/UlFtV
	wjguGU32y9B+vAXAZgADjFjciojzktSE1yw+Gkm1vaKIHjeyQIdwfq5NO1iE/j2djS6w
	BB8V0WT7nn35LXiAz03LXf+Va4AHSa2WBqrHWqnL5+ukp7XqS9imd/l/dKrVJYuDHv5T
	HqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cygkhp1XRA2A8HJy7lIhwLaHrV924rEY8HYYqrYA2/w=;
	b=kr+qWzln5+aXqRX0VlMOmUtNfwhs8nyL5YP5REvZVvplOkoqmWwaYqxTWDTvjwmxW0
	Qxah+xidbQhnGgL3ZKdXWUaXQiCFKSqYluJwfrC8QuZTR1pX2uFL0I5nsZp2Hizrc5Pv
	vd0bFPNgSkeRrnLL3rewezvaH9cJQMDVcxyBnx7EAn7NLiirNozOpF/BBu6oxzNQ44jB
	nKxkEPeibk0Iq9m6ywdzil5oND37h4cT11v9P1kYQ7/kRc3RBp1bRP/M+no7ddHcTHLP
	/SXUxwLnRfTmhsxS4k6GrwnCcfMyWsHkJBEpE1EfDE7Lbn+HGpVZ2wjCOBotUaS22zjc
	KXCA==
X-Gm-Message-State: APjAAAWr4hz+yQmmGEDlZ6lgJYdzsTDrqyR9GkCeZpEMc8YRAlcsIabD
	ZQ9vLmt0Bwxvr9XlE+mHwY4BUO2Trx3QgEJAre4=
X-Google-Smtp-Source: APXvYqxnCCsqVjSv2+IdDqd9dFVYMWPOFbnnpB5c+k2Z0b0c8zvCDeai2WbQQtBwj/qkHN1GT2JNdpzmXygDlg1d8L4=
X-Received: by 2002:ac8:525a:: with SMTP id y26mr7180187qtn.378.1562950112451; 
	Fri, 12 Jul 2019 09:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAJTo0LZ=1YBJQ69jTYVDnz+LFBX9eN3V6LfnK46fxTJUb=nH0g@mail.gmail.com>
	<1554165783-46226-1-git-send-email-changqing.li@windriver.com>
	<b4ecf37e-6bb7-6328-4863-5901e6155db1@windriver.com>
	<653aa5ae1d1bb459d02b43aec637a94e43f76a4f.camel@linuxfoundation.org>
In-Reply-To: <653aa5ae1d1bb459d02b43aec637a94e43f76a4f.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Jul 2019 09:48:06 -0700
Message-ID: <CAMKF1soyz3GjTUVj-Xw95rJ_sFqUVcd_NCvB0UWYEtZnP0-37g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] llvm: fix link error for powerpc
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
X-List-Received-Date: Fri, 12 Jul 2019 16:48:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 12, 2019 at 1:06 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-07-12 at 16:11 +0800, ChenQi wrote:
> > I'm recently getting llvm build failure on qemuppc. After reverting
> > this
> > patch, the build succeeds.
> > My host is ubuntu16.04.
> >
> > I'm also wondering why autobuilder does not detect the build failure.
> > No
> > world build for qemuppc?
>
> There is no world build for ppc or mips.
>

no mips ? ppc I understand

> Cheers,
>
> Richard
>

