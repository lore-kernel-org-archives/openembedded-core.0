Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 121766011A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 14:16:02 +0000 (UTC)
Received: by vkfr145 with SMTP id r145so14081292vkf.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 06:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iu0XBE0KZrYgEyfI/dZGBVA0mFxuHdAuaWBabVHwbPs=;
	b=WZQ2CWpfaOb1NHTnfjprmxT8kx9Wv4nmAFrRWbeRbyrVtuvyxclgEZW/4SnIWG0beS
	u94YstMRLUtrCDBaFQMswGnl3PsWkejvgST5mp1oGMDbqi9Bz3caljukjpzhIy838LAw
	u+uo4ZpofCAmBnSEw4zaGupjCIBXENvB9ZavL7QJGQJgQ+79YS7gl9laPg4PBB1iWViS
	nB4M6V8pVSj2/DTytWvuXf3J98adU1SKuDQuh3peKj+4eNaq67a/sDXeY6/C0rEVbgvE
	w06DPKXMjYh76/LblXKraz5UOQaU2qRyjqLk3o1MrhwxwHf7RQHtBPlycCoRT/5a//Td
	bHRQ==
MIME-Version: 1.0
X-Received: by 10.31.140.199 with SMTP id o190mr6155835vkd.63.1448115363423;
	Sat, 21 Nov 2015 06:16:03 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Sat, 21 Nov 2015 06:16:03 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1511210640580.26105@localhost>
References: <alpine.LFD.2.20.1511210640580.26105@localhost>
Date: Sat, 21 Nov 2015 09:16:03 -0500
Message-ID: <CADkTA4MBujzToM2AV7su24sUEvLXLwFyGK5ZcX3SP6SMv-7KTA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what means the EXTRA_KERNEL_SRC_URI variable, if anything?
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
X-List-Received-Date: Sat, 21 Nov 2015 14:16:03 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Nov 21, 2015 at 6:45 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   perusing a BSP package handed to me by someone else and in their
> recipes-kernel/linux/ directory, there's a custom kernel .bbappend
> file with the line:
>
>   EXTRA_KERNEL_SRC_URI += "file://kernelmods.scc"
>
> i am unfamiliar with that SRC_URI-related variable, and i don't see it
> anywhere under the numerous layers i have checked out. is this some
> legacy/deprecated variable? i don't know what to make of it.

I'm guessing that BSP was created/packaged by Wind River :) That variable
shows up in the linux-windriver kernel recipe, which is based on linux-yocto.

It was simply a way to have a variable that could be used, without requiring
direct manipulation of the SRC_URI .. since if a direct assignment had bee
done to SRC_URI "good things" got clobbered, and "bad things" happened.

I'd suggest ignoring it (except perhaps in the context of what you are using),
since it is specific to that kernel, and something that will go away over time.

oh .. and if the BSP wasn't a Wind River one .. I have no idea ;)

Cheers,

Bruce


>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

