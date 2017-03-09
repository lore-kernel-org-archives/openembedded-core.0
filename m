Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 76CDE730D1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 08:18:50 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v190so9643727wme.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 00:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B20LRU7meQZ5dXw6evGOH8Kxj2cnyxlBLLuyrkYqMVk=;
	b=efZzMekLgb+6mQBznF/QXmeptdD/ykgNu4FAdhgHmz5HVRw8pC5o+bBWj62iJhhcIR
	9ICino/jMg+EOnnG47M+gYgostmaAZvocw4Tk0+DhD9KvjMyq/4Ik5Df7m9WnJ3eU/As
	voWgXaocgb06bzvKFxNzJvsK0J8Re0/HI0+THk/mZsULkpnhM4jORED8BT49hRaSPCZt
	9Bor/Y3+G51Zi6tU8Odje0f3zvXu2Os+1NOP4fLgIpNH2obpGydX5zMKjT1N2BJ63Md2
	BKKkcmQlwfFMfULHeIriPAp34sarmPeSveNRs6r7VDU23Q4ixa0/8dQUfusKR0TobKdN
	jwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B20LRU7meQZ5dXw6evGOH8Kxj2cnyxlBLLuyrkYqMVk=;
	b=HERyBukcrkjjCy5/c0PaPvZ/wVObzGsW4fEXANE5ZOK0rzB/OEJiY4qradNOGuaw7Y
	Jydre8ksxIMg1O3CNjyeRcfy9WUU0WSvi39lMdcUnpCKF15BjAIdFeiAq8r69iHASLGT
	rus15LC6HRGNRWZbLkJ13VzNjUpkB7ZOQ9gYWFoW7p46bnLggSkhrWsRwj9P1OYfqcCC
	WfNZGyOUof1N9M9AOnlwyw/1WXdj5wT7SEhihuNL1z7hNyh9dLJtGpKuNCyl8dWMXtJ2
	Fduf7Z/OeGcd8DvdGS/r/16cOkBjVESz7iUBTv5S6Mdtm1ZUnDNIbfBR2rFfCTzIgg7O
	iVRA==
X-Gm-Message-State: AMke39m4z5UlzDe4b6simUhXsl0VpzuEu1NTRFOz7dKPxLEafwvYM1qWEhcJJvlpSyjPCuiravpYUbRPfjJIeA==
X-Received: by 10.28.96.130 with SMTP id u124mr28639230wmb.81.1489047531147;
	Thu, 09 Mar 2017 00:18:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 9 Mar 2017 00:18:50 -0800 (PST)
In-Reply-To: <CAMKF1sp+Q6VX4zUWkH_JrV1THWV5oYo+LmEivz7uUiOC0Q48pQ@mail.gmail.com>
References: <1488836862-18218-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sr2GWjjXYBJvx+eb3Fks-PxHvFgbYf6umXM9PV+rmv5Bw@mail.gmail.com>
	<CAJ86T=VgZMNyXwd6O9UR4wmF-8afc5HMKY2=c8QxeSajsxMa7A@mail.gmail.com>
	<CAMKF1sp+Q6VX4zUWkH_JrV1THWV5oYo+LmEivz7uUiOC0Q48pQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 9 Mar 2017 09:18:50 +0100
Message-ID: <CA+chaQdhW4w9Uf5sgQPY8DaBMr4nT9qt4gUXkF5L-PZCc+wVFQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] conf/machine/include: enable hardfloat by default for ARMv6 and above
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
X-List-Received-Date: Thu, 09 Mar 2017 08:18:51 -0000
Content-Type: multipart/alternative; boundary=001a1148f03a25db67054a47e57a

--001a1148f03a25db67054a47e57a
Content-Type: text/plain; charset=UTF-8

Shouldn't we change default ARM_INSTRUCTION_SET while we're at it as well?

https://bugzilla.yoctoproject.org/show_bug.cgi?id=9213

