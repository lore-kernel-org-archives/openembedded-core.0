Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SMnOU-0004L0-9h
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 23:35:30 +0200
Received: by iaag37 with SMTP id g37so1605373iaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 14:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=wIez1tAwO/A1Nq1HHPilK+UjsUHH1Rx7ISt7AzilURs=;
	b=oOIjcl2M88fKjYMG5WWYD4D83pDRVqfsYQWFvh9oGufKqFUZVDHggqzzv1Iy1YX85U
	bTysxGPHN/9+CDeXOnMPrf4tvzkUjly/zPpokxCLyRqNlB64EABpkE3A4kAEg8POx3Dt
	KmBIKQL+FAeKvaLRe0k/fFHY2tAyYivxxEQuauuHPIt1O6QN0LrWwvxI4mFrRNJ42QYs
	0SkPKHLeN7P9FUmo/KFeqZySySTjMWlvRj4U5dqL/vBBDVIjFn0ROKLhncwe+MjlySMd
	w0/+JqRZsU4VXURjDhBTAz+QWf4pX6KU2gO0KSNbfraM9ALh3NOD83Lh971xLx1BI3vJ
	k2IA==
Received: by 10.50.88.225 with SMTP id bj1mr11874512igb.42.1335302754722; Tue,
	24 Apr 2012 14:25:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.25.18 with HTTP; Tue, 24 Apr 2012 14:25:34 -0700 (PDT)
X-Originating-IP: [79.115.103.32]
In-Reply-To: <CAK18fxG0_-aQDuPMA5drMAA8Kk-bnAPw-THrxafAOM6amvE2hA@mail.gmail.com>
References: <CAK18fxFXyj7U1RgBSigrED+H6BjJjx3uCcWY2nVONCOULxL+iw@mail.gmail.com>
	<CAPhnLPDr2epHUeCjDaeg473mv8cR9jf6gA-BpxT=jU_BDcq3sg@mail.gmail.com>
	<CAK18fxG0_-aQDuPMA5drMAA8Kk-bnAPw-THrxafAOM6amvE2hA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 25 Apr 2012 00:25:34 +0300
Message-ID: <CAK18fxFL9QbK2o-eLrf=rOi7jdzn+HYq8EL1OJC+YKWKX0YbzA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmsgmne3xg+r1TRzo8CP0q0yi+RxYBusTuZVJPXN/WfXF2mdcwCqGlFS5WkOjrl74dVmDSZ
Subject: Re: LICENSE_{X}-xxx is parsed?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2012 21:35:30 -0000
Content-Type: multipart/alternative; boundary=e89a8f2344175ce3cc04be73669b

--e89a8f2344175ce3cc04be73669b
Content-Type: text/plain; charset=ISO-8859-1

Digging into your commit i realized that this is already done. Thank you.

@g

On Wed, Apr 25, 2012 at 00:15, Andrei Gherzan <andrei@gherzan.ro> wrote:

> On Tue, Apr 24, 2012 at 20:44, Flanagan, Elizabeth <
> elizabeth.flanagan@intel.com> wrote:
>
>> On Tue, Apr 24, 2012 at 10:25 AM, Andrei Gherzan <andrei@gherzan.ro>
>> wrote:
>> > Hello everybody,
>> >
>> > Is there any mechanism of parsing LICENSE variables for every provided
>> > package in a bb file?
>> >
>> > To be a little more clear about this.
>> >
>> > If i have an app named myapp. Let's say the myapp_1.0.bb includes:
>> > LICENSE = "GPLv3 & LGPLv2.1"
>> > LICENSE_${PN} = LGPLv2.1
>> > LICENSE_${PN} -tests = GPLv3
>> >
>> > If this app is not whitelisted, this file will pe ignored (assuming
>> > INCOMPATIBLE_LICENSE = GPLv3) even if the only needed package on the
>> final
>> > fs is the ${PN} package.
>> >
>>
>> As you have package level licensing set, it will actually check the
>> LICENSE_${PN}. See:
>> bdf2d94c35b7e5ed1723f987696a6c865bff212c Which means it will go and
>> use the PN level
>> license to determine if it should be excluded. If no PN level exists
>> it should fall back to LICENSE
>>
>>
> I realize this but still, what about the rest for packages provided in a
> bb file?
>
>
>>  > For files in these case (like gnults) we use right now WHITELIST. In
>> this
>> > way license checking on those packages is skipped.
>> >
>> > If nobody works on this (or this is already done but i couldn't spot it
>> in
>> > the code) i can dig and propose a way to solve this issue.
>> >
>> > @g
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>>
>>
>>
>> --
>> Elizabeth Flanagan
>> Yocto Project
>> Build and Release
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>

