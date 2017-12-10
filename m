Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 78B8478489
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Dec 2017 17:40:21 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id w10so32646418qtb.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Dec 2017 09:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N7D0vwY0W7XE7f90DU69BYOb0MWm6+Tobo2XFXMhbhU=;
	b=EMy6nvcknmqU95ICK6vtDAbIlAg+9AhBAKZfvUvdGOPcWMK+UCRYGx0Ni4wEA+/Kg2
	WSYL47mna0GYllhmWCp78nV/4uN9dpIkFj45SRspwlMyW2nvlb4VpMCCA/xJjzg6tbje
	TukWYAPwhJAPe72as1LilgS7QxBjRznyqJfF2BVodlU6UwXZ4h9GsgkWmlWU0fVzoqh/
	KLzusuwQ3MQ44+Ets5iK02v4BFF4lMkix0QJm4y1Ydk00Dpg57cD1McuzLD8Yo6MSTUT
	FUGYPfg7sXwOV5yPRtCZaJiINkJkrq3vGxe5/QZR/ayTvQjMS48HL/dOHid0cOlTYYBd
	rkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N7D0vwY0W7XE7f90DU69BYOb0MWm6+Tobo2XFXMhbhU=;
	b=B2npq06d4gcdCUfHCT2/YTraFe7uEmao1aqa8i685IVhyUx51blYLoG96NHfked29q
	M0hjcy/hCmLcEg9mt7DHYfg4yg/PivNXQJ3Lw11dBQotmHhnl0u7MhTSuROh8axZMfAZ
	w13k/gl8vNTUpSRxRMDLRPqhZrmIxayLf7OoKnlnXc9e/r9/5JCm/dCAiz4DnhtQ0kkg
	5jf6gWMz5uzWMHrQynA+yNO4vewij1vcgSyAE9Zo7Ljo+wUDoAtUXbyhwmaVGJCfKG8c
	1tG+cufZonJDnTIJVQRybazHNud2BaxcmH3zUQ3bpJybPvWbCWaEBQYnm7H+dFm2H3m9
	jSPA==
X-Gm-Message-State: AKGB3mJlUHEGKi7vWfrLG6wQNDAXq2V0OzWCEs6KbewOaPtSJ4/VAjlR
	9wFZ6QFhiKEvJ4FldYZDuJXuMBhs2LDG8vmmUJk=
X-Google-Smtp-Source: AGs4zMYRAvJjtFLpeSq6tB4rh1vZug/SEreqDDiB1jzv9P5pfdSDQu0HzEUXfTtvejAvdssvm/Skax8ekec8N2lY9ec=
X-Received: by 10.237.62.67 with SMTP id m3mr24652205qtf.289.1512927623156;
	Sun, 10 Dec 2017 09:40:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Sun, 10 Dec 2017 09:40:22 -0800 (PST)
In-Reply-To: <CADkTA4OM1CS3Z0Ta0X86zvv-gJazb51fSM3Cvd1JUQs+jWZ+dQ@mail.gmail.com>
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
	<1512909166.19417.134.camel@linuxfoundation.org>
	<CADkTA4OM1CS3Z0Ta0X86zvv-gJazb51fSM3Cvd1JUQs+jWZ+dQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 10 Dec 2017 12:40:22 -0500
Message-ID: <CADkTA4MZUx+7QzTqBgnTmd7=MuyKSdaiUyvYn243dhjZ=yGXSg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 0/8] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Sun, 10 Dec 2017 17:40:22 -0000
Content-Type: multipart/alternative; boundary="001a114455de8c97be055fffe938"

--001a114455de8c97be055fffe938
Content-Type: text/plain; charset="UTF-8"

So that was really qemux86-64 build + login ? I may have read the test logs
wrong. Since I can boot and login.

[  OK  ] Started Update UTMP about System Runlevel Changes.


Poky (Yocto Project Reference Distro) 2.4+snapshot qemux86-64 ttyS0


qemux86-64 login: root

root@qemux86-64:~# uname -a

Linux qemux86-64 4.12.16-yocto-standard #1 SMP PREEMPT Sun Dec 10 10:31:40
EST 2017 x86_64 GNU/Linux

root@qemux86-64:~#

I will try the oe-self test technique next.

Bruce

