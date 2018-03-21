Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id ED54278957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:32:28 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id f6so3435304ual.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/X7X8DNTo9bMMyFDbdqmXambou+bYTHGqgyMpZmKoSQ=;
	b=GimYaUM7Q4eKoCITOcHpO6hYoYBOc7S/EsaOEi0rdelgNBC2VJuXWp5PjzHvEDG/Lf
	zYV4cXewmY9HS71s6aLKg+TvbP7Az74nFGCpie7XgUJmsToxB8evZ3hWgs/PJ18Sb+4x
	IRuWq7NBLi09zS1oOaUnVugWgm6ecRGnp//UoPHMwnzL/Odexuq/mRoT3/khfiqe21Ac
	X/rAk7BTlcDcsDhkjDeDh2w74yolstaZszigIn8MYD1vFKtm7+pYQaFdqVJzZioK9tKj
	yaxtqEVRp301ABSvmsE6M7SqXkJIIqfUb4YMhiljYHDtTy5DBjpWiinqo2qn9kTgdSXx
	fBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/X7X8DNTo9bMMyFDbdqmXambou+bYTHGqgyMpZmKoSQ=;
	b=DHWPT7nL5ouUvV/am6TwUB8v2u1Y2baN9D2X9gB3jRlurXgPSkZvQsPRGklss9e34W
	UUdpewKK1fd5lD68CxuxjidrnndyhRxq+cZsyIcmmBuJeQDvn4+njeHmaLqBokuaqCus
	mg7ns4ph1DXNuQbiS5OWkAD+B7u23JPZRZkUJ0bELOUQOWnn8jfEuVKzvUgmEnbAwoJS
	O3od+FrOAA7InZSDUzme9uohRS85oMiTjnfHDApuEFAWPP/W+qJRtZdryzw0ADTkbUkM
	wfl4azEJzqm9qqO8K8wn/EzRlAYEyqSpNk0p9XWDUTNaAoLtFR1QI5lysIzxCWE9RzJT
	Gmjg==
X-Gm-Message-State: AElRT7EGo8UpaupcHSjoNazjbrkGapupd0i19nOqZv71ZZZbrj27OdnI
	Lg/KOllpDPhlC+hf1qC9fmJzWafhHGlcRK5/Lfk=
X-Google-Smtp-Source: AG47ELuVwBrbFvXUwjA6jxanJJTV+PNyJcFu3Hk/2uIFJ8UvUPgaCa/ioWIqtIPBLNx5N/b+jwoa3Ja8DYrEA6T8j9I=
X-Received: by 10.176.29.147 with SMTP id l19mr11547802uak.23.1521642749957;
	Wed, 21 Mar 2018 07:32:29 -0700 (PDT)
MIME-Version: 1.0
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
	<CAJTo0LbJAebMeAqhPrq6so=NWx86sWkfWERuPE2K2UwKdZzUKw@mail.gmail.com>
	<CAPGMVzHVS+AxxZHuiCzhS3DX_-CzHO4ezTtrkW8mMmFu_zkZfg@mail.gmail.com>
	<CAJTo0LZqh4_vZ9YXJO-u1n5JSVNquAyi3iW-PXy5W-m24nfzPQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZqh4_vZ9YXJO-u1n5JSVNquAyi3iW-PXy5W-m24nfzPQ@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Wed, 21 Mar 2018 14:32:19 +0000
Message-ID: <CAPGMVzHjawb9cNtUduEpR_98CW24087o4=_DT49aKz+Vt8SuUA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Wed, 21 Mar 2018 14:32:29 -0000
Content-Type: multipart/alternative; boundary="089e08264cd89620320567ed0f4f"

--089e08264cd89620320567ed0f4f
Content-Type: text/plain; charset="UTF-8"

Cool, thanks!
So should I add connman to local.conf of poky to get WiFi connection?

On Wed, 21 Mar 2018, 17:10 Burton, Ross, <ross.burton@intel.com> wrote:

