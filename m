Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E0C1161AEF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 16:20:56 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z15so5921363wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 08:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=bYBfY3p2oeksCX2s+y602yrBLKgMzSgjcqaaN8+wDSo=;
	b=doLcu7k0WtEWJjJQo2z4nl+2x9nPOBuzPPjU2JaociYbw+F55MeuQf7dattdXaM4IX
	Lqlhq5OZ1yeNFw5Od6BeiKuJaOkE13vf9RwSaf+AgqmzOewUvNhlfQT5H7c6ybdRj3I8
	FhDgh3ScxR0VDatmmn+VsoNmcc6/q8pYmurtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bYBfY3p2oeksCX2s+y602yrBLKgMzSgjcqaaN8+wDSo=;
	b=VsRBcN8Env2Taec1HiFptW2mq/zYzmR7XaA1oOEjX/+Ggu+fMJMr/oU+z/L7HpveO7
	AkYwLB2gl8/DuO4NN2dMHmWaYkkUcM0ce2/dj+EaP7KnV5vHwSrzcpDA6fAgkHQcf00G
	9VTf3CoMvtM9Wsa7JDSyJDNK851WIyl2ym2QAe0TL+S4t+T49mJT/JHzbM7/0l9Z1IBx
	A9Etx4wWCQT99P8HyGgOeEmdzfHpDtc2arOezhFxYMl06NxM7idD6QiIj6KlMIo2uHvT
	3VyXF/da02mLCM1xrSunpiVwmEPSTLHB8X2F582awTLxkQHDzkIluXcM07a+33VGpyMK
	AYKg==
X-Gm-Message-State: ANhLgQ2HY4MktkQPX2q1dZeQ4fKg0vkiBCUHEYP4e8LZ4caWDhf2CfBs
	ePfaw/wauW0aydpJiJUo9vSNMw==
X-Google-Smtp-Source: ADFU+vskdsmmXMTLKV3HOcY60Iwg9RGvxUlpC2SMQvmg8Nu2Q0lL/L8cdBYcHiGChPH5gMrIxwpLWg==
X-Received: by 2002:adf:df8f:: with SMTP id z15mr10193855wrl.184.1583598057629;
	Sat, 07 Mar 2020 08:20:57 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s22sm17482050wmc.16.2020.03.07.08.20.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 08:20:56 -0800 (PST)
Message-ID: <61c89136e75765e8cb188bf16b5fddd7ff28c8b3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Sat, 07 Mar 2020 16:20:53 +0000
In-Reply-To: <06f78962af6ad632793a533a22d8f1b91e5a50fc.camel@gmail.com>
References: <b73e07036162eab111213d9d3bd14c7436733039.camel@gmail.com>
	<8718ce405436564b3ad55fa52046e5e55ee562dd.camel@linuxfoundation.org>
	<06f78962af6ad632793a533a22d8f1b91e5a50fc.camel@gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Extensible SDK improvements
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
X-List-Received-Date: Sat, 07 Mar 2020 16:20:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-03-07 at 15:55 +0100, Adrian Freihofer wrote:
> On Sat, 2020-03-07 at 12:40 +0000, Richard Purdie wrote:
> > On Sat, 2020-03-07 at 12:54 +0100, Adrian Freihofer wrote:
> > > Hi Richard,
> > > 
> > > We have found two already supported ways to copy variables from
> > > the
> > > bitbake environment local.conf to the eSDK local.conf
> > > 
> > > If a variable is defined in the local.conf bitbake environment,
> > > SDK_LOCAL_CONF_WHITELIST and SDK_LOCAL_CONF_BLACKLIST can be used
> > > to
> > > add it to the local.conf eSDK file.
> > > 
> > > If a variable should be statically defined for the eSDK but not
> > > for
> > > the
> > > bitbake environment, sdk-extra.conf is useful.
> > > 
> > > Now we would like to add a third way to add variables which are
> > > dynamically calculated by bitbake but need to be statically added
> > > to
> > > the eSDK local.conf. For example we would like to support
> > > something
> > > like that:
> > > 
> > > def get_version_from_git(d):
> > >     version = d.getVar("GIT_VERSION", True)
> > >     if version:
> > >         return version                    # runs in eSDK
> > >     else:
> > >         return bb.process.run("git...     # runs in bitbake
> > > 
> > > GIT_VERSION := "${@get_version_from_git(d)}"
> > > 
> > > SDK_LOCAL_CONF_EXTRALIST_append = " GIT_VERSION"
> > 
> > This worries me a bit since it means the eSDK and the "real" build
> > can
> > behave differently. I appreciate that can happen even with the
> > other
> > variables and means of setting them but this takes it to a new
> > level.
> > 
> That I understand. The usage of the SDK_LOCAL_CONF_EXTRALIST would be
> very specific. Wrong usage would lead to a broken sstate in the eSDK.
> 
> > Ultimately I think we're aiming to have normal builds convert into
> > an
> > eSDK and vice versa more easily. This seems to pull us further away
> > from that :/.
> > 
> > What is the reasoning for having them behaving differently?
> 
> Our goal is to equate the eSDK behavior with the behavior of the real
> build, also for the example with the GIT_VERSION, which bitbake and
> git
> will dynamically evaluate at eSDK build time.
> 
> Suppose we want to compile the GIT_VERSION (last tag) from poky
> without
> any manual steps into the firmware. bitbake can simply call
> 
> $ describe git --tags --dirty
> uninative-2,8-74-g56446f4570-dirty
> 
> With Bitbake the variable can change. But in eSDK the GIT_VERSION
> must
> be a constant. The above function behaves like a constant if
> GIT_VERSION is defined in the local.conf for example. But it has a
> dynamic behavior if GIT_VERSION is undefined. The only missing part
> in
> the current Poky, is a way to automatically write the value to the
> local.conf of the eSDK. I don't think this would be much different
> than
> the already existing sdk-extra.conf file.

I've been thinking about this further. Why is any of this in local.conf
in the first place?

I'd suggest the bulk of it should be in your distro or class files?

I understand we do need some simple changes to local.conf in many cases
but any complex logic really should not be there. The above does look
like more complex logic to me...

I'm therefore leaning towards saying no to this patch, its just going
to cause us problems in the future.

Cheers,

Richard




