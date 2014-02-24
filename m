Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id D1C496DC16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 13:50:24 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 74CA2F811F0; Mon, 24 Feb 2014 06:50:25 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 99304F811E0;
	Mon, 24 Feb 2014 06:50:24 -0700 (MST)
Message-ID: <530B4E28.1070308@mlbassoc.com>
Date: Mon, 24 Feb 2014 06:50:32 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
	<CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>
	<CAOMwXhMxcr_EVZx4uVnnpGvcq2MrMchHVUL5ApBdC+4bH7q_Yg@mail.gmail.com>
	<CAP71WjwR9Lrb1QeHPEXLGnPe+vcEnYtgMDoQZW-eNayOMubbKQ@mail.gmail.com>
	<CAOMwXhMz+_KcMzY1Stwi2g8EyFg+8BVajqrrvAX7Xd02qVNG9g@mail.gmail.com>
	<CAP71WjxHc6+9DDGeQsuAc3Cv7qN+bfPgNT-ju01z6pje3Q2qEg@mail.gmail.com>
	<530B4609.7070307@mlbassoc.com>
	<CAP71Wjx=6Ux7CWmr4FJcLPyp0xah3jFO=7v6izNi2dfNNcWWYQ@mail.gmail.com>
In-Reply-To: <CAP71Wjx=6Ux7CWmr4FJcLPyp0xah3jFO=7v6izNi2dfNNcWWYQ@mail.gmail.com>
X-Enigmail-Version: 1.5.2
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
X-List-Received-Date: Mon, 24 Feb 2014 13:50:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2014-02-24 06:40, Nicolas Dechesne wrote:
> On Mon, Feb 24, 2014 at 2:15 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> I just tried this with the latest master and it is only looking in
>> the meta-yocto layer even though there is a conf-notes.txt in one of
>> my local layers as well.
> 
> hmm. i just tried too. i create meta-layer with:
> 
> $ find meta-mylayer/
> meta-mylayer/
> meta-mylayer/conf
> meta-mylayer/conf/conf-notes.txt
> meta-mylayer/conf/bblayers.conf.sample
> meta-mylayer/conf/layer.conf
> meta-mylayer/conf/local.conf.sample
> meta-mylayer/conf/site.conf.sample
> 
> then, if I run
> 
> $ TEMPLATECONF=meta-mylayer/conf . oe-init-build-env bbb
> 
> It is working fine:

Indeed, that does work, but only for the first time of if you specify TEMPLATECONF.

I often have build trees that live for a very long time (think months) and I'll
do something like this:
  TEMPLATECONF=my-layer/conf . ${POKY}/oe-init-build-env <somedir>
then later, e.g. after a reboot of my build host, I do just this:
  . ${POKY}/oe-init-build-env <somedir>
This renews the build setting for that setup just fine, but in this case, I'll
get the default "conf-notes.txt", not my layer specific ones.

> 
> ### Shell environment set up for builds. ###
> 
> You can now run 'bitbake <target>'
> 
> Common targets are:
>        my-custom-image
> 
> You can also run generated qemu images with a command like 'runqemu qemux86'
> 
> I tried with up-to-date poky, e.g.
> 
> commit a1faa7df2a0972fa631d3aee98c59f6b0e8eb43c
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Mon Feb 24 12:57:38 2014 +0000
> 

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

