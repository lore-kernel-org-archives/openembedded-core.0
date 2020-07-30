Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.1358.1596081486402936977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 20:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06U3v8Av024754
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 29 Jul 2020 20:57:18 -0700
Received: from mt-manjaro (128.224.73.253) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 29 Jul
 2020 20:56:57 -0700
References: <20200729130916.38764-1-matthew.zeng@windriver.com>
 <d05d7357b7199a1e787d7f0510eaeacb46740a0a.camel@linuxfoundation.org>
 <87bljyqvzk.fsf@windriver.com>
 <e7a7ee265ac55cf179980f9deb5579b068e12299.camel@linuxfoundation.org>
 <CAMKF1sqZuL_0GE7uOuJqQTNm9TEazXDAsUZmzSebaAZq0VLzFQ@mail.gmail.com>
 <878sf1r8c9.fsf@windriver.com>
 <CAMKF1sq+MdGJY9A_V7=SDGxk5gAk53pqsWQsOrQYUHc-ozveaQ@mail.gmail.com>
User-agent: mu4e 1.4.10; emacs 27.0.91
From: "Matthew" <matthew.zeng@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Patches and
 discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv2] ltp: remove OOM tests from runtest/mm
In-Reply-To: <CAMKF1sq+MdGJY9A_V7=SDGxk5gAk53pqsWQsOrQYUHc-ozveaQ@mail.gmail.com>
Date: Wed, 29 Jul 2020 23:56:51 -0400
Message-ID: <875za5r6yk.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.73.253]
Content-Type: text/plain


Khem Raj <raj.khem@gmail.com> writes:

> On Wed, Jul 29, 2020 at 8:27 PM Mingde (Matthew) Zeng
> <matthew.zeng@windriver.com> wrote:
>>
>>
>> Khem Raj <raj.khem@gmail.com> writes:
>>
>> > on master-next I am also seeing
>> >
>> > step1b: WARNING: ltp-20200515-r0 do_patch: QA Issue: Patch log
>> > indicates that patches do not apply cleanly. [patch-fuzz]
>> >
>> > I wonder if its related to this as well.
>>
>> My bad.
>>
>> Just a couple days ago ltp master introduced a commit directly effected the line above my change, resulting the diff to look slightly different.
>>
>> I could send a patch on top of this commit, or is it possible to revert this merged commit altogether and I will send a new patch, to keep the git log clean. Whichever preferred by YP.
>>
>
> its not in master yet so please send a v2.

Done.

>
>>
>> Matthew
>>
>> >
>> > On Wed, Jul 29, 2020 at 6:43 AM Richard Purdie
>> > <richard.purdie@linuxfoundation.org> wrote:
>> >>
>> >> On Wed, 2020-07-29 at 09:41 -0400, Mingde (Matthew) Zeng wrote:
>> >> > Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>> >> >
>> >> > > On Wed, 2020-07-29 at 09:09 -0400, Matthew wrote:
>> >> > > > Fixes [YOCTO #13802]
>> >> > >
>> >> > > Thanks, we can reference the bug but I don't think we can yet claim
>> >> > > it
>> >> > > fixes it.
>> >> >
>> >> > Sure, would something like the following work?
>> >> >
>> >> > Reference [YOCTO #13802]
>> >>
>> >> Simply "[YOCTO #13802]" is fine (I'll tweak the commit message as I
>> >> merge).
>> >>
>> >> > > The missing log issue happened again:
>> >> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/908
>> >> > > so I think there are multiple issues at play here.
>> >> >
>> >> > Can you attach this build's log.do_testimage so I can have a further
>> >> > look?
>> >>
>> >> Sorry, that build directory has been reused in this case :( Next time
>> >> that happens I'll try and spot/grab it.
>> >>
>> >> > > Is there any way to have the logging logged to disk straight away
>> >> > > rather than stuck internally in oeqa's logging buffers? That way we
>> >> > > could see which tests had run before a hang?
>> >> > >
>> >> > > Also, could we make the scp failure non-fatal, maybe a warning so
>> >> > > that
>> >> > > when it fails we can look at the rest of the logs?
>> >> >
>> >> > I'll further investigate this idea.
>> >>
>> >> Thanks!
>> >>
>> >> Cheers,
>> >>
>> >> Richard
>> >>
>> >> 
>>
>>
>> --
>> Mingde (Matthew) Zeng


--
Mingde (Matthew) Zeng