On Sun, Dec 10, 2017 at 10:16 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Sun, Dec 10, 2017 at 7:32 AM, Richard Purdie <richard.purdie@
> linuxfoundation.org> wrote:
>
>> On Mon, 2017-12-04 at 10:39 -0500, Bruce Ashfield wrote:
>> > Here is the latest set of kernel updates and bug fixes to the kernel-
>> > yocto
>> > build.
>> >
>> > The 4.9 and 4.12 updates are routine -stable updates. I realize we
>> > are
>> > still fighting some boot/hang issues with 4.12, but I didn't see any
>> > new issues with the 4.12 updates, so I included them in this pull
>> > request.
>> >
>> > I've also included Saul's in-tree defconfig fixes + one additional
>> > patch
>> > of my own.
>> >
>> > I also bump linux-yocto-dev to 4.15-rcX, which brought in some build
>> > issues due to x86 ORC_UNWINDER changes, and ssl cert generation. I've
>> > added the new dependencies directly in the linux-yocto-dev recipe,
>> > but
>> > they will very likely have to move lower into the stack over time.
>> >
>> > I have some additional, structural changes that are coming shortly,
>> > but I'm traveling for the next 5 days and will send them when I
>> > return.
>>
>> I tried this series, minus the -dev kernel change in -next and we see:
>>
>> https://autobuilder.yocto.io/builders/nightly-oe-selftest/bu
>> ilds/676/steps/Running%20oe-selftest/logs/stdio
>>
>> The duplicate logging bug makes it hard to read but the key takeaway is:
>>
>> 2017-12-09 10:49:53,667 - oe-selftest - INFO - Ran 317 tests in 14099.939s
>> 2017-12-09 10:49:53,667 - oe-selftest - INFO -  (failures=16, skipped=1)
>>
>> I can reproduce easily with:
>>
>> oe-selftest -r runqemu.RunqemuTests.test_boot_deploy
>>
>> which fails locally too. If I revert "linux-yocto/4.12: update to
>> v4.12.16" it works.
>>
>> The test checks if it can login over the serial port so I'm guessing
>> some serial driver either got turned off or regressed?
>>
>
> I can try the same thing here, but obviously I never send the series if I
> can't
> boot and log into the qemu instances .. and I only ever use serial for
> that.
>
> Hopefully I get the same error so I can debug locally.
>
> Bruce
>
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114455de8c97be055fffe938
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So that was really qemux86-64 build + login ? I may have r=
ead the test logs wrong. Since I can boot and login.<div><br></div><div><di=
v>







