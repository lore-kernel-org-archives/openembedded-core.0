Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id D54DD7895D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:36:21 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id j85so2833005vke.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 04:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=con41hjIVPtV35d7rVvjN+AvkSfXJf9YfYwEbj108PA=;
	b=S1Y9ga5Y5Ao3wwKChFqrU5fVAzfW3PNpG0lPW/wbBjZb975Q4ubNW8B5vlOROzMpKI
	SXfYLQEBpf7NE6FFfG+OK+jSAZkcjfKz7FaIxH5ZgbRrUgyRjx6J0yfAMVF9qkJCDN4C
	vpzvdx/Q2jkfqNNvXoicFCYvbgSG+l1JQ/8jglzUTqoE2cZ4n8IvYS40ZejMWN++9jwS
	dSqmqlN8aN6uxy+iPqZRHPOq5vVE93tzuobnYAJUd8WNbuYHLn7v2jc2CdRDENtqzseQ
	0OrPqOkrld0le3z/tyL0KxOA93OeYfDI+MsZNvCWHhXHe1U6uLBPwVMoATMdFVBKbEzG
	eAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=con41hjIVPtV35d7rVvjN+AvkSfXJf9YfYwEbj108PA=;
	b=rDg8uf/jjQYDQsIg92ftxZXHME8Ri2vvEcl5n9Bl9f+lDjv7DWAhqrU6UneR6T+z/o
	pFUEo3q0tlqYsS3NajfAVO7INJW1KffTwpAWFLRDkgGwXV4+UH5Vmg83QGTFs8ysKfDK
	TbFGVAqAGWLgaVTa3XPsU1+7S7wdXc5UL3tlWQV1qM0C20NupbHQsKCdW3z71YH8+Pxk
	+EJ9sogpJqM2XtTIQxcIUyF50PWdlF4hcX64STRa6fP1NZrDkfOvzrkIKRP/i4tg+Mh7
	3ad+q+2Fx+yO3y3qHUKMYBLWSrqiaehBJygiLJBYdwg3jdd7QyvXGgB2Q73beDmrqz+W
	bO7A==
X-Gm-Message-State: AElRT7FY1F7lRniHOuZDJaZSb9bBYGn9mMvXVkS+jc9geoS6psG7eqtL
	bgttzmphNF7jPiTqITSIlgcW/D/G3NlKo3rFkgg=
X-Google-Smtp-Source: AG47ELt7Oi3vTEL1XnAwjkE+qNtYcxfufbGs8p9JtEpiUQsdEGJ1VI78hPjhosdhnXrdxEHFskS7BWsh8FIvcsiWqBQ=
X-Received: by 10.31.74.1 with SMTP id x1mr4763029vka.44.1521632182451; Wed,
	21 Mar 2018 04:36:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Wed, 21 Mar 2018 04:36:21 -0700 (PDT)
In-Reply-To: <CAJTo0LbJAebMeAqhPrq6so=NWx86sWkfWERuPE2K2UwKdZzUKw@mail.gmail.com>
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
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Wed, 21 Mar 2018 17:06:21 +0530
Message-ID: <CAPGMVzHVS+AxxZHuiCzhS3DX_-CzHO4ezTtrkW8mMmFu_zkZfg@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Mar 2018 11:36:22 -0000
Content-Type: multipart/alternative; boundary="001a114db110b6c4930567ea992f"

--001a114db110b6c4930567ea992f
Content-Type: text/plain; charset="UTF-8"

By kernel are you referring to the yocto's kernel or my host machine kernel?

if it is host machine kernel then i have the drivers
and , what should i do with connman?

thanks

Rajath C S,
9964182112,
Bangalore - 560060

On Wed, Mar 21, 2018 at 5:02 PM, Burton, Ross <ross.burton@intel.com> wrote:

