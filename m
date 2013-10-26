Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id C46276D1C1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2013 04:30:00 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id as1so7836343iec.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2013 21:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DU4T6uHBBoWrPOqMQJwRudFVt3S8y9qFy0vYb3IuFA4=;
	b=Kbf8I2WlwmDjqBsj2AmOv4lPQt6236Vv109w0IFIR5DOYu1hFGbOM0OfnN5lHmO8JV
	BtgehdFtICpKt2UT8X/cjfS5iDGHTJepJb7vMrwes+BOq2VBZt0z4sNzTXrImBiT+lPP
	5BrkO5G8C03AAa9LvyEJ8j0X0YQm8O31fgvaYMSEdhdAx4vDo10ulgu6323nN1fLvIs9
	CZsvTQRiswj9/FzwZoMQOzKG2DC1bI8/ooN0jsGOgk8IXE1JOamJMKUvAaYn/Zd9OKh6
	RR/vGT7a9efqGp+s4WVqvEXXDCtdEl4GWZ0UIS9G1qXu1m1rvLBOXvgw3qrDFqoiAjMr
	W9mw==
MIME-Version: 1.0
X-Received: by 10.42.126.18 with SMTP id c18mr43263ics.46.1382761802452; Fri,
	25 Oct 2013 21:30:02 -0700 (PDT)
Received: by 10.50.219.195 with HTTP; Fri, 25 Oct 2013 21:30:02 -0700 (PDT)
In-Reply-To: <526B1D75.40304@windriver.com>
References: <cover.1382421718.git.jackie.huang@windriver.com>
	<58deef15f737352489f007488ec2e24bd76be058.1382421718.git.jackie.huang@windriver.com>
	<CAMKF1sqwHn4SU1U9_Cp0hsd8EKGYuteazX+OP7T5mQNDztPSsg@mail.gmail.com>
	<526B1D75.40304@windriver.com>
Date: Fri, 25 Oct 2013 21:30:02 -0700
Message-ID: <CAMKF1sqtDCKurpyqxxCX2WHmCQ7DgoYDuOBNdaL+s17OxHC3EQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: jhuang0 <jackie.huang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] midori: exclude from self-hosted for mips64
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
X-List-Received-Date: Sat, 26 Oct 2013 04:30:01 -0000
Content-Type: multipart/alternative; boundary=20cf3010e4df0b569704e99d52a5

--20cf3010e4df0b569704e99d52a5
Content-Type: text/plain; charset=UTF-8

On Saturday, October 26, 2013, jhuang0 wrote:

>
>
> On 10/25/2013 8:32 PM, Khem Raj wrote:
>
>> On Mon, Oct 21, 2013 at 11:04 PM,  <jackie.huang@windriver.com> wrote:
>>
>>> midori depends on webkit-gtk which could not build for mips64.
>>>
>>
>> what issues do you see building webkit-gtk for mips64, IIRC I fixed it
>> some time ago
>>
>
> I didn't see the webkit-gtk issue, but I saw:
> commit 0d2ed6bca55319195b5efd74eac83a**459bf58ee8
> Author: Kang Kai <kai.kang@windriver.com>
> Date:   Fri Jul 5 10:18:10 2013 +0000
>
>     webkit: set COMPATIBLE_HOST for mips64
>
>     webkit packages can NOT be built for mips64 with 64 bit userspace. Set
>     COMPATIBLE_HOST to to block them build for such platform.
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com>
>     Signed-off-by: Saul Wold <sgw@linux.intel.com>
>
>
> and midori depends ot webkit-gtk so it's not buildable for mips64.



hmm it passed my notice
it would be nice to know the errors



> If it's fixed, I think you should reset the COMPATIBLE_HOST back for both
> webkitgtk and midori, thanks!
>
> Thanks,
> Jackie
>
>
>
>>
> --
> Jackie Huang
> WIND RIVER | China Development Center
> MSN:jackielily@hotmail.com
> Tel: +86 8477 8594
> Mobile: +86 138 1027 4745
>

--20cf3010e4df0b569704e99d52a5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, October 26, 2013, jhuang0  wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
<br>
On 10/25/2013 8:32 PM, Khem Raj wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Mon, Oct 21, 2013 at 11:04 PM, =C2=A0&lt;<a>jackie.huang@windriver.com</=
a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
midori depends on webkit-gtk which could not build for mips64.<br>
</blockquote>
<br>
what issues do you see building webkit-gtk for mips64, IIRC I fixed it<br>
some time ago<br>
</blockquote>
<br>
I didn&#39;t see the webkit-gtk issue, but I saw:<br>
commit 0d2ed6bca55319195b5efd74eac83a<u></u>459bf58ee8<br>
Author: Kang Kai &lt;<a>kai.kang@windriver.com</a>&gt;<br>
Date: =C2=A0 Fri Jul 5 10:18:10 2013 +0000<br>
<br>
=C2=A0 =C2=A0 webkit: set COMPATIBLE_HOST for mips64<br>
<br>
=C2=A0 =C2=A0 webkit packages can NOT be built for mips64 with 64 bit users=
pace. Set<br>
=C2=A0 =C2=A0 COMPATIBLE_HOST to to block them build for such platform.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Kai Kang &lt;<a>kai.kang@windriver.com</a>&gt;=
<br>
=C2=A0 =C2=A0 Signed-off-by: Saul Wold &lt;<a>sgw@linux.intel.com</a>&gt;<b=
r>
<br>
<br>
and midori depends ot webkit-gtk so it&#39;s not buildable for mips64.</blo=
ckquote><div><br></div><div><br></div><div>hmm it passed my notice</div><di=
v>it would be nice to know the errors</div><div><br></div><div>=C2=A0</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
If it&#39;s fixed, I think you should reset the COMPATIBLE_HOST back for bo=
th webkitgtk and midori, thanks!<br>
<br>
Thanks,<br>
Jackie<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
</blockquote>
<br>
-- <br>
Jackie Huang<br>
WIND RIVER | China Development Center<br>
<a>MSN:jackielily@hotmail.com</a><br>
Tel: +86 8477 8594<br>
Mobile: +86 138 1027 4745<br>
</blockquote>

--20cf3010e4df0b569704e99d52a5--
