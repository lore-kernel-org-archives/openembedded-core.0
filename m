Return-Path: <ross.burton@intel.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 114BA6A53F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 09:31:18 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id g10so1900785pdj.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 02:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=2HX2E7cDM0o/AsS25TEoFTctayZ75RcSxslVFroGMk8=;
	b=WeOywGz0ekB3zETfSrkokunrYgW12PrrKMjsqnxXdKOT81U8Yor4NwQbwrqAb7uZpA
	SMJ96b/13ChAd7Q7ij4bzonDHFTb9oFeSrfpBACXzmY1pwW61mPjFphJyrBjoBw1IIkt
	I0gFSiVXUq1UN4I7bmEKX1Soim0nHDLa/1M8SX75zj7G78peNHcJREm/vMNTwgtsRlaC
	xgtvFkZN2gREWZY+osn9Oxr61ABT//2EXTHuOEl0hs+f1VmXatSNZv03JchDL5C1DqrK
	RBKFJDSVxKX8FSkZMYh9eBEeWmawtHHWqCgi0VEOuLDKGY5JayrauJGaFmIWIvHKld8c
	ST8g==
X-Received: by 10.68.162.163 with SMTP id yb3mr11852861pbb.212.1369992679321; 
	Fri, 31 May 2013 02:31:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Fri, 31 May 2013 02:30:59 -0700 (PDT)
In-Reply-To: <373E49FF-E99D-446B-A4A5-F852FDCAEFCF@dominion.thruhere.net>
References: <cover.1369922325.git.ross.burton@intel.com>
	<373E49FF-E99D-446B-A4A5-F852FDCAEFCF@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 May 2013 10:30:59 +0100
Message-ID: <CAJTo0LbQBvz81gxO1tKTG_TaNnA3jcpMDbB1tRqnhPF04otLfg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmJP7aQQgu82xsaTjI8c7CBMmsasHyKeaczXIH4jPMaqfZTcZnOQv5UFgw4IywKvFboXr8/
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Mesa and Wayland updates
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
X-List-Received-Date: Fri, 31 May 2013 09:31:18 -0000
Content-Type: text/plain; charset=UTF-8

On 31 May 2013 08:18, Koen Kooi <koen@dominion.thruhere.net> wrote:
> We talked about weston off-list a few weeks ago and this seems a good time to bring it back on list :)
>
> I'd like to get the framebuffer backend supported, so I upgraded weston to 1.0.90 and added:
>
> +                 --enable-fbdev-compositor \
>
> +# Needed for weston-launch
> +WESTONBACKEND ??= "fbdev-backend.so"
> +
> +export WESTON_NATIVE_BACKEND = "${WESTONBACKEND}"
>
> At the time of writing that weston didn't support runtime detection or config files entries for selecting the backend, only commandline arguments. So whatever is getting picked at build time, you're stuck with that. Does 1.1.x address that situation?

Sadly, not as far as I'm aware.  I have 1.1 in another branch but it
totally broke GTK+ 3 applications (which didn't repaint after the
initial creation), which is pretty sad.  Relevant developers harassed.
:)

Ross

