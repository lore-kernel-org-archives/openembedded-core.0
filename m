Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
	[209.85.217.46])
	by mail.openembedded.org (Postfix) with ESMTP id EB3546073A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 12:42:03 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id a2so2553773vso.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 04:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i0Gxx3sZiR9w6GtcID7iWGY0JGDpAsMFwdrv4uhS3E0=;
	b=rXcpP1dZN5PZsV+lNM1invHCQ/A27CTDAry9WFAo6muPBkvSzs3pbNKUl0FQE+htZZ
	b/IM0E167F5ONgfZY/Y33Gp6aXdNWCnXUFqIGO1yz+ZvJt7Llsaik6vD8x9oVP2Vp0cs
	MUdFe4YFqZAIrZ3BJPcgY6ANUwv6PVx3ga837ck0U3a7Temb2nbqvjTgwwO/MjMJdAn8
	3ol3RFpgnevqO7BZbaXkNN5SpjiqTR5TK0gFz++h1/gsPhUB31wS/8K60MCubOmf/6YN
	talOvAsCxcrBiGz4N9S7Z9v1luqm8YwxY1pljPtmPpa/eiZgMCauu8S2UVYDa9NjPqpN
	A1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i0Gxx3sZiR9w6GtcID7iWGY0JGDpAsMFwdrv4uhS3E0=;
	b=PvYvADdVUBh/B3FyTFDX6wm08JQzH5NleNJsL43Be+M6j352QFWrS8xsHE9LK8FCQv
	R/AnGqKyE+/6rYlOnfG9rRQ9Fy551WBNzIRMQCcd4Qe7PrzjbFPuyYIC8Z8o6bzOMqEO
	JrpxtFGGjeszMCTXvrN5EV3jqS6zvyC06cZbY7LVHFoltZLTXPoO9cAgT7aeKu7i24uC
	fL9rbJjv85khEoFpmlScHFsCUqkNws6Hq9pw0KPs9pXR2eOTkJPw3+cAC0zZnTVHoqr3
	ZYCbEmFyUcFyJV+aheb65VYHUhuLfXJerRgr/y+FR0mFl7OkbbDfSIGA0Udf01QVnBoO
	wGPw==
X-Gm-Message-State: APjAAAUHDCWZcZzjhSXV6nh4T7yCfpKV03mNnLOEznxw+c7g46cR7aa8
	kRsybKjVR4XuEJ4r0zNKEufmNKhAFM0opWoFvug=
X-Google-Smtp-Source: APXvYqwMVeMPvhODEBhbGmsgg9gya310gciofC8r9xzsgchZakO/ijyI95ueLLMCZ9Sc9Ma0tiNYoPJmveQ0HuNx3fw=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr16875756vsq.94.1582202524001; 
	Thu, 20 Feb 2020 04:42:04 -0800 (PST)
MIME-Version: 1.0
References: <20200218132054.20341-1-wallinux@gmail.com>
	<CANNYZj9nm0eqo0NtHhEJiw7nLbnYQ8r1aazXk6mGn83VXc9VNA@mail.gmail.com>
	<CAF2baFdCF-NVmUa=meNhAN5BDBqLcS4k7F+EBWtUA1ekY6OVBg@mail.gmail.com>
	<20200219152720.GM17818@joraj-alpa>
	<143f590b688ed8166a702873275c16f3c7217d52.camel@linuxfoundation.org>
	<20200219155626.GN17818@joraj-alpa>
	<CANNYZj9t2+ugT15XbYrqkgA23MHEQxy_9t=PnutoCQr2f0AA-A@mail.gmail.com>
	<CAF2baFcN_2du6k_p2s_5RsExmkAuVvvJQOaak9GehMBQ=y4m6g@mail.gmail.com>
