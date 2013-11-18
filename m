Return-Path: <mian.muhammad.tauqir.ahmad@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3FCB46B1A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 13:35:55 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id ec20so4952860lab.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 05:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6mvi5XJs17Srr7Y6yu1IGs4e0yzGWvoSN8YC4hr2W9g=;
	b=RceOT1kZ1QtLlvlYQigrAw2ONPG8b1fgN5hB5dFFKs3B3W6j1A6PQoPfQSI/RNNfkb
	Z7RlOa32krspRY+0+DRQtsHjBvrJttfxAH6LvclYGjkHy68Tv1CT7Ao80oiKRnq9Qni6
	YESmJm7cHnH7iLtCOzRvc/9lGu0/XEnql3r9Gd9t36k6CfSmsPjZvaka0odoVfCdHGkU
	5oSuwuS0o9+zYrNZBQ4jCVp3Eoo8iEZeJWvnXDaqCT8ytffPz+KuZB1i5pXSVfYt1Tt4
	oALrP4+ntlmLkDatYLEXqzALuJP0u6PVXQFdWIbQoU7M0o/fIbfcxF5hBbscyWrW6lzd
	VyZA==
MIME-Version: 1.0
X-Received: by 10.112.168.170 with SMTP id zx10mr13726032lbb.0.1384781756297; 
	Mon, 18 Nov 2013 05:35:56 -0800 (PST)
Received: by 10.112.89.170 with HTTP; Mon, 18 Nov 2013 05:35:56 -0800 (PST)
In-Reply-To: <5288FF5E.2020309@gmail.com>
References: <CAKKsV2wExa=EZ4FWdcXiRJY1B=QnzO3uBTn2s23V9MtNSxOS0Q@mail.gmail.com>
	<CAKKsV2y+ZuaS27QqLtXjcY_qsT1UV01RVtdC=6C_SQpD7nJR5A@mail.gmail.com>
	<CAK6=ix7pDXwnH6+GOB7XmZedt1QnznfTPdUwUxRqVh+didTWSA@mail.gmail.com>
	<5288FF5E.2020309@gmail.com>
Date: Mon, 18 Nov 2013 08:35:56 -0500
Message-ID: <CAKKsV2xcXo8NwO9jfiXb_D_=UfCYC9N1CSOb28fgaopFRFZ97Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 18 Nov 2013 13:35:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 17, 2013 at 12:39 PM, Behan Webster <behanw@gmail.com> wrote:
> On 11/13/13 06:47, Randy MacLeod wrote:
>> On Tue, Nov 12, 2013 at 8:47 PM, Muhammad Tauqir Ahmad
>> <mian.muhammad.tauqir.ahmad@gmail.com> wrote:
>>> According to the link below [1], it seems some works has been done at
>>> least for llvm+clang bitbake recipes, although I couldn't find any
>>> clang recipes when searching the net. If anyone can point me in the
>>> right direction for finding these recipes, that would be great.
>>>
>>> [1]: http://lists.linuxfoundation.org/pipermail/llvmlinux/2013-March/000205.html
>>
>> That would be Behan's work, adding him here.
>>
>> Behan,
>> Are your clang recipes from, "Worked on bitbake recipes for LLVM and
>> clang" mentioned in the March 2013 llvmlinux notes available?
> Khem Raj's work on recipes for llvm and clang were way better than mine,
> so I just use his now from meta-oe

I only found recipes for llvm in meta-oe. Didn't find any for clang. I
am in the process of writing one for clang and will push it to my
github once it's clean enough.

>
>> Everyone,
>> Where should Muhammad stage his work and is there an example of using
>> an alternative cross-compiler.
> Essentially the idea right now is to provide your own do_compile() which
> does whatever is necessary to use the other compiler. There may be a
> better way to do it, but I haven't found it yet.
>

Currently I am exploring using the secondary toolchain method
(http://www.openembedded.org/wiki/Adding_a_secondary_toolchain) as
suggested by fray (Mark Hatle).
Initially I will pre-compile a clang cross-compiler and use that as
the secondary toolchain and hopefully get as much compiled as possible
with the secondary llvm toolchain.
Then I can move to using a clang recipe to build the secondary
toolchain as well.

> Behan
>
> --
> Behan Webster
> behanw@gmail.com
>

Muhammad Tauqir Ahmad
--------------------------------------
Software Developer Intern at WindRiver Systems
Candidate for Honours Computer Science
Combinatorics and Optimizations Minor
University of Waterloo

