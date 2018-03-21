Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id BEFBE7894D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:40:40 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id g14so6241448iob.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 04:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OqXR6qLFrOf1idMoVeThUTmuPqo9ddwYjyFm5eDL2EA=;
	b=l8isj2oKiOYuTUfc6sLnKl1ylviZhTtlB4uuJVmppoK8q+Vu/70wzSOB0rcOefosKh
	Ra9lx06aDaQLJdhu8/LsDVMW5rG8lOoTa65o6+KLDDDjKSc6TxROMRTT6ysrkDYud03o
	FIsFvATilCYClOX4KWAHUge246LNryaGG5aGj+3M9qwsd8bQYGgnDnu7lA+1b4XlR5Rg
	WrQjqIn4tLIhnoCvnbqK3jFxed0w8n91QBC+pAXPfHOz6iHOfcmBy8OcGkoc6Sc30PHQ
	u+f1lVludEf13b+unmokvtCwZWuDpYXacVpApivWrmOQ5JW+EN8f9cSv47eC8T+B8B4M
	u++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OqXR6qLFrOf1idMoVeThUTmuPqo9ddwYjyFm5eDL2EA=;
	b=WtysuFup18Nya1nalQtPBHMgUYGWAvmmRCQ3brJi8olGgUUPH+tTE7GzFXpq+RfpVr
	jCFl+daJoxQCu0r4K3hGm/deHs/uo3TfvE1o7A0cnYi3rVyl4eJYZr0EUeuS4QqErHUh
	2AeHacTDNiy9TATPXaB2Qpjd4PXJCoBxYhxp4NjHTGjB/c+Bl7bNx9OmvLwnuWkSddl1
	AY/rWjtnm+R3cwNhQVoYJVVRbybODrsBEnN35KwIwHIaSyNtTtOkzH/YY1qgGOqfa6Wr
	3J5a6/v+5LfENvzUzbITRtRO+I+NAzk0gqgB828Ftrf+mh86unkhvR3BiB70rnP0guvo
	Af+w==
X-Gm-Message-State: AElRT7HYYWP2WBOxBWvnGwqKPTbiMuk5JdojuzjvN0UyyrxjCoLCJy6s
	qZA/sODzaD6Y8is9oIufaj/VKNdiMxNX48c66alDLQ==
X-Google-Smtp-Source: AG47ELtt6TXSkOVmYejFPO8D5glTgw4ySQ1t8kZS5n1DFfYtPXcwdY7ZK8w61SfLK5NwB80sEGIonO8auXiNL5z35IQ=
X-Received: by 10.107.7.68 with SMTP id 65mr20623109ioh.216.1521632442187;
	Wed, 21 Mar 2018 04:40:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 21 Mar 2018 04:40:21 -0700 (PDT)
In-Reply-To: <CAPGMVzHVS+AxxZHuiCzhS3DX_-CzHO4ezTtrkW8mMmFu_zkZfg@mail.gmail.com>
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
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Mar 2018 11:40:21 +0000
Message-ID: <CAJTo0LZqh4_vZ9YXJO-u1n5JSVNquAyi3iW-PXy5W-m24nfzPQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Mar 2018 11:40:40 -0000
Content-Type: multipart/alternative; boundary="001a113f9730321b950567eaa910"

--001a113f9730321b950567eaa910
Content-Type: text/plain; charset="UTF-8"

The Yocto kernel, as that is the kernel which is running.

On 21 March 2018 at 11:36, Rajath C S <rajathcs.1996@gmail.com> wrote:

