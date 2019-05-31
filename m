Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 00BC77D441
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 09:00:07 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 16so1111436wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=9DzMgmCnxuHb8OZRQwP18I7i9c+VQ9uSE9Jaz5Cx/T0=;
	b=Kw56bk3wq4xUBxOx5cwEebG/2DH+stSEfZpuRFaOm9QVpA1U9PMaeUsIRJeOhBJklw
	Hci5neANEnHjYS0VRwVH7S1VWOn3bXtdtjSnRG30lvLjfKSoaI4Uog1z6e3cA+TvaAOV
	UNgsOq3cc1Kq4TsomPBFzWLdSQIG8tdMObWmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=9DzMgmCnxuHb8OZRQwP18I7i9c+VQ9uSE9Jaz5Cx/T0=;
	b=AkU7Ix8hBzCMEVkpeK0JhVJy5OwFxTPWUsBknGtHVVdfkkYb94KrbTgdYI261P/tP9
	Cpa9YT+S22aVxjJx/lwTxCes4ie15hFqcgzE+Cj9aEvi5jEoHezCsqOu9cAX98Cg2WXZ
	JGV2jlMf95akyYtdPVTU+YkTKqB3pJws1zzaWvIY5bgXDSw+NInRdyWa+92AP//RuS8/
	W/rbi2NCPIbRNbSVSAMmGnPR5mJbN55o8nCtJGaGdWiRpnJ8dTa8vibHpztlv8PVIGc3
	t9W146dd/vSWblBQ3DFDAjsV9gcrtTGYbXWq1C1f8HeqUa+lkVbLuP+XL6kSDPik/gWB
	lm8w==
X-Gm-Message-State: APjAAAVOnw9W9FNXJiX+L+trMdTSsIX2OwD6c3bjyLwByIjacElkIDJ6
	cKA89/eNvJmPpwCH13yDT3i7lA==
X-Google-Smtp-Source: APXvYqwL7naxNxYMxvK/5+Sh/UnL/5imj1X+xx0H/1B2EJWDP7pekbUOt/A1O9uHwmg7kPmDPcXREw==
X-Received: by 2002:a1c:c108:: with SMTP id r8mr5120371wmf.78.1559293208672;
	Fri, 31 May 2019 02:00:08 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r16sm4381843wmh.17.2019.05.31.02.00.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 02:00:08 -0700 (PDT)
Message-ID: <cfb5ffc25d8a5d7c378b196807c984661b0bd606.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Kang Kai <Kai.Kang@windriver.com>
Date: Fri, 31 May 2019 10:00:06 +0100
In-Reply-To: <068b03a0-b96b-eee3-0dc5-9ddfde048066@windriver.com>
References: <20190530092232.169453-1-kai.kang@windriver.com>
	<20190530092232.169453-2-kai.kang@windriver.com>
	<39d1e5c522b70d7c6dad4cb37641c0c1ae7cbd41.camel@linuxfoundation.org>
	<068b03a0-b96b-eee3-0dc5-9ddfde048066@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: poky@yoctoproject.org, peter.kjellerstedt@axis.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-poky][PATCH v4 1/3] poky.conf: make systemd as default init manager
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
X-List-Received-Date: Fri, 31 May 2019 09:00:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-05-31 at 10:07 +0800, Kang Kai wrote:
> On 2019/5/30 下午7:44, richard.purdie@linuxfoundation.org wrote:
> > On Thu, 2019-05-30 at 05:22 -0400, kai.kang@windriver.com wrote:
> > > From: Kai Kang <kai.kang@windriver.com>
> > > 
> > > Move configurations from local.conf.sample.extended to poky.conf
> > > to
> > > make
> > > systemd as default init manager for poky. Introduce a new
> > > variable
> > > 'POKY_INIT_MANAGER' whose value should be either 'systemd' or
> > > 'sysvinit'
> > > to configure the init manager setting.
> > > 
> > > For users who still want to use sysvinit, set in local.conf or
> > > any
> > > other
> > > configure file with:
> > > 
> > >    POKY_INIT_MANAGER = "sysvinit"
> > > 
> > > [YOCTO #13031]
> > > 
> > > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > > ---
> > >   meta-poky/conf/distro/poky.conf           | 10 ++++++++++
> > >   meta-poky/conf/local.conf.sample.extended |  9 ---------
> > >   2 files changed, 10 insertions(+), 9 deletions(-)
> > Thanks for working on this patchset, I think its nearly there. I'm
> > wondering if we should set
> > 
> > POKY_INIT_MANAGER_libc-musl = "sysvinit"
> > 
> > since I am worried about what I read about musl and systemd from a
> > security perspective.
> 
> OK. I'll add it.
> 
> 
> > I'm also wondering what we need to do with the autobuilder init
> > system
> > tests, I think those may need rewriting to add some sysvinit tests.
> 
> Something likes meta/lib/oeqa/runtime/cases/systemd.py? I think it
> is better to do in next milestone and create a defect to address it.
> If it is ok, I'll create one.

No, I mean:

http://git.yoctoproject.org/cgit.cgi/yocto-autobuilder-helper/tree/config.json#n813

which corresponds to steps 5-7 of 'qa-extras2' on the autobuilder.

We're going to need to update the test configuration on master to cover
the things we no longer test and remove the duplication.

> > Does POKY_INIT_MANAGER = "sysvinit systemd" work for the mode where
> > we allow old sysvinit scripts for compatibility?
> 
> I am afraid only one value could be set for POKY_INIT_MANAGER. And I 
> believe that most packages have been supporting systemd. If there is,
> we can add a systemd service file for it.

This isn't the point, we support 3 different configurations of this and
the variable needs to reflect that.

How about a slightly different approach. We define POKY_INIT_MANAGER to
take three different values, sysvinit, systemd and systemd-compat.

We do something like:

require conf/distro/include/init-template-${POKY_INIT_MANAGER}.inc

and then put the appropriate configuration in each .inc file?

> BTW, POKY_INIT_MANAGER doesn't consider the case of mdev/busybox. If 
> want to use mdev/busybox for init, just set DISTRO with poky-tiny and
> everything have been set properly in poky-tiny.conf.

This might be an opportunity to have another setting for
POKY_INIT_MANAGER which covers this too through an additional .inc?

Cheers,

Richard



