Return-Path: <gary.robertson@linaro.org>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id A69A970964
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 23:41:53 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id ij19so3056848vcb.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 16:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=rIDdEae+jn0HyPyX3tfAPZECZgj4CueoszwerpRSWBE=;
	b=abcgQXeb7Sjy0rhkm2l2YPlrTJCkWdIlxrwWwrUF70ZeRAQRG3zcgmUfamaIduCNpE
	owCnkgks13jOPJP/XkbE+iQIkJOB1VEut+7mYoJnWiTDtEH0ZBD3EqP5Ejn/AsKjxP4s
	EHHwoB1RZxZcbelJrYTsDZyeawxknKHVkzvMmZZjOjgOSBA8P/mS2ldpN4/h2SB7D2p4
	ks6RqZqiZzQ0BDrA1+ZXXKlnGuu6znGY4M59UpODKMkvBBKyEknjBLV+MGy33BObTrTE
	DXxaSsnz3dCJTNkxa+t5a7JSPEnccY1koBxZ1cw62NgXCjZM1+SHsHdEab0iiydrrMef
	0ylQ==
X-Gm-Message-State: ALoCoQmIslBaUErBLZEOJBaG7ek2KjjLy9lT8Yj7k7zhTGDQkODgLIg7M12GhSnyIlH92Ij8ITXC
MIME-Version: 1.0
X-Received: by 10.52.137.2 with SMTP id qe2mr6920935vdb.11.1406763714112; Wed,
	30 Jul 2014 16:41:54 -0700 (PDT)
Received: by 10.58.197.136 with HTTP; Wed, 30 Jul 2014 16:41:54 -0700 (PDT)
In-Reply-To: <CAP9ODKrEFg31WOHO3GyY-sQf2x5i24yLp5CNa3bxSp6H74YarQ@mail.gmail.com>
References: <1406326845-17506-1-git-send-email-gary.robertson@linaro.org>
	<CAP9ODKrEFg31WOHO3GyY-sQf2x5i24yLp5CNa3bxSp6H74YarQ@mail.gmail.com>
Date: Wed, 30 Jul 2014 18:41:54 -0500
Message-ID: <CAF7YWnxfkyGqObsMTC=poUBsxg170_8LC2w62TZ1G1+oUdNyvw@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Mike Holmes <mike.holmes@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] LTP: Realtime test fixes
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
X-List-Received-Date: Wed, 30 Jul 2014 23:41:59 -0000
Content-Type: multipart/alternative; boundary=bcaec51b161b768d0404ff71b3ba

--bcaec51b161b768d0404ff71b3ba
Content-Type: text/plain; charset=UTF-8

Otavio,

I am currently in the process of review for a couple of these patches with
the LTP maintainers, and will re-submit once the dust settles at LTP.

Thanks,

Gary R.


On Fri, Jul 25, 2014 at 6:06 PM, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> Hello Gary,
>
> On Fri, Jul 25, 2014 at 7:20 PM, Gary S. Robertson
> <gary.robertson@linaro.org> wrote:
> > The following series of patches addresses several bugs which were
> preventing
> > some of the LTP realtime tests from running or completing in our OE-based
> > test environments.  The patches themselves are being separately submitted
> > to the upstream LTP maintainers for consideration, and are offered here
> > in hopes of addressing these issues in the OE LTP package until such time
> > as they can be obtained from a subsequent upstream LTP release.
>
> Please prepare a v2 including the Upstream-Status[1] field in the inner
> patches.
>
> 1.
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Headers_and_Commit_Messages
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

--bcaec51b161b768d0404ff71b3ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Otavio,<br><br></div>I am currently in the =
process of review for a couple of these patches with the LTP maintainers, a=
nd will re-submit once the dust settles at LTP.<br><br></div>Thanks,<br><br=
>
</div>Gary R.<br></div><div class=3D"gmail_extra"><br><br><div class=3D"gma=
il_quote">On Fri, Jul 25, 2014 at 6:06 PM, Otavio Salvador <span dir=3D"ltr=
">&lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@o=
ssystems.com.br</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hello Gary,<br>
<div class=3D""><br>
On Fri, Jul 25, 2014 at 7:20 PM, Gary S. Robertson<br>
&lt;<a href=3D"mailto:gary.robertson@linaro.org">gary.robertson@linaro.org<=
/a>&gt; wrote:<br>
&gt; The following series of patches addresses several bugs which were prev=
enting<br>
&gt; some of the LTP realtime tests from running or completing in our OE-ba=
sed<br>
&gt; test environments. =C2=A0The patches themselves are being separately s=
ubmitted<br>
&gt; to the upstream LTP maintainers for consideration, and are offered her=
e<br>
&gt; in hopes of addressing these issues in the OE LTP package until such t=
ime<br>
&gt; as they can be obtained from a subsequent upstream LTP release.<br>
<br>
</div>Please prepare a v2 including the Upstream-Status[1] field in the inn=
er patches.<br>
<br>
1. <a href=3D"http://www.openembedded.org/wiki/Commit_Patch_Message_Guideli=
nes#Patch_Headers_and_Commit_Messages" target=3D"_blank">http://www.openemb=
edded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Headers_and_Commit_Mes=
sages</a><br>

<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.=
com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</font></span></blockquote></div><br></div>

--bcaec51b161b768d0404ff71b3ba--
