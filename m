Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8DAE478844
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 12:26:05 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id 16so10903243wry.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 04:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HhDuzd65kBzKHrO9zozMNu9X+4UtiRMAroURw/9KOSY=;
	b=IAWt0SfJ/x6Rua0GJKTsniQlHaa7RkHqIpJ9EMVFR3ce3BqvKRrKwc23bo2DorlmLi
	98bcRuPE+rsWsWDrYSMCZXTau+yTp/hEjndDMn+VFauWhP5ykI91bP2ujITL3cVA0kz7
	ZgHHhbBvlvtcj8LjskoNQmSwAlOPxMXn+lffRs2XdE+2i8+rEES8f14B33gcg9pcuqBk
	BFBy7XeidhH5QIIJRcwUSrShf0OP3E4u08ZTDxNVccbwsafETAHAo8JEzwQA8vO17dDO
	Be4KoVTSiSOsIUwncg31RckubwypAd/Rd0lONbaxh2vfX40TZabkBGOnHjGplA0BDYdu
	RunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HhDuzd65kBzKHrO9zozMNu9X+4UtiRMAroURw/9KOSY=;
	b=IQKib9OOuql1zwIIjc6bFK/dzBB/jBvMaXbCNwJ3NHjk65iOPIc1xVQatIc/2ximap
	8mjpwQF+wVYZL6UEq9LQMYiXoVj6PKvaU9TU+P7HANwPIlWoW60VjTEWM9oe/4+nwxOC
	+48uxtf9zLDPHk7uiuMauRZUNzDW2qRCTzNYIP2cvD4DJmrwgbYVdelNCV/oq6mDatwm
	gd8QkiT8FsmM3qgl2iQ1ZcO6b/OHirm3c13xJW4QfmsFbNXLNYqi+dGagNURxM/PL2ro
	s4omsIjq0iEMkulxZUivPz6XAwtEvl8EpbPwqdljQEPKKgL5WdvSg4P2f1N0z66cSIoq
	uEkw==
X-Gm-Message-State: AKwxytf48QO5rKnWTKue9xmzXX/ltHfEVXI0c7mLGgT8POy7WjQmA7CX
	/Q/kRXUmw4PXRN0Z9L/mSkv1HHr1m2taELzfyZs=
X-Google-Smtp-Source: AH8x224ShpqAwM/D2TnfFTbCuu0rppmGMP8s/n7gSEGXFOwQQYOX0mM0rqQKgU8Sca50ZHPMcoxtHGlFjFYsIZwb3rY=
X-Received: by 10.223.136.167 with SMTP id f36mr9922987wrf.200.1517315166176; 
	Tue, 30 Jan 2018 04:26:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 30 Jan 2018 04:26:05 -0800 (PST)
In-Reply-To: <CAJTo0LYmP0iqbm5X50FPi80=LB+tUD90JVzYPf8uah=c0ysiew@mail.gmail.com>
References: <20180130083003.39-1-Martin.Jansa@gmail.com>
	<CAJTo0LYmP0iqbm5X50FPi80=LB+tUD90JVzYPf8uah=c0ysiew@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Jan 2018 13:26:05 +0100
Message-ID: <CA+chaQc57j=7JQx3iNHfomkjVXmZX7Lm+yLED+xzMg7uhrVa8w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	Joe Slater <jslater@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: check that waf exists before trying to execute it
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
X-List-Received-Date: Tue, 30 Jan 2018 12:26:05 -0000
Content-Type: multipart/alternative; boundary="001a1149141a7e0ab10563fd7750"

--001a1149141a7e0ab10563fd7750
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Andreas who added waf inherit in jack in:
commit 0f8f1973e229a0799098bc2334416fec8c608b50
Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
Date:   Sat Oct 8 12:03:32 2016 +0200

    jack: swap to jack2

+Bian who added waf samba in:
commit 962e346df99696a10657a2ea7b2166dfaf290289
Author: Bian Naimeng <biannm@cn.fujitsu.com>
Date:   Tue Jun 16 14:18:25 2015 +0900

    waf-samba: add new class

    waf-samba is a build system used by samba related software

+Joe and Joe and who maintains samba and related recipes + meta-networking


On Tue, Jan 30, 2018 at 1:03 PM, Burton, Ross <ross.burton@intel.com> wrote=
:

