Return-Path: <gary.robertson@linaro.org>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 879B46FF24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 21:43:07 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so85855wib.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=i8TkZyAwxl9kOngW67/Q8dfglB78dM9vivYaLcLmboI=;
	b=EwdVJd8xCe9Y1HXHT4lUPF59UOcz8dlnwCs52D7ahVvviE++GKclOo7keSwbQvvaLi
	FUa0yDQIXGA27wqBKmvsKwK5P1+VrbIfYOStpX6arMoByPwSllSZ4gS84LUQLOy/3SVw
	Yig+mjwHqRSgcC5aKHGMjDi8aLGezJVFab9QZHmMDolSvT7iz1xf9AMj+nbsCZGh3TgY
	CeMeOa75E1CdQW/QzHgNI8G3x4YH3TGjRzYUBBDGMQjTzB6Wv4OqHXo/GasQZN6Dab1z
	UQM9zbnKM+HgKF2lwp3jwm8ljc7mcaPESzpSkWw+o0HF/eDNciNS1liXj19BVs40I6QM
	piRw==
X-Gm-Message-State: ALoCoQnC05qWDqbtW6g/i1EYP+/U4ztfluTjD0yDoRoyp6n0sVoibpdJZo6C1BuxmhhydXKAH08Z
MIME-Version: 1.0
X-Received: by 10.194.62.104 with SMTP id x8mr16010296wjr.7.1408052587936;
	Thu, 14 Aug 2014 14:43:07 -0700 (PDT)
Received: by 10.216.120.72 with HTTP; Thu, 14 Aug 2014 14:43:07 -0700 (PDT)
In-Reply-To: <CAF7YWnxfkyGqObsMTC=poUBsxg170_8LC2w62TZ1G1+oUdNyvw@mail.gmail.com>
References: <1406326845-17506-1-git-send-email-gary.robertson@linaro.org>
	<CAP9ODKrEFg31WOHO3GyY-sQf2x5i24yLp5CNa3bxSp6H74YarQ@mail.gmail.com>
	<CAF7YWnxfkyGqObsMTC=poUBsxg170_8LC2w62TZ1G1+oUdNyvw@mail.gmail.com>
Date: Thu, 14 Aug 2014 16:43:07 -0500
Message-ID: <CAF7YWnwgg1JWYBLOcBfFGX9_cG+YZLteUPRDOSWF7T=FQ-8G5A@mail.gmail.com>
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
X-List-Received-Date: Thu, 14 Aug 2014 21:43:14 -0000
Content-Type: multipart/alternative; boundary=047d7b86ed6254553a05009dca3c

--047d7b86ed6254553a05009dca3c
Content-Type: text/plain; charset=UTF-8

After exchanges with the LTP maintainers and further reflection, I find
some of the patches submitted here are inappropriate for submission at the
OE level.
Consequently I wish to drop this email thread and submit those patches
which I believe should be applied at the OE level as separate submissions.
Thank you all for your responses.


On Wed, Jul 30, 2014 at 6:41 PM, Gary Robertson <gary.robertson@linaro.org>
wrote:

> Otavio,
>
> I am currently in the process of review for a couple of these patches with
> the LTP maintainers, and will re-submit once the dust settles at LTP.
>
> Thanks,
>
> Gary R.
>
>
> On Fri, Jul 25, 2014 at 6:06 PM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>
>> Hello Gary,
>>
>> On Fri, Jul 25, 2014 at 7:20 PM, Gary S. Robertson
>> <gary.robertson@linaro.org> wrote:
>> > The following series of patches addresses several bugs which were
>> preventing
>> > some of the LTP realtime tests from running or completing in our
>> OE-based
>> > test environments.  The patches themselves are being separately
>> submitted
>> > to the upstream LTP maintainers for consideration, and are offered here
>> > in hopes of addressing these issues in the OE LTP package until such
>> time
>> > as they can be obtained from a subsequent upstream LTP release.
>>
>> Please prepare a v2 including the Upstream-Status[1] field in the inner
>> patches.
>>
>> 1.
>> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Headers_and_Commit_Messages
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>>
>
>

--047d7b86ed6254553a05009dca3c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>After exchanges with the LTP maintainers and fur=
ther reflection, I find some of the patches submitted here are inappropriat=
e for submission at the OE level.<br></div>Consequently I wish to drop this=
 email thread and submit those patches which I believe should be applied at=
 the OE level as separate submissions.<br>
</div>Thank you all for your responses.<br></div><div class=3D"gmail_extra"=
><br><br><div class=3D"gmail_quote">On Wed, Jul 30, 2014 at 6:41 PM, Gary R=
obertson <span dir=3D"ltr">&lt;<a href=3D"mailto:gary.robertson@linaro.org"=
 target=3D"_blank">gary.robertson@linaro.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div>Otavio,<br><=
br></div>I am currently in the process of review for a couple of these patc=
hes with the LTP maintainers, and will re-submit once the dust settles at L=
TP.<br>
<br></div>Thanks,<br><br>
</div>Gary R.<br></div><div class=3D"HOEnZb"><div class=3D"h5"><div class=
=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fri, Jul 25, 2014 at=
 6:06 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio@os=
systems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;</span> wr=
ote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hello Gary,<br>
<div><br>
On Fri, Jul 25, 2014 at 7:20 PM, Gary S. Robertson<br>
&lt;<a href=3D"mailto:gary.robertson@linaro.org" target=3D"_blank">gary.rob=
ertson@linaro.org</a>&gt; wrote:<br>
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


<span><font color=3D"#888888"><br>
--<br>
Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.=
com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
" target=3D"_blank">+55 (53) 9981-7854</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Mobile: <a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+134=
79039750" target=3D"_blank">+1 (347) 903-9750</a><br>

</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--047d7b86ed6254553a05009dca3c--