> The Yocto kernel, as that is the kernel which is running.
>
> On 21 March 2018 at 11:36, Rajath C S <rajathcs.1996@gmail.com> wrote:
>
>> By kernel are you referring to the yocto's kernel or my host machine
>> kernel?
>>
>> if it is host machine kernel then i have the drivers
>> and , what should i do with connman?
>>
>> thanks
>>
>> Rajath C S,
>> 9964182112,
>> Bangalore - 560060
>>
>> On Wed, Mar 21, 2018 at 5:02 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>
>>> I never mentioned glib-networking and it wont help at all.
>>>
>>> If connman can't see your wifi then your kernel is missing the drivers
>>>  you need.
>>>
>>> Ross
>>>
>>> On 21 March 2018 at 10:53, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>>
>>>> yes, when clicked on it. it says Ethernet connection
>>>>
>>>> so, inside oe-core there is a folder and file called :
>>>> glib-networking_2.54.1.bb; so now acording to your second msg to
>>>> enable wifi should i include this file in MAGE_INSTALL_append command of
>>>> local.conf?
>>>>
>>>> Rajath C S,
>>>> 9964182112,
>>>> Bangalore - 560060
>>>>
>>>> On Wed, Mar 21, 2018 at 4:14 PM, Burton, Ross <ross.burton@intel.com>
>>>> wrote:
>>>>
>>>>> Then you have a nice button in the top right to setup wifi already.
>>>>>
>>>>> Ross
>>>>>
>>>>> On 21 March 2018 at 10:42, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>>>>
>>>>>> sure, i will look into that, thanks.
>>>>>> and , i am actually using core-image-sato
>>>>>>
>>>>>> regards,
>>>>>> Rajath C S
>>>>>>
>>>>>> Rajath C S,
>>>>>> 9964182112,
>>>>>> Bangalore - 560060
>>>>>>
>>>>>> On Wed, Mar 21, 2018 at 4:11 PM, Burton, Ross <ross.burton@intel.com>
>>>>>> wrote:
>>>>>>
>>>>>>> Ideally in an image of your own creation, as local.conf tweaking is
>>>>>>> for experimentation only.
>>>>>>>
>>>>>>> There's a section in the manual about customising images, and I
>>>>>>> recommend that you start from an image with functionality instead of
>>>>>>> starting from a minimal image and trying to discover how to do basics such
>>>>>>> as make networking functional.
>>>>>>>
>>>>>>> Ross
>>>>>>>
>>>>>>> On 21 March 2018 at 10:35, Rajath C S <rajathcs.1996@gmail.com>
>>>>>>> wrote:
>>>>>>>
>>>>>>>> so the  connman / ifupdown and wireless-tools have to be placed in
>>>>>>>> the local.conf file right?
>>>>>>>>
>>>>>>>> Rajath C S,
>>>>>>>> 9964182112,
>>>>>>>> Bangalore - 560060
>>>>>>>>
>>>>>>>> On Wed, Mar 21, 2018 at 3:57 PM, Burton, Ross <
>>>>>>>> ross.burton@intel.com> wrote:
>>>>>>>>
>>>>>>>>> ifupdown and wireless-tools will give you the basics to configure
>>>>>>>>> it by hand, or use connman.  Or network-manager, in meta-oe.
>>>>>>>>>
>>>>>>>>> core-image-sato includes both connman and a UI to join to wifi.
>>>>>>>>>
>>>>>>>>> Ross
>>>>>>>>>
>>>>>>>>> On 21 March 2018 at 10:25, Rajath C S <rajathcs.1996@gmail.com>
>>>>>>>>> wrote:
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> thanks,
>>>>>>>>>>
>>>>>>>>>> i will follow the said things,
>>>>>>>>>>
>>>>>>>>>> but as of now my situation is as such : "
>>>>>>>>>> sure, i will have one other question that is how to establish
>>>>>>>>>> internet connection on to poky?
>>>>>>>>>> that is , i have placed the meta-networking layer in bblayer.conf
>>>>>>>>>> file so after that which recipe should i add to local.conf so that wireless
>>>>>>>>>> connection is established on the poky?
>>>>>>>>>>
>>>>>>>>>> Do help with the steps
>>>>>>>>>>
>>>>>>>>>> Thanks"
>>>>>>>>>> I will try and implement networking from oe-core
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Rajath C S,
>>>>>>>>>> 9964182112,
>>>>>>>>>> Bangalore - 560060
>>>>>>>>>>
>>>>>>>>>> On Wed, Mar 21, 2018 at 3:40 PM, Burton, Ross <
>>>>>>>>>> ross.burton@intel.com> wrote:
>>>>>>>>>>
>>>>>>>>>>> First, you don't need meta-networking to make networking "work",
>>>>>>>>>>> because oe-core has the basics.
>>>>>>>>>>>
>>>>>>>>>>> Second, you need to match the release of layers.  You're using
>>>>>>>>>>> meta-networking master, and a previous release of poky.  Checkout the
>>>>>>>>>>> corresponding release branch of meta-networking.
>>>>>>>>>>>
>>>>>>>>>>> Ross
>>>>>>>>>>>
>>>>>>>>>>> On 21 March 2018 at 07:29, Rajath C S <rajathcs.1996@gmail.com>
>>>>>>>>>>> wrote:
>>>>>>>>>>>
>>>>>>>>>>>> I am tryiing to add meta-networking layer (to get Internet
>>>>>>>>>>>> connection to poky)and i have included the following line of code in
>>>>>>>>>>>> bbconfig file
>>>>>>>>>>>> /home/jarvis/poky/meta-openembedded/meta-networking \
>>>>>>>>>>>>
>>>>>>>>>>>> but while building i get this below error
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> ERROR: ExpansionError during parsing
>>>>>>>>>>>> /home/jarvis/poky/meta-openembedded/meta-networking/recipes-support/libtdb/
>>>>>>>>>>>> libtdb_1.3.15.bb
>>>>>>>>>>>> Traceback (most recent call last):
>>>>>>>>>>>> bb.data_smart.ExpansionError: Failure expanding variable
>>>>>>>>>>>> do_compile, expression was     python ./buildtools/bin/waf
>>>>>>>>>>>> ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
>>>>>>>>>>>>  which triggered exception AttributeError: module 'oe.utils'
>>>>>>>>>>>> has no attribute 'parallel_make_argument'
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> DO help,
>>>>>>>>>>>>
>>>>>>>>>>>> is there any other way to establish Internet connection inside
>>>>>>>>>>>> poky?
>>>>>>>>>>>>
>>>>>>>>>>>> Thanks
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> --
>>>>>>>>>>>> _______________________________________________
>>>>>>>>>>>> Openembedded-core mailing list
>>>>>>>>>>>> Openembedded-core@lists.openembedded.org
>>>>>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
>