<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:normal;font-stretch:nor=
mal;font-size:12px;line-height:normal;font-family:&quot;Andale Mono&quot;;c=
olor:rgb(200,200,200);background-color:rgba(0,0,0,0.94)"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures">[</span><span c=
lass=3D"gmail-s2" style=3D"font-variant-ligatures:no-common-ligatures;color=
:rgb(52,188,38)"><span class=3D"gmail-Apple-converted-space">=C2=A0 </span>=
OK<span class=3D"gmail-Apple-converted-space">=C2=A0 </span></span><span cl=
ass=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures">] Sta=
rted Update UTMP about System Runlevel Changes.</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:normal;font-stretch:nor=
mal;font-size:12px;line-height:normal;font-family:&quot;Andale Mono&quot;;c=
olor:rgb(200,200,200);background-color:rgba(0,0,0,0.94);min-height:14px"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
></span><br></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:normal;font-stretch:nor=
mal;font-size:12px;line-height:normal;font-family:&quot;Andale Mono&quot;;c=
olor:rgb(200,200,200);background-color:rgba(0,0,0,0.94)"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures">Poky (Yocto Pro=
ject Reference Distro) 2.4+snapshot qemux86-64 ttyS0</span></p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:normal;font-stretch:nor=
mal;font-size:12px;line-height:normal;font-family:&quot;Andale Mono&quot;;c=
olor:rgb(200,200,200);background-color:rgba(0,0,0,0.94);min-height:14px"><s=
pan class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-ligatures"=
></span><br></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:normal;font-stretch:nor=
mal;font-size:12px;line-height:normal;font-family:&quot;Andale Mono&quot;;c=
olor:rgb(200,200,200);background-color:rgba(0,0,0,0.94)"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures">qemux86-64 logi=
n: root</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:normal;font-stretch:nor=
mal;font-size:12px;line-height:normal;font-family:&quot;Andale Mono&quot;;c=
olor:rgb(200,200,200);background-color:rgba(0,0,0,0.94)"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures">root@qemux86-64=
:~# uname -a</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:normal;font-stretch:nor=
mal;font-size:12px;line-height:normal;font-family:&quot;Andale Mono&quot;;c=
olor:rgb(200,200,200);background-color:rgba(0,0,0,0.94)"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures">Linux qemux86-6=
4 4.12.16-yocto-standard #1 SMP PREEMPT Sun Dec 10 10:31:40 EST 2017 x86_64=
 GNU/Linux</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:normal;font-stretch:nor=
mal;font-size:12px;line-height:normal;font-family:&quot;Andale Mono&quot;;c=
olor:rgb(200,200,200);background-color:rgba(0,0,0,0.94)"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures">root@qemux86-64=
:~#<span class=3D"gmail-Apple-converted-space">=C2=A0</span></span></p></di=
v></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I w=
ill try the oe-self test technique next.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Bruce</div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Sun, Dec 10, 2017 at 10:16 AM, Bruce Ashfie=
ld <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote"><div><div class=3D"h5">On Sun, Dec 10, 2017 at 7:32 A=
M, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@<wbr>linuxfoundation.or=
g</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On Mon, 201=
7-12-04 at 10:39 -0500, Bruce Ashfield wrote:<br>
&gt; Here is the latest set of kernel updates and bug fixes to the kernel-<=
br>
&gt; yocto<br>
&gt; build.<br>
&gt;<br>
&gt; The 4.9 and 4.12 updates are routine -stable updates. I realize we<br>
&gt; are<br>
&gt; still fighting some boot/hang issues with 4.12, but I didn&#39;t see a=
ny<br>
&gt; new issues with the 4.12 updates, so I included them in this pull<br>
&gt; request.<br>
&gt;<br>
&gt; I&#39;ve also included Saul&#39;s in-tree defconfig fixes + one additi=
onal<br>
&gt; patch<br>
&gt; of my own.<br>
&gt;<br>
&gt; I also bump linux-yocto-dev to 4.15-rcX, which brought in some build<b=
r>
&gt; issues due to x86 ORC_UNWINDER changes, and ssl cert generation. I&#39=
;ve<br>
&gt; added the new dependencies directly in the linux-yocto-dev recipe,<br>
&gt; but<br>
&gt; they will very likely have to move lower into the stack over time.<br>
&gt;<br>
&gt; I have some additional, structural changes that are coming shortly,<br=
>
&gt; but I&#39;m traveling for the next 5 days and will send them when I<br=
>
&gt; return.<br>
<br>
</span>I tried this series, minus the -dev kernel change in -next and we se=
e:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds=
/676/steps/Running%20oe-selftest/logs/stdio" rel=3D"noreferrer" target=3D"_=
blank">https://autobuilder.yocto.io/b<wbr>uilders/nightly-oe-selftest/bu<wb=
r>ilds/676/steps/Running%20oe-se<wbr>lftest/logs/stdio</a><br>
<br>
The duplicate logging bug makes it hard to read but the key takeaway is:<br=
>
<br>
2017-12-09 10:49:53,667 - oe-selftest - INFO - Ran 317 tests in 14099.939s<=
br>
2017-12-09 10:49:53,667 - oe-selftest - INFO -=C2=A0=C2=A0(failures=3D16, s=
kipped=3D1)<br>
<br>
I can reproduce easily with:<br>
<br>
oe-selftest -r runqemu.RunqemuTests.test_boot<wbr>_deploy<br>
<br>
which fails locally too.=C2=A0If I revert &quot;linux-yocto/4.12: update to=
<br>
v4.12.16&quot; it works.<br>
<br>
The test checks if it can login over the serial port so I&#39;m guessing<br=
>
some serial driver either got turned off or regressed?<br></blockquote><div=
><br></div></div></div><div>I can try the same thing here, but obviously I =
never send the series if I can&#39;t</div><div>boot and log into the qemu i=
nstances .. and I only ever use serial for that.</div><div><br></div><div>H=
opefully I get the same error so I can debug locally.</div><div><br></div><=
div>Bruce</div><span class=3D""><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"m_-7641115833366767712HOEnZb"><div class=3D"m_-76411158333667=
67712h5"><br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></span></div><span class=3D"HOEnZb"><font color=3D=
"#888888"><br><br clear=3D"all"><div><br></div>-- <br><div class=3D"m_-7641=
115833366767712gmail_signature" data-smartmail=3D"gmail_signature">&quot;Th=
ou shalt not follow the NULL pointer, for chaos and madness await thee at i=
ts end&quot;</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a114455de8c97be055fffe938--
