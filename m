Return-Path: <naresh.bhat@linaro.org>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id A311A65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 09:47:21 +0000 (UTC)
Received: by oier21 with SMTP id r21so60298793oie.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 02:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Q0cezj00PG9Lm6xWJLXlEL9I/zVsaaYHGxjlttwmhAo=;
	b=aV4NAi7gWum6+1XTInDPlLJuOislJHKn0E08T/bmZYrDZYiIStthu78lNPMeMfIIay
	8WmwOq4k7wYZ+/jXwNyMP7ZAd1MI4ZTHmL/itCWeUk0FvFfcR/GFOWv7EY4uBVL75KA4
	5SDsiyCrAeWTUDAW09Ix/lMm8zDM/YmJYml4+5qvowtgOk4lVO09ebJrTw8WQDflJmk/
	yBKWYIS+w6rogT8wFHzwB/EaqZHPHmy6iFoPrtXb4Bdd97QsXrAEwUdgcKKPK8+HtdNV
	myLB5N70CSe932TkkjJlSyWlyflHZTsotYuozySTtD/EiHM5xw1wFu3jVALihnBmInNQ
	orfw==
X-Gm-Message-State: ALoCoQmKPmSPtE3C9k40d3Dx3G18yreIjqBL3fGtvs9h7zofwAGC6LMjKP+XL4ZwUOZFxD12SOvB
MIME-Version: 1.0
X-Received: by 10.202.9.132 with SMTP id 126mr57412482oij.77.1426758442121;
	Thu, 19 Mar 2015 02:47:22 -0700 (PDT)
Received: by 10.60.99.6 with HTTP; Thu, 19 Mar 2015 02:47:22 -0700 (PDT)
In-Reply-To: <CAFoFrHa4BC3yH4NmSyNqn_P1A64o+Xpja+HrcT3P_Zszn69s4Q@mail.gmail.com>
References: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
	<1426678029-19516-4-git-send-email-naresh.bhat@linaro.org>
	<CAC1BbcTHOXPNLyWBLYkNW5=4qMRGjF=XgMB=R-nZ=PSfCJA0hw@mail.gmail.com>
	<CAFoFrHa4BC3yH4NmSyNqn_P1A64o+Xpja+HrcT3P_Zszn69s4Q@mail.gmail.com>
Date: Thu, 19 Mar 2015 15:17:22 +0530
Message-ID: <CAFoFrHYdbOOACdGg9FrL0JAiR7AHfABmBjqRd2e5+9QHi2_RnA@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: Matt Fleming <matt.fleming@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core v2 PATCH 3/5] bootimg: Skip iso image build on aarch64
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
X-List-Received-Date: Thu, 19 Mar 2015 09:47:23 -0000
Content-Type: multipart/alternative; boundary=001a113d10241fa83f0511a11613

--001a113d10241fa83f0511a11613
Content-Type: text/plain; charset=UTF-8

Hi Bernhard Reutner-Fischer,

On 18 March 2015 at 18:12, Naresh Bhat <naresh.bhat@linaro.org> wrote:

>
>
> On 18 March 2015 at 18:05, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com
> > wrote:
>
>> On 18 March 2015 at 12:27, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>> > To generate bootable ISO image the x86 architecture uses syslinux
>> package (syslinux/isolinux.bin).
>> > We have already skip the syslinux package on aarch64.  Hence skip the
>> iso image build on aarch64.
>> >
>> > Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
>> > ---
>> >  meta/classes/bootimg.bbclass |    1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
>> > index ed7b32f..5a8e70c 100644
>> > --- a/meta/classes/bootimg.bbclass
>> > +++ b/meta/classes/bootimg.bbclass
>> > @@ -33,6 +33,7 @@ do_bootimg[depends] +=
>> "dosfstools-native:do_populate_sysroot \
>> >
>> >  PACKAGES = " "
>> >  EXCLUDE_FROM_WORLD = "1"
>> > +NOISO_aarch64 = "1"
>>
>> how does that help !COMPATIBLE_HOST (of syslinux) except aarch64?
>>
>> I meant you to
>> def mycheck(d):
>>   h = d.getVar('COMPATIBLE_HOST', True)
>>   if h:
>>     t = d.getVar('TARGET_ARCH', True)
>>     if re.match(h, t):
>>       return 0
>>   return 1
>>
>> and use that to set NOISO ?= "${@mycheck(d)}"
>> (modulo typos and testing)
>>
>> I think something like that should work and i think this would be
>> preferable to adding all those upcoming NOISO_baz
>> See what i mean?
>>
> Thank you very much.  I will do it right now, test with luvos
> distribution, re-post this patch.
>

I have implemented and tried it with luvOS distribution.

def check_iso_build(d):
       host = d.getVar('COMPATIBLE_HOST', True)
       if host:
            import re
            target = d.getVar('TARGET_ARCH', True)
            if re.match(host, target):
                return 0
       return 1

