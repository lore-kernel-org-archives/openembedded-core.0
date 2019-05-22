Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 943F87D8EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 11:05:44 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c66so4457833wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 04:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ZfBL+hbgNK7z221D7kkTgtGXi8/k5E0NaQpZn4X1p/k=;
	b=H6sp4gZD0ZCogr54vjQijQb9ggqK+co535LqwPUE60vPCnNk+YjRCU8yXn72is2kv0
	xA31//CuHffkjQQe0MD5kPBILj6dJyXu81KQ4mXlse9FoqR6HqzwkLftRPGgbRZGOdSE
	yOi4EI8xxbfggOXSguYRWEonK2l5TZ1Jsg19M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ZfBL+hbgNK7z221D7kkTgtGXi8/k5E0NaQpZn4X1p/k=;
	b=IRZPAEvnTnabQW4F8qRbvezN3t4Xj9gDTKfOC/wnkiX02t4s7q7d9yTqP+DPETI4wk
	M1n8AoltXFXG95kriKBn1gvtIF11LPITeb8UC8FiygYGVn+bF92Dv2RubmCkixZJ9GgU
	Hz3T1aAvDULcLJSaD1SgWEJj5grbsXefiixeR+F7CvUEH+nFSBFTF79t4sw7iix6NWcw
	ooCcFc5JmcA7XHu1CzIfBDxkiql2ItSZgJ62euC09whTre5vR5uXCJaUHOzPWcWNx8hj
	fmTzx3hSM5+zDOjdOshqeQgVurd7mKFMjWJtPbFYcbJTsfAkmVqxpAIopf0QkU20EaNa
	QMXA==
X-Gm-Message-State: APjAAAVbFwKlq9OMwcCLr62jBmnJNOFf3huH1q04D4b+8zgbBUH3A9Qd
	fG3vHXu5D+vdqkWtVi/gf5w+bA==
X-Google-Smtp-Source: APXvYqzNlK2xwiENbyeA96TZcfTtOePNKVTJGSvixTzEKAJsYyo8M1iAeT4hUkwt0rjH4wbQH2O9tQ==
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr7137310wmc.10.1558523145204; 
	Wed, 22 May 2019 04:05:45 -0700 (PDT)
Received: from hex ([85.255.234.137])
	by smtp.gmail.com with ESMTPSA id n2sm2594037wro.13.2019.05.22.04.05.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 22 May 2019 04:05:44 -0700 (PDT)
Message-ID: <f10bbaa1a0d8ef62f7b7ffd8dfae101b906fafce.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2019 12:05:41 +0100
In-Reply-To: <CAMKF1srz+_Tk5=GNWzBLpNRXoqdCYOmLyNm6XKkFJQFvGcpX=Q@mail.gmail.com>
References: <20190521090032.14859-1-schnitzeltony@gmail.com>
	<20190521090032.14859-2-schnitzeltony@gmail.com>
	<03af571c3019042cff91f2703b15edb139661144.camel@linuxfoundation.org>
	<CALbNGRQjahbkMzBmqFG4QQE4moF-qTFJrDDMzBVUnXBCTwGFMA@mail.gmail.com>
	<b182fad0b95201771a7c01ab2d71aaba73810399.camel@linuxfoundation.org>
	<CALbNGRRcmwVcVD3ytdb32RkmgyFTLJ3dsKiC+iLDK36s1DBwGw@mail.gmail.com>
	<1cee8ee543463712e25b4ea4450fb40242a9e84e.camel@linuxfoundation.org>
	<CAMKF1srz+_Tk5=GNWzBLpNRXoqdCYOmLyNm6XKkFJQFvGcpX=Q@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python-six: put python2/3 variant together
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
X-List-Received-Date: Wed, 22 May 2019 11:05:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-05-21 at 18:49 -0700, Khem Raj wrote:
> On Tue, May 21, 2019 at 2:44 PM <richard.purdie@linuxfoundation.org>
> wrote:
> > On Tue, 2019-05-21 at 22:59 +0200, Andreas Müller wrote:
> > > On Tue, May 21, 2019 at 8:38 PM <
> > > richard.purdie@linuxfoundation.org>
> > > wrote:
> > > > > No sorry mozjs uses old crap in their configurations scripts
> > > > > nobody
> > > > > else does (python which) and ask for python2 explicitly.
> > > > 
> > > > I've been giving this a bit more thought and its our intent to
> > > > try
> > > > and
> > > > remove python2 from OE-Core entirely so adding py2 modules back
> > > > seems
> > > > like a backwards step.
> > > > 
> > > > I think this will therefore need to go to one of the other
> > > > layers,
> > > > painful as that might be from an include perspective.
> > > Yeah a new burden out of thin air is born. You know what I do:
> > > Create
> > > my own layers and am happy as I am with my other layers.
> > > 
> > > Bye
> > 
> > Its not "out of thin air". It was discussed over two years ago when
> > we
> > started a plan of trying to remove python2 dependencies:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=1fc2c9315faf65ea05fecf81450dd40b9a330435
> > 
> > This was in line with what upstream python recommended. Upstream
> > python
> > has made a clear statement on this too:
> > 
> > https://python3statement.org/
> > 
> > For a release that will ship 3 months before that deadline, it
> > seems
> > unreasonable to add this back to oe-core, no?
> > 
> 
> the EOL is expected to be Jan 2020, lets see what happens but I think
> it would be good for us
> to first switch default python to be python3 and then remove python2
> completely IMO, I do not
> see any major distro planning to drop py2 at the stroke of it going
> EOL as of now, situation might
> change in coming months but many of them haven't even switched
> defaults.

I don't think we need to switch our default, just be able to build say
oe-core without python/python2 in HOSTTOOLS and without needing python
2.7 in OE-Core either. 

> Its good that project is taking lead here but we might leave many
> users behind.

I suspect python2 will end up in a layer of its down which I'm fine
with, dependencies can then be clearly seen.

Cheers,

Richard


