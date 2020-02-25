Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D08CE6132D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:23:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r11so14265282wrq.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 03:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=hnYpPdczx680Ri6D8RW9kaTT71R+E4M4U/cknufFOsg=;
	b=dNuX/vRCWARGVVacPdSfC9LKGpL3l/+oy/Hx5649Vwxawsc8kKr0/fouanR7T959zW
	bAis6usqR9kqaYnlz8ySHeQuOnw5nTzOHHbF4NBD+XjXhiYLBJ8XfAG2mASdYL0dTej2
	bVSzoXWKSnI/hHTwA/hVvXNC/ftkW0YsB64hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=hnYpPdczx680Ri6D8RW9kaTT71R+E4M4U/cknufFOsg=;
	b=D0eIocIkBFYT38unBLNmJ86sq4yq/rBiZTjHFGyz2qeSB6GqtL8jynYp4kIwWw2weL
	7gi+hkWpF/MMG3vxPqB6L1aAvDBAZn1GHUQVYfORdACM+Xl0ILG8kvL19QrwUil9YZVj
	vlVE2G86tYXvydwo5b6nI3b4ZvT+131M6SqS2ZMtlq7CSCvmJMs3Fb6t3rHhpY0Jt0uV
	rx1mrirY/K+NdbubmvYst1andi/a5diM4GTowLcYGDw30lVQeYtNhDfZCKQNWRCo9tz2
	R/60u3b9lw0M15RZCJP7CArb6RbrbX4wFA2mZlZU8cihCSVcKvs2mEnoG5GueT+PuVHZ
	KhVQ==
X-Gm-Message-State: APjAAAWa1/THh7/CD87KnK+iVC4QhCdUN+UyfWYxfmZPbevyQ+Sd2bD0
	gZ/cB2FJGb0c3jDmyo+6nX9UBg==
X-Google-Smtp-Source: APXvYqwrUPwX7N8QNKtgBBpOAm6tGrr15i3daFu+45u5EhqyeY0AlzHrZcdpQIsobJ7NzYC+9ZtBXQ==
X-Received: by 2002:adf:82ef:: with SMTP id 102mr21179030wrc.23.1582629838432; 
	Tue, 25 Feb 2020 03:23:58 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id n3sm23452340wrs.8.2020.02.25.03.23.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 03:23:57 -0800 (PST)
Message-ID: <f6decca694d108f6d764e6423bbb2ba7282d858f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, Adrian Bunk
	<bunk@stusta.de>
Date: Tue, 25 Feb 2020 11:23:56 +0000
In-Reply-To: <0018e8670b37836cfae92fd7332e927ec49f19ca.camel@andred.net>
References: <20200224125955.26771-1-git@andred.net>
	<20200224134022.GB27036@localhost>
	<6c0d874e887dc5a2355d236d77e8ec771ea729f9.camel@andred.net>
	<20200224143155.GD27036@localhost>
	<5639b75022c28419467aefb8de62c6ab24f9eae6.camel@andred.net>
	<20200224151041.GE27036@localhost>
	<0018e8670b37836cfae92fd7332e927ec49f19ca.camel@andred.net>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: reproducible builds involving xz (was: Re: [PATCH v2] bitbake.conf: omit XZ threads and RAM from sstate signatures)
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
X-List-Received-Date: Tue, 25 Feb 2020 11:23:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-02-25 at 11:16 +0000, André Draszik wrote:
> On Mon, 2020-02-24 at 17:10 +0200, Adrian Bunk wrote:
> > On Mon, Feb 24, 2020 at 02:58:21PM +0000, André Draszik wrote:
> > > On Mon, 2020-02-24 at 16:31 +0200, Adrian Bunk wrote:
> > > > On Mon, Feb 24, 2020 at 02:21:57PM +0000, André Draszik wrote:
> > > > > ...
> > > > > Once the artefact has been created, it doesn't matter anymore
> > > > > how it
> > > > > was created, as long as the high-level options aren't being
> > > > > changed (like
> > > > > an explicit compression level, checksum method, etc.)
> > > > > ...
> > > > 
> > > > meta-poky/conf/distro/poky.conf:INHERIT += "reproducible_build"
> > > 
> > > I still maintain these are two different problems. I am not
> > > trying to fix
> > > reproducible builds.
> > 
> > But won't fixing reproducible builds require reverting the patch
> > you 
> > suggest for fixing your problem?
> 
> No, I don't think so.
> 
> To fix reproducible, you need to either patch xz to always behave
> like in
> multi-threaded mode, even when --threads=1 was given in the
> arguments.
> Additionally, a patch to xz to allow it to scale down the number of
> threads, but not the compression level (--no-adjust prevents both),
> could be useful.
> 
> Alternatively, you need to decide if you want to support it with
> --threads=1 or --threads >= 2, and issue at least a warning in
> reproducible_build.bbclass if somebody deviates.
> 
> 
> You should also calculate the memory requirements, reduce the number
> of threads to fit, and again give at least a warning if the
> compression
> can not be done without changing compression level after that.
> 
> I still maintain that none of that is related to my original patch.

If I merge your patch, what will happen is that builds on the
autobuilder can potentially start failing as it will potentially detect
reproduciblity issues which it wouldn't previously see.

To address this, I'd ike to see a new parameter added to
oe.utils.cpu_count() which allows us to have a minimum of 2. I'd also
like to reparametise the memlimit so we can drop it entirely by
default.

This should get us some defaults which won't break things and give
reproducibile builds. They may not work for everyone but its then
something which we can build upon.

I do want to take a patch as I agree there is a serious issue here but
I'd prefer we get it right and try and stop it causing me headaches on
the testing infrastructure.

Cheers,

Richard




