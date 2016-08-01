Return-Path: <morphis@gravedo.de>
Received: from h1108419.serverkompetenz.net (gravedo.de [85.214.79.159])
	by mail.openembedded.org (Postfix) with ESMTP id F2417731D9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 19:14:06 +0000 (UTC)
Received: from [192.168.178.186] (pD9ED69EC.dip0.t-ipconnect.de
	[217.237.105.236])
	by h1108419.serverkompetenz.net (Postfix) with ESMTPSA id 96E24137C11BA;
	Mon,  1 Aug 2016 21:14:06 +0200 (CEST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <7603e18c-345c-ddcf-cd95-14df64b60077@gravedo.de>
	<CADkTA4Ng8BoOou9UiS_dh8+x=Z2_1OJYPiWYkkD2cD3MHk0pxA@mail.gmail.com>
From: Simon Fels <morphis@gravedo.de>
Message-ID: <724fa3d2-1c27-a315-54da-02934bf062f2@gravedo.de>
Date: Mon, 1 Aug 2016 21:14:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Ng8BoOou9UiS_dh8+x=Z2_1OJYPiWYkkD2cD3MHk0pxA@mail.gmail.com>
Cc: Yocto Project Discussion <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Snaps on Yocto/OpenEmbedded
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
X-List-Received-Date: Mon, 01 Aug 2016 19:14:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 01.08.2016 16:06, Bruce Ashfield wrote:
> 
> 
> On Mon, Aug 1, 2016 at 7:32 AM, Simon Fels <morphis@gravedo.de 
> <mailto:morphis@gravedo.de>> wrote:
> 
>     Hey everyone,
> 
>     I've worked on a new layer recently which brings snaps to any
>     Yocto/OpenEmbedded based system.
> 
>     If you have never heard about snaps yet you will find most details at
>     http://snapcraft.io/ but generally snaps are a new packaging format made
>     with security and fast updates in mind and allows applications to be
>     packaged once but run everywhere no matter of the distribution used or a
>     particular device type.
> 
>     The layer is currently named meta-snappy and is available at
>     https://github.com/morphis/meta-snappy
> 
> 
> I had a quick browse this morning, and one question that jumped to mind was
> if the oe-meta-go layer was causing problems for go/go-cross support ? I was
> carrying some go/go-inc changes in meta-virtualization as well, but recent reports
> are that oe-meta-go should work for everything now.
> 
> I'm just asking, since it doesn't make sense for meta-virt or other layers to
> continue to carry go build infrastructure when it could be unified.
When I started to put meta-snappy together I ran into different problems
with oe-meta-go and then reused what you put into meta-virt. I have the
point on my TODO list to check if we can just switch to oe-meta-go
rather than shipping go-cross on our own.

regards,
Simon