> By kernel are you referring to the yocto's kernel or my host machine
> kernel?
>
> if it is host machine kernel then i have the drivers
> and , what should i do with connman?
>
> thanks
>
> Rajath C S,
> 9964182112,
> Bangalore - 560060
>
> On Wed, Mar 21, 2018 at 5:02 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>> I never mentioned glib-networking and it wont help at all.
>>
>> If connman can't see your wifi then your kernel is missing the drivers
>>  you need.
>>
>> Ross
>>
>> On 21 March 2018 at 10:53, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>
>>> yes, when clicked on it. it says Ethernet connection
>>>
>>> so, inside oe-core there is a folder and file called :
>>> glib-networking_2.54.1.bb; so now acording to your second msg to enable
>>> wifi should i include this file in MAGE_INSTALL_append command of
>>> local.conf?
>>>
>>> Rajath C S,
>>> 9964182112,
>>> Bangalore - 560060
>>>
>>> On Wed, Mar 21, 2018 at 4:14 PM, Burton, Ross <ross.burton@intel.com>
>>> wrote:
>>>
>>>> Then you have a nice button in the top right to setup wifi already.
>>>>
>>>> Ross
>>>>
>>>> On 21 March 2018 at 10:42, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>>>
>>>>> sure, i will look into that, thanks.
>>>>> and , i am actually using core-image-sato
>>>>>
>>>>> regards,
>>>>> Rajath C S
>>>>>
>>>>> Rajath C S,
>>>>> 9964182112,
>>>>> Bangalore - 560060
>>>>>
>>>>> On Wed, Mar 21, 2018 at 4:11 PM, Burton, Ross <ross.burton@intel.com>
>>>>> wrote:
>>>>>
>>>>>> Ideally in an image of your own creation, as local.conf tweaking is
>>>>>> for experimentation only.
>>>>>>
>>>>>> There's a section in the manual about customising images, and I
>>>>>> recommend that you start from an image with functionality instead of
>>>>>> starting from a minimal image and trying to discover how to do basics such
>>>>>> as make networking functional.
>>>>>>
>>>>>> Ross
>>>>>>
>>>>>> On 21 March 2018 at 10:35, Rajath C S <rajathcs.1996@gmail.com>
>>>>>> wrote:
>>>>>>
>>>>>>> so the  connman / ifupdown and wireless-tools have to be placed in
>>>>>>> the local.conf file right?
>>>>>>>
>>>>>>> Rajath C S,
>>>>>>> 9964182112,
>>>>>>> Bangalore - 560060
>>>>>>>
>>>>>>> On Wed, Mar 21, 2018 at 3:57 PM, Burton, Ross <ross.burton@intel.com
>>>>>>> > wrote:
>>>>>>>
>>>>>>>> ifupdown and wireless-tools will give you the basics to configure
>>>>>>>> it by hand, or use connman.  Or network-manager, in meta-oe.
>>>>>>>>
>>>>>>>> core-image-sato includes both connman and a UI to join to wifi.
>>>>>>>>
>>>>>>>> Ross
>>>>>>>>
>>>>>>>> On 21 March 2018 at 10:25, Rajath C S <rajathcs.1996@gmail.com>
>>>>>>>> wrote:
>>>>>>>>
>>>>>>>>>
>>>>>>>>> thanks,
>>>>>>>>>
>>>>>>>>> i will follow the said things,
>>>>>>>>>
>>>>>>>>> but as of now my situation is as such : "
>>>>>>>>> sure, i will have one other question that is how to establish
>>>>>>>>> internet connection on to poky?
>>>>>>>>> that is , i have placed the meta-networking layer in bblayer.conf
>>>>>>>>> file so after that which recipe should i add to local.conf so that wireless
>>>>>>>>> connection is established on the poky?
>>>>>>>>>
>>>>>>>>> Do help with the steps
>>>>>>>>>
>>>>>>>>> Thanks"
>>>>>>>>> I will try and implement networking from oe-core
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Rajath C S,
>>>>>>>>> 9964182112,
>>>>>>>>> Bangalore - 560060
>>>>>>>>>
>>>>>>>>> On Wed, Mar 21, 2018 at 3:40 PM, Burton, Ross <
>>>>>>>>> ross.burton@intel.com> wrote:
>>>>>>>>>
>>>>>>>>>> First, you don't need meta-networking to make networking "work",
>>>>>>>>>> because oe-core has the basics.
>>>>>>>>>>
>>>>>>>>>> Second, you need to match the release of layers.  You're using
>>>>>>>>>> meta-networking master, and a previous release of poky.  Checkout the
>>>>>>>>>> corresponding release branch of meta-networking.
>>>>>>>>>>
>>>>>>>>>> Ross
>>>>>>>>>>
>>>>>>>>>> On 21 March 2018 at 07:29, Rajath C S <rajathcs.1996@gmail.com>
>>>>>>>>>> wrote:
>>>>>>>>>>
>>>>>>>>>>> I am tryiing to add meta-networking layer (to get Internet
>>>>>>>>>>> connection to poky)and i have included the following line of code in
>>>>>>>>>>> bbconfig file
>>>>>>>>>>> /home/jarvis/poky/meta-openembedded/meta-networking \
>>>>>>>>>>>
>>>>>>>>>>> but while building i get this below error
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> ERROR: ExpansionError during parsing
>>>>>>>>>>> /home/jarvis/poky/meta-openembedded/meta-networking/recipes-
>>>>>>>>>>> support/libtdb/libtdb_1.3.15.bb
>>>>>>>>>>> Traceback (most recent call last):
>>>>>>>>>>> bb.data_smart.ExpansionError: Failure expanding variable
>>>>>>>>>>> do_compile, expression was     python ./buildtools/bin/waf
>>>>>>>>>>> ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
>>>>>>>>>>>  which triggered exception AttributeError: module 'oe.utils' has
>>>>>>>>>>> no attribute 'parallel_make_argument'
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> DO help,
>>>>>>>>>>>
>>>>>>>>>>> is there any other way to establish Internet connection inside
>>>>>>>>>>> poky?
>>>>>>>>>>>
>>>>>>>>>>> Thanks
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> --
>>>>>>>>>>> _______________________________________________
>>>>>>>>>>> Openembedded-core mailing list
>>>>>>>>>>> Openembedded-core@lists.openembedded.org
>>>>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
>