> I never mentioned glib-networking and it wont help at all.
>
> If connman can't see your wifi then your kernel is missing the drivers
>  you need.
>
> Ross
>
> On 21 March 2018 at 10:53, Rajath C S <rajathcs.1996@gmail.com> wrote:
>
>> yes, when clicked on it. it says Ethernet connection
>>
>> so, inside oe-core there is a folder and file called :
>> glib-networking_2.54.1.bb; so now acording to your second msg to enable
>> wifi should i include this file in MAGE_INSTALL_append command of
>> local.conf?
>>
>> Rajath C S,
>> 9964182112,
>> Bangalore - 560060
>>
>> On Wed, Mar 21, 2018 at 4:14 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>
>>> Then you have a nice button in the top right to setup wifi already.
>>>
>>> Ross
>>>
>>> On 21 March 2018 at 10:42, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>>
>>>> sure, i will look into that, thanks.
>>>> and , i am actually using core-image-sato
>>>>
>>>> regards,
>>>> Rajath C S
>>>>
>>>> Rajath C S,
>>>> 9964182112,
>>>> Bangalore - 560060
>>>>
>>>> On Wed, Mar 21, 2018 at 4:11 PM, Burton, Ross <ross.burton@intel.com>
>>>> wrote:
>>>>
>>>>> Ideally in an image of your own creation, as local.conf tweaking is
>>>>> for experimentation only.
>>>>>
>>>>> There's a section in the manual about customising images, and I
>>>>> recommend that you start from an image with functionality instead of
>>>>> starting from a minimal image and trying to discover how to do basics such
>>>>> as make networking functional.
>>>>>
>>>>> Ross
>>>>>
>>>>> On 21 March 2018 at 10:35, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>>>>
>>>>>> so the  connman / ifupdown and wireless-tools have to be placed in
>>>>>> the local.conf file right?
>>>>>>
>>>>>> Rajath C S,
>>>>>> 9964182112,
>>>>>> Bangalore - 560060
>>>>>>
>>>>>> On Wed, Mar 21, 2018 at 3:57 PM, Burton, Ross <ross.burton@intel.com>
>>>>>> wrote:
>>>>>>
>>>>>>> ifupdown and wireless-tools will give you the basics to configure it
>>>>>>> by hand, or use connman.  Or network-manager, in meta-oe.
>>>>>>>
>>>>>>> core-image-sato includes both connman and a UI to join to wifi.
>>>>>>>
>>>>>>> Ross
>>>>>>>
>>>>>>> On 21 March 2018 at 10:25, Rajath C S <rajathcs.1996@gmail.com>
>>>>>>> wrote:
>>>>>>>
>>>>>>>>
>>>>>>>> thanks,
>>>>>>>>
>>>>>>>> i will follow the said things,
>>>>>>>>
>>>>>>>> but as of now my situation is as such : "
>>>>>>>> sure, i will have one other question that is how to establish
>>>>>>>> internet connection on to poky?
>>>>>>>> that is , i have placed the meta-networking layer in bblayer.conf
>>>>>>>> file so after that which recipe should i add to local.conf so that wireless
>>>>>>>> connection is established on the poky?
>>>>>>>>
>>>>>>>> Do help with the steps
>>>>>>>>
>>>>>>>> Thanks"
>>>>>>>> I will try and implement networking from oe-core
>>>>>>>>
>>>>>>>>
>>>>>>>> Rajath C S,
>>>>>>>> 9964182112,
>>>>>>>> Bangalore - 560060
>>>>>>>>
>>>>>>>> On Wed, Mar 21, 2018 at 3:40 PM, Burton, Ross <
>>>>>>>> ross.burton@intel.com> wrote:
>>>>>>>>
>>>>>>>>> First, you don't need meta-networking to make networking "work",
>>>>>>>>> because oe-core has the basics.
>>>>>>>>>
>>>>>>>>> Second, you need to match the release of layers.  You're using
>>>>>>>>> meta-networking master, and a previous release of poky.  Checkout the
>>>>>>>>> corresponding release branch of meta-networking.
>>>>>>>>>
>>>>>>>>> Ross
>>>>>>>>>
>>>>>>>>> On 21 March 2018 at 07:29, Rajath C S <rajathcs.1996@gmail.com>
>>>>>>>>> wrote:
>>>>>>>>>
>>>>>>>>>> I am tryiing to add meta-networking layer (to get Internet
>>>>>>>>>> connection to poky)and i have included the following line of code in
>>>>>>>>>> bbconfig file
>>>>>>>>>> /home/jarvis/poky/meta-openembedded/meta-networking \
>>>>>>>>>>
>>>>>>>>>> but while building i get this below error
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> ERROR: ExpansionError during parsing
>>>>>>>>>> /home/jarvis/poky/meta-openembedded/meta-networking/recipes-
>>>>>>>>>> support/libtdb/libtdb_1.3.15.bb
>>>>>>>>>> Traceback (most recent call last):
>>>>>>>>>> bb.data_smart.ExpansionError: Failure expanding variable
>>>>>>>>>> do_compile, expression was     python ./buildtools/bin/waf
>>>>>>>>>> ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
>>>>>>>>>>  which triggered exception AttributeError: module 'oe.utils' has
>>>>>>>>>> no attribute 'parallel_make_argument'
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> DO help,
>>>>>>>>>>
>>>>>>>>>> is there any other way to establish Internet connection inside
>>>>>>>>>> poky?
>>>>>>>>>>
>>>>>>>>>> Thanks
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> --
>>>>>>>>>> _______________________________________________
>>>>>>>>>> Openembedded-core mailing list
>>>>>>>>>> Openembedded-core@lists.openembedded.org
>>>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
>

