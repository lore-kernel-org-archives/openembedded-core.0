Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7510D78969
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:32:19 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id h23so6215587iob.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 04:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lTgBg9wi7x3qRvru0MAcyFeEFeZbx4YZlaSZgt7q2BA=;
	b=PAdPS2Wt2JUQ82mwzvY6L1TdhV4lA/eLaAaeZhpMeeWnFYcER9hu6uKccHqA6aPPUJ
	SHBeW49MFEs0TQBJUdkx+BC91hEGnV8ZTXlr/u0DYntGvoSz98UVI+5yySb0qFsguKrz
	3h8z4tLUcujf1IryfmwlAW2exWZWeXKeLIoHomu05KWueH5flhAX3c9C3XzBpMI2j4ds
	yBkD1929phgiItVAj3Y7zzCf/KT7r+/+zmcP9KFQYU4JDUnjjAlj66PkGepveiTTXCkS
	rb1a8yFlwRI8+MJyjYxa6/v+UQuq9/2gJTG20pcu433xJlmMLGc/P5L3sFu7MWCdZKJv
	j+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lTgBg9wi7x3qRvru0MAcyFeEFeZbx4YZlaSZgt7q2BA=;
	b=Np2cjiCH/WRE/e+iL1UaXbKVC0QF38uwfpABbbYOjsxEFL5Zmocq1APnmxhIqTBPlx
	GRDOknFSWecnshL/IwvPcxh8jaPc1fG522RbR8afljBopD0HZknY6yXylABxPbrJh3kz
	dnyee4Vme+omlTp1QdKHUDRxsQjR3iN+SfHo3EPx0HO+4UH96fL675GwwkzRRYxciuPf
	/Sq9LZZQNkDowEAi9IId7aPAUAg4rgthS5IAapjR6y5x8UigDH+iAwFER/pD5rENGJ7o
	2m1qaK/Jwhs22CENLov8OzkLoDyVfD6YJ4JEWxXKSGIVg1ZMPKutSFtcbQSOKtTrYIjy
	zAQA==
X-Gm-Message-State: AElRT7EdFTfW/znrg6WqG+Wxte8viwCPP6Tc8GClI320QoCDLnhosPZn
	fVGW2IDUq9iSnDJU4jzIrJHfnputcfnIvndsJxTYdw==
X-Google-Smtp-Source: AG47ELtjJwk9IxFhYckKZtQMUeOhPisfARmv4N34geksiZyljxJlnjuaQORkEXPiKVXWlHAlf/Kl6WkW6K9lpUfgb9Q=
X-Received: by 10.107.161.200 with SMTP id k191mr19159616ioe.270.1521631940680;
	Wed, 21 Mar 2018 04:32:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 21 Mar 2018 04:32:00 -0700 (PDT)
In-Reply-To: <CAPGMVzFJU+UA6_xa=ZzJqAfFrFkCnT2AXrCybxyuvDE2c9Ut3w@mail.gmail.com>
References: <CAPGMVzEUccZZpxwJpH0akzn7+FyaZf0NbDZoN=73+u8g=yA4Fg@mail.gmail.com>
	<CAJTo0LYGumRqn5=GeB=41abhNn8s6dqoE_d3gMZThwkLor-_zA@mail.gmail.com>
	<CAPGMVzEqtt8C0DCR28fMik6c+9jGtM3=uKRbxrMDEv=8CexdiQ@mail.gmail.com>
	<CAPGMVzHyC098J=w5Xbt8z__2-9LVSeBhiJ1U+EHQLiGU1x+huw@mail.gmail.com>
	<CAJTo0LZ49vPGn8rWMSj607aQZP8HQLMb4o9cq3yvTAEk57ecaA@mail.gmail.com>
	<CAPGMVzHgcsNe9mjrTvGTyBztX-TKuip1Tx4+HDOk7UP-H9mwxA@mail.gmail.com>
	<CAJTo0LYbWfqRe4hE3279Wmpy-5dSCNfXeT9VwFvp_qHtS+BcHQ@mail.gmail.com>
	<CAPGMVzEO8K4gM=_f_+wTrqeyF12W4S-v7nx5Ff6HvN7vvOkjnA@mail.gmail.com>
	<CAJTo0LaSyNEmDbxqgtt5LhEv=pZ-fMJTynK_i3GKTs+jRop2wQ@mail.gmail.com>
	<CAPGMVzFJU+UA6_xa=ZzJqAfFrFkCnT2AXrCybxyuvDE2c9Ut3w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Mar 2018 11:32:00 +0000
