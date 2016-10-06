Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9A4776022E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 11:12:22 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 123so2971673wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2016 04:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BnwGtwlEA5oCONorS4Uz9IcTXyNO6laJft2gKjpM0fE=;
	b=gnPTFlBR3UVRznXi8wdpbCvIlP/jJAwVBihazFjSm7EJ9JvFOpdiDP4tOdy9igUMNz
	QEH2U5Vh806SqV81AZJbSHtZL8b+X82YsdHk3gOsBujv1SPyq1dCCH761GbKTCcJU/A4
	kr4ibb+XGSblmFzMfHMY/RMn3XH5AszGvhm8kuJNiKYsRivO+yZSBavGyZdcG+adaxxZ
	D+11gCrGfIhWq8Y7jW7lbAzcpTVvZAFwWUFgJ00Pe6a/UaF1dfq3zNkAvDaZhuYAPdFu
	acnO3EZ7xfsRrPmmsjzyKoYpCEyHQDmsUMFH0fwFs+A3E2z1HQvKjo4MkZnTyMJnBtcA
	nadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BnwGtwlEA5oCONorS4Uz9IcTXyNO6laJft2gKjpM0fE=;
	b=Pk8iBobX7GrgL6T3S00GJXU19w1k8/bRDp0pLXWuzDQJthRz6XQ2w97lqyN6fDT4vc
	2SNqoKOXF8OXllk2mQKXctGRlFFJztuGZfbcsPCLHfVc5qTcyoAYF34RqRncXX8LZjWw
	+wwc6KN0XjFM637bDz63PLGaM6qKg4r0aA6asIkiIXUcMinjWyMO1KCaN/uceAJf5TSj
	1znLq0T6Z+LjDxnKdAedAcrIMx3sJocfymmWu4gWYJG1gDBpyXQzE7ejUS/xFN93R41m
	6fFR9Q+KmWVzUGI0mWlVqN/uIi0tH5ZTGNMMvxE8u5WcKGfMTGUtKkS4/fcdxSIKtYXC
	sdWQ==
X-Gm-Message-State: AA6/9Rl8SAan7cY7QPt5MDpyXkDVzfUDqYD+mXv1kv53Ml814CkAGQM/HKESC9s/dzJikvpvBA1neEGrP8ghKw==
X-Received: by 10.194.83.166 with SMTP id r6mr11773554wjy.186.1475752343744;
	Thu, 06 Oct 2016 04:12:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.159.203 with HTTP; Thu, 6 Oct 2016 04:12:23 -0700 (PDT)
In-Reply-To: <CA+chaQcyvfvyZ8xDYmHMkbhQcTaZWbLheaVSW5so2zPA=UTA-w@mail.gmail.com>
References: <20161006082332.29189-1-Martin.Jansa@gmail.com>
	<1475750706.30475.539.camel@linuxfoundation.org>
	<CA+chaQeh3Y2jYm97R6cWw3OvuQrTqHQn1NMWaUfGjFRQN4okEQ@mail.gmail.com>
	<CA+chaQcyvfvyZ8xDYmHMkbhQcTaZWbLheaVSW5so2zPA=UTA-w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 6 Oct 2016 13:12:23 +0200
Message-ID: <CA+chaQeVPFGamX=E8o6SNTTth5ytm9EdrecFtW1z4NfTRNSiDA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Christophe Chapuis <chris.chapuis@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth][PATCH] binutils: fix AR issue when opkg is unpacking IPKs containing empty entries
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
X-List-Received-Date: Thu, 06 Oct 2016 11:12:23 -0000
Content-Type: multipart/alternative; boundary=047d7bb0402c39b6f2053e305ebd

--047d7bb0402c39b6f2053e305ebd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I see, there is ^M after empty in the actual .patch file, if I read the git
format-patch output it shows ^M, but the git webUI gets confused and shows
^M as normal line feed.