--001a114db110b6c4930567ea992f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>By kernel are you referring to the yocto&#3=
9;s kernel or my host machine kernel?<br><br></div>if it is host machine ke=
rnel then i have the drivers <br></div>and , what should i do with connman?=
<br><br></div>thanks<br></div><div class=3D"gmail_extra"><br clear=3D"all">=
<div><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div=
 dir=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br></div></div>Bangalore =
- 560060<br></div></div></div>
<br><div class=3D"gmail_quote">On Wed, Mar 21, 2018 at 5:02 PM, Burton, Ros=
s <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"=
_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr">I never mentioned glib-networking and it wont h=
elp at all.<div><br></div><div>If connman can&#39;t see your wifi then your=
 kernel is missing the drivers =C2=A0you need.</div><span class=3D"HOEnZb">=
<font color=3D"#888888"><div><br></div><div>Ross</div></font></span></div><=
div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On 21 March 2018 at 10:53, Rajath C S <span dir=3D"lt=
r">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">rajathc=
s.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv dir=3D"ltr"><div>yes, when clicked on it. it says Ethernet connection<br=
><br></div>so, inside oe-core there is a folder and file called : <a href=
=3D"http://glib-networking_2.54.1.bb" target=3D"_blank">glib-networking_2.5=
4.1.bb</a>; so now acording to your second msg to enable wifi should i incl=
ude this file in MAGE_INSTALL_append command of local.conf?<br></div><div c=
lass=3D"gmail_extra"><span><br clear=3D"all"><div><div class=3D"m_-78411707=
60491153267m_-8758481982879607889gmail_signature" data-smartmail=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br></div></=
div>Bangalore - 560060<br></div></div></div>
<br></span><div><div class=3D"m_-7841170760491153267h5"><div class=3D"gmail=
_quote">On Wed, Mar 21, 2018 at 4:14 PM, Burton, Ross <span dir=3D"ltr">&lt=
;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr">Then you have a nice button in the top right to setup wifi already.<sp=
an class=3D"m_-7841170760491153267m_-8758481982879607889HOEnZb"><font color=
=3D"#888888"><div><br></div><div>Ross</div></font></span></div><div class=
=3D"m_-7841170760491153267m_-8758481982879607889HOEnZb"><div class=3D"m_-78=
41170760491153267m_-8758481982879607889h5"><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On 21 March 2018 at 10:42, Rajath C S <span dir=
=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">r=
ajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr"><div><div><div>sure, i will look into that, thanks.<br=
></div>and , i am actually using core-image-sato<br><br></div>regards,<br><=
/div>Rajath C S <br></div><div class=3D"gmail_extra"><span><br clear=3D"all=
"><div><div class=3D"m_-7841170760491153267m_-8758481982879607889m_-5634036=
908401493779m_6704635246269763952gmail_signature" data-smartmail=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br></div></=
div>Bangalore - 560060<br></div></div></div>
<br></span><div><div class=3D"m_-7841170760491153267m_-8758481982879607889m=
_-5634036908401493779h5"><div class=3D"gmail_quote">On Wed, Mar 21, 2018 at=
 4:11 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@=
intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Ideally in an image of you=
r own creation, as local.conf tweaking is for experimentation only.<div><br=
></div><div>There&#39;s a section in the manual about customising images, a=
nd I recommend that you start from an image with functionality instead of s=
tarting from a minimal image and trying to discover how to do basics such a=
s make networking functional.</div><span class=3D"m_-7841170760491153267m_-=
8758481982879607889m_-5634036908401493779m_6704635246269763952HOEnZb"><font=
 color=3D"#888888"><div><br></div><div>Ross</div></font></span></div><div c=
lass=3D"m_-7841170760491153267m_-8758481982879607889m_-5634036908401493779m=
_6704635246269763952HOEnZb"><div class=3D"m_-7841170760491153267m_-87584819=
82879607889m_-5634036908401493779m_6704635246269763952h5"><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 21 March 2018 at 10:35, Rajath =
C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=
=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div dir=3D"ltr">so the=C2=A0 connman / ifupdown and wirel=
ess-tools have to be placed in the local.conf file right?<br></div><div cla=
ss=3D"gmail_extra"><span><br clear=3D"all"><div><div class=3D"m_-7841170760=
491153267m_-8758481982879607889m_-5634036908401493779m_6704635246269763952m=
_8402836057187324486m_7549818448200897835gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br>=
</div></div>Bangalore - 560060<br></div></div></div>
<br></span><div><div class=3D"m_-7841170760491153267m_-8758481982879607889m=
_-5634036908401493779m_6704635246269763952m_8402836057187324486h5"><div cla=
ss=3D"gmail_quote">On Wed, Mar 21, 2018 at 3:57 PM, Burton, Ross <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ros=
s.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div dir=3D"ltr">ifupdown and wireless-tools will give you the basics to co=
nfigure it by hand, or use connman.=C2=A0 Or network-manager, in meta-oe.<d=
iv><br></div><div>core-image-sato includes both connman and a UI to join to=
 wifi.</div><span class=3D"m_-7841170760491153267m_-8758481982879607889m_-5=
634036908401493779m_6704635246269763952m_8402836057187324486m_7549818448200=
897835HOEnZb"><font color=3D"#888888"><div><br></div><div>Ross</div></font>=
</span></div><div class=3D"m_-7841170760491153267m_-8758481982879607889m_-5=
634036908401493779m_6704635246269763952m_8402836057187324486m_7549818448200=
897835HOEnZb"><div class=3D"m_-7841170760491153267m_-8758481982879607889m_-=
5634036908401493779m_6704635246269763952m_8402836057187324486m_754981844820=
0897835h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 =
March 2018 at 10:25, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:raj=
athcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div class=3D"m_-7841170760491=
153267m_-8758481982879607889m_-5634036908401493779m_6704635246269763952m_84=
02836057187324486m_7549818448200897835m_-862766904418843875HOEnZb"><div cla=
ss=3D"m_-7841170760491153267m_-8758481982879607889m_-5634036908401493779m_6=
704635246269763952m_8402836057187324486m_7549818448200897835m_-862766904418=
843875h5"><div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
<div><div><div>thanks,<br><br></div>i will follow the said things,<br><br><=
/div>but as of now my situation is as such : &quot;<div><div><div>sure, i w=
ill have one other question that is how to establish internet connection on=
 to poky?<br></div>that
 is , i have placed the meta-networking layer in bblayer.conf file so=20