On Tue, Mar 7, 2017 at 12:35 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Mon, Mar 6, 2017 at 2:51 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> On Mon, Mar 6, 2017 at 2:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> > On Mon, Mar 6, 2017 at 1:47 PM, Andre McCurdy <armccurdy@gmail.com>
>> wrote:
>> >> Defaulting to softfp probably isn't the best choice anymore,
>> >> especially as there are now ARM BSP layers which leave DEFAULTTUNE
>> >> entirely up to the distro:
>> >>
>> >>   https://lists.yoctoproject.org/pipermail/yocto/2017-
>> February/034637.html
>> >>
>> >
>> > I like this patch and want to clarify that it changes the default ISA
>> to thumb2
>> > which we should use anyway due to size reasons and other distros use it
>> as
>> > default too.
>>
>> No, it doesn't.
>
>
> That's right I wanted to say to make that default while you are at it
>
> The choice between ARM and Thumb(2) is made by the
>> ARM_INSTRUCTION_SET variable. Adding 't' to DEFAULTTUNE simply means
>> that the ARM_INSTRUCTION_SET variable will not be ignored (it's really
>> a long standing bug that we ever defined DEFAULTTUNE options for ARMv6
>> and above which ignore ARM_INSTRUCTION_SET, but that's a separate
>> topic).
>>
>> > I am not sure of we should change it for armv6 though. since some armv6
>> > has t1 and some has t2 so lets leave that as it is.
>>
>> I'm not aware of any ARMv6 cores which don't support Thumb2. Do you
>> have a reference?
>>
>> (But again, to be clear, this commit doesn't change the default in
>> terms of instruction set - all builds will still use ARM).
>>
>> >> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> >> ---
>> >>  meta/conf/machine/include/arm/arch-armv6.inc   | 2 +-
>> >>  meta/conf/machine/include/arm/arch-armv7a.inc  | 2 +-
>> >>  meta/conf/machine/include/arm/arch-armv7ve.inc | 2 +-
>> >>  meta/conf/machine/include/tune-arm1136jf-s.inc | 2 +-
>> >>  meta/conf/machine/include/tune-cortexa15.inc   | 2 +-
>> >>  meta/conf/machine/include/tune-cortexa17.inc   | 2 +-
>> >>  meta/conf/machine/include/tune-cortexa5.inc    | 2 +-
>> >>  meta/conf/machine/include/tune-cortexa7.inc    | 2 +-
>> >>  meta/conf/machine/include/tune-cortexa8.inc    | 2 +-
>> >>  meta/conf/machine/include/tune-cortexa9.inc    | 2 +-
>> >>  10 files changed, 10 insertions(+), 10 deletions(-)
>> >>
>> >> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc
>> b/meta/conf/machine/include/arm/arch-armv6.inc
>> >> index 91f0f07..5e1f973 100644
>> >> --- a/meta/conf/machine/include/arm/arch-armv6.inc
>> >> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
>> >> @@ -1,4 +1,4 @@
>> >> -DEFAULTTUNE ?= "armv6"
>> >> +DEFAULTTUNE ?= "armv6thf"
>> >>
>> >>  TUNEVALID[armv6] = "Enable instructions for ARMv6"
>> >>  TUNECONFLICTS[armv6] = "armv4 armv5"
>> >> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
>> b/meta/conf/machine/include/arm/arch-armv7a.inc
>> >> index 5446048..bad1c27 100644
>> >> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>> >> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>> >> @@ -1,4 +1,4 @@
>> >> -DEFAULTTUNE ?= "armv7a"
>> >> +DEFAULTTUNE ?= "armv7athf"
>> >>
>> >>  TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
>> >>  TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
>> >> diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc
>> b/meta/conf/machine/include/arm/arch-armv7ve.inc
>> >> index 42d8d04..4d9260f 100644
>> >> --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
>> >> +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
>> >> @@ -1,4 +1,4 @@
>> >> -DEFAULTTUNE ?= "armv7ve"
>> >> +DEFAULTTUNE ?= "armv7vethf"
>> >>
>> >>  TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
>> >>  TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
>> >> diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc
>> b/meta/conf/machine/include/tune-arm1136jf-s.inc
>> >> index 53994ef..2cadbee 100644
>> >> --- a/meta/conf/machine/include/tune-arm1136jf-s.inc
>> >> +++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
>> >> @@ -1,4 +1,4 @@
>> >> -DEFAULTTUNE ?= "armv6"
>> >> +DEFAULTTUNE ?= "armv6thf"
>> >>
>> >>  require conf/machine/include/arm/arch-armv6.inc
>> >>
>> >> diff --git a/meta/conf/machine/include/tune-cortexa15.inc
>> b/meta/conf/machine/include/tune-cortexa15.inc
>> >> index 03de602..25e99f9 100644
>> >> --- a/meta/conf/machine/include/tune-cortexa15.inc
>> >> +++ b/meta/conf/machine/include/tune-cortexa15.inc
>> >> @@ -1,4 +1,4 @@
>> >> -DEFAULTTUNE ?= "armv7ve-neon"
>> >> +DEFAULTTUNE ?= "armv7vethf-neon"
>> >>
>> >>  require conf/machine/include/arm/arch-armv7ve.inc
>> >>
>> >> diff --git a/meta/conf/machine/include/tune-cortexa17.inc
>> b/meta/conf/machine/include/tune-cortexa17.inc
>> >> index f659a62..40392f9 100644
>> >> --- a/meta/conf/machine/include/tune-cortexa17.inc
>> >> +++ b/meta/conf/machine/include/tune-cortexa17.inc
>> >> @@ -1,4 +1,4 @@
>> >> -DEFAULTTUNE ?= "armv7ve-neon"
>> >> +DEFAULTTUNE ?= "armv7vethf-neon"
>> >>
>> >>  require conf/machine/include/arm/arch-armv7ve.inc
>> >>
>> >> diff --git a/meta/conf/machine/include/tune-cortexa5.inc
>> b/meta/conf/machine/include/tune-cortexa5.inc
>> >> index 93f9ca4..1f0cda6 100644
>> >> --- a/meta/conf/machine/include/tune-cortexa5.inc
>> >> +++ b/meta/conf/machine/include/tune-cortexa5.inc
>> >> @@ -1,4 +1,4 @@
>> >> -DEFAULTTUNE ?= "armv7a-neon"
>> >> +DEFAULTTUNE ?= "armv7athf-neon"
>> >>
>> >>  require conf/machine/include/arm/arch-armv7a.inc
>> >>
>> >> diff --git a/meta/conf/machine/include/tune-cortexa7.inc
>> b/meta/conf/machine/include/tune-cortexa7.inc
>> >> index 52e06b8..52415d9 100644
>> >> --- a/meta/conf/machine/include/tune-cortexa7.inc
>> >> +++ b/meta/conf/machine/include/tune-cortexa7.inc
>> >> @@ -1,4 +1,4 @@
>> >> -DEFAULTTUNE ?= "armv7ve-neon"
>> >> +DEFAULTTUNE ?= "armv7vethf-neon"
>> >>
>> >>  require conf/machine/include/arm/arch-armv7ve.inc
>> >>
>> >> diff --git a/meta/conf/machine/include/tune-cortexa8.inc
>> b/meta/conf/machine/include/tune-cortexa8.inc
>> >> index a831bd5..8ee8de9 100644
>> >> --- a/meta/conf/machine/include/tune-cortexa8.inc
>> >> +++ b/meta/conf/machine/include/tune-cortexa8.inc
>> >> @@ -1,4 +1,4 @@
>> >> -DEFAULTTUNE ?= "armv7a-neon"
>> >> +DEFAULTTUNE ?= "armv7athf-neon"
>> >>
>> >>  require conf/machine/include/arm/arch-armv7a.inc
>> >>
>> >> diff --git a/meta/conf/machine/include/tune-cortexa9.inc
>> b/meta/conf/machine/include/tune-cortexa9.inc
>> >> index 8b84e60..0cf323c 100644
>> >> --- a/meta/conf/machine/include/tune-cortexa9.inc
>> >> +++ b/meta/conf/machine/include/tune-cortexa9.inc
>> >> @@ -1,4 +1,4 @@
>> >> -DEFAULTTUNE ?= "armv7a-neon"
>> >> +DEFAULTTUNE ?= "armv7athf-neon"
>> >>
>> >>  require conf/machine/include/arm/arch-armv7a.inc
>> >>
>> >> --
>> >> 1.9.1
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a1148f03a25db67054a47e57a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Shouldn&#39;t we change default=C2=A0<span style=3D"font-s=
ize:12.8px">ARM_INSTRUCTION_SET while we&#39;re at it as well?</span><div><=
span style=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-s=
ize:12.8px"><a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
9213">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9213</a></span><b=
r></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
Tue, Mar 7, 2017 at 12:35 AM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div><br><div class=3D"gmail_quot=
e"><span class=3D""><div>On Mon, Mar 6, 2017 at 2:51 PM Andre McCurdy &lt;<=
a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, Mar 6, 2017=
 at 2:37 PM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" class=3D"m_=
