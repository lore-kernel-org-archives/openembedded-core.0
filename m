Return-Path: <ryan.harkin@linaro.org>
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169])
	by mail.openembedded.org (Postfix) with ESMTP id CF6DA79500
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 07:08:06 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id s12-v6so3351529ljj.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 00:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=klxbvEsqmnImmkHwXUmmR28Avc+FeoW8/ZUHIwhToc4=;
	b=QWHH+GoYZpYN6FGq8mGHXFWQSAcIkfqQBvg799iMNH26SRXxTMuTC1krgTio1d4sML
	kFdMg7V77YI+bJ0xSVqesunIRM6Bhax1mGUqDjx1vAZRBibhDlCObNfHFrqoXr/jTdhA
	2z3CTkEtHgEE45wB/RUIxK6Xe5DIm7ghDJwHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=klxbvEsqmnImmkHwXUmmR28Avc+FeoW8/ZUHIwhToc4=;
	b=CLzD8Rbqn3VwIVbPhnp5Kwgo7eYovS64ed2b/0xQ7G5hILr5YnRSkDYaAcRi/3D/OH
	+MKswmyRJQnMYYczUMuglVdSnSqSqhuTQy/hrm8XxNWO9scNmpTvkxjt1NY4dJP09/Tm
	4hjSAr4+WOU+RujZNC/noBMA4OCYVTX2z5Oh2WEb7L+ZFH72fmPaxyO05EMyD13v282u
	P5kU+t54xMLSBvI/6pPOVuEI0x8Wy88ctts/oRXyeeq+lzg7BS7pBoGIqfyBmwCiyhcz
	S63eyZDyLomlJfOfeNKHbafyeQLbZiIhpgp4bK7dr+WMfB58Z+DhB34hGEb/KySnEH7t
	qTQA==
X-Gm-Message-State: AOUpUlFUr9iDgEIHuv1aqr7hnzt420HicH/KKK8cNvlBARmpgjFA9ECD
	dJ4kIJkfi5AvNFw2yt3g+Ra5NjaABoocYOmuG4EzEg==
X-Google-Smtp-Source: AA+uWPzJ3xtjHK0fNuwVIl1zK1VXpnkQDuY1qnMkHt1CnALljz48c5AZN5ESqneOg8W1ts5RwGvxqL6o4K7vZPy3TkY=
X-Received: by 2002:a2e:9c82:: with SMTP id
	x2-v6mr16436634lji.131.1535008087322; 
	Thu, 23 Aug 2018 00:08:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:1bc7:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 00:08:06
	-0700 (PDT)
In-Reply-To: <ef756a97-310a-63a9-1a3b-be0bb6634769@geanix.com>
References: <1534955436-729-1-git-send-email-ryan.harkin@linaro.org>
	<1534955436-729-4-git-send-email-ryan.harkin@linaro.org>
	<CA+chaQd0noT0sABT2ucXZOx6QvWhoQqQeqzWXO_nm89-5ZeREA@mail.gmail.com>
	<CAD0U-hLEPce-+gJcBcqQHFPkiHr1CPBEvaM6s1f1VTkEzpNnfQ@mail.gmail.com>
	<CA+chaQezPDFAP1L0NYCaoFDjPfriUt3_wh9QKTaa0ZwWBHtKYQ@mail.gmail.com>
	<CAD0U-hJHddn43O0WVxDqUft74RoHxfCQBb9XV-pG+GYqNU0iVQ@mail.gmail.com>
	<CA+chaQc2EUcz+PHi=BT5RrMQsCqegytxgLd6gzpH-PUYvt59Mw@mail.gmail.com>
	<CAD0U-hL6Mvxf+NYVJS64ygh+bMR2RMxwa=okW6g+yOGb-Xb7mA@mail.gmail.com>
	<CAJ86T=UOiE+m=3__e13YpRex22Z9h1ennqyCxQMRDdSWMiFZTw@mail.gmail.com>
	<CAD0U-hJ5Ef8+zV6fumw921=67hwS5yyqaDWWJGVm4D4rFyrYHQ@mail.gmail.com>
	<CAJ86T=WjSNkzHpD0a-CxwmV1JfG7ksfezspi+5LvkdvJHdTcFw@mail.gmail.com>
	<CAD0U-h+yMkaadysGDcmhZHSPY8tgbw_O8jquynJduChJjgypxA@mail.gmail.com>
	<ef756a97-310a-63a9-1a3b-be0bb6634769@geanix.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Thu, 23 Aug 2018 08:08:06 +0100
