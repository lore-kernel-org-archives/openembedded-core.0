Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id C67A77503C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 09:33:17 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id t192-v6so4550875itc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2018 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IEO4xDRqdmoiIWjcJ8vf4Ya3F9r/m34fLCZ3jL/Pn+4=;
	b=llClI1O36BkWieokQ0BFRdArwZ69UGN0ajfq5CXUTpfjo10j1MOR/N1AnTL+5VJbGI
	3TfVaUoRDJcwTs7PQ7AZHmyRQDWPraKTbXFOeci37mz74I+yUDUYXM7G5anW8ei3aIQq
	g3DsZspzgby0GD8gLBZ5AZ8nh0g76RQQJITkdRj0HgYKb/TNMhUtTZkIitUosBmVBivF
	simGckFupWaqrsmM6mmEJB6ob8F/GovS77vy9hiFOAb1w2mw0t/xV2uR9pDjNdPY68HK
	4JLvgyCktPGk1t4Kx3pvsvXETnH66pmoR0cLigu6thK1UhVgdZSA2GZH+ZtasbEcWXvB
	k8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IEO4xDRqdmoiIWjcJ8vf4Ya3F9r/m34fLCZ3jL/Pn+4=;
	b=KjyE+Wrc9f9ScboBVPdgxjkHTVzFjqRKdrCi3aA3e9IHsOecizL2D2WN3qcOyM6Tpp
	QQKIpDKadirSSpoDhn6dap+ATPnAAXYOH88rnkLmHS6+H/h1aFJld2mc2VQTPNJpkscl
	L1aY2pMuQEmCNZIsrHuKUvZiYRCKfRS68CUOdZVvshcm4KSIKwWaY8no9Z4taaTa778d
	tCTQ/MhAa2TVPfiPLp2K9s4yZEgmDSWLivLn38csqCQyXK7YhXNwI77HEScuD9uHd4w+
	MI65bFyI6cN571i8l+DcDK5aYVeNWlQlM5mszLWASPKZOPaNHWVQYD9tu0X/zfeUNaWg
	tLCw==
X-Gm-Message-State: AElRT7GNn746t5sG+L/cMUAY+4sLcRXDXkunyngAXoRj1KGaRUikK7hK
	z5LRmwYslJMTVQ4Sm0aEcRH4zEyhGbw4L8UNIwM=
X-Google-Smtp-Source: AIpwx48V20IDRqqNwWCdNA6WqwWENTyzQJcRVDnyPONtjPDVWDm+Dej1cEJ38k6kbi6M65rwMFEJkBAtqy6s/iwFRRI=
X-Received: by 2002:a24:9987:: with SMTP id
	a129-v6mr16491099ite.124.1523007198338; 
	Fri, 06 Apr 2018 02:33:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.176.144 with HTTP; Fri, 6 Apr 2018 02:32:58 -0700 (PDT)
In-Reply-To: <CAPGMVzGFyEiAD3XQuqWYOkomDiAht3Y+jQ=j7Yz_Q1N5Zj1EYQ@mail.gmail.com>
References: <CAPGMVzHrMfL77A2A2+JLFugomdnW_OB2EikVamyqTJjqoDxmUA@mail.gmail.com>
	<CAPGMVzGFyEiAD3XQuqWYOkomDiAht3Y+jQ=j7Yz_Q1N5Zj1EYQ@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Fri, 6 Apr 2018 11:32:58 +0200
Message-ID: <CAB2nKc-JYQaq_g95jQ_2wArdcJT=5wogtkj70-32pEfaoJnHLQ@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [meta-ros] ros build error on poky
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
X-List-Received-Date: Fri, 06 Apr 2018 09:33:17 -0000
Content-Type: multipart/alternative; boundary="0000000000000c340f05692abfab"

--0000000000000c340f05692abfab
Content-Type: text/plain; charset="UTF-8"

 Your error [name 'oe_filter_out' is not defined] means you don't have
oe_filter_out function defined in poky/meta/classes/utils.bbclass

2018-04-06 11:06 GMT+02:00 Rajath C S <rajathcs.1996@gmail.com>:

