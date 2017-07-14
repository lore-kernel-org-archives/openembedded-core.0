Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id DF0E86067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 01:57:05 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id z78so46263907lff.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 18:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sb8OqSWNH5NdatJxTGC4DmznSmIMgn/iJLASRI9iVXw=;
	b=daFcFHifrd4x8ieS0wDviyrUPH4znZ1RO9YMEHYCZyqEBOjn5fWqhI8ouFCMJraAqp
	9FAc+TcarTiiBCpwID8MClXtI87d9Vp+X8hVs6ncRGXsd/fwQ4tYI5r7hxSrb1leRbJW
	XdVzJXooXUx13f9CUEg4zf0qN5VapJ8fDIaYegu8PedewoJRN+pG+yjQtVIDwZltdIXX
	lPzZEmuQTZQ4o3oZjmzJmFN9Ug9aS/FLw6SQuZWfxjQdpqyC5q4IzUd6mMDTGxl4hmC8
	1NFL6hoQDYhPG4iIX0XeieyvwyQ925s+m09lYA05hSCQQ6psfI0BGPdwHGpnrTYyBEe+
	qm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sb8OqSWNH5NdatJxTGC4DmznSmIMgn/iJLASRI9iVXw=;
	b=ZLQjk6BAPn3uNXtQ5+ra1O4/F+21pl7Jj+GH4JqtHAD3Gop1uxpFBCn9JmWSxeDVmv
	pEH0my1yNUyDdjbkjM9vzH96efzCqn2WFQ7HEQuiNKd4bntGDkQpS1T92D5dQXzEucii
	9lZFMNPHIXEjr0q1DoeyKSQGGom0oBvy9FljfXpGv1iO9HwXB1dKyZBQw3EuDfKmGNGp
	HCdH7QS2D1rRxV0sDrtif6MqC2IcQltOzbGVsh9dp0l2QqGvEtAuTuxVkRNLqjGnswcs
	vYa/qxVT7u486cldhaG1IT2hBR0HYpmYmiPzGBPL6t716qJQ1WLJMOXmHvQDKgHQB/GF
	2zfQ==
X-Gm-Message-State: AIVw110+q1q/MldJ6MnuNQftW6SNa/VGaz/rMJJF376VqWAvIZhcR7Ai
	OX/M9U7bsAMpZhhpVt0B4ts1V3JGVQ==
X-Received: by 10.46.78.9 with SMTP id c9mr22492ljb.52.1499997425889; Thu, 13
	Jul 2017 18:57:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Thu, 13 Jul 2017 18:57:05 -0700 (PDT)
In-Reply-To: <73d8e805-380f-874b-82b2-7d8c6269d46f@intel.com>
References: <cover.1499784588.git.bruce.ashfield@windriver.com>
	<17a1741ee4d35f09f91f6b5216507410bb37ddb9.1499784588.git.bruce.ashfield@windriver.com>
	<CAJTo0LaacpM6wxd2Re+W6Vu7o8zPoq9MadE9csf+Pko_QCKX2Q@mail.gmail.com>
	<e99d1232-1ed5-5df1-7fc7-81437053988a@windriver.com>
	<CAJTo0LY6y+FvKgqbqCUwdD414Ub8Ba_1XY4PW3X15==BsDTRYg@mail.gmail.com>
	<6c3f201c-aa8c-6384-d970-5057fb933b03@windriver.com>
	<73d8e805-380f-874b-82b2-7d8c6269d46f@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 13 Jul 2017 21:57:05 -0400
Message-ID: <CADkTA4N=dHMO5pauO4KpzP7YvxSw2tzihPpbX+jnb+R3M97obQ@mail.gmail.com>
To: Cal Sullivan <california.l.sullivan@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] linux-yocto/4.1: update to v4.1.41
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
X-List-Received-Date: Fri, 14 Jul 2017 01:57:08 -0000
Content-Type: multipart/alternative; boundary="f403045ec306bbf79805543d5dc0"

--f403045ec306bbf79805543d5dc0
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 13, 2017 at 4:57 PM, Cal Sullivan <
california.l.sullivan@intel.com> wrote:

> It occurred with qemux86-64 rather than genericx86-64, so your new patch
> for 4.1 should fix it.
>

that explains my confusion. I wonder if I wandered into the wrong
autobuilder link .. I did have
to browse around a bit :D

Bruce


>
> ---
> Cal
>
>
> On 07/13/2017 09:50 AM, Bruce Ashfield wrote:
>
>> On 07/13/2017 12:40 PM, Burton, Ross wrote:
>>
>>>
>>> On 13 July 2017 at 17:33, Bruce Ashfield <bruce.ashfield@windriver.com
>>> <mailto:bruce.ashfield@windriver.com>> wrote:
>>>
>>>     How would you like the fix, a completely new patch, or an incremental
>>>     fix on my branch ?
>>>
>>>
>>>
>> Sent.
>>
>> Note: It says "v2", but I did change the shortlog to reference 4.1.42
>> versus 4.1.41.
>>
>> Since I'm still not building AUTOREV for this (I'll start that now to
>> try and trigger the issue), the fix is by visual inspection only.
>>
>> Anyone building poky-lsb by the SRCREVs should still get 4.1.39 versus
>> this updated kernel. SRCREV updates to the yocto-bsp layer still need
>> to follow.
>>
>> Bruce
>>
>> A replacement patch please, it's not in master yet.
>>>
>>> Ross
>>>
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f403045ec306bbf79805543d5dc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jul 13, 2017 at 4:57 PM, Cal Sullivan <span dir=3D"ltr">&lt;<a =
href=3D"mailto:california.l.sullivan@intel.com" target=3D"_blank">californi=
a.l.sullivan@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">It occurred with qemux86-64 rather than genericx86-64, so your new patc=
h for 4.1 should fix it.<br></blockquote><div><br></div><div>that explains =
my confusion. I wonder if I wandered into the wrong autobuilder link .. I d=
id have</div><div>to browse around a bit :D</div><div><br></div><div>Bruce<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
---<br>
Cal<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 07/13/2017 09:50 AM, Bruce Ashfield wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 07/13/2017 12:40 PM, Burton, Ross wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
On 13 July 2017 at 17:33, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfie=
ld@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a> &lt;ma=
ilto:<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruc=
e.ashfield@windriv<wbr>er.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 How would you like the fix, a completely new patch, or an inc=
remental<br>
=C2=A0 =C2=A0 fix on my branch ?<br>
<br>
<br>
</blockquote>
<br>
Sent.<br>
<br>
Note: It says &quot;v2&quot;, but I did change the shortlog to reference 4.=
1.42<br>
versus 4.1.41.<br>
<br>
Since I&#39;m still not building AUTOREV for this (I&#39;ll start that now =
to<br>
try and trigger the issue), the fix is by visual inspection only.<br>
<br>
Anyone building poky-lsb by the SRCREVs should still get 4.1.39 versus<br>
this updated kernel. SRCREV updates to the yocto-bsp layer still need<br>
to follow.<br>
<br>
Bruce<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
A replacement patch please, it&#39;s not in master yet.<br>
<br>
Ross<br>
</blockquote>
<br>
</blockquote>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--f403045ec306bbf79805543d5dc0--
