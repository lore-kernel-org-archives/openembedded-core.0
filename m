Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1826B6EF89
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 19:47:49 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id c1so2708354igq.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 12:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nDd3Fp5FCAX4mqaB1pxfq0N4iN5gsw2cETTlPOT9cHg=;
	b=eBoEXxQejx78Sop8doCNRu7UQ1+UMZTGL/uingw3qouqYgO1+sF83lK3qvRQohIuQ9
	/m53EGhQt8aYX1/6rDGkAYv2dqq+HXra8oCgwWvZSGj0KH9L8DozLx/TvP1xdbkS2PBz
	0dSjaJJIF3BU2QliKJPkNkqf/aSik/fsgp60xqXJwN47cLbsLZ6ULlqE4BoyDPfk+/Uw
	CcMkVGLO2z9iyoB6yQuYrdYObfrvImHwk6amDIloyd4FD8q59dWNiBf5owU5rA2OKmEa
	cb8brsy8ABi0/YciZ0JfIZFKyrTdy/HeZQTJ7ov6Ln0u0uiM2R0ouUk2Dkz62eapeJEk
	QEIg==
MIME-Version: 1.0
X-Received: by 10.42.171.69 with SMTP id i5mr29855288icz.45.1396295270732;
	Mon, 31 Mar 2014 12:47:50 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Mon, 31 Mar 2014 12:47:50 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Mon, 31 Mar 2014 12:47:50 -0700 (PDT)
In-Reply-To: <5339C30B.1060005@windriver.com>
References: <cover.1396288310.git.bruce.ashfield@windriver.com>
	<e6015802086cbf8199d112a3e75a7391a417ede6.1396288310.git.bruce.ashfield@windriver.com>
	<CAMKF1srOv27-6SwSfYxFLL0-BvHk7hxWBmn6twtY+hpQ9rTYww@mail.gmail.com>
	<5339C30B.1060005@windriver.com>
Date: Mon, 31 Mar 2014 12:47:50 -0700
Message-ID: <CAMKF1srfDpeGkQMnHkK_AFPy6N7pujtLwMRsgbsDeHem82_5nA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] libc-headers: set TC default to 3.14
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
X-List-Received-Date: Mon, 31 Mar 2014 19:47:58 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e8e809d1bb304f5ec5350

--90e6ba6e8e809d1bb304f5ec5350
Content-Type: text/plain; charset=UTF-8

-Khem
On Mar 31, 2014 12:33 PM, "Bruce Ashfield" <bruce.ashfield@windriver.com>
wrote:
>
> On 14-03-31 03:29 PM, Khem Raj wrote:
>>
>> On Mon, Mar 31, 2014 at 10:56 AM, Bruce Ashfield
>> <bruce.ashfield@windriver.com> wrote:
>>>
>>>
>>> -LINUXLIBCVERSION ?= "3.10"
>>> +LINUXLIBCVERSION ?= "3.14"
>>
>>
>> Does this  buy us much ? Infact its too late to change usespace APIs
>
>
> This was always the plan. I've been building with all the 3.14 -rc
> headers for ages .. and as we've talked about in the past, we always
> will update them to the newest kernel in any release.

well i think its good to update them however may be some components should
be given enough soak time and kernel headers are one of such pieces since
its effects are across layers and they will start testing them now.
>
> They are compatible with 3.10, and I've tested the combinations of
> old kernels, new libc and new kernels with the new libc interfaces.

i dont believe you tested all layer combinations
>
>
>> at this point. 3.10 being LTS
>> I would assume its a better option to keep at 3.10
>
>
> I disagree, this is consistent with other releases and the documented
> plan of action. I'd rather not have a massive version jump in the fall.

its probably not a bad option to stick to LTS version for kernel headers
after all
>
> Sure 3.14 slipping out by a few weeks upstream was a problem, but its
> not like we haven't been testing with it.
>
> Bruce
>
>>
>

--90e6ba6e8e809d1bb304f5ec5350
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">-Khem<br>
On Mar 31, 2014 12:33 PM, &quot;Bruce Ashfield&quot; &lt;<a href=3D"mailto:=
bruce.ashfield@windriver.com">bruce.ashfield@windriver.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; On 14-03-31 03:29 PM, Khem Raj wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Mar 31, 2014 at 10:56 AM, Bruce Ashfield<br>
&gt;&gt; &lt;<a href=3D"mailto:bruce.ashfield@windriver.com">bruce.ashfield=
@windriver.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -LINUXLIBCVERSION ?=3D &quot;3.10&quot;<br>
&gt;&gt;&gt; +LINUXLIBCVERSION ?=3D &quot;3.14&quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Does this =C2=A0buy us much ? Infact its too late to change usespa=
ce APIs<br>
&gt;<br>
&gt;<br>
&gt; This was always the plan. I&#39;ve been building with all the 3.14 -rc=
<br>
&gt; headers for ages .. and as we&#39;ve talked about in the past, we alwa=
ys<br>
&gt; will update them to the newest kernel in any release.</p>
<p dir=3D"ltr">well i think its good to update them however may be some com=
ponents should be given enough soak time and kernel headers are one of such=
 pieces since its effects are across layers and they will start testing the=
m now. <br>

&gt;<br>
&gt; They are compatible with 3.10, and I&#39;ve tested the combinations of=
<br>
&gt; old kernels, new libc and new kernels with the new libc interfaces.</p=
>
<p dir=3D"ltr">i dont believe you tested all layer combinations <br>
&gt;<br>
&gt;<br>
&gt;&gt; at this point. 3.10 being LTS<br>
&gt;&gt; I would assume its a better option to keep at 3.10<br>
&gt;<br>
&gt;<br>
&gt; I disagree, this is consistent with other releases and the documented<=
br>
&gt; plan of action. I&#39;d rather not have a massive version jump in the =
fall.</p>
<p dir=3D"ltr">its probably not a bad option to stick to LTS version for ke=
rnel headers after all <br>
&gt;<br>
&gt; Sure 3.14 slipping out by a few weeks upstream was a problem, but its<=
br>
&gt; not like we haven&#39;t been testing with it.<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;&gt;<br>
&gt;<br>
</p>

--90e6ba6e8e809d1bb304f5ec5350--
