Return-Path: <just4tech83@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id EE6BB710C8;
	Wed, 10 Sep 2014 14:09:57 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id o8so19100935qcw.17
	for <multiple recipients>; Wed, 10 Sep 2014 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+R4HgHm4fcbJAVuiV3krJy2oEjr8+jiJijJUjPWcX8M=;
	b=DVgXYrYxPm0WrCF408sDKOogpfmRHhqeYzufSrMXDbp1j5n/c4C3FND4o5E9mk1V5o
	YGc/+qu2KUiHFAFji96bEoOfe8g56v4u/jM8bZEfBtj8VItKILsl4xAv6Hjv/Mb/t6kz
	90Pi8pFzZWR64BJQ2YCKj7UkcS/FUFMlNNYr5mGTzUbkGsv3lYjbg1a8w3Y/CBe8EJlo
	KEnYDdqw6OTCUR5bg3FGyQKIaAiV7e3XCaKwcPiwc3hPOmuTReUybYGAA+WOx9nQIDpo
	CLV7BRs6u9B/5sD2fC1/BAMf8wgze3lfnypOMkSuJa6ar68aqbYAwBLbo1vUJXpFVmNz
	r+Ag==
MIME-Version: 1.0
X-Received: by 10.140.38.169 with SMTP id t38mr58978845qgt.3.1410358198421;
	Wed, 10 Sep 2014 07:09:58 -0700 (PDT)
Received: by 10.140.16.144 with HTTP; Wed, 10 Sep 2014 07:09:58 -0700 (PDT)
Received: by 10.140.16.144 with HTTP; Wed, 10 Sep 2014 07:09:58 -0700 (PDT)
In-Reply-To: <CAD2C2VR10GCLaH8CoWtv=ASUX7_W9wwBmFP2uey9WhAaNWbCfA@mail.gmail.com>
References: <CAD2C2VTOgCMRsq4em2Bd0hQ4Nz2Zq=B2vXezAw7QXQmhkQOsRQ@mail.gmail.com>
	<48633854.zRbls2qSnV@peggleto-mobl5.ger.corp.intel.com>
	<CAD2C2VR10GCLaH8CoWtv=ASUX7_W9wwBmFP2uey9WhAaNWbCfA@mail.gmail.com>
Date: Wed, 10 Sep 2014 19:39:58 +0530
Message-ID: <CAD2C2VTjrT-o_SqpTFLENK2T3i=PZ-9xRpenYTmxF5eEGT4Y+A@mail.gmail.com>
From: Bryan <just4tech83@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Backporting of latest recipes on oe-classic
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
X-List-Received-Date: Wed, 10 Sep 2014 14:10:01 -0000
Content-Type: multipart/alternative; boundary=001a11c12ce66c50790502b69b89

--001a11c12ce66c50790502b69b89
Content-Type: text/plain; charset=UTF-8

Can u please tell me which latest bitbake version i can use with
oe-classic. I used bitbake version 1.8.12 with my infra. So i need to use
bitbake version which would be suitable with my old recipes as well.

Regards
Bryan
On Sep 10, 2014 7:13 PM, "Bryan" <just4tech83@gmail.com> wrote:

> Hi Paul,
>               Do you know any forked repository where we can found support
> for glibc 2.11.x, 2.12.x onwards.
>
> One more query is related to glibc version. Does it become eglibc in later
> versions as we could not get later version recipes.
>
> Actually i have an old infra and i need to support icaclient 13 (citrix
> receiver) which require libraries of later versions e.g. glibc, gtk,
> libwebkit...
>
> Regards
> Bryan
>  On Sep 9, 2014 6:32 PM, "Paul Eggleton" <paul.eggleton@linux.intel.com>
> wrote:
>
>> On Tuesday 09 September 2014 18:23:24 Bryan wrote:
>> >    We have some queries regarding OE-Classic.
>> > 1. Where can we find latest recipes for oe-classic.
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/
>>
>> That's as up-to-date as it gets. There might be other forked repositories
>> floating around, but that is the last official one.
>>
>> > Does oe-classic is still get updation for latest package support?
>>
>> No, as discussed on IRC, OE-Classic is now unmaintained. OE-Core and
>> layers on
>> top of it should ideally be used instead.
>>
>> > 2. How can we compile latest recipes of oe-core on oe-classic and
>> ofcourse
>> > there bitbake version would be different.Basically, we can say we need
>> to
>> > backport the recipe to classic.
>> > e.g. gtk+2.20.1 & above, glibc-2.11.3 & above
>>
>> If you are determined to stay with OE-Classic I think you'd be better off
>> just
>> upgrading the recipes in OE-Classic - going backwards is going to be more
>> painful.
>>
>> Here's the only semi-related information we have, which is about
>> migration in
>> the other direction; it could be helpful in terms of providing pointers:
>>
>>   http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>>
>

