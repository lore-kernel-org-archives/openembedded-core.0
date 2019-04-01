Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
	[209.85.167.173])
	by mail.openembedded.org (Postfix) with ESMTP id E9EAD7D01A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 16:21:18 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id a6so4391880oie.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 09:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sUEdkE7K+27kAXV40gvA3aF5Gn+8jxRZNvx4QVznbyg=;
	b=TVWIXM2MtIPWjrQ2cpAPO9t3JtkehLLdJxUdHkGXDQ+jrolI3EOMGSbVPhXu0G7UFr
	YZkxti74RVt6FZasIiJFfpPqfMBb4wI+ynhO+op7aSxQBTNrG2x14rer6mmU+0/qYunT
	3zSpihhSoIjB0ZqpaDJjHBK35NEm1HnkSgQsL+Ne963Qokyj6rrE4YyN6fx5fJ3TQ/u2
	1GoK9uBFTDaxICZpYwxLHwjIbqbQOogDrOlOyo3K+3bB2NtHc8djYUX//qn+lsfFpFrd
	G8YSuE9bWwQVPQbpSh03OsPdftBrVpBHuJr2dZ0lFG9IQtPupBXQO7nz2MdD6opaJew2
	muvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sUEdkE7K+27kAXV40gvA3aF5Gn+8jxRZNvx4QVznbyg=;
	b=j2oO6wHVbvmc8AZSM/lkluwoaCFA5nx+IHjjbzkE9L/CRq174fo8Ct9zAk+RNwPdrj
	/nJz8VBdnCvhkl4fla8BawvEzUBD5dNIjAzm5NJ2rg72LWtxQsNpOjdyZBeQeVt6at3G
	9C7JoWS8LHArxdcJO0ftcU7kOT10B3Kolo4AjuF+mybzPFcTuYwb1c3euc8i5aZEyW1X
	M22vhK+PBsM9FPVkhp9NSybBntVZWXb13Ts2nrfMSs+4ByKWqgMDaETxMh9T8FAt1HKP
	MGJgNsd6V6zIXJip3RREl8ZzlXeeQ5b3l1u5akmWmrp7doftCNOjaanN51znChWWeUUQ
	DCDw==
X-Gm-Message-State: APjAAAXqSlkm2dEZyq13/nX2Rik8u2yJRTPUDDPogZL4ZE6QRN6DIkAC
	PBRhqARlYgCV4c5hlxgnxCQIExwVvQteU/DxqKc=
X-Google-Smtp-Source: APXvYqy91tSMA4yzxmgYkPQIkoyh4aDpWrhTWsJtEU+OBRPwqgPdnx7ob7IfnMIlZU9coJhIuSHU4LlVrdFik3KB9Pk=
X-Received: by 2002:aca:cc86:: with SMTP id
	c128mr12984313oig.119.1554135680037; 
	Mon, 01 Apr 2019 09:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190401160106.22928-1-schnitzeltony@gmail.com>
	<CANNYZj80ZqNn_6i9_Z0_HYJErcKrymQZmpiVGn_B56Jw3c7acw@mail.gmail.com>
In-Reply-To: <CANNYZj80ZqNn_6i9_Z0_HYJErcKrymQZmpiVGn_B56Jw3c7acw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Apr 2019 18:21:09 +0200
Message-ID: <CANNYZj8cJV07jb5k=KxyLpfyR3WTt=EDDe4gVPUaQDc1O=y-Ww@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V2] gobject-introspection: auto-enable/-disable gobject-introspection for meson
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
X-List-Received-Date: Mon, 01 Apr 2019 16:21:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Apr 2019 at 18:10, Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> Thanks, may I also ask that you go over the recipes in oe-core that
> inherit meson, and tweak them to use this option? (there is not a lot,
> and some don't use g-i at all).

The exact list is:

at-spi2-core
libsoup-2.4
gdk-pixbuf
libmodulemd
atk
pango
libdazzle
json-glib
clutter-gtk-1.0.inc

Alex