--089e08264cd89620320567ed0f4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Cool, thanks!=C2=A0<div dir=3D"auto">So should I add conn=
man to local.conf of poky to get WiFi connection?</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Wed, 21 Mar 2018, 17:10 Burton, Ross, =
&lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">The Yocto k=
ernel, as that is the kernel which is running.</div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On 21 March 2018 at 11:36, Rajath C S <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_b=
lank" rel=3D"noreferrer">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div>By kernel are=
 you referring to the yocto&#39;s kernel or my host machine kernel?<br><br>=
</div>if it is host machine kernel then i have the drivers <br></div>and , =
what should i do with connman?<br><br></div>thanks<br></div><div class=3D"g=
mail_extra"><span><br clear=3D"all"><div><div class=3D"m_168993287512375435=
3m_-523917750872987930gmail_signature" data-smartmail=3D"gmail_signature"><=
div dir=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br></div></div>Bangalo=
re - 560060<br></div></div></div>
<br></span><div><div class=3D"m_1689932875123754353h5"><div class=3D"gmail_=
quote">On Wed, Mar 21, 2018 at 5:02 PM, Burton, Ross <span dir=3D"ltr">&lt;=
<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank" rel=3D"noreferre=
r">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div dir=3D"ltr">I never mentioned glib-networking and it wont help a=
t all.<div><br></div><div>If connman can&#39;t see your wifi then your kern=
el is missing the drivers =C2=A0you need.</div><span class=3D"m_16899328751=
23754353m_-523917750872987930HOEnZb"><font color=3D"#888888"><div><br></div=
><div>Ross</div></font></span></div><div class=3D"m_1689932875123754353m_-5=
23917750872987930HOEnZb"><div class=3D"m_1689932875123754353m_-523917750872=
987930h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 M=
arch 2018 at 10:53, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:raja=
thcs.1996@gmail.com" target=3D"_blank" rel=3D"noreferrer">rajathcs.1996@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr"><div>yes, when clicked on it. it says Ethernet connection<br><br></div=
>so, inside oe-core there is a folder and file called : <a href=3D"http://g=
lib-networking_2.54.1.bb" target=3D"_blank" rel=3D"noreferrer">glib-network=
ing_2.54.1.bb</a>; so now acording to your second msg to enable wifi should=
 i include this file in MAGE_INSTALL_append command of local.conf?<br></div=
