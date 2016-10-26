Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7013E719A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 17:37:15 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id x79so11346752lff.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 10:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IsSrPUMHVDXRK/yDWCXtV3HEaW9M72Je0hr813RmSKU=;
	b=qMK4GheX6ozh/jDYyRy3VGSC7gwNme8sYYa1pipxlaK4X6q2O6zeCnnsYwYH6zvFpD
	xzpwwDpnrCLU89EU+DNkB2f+7wCBHhoAsGIqQIUI1p5obvaGXJzGwse4+FISR+RJh60Y
	EnxbPKyKxPuqc7xaVzttDL7SDqY6RQdW8xFnA3mXZtN36n8vGMyTJ/MBWp78oZjnO74Y
	eZYCgnckk/GE6NqBIpIrvOGe8VOdtCkquFQQFTooNMFZ5jzOCd+vX+XyBf5UCwV3fUbG
	XBMkOllAJeG07/aNFeLrka/hRIFYrE2/z8xZ4ndmz2nDy85jfmh/cnAXWix6fs2FVGsh
	oY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IsSrPUMHVDXRK/yDWCXtV3HEaW9M72Je0hr813RmSKU=;
	b=K5II7oQtTsTOQdHxxg2BJeoREchsUQPl7rAXYXsoV06OthuEaAeVhblomHsGdqw3b2
	lRQ0Zen7qMl/A52Rv9/Zhn1nvc4dH+mSygNsmz6MWbE0JHoEPwuSHUyZLtqoOCBzpdXB
	JL7+/Rm/2BJnl7VGLrYdtZq7V5/8XUBAqqCF8hHM9qL4nyK9PANTy6wXmDObytLfIWFd
	TIcOMkyF/9JuWxmau/ZQEBgFoZ5qq3j78RsPLoIOuTnRTBbWXfmiUvP5rg+YJV2km302
	XqgosDnbIiUgdZLBXwmcCwbCL4WfkN3n91gTJjF4JhIYRoGdY2pVIB7dMHEwujoTgL0Q
	sQfw==
X-Gm-Message-State: ABUngvdhaS/HPr44CK5DzPODVmFnUQm7RTljpM67HfSdNvnXvf/S6aiPgB/uV8BNoTee0jOloArPOtw8lUVjRa1N
X-Received: by 10.25.190.71 with SMTP id o68mr2955888lff.23.1477503436581;
	Wed, 26 Oct 2016 10:37:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.122.1 with HTTP; Wed, 26 Oct 2016 10:37:15 -0700 (PDT)
In-Reply-To: <CAD3vsf6wvx4RdDpsFcC8H1wyLvQ8q=dQnHnBObi-pc9ZJrEA3w@mail.gmail.com>
References: <709988291.930326.1477431788589.ref@mail.yahoo.com>
	<709988291.930326.1477431788589@mail.yahoo.com>
	<CAD3vsf6wvx4RdDpsFcC8H1wyLvQ8q=dQnHnBObi-pc9ZJrEA3w@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Wed, 26 Oct 2016 23:07:15 +0530
Message-ID: <CAD3vsf7KspudaxhBUEPLxi2En0cAJvAyJO2QPBevXe_kPaH+=Q@mail.gmail.com>
To: Tudor Florea <tcflorea@yahoo.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][morty][PATCH] libunwind: add ptest support
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
X-List-Received-Date: Wed, 26 Oct 2016 17:37:16 -0000
Content-Type: multipart/alternative; boundary=94eb2c1a18007e01c2053fc8139f

--94eb2c1a18007e01c2053fc8139f
Content-Type: text/plain; charset=UTF-8

>
>
>
>> The change above have the effect of inhibiting the package strip even if
>> ptest  is not enabled at all. I think this have to be something specific to
>> ptest.
>> You may consider using INSANE_SKIP_${PN}-ptest [1] and add unstripped
>> binaries needed for ptest in {PN}-ptest (along with the original - stripped
>> - ones)
>>
>
> I didn't get how unstripped and stripped binaries can co-exist in a single
> package called ${PN}-test.
> The split_and_strip_files function keeps files containing debug symbols in
> a separate directory
> ( like ../.debug/..). Do you mean to say include files containing debug
> symbols (i,e debugdirectory) in ${PN}-test package and
> set  INSANE_SKIP_${PN}-ptest += "debug-files"
> to prevent packaging .debug directories in non -dbg package.
>
> This doesn't help,  as run-coredump-unwind requires unstripped "crasher"
>  program to be present at target, to get procedure names using libuwind
> APIs.
>
>
> or simply consider the appropriate tests as XFAIL for openembedded.
>>
> Yes, for such test (e.g: run-coredump-unwind) XFAIL is fine, if
> INHIBIT_PACKAGE_STRIP = "1" is
> not used.
>
>
However, I have sent a v2 patch, marking test cases which depend on
unstripped binaries as expected failures and removed INHIBIT_PACKAGE_STRIP
= "1" line from the earlier patch.
Made sure run-check-namespace test passes with libunwind library containing
debug symbols.

