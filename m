Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9363A6DC16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 13:40:36 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id uy5so7176042obc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 05:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mSVrb10niUfU2h9f66WtHecaPZy4YydYYAPJb6Dv50I=;
	b=EFn0O0buhBghfO9B8af7GwzYWIY8RDnWpc6FMrfFtRz4qD2/K85KBrucjrIuLIygtb
	oYh3Vkb8NeKG6f219m5peqKJEnJlLWU/Ds8EoLbFPM7DMQhXEPK8WuEAcnHG3p32ZB2w
	5NW6MYpaRE4wou8Kqar8RAEhTxxUGiyTm4VNn7zPPHvAfTHHeV41u/jGUak1XzxBYOSI
	cPjWh6U1MbiqoS/ZhlZ9IQWUrNYcjZYBRu718fKC+n0Sj+J92Tu93FnNULY/7UktTjZV
	O2Mv/fILRuqVzyvtXFjZ3W1NRGiYXrAps5C3O1R18KXKpsT459xzH/j/sL4M+QcD6rVn
	pvsg==
X-Gm-Message-State: ALoCoQkC5Aiqbc/UOgGyHKerO3b9vKQ3fAGpSs26PGYzFxxMMcouuILV+1uB8x/1ECyD2KjpL5tg
X-Received: by 10.60.123.10 with SMTP id lw10mr21598627oeb.24.1393249237728;
	Mon, 24 Feb 2014 05:40:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Mon, 24 Feb 2014 05:40:16 -0800 (PST)
In-Reply-To: <530B4609.7070307@mlbassoc.com>
References: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
	<CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>
	<CAOMwXhMxcr_EVZx4uVnnpGvcq2MrMchHVUL5ApBdC+4bH7q_Yg@mail.gmail.com>
	<CAP71WjwR9Lrb1QeHPEXLGnPe+vcEnYtgMDoQZW-eNayOMubbKQ@mail.gmail.com>
	<CAOMwXhMz+_KcMzY1Stwi2g8EyFg+8BVajqrrvAX7Xd02qVNG9g@mail.gmail.com>
	<CAP71WjxHc6+9DDGeQsuAc3Cv7qN+bfPgNT-ju01z6pje3Q2qEg@mail.gmail.com>
	<530B4609.7070307@mlbassoc.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 24 Feb 2014 14:40:16 +0100
Message-ID: <CAP71Wjx=6Ux7CWmr4FJcLPyp0xah3jFO=7v6izNi2dfNNcWWYQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Conf notes
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
X-List-Received-Date: Mon, 24 Feb 2014 13:40:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 2:15 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> I just tried this with the latest master and it is only looking in
> the meta-yocto layer even though there is a conf-notes.txt in one of
> my local layers as well.

hmm. i just tried too. i create meta-layer with:

$ find meta-mylayer/
meta-mylayer/
meta-mylayer/conf
meta-mylayer/conf/conf-notes.txt
meta-mylayer/conf/bblayers.conf.sample
meta-mylayer/conf/layer.conf
meta-mylayer/conf/local.conf.sample
meta-mylayer/conf/site.conf.sample

then, if I run

$ TEMPLATECONF=meta-mylayer/conf . oe-init-build-env bbb

It is working fine:

### Shell environment set up for builds. ###

You can now run 'bitbake <target>'

Common targets are:
       my-custom-image

You can also run generated qemu images with a command like 'runqemu qemux86'

I tried with up-to-date poky, e.g.

commit a1faa7df2a0972fa631d3aee98c59f6b0e8eb43c
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Mon Feb 24 12:57:38 2014 +0000