Message-ID: <CAJTo0LbJAebMeAqhPrq6so=NWx86sWkfWERuPE2K2UwKdZzUKw@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-openembeded] bug in adding network layer
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
X-List-Received-Date: Wed, 21 Mar 2018 11:32:19 -0000
Content-Type: multipart/alternative; boundary="001a113e91984dbc1f0567ea8b46"

--001a113e91984dbc1f0567ea8b46
Content-Type: text/plain; charset="UTF-8"

I never mentioned glib-networking and it wont help at all.

If connman can't see your wifi then your kernel is missing the drivers  you
need.

Ross

On 21 March 2018 at 10:53, Rajath C S <rajathcs.1996@gmail.com> wrote:

> yes, when clicked on it. it says Ethernet connection
>
> so, inside oe-core there is a folder and file called :
> glib-networking_2.54.1.bb; so now acording to your second msg to enable
> wifi should i include this file in MAGE_INSTALL_append command of
> local.conf?
>
> Rajath C S,
> 9964182112,
> Bangalore - 560060
>
> On Wed, Mar 21, 2018 at 4:14 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>> Then you have a nice button in the top right to setup wifi already.
>>
>> Ross
>>
>> On 21 March 2018 at 10:42, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>
>>> sure, i will look into that, thanks.
>>> and , i am actually using core-image-sato
>>>
>>> regards,
>>> Rajath C S
>>>
>>> Rajath C S,
>>> 9964182112,
>>> Bangalore - 560060
>>>
>>> On Wed, Mar 21, 2018 at 4:11 PM, Burton, Ross <ross.burton@intel.com>
>>> wrote:
>>>
>>>> Ideally in an image of your own creation, as local.conf tweaking is for
>>>> experimentation only.
>>>>
>>>> There's a section in the manual about customising images, and I
>>>> recommend that you start from an image with functionality instead of
>>>> starting from a minimal image and trying to discover how to do basics such
>>>> as make networking functional.
>>>>
>>>> Ross
>>>>
>>>> On 21 March 2018 at 10:35, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>>>
>>>>> so the  connman / ifupdown and wireless-tools have to be placed in the
>>>>> local.conf file right?
>>>>>
>>>>> Rajath C S,
>>>>> 9964182112,
>>>>> Bangalore - 560060
>>>>>
>>>>> On Wed, Mar 21, 2018 at 3:57 PM, Burton, Ross <ross.burton@intel.com>
>>>>> wrote:
>>>>>
>>>>>> ifupdown and wireless-tools will give you the basics to configure it
>>>>>> by hand, or use connman.  Or network-manager, in meta-oe.
>>>>>>
>>>>>> core-image-sato includes both connman and a UI to join to wifi.
>>>>>>
>>>>>> Ross
>>>>>>
>>>>>> On 21 March 2018 at 10:25, Rajath C S <rajathcs.1996@gmail.com>
>>>>>> wrote:
>>>>>>
>>>>>>>
>>>>>>> thanks,
>>>>>>>
>>>>>>> i will follow the said things,
>>>>>>>
>>>>>>> but as of now my situation is as such : "
>>>>>>> sure, i will have one other question that is how to establish
>>>>>>> internet connection on to poky?
>>>>>>> that is , i have placed the meta-networking layer in bblayer.conf
>>>>>>> file so after that which recipe should i add to local.conf so that wireless
>>>>>>> connection is established on the poky?
>>>>>>>
>>>>>>> Do help with the steps
>>>>>>>
>>>>>>> Thanks"
>>>>>>> I will try and implement networking from oe-core
>>>>>>>
>>>>>>>
>>>>>>> Rajath C S,
>>>>>>> 9964182112,
>>>>>>> Bangalore - 560060
>>>>>>>
>>>>>>> On Wed, Mar 21, 2018 at 3:40 PM, Burton, Ross <ross.burton@intel.com
>>>>>>> > wrote:
>>>>>>>
>>>>>>>> First, you don't need meta-networking to make networking "work",
>>>>>>>> because oe-core has the basics.
>>>>>>>>
>>>>>>>> Second, you need to match the release of layers.  You're using
>>>>>>>> meta-networking master, and a previous release of poky.  Checkout the
>>>>>>>> corresponding release branch of meta-networking.
>>>>>>>>
>>>>>>>> Ross
>>>>>>>>
>>>>>>>> On 21 March 2018 at 07:29, Rajath C S <rajathcs.1996@gmail.com>
>>>>>>>> wrote:
>>>>>>>>
>>>>>>>>> I am tryiing to add meta-networking layer (to get Internet
>>>>>>>>> connection to poky)and i have included the following line of code in
>>>>>>>>> bbconfig file
>>>>>>>>> /home/jarvis/poky/meta-openembedded/meta-networking \
>>>>>>>>>
>>>>>>>>> but while building i get this below error
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> ERROR: ExpansionError during parsing /home/jarvis/poky/meta-openemb
>>>>>>>>> edded/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb
>>>>>>>>> Traceback (most recent call last):
>>>>>>>>> bb.data_smart.ExpansionError: Failure expanding variable
>>>>>>>>> do_compile, expression was     python ./buildtools/bin/waf
>>>>>>>>> ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
>>>>>>>>>  which triggered exception AttributeError: module 'oe.utils' has
>>>>>>>>> no attribute 'parallel_make_argument'
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> DO help,
>>>>>>>>>
>>>>>>>>> is there any other way to establish Internet connection inside
>>>>>>>>> poky?
>>>>>>>>>
>>>>>>>>> Thanks
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> --
>>>>>>>>> _______________________________________________
>>>>>>>>> Openembedded-core mailing list
>>>>>>>>> Openembedded-core@lists.openembedded.org
>>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
>