> Why would they do that?  Shouldn't it be a fatal bug if waf isn't found?
>
> On 30 January 2018 at 08:30, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> * there are some recipes like jack and other which inherit waf-samba
>> which inherits waf, but they don't use waf for configure, strange isn't
>> it?
>>
>> * fixes:
>> WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf --version,
>> exit code 127. Assuming waf version without bindir/libdir support.
>> WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --version,
>> exit code 127. Assuming waf version without bindir/libdir support.
>> WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf
>> --version, exit code 127. Assuming waf version without bindir/libdir
>> support.
>> WARNING: jack-1.9.10+gitAUTOINC+2d1d323505-r0 do_configure: Unable to
>> execute waf --version, exit code 1. Assuming waf version without
>> bindir/libdir support.
>> WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf
>> --version, exit code 127. Assuming waf version without bindir/libdir
>> support.
>> WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf --version,
>> exit code 127. Assuming waf version without bindir/libdir support.
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta/classes/waf.bbclass | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
>> index c3e744e5de..eec4d9496d 100644
>> --- a/meta/classes/waf.bbclass
>> +++ b/meta/classes/waf.bbclass
>> @@ -29,6 +29,9 @@ python waf_preconfigure() {
>>      from distutils.version import StrictVersion
>>      srcsubdir =3D d.getVar('S')
>>      wafbin =3D os.path.join(srcsubdir, 'waf')
>> +    if not os.path.isfile(wafbin):
>> +        bb.note("%s doesn't exist, cannot check whether it supports
>> --bindir/--libdir" % wafbin)
>> +        return
>>      status, result =3D oe.utils.getstatusoutput(wafbin + " --version")
>>      if status !=3D 0:
>>          bb.warn("Unable to execute waf --version, exit code %d. Assumin=
g
>> waf version without bindir/libdir support." % status)
>> --
>> 2.15.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--001a1149141a7e0ab10563fd7750
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+Andreas who added waf inherit in jack in:<div><div>commit=
 0f8f1973e229a0799098bc2334416fec8c608b50</div><div>Author: Andreas M=C3=BC=
ller &lt;<a href=3D"mailto:schnitzeltony@googlemail.com">schnitzeltony@goog=
lemail.com</a>&gt;</div><div>Date:=C2=A0 =C2=A0Sat Oct 8 12:03:32 2016 +020=
0</div><div><br></div><div>=C2=A0 =C2=A0 jack: swap to jack2</div></div><di=
v><br></div><div>+Bian who added waf samba in:</div><div><div>commit 962e34=
6df99696a10657a2ea7b2166dfaf290289</div><div>Author: Bian Naimeng &lt;<a hr=
ef=3D"mailto:biannm@cn.fujitsu.com">biannm@cn.fujitsu.com</a>&gt;</div><div=
>Date:=C2=A0 =C2=A0Tue Jun 16 14:18:25 2015 +0900</div><div><br></div><div>=
=C2=A0 =C2=A0 waf-samba: add new class</div><div>=C2=A0 =C2=A0=C2=A0</div><=
div>=C2=A0 =C2=A0 waf-samba is a build system used by samba related softwar=
e</div></div><div><br></div><div>+Joe and Joe and who maintains samba and r=
elated recipes + meta-networking</div><div><br></div></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Tue, Jan 30, 2018 at 1:03 PM, =
Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com"=
 target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div dir=3D"ltr">Why would they do that?=C2=A0 Should=
n&#39;t it be a fatal bug if waf isn&#39;t found?</div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote"><div><div class=3D"h5">On 30 January =
2018 at 08:30, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.=
jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wr=
ote:<br></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5">*=
 there are some recipes like jack and other which inherit waf-samba<br>
which inherits waf, but they don&#39;t use waf for configure, strange isn&#=
39;t<br>
it?<br>
<br>
* fixes:<br>
WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf --version, ex=
it code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --version, exit=
 code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf --version, =
exit code 127. Assuming waf version without bindir/libdir<br>
support.<br>
WARNING: jack-1.9.10+gitAUTOINC+2d1d323<wbr>505-r0 do_configure: Unable to =
execute waf --version, exit code 1. Assuming waf version without bindir/lib=
dir support.<br>
WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf --version,=
 exit code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf --version, ex=
it code 127. Assuming waf version without bindir/libdir support.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/waf.bbclass | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index c3e744e5de..eec4d9496d 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -29,6 +29,9 @@ python waf_preconfigure() {<br>
=C2=A0 =C2=A0 =C2=A0from distutils.version import StrictVersion<br>
=C2=A0 =C2=A0 =C2=A0srcsubdir =3D d.getVar(&#39;S&#39;)<br>
=C2=A0 =C2=A0 =C2=A0wafbin =3D os.path.join(srcsubdir, &#39;waf&#39;)<br>
+=C2=A0 =C2=A0 if not os.path.isfile(wafbin):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;%s doesn&#39;t exist, cannot che=
ck whether it supports --bindir/--libdir&quot; % wafbin)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 =C2=A0status, result =3D oe.utils.getstatusoutput(wafbi<wbr>n=
 + &quot; --version&quot;)<br>
=C2=A0 =C2=A0 =C2=A0if status !=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;Unable to execute waf --ver=
sion, exit code %d. Assuming waf version without bindir/libdir support.&quo=
t; % status)<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888"><span class=3D"m=
_7061875709844897417HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></font></span></blockquote></div><br></div>
</blockquote></div><br></div>

--001a1149141a7e0ab10563fd7750--
