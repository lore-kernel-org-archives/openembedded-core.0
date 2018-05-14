Return-Path: <danismostlikely@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 475F9785E7;
	Mon, 14 May 2018 16:33:41 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id m17-v6so13812164lfj.8;
	Mon, 14 May 2018 09:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ili1vAkvvHr9utQSVlqdneB+I+qskflXOPwy5fGgyfs=;
	b=Y6beqSvdAgzTUHXlzsJ5Qn9sUQ5eQ64RY6ZBV1Y8dY0wIyCRMnITgwDy+pOfERHkZi
	5P128rweRspu4PX4YHHSSA0sdOkcsk4i0DfCDrhtkZKfkkwwf5mM4fKaj/QuilI67mfN
	VeAWC+iMcBondsaS7F998Q5u1jnS7yeNK2L8x4W/3lrK8Wadf9FXOxI3YuLY4XWcCKqU
	8/UCeQ0lVaGIA5hr88o9LcEPtcPIl2yqiwuj733EI68HBc3LsakFZniY7spGuwjLYqvu
	3dV3ZpRfgN6iSMzLJIumMqPnpL3dmebhA8nRYLHoJ8y9ooDoIHClCj85PUK88y1THXJJ
	yXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ili1vAkvvHr9utQSVlqdneB+I+qskflXOPwy5fGgyfs=;
	b=No9XtCJrLNBdH+ivd7DxFwLWGuy9L5gY3E+6xQG9JroCjaZq+p/XatyNgzDcW5REoF
	uj6zYSDyM+VafbDQkvprw9GZgTTaqQ8tT48a+jCj7U5NS0z2QalutHXyX24zkq8F9KWi
	MM2h7iW2TPYo7CGRJZRyqF1Ry/MrdC7Nk1cJbE7kOA9RDtSBR09/kZG8TWyShAf3N5sY
	j5iGNT6Dj2OURibbcgu9tJaL8iJj4PBzhYf6PLJTWBNA2byBNsQqw+Xj4gfscqLCae5G
	Bem1lAO7TYHl57UfmUog/DuMFaf/uyit18S7nPWBmZm1vjtjug4QrMdpiUS/FItmC623
	JDJw==
X-Gm-Message-State: ALKqPwcx+A5uDnLuJcvLLrvsV4TfXwHW9xZqsbAVdk4uRk1Zzkdh06dh
	1qZOeeuTtxdsWjEzQZgnMDxGtcPSv58EZf4UwAk=
X-Google-Smtp-Source: AB8JxZrVGNmPbgl1P5CjFoKPK5C9Lt/0kbnJrFZZ2xpF95zCk1hrSd8ovv615UfDQrXA8e2jNeOF7hCCk/EuD3Mfjes=
X-Received: by 2002:a19:d153:: with SMTP id
	i80-v6mr8921004lfg.16.1526315622458; 
	Mon, 14 May 2018 09:33:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:380e:0:0:0:0:0 with HTTP; Mon, 14 May 2018 09:33:41
	-0700 (PDT)
In-Reply-To: <1ceb098b-1836-4693-d03f-8801ac354c25@gmail.com>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CACS+7ZR6F1PgKxQxxh=iJzTQNmrrMVOQ01EuhcnotSAhB=AiEA@mail.gmail.com>
	<1ceb098b-1836-4693-d03f-8801ac354c25@gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Mon, 14 May 2018 10:33:41 -0600
Message-ID: <CACS+7ZRs_zB_c-Wg8K=JEtWyHH7DG-W8ER4Ky1Yg6v1C8xtsyw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Mon, 14 May 2018 16:33:42 -0000
Content-Type: text/plain; charset="UTF-8"

On 10 May 2018 at 12:53, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Dan,
>
> Thanks for testing
>
> On 5/10/18 7:34 AM, Dan McGregor wrote:
>>
>> On 4 May 2018 at 18:26, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> Hi All
>>>
>>> As you might have noticed that gcc 8.1 was released this week, I am
>>> calling out for some testing help on testing branch so we can weed out
>>> issues you might see in your setups. so if you have your
>>> builders idling over weekend, then you know what they can do this weekend
>>> :)
>>>
>>
>> Thanks for this. The only two issues I noticed are that the
>> Wandboard's kernel doesn't compile with gcc 8.1,
>
>
>
> what errors do you see ?

I expect the standard "Linux 4.1" errors. A bunch of ignored
attributes and incompatible type aliases:

tmp-glibc/work-shared/wandboard/kernel-source/include/linux/log2.h:22:1:
warning: ignoring attribute 'noreturn' because it conflicts with
attribute 'const' [-Wattributes]
 int ____ilog2_NaN(void)

tmp-glibc/work-shared/wandboard/kernel-source/include/linux/syscalls.h:195:18:
warning: 'sys_clone' alias between functions of incompatible types
'long int(long unsigned int,  long unsigned int,  int *, int,  int *)'
and 'long int(long int,  long int,  long int,  long int,  long int)'
[-Wattribute-alias]
  asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__)) \

I can give you the full compile log if you'd like, but I think others
want it kept off the list.

>
>  and gcc-sanitizers
>>
>> now throws a packaging error on (at least) x86_64.
>> ${libdir}/liblsan_preinit.o is a new file that should go into
>> liblsan-dev.
>
>
> That seems to be the case, I wonder why my world build for qemux86_64 did
> not find this error. I would like to reproduce this and the fix is then
> simple.

My x86_64 build was multilib enabled. I doubt that had anything to do
with it, but I suppose it's possible.

>
>
>>
>>> Highlighted changes are
>>>
>>> https://gcc.gnu.org/gcc-8/changes.html
>>>
>>> and porting doc is
>>>
>>> https://gcc.gnu.org/gcc-8/porting_to.html
>>>
>>> The branch is here
>>>
>>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-8
>>>
>>> Its uptodate on top of current master oe-core
>>>
>>> May fourth be with you !!
>>>
>>> Cheers!
>>>
>>> -Khem
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

