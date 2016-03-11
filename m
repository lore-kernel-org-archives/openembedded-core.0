Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 27C1A73289
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 18:53:56 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id tt10so106393567pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 10:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=lMblnOC9AmrJw/512XxvZ+6VDtMsNM1R8z/ruCYidIU=;
	b=qBjPv2Xg2/mNrT+eZCOc0vWWWNs4RwsRwPw6SLazmNQp+6C0sXDT4W3IH9XX/XF8Bb
	XEqkbLPXxAmlR02on61exTckSD1HBru/iQcmCYZKFlVCU69paxx8MnaMlovLh1nU8lfq
	3pS9OvSjlGPfgB7G0H+00C+qfIH8nqACNYyyh4z/WDJYZfodr2/LFSb+3Ow4vnZRq9Mi
	wqnDBmnaj4wuO85nTCpyK79+UYSrfM9TE11J+iXRQbUOOVwlCzMUEavsMqXhuAlP7yT4
	Tf1HlSez3s9/P57A11rPv7G+FX9olE1QG8sJjmlhGAD8blZPxK0w/Uh4yIKBKrmaglpt
	294Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=lMblnOC9AmrJw/512XxvZ+6VDtMsNM1R8z/ruCYidIU=;
	b=N6I+LYujIclHOjfNYy6bHq+u2Btmp7DO/QAgHSijL3/plXTf77ftrFLKCbXDKyU/Ou
	Wzl9Zq6yyH9VkKJ5DM2HwhxaAN9htnbaF7vy0EG3drE4aSBsULOBNFQAV3niuYhpPMvt
	7Baf6PjKadRepUFYxuoIVkM9zwRl+ko/K423gr5tu5mereLsN3CthdJF2hYGFiFmbrh8
	fdH5Q4YblvB1DBfJ6f7Bddu/5G3NItPNudsfmQvPyD7n9A/5Tv9suflTP1p+wbX5b+ct
	oxTIOhEKVwtkkEv/qQeSgbnpPe+TqUknVbZa9KVT1od6684LQ6SBVbg01dA8yldDfdAA
	aimg==
X-Gm-Message-State: AD7BkJLpyy1LVPZ/NG2cm3c127kXhaMJ/bOgkpOjEQjZtz/z6hg8h6zzB0vueLBE/+0ElA==
X-Received: by 10.67.23.161 with SMTP id ib1mr17544100pad.156.1457722437396;
	Fri, 11 Mar 2016 10:53:57 -0800 (PST)
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com.
	[209.85.220.49]) by smtp.gmail.com with ESMTPSA id
	p75sm14624078pfi.29.2016.03.11.10.53.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Mar 2016 10:53:56 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f49.google.com with SMTP id td3so79194228pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 10:53:55 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.63.41 with SMTP id d9mr17987761pas.1.1457722435325; Fri,
	11 Mar 2016 10:53:55 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Fri, 11 Mar 2016 10:53:55 -0800 (PST)
In-Reply-To: <cover.1457698804.git.jussi.kukkonen@intel.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
Date: Fri, 11 Mar 2016 15:53:55 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrZMfa0bW6e3VRS+mks+OJNDJwSmXqxtRM_QgBTSK5mQg@mail.gmail.com>
Message-ID: <CAP9ODKrZMfa0bW6e3VRS+mks+OJNDJwSmXqxtRM_QgBTSK5mQg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 00/12] Sato desktop upgrade (Gtk3 etc.)
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
X-List-Received-Date: Fri, 11 Mar 2016 18:53:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 11, 2016 at 10:12 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> Here's a snapshot of the Sato upgrade I've been working on (YOCTO
>  #3169). It's based on Ross' work from 2.5 years back. The bigger
> changes currently live as my forks of the upstream projects (gtk3
> branches of various projects at https://github.com/jku), and the
> patchset here modifies recipes to temporarily use those forks:
> this is intended to make testing and review possible but also
> means this is just an RFC: once the upstream changes are merged,
> I'll update this patchset.
>
>
> For those not familiar with it, the goal of the exercise is to
>  1. Bring Sato desktop closer to this decade (Don't depend on
>     ancient components, remove deprecated code)
>  2. Focus more on delivering an environment for validating and
>     testing oe-core, less on building a DE for mobile devices
>
>
> Major changes:
>  * Ports to GTK3: matchbox-desktop, matchbox-panel-2,
>    connman-gnome, sato-screenshot, xsettings-daemon
>  * GTK+ theme is Adwaita (upstream default)
>  * Matchbox WM theme modified to somewhat resemble Adwaita (boring
>    gray instead of in-your-face green)
>  * Matchbox panel is no longer drawn on top of application titlebars
>    because that fails badly with client side decorations. Instead
>    it's a thinner panel always on top of screen, like gnome2 panel.
>  * Custom GTK theme engine is dropped
> Here's a screenshot showing the panel and window decoration:
> http://imgur.com/noqptiu
>
>
> Regressions:
>  * on-screen keyboard: I've not looked very closely but I
>    believe this requires IM work for GTK3
>  * startup notification
>
>
> Questions:
>  * Schedule: this is for Yocto 2.1 in bugzilla (now M3) but got
>    delayed. it's a bigger change and isn't ready to merge
>    (as the upstream patches need review). Should I aim for next
>    release instead?
>  * How should we do review on this? The upstreams are mostly on
>    yoctoproject.org so I could send patches to some YP mailing list...
>    but testing many of the patches is impossible without the patches
>    for the other projects.
>  * Are the regressions listed above blockers?
>  * Anything I've missed? Theme design bikeshedding?

Is matchbox still the way to go? To test OE-Core maybe a custom GTK3
app might be better.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

