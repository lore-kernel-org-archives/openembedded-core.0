Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2297D7FC21
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 11:05:59 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id d73so3314576wmd.1
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 03:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=J1J1lJWOYIR0+4z+ag+MyxkDtEEGR40c7Dp3O9VRW/o=;
	b=OZSyWcPuVMtPs4Tg+NQLG3Y6HbTIDc/b+4EC61kvb3L7RT4p4LETVJzKci2BkXFBAN
	1yCJBj1Y5r+bBgv4JvfOWirf3kRKYjlVJRlDhYAzlPLvHhi42hRXpvb7frLABdVR/5KW
	pFJS/ABP7SGcgKqzMO0103xZggpJrrZyEJMZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=J1J1lJWOYIR0+4z+ag+MyxkDtEEGR40c7Dp3O9VRW/o=;
	b=aCgBE+DCH4x4axqVr9QZd6r8oiEHAJYAYhL7tzz5CpiJ0nTx9Uf3gIuyU4dRtO7AJk
	n1ord2vGOMpfNtDxHdtr2F7U/pO9DYEChWMapsxEgEDNC7eTn5VfUpU5aVjlsxbjyYg8
	Lv8VamZHh9y9BROS1Lvb1sd8CM6w3t2Xm88JBsrZ6W6KhFyoMF0WDiQSGgY1qB/gqvvF
	L4D4zallYQ7G1wx+cg+STsN7kkTOqf4F4vHJsZDeng1D7smvH6ZeWGrXF3qFULa/D/UM
	fAJ46gACRPNZ1AUcpeEG2VEIJXsNtAutEYP9ziVPb17vGVJoWWvM3fO1SIingiVsAf43
	A76g==
X-Gm-Message-State: APjAAAXDIGfbIXwole5SHaf9eBQdnaqvbDprNJMuFxemAtntNl0bNYbX
	9UzWAEzhpp+vSSZZKcIOycefhg==
X-Google-Smtp-Source: APXvYqxhc2R0kwRuq0Xt6unhH1hCOWo3RQ7AhrH7873O9qqs6NHk4nOZXF2L57+WLX5lYDf/X2sbQg==
X-Received: by 2002:a05:600c:214f:: with SMTP id
	v15mr2977107wml.110.1576062360696; 
	Wed, 11 Dec 2019 03:06:00 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f1sm1874348wml.11.2019.12.11.03.05.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Dec 2019 03:05:59 -0800 (PST)
Message-ID: <1df3964a46e8e91cb702ec16f732abad0f019302.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>, 
	"bitbake-devel@lists.openembedded.org"
	<bitbake-devel@lists.openembedded.org>
Date: Wed, 11 Dec 2019 11:05:58 +0000
In-Reply-To: <CY4PR12MB16537AC33CB9D19F94A126458B5A0@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <CY4PR12MB16537AC33CB9D19F94A126458B5A0@CY4PR12MB1653.namprd12.prod.outlook.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [bitbake-devel] hashequiv, pseudo, and GIDs
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
X-List-Received-Date: Wed, 11 Dec 2019 11:06:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 2019-12-11 at 01:51 +0000, chris.laplante--- via bitbake-devel
wrote:
> I'm encountering a failure like below when using hashequiv. What is
> happening is recipe "A" is installing some files in do_install, and
> changing the group of those files. The group is defined by a
> different recipe ("B"). There is no dependency between A and B, so
> when A:do_package runs, the group is not present in A's pseudo
> database. OEOuthashBasic tries to lookup the owning group name of the
> file, and a KeyError is raised.

This doesn't make sense to me. How can a chgrp in recipe A succeed if
the group isn't known to recipe A?

(maybe I know, see below)

> A workaround is to add:
>     DEPENDS += "B"
> to recipe A, so that the group ends up in A's pseudo database. This
> works, but seems really really hacky, since it's only necessary when
> hashequiv is active.

I suspect this isn't a hack, but necessary and you're finding a
determinism/missing dependency issue that hashequiv is highlighting?

> So why is the group name used in the hash, as opposed to the GID? (I
> also have the same question regarding user name vs UID). If the GID
> was used we wouldn't have this issue.

The only way I can think this might work is that you're statically
assigning GIDs and using the GID directly in do_install? That isn't the
way the defaults are setup.

If that is the case we probably have to detect it and change the
behaviour of hashequiv's comparison function to use UID/GID but it does
depend on the wider system setup.

Cheers,

Richard


