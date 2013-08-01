Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mail.openembedded.org (Postfix) with ESMTP id 14A686B1F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 10:45:58 +0000 (UTC)
Received: by mail-vb0-f46.google.com with SMTP id p13so1910460vbe.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 03:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=CsJx5UE7RL0vx4l2ONZveq/xzCkXYH2m2OxFxTexZtw=;
	b=MFK/eTETWkykwm3aYMdk2dNCzWprdG4PPZSok7STa3YhwsG6VyEVXUW5DgC0kRC9c/
	HVAhmrHT/o7u4zXqrz+BEyIjBOWfMf2ApcktYdk+kySGKhNEcGcCUzxpEDbbw/EkCnF4
	SmmMaIxPawbp53iyhBELC1btTIumhMuXrznnXtrhrnkcG53CxW/7DqucCMOgSPHJDFQl
	5p19yqUnJNGFdo08BwV4hG7zvpEYnioQWpMGJdDNFQDMdNXnADqRWfk4vkPMisTEY8wB
	q18MJeHT6nNxkSxCGe2lOmomi3b35woeM8sWhkB4gEkqRah81l2ION5FTZRy/d2OTV6L
	vHfw==
X-Received: by 10.220.58.195 with SMTP id i3mr273886vch.38.1375353959417; Thu,
	01 Aug 2013 03:45:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 1 Aug 2013 03:45:39 -0700 (PDT)
In-Reply-To: <20130801104115.GN3280@jama>
References: <1375305315-22057-1-git-send-email-ronunes@gmail.com>
	<CAJTo0LYtx1fg-hicArTgeQePBO+BRH7T+AkS75+7wPTUJQj66Q@mail.gmail.com>
	<20130801104115.GN3280@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Aug 2013 11:45:39 +0100
Message-ID: <CAJTo0LbHOqnkRcPYptsj0YrXqrvWB9H-kkH365SbzkUOXC-k6w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQlSnxC08W45zdWukayYtwEGS+qmjwCTjadx0WkIIoHYtDCzfhUDVkIxs6+AxMKy2Fz+K75C
Cc: Rogerio Nunes <rogerio.nunes@freescale.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [master, dylan][PATCH] packagegroup-core-tools-testapps: isolate x11 dependent tools
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
X-List-Received-Date: Thu, 01 Aug 2013 10:45:59 -0000
Content-Type: text/plain; charset=UTF-8

On 1 August 2013 11:41, Martin Jansa <martin.jansa@gmail.com> wrote:
>> If no x11 distro feature then mesa shouldn't be linking against X, so
>> mesa-demos won't, so this should work, right?
>
> mesa-demos need glew and glew needs virtual/libx11
>
> Unfortunately mesa-demos autoconf stuff doesn't allow to disable demos
> which are depending on glew, we're using ugly hacks to remove glew
> dependency and build mesa-demos only with few demos available without
> x11 in DISTRO_FEATURES (only egl subdir).

Damn, oh well. --without-glew is something to push upstream correctly
one day then.

Ross