> i understand that this isnt specific to ros queries but i do have posted
> the same at the ROS mailing-list and to ROS maintainers and the issue is to
> be yet resolved perfectly.
>
> Thanks
>
> Rajath C S,
> 9964182112,
> Bangalore - 560060
>
> On Fri, Apr 6, 2018 at 12:34 PM, Rajath C S <rajathcs.1996@gmail.com>
> wrote:
>
>> 1. i'd like to know does the process being followed in this link lead us
>> to installation of ROS-kinetic / indigo or others, hope i am clear..? that
>> is want to know if the process of including and compiling meta-ros layer
>> for yocto equal to install ros on ubuntu i mean in literal sense
>>
>> http://wiki.ros.org/hydro/Installation/OpenEmbedded
>>
>> 2. Is the wxwidgets_2.9.5.bb recipe important because i am getting the
>> below error when 'bitbake roslaunch' is used
>>
>> ERROR: ExpansionError during parsing /home/jarvis/poky/meta-ros/rec
>> ipes-extended/wxwidgets/wxwidgets_2.9.5.bb                          |
>> ETA:  0:02:07
>> Traceback (most recent call last):
>> bb.data_smart.ExpansionError: Failure expanding variable CXXFLAGS[:=],
>> expression was ${@oe_filter_out('-fvisibility-inlines-hidden', ' -O2
>> -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/home/jarvi
>> s/poky/openembedded-core/build/tmp-glibc/work/i586-oe-linux/
>> wxwidgets/2.9.5-r0=/usr/src/debug/wxwidgets/2.9.5-r0
>> -fdebug-prefix-map=/home/jarvis/poky/openembedded-core/build
>> /tmp-glibc/work/i586-oe-linux/wxwidgets/2.9.5-r0/recipe-sysroot-native=
>> -fdebug-prefix-map=/home/jarvis/poky/openembedded-core/build
>> /tmp-glibc/work/i586-oe-linux/wxwidgets/2.9.5-r0/recipe-sysroot=
>> -fvisibility-inlines-hidden', d)} which triggered exception NameError: name
>> 'oe_filter_out' is not defined
>>
>>
>> Thanks
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--0000000000000c340f05692abfab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">Your error [name &#39;oe_filter_out&#39; is not =
defined] means you don&#39;t have=C2=A0<span style=3D"color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant=
-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style=
:initial;text-decoration-color:initial;float:none;display:inline">oe_filter=
_out</span>=C2=A0function defined in=C2=A0poky/meta/classes/utils.bbclass</=
span><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">20=
18-04-06 11:06 GMT+02:00 Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto=
:rajathcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;=
</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>i understa=
nd that this isnt specific to ros queries but i do have posted the same at =
the ROS mailing-list and to ROS maintainers and the issue is to be yet reso=
lved perfectly.<br><br></div>Thanks<span class=3D"HOEnZb"><font color=3D"#8=
88888"><br></font></span></div><div class=3D"gmail_extra"><span class=3D"HO=
EnZb"><font color=3D"#888888"><br clear=3D"all"><div><div class=3D"m_-51398=
19360390846227gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br></div></div>Bangalore - 56=
0060<br></div></div></div></font></span><div><div class=3D"h5">
<br><div class=3D"gmail_quote">On Fri, Apr 6, 2018 at 12:34 PM, Rajath C S =
<span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"=
_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div><div>1. i&#39;d like to know does the p=
rocess being followed in this link lead us to installation of ROS-kinetic /=
 indigo or others, hope i am clear..? that is want to know if the process o=
f including and compiling meta-ros layer for yocto equal to install ros on =
ubuntu i mean in literal sense<br><br><a href=3D"http://wiki.ros.org/hydro/=
Installation/OpenEmbedded" target=3D"_blank">http://wiki.ros.org/hydro/Inst=
<wbr>allation/OpenEmbedded</a><br><br></div>2. Is the <a href=3D"http://wxw=
idgets_2.9.5.bb" target=3D"_blank">wxwidgets_2.9.5.bb</a> recipe important =
because i am getting the below error when &#39;bitbake roslaunch&#39; is us=
ed<br><br>ERROR: ExpansionError during parsing /home/jarvis/poky/meta-ros/r=
ec<wbr>ipes-extended/wxwidgets/<a href=3D"http://wxwidgets_2.9.5.bb" target=
=3D"_blank">wxwidg<wbr>ets_2.9.5.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wb=
r>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ETA:=C2=A0 0:02:07<br>Traceb=
ack (most recent call last):<br>bb.data_smart.ExpansionError: Failure expan=
ding variable CXXFLAGS[:=3D], expression was ${@oe_filter_out(&#39;-fvisibi=
lity<wbr>-inlines-hidden&#39;, &#39; -O2 -pipe -g -feliminate-unused-debug-=
types -fdebug-prefix-map=3D/home/jarvi<wbr>s/poky/openembedded-core/build<w=
br>/tmp-glibc/work/i586-oe-linux/<wbr>wxwidgets/2.9.5-r0=3D/usr/src/<wbr>de=
bug/wxwidgets/2.9.5-r0 -fdebug-prefix-map=3D/home/jarvi<wbr>s/poky/openembe=
dded-core/build<wbr>/tmp-glibc/work/i586-oe-linux/<wbr>wxwidgets/2.9.5-r0/r=
ecipe-<wbr>sysroot-native=3D -fdebug-prefix-map=3D/home/jarvi<wbr>s/poky/op=
enembedded-core/build<wbr>/tmp-glibc/work/i586-oe-linux/<wbr>wxwidgets/2.9.=
5-r0/recipe-<wbr>sysroot=3D=C2=A0 -fvisibility-inlines-hidden&#39;, d)} whi=
ch triggered exception NameError: name &#39;oe_filter_out&#39; is not defin=
ed<br><br><br></div>Thanks<br></div>
</blockquote></div><br></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--0000000000000c340f05692abfab--