2774803552810199972gmail_msg" target=3D"_blank">raj.khem@gmail.com</a>&gt; =
wrote:<br class=3D"m_2774803552810199972gmail_msg">
&gt; On Mon, Mar 6, 2017 at 1:47 PM, Andre McCurdy &lt;<a href=3D"mailto:ar=
mccurdy@gmail.com" class=3D"m_2774803552810199972gmail_msg" target=3D"_blan=
k">armccurdy@gmail.com</a>&gt; wrote:<br class=3D"m_2774803552810199972gmai=
l_msg">
&gt;&gt; Defaulting to softfp probably isn&#39;t the best choice anymore,<b=
r class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; especially as there are now ARM BSP layers which leave DEFAULTTUNE=
<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; entirely up to the distro:<br class=3D"m_2774803552810199972gmail_=
msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 =C2=A0<a href=3D"https://lists.yoctoproject.org/pipermail/yo=
cto/2017-February/034637.html" rel=3D"noreferrer" class=3D"m_27748035528101=
99972gmail_msg" target=3D"_blank">https://lists.yoctoproject.<wbr>org/piper=
mail/yocto/2017-<wbr>February/034637.html</a><br class=3D"m_277480355281019=
9972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt; I like this patch and want to clarify that it changes the default ISA =
to thumb2<br class=3D"m_2774803552810199972gmail_msg">
&gt; which we should use anyway due to size reasons and other distros use i=
t as<br class=3D"m_2774803552810199972gmail_msg">
&gt; default too.<br class=3D"m_2774803552810199972gmail_msg">
<br class=3D"m_2774803552810199972gmail_msg">
No, it doesn&#39;t. </blockquote><div><br></div></span><div>That&#39;s righ=
t I wanted to say to make that default while you are at it</div><div><div c=
lass=3D"h5"><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The choice betwee=
n ARM and Thumb(2) is made by the<br class=3D"m_2774803552810199972gmail_ms=
g">
ARM_INSTRUCTION_SET variable. Adding &#39;t&#39; to DEFAULTTUNE simply mean=
s<br class=3D"m_2774803552810199972gmail_msg">
that the ARM_INSTRUCTION_SET variable will not be ignored (it&#39;s really<=
br class=3D"m_2774803552810199972gmail_msg">
a long standing bug that we ever defined DEFAULTTUNE options for ARMv6<br c=
lass=3D"m_2774803552810199972gmail_msg">
and above which ignore ARM_INSTRUCTION_SET, but that&#39;s a separate<br cl=
ass=3D"m_2774803552810199972gmail_msg">
topic).<br class=3D"m_2774803552810199972gmail_msg">
<br class=3D"m_2774803552810199972gmail_msg">
&gt; I am not sure of we should change it for armv6 though. since some armv=
6<br class=3D"m_2774803552810199972gmail_msg">
&gt; has t1 and some has t2 so lets leave that as it is.<br class=3D"m_2774=
803552810199972gmail_msg">
<br class=3D"m_2774803552810199972gmail_msg">
I&#39;m not aware of any ARMv6 cores which don&#39;t support Thumb2. Do you=
<br class=3D"m_2774803552810199972gmail_msg">
have a reference?<br class=3D"m_2774803552810199972gmail_msg">
<br class=3D"m_2774803552810199972gmail_msg">
(But again, to be clear, this commit doesn&#39;t change the default in<br c=
lass=3D"m_2774803552810199972gmail_msg">
terms of instruction set - all builds will still use ARM).<br class=3D"m_27=
74803552810199972gmail_msg">
<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail=
.com" class=3D"m_2774803552810199972gmail_msg" target=3D"_blank">armccurdy@=
gmail.com</a>&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; ---<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/arm/<wbr>arch-armv6.inc=C2=A0 =C2=
=A0| 2 +-<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/arm/<wbr>arch-armv7a.inc=C2=A0 | 2=
 +-<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/arm/<wbr>arch-armv7ve.inc | 2 +-<b=
