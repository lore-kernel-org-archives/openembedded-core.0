Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0AFFE7552F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 20:43:41 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id b19-v6so3417809qkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 13:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j9g4CDksFsgAhwl4gzbXvPMt5w3ePFTwk+uNRzjJ0oA=;
	b=XOQdSfzEw5qC7FVuUzqJ8/wVYX58Ul/MafFYYcZcBPKcr/garnaN3HcNkArShJWWBh
	COfzE64M5nhJgHk/QEKjoBu99cgmlHM43Mdy8TyWZF7H87ou70YQHRJCK17JgizcQYIV
	HJC5B4VK/Y8w5+mVNO+MqTPLfS9SThhw/RnswB6pYjlZTCG7bXXiCEIIf3k0c2qsT0KA
	xc8u39ZUn2yqHjnwt5I+8qaUWti+7M4EO5wWBpgaGHQYCplXgloOzUtZaWKuWRzKw8wk
	Ng8KrlijezZT/Z+W8AV5b8eY0xT4FL8v/rKRc7aXc/HELmTEVTbl1HhvQShJXW0KJ+7X
	0LPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j9g4CDksFsgAhwl4gzbXvPMt5w3ePFTwk+uNRzjJ0oA=;
	b=aE/fzvqvhVMW7RdP83a+aYcvfhr7aN1M//RmfdjTIjasi1594Ln/kprdLvp+K8c20Y
	CGqpL+4trHEob4vVlvVc89usQJ7rg9i1lcdOLKINWVPr0i6mDhoLWUnDggel7jQOLUNa
	08G/fo2gHlgCFlzo4qhZ9RX6//OT7PvLkXISRxvm3SM2yFy06Rz5qV/oVvr2MP8j7hqB
	ZB+E3I0I5tCHViFq/9WgXXB7k9E5oTPwttkj5XEDTsxbvU9zu4t3zzs33cn8mrmUn4YL
	bH76hU+T7Izq5s9GOqJhWxgf56qSFVZZ08dn5SdVkQC7khgVhDStOrceSTsHoNEDMlfE
	A7hg==
X-Gm-Message-State: APzg51AVGS7ap8aeDgIRdKV9AooU5qrrbBm026TEnWCHfcrcAJtDzQzA
	A8JO9xV/Y8b0FGhv1OAEnRsUe9JVusixamL6nHc=
X-Google-Smtp-Source: ANB0Vda58RikA83i9NeIr27hQkDQlTvVLsZWcX43Jc89xjCpJcGKQmUNBIx0S/fiq5M1nKUB2Jfr5/tOR9e8lNvh5OY=
X-Received: by 2002:a37:b246:: with SMTP id
	b67-v6mr16424544qkf.284.1536093822630; 
	Tue, 04 Sep 2018 13:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
	<CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
	<a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
In-Reply-To: <a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Sep 2018 13:43:16 -0700
Message-ID: <CAMKF1spTfZD2B19zQFH+PhAytChCe1k-05ma2QQ9TCVp3TNrgw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Tue, 04 Sep 2018 20:43:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 4, 2018 at 1:35 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2018-09-04 at 21:12 +0200, Martin Jansa wrote:
> > On Tue, Aug 28, 2018 at 12:23 PM Alexander Kanavin <alex.kanavin@gmai
> > l.com> wrote:
> > > From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> > >
> > > I believe the time has come to do this: openssl 1.0 upstream
> > > support stops at the end
> > > of 2019, and we do not want a situation where a supported YP
> > > release contains an
> > > unsupported version of a critical security component.
> > >
> > > Openssl 1.0 can still be utilized by depending on 'openssl10'
> > > recipe.
> >
> > This still isn't true for most recipes, as long as there is something
> > depending on openssl in the dependency tree, it will
> > cause do_prepare_recipe_sysroot failures like last time
> >
> > ERROR: The file /usr/lib/libssl.so is installed by both openssl10 and
> > openssl, aborting
> > DEBUG: Python function extend_recipe_sysroot finished
> > DEBUG: Python function do_prepare_recipe_sysroot finished
> > ERROR: Function failed: extend_recipe_sysroot
> >
> > From 15 failures caused by openssl-1.1 detected in my builds, just
> > changing DEPENDS from openssl to openssl10 didn't help in any case.
>
> That isn't good news. Do you have an idea of which components are in
> the dependency chains and if any of them are common? It'd also be
> useful to understand which ones are breaking...
>

I pointed this earlier before merge as well
meta-openembedded has 40 odd recipes failing due to openssl 1.1 upgrade

http://errors.yoctoproject.org/Errors/Build/67457/?page=2&limit=50

so obvious fix was to keep them pinned to openssl10 and i created
couple of fixes
to start

https://patchwork.openembedded.org/patch/154517/
https://patchwork.openembedded.org/patch/154516/

and the effects are showing up where sysroot task now starts to fail
for dependent
recipes here

http://errors.yoctoproject.org/Errors/Details/190427/
http://errors.yoctoproject.org/Errors/Details/190433/

in meta-oe certain recipes can be upgraded and we can get openssl 1.1 support
but others like the two examples I cited above do not have openSSL 1.1 port.
so I think we can not live without openSSL 1.0 and OpenSSL 2.0 being able to
co-exist.

