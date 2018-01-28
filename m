Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 290927868B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jan 2018 21:15:26 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id 141so29981736wme.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jan 2018 13:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DF1vWq4dIC45IOOqWPH06RG7/Se3mhXPytN9sbFF8L4=;
	b=e2ow5VB58xHDYwouJGa+dDy5RXH2tS3haUCQhqJC0EnPpPCFJlGNe1GWvvJ56IEd8E
	Sj0u5jZqMZP//hWqViAqmONlUhjarTTZWD8m9GBb/OsPSQUFK2CF5d2b5k7VeuZKnIGX
	wzqb0sw5enoVlnTOi8UkNcfhP4JB6Y5sDUby9/zQWnTHy/qn/xsQuWja0EteOchAseb3
	72xQR+0sgB+43J5xAGeW8s6YkPpfzTyUNwEZBxKuaHSDpxkLfDgBWm7U8lvu+uUejMgg
	nLc2CXLdUB3MetrKm62CZGh8uw3VFpcEu1rCVxYp1IuOHDPq5KbfTIoXsGoDWX6u4+Ud
	he/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DF1vWq4dIC45IOOqWPH06RG7/Se3mhXPytN9sbFF8L4=;
	b=IQ2SDKobHq7mvti8rknEU9YobY8oMOnX3h0ZHnPQO8XUTnkvLraTcrH7sj/dpYmOtH
	giJNXMVuAJnTVMyRVLlsSZ1swYuKYg7wk6xAI4EgWanO5ijBERAQNcoXTq+8hH7lv1M1
	qSZY552rYkAaY7c+GNIIppebILDE/PHePNBSGncdHr84GP7NoDRx/gn6hWNzPNe3fW0/
	ncpHLEoXcfBdrPRcWq86x1An65YngVsU0AsR4ZIMPvai4HnNg9oaIOVDM1HwHivRPeg1
	7fuNGhKzIcFqxUlRvIYvl5qxzG6yxf2ZQ1ipAjvJusvrxiIjneDC+c1Tu7unKvFgc18H
	LvKg==
X-Gm-Message-State: AKwxytfS0Fkujf8Z7Io5AatbOMdo9WWlf8JAm4iU/T7A6wA8LxOc4+37
	4seYK9UHCHGmyNNQmGTAb/P+wUXPrLyCiCTO3j4=
X-Google-Smtp-Source: AH8x225o5ErHJNBK/DmdxqZEC64M7EXgz2RSICjPQoRBgOoZcrjobRfq016SaZGCrVncGXeJwoB69DmClyKZOmsTEAI=
X-Received: by 10.80.149.21 with SMTP id u21mr13114984eda.147.1517174127298;
	Sun, 28 Jan 2018 13:15:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.143.131 with HTTP; Sun, 28 Jan 2018 13:15:26 -0800 (PST)
In-Reply-To: <CAEQ58sgDFgf5oedxXm5PDd0L=NMzv-rLw5--YRT7crUOv-Qdyw@mail.gmail.com>
References: <CAEQ58siiwEqY-KuFZDuCxyBOZnA2d-Bo8MFWTF9X_AGMfOxmzw@mail.gmail.com>
	<CAEQ58sjaushTPi=PBy-ttCL9XBtsmHN-p=XjZXA1VW-_4aKZRA@mail.gmail.com>
	<CAEQ58sje+LCZnqDykHQ_gvQoNvgCH5QFCa_k2tGfnCd__Y07Ww@mail.gmail.com>
	<CAEQ58sgADk0b5O_7vv=Y6Ru6zX151e3pPREYY2p6fuXEOuqZ9Q@mail.gmail.com>
	<CAEQ58sh+bBzbOxf+dv90jeAe91Pf4J30=VqT2LuFyZfnjwVoog@mail.gmail.com>
	<CAEQ58sivWmT-mnB=zAZRhzgnQFiV3KP9aNioyKu2k2RvDyjW3A@mail.gmail.com>
	<CAEQ58sjNMVASuDU5GaSKqf3Xp6-UC_8gZZEdM-mtQ_pRFNwR8A@mail.gmail.com>
	<CAEQ58sjBMsMhg4a_TWiKH8Vvo7UaGodtPO1GsXCcU0fxqFSa7A@mail.gmail.com>
	<dc221756-d573-e60a-4f93-8792089ada1c@gmail.com>
	<CAEQ58sgDFgf5oedxXm5PDd0L=NMzv-rLw5--YRT7crUOv-Qdyw@mail.gmail.com>
