Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id AE95571A34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 07:28:05 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id b75so1531534lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 00:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UiSj8xbQrHjNcuOV1y2Y99OBccw1PerLuqe38nb3CBc=;
	b=Lq0uI68aPjTZygBR2MN45qOscPzMTfEYvv054lEqmk6L0j7w23EIEKzjVC0J5icQSs
	wuKm4nJpdarfuBsMznC6ib7TVG5XomKxnc+2AX0pTDQd9xPYKOW2qzIOCSxabkPyM3yE
	v5/hD0nU0WiZHeALk91XjKWbpvK6mk8VfqOzkr/d2NEI+AGZd76yfmAFviLYlg/U5Pws
	5lzfANN8tAAAR60KMNxQjgkxfdW3NPzyLG/lKHYdKG5UVkDF3jHmrO1ur0z0sp6jbSXA
	LJHzexq1MWFxyO+JQdwcUtrkha9g3tUyTkMiVLx1qqKNWfcnBHkfQ3tZ/oYDd5ergrDt
	yH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UiSj8xbQrHjNcuOV1y2Y99OBccw1PerLuqe38nb3CBc=;
	b=OEzvZR9FS6lUqKEgzrJvYVDZKwx5g68uJBRA0fPshho6h6kGXZyR4TqNEDNaa7n8cT
	hrw1c1uSE7clox81zt2e0t4MZJ5NrDgsmVco6Lnd9YkZyIHdHjgHc+FFRNtulaahgWqL
	eii0p2e1Yj6E93+5poiXJhn3qZNEwpkNX0c7Qe2cByuf5nH4qx7BZmEsoV8419wDxZqk
	iNL4+S1qBkAf8d0K8lFosMQrCDBvrbQ1LEm2dZCcBmkhxzFvTkENqfT+6QrLrKB23xIR
	53n2DhxWZExZRpf4x97sLvrrwC1ohlBnpYGjM01rqAeRNb4MNp6RepJmRd2tNt5ulATh
	CTOg==
X-Gm-Message-State: ABUngvdlWPlnRT2KYL0kcW9jbkN6JgOmM4b5Hi8wz2fLTl9sypO1RliO8KLzJ/CsntKxdZDc6hOrqxg3qkNpNr9M
X-Received: by 10.25.199.87 with SMTP id x84mr432982lff.142.1477466886178;
	Wed, 26 Oct 2016 00:28:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.122.1 with HTTP; Wed, 26 Oct 2016 00:28:05 -0700 (PDT)
In-Reply-To: <709988291.930326.1477431788589@mail.yahoo.com>
References: <709988291.930326.1477431788589.ref@mail.yahoo.com>
	<709988291.930326.1477431788589@mail.yahoo.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Wed, 26 Oct 2016 12:58:05 +0530
Message-ID: <CAD3vsf6wvx4RdDpsFcC8H1wyLvQ8q=dQnHnBObi-pc9ZJrEA3w@mail.gmail.com>
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
X-List-Received-Date: Wed, 26 Oct 2016 07:28:06 -0000
Content-Type: multipart/alternative; boundary=94eb2c1a19c8eb36fe053fbf9011

--94eb2c1a19c8eb36fe053fbf9011
Content-Type: text/plain; charset=UTF-8

Hi Tudor,


> Hi Jagadeesh,
>
> > The patch include below changes:
> ...
> > 2. Some of the libunwind test cases such as run-check-namespace,
> >    run-coredump-unwind require debug symbols to be present in
> >    libunwind library. So set INHIBIT_PACKAGE_STRIP to "1".
> > --- a/meta/recipes-support/libunwind/libunwind_git.bb
> > +++ b/meta/recipes-support/libunwind/libunwind_git.bb
> ...
> > +INHIBIT_PACKAGE_STRIP = "1"
> > +
>
> Thanks for reviewing the patch.


