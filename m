Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 59B5165CFC;
	Mon, 21 Apr 2014 18:40:22 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id ij19so1385091vcb.38
	for <multiple recipients>; Mon, 21 Apr 2014 11:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZaMQ9t5ClBMw4D6+a5Qc0Jj5X/+p8flG0SuwAq/V+rc=;
	b=ngWNM/lF+kTOzVgG5cqvTDqM9N+fWb7wNdO6V3siNgxYW6p9NQTtI5+D4wzcQIlETt
	A2lEmg+y+69dBODX50FhmsLQMaOamjAeWbpv+FUHzMi4QVQqxkfWYfOy4/Vy07E8ZLJH
	0V6HiUZF7GdrUKe812/3r8Q0MCyOBh2N9pKmEScxn9PXKOSy6bKa9yTVEjdpnClAxCG6
	WVBbIJjv0REx+ei+S1fuHbap0NmZ8V4Mz11G4wdVp8CVYw2kE8mRCjWGvbSAxmAZu8Vq
	WU0/03c33nXKe6s+wM/7zBjovm8MOE5x0c556pP4oCVJGds+SF0/qvVz3y7Ea3vuQrXU
	Y0Iw==
MIME-Version: 1.0
X-Received: by 10.220.69.72 with SMTP id y8mr4511493vci.21.1398105623647; Mon,
	21 Apr 2014 11:40:23 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Mon, 21 Apr 2014 11:40:23 -0700 (PDT)
In-Reply-To: <20140421153432.GF2486@jama>
References: <20140421153432.GF2486@jama>
Date: Mon, 21 Apr 2014 20:40:23 +0200
Message-ID: <CALbNGRR35DOKew=DA9fYfzrNtbs83Jb-ZwCuZm7w=EVJFqTxow@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2014-04-03
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
X-List-Received-Date: Mon, 21 Apr 2014 18:40:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 21, 2014 at 5:34 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> gnome-backgrounds fix is on ML
> mousepad, gd are fixed now, but fix wasn't included in qemuarm build
> iozone3 should be fixed by v2 on ML
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2014-04-21 ==
>
> === common (7) ===
>     * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb, do_compile
Will try to fix this one

Andreas