><div class=3D"gmail_extra"><span><br clear=3D"all"><div><div class=3D"m_16=
89932875123754353m_-523917750872987930m_-7841170760491153267m_-875848198287=
9607889gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"=
><div><div>Rajath C S,<br>9964182112,<br></div></div>Bangalore - 560060<br>=
</div></div></div>
<br></span><div><div class=3D"m_1689932875123754353m_-523917750872987930m_-=
7841170760491153267h5"><div class=3D"gmail_quote">On Wed, Mar 21, 2018 at 4=
:14 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@in=
tel.com" target=3D"_blank" rel=3D"noreferrer">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Then you =
have a nice button in the top right to setup wifi already.<span class=3D"m_=
1689932875123754353m_-523917750872987930m_-7841170760491153267m_-8758481982=
879607889HOEnZb"><font color=3D"#888888"><div><br></div><div>Ross</div></fo=
nt></span></div><div class=3D"m_1689932875123754353m_-523917750872987930m_-=
7841170760491153267m_-8758481982879607889HOEnZb"><div class=3D"m_1689932875=
123754353m_-523917750872987930m_-7841170760491153267m_-8758481982879607889h=
5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 March 20=
18 at 10:42, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.19=
96@gmail.com" target=3D"_blank" rel=3D"noreferrer">rajathcs.1996@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><d=
iv><div><div>sure, i will look into that, thanks.<br></div>and , i am actua=
lly using core-image-sato<br><br></div>regards,<br></div>Rajath C S <br></d=
iv><div class=3D"gmail_extra"><span><br clear=3D"all"><div><div class=3D"m_=
1689932875123754353m_-523917750872987930m_-7841170760491153267m_-8758481982=
879607889m_-5634036908401493779m_6704635246269763952gmail_signature" data-s=
martmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>Rajath C S,<br>9964=
182112,<br></div></div>Bangalore - 560060<br></div></div></div>
<br></span><div><div class=3D"m_1689932875123754353m_-523917750872987930m_-=
7841170760491153267m_-8758481982879607889m_-5634036908401493779h5"><div cla=
ss=3D"gmail_quote">On Wed, Mar 21, 2018 at 4:11 PM, Burton, Ross <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank" rel=
=3D"noreferrer">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr">Ideally in an image of your own creatio=
n, as local.conf tweaking is for experimentation only.<div><br></div><div>T=
here&#39;s a section in the manual about customising images, and I recommen=
d that you start from an image with functionality instead of starting from =
a minimal image and trying to discover how to do basics such as make networ=
king functional.</div><span class=3D"m_1689932875123754353m_-52391775087298=
7930m_-7841170760491153267m_-8758481982879607889m_-5634036908401493779m_670=
4635246269763952HOEnZb"><font color=3D"#888888"><div><br></div><div>Ross</d=
iv></font></span></div><div class=3D"m_1689932875123754353m_-52391775087298=
7930m_-7841170760491153267m_-8758481982879607889m_-5634036908401493779m_670=
4635246269763952HOEnZb"><div class=3D"m_1689932875123754353m_-5239177508729=
87930m_-7841170760491153267m_-8758481982879607889m_-5634036908401493779m_67=
04635246269763952h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 21 March 2018 at 10:35, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"=
mailto:rajathcs.1996@gmail.com" target=3D"_blank" rel=3D"noreferrer">rajath=
cs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"ltr">so the=C2=A0 connman / ifupdown and wireless-tools have to =
be placed in the local.conf file right?<br></div><div class=3D"gmail_extra"=
><span><br clear=3D"all"><div><div class=3D"m_1689932875123754353m_-5239177=
50872987930m_-7841170760491153267m_-8758481982879607889m_-56340369084014937=
79m_6704635246269763952m_8402836057187324486m_7549818448200897835gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>Rajath=
 C S,<br>9964182112,<br></div></div>Bangalore - 560060<br></div></div></div=