> The change above have the effect of inhibiting the package strip even if
> ptest  is not enabled at all. I think this have to be something specific to
> ptest.
> You may consider using INSANE_SKIP_${PN}-ptest [1] and add unstripped
> binaries needed for ptest in {PN}-ptest (along with the original - stripped
> - ones)
>

I didn't get how unstripped and stripped binaries can co-exist in a single
package called ${PN}-test.
The split_and_strip_files function keeps files containing debug symbols in
a separate directory
( like ../.debug/..). Do you mean to say include files containing debug
symbols (i,e debugdirectory) in ${PN}-test package and
set  INSANE_SKIP_${PN}-ptest += "debug-files"
to prevent packaging .debug directories in non -dbg package.

This doesn't help,  as run-coredump-unwind requires unstripped "crasher"
 program to be present at target, to get procedure names using libuwind
APIs.


or simply consider the appropriate tests as XFAIL for openembedded.
>
Yes, for such test (e.g: run-coredump-unwind) XFAIL is fine, if
INHIBIT_PACKAGE_STRIP = "1" is
not used.

Regards,
Jagadeesh

>
>

--94eb2c1a19c8eb36fe053fbf9011
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
>Hi Tudor,</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div><div style=3D"color:rgb(0,0,0);font-family:garamond,&quot;new =
york&quot;,times,serif;font-size:16px;background-color:rgb(255,255,255)"><d=
iv id=3D"gmail-m_8849950624476238808yui_3_16_0_ym19_1_1477346198248_20479" =
dir=3D"ltr">Hi Jagadeesh,<span class=3D"gmail-"><br id=3D"gmail-m_884995062=
4476238808yui_3_16_0_ym19_1_1477346198248_20596"><br id=3D"gmail-m_88499506=
24476238808yui_3_16_0_ym19_1_1477346198248_20597">&gt; The patch include be=
low changes:<br id=3D"gmail-m_8849950624476238808yui_3_16_0_ym19_1_14773461=
98248_20598"></span>...<span class=3D"gmail-"><br id=3D"gmail-m_88499506244=
76238808yui_3_16_0_ym19_1_1477346198248_20599">&gt; 2. Some of the libunwin=
d test cases such as run-check-namespace,<br id=3D"gmail-m_8849950624476238=
808yui_3_16_0_ym19_1_1477346198248_20600">&gt;=C2=A0=C2=A0=C2=A0 run-coredu=
mp-unwind require debug symbols to be present in<br id=3D"gmail-m_884995062=
4476238808yui_3_16_0_ym19_1_1477346198248_20601">&gt;=C2=A0=C2=A0=C2=A0 lib=
unwind library. So set INHIBIT_PACKAGE_STRIP to &quot;1&quot;.<br id=3D"gma=
il-m_8849950624476238808yui_3_16_0_ym19_1_1477346198248_20602"></span>&gt; =
--- a/meta/recipes-support/<wbr>libunwind/<a href=3D"http://libunwind_git.b=
b" target=3D"_blank">libunwind_git.bb</a><br id=3D"gmail-m_8849950624476238=
808yui_3_16_0_ym19_1_1477346198248_20603">&gt; +++ b/meta/recipes-support/<=
wbr>libunwind/<a href=3D"http://libunwind_git.bb" target=3D"_blank">libunwi=
nd_git.bb</a><br id=3D"gmail-m_8849950624476238808yui_3_16_0_ym19_1_1477346=
198248_20604">...<br id=3D"gmail-m_8849950624476238808yui_3_16_0_ym19_1_147=
7346198248_20605">&gt; +INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br id=3D"gm=
ail-m_8849950624476238808yui_3_16_0_ym19_1_1477346198248_20606">&gt; +<br i=
d=3D"gmail-m_8849950624476238808yui_3_16_0_ym19_1_1477346198248_20607"><br =
id=3D"gmail-m_8849950624476238808yui_3_16_0_ym19_1_1477346198248_20608"></d=
iv></div></div></blockquote><div>Thanks for reviewing the patch.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div sty=
le=3D"color:rgb(0,0,0);font-family:garamond,&quot;new york&quot;,times,seri=
f;font-size:16px;background-color:rgb(255,255,255)"><div id=3D"gmail-m_8849=
950624476238808yui_3_16_0_ym19_1_1477346198248_20479" dir=3D"ltr">The chang=
e above have the effect of inhibiting the package strip even if ptest=C2=A0=
 is not enabled at all. I think this have to be something specific to ptest=