--e89a8f2344175ce3cc04be73669b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra">Digging into your commit i realized that this is=
 already done. Thank you.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">@g<br><br><div class=3D"gmail_quote">On Wed, Apr 25, 20=
12 at 00:15, Andrei Gherzan <span dir=3D"ltr">&lt;<a href=3D"mailto:andrei@=
gherzan.ro" target=3D"_blank">andrei@gherzan.ro</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"gmail_extra"><div class=3D"gma=
il_quote"><div class=3D"im">On Tue, Apr 24, 2012 at 20:44, Flanagan, Elizab=
eth <span dir=3D"ltr">&lt;<a href=3D"mailto:elizabeth.flanagan@intel.com" t=
arget=3D"_blank">elizabeth.flanagan@intel.com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On Tue, Apr 24, 2012 at 10:25 AM, Andre=
i Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro" target=3D"_blank">andrei=
@gherzan.ro</a>&gt; wrote:<br>



&gt; Hello everybody,<br>
&gt;<br>
&gt; Is there any=A0mechanism of parsing LICENSE variables for every provid=
ed<br>
&gt; package in a bb file?<br>
&gt;<br>
&gt; To be a little more clear about this.<br>
&gt;<br>
&gt; If i have an app named myapp. Let&#39;s say the <a href=3D"http://myap=
p_1.0.bb" target=3D"_blank">myapp_1.0.bb</a> includes:<br>
&gt; LICENSE =3D &quot;GPLv3 &amp; LGPLv2.1&quot;<br>
&gt; LICENSE_${PN} =3D LGPLv2.1<br>
&gt; LICENSE_${PN} -tests =3D GPLv3<br>
&gt;<br>
&gt; If this app is not whitelisted, this file will pe ignored (assuming<br=
>
&gt; INCOMPATIBLE_LICENSE =3D GPLv3) even if the only needed package on the=
 final<br>
&gt; fs is the ${PN} package.<br>
&gt;<br>
<br>
</div>As you have package level licensing set, it will actually check the<b=
r>
LICENSE_${PN}. See:<br>
bdf2d94c35b7e5ed1723f987696a6c865bff212c Which means it will go and<br>
use the PN level<br>
license to determine if it should be excluded. If no PN level exists<br>
it should fall back to LICENSE<br>
<div><br></div></blockquote><div><br></div></div><div>I=A0realize=A0this bu=
t still, what about the rest for packages provided in a bb file?</div><div =
class=3D"im"><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">


<div>
&gt; For files in these case (like gnults) we use right now WHITELIST. In t=
his<br>
&gt; way license=A0checking=A0on those packages is skipped.<br>
&gt;<br>
&gt; If nobody works on this (or this is already done but i couldn&#39;t sp=
ot it in<br>
&gt; the code) i can dig and propose a way to solve this issue.<br>
&gt;<br>
&gt; @g<br>
</div>&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
&gt;<br>
<span><font color=3D"#888888"><br>
<br>
<br>
--<br>
Elizabeth Flanagan<br>
Yocto Project<br>
Build and Release<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div></div><br></div>
</blockquote></div><br></div>

--e89a8f2344175ce3cc04be73669b--