Message-ID: <CAD0U-h+N6qwLToTqg0ZOSPfk3wK4-416bFNrf80hcgWbxNYuVw@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>, 
	Koen Kooi <koen.kooi@linaro.org>
Cc: daiane.angolini@nxp.com, Patch Tracking <patches@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 3/3] linux-firmware: MACHINEOVERRIDES for BCM43430 NVRAM
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
X-List-Received-Date: Thu, 23 Aug 2018 07:08:07 -0000
Content-Type: multipart/alternative; boundary="000000000000c5d54d057414eb9f"

--000000000000c5d54d057414eb9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 23 August 2018 at 07:39, Martin Hundeb=C3=B8ll <martin@geanix.com> wrote=
:

> May I suggest using the '-r, --relative' flag from 'ln':
>
>        -r, --relative
>               create symbolic links relative to link location
>
> My life felt considerably better after discovering that feature :)
>

Thanks Martin Hundeb=C3=B8ll! Yes, that works for me.

So, Martin Jansa, I could make this change:

-       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
+      ( ln -sfr
${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.MUR1DX.txt
${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)

Of course, if I'm not going to "cd" into the firmware repo, I'll have to
use absolute paths on both sides of the "ln" command anyway. So I could
drop the 'r' param and it should still work. Eg:

-       ( cd ${D}${nonarch_base_libdir}/firmware/brcm/ ; ln -sf
brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)
+      ( ln -sf ${D}${nonarch_base_libdir}/firmware/brcm/
brcmfmac43430-sdio.MUR1DX.txt ${D}${nonarch_base_libdir}/firmware/brcm/
brcmfmac43430-sdio.txt)

I'm still not sure this is any neater, though, as it involves using the
path twice. Is there a maintainer here who has a preference?

FWIW, the TI line that I copied was added by Koen Kooi, who I've added to
the CC:

8c7adb6  2011-10-09  linux-firmware: update, merge in OE classic updates,
fix p..       [Koen Kooi]



> // Martin
>
> On 23/08/2018 08.12, Ryan Harkin wrote:
>
>>
>>
>> On 22 August 2018 at 23:55, Andre McCurdy <armccurdy@gmail.com <mailto:
>> armccurdy@gmail.com>> wrote:
>>
>>     On Wed, Aug 22, 2018 at 2:56 PM, Ryan Harkin <ryan.harkin@linaro.org
>>     <mailto:ryan.harkin@linaro.org>> wrote:
>>      > On Wed, 22 Aug 2018, 21:42 Andre McCurdy, <armccurdy@gmail.com
>>     <mailto:armccurdy@gmail.com>> wrote:
>>      >> On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin
>>     <ryan.harkin@linaro.org <mailto:ryan.harkin@linaro.org>>
>>      >> wrote:
>>      >> > On Wed, 22 Aug 2018, 20:02 Martin Jansa,
>>     <martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>> wrote:
>>      >> >>
>>      >> >> Your 1st parameter is wrong, compare again with the example I
>>     gave you
>>      >> >> (don't include "brcm/" path in 1st param, because you want
>>     the symlink
>>      >> >> to
>>      >> >> point to just brcmfmac43430-sdio.AP6212.txt like you did in
>>     the version
>>      >> >> after cd).
>>      >> >
>>      >> > That doesn't work either. I tried it with the same result, but
>>     didn't
>>      >> > send a
>>      >> > log of it. That works for you?
>>      >>
>>      >> Martin's example is correct so maybe check your tests again for
>>     typos.
>>      >> It it still doesn't work then please do send a log.
>>      >>
>>      >> The link will point to whatever you define via the first
>>     parameter, so
>>      >> if you changed the first parameter it shouldn't be possible to g=
et
>>      >> "the same result".
>>      >>
>>      >>   $ mkdir foo
>>      >>   $ ln -sf test_target foo/test1
>>      >>   $ ln -sf brcm/test_target foo/test2
>>      >>   $ ls -l foo
>>      >>
>>      >>   lrwxrwxrwx 1 andre andre 11 Aug 22 13:35 test1 -> test_target
>>      >>   lrwxrwxrwx 1 andre andre 16 Aug 22 13:35 test2 ->
>> brcm/test_target
>>      >
>>      > Yes, that's essentially the same as what I'm getting.
>>      >
>>      > Now try "cat foo/test1" and what happens?
>>      >
>>      > There is no file called test_target in the foo directory. And
>>     neither is
>>      > there a file called brcm/test_target in the foo directory.
>>
>>     Correct. The above was just an example to show that you can * create
>>     symlinks * in the foo directory without cd'ing into the foo director=
y
>>     first.
>>
>>     If you'd like the symlinks in the example to point to valid targets
>>     then you need to create the targets too, e.g.
>>
>>        $ mkdir -p foo/brcm
>>        $ echo hello > foo/test_target
>>        $ echo hello2 > foo/brcm/test_target
>>
>>     But note that the process of creating a symlink is always the same,
>>     regardless of whether the symlink points to a valid target or not (s=
o
>>     you can run these extra commands to create the targets before or aft=
er
>>     you create the symlinks).
>>
>>
>> So that doesn't work for me how I expect it to work. I must be missing
>> something fundamental here.
>>
>> The recipe is trying to create a soft link from a file in the current
>> directory to a file in the sub-directory. On my system, your example
>> creates links from a file in the sub-directory to the another file in th=
e
>> sub-directory.
>>
>> So, to copy your example, but creating the file "test_target" from the
>> start:
>>
>> $ mkdir -p /tmp/test
>> $ cd /tmp/test
>> $ mkdir foo
>> $ echo 1 > test_target
>> $ ln -sf test_target foo/test1
>> $ ln -sf brcm/test_target foo/test2
>> $ ls -l foo
>> total 0
>> lrwxrwxrwx 1 ryan ryan 11 Aug 23 06:54 test1 -> test_target
>> lrwxrwxrwx 1 ryan ryan 16 Aug 23 06:54 test2 -> brcm/test_target
>> $ cat test_target
>> 1
>> $ cat foo/test1
>> cat: foo/test1: No such file or directory
>> $ cat foo/test2
>> cat: foo/test2: No such file or directory
>> $ echo hello > foo/test_target
>> $ echo hello2 > foo/brcm/test_target
>> bash: foo/brcm/test_target: No such file or directory
>> $ cat foo/test1
>> hello
>> $ cat foo/test2
>> cat: foo/test2: No such file or directory
>> $ cat test_target
>> 1
>> $ tree
>> .
>> =E2=94=9C=E2=94=80=E2=94=80 foo
>> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 test1 -> test_target
>> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 test2 -> brcm/test_target
>> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 test_target
>> =E2=94=94=E2=94=80=E2=94=80 test_target
>>
>> 1 directory, 4 files
>>
>> So, neither test1 nor test2 are linked to /tmp/test/test_target. test1 i=
s
>> linked to /tmp/test/foo/test_target and test2 is linked to
>> /tmp/test/brcm/test_target, which doesn't exist.
>>
>> AFAIK, when creating a softlink, you have to give it either an absolute
>> path, or a path relative to the link being created. The path cannot be
>> relative to the original file that you want to link to.
>>
>> So, this will work:
>>
>> $cd /tmp/test
>> $ ln -sf ../test_target foo/test3
>> $ cat foo/test3
>> 1
>> $ cat /tmp/test/foo/test3
>> 1
>>
>> But that is a strange way to create the soft link, IMO.
>>
>> AFAICT, for the recipe, to get rid of the "cd", I'd have to specify an
>> absolute path to the original file:
>>
>> +do_install_append_bcm43430-nvram-mur1dx() {
>> +       ( ln -sf ${PWD}/brcmfmac43430-sdio.MUR1DX.txt
>> ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.txt)
>>
>> ... assuming PWD is available to the recipe. There will be a proper Yoct=
o
>> variable I can use, of course, but I can't think of it right now.
>>
>> Either way, Martin's example doesn't work for me. And adding the absolut=
e
>> path of the original file doesn't seem any neater or clearer than follow=
ing
>> the TI example from the do_install a few lines up in the recipe. But I'm
>> happy to do it either way, so long as it works.
>>
>>
> --
> Kind regards,
> Martin Hundeb=C3=B8ll
> Embedded Linux Consultant
>
> +45 61 65 54 61
> martin@geanix.com
>
> Geanix IVS
> https://geanix.com
> DK39600706
>

--000000000000c5d54d057414eb9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 23 August 2018 at 07:39, Martin Hundeb=C3=B8ll <span dir=3D"ltr">&lt=
;<a href=3D"mailto:martin@geanix.com" target=3D"_blank">martin@geanix.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">M=
ay I suggest using the &#39;-r, --relative&#39; flag from &#39;ln&#39;:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0-r, --relative<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create symbolic links rela=
tive to link location<br>
<br>
My life felt considerably better after discovering that feature :)<br></blo=
ckquote><div><br></div><div>Thanks Martin <span style=3D"font-size:small;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">Hundeb=C3=B8ll</span>! Yes, tha=
t works for me.</div><div><br></div><div>So, Martin Jansa, I could make thi=
s change:</div><div><br></div><div><span style=3D"color:rgb(80,0,80);font-s=
ize:11.2px;background-color:rgb(255,255,255);text-decoration-style:initial;=
text-decoration-color:initial;float:none;display:inline">-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0( cd ${D}${nonarch_base_libdir}/</span><wbr style=3D"color:rgb(80=
,0,80);font-size:11.2px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial"><span style=3D"color:rgb(80,0,8=
0);font-size:11.2px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">firmware/=
brcm/ ; ln -sf brcmfmac43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)</span>=
</div><div><span style=3D"color:rgb(80,0,80);font-size:11.2px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">+=C2=A0 =C2=A0 =C2=A0 ( </span><span style=
=3D"color:rgb(80,0,80);font-size:11.2px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">ln -sfr=C2=A0<span style=3D"text-decoration-style:initial;text-d=
ecoration-color:initial;float:none;display:inline">${D}${nonarch_base_libdi=
r}/</span><wbr style=3D"text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">firmware/brcm/</span>brcmfmac43430-sdi=
o.MUR1DX.txt <span style=3D"text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">${D}${nonarch_base_libdir}/</span><=
wbr style=3D"text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">firmware/brcm/</span>brcmfmac43430-sdio.txt)</spa=
n><br style=3D"color:rgb(80,0,80);font-size:11.2px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><br =
style=3D"color:rgb(80,0,80);font-size:11.2px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">Of cours=
e, if I&#39;m not going to &quot;cd&quot; into the firmware repo, I&#39;ll =
have to use absolute paths on both sides of the &quot;ln&quot; command anyw=
ay. So I could drop the &#39;r&#39; param and it should still work. Eg:</sp=
an></div><div><span style=3D"font-size:small;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline"><br></span></div><div><div style=3D"font-size:small;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"><span style=3D"color:rgb(80,0,80);font-size:11.2px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">-=C2=A0 =C2=A0 =C2=A0 =C2=A0( cd ${D}${n=
onarch_base_libdir}/</span><wbr style=3D"color:rgb(80,0,80);font-size:11.2p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial"><span style=3D"color:rgb(80,0,80);font-size:11.2px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">firmware/brcm/ ; ln -sf brcmfma=
c43430-sdio.MUR1DX.txt brcmfmac43430-sdio.txt)</span></div><div style=3D"fo=
nt-size:small;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(80,0,80);font-si=
ze:11.2px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">+=C2=A0 =C2=A0 =C2=
=A0 (<span>=C2=A0</span></span><span style=3D"color:rgb(80,0,80);font-size:=
11.2px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">ln -sf=C2=A0<span styl=
e=3D"text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">${D}${nonarch_base_libdir}/</span><wbr style=3D"text-decor=
ation-style:initial;text-decoration-color:initial"><span style=3D"text-deco=
ration-style:initial;text-decoration-color:initial;float:none;display:inlin=
e">firmware/brcm/</span>brcmfmac43430-sdio.MUR1DX.txt<span>=C2=A0</span><sp=
an style=3D"text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">${D}${nonarch_base_libdir}/</span><wbr style=3D"tex=
t-decoration-style:initial;text-decoration-color:initial"><span style=3D"te=
xt-decoration-style:initial;text-decoration-color:initial;float:none;displa=
y:inline">firmware/brcm/</span>brcmfmac43430-sdio.txt)</span><br style=3D"c=
olor:rgb(80,0,80);font-size:11.2px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"></div></div><div><br=
></div><div>I&#39;m still not sure this is any neater, though, as it involv=
es using the path twice. Is there a maintainer here who has a preference?</=
div><div><br></div><div>FWIW, the TI line that I copied was added by Koen K=
ooi, who I&#39;ve added to the CC:</div><div><br></div><div><div>8c7adb6=C2=
=A0 2011-10-09=C2=A0 linux-firmware: update, merge in OE classic updates, f=
ix p..=C2=A0 =C2=A0 =C2=A0 =C2=A0[Koen Kooi]</div></div><div><br></div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
// Martin<br>
<br>
On 23/08/2018 08.12, Ryan Harkin wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">
<br>
<br>
On 22 August 2018 at 23:55, Andre McCurdy &lt;<a href=3D"mailto:armccurdy@g=
mail.com" target=3D"_blank">armccurdy@gmail.com</a> &lt;mailto:<a href=3D"m=
ailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;&gt=
; wrote:<br>
<br>
=C2=A0 =C2=A0 On Wed, Aug 22, 2018 at 2:56 PM, Ryan Harkin &lt;<a href=3D"m=
ailto:ryan.harkin@linaro.org" target=3D"_blank">ryan.harkin@linaro.org</a><=
br></span><span class=3D"gmail-">
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:ryan.harkin@linaro.org" target=
=3D"_blank">ryan.harkin@linaro.org</a><wbr>&gt;&gt; wrote:<br>
=C2=A0 =C2=A0 =C2=A0&gt; On Wed, 22 Aug 2018, 21:42 Andre McCurdy, &lt;<a h=
ref=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a=
><br></span><span class=3D"gmail-">
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:armccurdy@gmail.com" target=3D"_=
blank">armccurdy@gmail.com</a>&gt;&gt; wrote:<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; On Wed, Aug 22, 2018 at 1:10 PM, Ryan Harkin<b=
r></span>
=C2=A0 =C2=A0 &lt;<a href=3D"mailto:ryan.harkin@linaro.org" target=3D"_blan=
k">ryan.harkin@linaro.org</a> &lt;mailto:<a href=3D"mailto:ryan.harkin@lina=
ro.org" target=3D"_blank">ryan.harkin@linaro.org</a><wbr>&gt;&gt;<span clas=
s=3D"gmail-"><br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; wrote:<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; On Wed, 22 Aug 2018, 20:02 Martin Jansa,<=
br></span><div><div class=3D"gmail-h5">
=C2=A0 =C2=A0 &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blan=
k">martin.jansa@gmail.com</a> &lt;mailto:<a href=3D"mailto:martin.jansa@gma=
il.com" target=3D"_blank">martin.jansa@gmail.com</a><wbr>&gt;&gt; wrote:<br=
>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; Your 1st parameter is wrong, compare =
again with the example I<br>
=C2=A0 =C2=A0 gave you<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; (don&#39;t include &quot;brcm/&quot; =
path in 1st param, because you want<br>
=C2=A0 =C2=A0 the symlink<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; to<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; point to just brcmfmac43430-sdio.AP62=
12.txt like you did in<br>
=C2=A0 =C2=A0 the version<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;&gt; after cd).<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; That doesn&#39;t work either. I tried it =
with the same result, but<br>
=C2=A0 =C2=A0 didn&#39;t<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; send a<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; &gt; log of it. That works for you?<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; Martin&#39;s example is correct so maybe check=
 your tests again for<br>
=C2=A0 =C2=A0 typos.<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; It it still doesn&#39;t work then please do se=
nd a log.<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; The link will point to whatever you define via=
 the first<br>
=C2=A0 =C2=A0 parameter, so<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; if you changed the first parameter it shouldn&=
#39;t be possible to get<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt; &quot;the same result&quot;.<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0$ mkdir foo<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0$ ln -sf test_target foo/test1<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0$ ln -sf brcm/test_target foo/test=
2<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0$ ls -l foo<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0lrwxrwxrwx 1 andre andre 11 Aug 22=
 13:35 test1 -&gt; test_target<br>
=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0lrwxrwxrwx 1 andre andre 16 Aug 22=
 13:35 test2 -&gt; brcm/test_target<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt; Yes, that&#39;s essentially the same as what I&#39=
;m getting.<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt; Now try &quot;cat foo/test1&quot; and what happens=
?<br>
=C2=A0 =C2=A0 =C2=A0&gt;<br>
=C2=A0 =C2=A0 =C2=A0&gt; There is no file called test_target in the foo dir=
ectory. And<br>
=C2=A0 =C2=A0 neither is<br>
=C2=A0 =C2=A0 =C2=A0&gt; there a file called brcm/test_target in the foo di=
rectory.<br>
<br>
=C2=A0 =C2=A0 Correct. The above was just an example to show that you can *=
 create<br>
=C2=A0 =C2=A0 symlinks * in the foo directory without cd&#39;ing into the f=
oo directory<br>
=C2=A0 =C2=A0 first.<br>
<br>
=C2=A0 =C2=A0 If you&#39;d like the symlinks in the example to point to val=
id targets<br>
=C2=A0 =C2=A0 then you need to create the targets too, e.g.<br>
<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 $ mkdir -p foo/brcm<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 $ echo hello &gt; foo/test_target<br>
=C2=A0 =C2=A0 =C2=A0=C2=A0 $ echo hello2 &gt; foo/brcm/test_target<br>
<br>
=C2=A0 =C2=A0 But note that the process of creating a symlink is always the=
 same,<br>
=C2=A0 =C2=A0 regardless of whether the symlink points to a valid target or=
 not (so<br>
=C2=A0 =C2=A0 you can run these extra commands to create the targets before=
 or after<br>
=C2=A0 =C2=A0 you create the symlinks).<br>
<br>
<br>
So that doesn&#39;t work for me how I expect it to work. I must be missing =
something fundamental here.<br>
<br>
The recipe is trying to create a soft link from a file in the current direc=
tory to a file in the sub-directory. On my system, your example creates lin=
ks from a file in the sub-directory to the another file in the sub-director=
y.<br>
<br>
So, to copy your example, but creating the file &quot;test_target&quot; fro=
m the start:<br>
<br>
$ mkdir -p /tmp/test<br>
$ cd /tmp/test<br>
$ mkdir foo<br>
$ echo 1 &gt; test_target<br>
$ ln -sf test_target foo/test1<br>
$ ln -sf brcm/test_target foo/test2<br>
$ ls -l foo<br>
total 0<br>
lrwxrwxrwx 1 ryan ryan 11 Aug 23 06:54 test1 -&gt; test_target<br>
lrwxrwxrwx 1 ryan ryan 16 Aug 23 06:54 test2 -&gt; brcm/test_target<br>
$ cat test_target<br>
1<br>
$ cat foo/test1<br>
cat: foo/test1: No such file or directory<br>
$ cat foo/test2<br>
cat: foo/test2: No such file or directory<br>
$ echo hello &gt; foo/test_target<br>
$ echo hello2 &gt; foo/brcm/test_target<br>
bash: foo/brcm/test_target: No such file or directory<br>
$ cat foo/test1<br>
hello<br>
$ cat foo/test2<br>
cat: foo/test2: No such file or directory<br>
$ cat test_target<br>
1<br>
$ tree<br>
.<br>
=E2=94=9C=E2=94=80=E2=94=80 foo<br>
=E2=94=82=C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 test1 -&gt; test_target<b=
r>
=E2=94=82=C2=A0 =C2=A0=E2=94=9C=E2=94=80=E2=94=80 test2 -&gt; brcm/test_tar=
get<br>
=E2=94=82=C2=A0 =C2=A0=E2=94=94=E2=94=80=E2=94=80 test_target<br>
=E2=94=94=E2=94=80=E2=94=80 test_target<br>
<br>
1 directory, 4 files<br>
<br>
So, neither test1 nor test2 are linked to /tmp/test/test_target. test1 is l=
inked to /tmp/test/foo/test_target and test2 is linked to /tmp/test/brcm/te=
st_target, which doesn&#39;t exist.<br>
<br>
AFAIK, when creating a softlink, you have to give it either an absolute pat=
h, or a path relative to the link being created. The path cannot be relativ=
e to the original file that you want to link to.<br>
<br>
So, this will work:<br>
<br>
$cd /tmp/test<br>
$ ln -sf ../test_target foo/test3<br>
$ cat foo/test3<br>
1<br>
$ cat /tmp/test/foo/test3<br>
1<br>
<br>
But that is a strange way to create the soft link, IMO.<br>
<br>
AFAICT, for the recipe, to get rid of the &quot;cd&quot;, I&#39;d have to s=
pecify an absolute path to the original file:<br>
<br>
+do_install_append_bcm43430-nv<wbr>ram-mur1dx() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0( ln -sf ${PWD}/brcmfmac43430-sdio.MUR1<wbr>DX.=
txt ${D}${nonarch_base_libdir}/fir<wbr>mware/brcm/brcmfmac43430-sdio.<wbr>t=
xt)<br>
<br>
... assuming PWD is available to the recipe. There will be a proper Yocto v=
ariable I can use, of course, but I can&#39;t think of it right now.<br>
<br>
Either way, Martin&#39;s example doesn&#39;t work for me. And adding the ab=
solute path of the original file doesn&#39;t seem any neater or clearer tha=
n following the TI example from the do_install a few lines up in the recipe=
. But I&#39;m happy to do it either way, so long as it works.<br>
<br>
</div></div></blockquote><span class=3D"gmail-HOEnZb"><font color=3D"#88888=
8">
<br>
-- <br>
Kind regards,<br>
Martin Hundeb=C3=B8ll<br>
Embedded Linux Consultant<br>
<br>
+45 61 65 54 61<br>
<a href=3D"mailto:martin@geanix.com" target=3D"_blank">martin@geanix.com</a=
><br>
<br>
Geanix IVS<br>
<a href=3D"https://geanix.com" rel=3D"noreferrer" target=3D"_blank">https:/=
/geanix.com</a><br>
DK39600706<br>
</font></span></blockquote></div><br></div></div>

--000000000000c5d54d057414eb9f--
