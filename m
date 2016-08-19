Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5662B70018
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 14:59:32 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id v123so45736533qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 07:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8UWlR5e7AT2W7yxwIeDOveI4VJOsvuqjleplldFB5mE=;
	b=dZvVRTcqRXXQ45P5bxcpcbTanlBvnr+1DSNMS/X82P14fEuL8E7UKuJgT3tGVdpud9
	0IOKumyKCUBkWG9SdRpbTSsC27vypnTGytxCh/n0bFgNyjm/gBkjsPDHj/twJKyyw7Vd
	qL/yp2NJyRQBt5Hzn2K1sOhhkdNN1zhhfJQ7mbqOIeEexdJrB5QZgK7bjfCUZdmavXem
	Z4C97GMRZ9Hi7GinMcr1JxJURY5Aii+89k9QbrgdNzizXQUqRfTP7BqFpixz6DwUTuNk
	iiGCWarBJ7syOqOt/jpnx76zg2qNXlGQFFWrfUMdBl0+MmGYxEwmVdhXk5DWt4IlQ3nm
	Ir5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8UWlR5e7AT2W7yxwIeDOveI4VJOsvuqjleplldFB5mE=;
	b=A4Nsb2+nTX2gHcZJ8HtnGHePNt2X4balyxlNA0iShjPu+kfImM9G9F8Gds6XLKruU0
	nWnaEZ7Rvph2OQFHSNqQHJxUdfplqyYE/+feLwJ3VjQ/oJBitidXTqqvjlVZjWQazUu6
	ka00Yk2wOWouWqA2777XO8ymds7jkp/mR9kpJ9X8jqxu6cfyo4ub/NAPDqpoFYldFe9b
	8YW1z1mbxONy3wfo3Skz9MyeFtku/g6+l+MYKtHWLATbcPa8vyJGba24d22qy2C5HYpH
	eszm66vbSR3b5GbVVlteM7i2z+2Ot4J6cOkfuLf0jUpJuy6i5mqj7pAeAyb9yTe73u8T
	QuCQ==
X-Gm-Message-State: AEkoousBZW3Y9IJTo5XA2/F02GBfZlsrOvFBoL9NOeQ6jgcm9QRvEflW4hPctYE8FwrT8Gblb0iI7hgrElz+Gg==
X-Received: by 10.233.222.133 with SMTP id s127mr9680417qkf.166.1471618773208; 
	Fri, 19 Aug 2016 07:59:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.215.13 with HTTP; Fri, 19 Aug 2016 07:59:32 -0700 (PDT)
Received: by 10.55.215.13 with HTTP; Fri, 19 Aug 2016 07:59:32 -0700 (PDT)
In-Reply-To: <ce173fb7-93f8-79bb-7aa0-8fa9b4c103d9@mlbassoc.com>
References: <888B09F3-F9A2-49C1-86E8-E33FA1FE6521@gmail.com>
	<1471601644.16712.23.camel@linuxfoundation.org>
	<D00F6189-93E5-47F1-B2CB-E07F1F0C2B50@gmail.com>
	<57474cfd-86fc-be7b-f73f-27c1948dd116@mlbassoc.com>
	<ce173fb7-93f8-79bb-7aa0-8fa9b4c103d9@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2016 07:59:32 -0700
Message-ID: <CAMKF1souM0vyia11_+J7QJrRz6ansi4vZ6cx1teWL78eXtnGFw@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] gcc 6.2 RC1 update
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
X-List-Received-Date: Fri, 19 Aug 2016 14:59:34 -0000
Content-Type: multipart/alternative; boundary=94eb2c0438f838d789053a6df24d

--94eb2c0438f838d789053a6df24d
Content-Type: text/plain; charset=UTF-8

This is a long standing assembler error. Which I never get to bottom of.
Rwboorinf the build machine helps

On Aug 19, 2016 7:06 AM, "Gary Thomas" <gary@mlbassoc.com> wrote:

