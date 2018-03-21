Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0A4CE7882D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 10:53:11 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id d1so2990088ual.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UVUz0ej0TBnvkeG5FRKKOBUjCfwy7jLnbT0Ea1XdSh4=;
	b=e9w0C+zJRQCbMUjq75mEVImc+n4sVRNg5iF2/aJdk4P+Feh9rgFhXmzhKq8GgVgUi/
	nFxw1MyYoR220UJGqYWy7qyWpnMFneg7m+CqUZgkHA7obXv9xsZF788KaLhh1jmXwjmr
	MD+sqzN4jca6rbufbalVGfm1VDATnvBBnvVn+euNz0T35lKuVPIPGCwyWiwpZqfcplL4
	Ky9lfrwRYCrH9+Bvngn68Pv11bSAG8wJTVnY5OGUkC2lQQIdYICyP3TZovzsoHeEIGWi
	aZOPkkp4LWsMpqzUio/Mm4aUe0qiTDzh5SIwwBUWtH/wWhZHVaWlUxiVIjKJVVo0KnfZ
	63nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UVUz0ej0TBnvkeG5FRKKOBUjCfwy7jLnbT0Ea1XdSh4=;
	b=cLKZrX+87FHLG5/wKYVwS7EN0CmGw+THY6YlWfjOtCgcFfy73PVqnnJYDs7ooTbG2r
	lMqoTgHsNPWCBPzwpG0wdWY1apMt6p+j0+MwsacYNY644/FFJX9eZ/VFN/tpp7C/9/qh
	11C+t7KTRhe59aL6J4UPl/TVxO2W1LDiyJ5eG+Lm3niNG+j9dmlGImG3b5vJwNt3Mrd9
	tSjkgHVYTyXoZEO9CEb2kSlmxxY1oUUVZ7X1BrNejZxymS2gAhM3fjAt1MBFwzSnE/0I
	+SC/nFsLQiT92DraGFaJ2I4H/wZVGnKhjewqWGW/aNfrJqpQcAOSxdR360EjoZEz6X3O
	AJKw==
X-Gm-Message-State: AElRT7GLZgvrV+MW6ZcP/wVF4nloCrnvM9LQRYJChAJUOMYdpaRY25sh
	tCwxa1fmYgjxGywwUgGInFTrQXygM8cqR1imJ6Q=
X-Google-Smtp-Source: AG47ELs2iTqv2W2cvr1yVcbP4RBf7d99Uc0F2m4FblnS0P48JDUPIRzeH1ZMTPDh7Z2gB8HSxoRiCNdbJlZhStB/AjA=
X-Received: by 10.176.29.147 with SMTP id l19mr11009878uak.23.1521629592664;
	Wed, 21 Mar 2018 03:53:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Wed, 21 Mar 2018 03:53:12 -0700 (PDT)
In-Reply-To: <CAJTo0LaSyNEmDbxqgtt5LhEv=pZ-fMJTynK_i3GKTs+jRop2wQ@mail.gmail.com>
References: <CAPGMVzEUccZZpxwJpH0akzn7+FyaZf0NbDZoN=73+u8g=yA4Fg@mail.gmail.com>
	<CAJTo0LYGumRqn5=GeB=41abhNn8s6dqoE_d3gMZThwkLor-_zA@mail.gmail.com>
	<CAPGMVzEqtt8C0DCR28fMik6c+9jGtM3=uKRbxrMDEv=8CexdiQ@mail.gmail.com>
	<CAPGMVzHyC098J=w5Xbt8z__2-9LVSeBhiJ1U+EHQLiGU1x+huw@mail.gmail.com>
	<CAJTo0LZ49vPGn8rWMSj607aQZP8HQLMb4o9cq3yvTAEk57ecaA@mail.gmail.com>
	<CAPGMVzHgcsNe9mjrTvGTyBztX-TKuip1Tx4+HDOk7UP-H9mwxA@mail.gmail.com>
	<CAJTo0LYbWfqRe4hE3279Wmpy-5dSCNfXeT9VwFvp_qHtS+BcHQ@mail.gmail.com>
	<CAPGMVzEO8K4gM=_f_+wTrqeyF12W4S-v7nx5Ff6HvN7vvOkjnA@mail.gmail.com>
	<CAJTo0LaSyNEmDbxqgtt5LhEv=pZ-fMJTynK_i3GKTs+jRop2wQ@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Wed, 21 Mar 2018 16:23:12 +0530
