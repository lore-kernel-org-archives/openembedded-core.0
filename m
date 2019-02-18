Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id F2F297C84E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 18:20:51 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id g1so29754696otj.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 10:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kxg5xBYViM8WP2FPykq4Zb5NdmW+zi24Mhwd6KMimho=;
	b=IW7VtIZU3jQRSR8POAovM28HFU1JbJu8NwtxKuSbOOPgPd2+JXrkpBlQjJhW4BUrm6
	aEveKfItOKeIX7xj8XfWH8d+KvpeesvZKZ783Snfe2oR852SoXB6lT8ys3y3jJHT2j+J
	ZuLR5q0H+QH1aWof64ZUB4a5v7RcVj3unldWRT2hDXBaqV6nz1xIPkewFl7fO416mjyQ
	F9CWeRYiAxFJxTMSNkvOJXYkg8M+qSZELDtvBzQZVfTifayW5Bh1cxTyVItG+DfFzscA
	6sv3ivf62mfZvkNJAj0n1OdB3he8ogDUzR8o6qwgdxDa0xOVkOLciT7hlYBT56YfKXV1
	68IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kxg5xBYViM8WP2FPykq4Zb5NdmW+zi24Mhwd6KMimho=;
	b=ikIvFd0c0yd7Y7FUL8kRQ3FIlah9QpM3Q24I8XmvG3jwNXNlTEJFHl5I1ngw5iWmxU
	7+Mf5dV8mLZvkkLYbF+94xNWCGspQ7RNblwRBr5J/za4ZEw7P27dcRNeVVXIGxMhYx6x
	PIdVzeyOZkAoHQ30anLu17ogwgvf28RGINXdpvSlEQJjNMPKRvDk4C4Io/xENQBUFmxO
	gOuVFpQYG28doLE+7Eagv+0prdIMLOkkQfrfNEq6Zp6WkLFqIf+a2i9GxsZwImh/grYI
	SdkLjsIxshc4yvS4eXh5HWTwqTWDEunrYY6ePFnGlZKdAUe9D8zDhZqh0pShOmeIP7vz
	qYBA==
X-Gm-Message-State: AHQUAuaTmGWpWIHaXmH2VNOOCu4Ar02+oH/Gd4yl+JiPVGUY/eahzsOh
	SaqRvBOgC1GiHCZ+vkM0vdhMqJWTg8ZT3rFjwHQ=
X-Google-Smtp-Source: AHgI3Ib4zaqACdEdbLtouJAwLiyYAcPZ5/R6BfMCmYh8utgUyloQnRTknSDnc/Yqd2nZApp3HG4RrRGhQ2lAeC/6i98=
X-Received: by 2002:aca:bb46:: with SMTP id l67mr71365oif.119.1550514052739;
	Mon, 18 Feb 2019 10:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20190218132948.27668-1-fabio.berton@ossystems.com.br>
	<20190218132948.27668-2-fabio.berton@ossystems.com.br>
	<b44b056e67f02f40a40be9cef5614123b1caf906.camel@linuxfoundation.org>
	<CANNYZj_XPBcXkqEkpkRZNqY6YQZTq0iNOmxa7HJZP77kUUZ_5w@mail.gmail.com>
	<730c5d1fe48cd4ed6063e0434271e3ab97ccd66e.camel@linuxfoundation.org>
In-Reply-To: <730c5d1fe48cd4ed6063e0434271e3ab97ccd66e.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Feb 2019 19:20:41 +0100
Message-ID: <CANNYZj9jUGVhKv3muArOrvrBLkPoWSb0eOSZmbQJ3jDKctkBCA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Mon, 18 Feb 2019 18:20:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Feb 2019 at 19:12, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> That does, I think the patch still needs DRIDRIVERS = "swrast" though?
> The details here should be in the commit message too.

Ah, I forgot one more detail which explains the above: there are two
swrast drivers, one dri-based, another gallium-based. Autotools lets
you build both (not sure which one is installed then), meson forces
you to choose. Thus DRIDRIVERS = "swrast" is only set for _native, as
for _target we get the gallium driver instead.

Alex