--001a113f9730321b950567eaa910
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The Yocto kernel, as that is the kernel which is running.<=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 March =
2018 at 11:36, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.=
1996@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div>By k=
ernel are you referring to the yocto&#39;s kernel or my host machine kernel=
?<br><br></div>if it is host machine kernel then i have the drivers <br></d=
iv>and , what should i do with connman?<br><br></div>thanks<br></div><div c=
lass=3D"gmail_extra"><span class=3D""><br clear=3D"all"><div><div class=3D"=
m_-523917750872987930gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br></div></div>Bangalor=
e - 560060<br></div></div></div>
<br></span><div><div class=3D"h5"><div class=3D"gmail_quote">On Wed, Mar 21=
, 2018 at 5:02 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ros=
s.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I never mentioned=
 glib-networking and it wont help at all.<div><br></div><div>If connman can=
&#39;t see your wifi then your kernel is missing the drivers =C2=A0you need=
.</div><span class=3D"m_-523917750872987930HOEnZb"><font color=3D"#888888">=
<div><br></div><div>Ross</div></font></span></div><div class=3D"m_-52391775=
0872987930HOEnZb"><div class=3D"m_-523917750872987930h5"><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On 21 March 2018 at 10:53, Rajath C=
 S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=
=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div dir=3D"ltr"><div>yes, when clicked on it. it says Eth=
ernet connection<br><br></div>so, inside oe-core there is a folder and file=
 called : <a href=3D"http://glib-networking_2.54.1.bb" target=3D"_blank">gl=
ib-networking_2.54.1.bb</a>; so now acording to your second msg to enable w=
ifi should i include this file in MAGE_INSTALL_append command of local.conf=
?<br></div><div class=3D"gmail_extra"><span><br clear=3D"all"><div><div cla=
ss=3D"m_-523917750872987930m_-7841170760491153267m_-8758481982879607889gmai=
l_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>=
Rajath C S,<br>9964182112,<br></div></div>Bangalore - 560060<br></div></div=
></div>
<br></span><div><div class=3D"m_-523917750872987930m_-7841170760491153267h5=
"><div class=3D"gmail_quote">On Wed, Mar 21, 2018 at 4:14 PM, Burton, Ross =
<span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_b=
lank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr">Then you have a nice button in the top right to s=
etup wifi already.<span class=3D"m_-523917750872987930m_-784117076049115326=
7m_-8758481982879607889HOEnZb"><font color=3D"#888888"><div><br></div><div>=
Ross</div></font></span></div><div class=3D"m_-523917750872987930m_-7841170=
760491153267m_-8758481982879607889HOEnZb"><div class=3D"m_-5239177508729879=
30m_-7841170760491153267m_-8758481982879607889h5"><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On 21 March 2018 at 10:42, Rajath C S <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_bla=
nk">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr"><div><div><div>sure, i will look into that, thank=
s.<br></div>and , i am actually using core-image-sato<br><br></div>regards,=
<br></div>Rajath C S <br></div><div class=3D"gmail_extra"><span><br clear=
=3D"all"><div><div class=3D"m_-523917750872987930m_-7841170760491153267m_-8=
758481982879607889m_-5634036908401493779m_6704635246269763952gmail_signatur=
e" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>Rajath C S=
,<br>9964182112,<br></div></div>Bangalore - 560060<br></div></div></div>
<br></span><div><div class=3D"m_-523917750872987930m_-7841170760491153267m_=
-8758481982879607889m_-5634036908401493779h5"><div class=3D"gmail_quote">On=
 Wed, Mar 21, 2018 at 4:11 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Ide=