>
<br></span><div><div class=3D"m_1689932875123754353m_-523917750872987930m_-=
7841170760491153267m_-8758481982879607889m_-5634036908401493779m_6704635246=
269763952m_8402836057187324486h5"><div class=3D"gmail_quote">On Wed, Mar 21=
, 2018 at 3:57 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ros=
s.burton@intel.com" target=3D"_blank" rel=3D"noreferrer">ross.burton@intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
">ifupdown and wireless-tools will give you the basics to configure it by h=
and, or use connman.=C2=A0 Or network-manager, in meta-oe.<div><br></div><d=
iv>core-image-sato includes both connman and a UI to join to wifi.</div><sp=
an class=3D"m_1689932875123754353m_-523917750872987930m_-784117076049115326=
7m_-8758481982879607889m_-5634036908401493779m_6704635246269763952m_8402836=
057187324486m_7549818448200897835HOEnZb"><font color=3D"#888888"><div><br><=
/div><div>Ross</div></font></span></div><div class=3D"m_1689932875123754353=
m_-523917750872987930m_-7841170760491153267m_-8758481982879607889m_-5634036=
908401493779m_6704635246269763952m_8402836057187324486m_7549818448200897835=
HOEnZb"><div class=3D"m_1689932875123754353m_-523917750872987930m_-78411707=
60491153267m_-8758481982879607889m_-5634036908401493779m_670463524626976395=
2m_8402836057187324486m_7549818448200897835h5"><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On 21 March 2018 at 10:25, Rajath C S <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank"=
 rel=3D"noreferrer">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div class=3D"m_1689932875123754353m_-523917750872=
987930m_-7841170760491153267m_-8758481982879607889m_-5634036908401493779m_6=
704635246269763952m_8402836057187324486m_7549818448200897835m_-862766904418=
843875HOEnZb"><div class=3D"m_1689932875123754353m_-523917750872987930m_-78=
41170760491153267m_-8758481982879607889m_-5634036908401493779m_670463524626=
9763952m_8402836057187324486m_7549818448200897835m_-862766904418843875h5"><=
div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr"><div><div><=
div>thanks,<br><br></div>i will follow the said things,<br><br></div>but as=
 of now my situation is as such : &quot;<div><div><div>sure, i will have on=
e other question that is how to establish internet connection on to poky?<b=
r></div>that
 is , i have placed the meta-networking layer in bblayer.conf file so=20