--001a113e91984dbc1f0567ea8b46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I never mentioned glib-networking and it wont help at all.=
<div><br></div><div>If connman can&#39;t see your wifi then your kernel is =
missing the drivers =C2=A0you need.</div><div><br></div><div>Ross</div></di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 March 201=
8 at 10:53, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.199=
6@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>yes, when clicked=
 on it. it says Ethernet connection<br><br></div>so, inside oe-core there i=
s a folder and file called : <a href=3D"http://glib-networking_2.54.1.bb" t=
arget=3D"_blank">glib-networking_2.54.1.bb</a>; so now acording to your sec=
ond msg to enable wifi should i include this file in MAGE_INSTALL_append co=
mmand of local.conf?<br></div><div class=3D"gmail_extra"><span class=3D""><=
br clear=3D"all"><div><div class=3D"m_-8758481982879607889gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>Rajath C S,<b=
r>9964182112,<br></div></div>Bangalore - 560060<br></div></div></div>
<br></span><div><div class=3D"h5"><div class=3D"gmail_quote">On Wed, Mar 21=
, 2018 at 4:14 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ros=
s.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Then you have a n=
ice button in the top right to setup wifi already.<span class=3D"m_-8758481=
982879607889HOEnZb"><font color=3D"#888888"><div><br></div><div>Ross</div><=
/font></span></div><div class=3D"m_-8758481982879607889HOEnZb"><div class=
=3D"m_-8758481982879607889h5"><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On 21 March 2018 at 10:42, Rajath C S <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gm=
ail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D=
"ltr"><div><div><div>sure, i will look into that, thanks.<br></div>and , i =
am actually using core-image-sato<br><br></div>regards,<br></div>Rajath C S=
 <br></div><div class=3D"gmail_extra"><span><br clear=3D"all"><div><div cla=