ally in an image of your own creation, as local.conf tweaking is for experi=
mentation only.<div><br></div><div>There&#39;s a section in the manual abou=
t customising images, and I recommend that you start from an image with fun=
ctionality instead of starting from a minimal image and trying to discover =
how to do basics such as make networking functional.</div><span class=3D"m_=
-523917750872987930m_-7841170760491153267m_-8758481982879607889m_-563403690=
8401493779m_6704635246269763952HOEnZb"><font color=3D"#888888"><div><br></d=
iv><div>Ross</div></font></span></div><div class=3D"m_-523917750872987930m_=
-7841170760491153267m_-8758481982879607889m_-5634036908401493779m_670463524=
6269763952HOEnZb"><div class=3D"m_-523917750872987930m_-7841170760491153267=
m_-8758481982879607889m_-5634036908401493779m_6704635246269763952h5"><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 March 2018 at 10:=
35, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.=
com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr">so the=C2=A0 connman / ifupdow=
n and wireless-tools have to be placed in the local.conf file right?<br></d=
iv><div class=3D"gmail_extra"><span><br clear=3D"all"><div><div class=3D"m_=
-523917750872987930m_-7841170760491153267m_-8758481982879607889m_-563403690=
8401493779m_6704635246269763952m_8402836057187324486m_7549818448200897835gm=
ail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><di=
v>Rajath C S,<br>9964182112,<br></div></div>Bangalore - 560060<br></div></d=
iv></div>
<br></span><div><div class=3D"m_-523917750872987930m_-7841170760491153267m_=
-8758481982879607889m_-5634036908401493779m_6704635246269763952m_8402836057=
187324486h5"><div class=3D"gmail_quote">On Wed, Mar 21, 2018 at 3:57 PM, Bu=
rton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div dir=3D"ltr">ifupdown and wireless-tools will give =
you the basics to configure it by hand, or use connman.=C2=A0 Or network-ma=
nager, in meta-oe.<div><br></div><div>core-image-sato includes both connman=
 and a UI to join to wifi.</div><span class=3D"m_-523917750872987930m_-7841=
170760491153267m_-8758481982879607889m_-5634036908401493779m_67046352462697=
63952m_8402836057187324486m_7549818448200897835HOEnZb"><font color=3D"#8888=
88"><div><br></div><div>Ross</div></font></span></div><div class=3D"m_-5239=
17750872987930m_-7841170760491153267m_-8758481982879607889m_-56340369084014=
93779m_6704635246269763952m_8402836057187324486m_7549818448200897835HOEnZb"=
><div class=3D"m_-523917750872987930m_-7841170760491153267m_-87584819828796=
07889m_-5634036908401493779m_6704635246269763952m_8402836057187324486m_7549=
818448200897835h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On 21 March 2018 at 10:25, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:rajathcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"m_-52391=
7750872987930m_-7841170760491153267m_-8758481982879607889m_-563403690840149=
3779m_6704635246269763952m_8402836057187324486m_7549818448200897835m_-86276=
6904418843875HOEnZb"><div class=3D"m_-523917750872987930m_-7841170760491153=
267m_-8758481982879607889m_-5634036908401493779m_6704635246269763952m_84028=
36057187324486m_7549818448200897835m_-862766904418843875h5"><div dir=3D"ltr=
"><br><div class=3D"gmail_quote"><div dir=3D"ltr"><div><div><div>thanks,<br=
><br></div>i will follow the said things,<br><br></div>but as of now my sit=
uation is as such : &quot;<div><div><div>sure, i will have one other questi=
on that is how to establish internet connection on to poky?<br></div>that
 is , i have placed the meta-networking layer in bblayer.conf file so=20
