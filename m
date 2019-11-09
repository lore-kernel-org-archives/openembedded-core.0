Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C493F7E31D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2019 16:30:42 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i12so3356395wro.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Nov 2019 08:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=NHfO6fT0PkDBhV3fpfw5umulOOijUOyClTndOL+c9Q0=;
	b=frR9GE2UCjvSBV10I3E7PpDutMbINfnwThMs2r4Nt/oOHmvWEnn9xGfTSwCL5Lydx4
	QWazbxfU6F6Vaz9FQd7u8t0ejGXXl/AWwSjEv52no9l48lDPl+Fu3/0kgPSKHMa4e9Yx
	BuVcvV7If0IKqzQLo1x0HOPSm/EZ9CP6KdAdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=NHfO6fT0PkDBhV3fpfw5umulOOijUOyClTndOL+c9Q0=;
	b=Qf7wdXXP/bHuo8oL14faMc1V8pVgbJEUrxIfGGe/YZYzx1U55LdtZ6T5RrQSAbgwb1
	e8AVFjoyC+IxOxCY0HPQpo4b/CEoG5/ymTOCRJBwvD0uzRVJqEEwnxiih7chM4BY1Rmn
	gletO9PCz0/se3vVI2SSyvueRxHL1Uu6dn/SdfNYth/F7YdjgBAHYcbVTn+tRCBUu8FL
	GcI5zd9uqxcezwtGVKS+DvNujEePY5iAApYG0bCEjwCnbIfHJe5v3gYVrKm4mCNrM4U7
	GkyahAiPVAtnEPvrb+d0xq/pFS30jghnP7nOVXTZxfEXeeLJ7N1H4WxNWxeJOmj8QHja
	6ZUQ==
X-Gm-Message-State: APjAAAUk0bc/N/xuwBIgJvy4iBkTwRuCuFYl5efidVWbgG4V1JpNi/NA
	9ki3ZMJDc2wggsowly/dIP8c2A==
X-Google-Smtp-Source: APXvYqw1rb+e/NGLfzem92PDwN+o3cl6iSpQknnObl6BklRWthVaMA6/mZPUV5aeKIgmHVxwd+JQpQ==
X-Received: by 2002:a5d:570a:: with SMTP id a10mr8311505wrv.107.1573317043261; 
	Sat, 09 Nov 2019 08:30:43 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z189sm13386969wmc.25.2019.11.09.08.30.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 09 Nov 2019 08:30:42 -0800 (PST)
Message-ID: <5100e289ac8a5c4d0196e8ec77813859bb7a703d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>
Date: Sat, 09 Nov 2019 16:30:41 +0000
In-Reply-To: <20191109100710.66530547@seebsdell>
References: <20191109153559.15847-1-richard.purdie@linuxfoundation.org>
	<20191109100710.66530547@seebsdell>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: Drop static linking to sqlite3
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
X-List-Received-Date: Sat, 09 Nov 2019 16:30:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-11-09 at 10:07 -0600, Seebs wrote:
> On Sat,  9 Nov 2019 15:35:59 +0000
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > Back in 2010[1] we made pseudo statically link against sqlite3.
> > Since then the world has changed, pseudo now has separate processes
> > for the database in the server and the client and they have
> > separate linking commands.
> 
> I'm not sure what that has to do with the reasons for it being
> static? Not that I remember exactly anymore, but I think we were
> hitting problems caused if pseudo was dynamically linked to sqlite,
> but I don't remember what they were.

I did talk briefly to Mark (also cc'd) as he wrote the original patch
and he thought it was possibly because the client was also linking
against sqlite3 and due to the other things the client does, that was
problematic.

> I'm not entirely sure I know what you mean by "separate processes for
> the database in the server and the client". I don't think
> libpseudo.so should ever do any database things at all, and it
> shouldn't need to link to sqlite.

I was under the impression the client may once have linked against it.
I admit I didn't dive into history, just checked that it clearly
doesn't now.

> > which occurs if sqlite3-native was built on a machine with glibc
> > 2.28 or later and pseudo-native is being built on glibc before
> > that.
> 
> I don't think pseudo's ever been *expected* to work when built linked
> against things built against different libc. It is *way* too full of
> unholy magics that depend on knowing which libc it's using. That
> said, the pseudo server also shouldn't really need to be statically-
> linked, the only times it ever runs under pseudo, it just immediately
> tries to escape and not run that way.

The client lib doesn't and the server side should behave just like any
other linux binary afaik so we should be ok with a dynamicly linked
sqlite3?

> > There appears to be no easy way to avoid this other than adding a
> > copy of sqlite3 into the pseudo recipe. Given the static linking
> > doesn't seem to be required any longer due to the separate
> > processes,
> > drop that to fix those issues.
> 
> I don't understand the "separate processes" thing. So far as I know,
> pseudo has never talked to sqlite from the client. I think Jason
> Wessel had experimental patches at one point to do client-local
> sqlite work to avoid the IPC overhead, but I don't think it ever got
> merged because it turns out the IPC overhead is insignificant
> compared to everything else.

If I'm working off incorrect assumptions, is there another reason we
need a static sqlite? I have tested this patch before I posted it and
it seems fine in our test builds...

Cheers,

Richard