ss=3D"m_-8758481982879607889m_-5634036908401493779m_6704635246269763952gmai=
l_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>=
Rajath C S,<br>9964182112,<br></div></div>Bangalore - 560060<br></div></div=
></div>
<br></span><div><div class=3D"m_-8758481982879607889m_-5634036908401493779h=
5"><div class=3D"gmail_quote">On Wed, Mar 21, 2018 at 4:11 PM, Burton, Ross=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_=
blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div dir=3D"ltr">Ideally in an image of your own creation, as loc=
al.conf tweaking is for experimentation only.<div><br></div><div>There&#39;=
s a section in the manual about customising images, and I recommend that yo=
u start from an image with functionality instead of starting from a minimal=
 image and trying to discover how to do basics such as make networking func=
tional.</div><span class=3D"m_-8758481982879607889m_-5634036908401493779m_6=
704635246269763952HOEnZb"><font color=3D"#888888"><div><br></div><div>Ross<=
/div></font></span></div><div class=3D"m_-8758481982879607889m_-56340369084=
01493779m_6704635246269763952HOEnZb"><div class=3D"m_-8758481982879607889m_=
-5634036908401493779m_6704635246269763952h5"><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On 21 March 2018 at 10:35, Rajath C S <span dir=
=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">r=
ajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr">so the=C2=A0 connman / ifupdown and wireless-tools hav=
e to be placed in the local.conf file right?<br></div><div class=3D"gmail_e=
xtra"><span><br clear=3D"all"><div><div class=3D"m_-8758481982879607889m_-5=
634036908401493779m_6704635246269763952m_8402836057187324486m_7549818448200=
897835gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">=
<div><div>Rajath C S,<br>9964182112,<br></div></div>Bangalore - 560060<br><=
/div></div></div>
<br></span><div><div class=3D"m_-8758481982879607889m_-5634036908401493779m=
_6704635246269763952m_8402836057187324486h5"><div class=3D"gmail_quote">On =
Wed, Mar 21, 2018 at 3:57 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">ifupdo=
wn and wireless-tools will give you the basics to configure it by hand, or =
use connman.=C2=A0 Or network-manager, in meta-oe.<div><br></div><div>core-=
image-sato includes both connman and a UI to join to wifi.</div><span class=
=3D"m_-8758481982879607889m_-5634036908401493779m_6704635246269763952m_8402=
836057187324486m_7549818448200897835HOEnZb"><font color=3D"#888888"><div><b=
r></div><div>Ross</div></font></span></div><div class=3D"m_-875848198287960=
7889m_-5634036908401493779m_6704635246269763952m_8402836057187324486m_75498=
18448200897835HOEnZb"><div class=3D"m_-8758481982879607889m_-56340369084014=
93779m_6704635246269763952m_8402836057187324486m_7549818448200897835h5"><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 March 2018 at =
10:25, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gma=
il.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"m_-8758481982879607889m_-56340=
36908401493779m_6704635246269763952m_8402836057187324486m_75498184482008978=
35m_-862766904418843875HOEnZb"><div class=3D"m_-8758481982879607889m_-56340=
36908401493779m_6704635246269763952m_8402836057187324486m_75498184482008978=
35m_-862766904418843875h5"><div dir=3D"ltr"><br><div class=3D"gmail_quote">=
<div dir=3D"ltr"><div><div><div>thanks,<br><br></div>i will follow the said=
 things,<br><br></div>but as of now my situation is as such : &quot;<div><d=
iv><div>sure, i will have one other question that is how to establish inter=
net connection on to poky?<br></div>that
 is , i have placed the meta-networking layer in bblayer.conf file so=20