From: Francesco Giancane <francescogiancane8@gmail.com>
Date: Sun, 28 Jan 2018 22:15:26 +0100
Message-ID: <CAEQ58sjEtXuwx1ki+V7zA+pRHbgkuPB02SF8dnpF14b+QAXzrQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: kernel-devsrc fails to install the rpm package
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
X-List-Received-Date: Sun, 28 Jan 2018 21:15:27 -0000
Content-Type: multipart/alternative; boundary="94eb2c197ec2eb8cea0563dca022"

--94eb2c197ec2eb8cea0563dca022
Content-Type: text/plain; charset="UTF-8"

Hi Khem, hi all,

The build failed even with those patches.

Any suggestion so far?

Francesco Giancane


2018-01-28 3:45 GMT+01:00 Francesco Giancane <francescogiancane8@gmail.com>:

> Hi Khem,
>
> Thank you for your reply.
>
> The commit description is effectively what is happening (or at least,
> partly) in my case.
> I will get back to you as soon as the build with fresh environment
> completes.
>
>
> 2018-01-27 20:34 GMT+01:00 Khem Raj <raj.khem@gmail.com>:
>
>>
>>
>> On 1/27/18 11:28 AM, Francesco Giancane wrote:
>>
>>> Hi guys,
>>>
>>> I am trying to build an image with kernel-devsrc in target and sdk
>>> (teaching purposes, no production here) but when packages are to be
>>> installed, bitbake fails, telling that nothing provides /bin/awk.
>>>
>>> Looking at kernel-devsrc.spec,it seems that the requirement is added,
>>> but following the inheritance chain, there is no trace of this dependency
>>> in recipes.
>>>
>>> Can someone tell me what is happening here?
>>>
>>
>> perhaps you need the fixes in here
>> http://git.openembedded.org/openembedded-core/commit/?id=336
>> 0eadb719f1d3b406e6cf48d99a74fdb2f6c77
>>
>> cherry-pick it to your local rocko branch and see if it helps
>>
>>
>>
>>> I am using rocko and building for raspberry pi3 64 bit. No other layer
>>> is added.
>>>
>>> Thanks,
>>>
>>> Francesco Giancane
>>>
>>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--94eb2c197ec2eb8cea0563dca022
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Khem, hi all,<div><br></div><div>The build failed even =
with those patches.</div><div><br></div><div>Any suggestion so far?</div><d=
iv class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"lt=
r"><div><div dir=3D"ltr">Francesco Giancane</div><div dir=3D"ltr"><br></div=
></div></div></div></div></div></div>
<br><div class=3D"gmail_quote">2018-01-28 3:45 GMT+01:00 Francesco Giancane=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:francescogiancane8@gmail.com" targ=
et=3D"_blank">francescogiancane8@gmail.com</a>&gt;</span>:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div dir=3D"ltr">Hi Khem,<div><br></div><div>Thank you fo=
r your reply.</div><div><br></div><div>The commit description is effectivel=
y what is happening (or at least, partly) in my case.</div><div>I will get =
back to you as soon as the build with fresh environment completes.<div><div=
 class=3D"h5"><br><div class=3D"gmail_extra">
<br><div class=3D"gmail_quote">2018-01-27 20:34 GMT+01:00 Khem Raj <span di=
r=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.k=
hem@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span><br>
<br>
On 1/27/18 11:28 AM, Francesco Giancane wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi guys,<br>
<br>
I am trying to build an image with kernel-devsrc in target and sdk (teachin=
g purposes, no production here) but when packages are to be installed, bitb=
ake fails, telling that nothing provides /bin/awk.<br>
<br>
Looking at kernel-devsrc.spec,it seems that the requirement is added, but f=
ollowing the inheritance chain, there is no trace of this dependency in rec=
ipes.<br>
<br>
Can someone tell me what is happening here?<br>
</blockquote>
<br></span>
perhaps you need the fixes in here<br>
<a href=3D"http://git.openembedded.org/openembedded-core/commit/?id=3D3360e=
adb719f1d3b406e6cf48d99a74fdb2f6c77" rel=3D"noreferrer" target=3D"_blank">h=
ttp://git.openembedded.org/op<wbr>enembedded-core/commit/?id=3D336<wbr>0ead=
b719f1d3b406e6cf48d99a74fd<wbr>b2f6c77</a><br>
<br>
cherry-pick it to your local rocko branch and see if it helps<div class=3D"=
m_7201055491954237174HOEnZb"><div class=3D"m_7201055491954237174h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
I am using rocko and building for raspberry pi3 64 bit. No other layer is a=
dded.<br>
<br>
Thanks,<br>
<br>
Francesco Giancane<br>
<br>
</blockquote></div></div><span class=3D"m_7201055491954237174HOEnZb"><font =
color=3D"#888888">
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div></div></div></div>
</blockquote></div><br></div></div>

--94eb2c197ec2eb8cea0563dca022--