> On 2016-08-19 16:04, Gary Thomas wrote:
>
>> On 2016-08-19 15:40, Khem Raj wrote:
>>
>>>
>>> On Aug 19, 2016, at 3:14 AM, Richard Purdie <
>>>> richard.purdie@linuxfoundation.org> wrote:
>>>>
>>>> On Tue, 2016-08-16 at 11:55 -0700, Khem Raj wrote:
>>>>
>>>>> Hi All
>>>>>
>>>>> I have put together recipe upgrade for upcoming gcc 6.2 release now
>>>>> that it entered RC phase. With gcc 6.2 the recipes are using tarballs
>>>>> instead of git fetcher as promised :)
>>>>> Please help testing it out in your setups and report any issues you
>>>>> see.
>>>>>
>>>>> The commit you need to cherry-pick for OE-core is this one
>>>>>
>>>>> https://github.com/kraj/openembedded-core/commit/0319b603761a16e65d70
>>>>> 4336112c3709a8bf771c
>>>>>
>>>>> Thank you for your help
>>>>>
>>>>
>>>> I put this through the autobuilder and it passed so I've merged it. I
>>>> did this quickly as we're putting a "pre M3" build through a QA cycle
>>>> and I wanted to get some of the more invasive changes into that build
>>>> so we don't have a stampeding herd of patches breaking everything
>>>> coming up to the final feature freeze for 2.2.
>>>>
>>>> In other news, we are now also testing musl world builds on the
>>>> autobuilder as part of regular testing.
>>>>
>>>
>>> Fantastic !
>>>
>>
>> Problem using this to build meta-fsl-arm:u-boot-fslc for i.MX6:
>>     CC      lib/asm-offsets.s
>>     lib/asm-offsets.c:1:0: error: bad value (armv5) for -march= switch
>>
>> This worked fine with GCC/6.1 (git)
>>
>> Ideas?
>>
>>
> Also, the bitbake "do_compile log" didn't show me this at all,
> I had to get it by running 'bitbake u-boot-fslc -c devshell' and
> then 'make' to see the error :-(
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0438f838d789053a6df24d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">This is a long standing assembler error. Which I never get t=
o bottom of. Rwboorinf the build machine helps</p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Aug 19, 2016 7=
:06 AM, &quot;Gary Thomas&quot; &lt;<a href=3D"mailto:gary@mlbassoc.com">ga=
ry@mlbassoc.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">On 2016-08-19 16:04, Gary Thomas wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 2016-08-19 15:40, Khem Raj wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Aug 19, 2016, at 3:14 AM, Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundatio<=
wbr>n.org</a>&gt; wrote:<br>
<br>
On Tue, 2016-08-16 at 11:55 -0700, Khem Raj wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi All<br>
<br>
I have put together recipe upgrade for upcoming gcc 6.2 release now<br>
that it entered RC phase. With gcc 6.2 the recipes are using tarballs<br>
instead of git fetcher as promised :)<br>
Please help testing it out in your setups and report any issues you<br>
see.<br>
<br>
The commit you need to cherry-pick for OE-core is this one<br>
<br>
<a href=3D"https://github.com/kraj/openembedded-core/commit/0319b603761a16e=
65d70" rel=3D"noreferrer" target=3D"_blank">https://github.com/kraj/openem<=
wbr>bedded-core/commit/0319b603761<wbr>a16e65d70</a><br>
4336112c3709a8bf771c<br>
<br>
Thank you for your help<br>
</blockquote>
<br>
I put this through the autobuilder and it passed so I&#39;ve merged it. I<b=
r>
did this quickly as we&#39;re putting a &quot;pre M3&quot; build through a =
QA cycle<br>
and I wanted to get some of the more invasive changes into that build<br>
so we don&#39;t have a stampeding herd of patches breaking everything<br>
coming up to the final feature freeze for 2.2.<br>
<br>
In other news, we are now also testing musl world builds on the<br>
autobuilder as part of regular testing.<br>
</blockquote>
<br>
Fantastic !<br>
</blockquote>
<br>
Problem using this to build meta-fsl-arm:u-boot-fslc for i.MX6:<br>
=C2=A0 =C2=A0 CC=C2=A0 =C2=A0 =C2=A0 lib/asm-offsets.s<br>
=C2=A0 =C2=A0 lib/asm-offsets.c:1:0: error: bad value (armv5) for -march=3D=
 switch<br>
<br>
This worked fine with GCC/6.1 (git)<br>
<br>
Ideas?<br>
<br>
</blockquote>
<br>
Also, the bitbake &quot;do_compile log&quot; didn&#39;t show me this at all=
,<br>
I had to get it by running &#39;bitbake u-boot-fslc -c devshell&#39; and<br=
>
then &#39;make&#39; to see the error :-(<br>
<br>
-- <br>
------------------------------<wbr>------------------------------<br>
Gary Thomas=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 Consulting for the<br>
MLB Associates=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 Embedded world<br>
------------------------------<wbr>------------------------------<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div></div>

--94eb2c0438f838d789053a6df24d--