after that which recipe should i add to local.conf so that wireless=20
connection is established on the poky?<br><br></div>Do help with the steps =
<br><br></div>Thanks&quot;<br></div>I will try and implement networking fro=
m oe-core<span class=3D"m_-8758481982879607889m_-5634036908401493779m_67046=
35246269763952m_8402836057187324486m_7549818448200897835m_-8627669044188438=
75m_473202723307373014HOEnZb"><font color=3D"#888888"><br><div><br></div></=
font></span></div><div class=3D"gmail_extra"><span class=3D"m_-875848198287=
9607889m_-5634036908401493779m_6704635246269763952m_8402836057187324486m_75=
49818448200897835m_-862766904418843875m_473202723307373014HOEnZb"><font col=
or=3D"#888888"><br clear=3D"all"><div><div class=3D"m_-8758481982879607889m=
_-5634036908401493779m_6704635246269763952m_8402836057187324486m_7549818448=
200897835m_-862766904418843875m_473202723307373014m_4339970214154050837gmai=
l_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>=
Rajath C S,<br>9964182112,<br></div></div>Bangalore - 560060<br></div></div=
></div></font></span><div><div class=3D"m_-8758481982879607889m_-5634036908=
401493779m_6704635246269763952m_8402836057187324486m_7549818448200897835m_-=
862766904418843875m_473202723307373014h5">
<br><div class=3D"gmail_quote">On Wed, Mar 21, 2018 at 3:40 PM, Burton, Ros=
s <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"=
_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr">First, you don&#39;t need meta-networking to ma=
ke networking &quot;work&quot;, because oe-core has the basics.<div><br></d=
iv><div>Second, you need to match the release of layers.=C2=A0 You&#39;re u=
sing meta-networking master, and a previous release of poky.=C2=A0 Checkout=
 the corresponding release branch of meta-networking.</div><div><br></div><=
div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e"><div><div class=3D"m_-8758481982879607889m_-5634036908401493779m_6704635=
246269763952m_8402836057187324486m_7549818448200897835m_-862766904418843875=
m_473202723307373014m_4339970214154050837h5">On 21 March 2018 at 07:29, Raj=
ath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" ta=
rget=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br></div></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div><div class=3D"m_-8758481982879607889m=
_-5634036908401493779m_6704635246269763952m_8402836057187324486m_7549818448=
200897835m_-862766904418843875m_473202723307373014m_4339970214154050837h5">=
<div dir=3D"ltr"><div>I am tryiing to add meta-networking layer (to get Int=
ernet connection to poky)and i have included the following line of code in =
bbconfig file <br>/home/jarvis/poky/meta-openemb<wbr>edded/meta-networking =
\<br><br></div>but while building i get this below error<br><br><div><div><=
br>ERROR: ExpansionError during parsing /home/jarvis/poky/meta-openemb<wbr>=
edded/meta-networking/recipes-<wbr>support/libtdb/<a href=3D"http://libtdb_=
1.3.15.bb" target=3D"_blank">libtdb_1.3.15.b<wbr>b</a><br>Traceback (most r=
ecent call last):<br>bb.data_smart.ExpansionError: Failure expanding variab=
le do_compile, expression was=C2=A0=C2=A0=C2=A0=C2=A0 python ./buildtools/b=
in/waf ${@oe.utils.parallel_make_argu<wbr>ment(d, &#39;-j%d&#39;, limit=3D6=
4)}<br>=C2=A0which triggered exception AttributeError: module &#39;oe.utils=
&#39; has no attribute &#39;parallel_make_argument&#39;<br><br><br></div><d=
iv>DO help,<br><br></div><div>is there any other way to establish Internet =
connection inside poky?<br><br></div><div>Thanks<br></div><div><br></div></=
div></div>
<br></div></div><span class=3D"m_-8758481982879607889m_-5634036908401493779=
m_6704635246269763952m_8402836057187324486m_7549818448200897835m_-862766904=
418843875m_473202723307373014m_4339970214154050837HOEnZb"><font color=3D"#8=
88888">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></font></span></blockquote></div><br></div>
</blockquote></div><br></div></div></div>
</div><br></div>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div></div></div>
</blockquote></div><br></div>

--001a113e91984dbc1f0567ea8b46--
