Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3783B74A32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 05:42:22 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n10-v6so18449365wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 22:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n2yAv1nLrUhWuy5ZsSXHhAraB5DO94RTGhjfD48faDA=;
	b=L505x/mt7QytI+70LfT9IRvr8pL34bJoeopCZOFe8DFwHFB0Zx9PajFgBenEIifPy0
	r+30j8pIWkhdhjEtI+Yn3tZeUPiTJqlJ6uR4fFOI/TDFC8xtdX/b5wn030uLtGb1X3Gc
	8uzRpYctuYqTKipax+BtYhWg9E8/QmRj26banTwfC1+OpTglOIVM7dFXvFJz903xLVo/
	ACB8UJKGNe5IkjXakyTfp+OyoijIiH84t1V660sqTK8T23xfbLloI6w82m3364OfqX2V
	Kb6xNLl+sry8SXwPQVYYx780mLLQ5KI4+RZlhAPE8aLdesRd/UcuSvXUtzE9WACqBg8T
	BZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n2yAv1nLrUhWuy5ZsSXHhAraB5DO94RTGhjfD48faDA=;
	b=Sb+hRpnRb4V5WWsXrbzPqjGRmz6ifiHW3yPiKz1NoC38qopbYHOug1+iq6OQR8sKsy
	C3WYP8TmFLn+Y2Guu+KJkjRNFAIU5+uuvjQsc45TT1uZ4J2MmLHAmAoZTnPrRFIuuqY6
	9Bp3R5PtfFt7OKFMtw051gckfChWzEGlRZudw2+DKz5xmFaDtSNYeETgx/4ShrilO3RW
	n/+T0HUmtJ6r3vNlUP3Pj7qIZOa+QXajVy+gmsqG//+AIffkHmezRWe2THEBoX9qD/8z
	q/RU66uOf7MZA6GBQy/+1u18EBVbsLiS1dDrmz5mLTAn79bvE6hxtes7CJT5G/2JIduK
	HCEQ==
X-Gm-Message-State: ALKqPwcvRUqJ2OsPewB9WlhiIiq9ND+yJH3JabMmPCeKOKNLn8OlP8Ni
	yldtWzWhGKApAvT8YHBy7GAZI5JQcr4EK0os83A=
X-Google-Smtp-Source: AB8JxZpohZPifFaaJS8vmFm5CZaEIZoBRfO0StkgZpKxn/RXDdZt6yPnTql8RN5aFrn7ZW/3afShibUf0uRjyTiQDpY=
X-Received: by 2002:a1c:bfce:: with SMTP id
	o75-v6mr5706372wmi.122.1526708543344; 
	Fri, 18 May 2018 22:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <1526683840-20390-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1so7fh4Vc9-KkeQpjArm+Wzj4g=OOzsD3qChiWnV_q0Wuw@mail.gmail.com>
In-Reply-To: <CAMKF1so7fh4Vc9-KkeQpjArm+Wzj4g=OOzsD3qChiWnV_q0Wuw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 19 May 2018 07:42:11 +0200
Message-ID: <CA+chaQcfHGsQH62shk9uzu5kx1ArCs05Bq8dODsr30LVD67j+Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-armv7a.inc: default to Thumb2 instruction set for armv7a and above
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
X-List-Received-Date: Sat, 19 May 2018 05:42:23 -0000
Content-Type: multipart/alternative; boundary="00000000000066d4ac056c8888b0"

--00000000000066d4ac056c8888b0
Content-Type: text/plain; charset="UTF-8"

This variable was always meant to be used from DISTRO config, why not add
it to:
oe-core/meta/conf/distro/include/default-distrovars.inc
or
oe-core/meta/conf/distro/include/tcmode-default.inc

?

On Sat, May 19, 2018 at 1:40 AM Khem Raj <raj.khem@gmail.com> wrote:

>
> On Fri, May 18, 2018 at 3:50 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> Although there may still be specific cases which can benefit from the
>> ARM instruction set, the Thumb2 instruction set is generally a better
>> default for armv7a class CPUs. Distros such as Debian and Fedora have
>> been targeting Thumb2 by default for some time.
>>
>> Note that setting ARM_INSTRUCTION_SET has no effect unless
>> TUNE_FEATURES contains "thumb" (which is controlled by the "t" suffix
>> in DEFAULTTUNE, e.g. armv7vehf-neon -vs- armv7vethf-neon, etc) so out
>> of tree machine configs may need to update their DEFAULTTUNE to take
>> advantage of this change.
>
>
>
> I think this is a good change and we shoudl take it in thumb2 is default
> ISA
> for other major distros as well
>
> Oe based distros who ship feeds might be affected
>
>>
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/conf/machine/include/arm/arch-armv7a.inc | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
>> b/meta/conf/machine/include/arm/arch-armv7a.inc
>> index bad1c27..a2663d8 100644
>> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>> @@ -1,4 +1,5 @@
>>  DEFAULTTUNE ?= "armv7athf"
>> +ARM_INSTRUCTION_SET ?= "thumb"
>>
>>  TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
>>  TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000066d4ac056c8888b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This variable was always meant to be used from DISTRO conf=
ig, why not add it to:<div>oe-core/meta/conf/distro/include/default-distrov=
ars.inc<br></div><div>or</div><div>oe-core/meta/conf/distro/include/tcmode-=
default.inc<br></div><div><br></div><div>?</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr">On Sat, May 19, 2018 at 1:40 AM Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div><br><div class=3D"gmail_quote"><div =
dir=3D"auto">On Fri, May 18, 2018 at 3:50 PM Andre McCurdy &lt;<a href=3D"m=
ailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Although there may still be sp=
ecific cases which can benefit from the<br>
ARM instruction set, the Thumb2 instruction set is generally a better<br>
default for armv7a class CPUs. Distros such as Debian and Fedora have<br>
been targeting Thumb2 by default for some time.<br>
<br>
Note that setting ARM_INSTRUCTION_SET has no effect unless<br>
TUNE_FEATURES contains &quot;thumb&quot; (which is controlled by the &quot;=
t&quot; suffix<br>
in DEFAULTTUNE, e.g. armv7vehf-neon -vs- armv7vethf-neon, etc) so out<br>
of tree machine configs may need to update their DEFAULTTUNE to take<br>
advantage of this change.</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I think this is a good change and we =
shoudl take it in thumb2 is default ISA=C2=A0</div><div dir=3D"auto">for ot=
her major distros as well=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Oe based distros who ship feeds might be affected=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><br>
<br>
Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com" tar=
get=3D"_blank">armccurdy@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/arm/arch-armv7a.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/mach=
ine/include/arm/arch-armv7a.inc<br>
index bad1c27..a2663d8 100644<br>
--- a/meta/conf/machine/include/arm/arch-armv7a.inc<br>
+++ b/meta/conf/machine/include/arm/arch-armv7a.inc<br>
@@ -1,4 +1,5 @@<br>
=C2=A0DEFAULTTUNE ?=3D &quot;armv7athf&quot;<br>
+ARM_INSTRUCTION_SET ?=3D &quot;thumb&quot;<br>
<br>
=C2=A0TUNEVALID[armv7a] =3D &quot;Enable instructions for ARMv7-a&quot;<br>
=C2=A0TUNECONFLICTS[armv7a] =3D &quot;armv4 armv5 armv6 armv7&quot;<br>
-- <br>
1.9.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000066d4ac056c8888b0--
