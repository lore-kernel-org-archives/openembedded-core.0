Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id B8980782DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 17:20:08 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id l132so2550383vke.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 10:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fOMIQ63JKk9TiJ1+GZEDJkxIqR7kzwl/LtAA7xNzVQU=;
	b=XWu/YrESCtVKEd2KxWunWlZFJeeEOIn4g4mXG3HOeAikLqwEZNJUFacdFqFI4tdPsn
	So1mSgHo6ozQjqwU7hAQLucHx1Wcl6gzTv/IHmpiDdJl+UDVp3iq/VC1BIEJaiWTolpq
	Y2BmR4zz3DHoau7js90+s2oVxFQsHkrnE5uO2I78emgK3ni12qyjLFxs0Tdc6aHw3hgS
	jNCQnfEv0GY2GnAlmGl8Pf+jnblqZQuIVMZIFA4sms1WwyB4WLxLZ5+jG6UG5ulJ5lcb
	DRr55Zrs0XDMI1Bm6uL5blDbjT6KOK7DMBUjQrtkxaTYPjXSAylj339aZAv6A6gGmAFA
	v7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fOMIQ63JKk9TiJ1+GZEDJkxIqR7kzwl/LtAA7xNzVQU=;
	b=J4L7iONa22xG4SdEPlLGM8yTMpSpj1TEY+kNl1Czr2P1iJJYf0fudePn9UE92Tb8RH
	p9nUOh0ptF2o08j3xFnbRHs/5rXs2wqsmD2qEw+QktJlMZ7cYaELKXOryro+W7p1W0ev
	Mk2IV5IzAW0U96DxR06bbkZVTh4yzjOfhuDRSJoveXHUewupYJihVE7sHzj3Fe7FHHss
	SJiDidPsDk0MguB1Dj13bJ8YnunQAaE1hl7uMvDN0Zzr+9dHksP67q7N+CiGOOoVF6bD
	qpVyo2kGDtGUGzpEhyRYZYLEpQyasGHbBxmH/yQQ+NCjKEj4MxyzgSlhGa+ewKG8K1lw
	TCuA==
X-Gm-Message-State: AHYfb5hn9CyM/djHoaFSwFaKm6cAHkCRWlLSnDDQYNBDCaD8eU0qp+ei
	SQGfFQSctNpqVabLy+3+HN+DAPpE5Q==
X-Received: by 10.31.203.69 with SMTP id b66mr2306094vkg.144.1503508809942;
	Wed, 23 Aug 2017 10:20:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Wed, 23 Aug 2017 10:20:08 -0700 (PDT)
In-Reply-To: <CAK18fxEV1BYq9v5vYijj6A6hfa6PjQ91TkPO+kD1PcCiKee_WQ@mail.gmail.com>
References: <CAK18fxG23fiaTMk86hQUYZVbRZApZMtM3StvuM5QefmCEHdw-g@mail.gmail.com>
	<CAK18fxEj3ZLHzBAh5FgEKq8P9=QPr8MNBO6r4fri47nZZCeVbg@mail.gmail.com>
	<9530249c-064a-8489-d8b5-f9687fa5c2a3@windriver.com>
	<CAK18fxF-6W_4vnw10PoSuEhKgER10qO+f25iqLZq0PAkUFdEDQ@mail.gmail.com>
	<CADkTA4M_gm6VA83yTqkd0JqQNA7O_JP5AqtxZEXXY=MWS8=5gA@mail.gmail.com>
	<CAK18fxEV1BYq9v5vYijj6A6hfa6PjQ91TkPO+kD1PcCiKee_WQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Aug 2017 13:20:08 -0400
Message-ID: <CADkTA4M2FMEAJHwS5Rp2_hVw_CXs12DMJDbszOO+n=scR9FwZQ@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
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
X-List-Received-Date: Wed, 23 Aug 2017 17:20:08 -0000
Content-Type: multipart/alternative; boundary="001a114dd8f6888c1c05576eec9e"

--001a114dd8f6888c1c05576eec9e
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 1:18 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> On Wed, Aug 23, 2017 at 6:08 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>
>>
>>
>> On Wed, Aug 23, 2017 at 1:01 PM, Andrei Gherzan <andrei@gherzan.ro>
>> wrote:
>>
>>> On Wed, Aug 23, 2017 at 5:54 PM, Bruce Ashfield <
>>> bruce.ashfield@windriver.com> wrote:
>>>
>>>> Already discussed with Khem and Richard in the original
>>>> thread.
>>>>
>>>> I'm sending another patch shortly to back this off to a note/warning.
>>>>
>>>>
>>> That is nice but wouldn't that clutter the build logs for no reason? For
>>> people who don't take advantage of scc definitions that is. Could you point
>>> me to the initial discussion? Just want to understand and maybe vote to
>>> remove it altogether.
>>>
>>
>> It's a yocto bug. We need to flag BSP definitions that aren't valid,
>> otherwise the tools
>> will end up building things like qemuarm for someone that has a
>> misconfigured BSP.
>>
>> If you don't have a defconfig (as someone won't have if they are using a
>> fully defined
>> BSP, but with the wrong name) and the wrong entry point, or no entry
>> point, is returned
>> we have to flag it.
>>
>> The actual bug is: 11878, and there's a related fallout of that bad
>> definition.
>>
>> So no, it won't be deleted, but I will make it check for a few more
>> parameters before
>> erroring or logging.
>>
>
> That makes sense. Thanks for clarifying. I'll keep an eye on the ml for
> the fix.
>

It'll arrive shortly, testing it now.

It shouldn't put anything in your logs during the build now, I'm just
building the rpi3 to
confirm and re-testing a case that I want to fail :D

Bruce


>
> --
> Andrei Gherzan
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114dd8f6888c1c05576eec9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 23, 2017 at 1:18 PM, Andrei Gherzan <span dir=3D"ltr">&lt;<=
a href=3D"mailto:andrei@gherzan.ro" target=3D"_blank">andrei@gherzan.ro</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_extra"><span class=3D""><div><div class=3D"m_-81377632209255=
18123gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr">On Wed, Aug 23, 201=
7 at 6:08 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.=
ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</spa=
n> wrote:<br></div></div></div></div></span><div class=3D"gmail_quote"><spa=
n class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><di=
v class=3D"m_-8137763220925518123gmail-h5">On Wed, Aug 23, 2017 at 1:01 PM,=
 Andrei Gherzan <span dir=3D"ltr">&lt;<a href=3D"mailto:andrei@gherzan.ro" =
target=3D"_blank">andrei@gherzan.ro</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_ex=
tra"><div class=3D"gmail_quote"><span class=3D"m_-8137763220925518123gmail-=
m_1054286525283218213gmail-">On Wed, Aug 23, 2017 at 5:54 PM, Bruce Ashfiel=
d <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" tar=
get=3D"_blank">bruce.ashfield@windriver.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Already discussed with Khem and=
 Richard in the original<br>
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
or logging.</div></div></div></div></blockquote><div><br></div></span><div>=
That makes sense. Thanks for clarifying. I&#39;ll keep an eye on the ml for=
 the fix.</div></div></div></div></blockquote><div><br></div><div>It&#39;ll=
 arrive shortly, testing it now.</div><div><br></div><div>It shouldn&#39;t =
put anything in your logs during the build now, I&#39;m just building the r=
pi3 to</div><div>confirm and re-testing a case that I want to fail :D</div>=
<div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
<div><br></div><div><div>--</div><div>Andrei Gherzan</div></div></div></div=
></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a114dd8f6888c1c05576eec9e--