Regards,
Jagadeesh

>
>>
>

--94eb2c1a18007e01c2053fc8139f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmai=
l_quote"><span class=3D"m_5830943973678559804gmail-"><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);paddin=
g-left:1ex"><div><div style=3D"color:rgb(0,0,0);font-family:garamond,&#39;n=
ew york&#39;,times,serif;font-size:16px;background-color:rgb(255,255,255)">=
<div id=3D"m_5830943973678559804gmail-m_-5765033722591276788gmail-m_8849950=
624476238808yui_3_16_0_ym19_1_1477346198248_20479" dir=3D"ltr">The change a=
bove have the effect of inhibiting the package strip even if ptest=C2=A0 is=
 not enabled at all. I think this have to be something specific to ptest.<b=
r id=3D"m_5830943973678559804gmail-m_-5765033722591276788gmail-m_8849950624=
476238808yui_3_16_0_ym19_1_1477346198248_20611">You may consider using INSA=
NE_SKIP_${PN}-ptest [1] and add unstripped binaries needed for ptest in {PN=
}-ptest (along with the original - stripped - ones)</div></div></div></bloc=
kquote><div>=C2=A0</div></span><div><font face=3D"arial, helvetica, sans-se=
rif">I didn&#39;t get how unstripped and stripped binaries can co-exist in =
a single package called ${PN}-test.</font></div><div><font face=3D"arial, h=
elvetica, sans-serif">The split_and_strip_files function keeps files contai=
ning debug symbols in a separate directory</font></div><div><font face=3D"a=
rial, helvetica, sans-serif">( like ../.debug/..). Do you mean to say inclu=
de files containing=C2=A0debug symbols (i,e </font><span style=3D"font-fami=
ly:arial,helvetica,sans-serif">debugdirectory) in ${PN}-test package and se=
t=C2=A0=C2=A0INSANE_SKIP_${PN}-ptest +=3D &quot;</span><span style=3D"font-=
family:arial,helvetica,sans-serif;color:rgb(51,51,51);line-height:24px"><co=
de class=3D"m_5830943973678559804gmail-m_-5765033722591276788gmail-filename=
">debug-files</code></span><span style=3D"font-family:arial,helvetica,sans-=
serif">&quot;</span></div><div><font face=3D"arial, helvetica, sans-serif">=
to prevent packaging .debug directories in non -dbg package.</font></div><d=
iv><font face=3D"arial, helvetica, sans-serif"><br></font></div><div><font =
face=3D"arial, helvetica, sans-serif">This doesn&#39;t help, =C2=A0</font><=
span style=3D"font-family:arial,helvetica,sans-serif">as run-coredump-unwin=
d requires unstripped &quot;crasher&quot; =C2=A0program to be present at ta=
rget,=C2=A0</span><span style=3D"font-family:arial,helvetica,sans-serif">to=
 get procedure names using libuwind APIs.</span></div><span class=3D"m_5830=
943973678559804gmail-"><div><span style=3D"font-family:arial,helvetica,sans=
-serif"><br></span></div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;border-left-color:rgb(204,204,204);padding-left:1ex"><div><div style=3D=
"color:rgb(0,0,0);font-family:garamond,&#39;new york&#39;,times,serif;font-=
size:16px;background-color:rgb(255,255,255)"><div id=3D"m_58309439736785598=
04gmail-m_-5765033722591276788gmail-m_8849950624476238808yui_3_16_0_ym19_1_=
1477346198248_20479" dir=3D"ltr">or simply consider the appropriate tests a=
s XFAIL for openembedded.<br id=3D"m_5830943973678559804gmail-m_-5765033722=
591276788gmail-m_8849950624476238808yui_3_16_0_ym19_1_1477346198248_20613">=
</div></div></div></blockquote></span><div>Yes, for such test (e.g: run-cor=
edump-unwind) XFAIL is fine, if INHIBIT_PACKAGE_STRIP =3D &quot;1&quot; is<=
/div><div>not used.</div><div><br></div></div></div></div></blockquote><div=
><br></div><div>However, I have sent a v2 patch, marking test cases which d=
epend on unstripped binaries as expected failures and removed INHIBIT_PACKA=
GE_STRIP =3D &quot;1&quot; line from the earlier patch.</div><div>Made sure=
=C2=A0<span style=3D"font-size:12.8000001907349px">run-check-namespace test=
 passes with libunwind library containing</span></div><div><span style=3D"f=
ont-size:12.8000001907349px">debug symbols.</span></div><div><br></div><div=
>Regards,</div><div>Jagadeesh</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div><div=
 style=3D"color:rgb(0,0,0);font-family:garamond,&#39;new york&#39;,times,se=
rif;font-size:16px;background-color:rgb(255,255,255)"><div id=3D"m_58309439=
73678559804gmail-m_-5765033722591276788gmail-m_8849950624476238808yui_3_16_=
0_ym19_1_1477346198248_20728"><br></div></div></div></blockquote></div><br>=
</div></div>
</blockquote></div><br></div></div>

--94eb2c1a18007e01c2053fc8139f--