after that which recipe should i add to local.conf so that wireless=20
connection is established on the poky?<br><br></div>Do help with the steps =
<br><br></div>Thanks&quot;<br></div>I will try and implement networking fro=
m oe-core<span class=3D"m_1689932875123754353m_-523917750872987930m_-784117=
0760491153267m_-8758481982879607889m_-5634036908401493779m_6704635246269763=
952m_8402836057187324486m_7549818448200897835m_-862766904418843875m_4732027=
23307373014HOEnZb"><font color=3D"#888888"><br><div><br></div></font></span=
></div><div class=3D"gmail_extra"><span class=3D"m_1689932875123754353m_-52=
3917750872987930m_-7841170760491153267m_-8758481982879607889m_-563403690840=
1493779m_6704635246269763952m_8402836057187324486m_7549818448200897835m_-86=
2766904418843875m_473202723307373014HOEnZb"><font color=3D"#888888"><br cle=
ar=3D"all"><div><div class=3D"m_1689932875123754353m_-523917750872987930m_-=
7841170760491153267m_-8758481982879607889m_-5634036908401493779m_6704635246=
269763952m_8402836057187324486m_7549818448200897835m_-862766904418843875m_4=
73202723307373014m_4339970214154050837gmail_signature" data-smartmail=3D"gm=
ail_signature"><div dir=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br></d=
iv></div>Bangalore - 560060<br></div></div></div></font></span><div><div cl=
ass=3D"m_1689932875123754353m_-523917750872987930m_-7841170760491153267m_-8=
758481982879607889m_-5634036908401493779m_6704635246269763952m_840283605718=
7324486m_7549818448200897835m_-862766904418843875m_473202723307373014h5">
<br><div class=3D"gmail_quote">On Wed, Mar 21, 2018 at 3:40 PM, Burton, Ros=
s <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"=
_blank" rel=3D"noreferrer">ross.burton@intel.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr">First, you don&#39;t need me=
ta-networking to make networking &quot;work&quot;, because oe-core has the =
basics.<div><br></div><div>Second, you need to match the release of layers.=
=C2=A0 You&#39;re using meta-networking master, and a previous release of p=
oky.=C2=A0 Checkout the corresponding release branch of meta-networking.</d=
iv><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote"><div><div class=3D"m_1689932875123754353m_-5239177508=
72987930m_-7841170760491153267m_-8758481982879607889m_-5634036908401493779m=
_6704635246269763952m_8402836057187324486m_7549818448200897835m_-8627669044=
18843875m_473202723307373014m_4339970214154050837h5">On 21 March 2018 at 07=
:29, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rajathcs.1996@gmail.com</a>&gt;<=
/span> wrote:<br></div></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=
=3D"m_1689932875123754353m_-523917750872987930m_-7841170760491153267m_-8758=
481982879607889m_-5634036908401493779m_6704635246269763952m_840283605718732=
4486m_7549818448200897835m_-862766904418843875m_473202723307373014m_4339970=
214154050837h5"><div dir=3D"ltr"><div>I am tryiing to add meta-networking l=
ayer (to get Internet connection to poky)and i have included the following =
line of code in bbconfig file <br>/home/jarvis/poky/meta-openembedded/meta-=
networking \<br><br></div>but while building i get this below error<br><br>=
<div><div><br>ERROR: ExpansionError during parsing /home/jarvis/poky/meta-o=
penembedded/meta-networking/recipes-support/libtdb/<a href=3D"http://libtdb=
_1.3.15.bb" target=3D"_blank" rel=3D"noreferrer">libtdb_1.3.15.bb</a><br>Tr=
aceback (most recent call last):<br>bb.data_smart.ExpansionError: Failure e=
xpanding variable do_compile, expression was=C2=A0=C2=A0=C2=A0=C2=A0 python=
 ./buildtools/bin/waf ${@oe.utils.parallel_make_argument(d, &#39;-j%d&#39;,=
 limit=3D64)}<br>=C2=A0which triggered exception AttributeError: module &#3=
9;oe.utils&#39; has no attribute &#39;parallel_make_argument&#39;<br><br><b=
r></div><div>DO help,<br><br></div><div>is there any other way to establish=
 Internet connection inside poky?<br><br></div><div>Thanks<br></div><div><b=
r></div></div></div>
<br></div></div><span class=3D"m_1689932875123754353m_-523917750872987930m_=
-7841170760491153267m_-8758481982879607889m_-5634036908401493779m_670463524=
6269763952m_8402836057187324486m_7549818448200897835m_-862766904418843875m_=
473202723307373014m_4339970214154050837HOEnZb"><font color=3D"#888888">--<b=
r>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-core</a><br>
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
</div></div></blockquote></div><br></div></div></div>
</blockquote></div><br></div>
</blockquote></div>

--089e08264cd89620320567ed0f4f--
