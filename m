Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D3BF47F2DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 22:24:51 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n2so300552wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=q9MBILs2Qk/pNm5jJeYlr2HEa6J+NBu1EyXROxcFyhU=;
	b=CHsmXNa0uXqNAlZAYR4tK5RKN6ob7dUE1exRwq9idtZ/+pWt0TQc+jR0q4WvW2s91Z
	w8FohAttmsGGOPQS+CARCUNCD79/hKxHVBYRZ5vVH/z4F1cUfIVb3yQrgRctwv1Da6sm
	ggy+L/UXjgcGNCtmpdLa1Be28NDxEgUAecVr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=q9MBILs2Qk/pNm5jJeYlr2HEa6J+NBu1EyXROxcFyhU=;
	b=tWoIhPelOwKgjkYLxAFqnA6w2M8+BM+g/HpoRTofmcGOP1TWWa/N+sceuq/OlLmLxC
	KpJ22sWBmQgNFKa1J2pZykqRbtVK4ho+UYWdFUqX0sI0sHOL5sm/Wzb28s/z/v07hSjm
	be4m3T+zIqerxgIpxTdvdC0ejZ6IeC+dFUvpdeqSLfxBf+qzDd5cBEMdCuDLAIfiX+m6
	Y9TgWASRhCHYegmrATqv3j6+o4PRk1PzGsPV4x55bEQjFQobdqRcjWIVh9XumzJ5rL4/
	fi+2EaobD1ONlNmxWY8I+li4NsV+jnIkFeATv+xA5rHFred1VoD6xGHMApN/DU9pO616
	zJFw==
X-Gm-Message-State: APjAAAXYf2y4MiFnarNo1XMFsHSc/7dH6no9zuzN+2M+//stkKpdfEnc
	lU1OyMkAWy6jVa0AGP0F3VHmpg==
X-Google-Smtp-Source: APXvYqyxzfMppEdwVNlNHW5wlKs1KuOjTF5eRj+fXhJ6siklKeg7AYuGrB9ecT4EoOQ/fUTGGSqVAQ==
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr7853252wmj.25.1567031092500; 
	Wed, 28 Aug 2019 15:24:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k124sm521831wmk.47.2019.08.28.15.24.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 15:24:51 -0700 (PDT)
Message-ID: <e4a348d856248ad0c339925066a3ac34e6c77214.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jason Wessel <jason.wessel@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2019 23:24:49 +0100
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
X-List-Received-Date: Wed, 28 Aug 2019 22:24:52 -0000
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

If we'd got this straight after the build then yes but its been
recycled now.

It did seem to fail repeatedly when I tested it. I'd probably have to
add the patch back and retest again to get the log.

> I am not sure it will tell us anything further or not, but it
> certainly looks like the system didn't boot correctly in the first
> place.

It does seem like a boot issue somehow...

The test case one the autobuilder seems simple enough, systemd boot
alone with no sysvinit.

Cheers,

Richard