.<br id=3D"gmail-m_8849950624476238808yui_3_16_0_ym19_1_1477346198248_20611=
">You may consider using INSANE_SKIP_${PN}-ptest [1] and add unstripped bin=
aries needed for ptest in {PN}-ptest (along with the original - stripped - =
ones)</div></div></div></blockquote><div>=C2=A0</div><div><font face=3D"ari=
al, helvetica, sans-serif">I didn&#39;t get how unstripped and stripped bin=
aries can co-exist in a single package called ${PN}-test.</font></div><div>=
<font face=3D"arial, helvetica, sans-serif">The split_and_strip_files funct=
ion keeps files containing debug symbols in a separate directory</font></di=
v><div><font face=3D"arial, helvetica, sans-serif">( like ../.debug/..). Do=
 you mean to say include files containing=C2=A0debug symbols (i,e </font><s=
pan style=3D"font-family:arial,helvetica,sans-serif">debugdirectory) in ${P=
N}-test package and set=C2=A0=C2=A0INSANE_SKIP_${PN}-ptest +=3D &quot;</spa=
n><span style=3D"font-family:arial,helvetica,sans-serif;color:rgb(51,51,51)=
;line-height:24px"><code class=3D"gmail-filename">debug-files</code></span>=
<span style=3D"font-family:arial,helvetica,sans-serif">&quot;</span></div><=
div><font face=3D"arial, helvetica, sans-serif">to prevent packaging .debug=
 directories in non -dbg package.</font></div><div><font face=3D"arial, hel=
vetica, sans-serif"><br></font></div><div><font face=3D"arial, helvetica, s=
ans-serif">This doesn&#39;t help, =C2=A0</font><span style=3D"font-family:a=
rial,helvetica,sans-serif">as run-coredump-unwind requires unstripped &quot=
;crasher&quot; =C2=A0program to be present at target,=C2=A0</span><span sty=
le=3D"font-family:arial,helvetica,sans-serif">to get procedure names using =
libuwind APIs.</span></div><div><span style=3D"font-family:arial,helvetica,=
sans-serif"><br></span></div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div><div style=3D"color:rgb(0,0,0);font-family:garamond=
,&quot;new york&quot;,times,serif;font-size:16px;background-color:rgb(255,2=
55,255)"><div id=3D"gmail-m_8849950624476238808yui_3_16_0_ym19_1_1477346198=
248_20479" dir=3D"ltr">or simply consider the appropriate tests as XFAIL fo=
r openembedded.<br id=3D"gmail-m_8849950624476238808yui_3_16_0_ym19_1_14773=
46198248_20613"></div></div></div></blockquote><div>Yes, for such test (e.g=
: run-coredump-unwind) XFAIL is fine, if INHIBIT_PACKAGE_STRIP =3D &quot;1&=
quot; is</div><div>not used.</div><div><br></div><div>Regards,</div><div>Ja=
gadeesh</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div st=
yle=3D"color:rgb(0,0,0);font-family:garamond,&quot;new york&quot;,times,ser=
if;font-size:16px;background-color:rgb(255,255,255)"><div id=3D"gmail-m_884=
9950624476238808yui_3_16_0_ym19_1_1477346198248_20728"><br></div></div></di=
v></blockquote></div><br></div></div>

--94eb2c1a19c8eb36fe053fbf9011--