r class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/<wbr>tune-arm1136jf-s.inc | 2 +-<b=
r class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/<wbr>tune-cortexa15.inc=C2=A0 =C2=
=A0| 2 +-<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/<wbr>tune-cortexa17.inc=C2=A0 =C2=
=A0| 2 +-<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/<wbr>tune-cortexa5.inc=C2=A0 =C2=
=A0 | 2 +-<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/<wbr>tune-cortexa7.inc=C2=A0 =C2=
=A0 | 2 +-<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/<wbr>tune-cortexa8.inc=C2=A0 =C2=
=A0 | 2 +-<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 meta/conf/machine/include/<wbr>tune-cortexa9.inc=C2=A0 =C2=
=A0 | 2 +-<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 10 files changed, 10 insertions(+), 10 deletions(-)<br class=
=3D"m_2774803552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/<wbr>arm/arch-armv6.inc b/m=
eta/conf/machine/include/<wbr>arm/arch-armv6.inc<br class=3D"m_277480355281=
0199972gmail_msg">
&gt;&gt; index 91f0f07..5e1f973 100644<br class=3D"m_2774803552810199972gma=
il_msg">
&gt;&gt; --- a/meta/conf/machine/include/<wbr>arm/arch-armv6.inc<br class=
=3D"m_2774803552810199972gmail_msg">
&gt;&gt; +++ b/meta/conf/machine/include/<wbr>arm/arch-armv6.inc<br class=
=3D"m_2774803552810199972gmail_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv6&quot;<br class=3D"m_2774803552810199=
972gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv6thf&quot;<br class=3D"m_2774803552810=
199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 TUNEVALID[armv6] =3D &quot;Enable instructions for ARMv6&quo=
t;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 TUNECONFLICTS[armv6] =3D &quot;armv4 armv5&quot;<br class=3D=
"m_2774803552810199972gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/<wbr>arm/arch-armv7a.inc b/=
meta/conf/machine/include/<wbr>arm/arch-armv7a.inc<br class=3D"m_2774803552=
810199972gmail_msg">
&gt;&gt; index 5446048..bad1c27 100644<br class=3D"m_2774803552810199972gma=
il_msg">
&gt;&gt; --- a/meta/conf/machine/include/<wbr>arm/arch-armv7a.inc<br class=
=3D"m_2774803552810199972gmail_msg">
&gt;&gt; +++ b/meta/conf/machine/include/<wbr>arm/arch-armv7a.inc<br class=
=3D"m_2774803552810199972gmail_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7a&quot;<br class=3D"m_277480355281019=
9972gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7athf&quot;<br class=3D"m_277480355281=
0199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 TUNEVALID[armv7a] =3D &quot;Enable instructions for ARMv7-a&=
quot;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 TUNECONFLICTS[armv7a] =3D &quot;armv4 armv5 armv6 armv7&quot=
;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/<wbr>arm/arch-armv7ve.inc b=
/meta/conf/machine/include/<wbr>arm/arch-armv7ve.inc<br class=3D"m_27748035=
52810199972gmail_msg">
&gt;&gt; index 42d8d04..4d9260f 100644<br class=3D"m_2774803552810199972gma=
il_msg">
&gt;&gt; --- a/meta/conf/machine/include/<wbr>arm/arch-armv7ve.inc<br class=
=3D"m_2774803552810199972gmail_msg">
&gt;&gt; +++ b/meta/conf/machine/include/<wbr>arm/arch-armv7ve.inc<br class=
=3D"m_2774803552810199972gmail_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7ve&quot;<br class=3D"m_27748035528101=
99972gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7vethf&quot;<br class=3D"m_27748035528=
10199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 TUNEVALID[armv7ve] =3D &quot;Enable instructions for ARMv7ve=
&quot;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 TUNECONFLICTS[armv7ve] =3D &quot;armv4 armv5 armv6 armv7 arm=
v7a&quot;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/<wbr>tune-arm1136jf-s.inc b=
/meta/conf/machine/include/<wbr>tune-arm1136jf-s.inc<br class=3D"m_27748035=
52810199972gmail_msg">
&gt;&gt; index 53994ef..2cadbee 100644<br class=3D"m_2774803552810199972gma=
il_msg">
&gt;&gt; --- a/meta/conf/machine/include/<wbr>tune-arm1136jf-s.inc<br class=
=3D"m_2774803552810199972gmail_msg">
&gt;&gt; +++ b/meta/conf/machine/include/<wbr>tune-arm1136jf-s.inc<br class=
=3D"m_2774803552810199972gmail_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv6&quot;<br class=3D"m_2774803552810199=
972gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv6thf&quot;<br class=3D"m_2774803552810=
199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-<wbr>armv6.inc<br clas=
s=3D"m_2774803552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/<wbr>tune-cortexa15.inc b/m=
eta/conf/machine/include/<wbr>tune-cortexa15.inc<br class=3D"m_277480355281=
0199972gmail_msg">
&gt;&gt; index 03de602..25e99f9 100644<br class=3D"m_2774803552810199972gma=
il_msg">
&gt;&gt; --- a/meta/conf/machine/include/<wbr>tune-cortexa15.inc<br class=
=3D"m_2774803552810199972gmail_msg">
&gt;&gt; +++ b/meta/conf/machine/include/<wbr>tune-cortexa15.inc<br class=
=3D"m_2774803552810199972gmail_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7ve-neon&quot;<br class=3D"m_277480355=
2810199972gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7vethf-neon&quot;<br class=3D"m_277480=
3552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-<wbr>armv7ve.inc<br cl=
ass=3D"m_2774803552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/<wbr>tune-cortexa17.inc b/m=
eta/conf/machine/include/<wbr>tune-cortexa17.inc<br class=3D"m_277480355281=
0199972gmail_msg">
&gt;&gt; index f659a62..40392f9 100644<br class=3D"m_2774803552810199972gma=
il_msg">
&gt;&gt; --- a/meta/conf/machine/include/<wbr>tune-cortexa17.inc<br class=
=3D"m_2774803552810199972gmail_msg">
&gt;&gt; +++ b/meta/conf/machine/include/<wbr>tune-cortexa17.inc<br class=
=3D"m_2774803552810199972gmail_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7ve-neon&quot;<br class=3D"m_277480355=
2810199972gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7vethf-neon&quot;<br class=3D"m_277480=
3552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-<wbr>armv7ve.inc<br cl=
ass=3D"m_2774803552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/<wbr>tune-cortexa5.inc b/me=
ta/conf/machine/include/<wbr>tune-cortexa5.inc<br class=3D"m_27748035528101=
99972gmail_msg">
&gt;&gt; index 93f9ca4..1f0cda6 100644<br class=3D"m_2774803552810199972gma=
il_msg">
&gt;&gt; --- a/meta/conf/machine/include/<wbr>tune-cortexa5.inc<br class=3D=
"m_2774803552810199972gmail_msg">
&gt;&gt; +++ b/meta/conf/machine/include/<wbr>tune-cortexa5.inc<br class=3D=
"m_2774803552810199972gmail_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7a-neon&quot;<br class=3D"m_2774803552=
810199972gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br class=3D"m_2774803=
552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-<wbr>armv7a.inc<br cla=
ss=3D"m_2774803552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/<wbr>tune-cortexa7.inc b/me=
ta/conf/machine/include/<wbr>tune-cortexa7.inc<br class=3D"m_27748035528101=
99972gmail_msg">
&gt;&gt; index 52e06b8..52415d9 100644<br class=3D"m_2774803552810199972gma=
il_msg">
&gt;&gt; --- a/meta/conf/machine/include/<wbr>tune-cortexa7.inc<br class=3D=
"m_2774803552810199972gmail_msg">
&gt;&gt; +++ b/meta/conf/machine/include/<wbr>tune-cortexa7.inc<br class=3D=
"m_2774803552810199972gmail_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7ve-neon&quot;<br class=3D"m_277480355=
2810199972gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7vethf-neon&quot;<br class=3D"m_277480=
3552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-<wbr>armv7ve.inc<br cl=
ass=3D"m_2774803552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/<wbr>tune-cortexa8.inc b/me=
ta/conf/machine/include/<wbr>tune-cortexa8.inc<br class=3D"m_27748035528101=
99972gmail_msg">
&gt;&gt; index a831bd5..8ee8de9 100644<br class=3D"m_2774803552810199972gma=
il_msg">
&gt;&gt; --- a/meta/conf/machine/include/<wbr>tune-cortexa8.inc<br class=3D=
"m_2774803552810199972gmail_msg">
&gt;&gt; +++ b/meta/conf/machine/include/<wbr>tune-cortexa8.inc<br class=3D=
"m_2774803552810199972gmail_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7a-neon&quot;<br class=3D"m_2774803552=
810199972gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br class=3D"m_2774803=
552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-<wbr>armv7a.inc<br cla=
ss=3D"m_2774803552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; diff --git a/meta/conf/machine/include/<wbr>tune-cortexa9.inc b/me=
ta/conf/machine/include/<wbr>tune-cortexa9.inc<br class=3D"m_27748035528101=
99972gmail_msg">
&gt;&gt; index 8b84e60..0cf323c 100644<br class=3D"m_2774803552810199972gma=
il_msg">
&gt;&gt; --- a/meta/conf/machine/include/<wbr>tune-cortexa9.inc<br class=3D=
"m_2774803552810199972gmail_msg">
&gt;&gt; +++ b/meta/conf/machine/include/<wbr>tune-cortexa9.inc<br class=3D=
"m_2774803552810199972gmail_msg">
&gt;&gt; @@ -1,4 +1,4 @@<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; -DEFAULTTUNE ?=3D &quot;armv7a-neon&quot;<br class=3D"m_2774803552=
810199972gmail_msg">
&gt;&gt; +DEFAULTTUNE ?=3D &quot;armv7athf-neon&quot;<br class=3D"m_2774803=
552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;=C2=A0 require conf/machine/include/arm/arch-<wbr>armv7a.inc<br cla=
ss=3D"m_2774803552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; --<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; 1.9.1<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt;<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; --<br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; ______________________________<wbr>_________________<br class=3D"m=
_2774803552810199972gmail_msg">
&gt;&gt; Openembedded-core mailing list<br class=3D"m_2774803552810199972gm=
ail_msg">
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" class=
=3D"m_2774803552810199972gmail_msg" target=3D"_blank">Openembedded-core@lis=
ts.<wbr>openembedded.org</a><br class=3D"m_2774803552810199972gmail_msg">
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" class=3D"m_2774803552810199972gmail_msg" targ=
et=3D"_blank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembed=
ded-<wbr>core</a><br class=3D"m_2774803552810199972gmail_msg">
</blockquote></div></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a1148f03a25db67054a47e57a--