Message-ID: <CAPGMVzFJU+UA6_xa=ZzJqAfFrFkCnT2AXrCybxyuvDE2c9Ut3w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 21 Mar 2018 10:53:12 -0000
Content-Type: multipart/alternative; boundary="089e08264cd859c1950567e9ffd2"

--089e08264cd859c1950567e9ffd2
Content-Type: text/plain; charset="UTF-8"

yes, when clicked on it. it says Ethernet connection

so, inside oe-core there is a folder and file called :
glib-networking_2.54.1.bb; so now acording to your second msg to enable
wifi should i include this file in MAGE_INSTALL_append command of
local.conf?

Rajath C S,
9964182112,
Bangalore - 560060

On Wed, Mar 21, 2018 at 4:14 PM, Burton, Ross <ross.burton@intel.com> wrote:

> Then you have a nice button in the top right to setup wifi already.
>
> Ross
>
> On 21 March 2018 at 10:42, Rajath C S <rajathcs.1996@gmail.com> wrote:
>
>> sure, i will look into that, thanks.
>> and , i am actually using core-image-sato
>>
>> regards,
>> Rajath C S
>>
>> Rajath C S,
>> 9964182112,
>> Bangalore - 560060
>>
>> On Wed, Mar 21, 2018 at 4:11 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>
>>> Ideally in an image of your own creation, as local.conf tweaking is for
>>> experimentation only.
>>>
>>> There's a section in the manual about customising images, and I
>>> recommend that you start from an image with functionality instead of
>>> starting from a minimal image and trying to discover how to do basics such
>>> as make networking functional.
>>>
>>> Ross
>>>
>>> On 21 March 2018 at 10:35, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>>
>>>> so the  connman / ifupdown and wireless-tools have to be placed in the
>>>> local.conf file right?
>>>>
>>>> Rajath C S,
>>>> 9964182112,
>>>> Bangalore - 560060
>>>>
>>>> On Wed, Mar 21, 2018 at 3:57 PM, Burton, Ross <ross.burton@intel.com>
>>>> wrote:
>>>>
>>>>> ifupdown and wireless-tools will give you the basics to configure it
>>>>> by hand, or use connman.  Or network-manager, in meta-oe.
>>>>>
>>>>> core-image-sato includes both connman and a UI to join to wifi.
>>>>>
>>>>> Ross
>>>>>
>>>>> On 21 March 2018 at 10:25, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>>>>
>>>>>>
>>>>>> thanks,
>>>>>>
>>>>>> i will follow the said things,
>>>>>>
>>>>>> but as of now my situation is as such : "
>>>>>> sure, i will have one other question that is how to establish
>>>>>> internet connection on to poky?
>>>>>> that is , i have placed the meta-networking layer in bblayer.conf
>>>>>> file so after that which recipe should i add to local.conf so that wireless
>>>>>> connection is established on the poky?
>>>>>>
>>>>>> Do help with the steps
>>>>>>
>>>>>> Thanks"
>>>>>> I will try and implement networking from oe-core
>>>>>>
>>>>>>
>>>>>> Rajath C S,
>>>>>> 9964182112,
>>>>>> Bangalore - 560060
>>>>>>
>>>>>> On Wed, Mar 21, 2018 at 3:40 PM, Burton, Ross <ross.burton@intel.com>
>>>>>> wrote:
>>>>>>
>>>>>>> First, you don't need meta-networking to make networking "work",
>>>>>>> because oe-core has the basics.
>>>>>>>
>>>>>>> Second, you need to match the release of layers.  You're using
>>>>>>> meta-networking master, and a previous release of poky.  Checkout the
>>>>>>> corresponding release branch of meta-networking.
>>>>>>>
>>>>>>> Ross
>>>>>>>
>>>>>>> On 21 March 2018 at 07:29, Rajath C S <rajathcs.1996@gmail.com>
>>>>>>> wrote:
>>>>>>>
>>>>>>>> I am tryiing to add meta-networking layer (to get Internet
>>>>>>>> connection to poky)and i have included the following line of code in
>>>>>>>> bbconfig file
>>>>>>>> /home/jarvis/poky/meta-openembedded/meta-networking \
>>>>>>>>
>>>>>>>> but while building i get this below error
>>>>>>>>
>>>>>>>>
>>>>>>>> ERROR: ExpansionError during parsing /home/jarvis/poky/meta-openemb
>>>>>>>> edded/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb
>>>>>>>> Traceback (most recent call last):
>>>>>>>> bb.data_smart.ExpansionError: Failure expanding variable
>>>>>>>> do_compile, expression was     python ./buildtools/bin/waf
>>>>>>>> ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
>>>>>>>>  which triggered exception AttributeError: module 'oe.utils' has no
>>>>>>>> attribute 'parallel_make_argument'
>>>>>>>>
>>>>>>>>
>>>>>>>> DO help,
>>>>>>>>
>>>>>>>> is there any other way to establish Internet connection inside poky?
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>>
>>>>>>>>
>>>>>>>> --
>>>>>>>> _______________________________________________
>>>>>>>> Openembedded-core mailing list
>>>>>>>> Openembedded-core@lists.openembedded.org
>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
>