In-Reply-To: <CAF2baFcN_2du6k_p2s_5RsExmkAuVvvJQOaak9GehMBQ=y4m6g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Feb 2020 13:42:26 +0100
Message-ID: <CANNYZj_=evUsWUH51ZgUhr2vZO5Ybv9izRuidvTKe1NqEKsB=A@mail.gmail.com>
To: Anders Wallin <wallinux@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace2: added 2.0.1
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
X-List-Received-Date: Thu, 20 Feb 2020 12:42:04 -0000
Content-Type: multipart/alternative; boundary="00000000000067ec29059f013bd8"

--00000000000067ec29059f013bd8
Content-Type: text/plain; charset="UTF-8"

Generally this should be done by the person introducing the new recipe.

Also check that upstream version check works correctly for both:
devtool latest-version babeltrace (this should be probably limited to 1.x
versions)
devtool latest-version babeltrace2

Alex

On Thu, 20 Feb 2020 at 13:39, Anders Wallin <wallinux@gmail.com> wrote:

> Hi Alex,
>
> should I update the patch to include changes to maintainer file,
> packagegroup etc in the same way as for babeltrace or
> is it something you will do?
>
> Anders Wallin
>
>
> On Wed, Feb 19, 2020 at 5:02 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Wed, 19 Feb 2020 at 16:56, Jonathan Rajotte-Julien <
>> jonathan.rajotte-julien@efficios.com> wrote:
>>
>>> > There are some things where the namespaces are quite specific (python
>>> > vs python3, gtk(+) 2/3/4, qt) but they're fairly few and far between.
>>> >
>>> > If babeltrace2 will replace babeltrace and become babeltrace, we
>>> > probably want to keep PN as babeltrace. If it will be known as
>>> > babeltrace2 always, we probably change PN.
>>>
>>> Babeltrace 2 executable will be forever named babeltrace2.
>>>
>>> Hope this clear up this part a bit.
>>>
>>
>> Right, then I'm fine with naming the recipe babeltrace2.
>>
>> Alex
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--00000000000067ec29059f013bd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Generally this should be done by the person introducing th=
e new recipe.<div><br></div><div>Also check that upstream version check wor=
ks correctly for both:</div><div>devtool latest-version babeltrace (this sh=
ould be probably limited to 1.x versions)</div><div>devtool latest-version =
babeltrace2</div><div><br></div><div>Alex</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 20 Feb 2020 at 13:39=
, Anders Wallin &lt;<a href=3D"mailto:wallinux@gmail.com">wallinux@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-lef=
t-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Alex,<div><b=
r></div><div>should I update the patch to include changes to maintainer fil=
e, packagegroup etc in the same way as for babeltrace or=C2=A0</div><div>is=
 it something you will do?=C2=A0</div><div><br></div><div><div><div dir=3D"=
ltr">Anders Wallin</div></div><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 19, 2020 at 5:02 PM Ale=
xander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_bla=
nk">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div dir=3D"ltr">On Wed, 19 Feb 2020 at 16:56, Jonathan Rajotte-J=
ulien &lt;<a href=3D"mailto:jonathan.rajotte-julien@efficios.com" target=3D=
"_blank">jonathan.rajotte-julien@efficios.com</a>&gt; wrote:<br></div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-co=
lor:rgb(204,204,204);padding-left:1ex">&gt; There are some things where the=
 namespaces are quite specific (python<br>
&gt; vs python3, gtk(+) 2/3/4, qt) but they&#39;re fairly few and far betwe=
en.<br>
&gt; <br>
&gt; If babeltrace2 will replace babeltrace and become babeltrace, we<br>
&gt; probably want to keep PN as babeltrace. If it will be known as<br>
&gt; babeltrace2 always, we probably change PN.<br>
<br>
Babeltrace 2 executable will be forever named babeltrace2.<br>
<br>
Hope this clear up this part a bit.<br></blockquote><div><br></div><div>Rig=
ht, then I&#39;m fine with naming the recipe babeltrace2.</div><div><br></d=
iv><div>Alex=C2=A0</div></div></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>
</blockquote></div>

--00000000000067ec29059f013bd8--