after that which recipe should i add to local.conf so that wireless=20
connection is established on the poky?<br><br></div>Do help with the steps =
<br><br></div>Thanks&quot;<br></div>I will try and implement networking fro=
m oe-core<span class=3D"m_-523917750872987930m_-7841170760491153267m_-87584=
81982879607889m_-5634036908401493779m_6704635246269763952m_8402836057187324=
486m_7549818448200897835m_-862766904418843875m_473202723307373014HOEnZb"><f=
ont color=3D"#888888"><br><div><br></div></font></span></div><div class=3D"=
gmail_extra"><span class=3D"m_-523917750872987930m_-7841170760491153267m_-8=
758481982879607889m_-5634036908401493779m_6704635246269763952m_840283605718=
7324486m_7549818448200897835m_-862766904418843875m_473202723307373014HOEnZb=
"><font color=3D"#888888"><br clear=3D"all"><div><div class=3D"m_-523917750=
872987930m_-7841170760491153267m_-8758481982879607889m_-5634036908401493779=
m_6704635246269763952m_8402836057187324486m_7549818448200897835m_-862766904=
418843875m_473202723307373014m_4339970214154050837gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>Rajath C S,<br>996418=
2112,<br></div></div>Bangalore - 560060<br></div></div></div></font></span>=
<div><div class=3D"m_-523917750872987930m_-7841170760491153267m_-8758481982=
879607889m_-5634036908401493779m_6704635246269763952m_8402836057187324486m_=
7549818448200897835m_-862766904418843875m_473202723307373014h5">
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
e"><div><div class=3D"m_-523917750872987930m_-7841170760491153267m_-8758481=
982879607889m_-5634036908401493779m_6704635246269763952m_840283605718732448=
6m_7549818448200897835m_-862766904418843875m_473202723307373014m_4339970214=
154050837h5">On 21 March 2018 at 07:29, Rajath C S <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gm=
ail.com</a>&gt;</span> wrote:<br></div></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div><div class=3D"m_-523917750872987930m_-7841170760491153267m_-875848198=
2879607889m_-5634036908401493779m_6704635246269763952m_8402836057187324486m=
_7549818448200897835m_-862766904418843875m_473202723307373014m_433997021415=
4050837h5"><div dir=3D"ltr"><div>I am tryiing to add meta-networking layer =
(to get Internet connection to poky)and i have included the following line =
of code in bbconfig file <br>/home/jarvis/poky/meta-openemb<wbr>edded/meta-=
networking \<br><br></div>but while building i get this below error<br><br>=
<div><div><br>ERROR: ExpansionError during parsing /home/jarvis/poky/meta-o=
penemb<wbr>edded/meta-networking/recipes-<wbr>support/libtdb/<a href=3D"htt=
p://libtdb_1.3.15.bb" target=3D"_blank">libtdb_1.3.15.b<wbr>b</a><br>Traceb=
ack (most recent call last):<br>bb.data_smart.ExpansionError: Failure expan=
ding variable do_compile, expression was=C2=A0=C2=A0=C2=A0=C2=A0 python ./b=
uildtools/bin/waf ${@oe.utils.parallel_make_argu<wbr>ment(d, &#39;-j%d&#39;=
, limit=3D64)}<br>=C2=A0which triggered exception AttributeError: module &#=
39;oe.utils&#39; has no attribute &#39;parallel_make_argument&#39;<br><br><=
br></div><div>DO help,<br><br></div><div>is there any other way to establis=
h Internet connection inside poky?<br><br></div><div>Thanks<br></div><div><=
br></div></div></div>
<br></div></div><span class=3D"m_-523917750872987930m_-7841170760491153267m=
_-8758481982879607889m_-5634036908401493779m_6704635246269763952m_840283605=
7187324486m_7549818448200897835m_-862766904418843875m_473202723307373014m_4=
339970214154050837HOEnZb"><font color=3D"#888888">--<br>
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
</div></div></blockquote></div><br></div></div></div>
</blockquote></div><br></div>

--001a113f9730321b950567eaa910--
