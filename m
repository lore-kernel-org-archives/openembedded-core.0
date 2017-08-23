Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 227A1601F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 17:08:03 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id s199so2553042vke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 10:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1/CUwWyt/T3SK+R9+TcMymWvJN1hV5xwQljMRSnE1cU=;
	b=GltpcXNR8Ge3B6OCOhdkLYsZroM/6HCGZEOA/Vj/i/KFfd9r0Ef/4uT0VoNmoROcg7
	rs+cHrWtJo9QpAG1p4/eSjzKjIUZlJ2Ut1Nm3zj/0PzIZyTFrEaurlFRbmsMkyKnk6PK
	284RBYshBJ0TFlLpZEbtLas6VBAzPlo0fHFQ6MTdKbKDamoVLlbZbP1GDHbIkHh6dEaL
	FpAFJwUwrRCr32X9khdbDtd0M/aIGw3U72GXgJm+YOL0zpCTH68R8sbahlxXYOVAtXjA
	HDpQL2yRLg4TUz5J1BnmilRCjKCt7H7UEakzDJOyeAHfDi0wT3lFXudyED+QKVPwOqGJ
	yBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1/CUwWyt/T3SK+R9+TcMymWvJN1hV5xwQljMRSnE1cU=;
	b=rxNDHPVNnpYzS/xnfqzDIs7TOb3RYh/WBYQhHdpb/Kao9CUARMvLmVWsC26t54Dv+D
	mjxRfYZRK+Wa31zrBPzToYC/evQdF4njnfwh+dqzKCDD/a0rt547BE1oCluBmk4y3pr9
	ZD1Qa1Pa7/lRmvihmL5TQmaZbWZqeE71MGs740JO9YbR0Y10A5UuKT4BdCFWVBy8q+NU
	3gVUWMs0+sIVmVRLYWWomE9t2xxt6vKuupkkoE/oxbP46zwI0A8yRu3YIjXuiM6n44WW
	wwKfs+vTCPC4f67p7kbhKwUduCE4wlRXAwkng2CWpxKXpO+aCQA8PaRj70Do9oXdXSjy
	mfsQ==
X-Gm-Message-State: AHYfb5jV//8RER7M471roOGYFK2nOPFmcEBX/3YfivXKjpd/g2eu+Dhh
	knmyj/scdtR5GSO2W5D/gXGSeVh03kcC
X-Received: by 10.31.181.85 with SMTP id e82mr2149363vkf.168.1503508084915;
	Wed, 23 Aug 2017 10:08:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Wed, 23 Aug 2017 10:08:04 -0700 (PDT)
In-Reply-To: <CAK18fxF-6W_4vnw10PoSuEhKgER10qO+f25iqLZq0PAkUFdEDQ@mail.gmail.com>
References: <CAK18fxG23fiaTMk86hQUYZVbRZApZMtM3StvuM5QefmCEHdw-g@mail.gmail.com>
	<CAK18fxEj3ZLHzBAh5FgEKq8P9=QPr8MNBO6r4fri47nZZCeVbg@mail.gmail.com>
	<9530249c-064a-8489-d8b5-f9687fa5c2a3@windriver.com>
	<CAK18fxF-6W_4vnw10PoSuEhKgER10qO+f25iqLZq0PAkUFdEDQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Aug 2017 13:08:04 -0400
Message-ID: <CADkTA4M_gm6VA83yTqkd0JqQNA7O_JP5AqtxZEXXY=MWS8=5gA@mail.gmail.com>
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
X-List-Received-Date: Wed, 23 Aug 2017 17:08:04 -0000
Content-Type: multipart/alternative; boundary="001a113d19f251840305576ec10b"

--001a113d19f251840305576ec10b
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 1:01 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> On Wed, Aug 23, 2017 at 5:54 PM, Bruce Ashfield <
> bruce.ashfield@windriver.com> wrote:
>
>> Already discussed with Khem and Richard in the original
>> thread.
>>
>> I'm sending another patch shortly to back this off to a note/warning.
>>
>>
> That is nice but wouldn't that clutter the build logs for no reason? For
> people who don't take advantage of scc definitions that is. Could you point
> me to the initial discussion? Just want to understand and maybe vote to
> remove it altogether.
>

It's a yocto bug. We need to flag BSP definitions that aren't valid,
otherwise the tools
will end up building things like qemuarm for someone that has a
misconfigured BSP.

If you don't have a defconfig (as someone won't have if they are using a
fully defined
BSP, but with the wrong name) and the wrong entry point, or no entry point,
is returned
we have to flag it.

The actual bug is: 11878, and there's a related fallout of that bad
definition.

So no, it won't be deleted, but I will make it check for a few more
parameters before
erroring or logging.

Bruce




-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113d19f251840305576ec10b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 23, 2017 at 1:01 PM, Andrei Gherzan <span dir=3D"ltr">&lt;<=
a href=3D"mailto:andrei@gherzan.ro" target=3D"_blank">andrei@gherzan.ro</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><span c=
lass=3D"gmail-">On Wed, Aug 23, 2017 at 5:54 PM, Bruce Ashfield <span dir=
=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_bla=
nk">bruce.ashfield@windriver.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Already discussed with Khem and Richard in=
 the original<br>
thread.<br>
<br>
I&#39;m sending another patch shortly to back this off to a note/warning.<b=
r>
<br></blockquote><div><br></div></span><div>That is nice but wouldn&#39;t t=
hat clutter the build logs for no reason? For people who don&#39;t take adv=
antage of scc definitions that is. Could you point me to the initial discus=
sion? Just want to understand and maybe vote to remove it altogether.=C2=A0=
</div></div></div></div></blockquote><div><br></div><div>It&#39;s a yocto b=
ug. We need to flag BSP definitions that aren&#39;t valid, otherwise the to=
ols</div><div>will end up building things like qemuarm for someone that has=
 a misconfigured BSP.</div><div><br></div><div>If you don&#39;t have a defc=
onfig (as someone won&#39;t have if they are using a fully defined</div><di=
v>BSP, but with the wrong name) and the wrong entry point, or no entry poin=
t, is returned</div><div>we have to flag it.</div><div><br></div><div>The a=
ctual bug is: 11878, and there&#39;s a related fallout of that bad definiti=
on.</div><div><br></div><div>So no, it won&#39;t be deleted, but I will mak=
e it check for a few more parameters before</div><div>erroring or logging.<=
/div><div><br></div><div>Bruce</div><div>=C2=A0</div></div><br><br clear=3D=
"all"><div><br></div>-- <br><div class=3D"gmail_signature">&quot;Thou shalt=
 not follow the NULL pointer, for chaos and madness await thee at its end&q=
uot;</div>
</div></div>

--001a113d19f251840305576ec10b--