++    if ![string match "empty^M" $got] {

Does it work for you when cherry-picking from the branch.

Here is the same change in binutils git repo:
https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=
=3Dbinutils/testsuite/binutils-all/ar.exp;h=3D45be9b1b594b39624f3e010f50bf9=
8892fb64549;hp=3D508ae9c1d7562c8b0a2c090a93e35acdba733944;hb=3D4fc874242f8f=
1bf17cf6e65b159dd804e793e6cd;hpb=3D23a4bd22c75862fdbaa5faef59b9094ec738f675

It shows '\r' so it isn't there by accident.


On Thu, Oct 6, 2016 at 12:54 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> I see this strange line also in that branch, I'm checking log.do_patch to
> see how it's possible that it did apply to me OK.
>
> On Thu, Oct 6, 2016 at 12:46 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Strange,
>>
>> it's included here:
>> http://git.openembedded.org/openembedded-core-contrib/log/?
>> h=3Djansa/krogoth-backports
>>
>> until next rebase it's this commit SHA:
>> http://git.openembedded.org/openembedded-core-contrib/commit
>> /?h=3Djansa/krogoth-backports&id=3D9d56d74bc2f42cbd6ee6ad1dbddb378a020bb=
e93
>>
>> Thanks for quick reply
>>
>> On Thu, Oct 6, 2016 at 12:45 PM, Richard Purdie <
>> richard.purdie@linuxfoundation.org> wrote:
>>
>>> On Thu, 2016-10-06 at 10:23 +0200, Martin Jansa wrote:
>>> > ++    # This commmand used to fail with: "Malformed archive".
>>> > ++    set got [binutils_run $AR "-t $archive"]
>>> > ++    if ![string match "empty
>>> > " $got] {
>>> > ++    fail $testname
>>> > ++    return
>>> > ++    }
>>> > ++
>>> > ++    pass $testname
>>>
>>> The patch fails to apply due to the above corruption (line not starting
>>> ++). Could you resend or point to a branch with the patch on please?
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>
>>
>

--047d7bb0402c39b6f2053e305ebd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I see, there is ^M after empty in the actual .patch f=
ile, if I read the git format-patch output it shows ^M, but the git webUI g=
ets confused and shows ^M as normal line feed.</div><div><br></div><div>++ =
=C2=A0 =C2=A0if ![string match &quot;empty^M&quot; $got] {</div><div><br></=
div><div>Does it work for you when cherry-picking from the branch.</div><di=
v><br></div><div>Here is the same change in binutils git repo:</div><div><a=
 href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblo=
bdiff;f=3Dbinutils/testsuite/binutils-all/ar.exp;h=3D45be9b1b594b39624f3e01=
0f50bf98892fb64549;hp=3D508ae9c1d7562c8b0a2c090a93e35acdba733944;hb=3D4fc87=
4242f8f1bf17cf6e65b159dd804e793e6cd;hpb=3D23a4bd22c75862fdbaa5faef59b9094ec=
738f675">https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblo=
bdiff;f=3Dbinutils/testsuite/binutils-all/ar.exp;h=3D45be9b1b594b39624f3e01=
0f50bf98892fb64549;hp=3D508ae9c1d7562c8b0a2c090a93e35acdba733944;hb=3D4fc87=
4242f8f1bf17cf6e65b159dd804e793e6cd;hpb=3D23a4bd22c75862fdbaa5faef59b9094ec=
738f675</a><br></div><div><br></div><div>It shows &#39;\r&#39; so it isn&#3=
9;t there by accident.</div><div><br></div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Thu, Oct 6, 2016 at 12:54 PM, Martin Jan=
sa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=
=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div dir=3D"ltr">I see this strange line also in that branc=
h, I&#39;m checking log.do_patch to see how it&#39;s possible that it did a=
pply to me OK.</div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Thu, Oct 6, 2016 at 12:46 PM,=
 Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.co=
m" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div dir=3D"ltr">Strange,<div><br></div><div>it&#3=
9;s included here:</div><div><a href=3D"http://git.openembedded.org/openemb=
edded-core-contrib/log/?h=3Djansa/krogoth-backports" target=3D"_blank">http=
://git.openembedded.org/op<wbr>enembedded-core-contrib/log/?<wbr>h=3Djansa/=
krogoth-backports</a><br></div><div><br></div><div>until next rebase it&#39=
;s this commit SHA:</div><div><a href=3D"http://git.openembedded.org/openem=
bedded-core-contrib/commit/?h=3Djansa/krogoth-backports&amp;id=3D9d56d74bc2=
f42cbd6ee6ad1dbddb378a020bbe93" target=3D"_blank">http://git.openembedded.o=
rg/op<wbr>enembedded-core-contrib/commit<wbr>/?h=3Djansa/krogoth-backports&=
amp;<wbr>id=3D9d56d74bc2f42cbd6ee6ad1dbdd<wbr>b378a020bbe93</a><br></div><d=
iv><br></div><div>Thanks for quick reply</div></div><div class=3D"m_-170777=
3460168170744HOEnZb"><div class=3D"m_-1707773460168170744h5"><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Oct 6, 2016 at 12:45 PM=
, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundatio<wbr>n.org=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On Thu, 2016=
-10-06 at 10:23 +0200, Martin Jansa wrote:<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0# This commmand used to fail with: &quot;Mal=
formed archive&quot;.<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0set got [binutils_run $AR &quot;-t $archive&=
quot;]<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0if ![string match &quot;empty<br>
&gt; &quot; $got] {<br>
&gt; ++=C2=A0 =C2=A0 fail $testname<br>
&gt; ++=C2=A0 =C2=A0 return<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0pass $testname<br>
<br>
</span>The patch fails to apply due to the above corruption (line not start=
ing<br>
++). Could you resend or point to a branch with the patch on please?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--047d7bb0402c39b6f2053e305ebd--
