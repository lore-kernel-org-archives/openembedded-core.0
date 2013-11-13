Return-Path: <mian.muhammad.tauqir.ahmad@gmail.com>
Received: from mail-la0-f67.google.com (mail-la0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 07BC56D726
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 01:47:41 +0000 (UTC)
Received: by mail-la0-f67.google.com with SMTP id ep20so404990lab.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 17:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=g7R79bQKjlV6qxRXxVSunFfzio5QmuJWR1fLpReUiuA=;
	b=nh+9S4yot/Ktu6DseOw9Ztt5qWGPOeYO1trQ8MpUptFGh98t10gz7Y7RZd008PTIGq
	sGZEfamCiNcyV6ru72XiJ6uQlEgP1dy5tHKJ5cQGxa83SEilXqm3EHL2bXZsdNP5cYDB
	3W4e14+FYhcPrz4J/+yEQD4eO8lKZWaVu/0Pq3CLAzbVfBH3fqoMq/TvM+he0zNPNb3Y
	Yy0s3mEA5W11Q7BCpNhMLZBc7oheefj1HxQDc4CK/XgFAt1ho/4clWQKYi4wuOo+bNU2
	MtWs2UMX3S/MF44Mos0KL170X4eT8XyFpPBCZ/r+vfjXB3zKKlm+HfYfXvH5gKvpUedk
	kCDw==
MIME-Version: 1.0
X-Received: by 10.152.6.74 with SMTP id y10mr30023786lay.16.1384307262659;
	Tue, 12 Nov 2013 17:47:42 -0800 (PST)
Received: by 10.112.89.170 with HTTP; Tue, 12 Nov 2013 17:47:42 -0800 (PST)
In-Reply-To: <CAKKsV2wExa=EZ4FWdcXiRJY1B=QnzO3uBTn2s23V9MtNSxOS0Q@mail.gmail.com>
References: <CAKKsV2wExa=EZ4FWdcXiRJY1B=QnzO3uBTn2s23V9MtNSxOS0Q@mail.gmail.com>
Date: Tue, 12 Nov 2013 20:47:42 -0500
Message-ID: <CAKKsV2y+ZuaS27QqLtXjcY_qsT1UV01RVtdC=6C_SQpD7nJR5A@mail.gmail.com>
From: Muhammad Tauqir Ahmad <mian.muhammad.tauqir.ahmad@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: Exploring LLVM/Clang for OE
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
X-List-Received-Date: Wed, 13 Nov 2013 01:47:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

According to the link below [1], it seems some works has been done at
least for llvm+clang bitbake recipes, although I couldn't find any
clang recipes when searching the net. If anyone can point me in the
right direction for finding these recipes, that would be great.

[1]: http://lists.linuxfoundation.org/pipermail/llvmlinux/2013-March/000205.html

Muhammad Tauqir Ahmad
--------------------------------------
Software Developer Intern at WindRiver Systems
Candidate for Honours Computer Science
Combinatorics and Optimizations Minor
University of Waterloo


On Tue, Nov 12, 2013 at 8:40 PM, Muhammad Tauqir Ahmad
<mian.muhammad.tauqir.ahmad@gmail.com> wrote:
> Hi,
>
> I am trying to explore the possibility of using LLVM+Clang for
> building OE-core images.
> The first objective might be to try to build (poky-tiny's)
> core-image-minimal? That is the smallest image we know of so maybe
> that's a good starting point?
>
> Right now, I am looking at how to build LLVM+Clang cross-compiler
> using bitbake and am trying to adapt the llvm3.3 recipe from meta-oe.
> As far as I can tell, it doesn't build any tools (doesn't build Clang)
> so I am looking at how to modify it to build Clang as well or maybe
> just write a new recipe for clang3.3.
>
> The email is meant as an RFC. I would appreciate any pointers and help
> I could get with this.
> I would also be interested in finding out if and how much work has
> been done to try to use LLVM+Clang for OE in the past. If, e.g.,
> someone already has the bitbake recipes to get me started and getting
> some basic userspace packages to build with LLVM+Clang, it would be
> really helpful and avoid duplicate work.
> If someone is already working on this, I could work with them.
>
> Any other general or specific comments would also be helpful.
>
> Thanks.

