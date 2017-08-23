Return-Path: <andrei@gherzan.ro>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 355E3782DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 17:19:08 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id f8so2415057wrf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 10:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EXcy/mVxfFglfg/sYo9llKVjjNdtShDnNW4ajxs0GUw=;
	b=EOn7Gac/xL1MmDIY0R5nNdDK+hVxKQafyqeVS6lB9fsaZzPG7Uvp2XvTXD2Vd2ddWC
	GfjU4JiTSAW9I5gOlnV+q9OIovULsCSxydxYIVbS7ro9Q5bQtuJuANnXQ2OAvk4Vghr5
	a44FZqhfo0z6TIJp1YuUODmRaWnFZ6p9CZUXZNEIxqjn6nmVukL5/YHmFoconBCaXjCo
	+p6+UOAFue7VmWm4VeNxWczqmcISaBI382qYwwvADuReO7CFmH9lZ8ZDHgnvH/IrFQ2l
	bIpK/bAUufco9BVkTlR72xuo1rpaQc1FcdRs0RlEBkG9OxgTN/mmyYqC0yz82G+jDVV1
	BUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EXcy/mVxfFglfg/sYo9llKVjjNdtShDnNW4ajxs0GUw=;
	b=BksYKZUbqw6pAC3Wr0kiF/AEQX4AaB9CZwb8DP/SY1xzORM4t0x2PTJpSZZMwxw62t
	7+D7fHOZreeehFI6sq4WQmGAmKXy61p73cNUsx7MSAJgmMuMNOpzV+fhOefBSECcZKuP
	TspZ7Gxx9U5xd8WMbAu9YS00LHB9qKSh2S1GOHs0QD+oA/np8Pw/8DkyH4fml+ndyEbb
	UOZAOEQJ6zYDGs7czsqXYhtHQIEmWMRdtkQkNTN7m1eJH11DxLX/XgFxvuHAMNj2ck4t
	DOeoSr2Gqew2A0SwdEBy5FZEbE+tBr+W8sCgaCCi4p/v26cLSzlCv1A0uHesh0P99Yw5
	ZAog==
X-Gm-Message-State: AHYfb5jSh6u/X2cYPER96fuM6UQg2tWcL1PxZGZWUqdaIO6SDmF2WtnJ
	7yrQFgVs4k5puT+gRjteKMJ8L0E5ZpGg
X-Received: by 10.223.160.75 with SMTP id l11mr1858468wrl.91.1503508748863;
	Wed, 23 Aug 2017 10:19:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.45.195 with HTTP; Wed, 23 Aug 2017 10:18:28 -0700 (PDT)
X-Originating-IP: [82.22.166.118]
In-Reply-To: <CADkTA4M_gm6VA83yTqkd0JqQNA7O_JP5AqtxZEXXY=MWS8=5gA@mail.gmail.com>
References: <CAK18fxG23fiaTMk86hQUYZVbRZApZMtM3StvuM5QefmCEHdw-g@mail.gmail.com>
	<CAK18fxEj3ZLHzBAh5FgEKq8P9=QPr8MNBO6r4fri47nZZCeVbg@mail.gmail.com>
	<9530249c-064a-8489-d8b5-f9687fa5c2a3@windriver.com>
	<CAK18fxF-6W_4vnw10PoSuEhKgER10qO+f25iqLZq0PAkUFdEDQ@mail.gmail.com>
	<CADkTA4M_gm6VA83yTqkd0JqQNA7O_JP5AqtxZEXXY=MWS8=5gA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 23 Aug 2017 18:18:28 +0100
Message-ID: <CAK18fxEV1BYq9v5vYijj6A6hfa6PjQ91TkPO+kD1PcCiKee_WQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: kernel-yocto class requires BSP definition now
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
X-List-Received-Date: Wed, 23 Aug 2017 17:19:08 -0000
Content-Type: multipart/alternative; boundary="94eb2c184f60e49ff705576ee898"

--94eb2c184f60e49ff705576ee898
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 6:08 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Wed, Aug 23, 2017 at 1:01 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
>
>> On Wed, Aug 23, 2017 at 5:54 PM, Bruce Ashfield <
>> bruce.ashfield@windriver.com> wrote:
>>
>>> Already discussed with Khem and Richard in the original
>>> thread.
>>>
>>> I'm sending another patch shortly to back this off to a note/warning.
>>>
>>>
>> That is nice but wouldn't that clutter the build logs for no reason? For
>> people who don't take advantage of scc definitions that is. Could you point
>> me to the initial discussion? Just want to understand and maybe vote to
>> remove it altogether.
>>
>
> It's a yocto bug. We need to flag BSP definitions that aren't valid,
> otherwise the tools
> will end up building things like qemuarm for someone that has a
> misconfigured BSP.
>
> If you don't have a defconfig (as someone won't have if they are using a
> fully defined
> BSP, but with the wrong name) and the wrong entry point, or no entry
> point, is returned
> we have to flag it.
>
> The actual bug is: 11878, and there's a related fallout of that bad
> definition.
>
> So no, it won't be deleted, but I will make it check for a few more
> parameters before
> erroring or logging.
>

That makes sense. Thanks for clarifying. I'll keep an eye on the ml for the
fix.

--
Andrei Gherzan

--94eb2c184f60e49ff705576ee898
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div><div class=3D"gmail_signat=
ure"><div dir=3D"ltr"><div dir=3D"ltr">On Wed, Aug 23, 2017 at 6:08 PM, Bru=
ce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br></di=
v></div></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote"><div><div class=3D"gmail-h5">On Wed, Aug 23, 2017=
 at 1:01 PM, Andrei Gherzan <span dir=3D"ltr">&lt;<a href=3D"mailto:andrei@=
gherzan.ro" target=3D"_blank">andrei@gherzan.ro</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D"gmail-m_10542865=
25283218213gmail-">On Wed, Aug 23, 2017 at 5:54 PM, Bruce Ashfield <span di=
r=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_bl=
ank">bruce.ashfield@windriver.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Already discussed with Khem and Richard i=
n the original<br>
thread.<br>
<br>
I&#39;m sending another patch shortly to back this off to a note/warning.<b=
r>
<br></blockquote><div><br></div></span><div>That is nice but wouldn&#39;t t=
hat clutter the build logs for no reason? For people who don&#39;t take adv=
antage of scc definitions that is. Could you point me to the initial discus=
sion? Just want to understand and maybe vote to remove it altogether.=C2=A0=
</div></div></div></div></blockquote><div><br></div></div></div><div>It&#39=
;s a yocto bug. We need to flag BSP definitions that aren&#39;t valid, othe=
rwise the tools</div><div>will end up building things like qemuarm for some=
one that has a misconfigured BSP.</div><div><br></div><div>If you don&#39;t=
 have a defconfig (as someone won&#39;t have if they are using a fully defi=
ned</div><div>BSP, but with the wrong name) and the wrong entry point, or n=
o entry point, is returned</div><div>we have to flag it.</div><div><br></di=
v><div>The actual bug is: 11878, and there&#39;s a related fallout of that =
bad definition.</div><div><br></div><div>So no, it won&#39;t be deleted, bu=
t I will make it check for a few more parameters before</div><div>erroring =
or logging.</div></div></div></div></blockquote><div><br></div><div>That ma=
kes sense. Thanks for clarifying. I&#39;ll keep an eye on the ml for the fi=
x.</div><div><br></div><div><div>--</div><div>Andrei Gherzan</div></div></d=
iv></div></div>

--94eb2c184f60e49ff705576ee898--