--001a11c12ce66c50790502b69b89
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Can u please tell me which latest bitbake version i can use =
with oe-classic. I used bitbake version 1.8.12 with my infra. So i need to =
use bitbake version which would be suitable with my old recipes as well. </=
p>
<p dir=3D"ltr">Regards <br>
Bryan</p>
<div class=3D"gmail_quote">On Sep 10, 2014 7:13 PM, &quot;Bryan&quot; &lt;<=
a href=3D"mailto:just4tech83@gmail.com">just4tech83@gmail.com</a>&gt; wrote=
:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p dir=3D"ltr">Hi =
Paul,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Do you know any forked repository where we can found support for glibc =
2.11.x, 2.12.x onwards.</p>
<p dir=3D"ltr">One more query is related to glibc version. Does it become e=
glibc in later versions as we could not get later version recipes. </p>
<p dir=3D"ltr">Actually i have an old infra and i need to support icaclient=
 13 (citrix receiver) which require libraries of later versions e.g. glibc,=
 gtk, libwebkit...<br><br></p>
<p dir=3D"ltr">Regards <br>
Bryan<br>
</p>
<div class=3D"gmail_quote">On Sep 9, 2014 6:32 PM, &quot;Paul Eggleton&quot=
; &lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">pa=
ul.eggleton@linux.intel.com</a>&gt; wrote:<br type=3D"attribution"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Tuesday 09 September 2014 18:23:24 Bryan wrote:<b=
r>
&gt;=C2=A0 =C2=A0 We have some queries regarding OE-Classic.<br>
&gt; 1. Where can we find latest recipes for oe-classic.<br>
<br>
<a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded/" target=3D"_=
blank">http://cgit.openembedded.org/cgit.cgi/openembedded/</a><br>
<br>
That&#39;s as up-to-date as it gets. There might be other forked repositori=
es<br>
floating around, but that is the last official one.<br>
<br>
&gt; Does oe-classic is still get updation for latest package support?<br>
<br>
No, as discussed on IRC, OE-Classic is now unmaintained. OE-Core and layers=
 on<br>
top of it should ideally be used instead.<br>
<br>
&gt; 2. How can we compile latest recipes of oe-core on oe-classic and ofco=
urse<br>
&gt; there bitbake version would be different.Basically, we can say we need=
 to<br>
&gt; backport the recipe to classic.<br>
&gt; e.g. gtk+2.20.1 &amp; above, glibc-2.11.3 &amp; above<br>
<br>
If you are determined to stay with OE-Classic I think you&#39;d be better o=
ff just<br>
upgrading the recipes in OE-Classic - going backwards is going to be more<b=
r>
painful.<br>
<br>
Here&#39;s the only semi-related information we have, which is about migrat=
ion in<br>
the other direction; it could be helpful in terms of providing pointers:<br=
>
<br>
=C2=A0 <a href=3D"http://www.openembedded.org/wiki/Migrating_metadata_to_OE=
-Core" target=3D"_blank">http://www.openembedded.org/wiki/Migrating_metadat=
a_to_OE-Core</a><br>
<br>
Cheers,<br>
Paul<br>
<br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</blockquote></div>
</blockquote></div>

--001a11c12ce66c50790502b69b89--
