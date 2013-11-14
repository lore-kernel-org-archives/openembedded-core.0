Return-Path: <mian.muhammad.tauqir.ahmad@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id EA1206D732
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 13:14:05 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id y6so1533976lbh.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 05:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GkWRLluNP+IrTMgLe4D8yothxqy0Qij0x81Jz1rPml8=;
	b=x+8UrpQgafNtV/IK3axrB4Dib6Fy5G882whfQl/+fxS0RqPjhzGTjAVHfAVIEXYZ3a
	OlyCa27TK6JxWdWg5H5hBt6qlzUjHFl3yz6iydLFlLEK3mETxNyCgDzIV77ZYE0xxk5N
	Y4VWsD746THbILdDaTl6ldP7giIQghebC9DUr5ew4VMCWF5yuykmsVC6NwDH3JGdmoKq
	2w4DLJg/UNFX2QEFlQGsW6h7bLvKGIPLmhoD1MkNAmjT4p+nFYf0sDZZ+XzPYwFcYCbG
	8s9yeS0aEdPwDgPvLRNhLTzgRFQ6l5yZm3Tj1Z8/iSFBqO875tB+4o1SXW2jH4NGDnSJ
	kpaQ==
MIME-Version: 1.0
X-Received: by 10.152.25.232 with SMTP id f8mr697318lag.43.1384434847078; Thu,
	14 Nov 2013 05:14:07 -0800 (PST)
Received: by 10.112.89.170 with HTTP; Thu, 14 Nov 2013 05:14:07 -0800 (PST)
In-Reply-To: <CAP9ODKqy+pwcnjES=8gmkJYkqodQ=pGEMqGEh81RfhhJsX4Czg@mail.gmail.com>
References: <CAKKsV2wExa=EZ4FWdcXiRJY1B=QnzO3uBTn2s23V9MtNSxOS0Q@mail.gmail.com>
	<CAKKsV2y+ZuaS27QqLtXjcY_qsT1UV01RVtdC=6C_SQpD7nJR5A@mail.gmail.com>
	<CAK6=ix7pDXwnH6+GOB7XmZedt1QnznfTPdUwUxRqVh+didTWSA@mail.gmail.com>
	<CAP9ODKqy+pwcnjES=8gmkJYkqodQ=pGEMqGEh81RfhhJsX4Czg@mail.gmail.com>
Date: Thu, 14 Nov 2013 08:14:07 -0500
Message-ID: <CAKKsV2zN+40bLNciiOChrh3Y-wPy-=56+n1znC0OwSWA_BoQEA@mail.gmail.com>
From: Muhammad Tauqir Ahmad <mian.muhammad.tauqir.ahmad@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Behan Webster <behanw@gmail.com>,
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
X-List-Received-Date: Thu, 14 Nov 2013 13:14:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

I couldn't find any up-to-date poky mirrors on github so I pushed my
own poky "mirror"[1]. Once I clean up my code, I will push it to my
repo.

I am also finally getting clang3.3 cross-compiler to compile using a
bitbake recipe quickly put together from the llvm3.3 recipe from
meta-oe.
The next step I guess would be to try to figure how to use it and for
the builds.
Any pointers/directions/examples with/for that would be helpful
especially if someone has already done some work along those lines.

[1]: https://github.com/mtahmed/poky
Muhammad Tauqir Ahmad
--------------------------------------
Software Developer Intern at WindRiver Systems
Candidate for Honours Computer Science
Combinatorics and Optimizations Minor
University of Waterloo


On Wed, Nov 13, 2013 at 11:01 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Wed, Nov 13, 2013 at 12:47 PM, Randy MacLeod <rwmacleod@gmail.com> wrote:
>> On Tue, Nov 12, 2013 at 8:47 PM, Muhammad Tauqir Ahmad
>> <mian.muhammad.tauqir.ahmad@gmail.com> wrote:
>>> According to the link below [1], it seems some works has been done at
>>> least for llvm+clang bitbake recipes, although I couldn't find any
>>> clang recipes when searching the net. If anyone can point me in the
>>> right direction for finding these recipes, that would be great.
>>>
>>> [1]: http://lists.linuxfoundation.org/pipermail/llvmlinux/2013-March/000205.html
>>
>>
>> That would be Behan's work, adding him here.
>>
>> Behan,
>> Are your clang recipes from, "Worked on bitbake recipes for LLVM and
>> clang" mentioned in the March 2013 llvmlinux notes available?
>>
>> Everyone,
>> Where should Muhammad stage his work and is there an example of using
>> an alternative cross-compiler.
>
> I'd say a github repository for now. This allow for easy forking,
> contribution, provides issue tracking, wiki and so on.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