--089e08264cd859c1950567e9ffd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>yes, when clicked on it. it says Ethernet connection<=
br><br></div>so, inside oe-core there is a folder and file called : <a href=
=3D"http://glib-networking_2.54.1.bb">glib-networking_2.54.1.bb</a>; so now=
 acording to your second msg to enable wifi should i include this file in M=
AGE_INSTALL_append command of local.conf?<br></div><div class=3D"gmail_extr=
a"><br clear=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D"=
gmail_signature"><div dir=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br><=
/div></div>Bangalore - 560060<br></div></div></div>
<br><div class=3D"gmail_quote">On Wed, Mar 21, 2018 at 4:14 PM, Burton, Ros=
s <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"=
_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr">Then you have a nice button in the top right to=
 setup wifi already.<span class=3D"HOEnZb"><font color=3D"#888888"><div><br=
></div><div>Ross</div></font></span></div><div class=3D"HOEnZb"><div class=
=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 Mar=
ch 2018 at 10:42, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajath=
cs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div>s=
ure, i will look into that, thanks.<br></div>and , i am actually using core=
-image-sato<br><br></div>regards,<br></div>Rajath C S <br></div><div class=
=3D"gmail_extra"><span><br clear=3D"all"><div><div class=3D"m_-563403690840=
1493779m_6704635246269763952gmail_signature" data-smartmail=3D"gmail_signat=
ure"><div dir=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br></div></div>B=
angalore - 560060<br></div></div></div>
<br></span><div><div class=3D"m_-5634036908401493779h5"><div class=3D"gmail=
_quote">On Wed, Mar 21, 2018 at 4:11 PM, Burton, Ross <span dir=3D"ltr">&lt=
;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr">Ideally in an image of your own creation, as local.conf tweaking is fo=
r experimentation only.<div><br></div><div>There&#39;s a section in the man=
ual about customising images, and I recommend that you start from an image =
with functionality instead of starting from a minimal image and trying to d=
iscover how to do basics such as make networking functional.</div><span cla=
ss=3D"m_-5634036908401493779m_6704635246269763952HOEnZb"><font color=3D"#88=
8888"><div><br></div><div>Ross</div></font></span></div><div class=3D"m_-56=
34036908401493779m_6704635246269763952HOEnZb"><div class=3D"m_-563403690840=
1493779m_6704635246269763952h5"><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 21 March 2018 at 10:35, Rajath C S <span dir=3D"ltr">&l=
t;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">rajathcs.199=
6@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr">so the=C2=A0 connman / ifupdown and wireless-tools have to be pla=
ced in the local.conf file right?<br></div><div class=3D"gmail_extra"><span=
><br clear=3D"all"><div><div class=3D"m_-5634036908401493779m_6704635246269=
763952m_8402836057187324486m_7549818448200897835gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr"><div><div>Rajath C S,<br>99641821=
12,<br></div></div>Bangalore - 560060<br></div></div></div>
<br></span><div><div class=3D"m_-5634036908401493779m_6704635246269763952m_=
8402836057187324486h5"><div class=3D"gmail_quote">On Wed, Mar 21, 2018 at 3=
:57 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@in=
tel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr">ifupdown and wireless-tools =
will give you the basics to configure it by hand, or use connman.=C2=A0 Or =
network-manager, in meta-oe.<div><br></div><div>core-image-sato includes bo=
th connman and a UI to join to wifi.</div><span class=3D"m_-563403690840149=
3779m_6704635246269763952m_8402836057187324486m_7549818448200897835HOEnZb">=
<font color=3D"#888888"><div><br></div><div>Ross</div></font></span></div><=
div class=3D"m_-5634036908401493779m_6704635246269763952m_84028360571873244=
86m_7549818448200897835HOEnZb"><div class=3D"m_-5634036908401493779m_670463=
5246269763952m_8402836057187324486m_7549818448200897835h5"><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On 21 March 2018 at 10:25, Rajath=
 C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" targe=
