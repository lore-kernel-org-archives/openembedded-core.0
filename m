Return-Path: <rwmacleod@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 918476D868
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:47:52 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id fb10so911325wid.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 06:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Jb0y5inVg/47e5vcJy51UaR67msSIWwiEZ0JVNqIepA=;
	b=dpt9BEtOsVLzqakmRe+MBYts6IB/VOKlD4LhHgf3sDTwwLjgRQdRGFJ32wntquVNJF
	c8Sc6Kh1IND0VPAX6+ugJNTEkEYD1KhyEZfcDHyMYLjjs9DWpm2nZJOZYb86Ewaaw0yP
	je+cwXX3F6UkZanUUhKMYKM1osRuNMIyx1W0kyfFHtCR3IsItEvZAgk/lcWaGtN05FpV
	tzcIev3/SKOYsh6bSjlyuBae2/PF/tWi3Z2N3XR3+vVRC+82jh0zbtCX5BR0b4l0KcIy
	UCjGRnjentuukkNspXWOno0y+gfhMu8h64OWGzi0+n/Is8rfjp3Ncv/3ZkkB7pZauqIJ
	CcCA==
MIME-Version: 1.0
X-Received: by 10.180.185.10 with SMTP id ey10mr21051004wic.29.1384354073506; 
	Wed, 13 Nov 2013 06:47:53 -0800 (PST)
Received: by 10.194.28.195 with HTTP; Wed, 13 Nov 2013 06:47:53 -0800 (PST)
In-Reply-To: <CAKKsV2y+ZuaS27QqLtXjcY_qsT1UV01RVtdC=6C_SQpD7nJR5A@mail.gmail.com>
References: <CAKKsV2wExa=EZ4FWdcXiRJY1B=QnzO3uBTn2s23V9MtNSxOS0Q@mail.gmail.com>
	<CAKKsV2y+ZuaS27QqLtXjcY_qsT1UV01RVtdC=6C_SQpD7nJR5A@mail.gmail.com>
Date: Wed, 13 Nov 2013 09:47:53 -0500
Message-ID: <CAK6=ix7pDXwnH6+GOB7XmZedt1QnznfTPdUwUxRqVh+didTWSA@mail.gmail.com>
From: Randy MacLeod <rwmacleod@gmail.com>
To: Muhammad Tauqir Ahmad <mian.muhammad.tauqir.ahmad@gmail.com>,
	Behan Webster <behanw@gmail.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 13 Nov 2013 14:47:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 12, 2013 at 8:47 PM, Muhammad Tauqir Ahmad
<mian.muhammad.tauqir.ahmad@gmail.com> wrote:
> According to the link below [1], it seems some works has been done at
> least for llvm+clang bitbake recipes, although I couldn't find any
> clang recipes when searching the net. If anyone can point me in the
> right direction for finding these recipes, that would be great.
>
> [1]: http://lists.linuxfoundation.org/pipermail/llvmlinux/2013-March/000205.html


That would be Behan's work, adding him here.

Behan,
Are your clang recipes from, "Worked on bitbake recipes for LLVM and
clang" mentioned in the March 2013 llvmlinux notes available?

Everyone,
Where should Muhammad stage his work and is there an example of using
an alternative cross-compiler.

../Randy


>
> Muhammad Tauqir Ahmad
> --------------------------------------
> Software Developer Intern at WindRiver Systems
> Candidate for Honours Computer Science
> Combinatorics and Optimizations Minor
> University of Waterloo
>
>
> On Tue, Nov 12, 2013 at 8:40 PM, Muhammad Tauqir Ahmad
> <mian.muhammad.tauqir.ahmad@gmail.com> wrote:
>> Hi,
>>
>> I am trying to explore the possibility of using LLVM+Clang for
>> building OE-core images.
>> The first objective might be to try to build (poky-tiny's)
>> core-image-minimal? That is the smallest image we know of so maybe
>> that's a good starting point?
>>
>> Right now, I am looking at how to build LLVM+Clang cross-compiler
>> using bitbake and am trying to adapt the llvm3.3 recipe from meta-oe.
>> As far as I can tell, it doesn't build any tools (doesn't build Clang)
>> so I am looking at how to modify it to build Clang as well or maybe
>> just write a new recipe for clang3.3.
>>
>> The email is meant as an RFC. I would appreciate any pointers and help
>> I could get with this.
>> I would also be interested in finding out if and how much work has
>> been done to try to use LLVM+Clang for OE in the past. If, e.g.,
>> someone already has the bitbake recipes to get me started and getting
>> some basic userspace packages to build with LLVM+Clang, it would be
>> really helpful and avoid duplicate work.
>> If someone is already working on this, I could work with them.
>>
>> Any other general or specific comments would also be helpful.
>>
>> Thanks.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
../Randy/..

