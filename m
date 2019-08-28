Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF3A7F2B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 22:41:23 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n2so332260wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=LXBS+kfWLMbcJDF0DYoBadp+gsncUGw3PbtLIRTkrx4=;
	b=XwYAyYu/6HIEeNxh7yToljFbB6VoFC/9Serm2IWwdtvk7qb3vp8O0e0kiYqQJhBdWD
	ALZqjun7SFi0GAhyk0DtR/GJtYmib2bigikSrNWZ5iZFw52VsToWQ8Eocj/g3rwOyo8Q
	gqE723FCWJHkN3SRIj58ehOnZxNjrFzO46xuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LXBS+kfWLMbcJDF0DYoBadp+gsncUGw3PbtLIRTkrx4=;
	b=PbeufWXVu4sMmFJe3VZe6/t3cOzgf1xhqKyFzJNQSHdOzRe5EsDf8BYTbo7PxVChsY
	9CQJDAcYqZRnrJepQ7DNLfVoSVPmkPh9ehlzqcC2M0YxZFbFKCtdwts9PpBoZIlhGP8V
	7iZfbOKgiPtO5DX3Cl9+MbZpa9SLzW6YQpzuKuHP21tbI2PhJyBVCywj8O1Nv9gp6Gtq
	k64tm9VFheF8mqFal7utxYJsJfrMjuVMkrE5yfvG1/ETzpq29j2P/dQN/H3E+G/Axf/X
	0oh3TD/3N/+FnjM83+MGOxEO3mSQfPIIkPs8uNuOKwD4IHcSJqExSKwDgHsM0mb+aU8J
	0nDg==
X-Gm-Message-State: APjAAAWuQimwUJ9B9C/DJFAC4/5pr/b0LDral1Zm0e3TIBq6tiBVdNki
	IkS/cs2hLg7yFiGc7/7LYCg4dA==
X-Google-Smtp-Source: APXvYqy2lmDViYK/bhuaoC3CaC8fdUKqd0EA8flu9ZgiUbNtctlE6UFAri0fj4jfWO8U76Kkdk7hag==
X-Received: by 2002:a7b:c745:: with SMTP id w5mr7289675wmk.21.1567032084410;
	Wed, 28 Aug 2019 15:41:24 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id i93sm817362wri.57.2019.08.28.15.41.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 15:41:23 -0700 (PDT)
Message-ID: <e125a759ceaca090562af688aad68eaec89f7da2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2019 23:41:22 +0100
In-Reply-To: <f4465a3a-87fc-3233-9add-8655a2c10ed1@windriver.com>
References: <20190821002750.52062-1-jason.wessel@windriver.com>
	<0f501dcaee763d8d33152fbd82af53385b8d0dc9.camel@linuxfoundation.org>
	<1bd6ab16-628d-2326-d6c3-c6097d7ba698@windriver.com>
	<fa27a4877d9dd0668e23873e02f8bd90bdf93ac0.camel@linuxfoundation.org>
	<f4465a3a-87fc-3233-9add-8655a2c10ed1@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] serial-getty@.service: Allow device to fast fail if it does not exist
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
X-List-Received-Date: Wed, 28 Aug 2019 22:41:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-28 at 15:24 -0500, Jason Wessel wrote:
> On 8/27/19 7:15 PM, richard.purdie@linuxfoundation.org wrote:
> > On Tue, 2019-08-27 at 19:03 -0500, Jason Wessel wrote:
> > > On 8/27/19 5:58 PM, Richard Purdie wrote:
> > > > Hi Jason,
> > > > Somehow this change is responsible for this build failure:
> > > > 
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/976
> > > > 
> > > > (steps 5c and 7c so failure during testimage).
> > > > 
> > > > I have bisected it to this change, I haven't looked into why.
> > > 
> > > Thanks for tracking it down.   I am sure how to try an duplicate
> > > this.  I clicked around to try and find out a bit about what it
> > > is
> > > running for these phases of the build but it is not very obvious.
> > > 
> > > Is there a local.conf I can try along with what ever commands it
> > > ran?
> > 
> > The configuration its using is shown in
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/978/steps/8/logs/stdio
> > for each step.
> > 
> 
> I tried the configuration on my system but it seems to work fine, see
> below.   Is there a way to get complete log file of the boot on the
> broken host?  I am also curious if it fails every time or not.
> 
> /home/pokybuild/yocto-worker/qa-
> extras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-
> sato/1.0-r0/testimage/qemu_boot_log.20190827200002
> 
> I am not sure it will tell us anything further or not, but it
> certainly looks like the system didn't boot correctly in the first
> place.

I've rerun it as 
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/983

Cheers,

Richard


