Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id B1F1B76F56
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 08:39:50 +0000 (UTC)
Received: (qmail 10568 invoked by uid 1003); 10 Oct 2015 08:39:49 -0000
Received: from unknown (HELO ?192.168.0.32?) (philip@opensdr.com@46.7.74.236)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	10 Oct 2015 08:39:49 -0000
To: Logan Buchy <logan.buchy@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <CAH=96PHKBTZ3M1gvgsr8meT67NvB4Hp808jSnBvjMgAG6QqR1g@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <5618CED4.4080905@balister.org>
Date: Sat, 10 Oct 2015 09:39:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAH=96PHKBTZ3M1gvgsr8meT67NvB4Hp808jSnBvjMgAG6QqR1g@mail.gmail.com>
Subject: Re: Question regarding project organization with OE
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
X-List-Received-Date: Sat, 10 Oct 2015 08:39:52 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 10/09/2015 09:47 PM, Logan Buchy wrote:
> Hi,
> 
> It's my first time posting here, I hope I have the right mailing list!
> 
> I've been looking into OE in the last few days as a candidate to replace
> the ageing build scripts in a project I am involved with.  I've been really
> impressed with OE's feature list - it ticks off a lot of boxes for our
> requirements.
> 
> I am still working out some of the workflows though before we go ahead and
> make the switch, I was hoping someone could help me out.

I'm still recovering from ELCE, but a quick read suggest you should read
up on the MACHINE variable and how to use machine specific overrides.

Philip

> 
> The project I am working on consists of several embedded targets.  All
> targets currently run on the same system-on-chip and are built with the
> same toolchain, though this will note be the case in the near future. The
> majority of the project exists as a monolithic application that is built
> with different DEFINEs in order to customize the application's behaviour.
> Each target also has a unique rootfs layout (different init scripts mostly).
> 
> For the sake of clarity, lets call this application 'Foo', and two targets
> 'alpha' and 'beta'.
> 
> I am trying to figure out the best was to setup recipes in order to
> maintain this structure.
> 
> I'm thinking that managing the targets is best left to image-recipes in a
> separate layer.  Essentially adding:
> * recipes-core/images/target-alpha.bb
> * recipes-core/images/target-beta.bb
> 
> Managing the 'Foo' application is currently done with a regular package
> recipe:
> * recipes-core/Foo/foo.bb
> 
> However, I am not sure if the image recipes can dictate how to build Foo,
> the dependent recipe.  Is this possible? Is there an alternative workflow?
> 
> Would it be better if 'targets' were managed as separate distros instead?
> Currently some targets use different kernel versions than others, and all
> targets use different kernel configs.  I haven't yet figured out if this is
> possible to specify from within an image recipe.
> 
> Any help is appreciated!
> 
> Thanks,
> Logan
> 
> 
> 

