Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id BD8856DEE2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 17:05:08 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id g10so22761439pdj.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 09:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xnnrRp92LQ0kMIRqtDD51XZUsGy+hM0V9/a7fn1HXLM=;
	b=ApVzkrJMnID7ZPJHLDjD9/BgI+8ItTlQ20+pwsOOIH+Z6mErqSXPzXC/ySeabKDpu9
	BwvZZn/5wToOjS3pWXGXueokqUSXlvY2GM5Zqxp1A1E+gKKFVWXmW4zAymj9+Q9zZ4Sn
	gmxEFcV7GQRqUxH8pGkprBFjnvgj7/17DBKc+CY/5+RtBJW0iuzFeAX/HNdglAeqmjm9
	/oNNHdbRszJfVCDg9qQwZ/7QkqbP0Fmo3XxO7aC+sld73I+xWROQW7zvpCtKWOdGE5OG
	s273jSDOS7WK6S8CipDhTkdEP1kUDiLP8IyeqEFKZrFfRT9rt0/UHgCeCp3w4F/qQFkb
	4FyQ==
MIME-Version: 1.0
X-Received: by 10.68.173.132 with SMTP id bk4mr2812967pbc.169.1386176708592;
	Wed, 04 Dec 2013 09:05:08 -0800 (PST)
Received: by 10.68.12.133 with HTTP; Wed, 4 Dec 2013 09:05:08 -0800 (PST)
In-Reply-To: <CAKKsV2yS6dxKV0PVkhx32+TG6+-d2McUkzPxG1+B3tsgm+oqUg@mail.gmail.com>
References: <CAKKsV2wExa=EZ4FWdcXiRJY1B=QnzO3uBTn2s23V9MtNSxOS0Q@mail.gmail.com>
	<CAKKsV2y+ZuaS27QqLtXjcY_qsT1UV01RVtdC=6C_SQpD7nJR5A@mail.gmail.com>
	<CAK6=ix7pDXwnH6+GOB7XmZedt1QnznfTPdUwUxRqVh+didTWSA@mail.gmail.com>
	<5288FF5E.2020309@gmail.com>
	<CAKKsV2xcXo8NwO9jfiXb_D_=UfCYC9N1CSOb28fgaopFRFZ97Q@mail.gmail.com>
	<CAKKsV2yS6dxKV0PVkhx32+TG6+-d2McUkzPxG1+B3tsgm+oqUg@mail.gmail.com>
Date: Wed, 4 Dec 2013 12:05:08 -0500
Message-ID: <CADkTA4OCcbTxiRPgQZDZmUF-ReJ95VeC6H8Z86bmTH5nCaTLeA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Muhammad Tauqir Ahmad <mian.muhammad.tauqir.ahmad@gmail.com>
Cc: Behan Webster <behanw@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 04 Dec 2013 17:05:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 4, 2013 at 11:31 AM, Muhammad Tauqir Ahmad
<mian.muhammad.tauqir.ahmad@gmail.com> wrote:
> Updates:
> - I am able to compile most of the packages using clang except the
> kernel, gcc and a few others. The ones that don't compile are
> mentioned in the README.md in the github repositories listed below.
> - The busybox still doesn't seem to be compiling correctly even with
> the patch (although it does successfully compile) because the
> clang-built busybox causes a kernel panic.
> - elfutils is failing to build with clang despite the few patches that I added.
>
> TODO:
> - Need to add the set of patches to the kernel to compile it using clang.

This is something that I've already queued up, so it'll be taken care
of in time.

Bruce

> - Investigate compiling the failing packages using clang.
> - Investigate busybox runtime failure when built with clang
>
> Any help with any of these TODOs would be helpful.
>
> I am hosting my work on my github account in these two repositories:
>
> https://github.com/mtahmed/poky-clang
> https://github.com/mtahmed/meta-tc-llvm
>
> The first is upstream poky clone with additional patches to allow it
> to compile using clang.
> The second is a secondary toolchain layer that allows llvm to be used
> for the secondary toolchain.
>
> Muhammad Tauqir Ahmad
> --------------------------------------
> Software Developer Intern at WindRiver Systems
> Candidate for Honours Computer Science
> Combinatorics and Optimizations Minor
> University of Waterloo
>
>
> On Mon, Nov 18, 2013 at 8:35 AM, Muhammad Tauqir Ahmad
> <mian.muhammad.tauqir.ahmad@gmail.com> wrote:
>> On Sun, Nov 17, 2013 at 12:39 PM, Behan Webster <behanw@gmail.com> wrote:
>>> On 11/13/13 06:47, Randy MacLeod wrote:
>>>> On Tue, Nov 12, 2013 at 8:47 PM, Muhammad Tauqir Ahmad
>>>> <mian.muhammad.tauqir.ahmad@gmail.com> wrote:
>>>>> According to the link below [1], it seems some works has been done at
>>>>> least for llvm+clang bitbake recipes, although I couldn't find any
>>>>> clang recipes when searching the net. If anyone can point me in the
>>>>> right direction for finding these recipes, that would be great.
>>>>>
>>>>> [1]: http://lists.linuxfoundation.org/pipermail/llvmlinux/2013-March/000205.html
>>>>
>>>> That would be Behan's work, adding him here.
>>>>
>>>> Behan,
>>>> Are your clang recipes from, "Worked on bitbake recipes for LLVM and
>>>> clang" mentioned in the March 2013 llvmlinux notes available?
>>> Khem Raj's work on recipes for llvm and clang were way better than mine,
>>> so I just use his now from meta-oe
>>
>> I only found recipes for llvm in meta-oe. Didn't find any for clang. I
>> am in the process of writing one for clang and will push it to my
>> github once it's clean enough.
>>
>>>
>>>> Everyone,
>>>> Where should Muhammad stage his work and is there an example of using
>>>> an alternative cross-compiler.
>>> Essentially the idea right now is to provide your own do_compile() which
>>> does whatever is necessary to use the other compiler. There may be a
>>> better way to do it, but I haven't found it yet.
>>>
>>
>> Currently I am exploring using the secondary toolchain method
>> (http://www.openembedded.org/wiki/Adding_a_secondary_toolchain) as
>> suggested by fray (Mark Hatle).
>> Initially I will pre-compile a clang cross-compiler and use that as
>> the secondary toolchain and hopefully get as much compiled as possible
>> with the secondary llvm toolchain.
>> Then I can move to using a clang recipe to build the secondary
>> toolchain as well.
>>
>>> Behan
>>>
>>> --
>>> Behan Webster
>>> behanw@gmail.com
>>>
>>
>> Muhammad Tauqir Ahmad
>> --------------------------------------
>> Software Developer Intern at WindRiver Systems
>> Candidate for Honours Computer Science
>> Combinatorics and Optimizations Minor
>> University of Waterloo
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