after that which recipe should i add to local.conf so that wireless=20
connection is established on the poky?<br><br></div>Do help with the steps =
<br><br></div>Thanks&quot;<br></div>I will try and implement networking fro=
m oe-core<span class=3D"m_-7841170760491153267m_-8758481982879607889m_-5634=
036908401493779m_6704635246269763952m_8402836057187324486m_7549818448200897=
835m_-862766904418843875m_473202723307373014HOEnZb"><font color=3D"#888888"=
><br><div><br></div></font></span></div><div class=3D"gmail_extra"><span cl=
ass=3D"m_-7841170760491153267m_-8758481982879607889m_-5634036908401493779m_=
6704635246269763952m_8402836057187324486m_7549818448200897835m_-86276690441=
8843875m_473202723307373014HOEnZb"><font color=3D"#888888"><br clear=3D"all=
"><div><div class=3D"m_-7841170760491153267m_-8758481982879607889m_-5634036=
908401493779m_6704635246269763952m_8402836057187324486m_7549818448200897835=
m_-862766904418843875m_473202723307373014m_4339970214154050837gmail_signatu=
re" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>Rajath C =
S,<br>9964182112,<br></div></div>Bangalore - 560060<br></div></div></div></=
font></span><div><div class=3D"m_-7841170760491153267m_-8758481982879607889=
m_-5634036908401493779m_6704635246269763952m_8402836057187324486m_754981844=
8200897835m_-862766904418843875m_473202723307373014h5">
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
e"><div><div class=3D"m_-7841170760491153267m_-8758481982879607889m_-563403=
6908401493779m_6704635246269763952m_8402836057187324486m_754981844820089783=
5m_-862766904418843875m_473202723307373014m_4339970214154050837h5">On 21 Ma=
rch 2018 at 07:29, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajat=
hcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span=
> wrote:<br></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"m=
_-7841170760491153267m_-8758481982879607889m_-5634036908401493779m_67046352=
46269763952m_8402836057187324486m_7549818448200897835m_-862766904418843875m=
_473202723307373014m_4339970214154050837h5"><div dir=3D"ltr"><div>I am tryi=
ing to add meta-networking layer (to get Internet connection to poky)and i =
have included the following line of code in bbconfig file <br>/home/jarvis/=
poky/meta-openemb<wbr>edded/meta-networking \<br><br></div>but while buildi=
ng i get this below error<br><br><div><div><br>ERROR: ExpansionError during=
 parsing /home/jarvis/poky/meta-openemb<wbr>edded/meta-networking/recipes-<=
wbr>support/libtdb/<a href=3D"http://libtdb_1.3.15.bb" target=3D"_blank">li=
btdb_1.3.15.b<wbr>b</a><br>Traceback (most recent call last):<br>bb.data_sm=
art.ExpansionError: Failure expanding variable do_compile, expression was=
=C2=A0=C2=A0=C2=A0=C2=A0 python ./buildtools/bin/waf ${@oe.utils.parallel_m=
ake_argu<wbr>ment(d, &#39;-j%d&#39;, limit=3D64)}<br>=C2=A0which triggered =
exception AttributeError: module &#39;oe.utils&#39; has no attribute &#39;p=
arallel_make_argument&#39;<br><br><br></div><div>DO help,<br><br></div><div=
>is there any other way to establish Internet connection inside poky?<br><b=
r></div><div>Thanks<br></div><div><br></div></div></div>
<br></div></div><span class=3D"m_-7841170760491153267m_-8758481982879607889=
m_-5634036908401493779m_6704635246269763952m_8402836057187324486m_754981844=
8200897835m_-862766904418843875m_473202723307373014m_4339970214154050837HOE=
nZb"><font color=3D"#888888">--<br>
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
</div></div></blockquote></div><br></div>

--001a114db110b6c4930567ea992f--
