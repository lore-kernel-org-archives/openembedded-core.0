Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 563926BB80
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:58:04 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ib11so954410vcb.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 02:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=e3wnXq+SwrIqOjp6gffkuk+IAUrT2y84U2yM5EGH0Vg=;
	b=ktEOdWLyR/8YrsjpUESq5hh/sDgXEJMilsVqR+dOhWbh8sUi6MBuQ6/0aiPr+NGhjM
	VhA6iZYwk3T1Irlg9uRLY4/6mOONN4OirjEFfWATXsAQKG5t5pUcjbUAGfu+OjeN2jQU
	SSAaPLKdajO0H5loKX+wYl8oADWKDDRwpH6+wzhuRJhJe9y1O0nt9VtOMrLFCQiE/2pp
	crboR9O4WWsga3hrdAqqFlvws20fHETXKYPpnNYgH5V0V/eSeLyLKdX7MM7xglSjbgqA
	nA3QBMOPNUh4im9WuKmCB5bydJK59T+TU5U7a1W5I1m97uJuNctpN5OY4IzFz1SX0ymB
	Po6w==
X-Gm-Message-State: ALoCoQmjd6fELLWJ/KeMkefRoGjMXnA5cRvX/o2heLDGc39FAMroyDTfauoyMeMXoV/rdOk09FyH
X-Received: by 10.220.43.19 with SMTP id u19mr4892094vce.3.1378375086102; Thu,
	05 Sep 2013 02:58:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 5 Sep 2013 02:57:46 -0700 (PDT)
In-Reply-To: <4562a00806c5a6573b5aa650764ad12bc93edda7.1378339881.git.dvhart@linux.intel.com>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<4562a00806c5a6573b5aa650764ad12bc93edda7.1378339881.git.dvhart@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Sep 2013 10:57:46 +0100
Message-ID: <CAJTo0LY-oi+tQy7rs84axy4R71Y4j=HtEgXALN20aVdATwzVdg@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] xf86-video-mga: Pull in Matrox MGA support from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 09:58:05 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2013 01:18, Darren Hart <dvhart@linux.intel.com> wrote:
> In support of the more generic x86 BSPs, pull in the Matrox driver
> recipe from meta-intel.

What machine is this for in particular?  In discussion with Nitin
about MGA a few weeks back the conclusion was that the vesa driver
should be sufficient.  As far as I'm aware the reference platforms
don't ship with MGA hardware so it's up to the owner of the platform
to install whatever they have to hand (mga, nvidia, ATI, etc), or am I
wrong about that?

> Remove the checkfile patch from Ross as this is now handled adequately
> with the configure prepend hack which assumes success for any checkfile
> calls.

Assuming success in an distro where opengl isn't enabled will result
in the driver believing that DRI is enabled when it isn't, so expect
to see build failures from this.

Ross