t=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div class=3D"m_-5634036908401493779m_6704635246269763952=
m_8402836057187324486m_7549818448200897835m_-862766904418843875HOEnZb"><div=
 class=3D"m_-5634036908401493779m_6704635246269763952m_8402836057187324486m=
_7549818448200897835m_-862766904418843875h5"><div dir=3D"ltr"><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr"><div><div><div>thanks,<br><br></div>i wi=
ll follow the said things,<br><br></div>but as of now my situation is as su=
ch : &quot;<div><div><div>sure, i will have one other question that is how =
to establish internet connection on to poky?<br></div>that
 is , i have placed the meta-networking layer in bblayer.conf file so=20
after that which recipe should i add to local.conf so that wireless=20
connection is established on the poky?<br><br></div>Do help with the steps =
<br><br></div>Thanks&quot;<br></div>I will try and implement networking fro=
m oe-core<span class=3D"m_-5634036908401493779m_6704635246269763952m_840283=
6057187324486m_7549818448200897835m_-862766904418843875m_473202723307373014=
HOEnZb"><font color=3D"#888888"><br><div><br></div></font></span></div><div=
 class=3D"gmail_extra"><span class=3D"m_-5634036908401493779m_6704635246269=
763952m_8402836057187324486m_7549818448200897835m_-862766904418843875m_4732=
02723307373014HOEnZb"><font color=3D"#888888"><br clear=3D"all"><div><div c=
lass=3D"m_-5634036908401493779m_6704635246269763952m_8402836057187324486m_7=
549818448200897835m_-862766904418843875m_473202723307373014m_43399702141540=
50837gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div><div>Rajath C S,<br>9964182112,<br></div></div>Bangalore - 560060<br></=
div></div></div></font></span><div><div class=3D"m_-5634036908401493779m_67=
04635246269763952m_8402836057187324486m_7549818448200897835m_-8627669044188=
43875m_473202723307373014h5">
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
e"><div><div class=3D"m_-5634036908401493779m_6704635246269763952m_84028360=
57187324486m_7549818448200897835m_-862766904418843875m_473202723307373014m_=
4339970214154050837h5">On 21 March 2018 at 07:29, Rajath C S <span dir=3D"l=
tr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">rajath=
cs.1996@gmail.com</a>&gt;</span> wrote:<br></div></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div><div class=3D"m_-5634036908401493779m_6704635246269763952m_=
8402836057187324486m_7549818448200897835m_-862766904418843875m_473202723307=
373014m_4339970214154050837h5"><div dir=3D"ltr"><div>I am tryiing to add me=
ta-networking layer (to get Internet connection to poky)and i have included=
 the following line of code in bbconfig file <br>/home/jarvis/poky/meta-ope=
nemb<wbr>edded/meta-networking \<br><br></div>but while building i get this=
 below error<br><br><div><div><br>ERROR: ExpansionError during parsing /hom=
e/jarvis/poky/meta-openemb<wbr>edded/meta-networking/recipes-<wbr>support/l=
ibtdb/<a href=3D"http://libtdb_1.3.15.bb" target=3D"_blank">libtdb_1.3.15.b=
<wbr>b</a><br>Traceback (most recent call last):<br>bb.data_smart.Expansion=
Error: Failure expanding variable do_compile, expression was=C2=A0=C2=A0=C2=
=A0=C2=A0 python ./buildtools/bin/waf ${@oe.utils.parallel_make_argu<wbr>me=
nt(d, &#39;-j%d&#39;, limit=3D64)}<br>=C2=A0which triggered exception Attri=
buteError: module &#39;oe.utils&#39; has no attribute &#39;parallel_make_ar=
gument&#39;<br><br><br></div><div>DO help,<br><br></div><div>is there any o=
ther way to establish Internet connection inside poky?<br><br></div><div>Th=
anks<br></div><div><br></div></div></div>
<br></div></div><span class=3D"m_-5634036908401493779m_6704635246269763952m=
_8402836057187324486m_7549818448200897835m_-862766904418843875m_47320272330=
7373014m_4339970214154050837HOEnZb"><font color=3D"#888888">--<br>
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
</div></div></blockquote></div><br></div>

--089e08264cd859c1950567e9ffd2--
