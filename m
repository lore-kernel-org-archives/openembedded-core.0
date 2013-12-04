Return-Path: <mian.muhammad.tauqir.ahmad@gmail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 297406DF3E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 16:31:41 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id lc6so11815238vcb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 08:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=o73idlfEVY9m3ovI0DMIhAgJCzRXSqs7jJzZHJmAb1s=;
	b=ahFkKjitXAUF1b2dHQSfdQsjlaZKEKsNUvy4wu5lh3S1SJCGZOgKE1lx38byDgZSYZ
	ijvahsM8g/YaBLDG8TFyS0NYxq35paOwV5QD9KecZCyIGe2Py4FF0ki4eggNQVwfqTun
	YP0FVSkcAseAjChfJbEeYzxuoMbkWln/ki3qYzMQPbkzal/xSl9gwxM4WUpSyRYNeu9S
	Cfw/dH6qUl5pSlApsMO+sCoSzEYQWyeqTg2k1DjUFzAhGOHbvftpBZ9od972aXnWdS8D
	1svm+fZciiEXkugdWVpqAEfEDzWNhOg/ePMk5zbyhb+UtcqM3pRUfSA8WMhsSQjG69E/
	w+MA==
MIME-Version: 1.0
X-Received: by 10.58.44.72 with SMTP id c8mr1177377vem.37.1386174700271; Wed,
	04 Dec 2013 08:31:40 -0800 (PST)
Received: by 10.52.181.66 with HTTP; Wed, 4 Dec 2013 08:31:40 -0800 (PST)
In-Reply-To: <CAKKsV2xcXo8NwO9jfiXb_D_=UfCYC9N1CSOb28fgaopFRFZ97Q@mail.gmail.com>
References: <CAKKsV2wExa=EZ4FWdcXiRJY1B=QnzO3uBTn2s23V9MtNSxOS0Q@mail.gmail.com>
	<CAKKsV2y+ZuaS27QqLtXjcY_qsT1UV01RVtdC=6C_SQpD7nJR5A@mail.gmail.com>
	<CAK6=ix7pDXwnH6+GOB7XmZedt1QnznfTPdUwUxRqVh+didTWSA@mail.gmail.com>
	<5288FF5E.2020309@gmail.com>
	<CAKKsV2xcXo8NwO9jfiXb_D_=UfCYC9N1CSOb28fgaopFRFZ97Q@mail.gmail.com>
Date: Wed, 4 Dec 2013 11:31:40 -0500
Message-ID: <CAKKsV2yS6dxKV0PVkhx32+TG6+-d2McUkzPxG1+B3tsgm+oqUg@mail.gmail.com>
From: Muhammad Tauqir Ahmad <mian.muhammad.tauqir.ahmad@gmail.com>
To: Behan Webster <behanw@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 04 Dec 2013 16:31:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

Updates:
- I am able to compile most of the packages using clang except the
kernel, gcc and a few others. The ones that don't compile are
mentioned in the README.md in the github repositories listed below.
- The busybox still doesn't seem to be compiling correctly even with
the patch (although it does successfully compile) because the
clang-built busybox causes a kernel panic.
- elfutils is failing to build with clang despite the few patches that I added.

TODO:
- Need to add the set of patches to the kernel to compile it using clang.
- Investigate compiling the failing packages using clang.
- Investigate busybox runtime failure when built with clang

Any help with any of these TODOs would be helpful.

I am hosting my work on my github account in these two repositories:

https://github.com/mtahmed/poky-clang
https://github.com/mtahmed/meta-tc-llvm

The first is upstream poky clone with additional patches to allow it
to compile using clang.
The second is a secondary toolchain layer that allows llvm to be used
for the secondary toolchain.

Muhammad Tauqir Ahmad
--------------------------------------
Software Developer Intern at WindRiver Systems
Candidate for Honours Computer Science
Combinatorics and Optimizations Minor
University of Waterloo


On Mon, Nov 18, 2013 at 8:35 AM, Muhammad Tauqir Ahmad
<mian.muhammad.tauqir.ahmad@gmail.com> wrote:
> On Sun, Nov 17, 2013 at 12:39 PM, Behan Webster <behanw@gmail.com> wrote:
>> On 11/13/13 06:47, Randy MacLeod wrote:
>>> On Tue, Nov 12, 2013 at 8:47 PM, Muhammad Tauqir Ahmad
>>> <mian.muhammad.tauqir.ahmad@gmail.com> wrote:
>>>> According to the link below [1], it seems some works has been done at
>>>> least for llvm+clang bitbake recipes, although I couldn't find any
>>>> clang recipes when searching the net. If anyone can point me in the
>>>> right direction for finding these recipes, that would be great.
>>>>
>>>> [1]: http://lists.linuxfoundation.org/pipermail/llvmlinux/2013-March/000205.html
>>>
>>> That would be Behan's work, adding him here.
>>>
>>> Behan,
>>> Are your clang recipes from, "Worked on bitbake recipes for LLVM and
>>> clang" mentioned in the March 2013 llvmlinux notes available?
>> Khem Raj's work on recipes for llvm and clang were way better than mine,
>> so I just use his now from meta-oe
>
> I only found recipes for llvm in meta-oe. Didn't find any for clang. I
> am in the process of writing one for clang and will push it to my
> github once it's clean enough.
>
>>
>>> Everyone,
>>> Where should Muhammad stage his work and is there an example of using
>>> an alternative cross-compiler.
>> Essentially the idea right now is to provide your own do_compile() which
>> does whatever is necessary to use the other compiler. There may be a
>> better way to do it, but I haven't found it yet.
>>
>
> Currently I am exploring using the secondary toolchain method
> (http://www.openembedded.org/wiki/Adding_a_secondary_toolchain) as
> suggested by fray (Mark Hatle).
> Initially I will pre-compile a clang cross-compiler and use that as
> the secondary toolchain and hopefully get as much compiled as possible
> with the secondary llvm toolchain.
> Then I can move to using a clang recipe to build the secondary
> toolchain as well.
>
>> Behan
>>
>> --
>> Behan Webster
>> behanw@gmail.com
>>
>
> Muhammad Tauqir Ahmad
> --------------------------------------
> Software Developer Intern at WindRiver Systems
> Candidate for Honours Computer Science
> Combinatorics and Optimizations Minor
> University of Waterloo