NOISO ?= "${@check_iso_build(d)}"


For the following reason

The COMPATIBLE_HOST value is NULL.  Now the question is why it contains
value NULL.  That's simply because syslinux recipe does not inherit
bootimg.bbclass.

I did following experiment - The luv-live-image.bb inherit the
bootimg.bbclass hence I have defined the COMPATIBLE_HOST as "x86" or
"aarch64" depending on the build I am doing. This will work for x86
architecture but definitely going to break for aarch64  because of the
below condition

if re.match(host, target):
                return 0

Let me know If I need to experiment/change the logic of the implementation.

>
>> thanks,
>>
>
>

--001a113d10241fa83f0511a11613
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bernhard Reutner-Fischer,<br><div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On 18 March 2015 at 18:12, Naresh Bhat=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:naresh.bhat@linaro.org" target=3D"=
_blank">naresh.bhat@linaro.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote"><div><div class=3D"h5">On 18 March 201=
5 at 18:05, Bernhard Reutner-Fischer <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>=
On 18 March 2015 at 12:27, Naresh Bhat &lt;<a href=3D"mailto:naresh.bhat@li=
naro.org" target=3D"_blank">naresh.bhat@linaro.org</a>&gt; wrote:<br>
&gt; To generate bootable ISO image the x86 architecture uses syslinux pack=
age (syslinux/isolinux.bin).<br>
&gt; We have already skip the syslinux package on aarch64.=C2=A0 Hence skip=
 the iso image build on aarch64.<br>
&gt;<br>
&gt; Signed-off-by: Naresh Bhat &lt;<a href=3D"mailto:naresh.bhat@linaro.or=
g" target=3D"_blank">naresh.bhat@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/bootimg.bbclass |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbcla=
ss<br>
&gt; index ed7b32f..5a8e70c 100644<br>
&gt; --- a/meta/classes/bootimg.bbclass<br>
&gt; +++ b/meta/classes/bootimg.bbclass<br>
&gt; @@ -33,6 +33,7 @@ do_bootimg[depends] +=3D &quot;dosfstools-native:do_=
populate_sysroot \<br>
&gt;<br>
&gt;=C2=A0 PACKAGES =3D &quot; &quot;<br>
&gt;=C2=A0 EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt; +NOISO_aarch64 =3D &quot;1&quot;<br>
<br>
</div></div>how does that help !COMPATIBLE_HOST (of syslinux) except aarch6=
4?<br>
<br>
I meant you to<br>
def mycheck(d):<br>
=C2=A0 h =3D d.getVar(&#39;COMPATIBLE_HOST&#39;, True)<br>
=C2=A0 if h:<br>
=C2=A0 =C2=A0 t =3D d.getVar(&#39;TARGET_ARCH&#39;, True)<br>
=C2=A0 =C2=A0 if re.match(h, t):<br>
=C2=A0 =C2=A0 =C2=A0 return 0<br>
=C2=A0 return 1<br>
<br>
and use that to set NOISO ?=3D &quot;${@mycheck(d)}&quot;<br>
(modulo typos and testing)<br>
<br>
I think something like that should work and i think this would be<br>
preferable to adding all those upcoming NOISO_baz<br>
See what i mean?<br></blockquote></div></div><div>Thank you very much.=C2=
=A0 I will do it right now, test with luvos distribution, re-post this patc=
h. <br></div></div></div></div></blockquote><div>=C2=A0</div><div>I have im=
plemented and tried it with luvOS distribution.=C2=A0 <br><br>def check_iso=
_build(d):<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 host =3D d.getVar(&#39;C=
OMPATIBLE_HOST&#39;, True)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if host:=
<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 impo=
rt re<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 target =3D d.getVar(&#39;TARGET_ARCH&#39;, True)<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if re.match(host, target):<br=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return 0<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return =
1<br><br>NOISO ?=3D &quot;${@check_iso_build(d)}&quot;<br><br><br>For the f=
ollowing reason<br><br></div><div>The COMPATIBLE_HOST value is NULL.=C2=A0 =
Now the question is why it contains value NULL.=C2=A0 That&#39;s simply bec=
ause syslinux recipe does not inherit bootimg.bbclass.<br><br>I did followi=
ng experiment - The <a href=3D"http://luv-live-image.bb">luv-live-image.bb<=
/a> inherit the bootimg.bbclass hence I have defined the COMPATIBLE_HOST as=
 &quot;x86&quot; or &quot;aarch64&quot; depending on the build I am doing. =
This will work for x86 architecture but definitely going to break for aarch=
64=C2=A0 because of the below condition<br><br>if re.match(host, target):<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return 0<br>=C2=A0<br></div><div>Let me know If I need t=
o experiment/change the logic of the implementation.<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_e=
xtra"><div class=3D"gmail_quote"><div></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
thanks,<br>
</blockquote></div><br></div></div>
</blockquote></div><br></div></div></div>

--001a113d10241fa83f0511a11613--
