Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2F22278960
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 10:44:38 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id e195-v6so6263725ita.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uuu+PH0sv2nE7E/fYCFmoN3k37poCTpPgSKWwaKZCTk=;
	b=GkwuIt9hmNj18NwPMbPyjaesGT1tOz0cLBaHUWpxGX4Pyx6/IsTsjdvtU/HgCKu2dd
	XtCb9tT1IGSEjyCxEtHWLCnIalEz0IOgDE3ipz+OH6gcq/kTnOdBOS+1BjWzYS5U7JhV
	guwymaheD2HpkgQfn+G2vc73cvhKAXb7/ea3ewr6G8rKi+r/yX1lBjLLfgu0iC+suFUw
	CvMH1pgoxqo+qRUf/IBEuqZ2sJnIVUAeIowQltT67ECHoXJbBleuSzCfe2llV56rvEKc
	C/ouUQrjQdaE5acN8mLaXPOjKq4PaItciva9CqxR3HqT/dutWogMqOyXJuqni01kcjeO
	JfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uuu+PH0sv2nE7E/fYCFmoN3k37poCTpPgSKWwaKZCTk=;
	b=YaHwa4SwEa2O0x/cgS7awcNLmhtk/aTSaglHg5AJPkoaPVHtk+BdYGDGoy9gPzQSLt
	veMzZmTC3j/5A5IUGmlZ+zAbxnIWsRndx0KckP1Z8S6ZUAJfH4L3gUpmGX75q9a8Y1wL
	gCV4EYd6iC3YPZ+qFBxfGCIfwVSfiJ3ZOyl2Lw11LJpuSD4zjARmxx37WLOgHv9ybAnb
	9+RK4pBBw/nHx6eqCxLaV8jVIFq3cYkgIULxcbMovmDgkxGg4z4iNrZ28p8NwDtmCxlE
	L1JbjKWjdhGnScThs1K/yVFOB4joj66vPHgoCIEw0y2kr41fn3dlQkPlazIh32ka196Q
	I1pw==
X-Gm-Message-State: AElRT7HLIms5y9wQhUk2CZmIysUg/4EnRptCOyZGXU/EIuibykpF+Zii
	+rMayquazDkzw1MIOfILLwBHx4Vw+1CIQ4fAEgwf7Q==
X-Google-Smtp-Source: AG47ELunhbfu0Prx1dUij8eUy3O5xMk7ew4vLc7j1j3mn/4Z/jmZpoKqPvKEE9Oz9SGrPDrXgnRYIxRxIJXGDVv5WLo=
X-Received: by 2002:a24:f685:: with SMTP id
	u127-v6mr3339154ith.131.1521629080323; 
	Wed, 21 Mar 2018 03:44:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 21 Mar 2018 03:44:19 -0700 (PDT)
In-Reply-To: <CAPGMVzEO8K4gM=_f_+wTrqeyF12W4S-v7nx5Ff6HvN7vvOkjnA@mail.gmail.com>
References: <CAPGMVzEUccZZpxwJpH0akzn7+FyaZf0NbDZoN=73+u8g=yA4Fg@mail.gmail.com>
	<CAJTo0LYGumRqn5=GeB=41abhNn8s6dqoE_d3gMZThwkLor-_zA@mail.gmail.com>
	<CAPGMVzEqtt8C0DCR28fMik6c+9jGtM3=uKRbxrMDEv=8CexdiQ@mail.gmail.com>
	<CAPGMVzHyC098J=w5Xbt8z__2-9LVSeBhiJ1U+EHQLiGU1x+huw@mail.gmail.com>
	<CAJTo0LZ49vPGn8rWMSj607aQZP8HQLMb4o9cq3yvTAEk57ecaA@mail.gmail.com>
	<CAPGMVzHgcsNe9mjrTvGTyBztX-TKuip1Tx4+HDOk7UP-H9mwxA@mail.gmail.com>
	<CAJTo0LYbWfqRe4hE3279Wmpy-5dSCNfXeT9VwFvp_qHtS+BcHQ@mail.gmail.com>
	<CAPGMVzEO8K4gM=_f_+wTrqeyF12W4S-v7nx5Ff6HvN7vvOkjnA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Mar 2018 10:44:19 +0000
Message-ID: <CAJTo0LaSyNEmDbxqgtt5LhEv=pZ-fMJTynK_i3GKTs+jRop2wQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Mar 2018 10:44:39 -0000
Content-Type: multipart/alternative; boundary="000000000000d021c80567e9e036"

--000000000000d021c80567e9e036
Content-Type: text/plain; charset="UTF-8"

Then you have a nice button in the top right to setup wifi already.

Ross

On 21 March 2018 at 10:42, Rajath C S <rajathcs.1996@gmail.com> wrote:

> sure, i will look into that, thanks.
> and , i am actually using core-image-sato
>
> regards,
> Rajath C S
>
> Rajath C S,
> 9964182112,
> Bangalore - 560060
>
> On Wed, Mar 21, 2018 at 4:11 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>> Ideally in an image of your own creation, as local.conf tweaking is for
>> experimentation only.
>>
>> There's a section in the manual about customising images, and I recommend
>> that you start from an image with functionality instead of starting from a
>> minimal image and trying to discover how to do basics such as make
>> networking functional.
>>
>> Ross
>>
>> On 21 March 2018 at 10:35, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>
>>> so the  connman / ifupdown and wireless-tools have to be placed in the
>>> local.conf file right?
>>>
>>> Rajath C S,
>>> 9964182112,
>>> Bangalore - 560060
>>>
>>> On Wed, Mar 21, 2018 at 3:57 PM, Burton, Ross <ross.burton@intel.com>
>>> wrote:
>>>
>>>> ifupdown and wireless-tools will give you the basics to configure it by
>>>> hand, or use connman.  Or network-manager, in meta-oe.
>>>>
>>>> core-image-sato includes both connman and a UI to join to wifi.
>>>>
>>>> Ross
>>>>
>>>> On 21 March 2018 at 10:25, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>>>
>>>>>
>>>>> thanks,
>>>>>
>>>>> i will follow the said things,
>>>>>
>>>>> but as of now my situation is as such : "
>>>>> sure, i will have one other question that is how to establish internet
>>>>> connection on to poky?
>>>>> that is , i have placed the meta-networking layer in bblayer.conf file
>>>>> so after that which recipe should i add to local.conf so that wireless
>>>>> connection is established on the poky?
>>>>>
>>>>> Do help with the steps
>>>>>
>>>>> Thanks"
>>>>> I will try and implement networking from oe-core
>>>>>
>>>>>
>>>>> Rajath C S,
>>>>> 9964182112,
>>>>> Bangalore - 560060
>>>>>
>>>>> On Wed, Mar 21, 2018 at 3:40 PM, Burton, Ross <ross.burton@intel.com>
>>>>> wrote:
>>>>>
>>>>>> First, you don't need meta-networking to make networking "work",
>>>>>> because oe-core has the basics.
>>>>>>
>>>>>> Second, you need to match the release of layers.  You're using
>>>>>> meta-networking master, and a previous release of poky.  Checkout the
>>>>>> corresponding release branch of meta-networking.
>>>>>>
>>>>>> Ross
>>>>>>
>>>>>> On 21 March 2018 at 07:29, Rajath C S <rajathcs.1996@gmail.com>
>>>>>> wrote:
>>>>>>
>>>>>>> I am tryiing to add meta-networking layer (to get Internet
>>>>>>> connection to poky)and i have included the following line of code in
>>>>>>> bbconfig file
>>>>>>> /home/jarvis/poky/meta-openembedded/meta-networking \
>>>>>>>
>>>>>>> but while building i get this below error
>>>>>>>
>>>>>>>
>>>>>>> ERROR: ExpansionError during parsing /home/jarvis/poky/meta-openemb
>>>>>>> edded/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb
>>>>>>> Traceback (most recent call last):
>>>>>>> bb.data_smart.ExpansionError: Failure expanding variable do_compile,
>>>>>>> expression was     python ./buildtools/bin/waf
>>>>>>> ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
>>>>>>>  which triggered exception AttributeError: module 'oe.utils' has no
>>>>>>> attribute 'parallel_make_argument'
>>>>>>>
>>>>>>>
>>>>>>> DO help,
>>>>>>>
>>>>>>> is there any other way to establish Internet connection inside poky?
>>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>>
>>>>>>> --
>>>>>>> _______________________________________________
>>>>>>> Openembedded-core mailing list
>>>>>>> Openembedded-core@lists.openembedded.org
>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>
>

--000000000000d021c80567e9e036
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Then you have a nice button in the top right to setup wifi=
 already.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On 21 March 2018 at 10:42, Rajath C S <span dir=
=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">r=
ajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr"><div><div><div>sure, i will look into that, thanks.<br=
></div>and , i am actually using core-image-sato<br><br></div>regards,<br><=
/div>Rajath C S <br></div><div class=3D"gmail_extra"><span class=3D""><br c=
lear=3D"all"><div><div class=3D"m_6704635246269763952gmail_signature" data-=
smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>Rajath C S,<br>996=
4182112,<br></div></div>Bangalore - 560060<br></div></div></div>
<br></span><div><div class=3D"h5"><div class=3D"gmail_quote">On Wed, Mar 21=
, 2018 at 4:11 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ros=
s.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Ideally in an ima=
ge of your own creation, as local.conf tweaking is for experimentation only=
.<div><br></div><div>There&#39;s a section in the manual about customising =
images, and I recommend that you start from an image with functionality ins=
tead of starting from a minimal image and trying to discover how to do basi=
cs such as make networking functional.</div><span class=3D"m_67046352462697=
63952HOEnZb"><font color=3D"#888888"><div><br></div><div>Ross</div></font><=
/span></div><div class=3D"m_6704635246269763952HOEnZb"><div class=3D"m_6704=
635246269763952h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On 21 March 2018 at 10:35, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:rajathcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">so th=
e=C2=A0 connman / ifupdown and wireless-tools have to be placed in the loca=
l.conf file right?<br></div><div class=3D"gmail_extra"><span><br clear=3D"a=
ll"><div><div class=3D"m_6704635246269763952m_8402836057187324486m_75498184=
48200897835gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"=
ltr"><div><div>Rajath C S,<br>9964182112,<br></div></div>Bangalore - 560060=
<br></div></div></div>
<br></span><div><div class=3D"m_6704635246269763952m_8402836057187324486h5"=
><div class=3D"gmail_quote">On Wed, Mar 21, 2018 at 3:57 PM, Burton, Ross <=
span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_bl=
ank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div dir=3D"ltr">ifupdown and wireless-tools will give you the basi=
cs to configure it by hand, or use connman.=C2=A0 Or network-manager, in me=
ta-oe.<div><br></div><div>core-image-sato includes both connman and a UI to=
 join to wifi.</div><span class=3D"m_6704635246269763952m_84028360571873244=
86m_7549818448200897835HOEnZb"><font color=3D"#888888"><div><br></div><div>=
Ross</div></font></span></div><div class=3D"m_6704635246269763952m_84028360=
57187324486m_7549818448200897835HOEnZb"><div class=3D"m_6704635246269763952=
m_8402836057187324486m_7549818448200897835h5"><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On 21 March 2018 at 10:25, Rajath C S <span di=
r=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">=
rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div class=3D"m_6704635246269763952m_8402836057187324486m_754981844820=
0897835m_-862766904418843875HOEnZb"><div class=3D"m_6704635246269763952m_84=
02836057187324486m_7549818448200897835m_-862766904418843875h5"><div dir=3D"=
ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr"><div><div><div>thanks,=
<br><br></div>i will follow the said things,<br><br></div>but as of now my =
situation is as such : &quot;<div><div><div>sure, i will have one other que=
stion that is how to establish internet connection on to poky?<br></div>tha=
t
 is , i have placed the meta-networking layer in bblayer.conf file so=20
after that which recipe should i add to local.conf so that wireless=20
connection is established on the poky?<br><br></div>Do help with the steps =
<br><br></div>Thanks&quot;<br></div>I will try and implement networking fro=
m oe-core<span class=3D"m_6704635246269763952m_8402836057187324486m_7549818=
448200897835m_-862766904418843875m_473202723307373014HOEnZb"><font color=3D=
"#888888"><br><div><br></div></font></span></div><div class=3D"gmail_extra"=
><span class=3D"m_6704635246269763952m_8402836057187324486m_754981844820089=
7835m_-862766904418843875m_473202723307373014HOEnZb"><font color=3D"#888888=
"><br clear=3D"all"><div><div class=3D"m_6704635246269763952m_8402836057187=
324486m_7549818448200897835m_-862766904418843875m_473202723307373014m_43399=
70214154050837gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br></div></div>Bangalore - 56=
0060<br></div></div></div></font></span><div><div class=3D"m_67046352462697=
63952m_8402836057187324486m_7549818448200897835m_-862766904418843875m_47320=
2723307373014h5">
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
e"><div><div class=3D"m_6704635246269763952m_8402836057187324486m_754981844=
8200897835m_-862766904418843875m_473202723307373014m_4339970214154050837h5"=
>On 21 March 2018 at 07:29, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:rajathcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&=
gt;</span> wrote:<br></div></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div c=
lass=3D"m_6704635246269763952m_8402836057187324486m_7549818448200897835m_-8=
62766904418843875m_473202723307373014m_4339970214154050837h5"><div dir=3D"l=
tr"><div>I am tryiing to add meta-networking layer (to get Internet connect=
ion to poky)and i have included the following line of code in bbconfig file=
 <br>/home/jarvis/poky/meta-openemb<wbr>edded/meta-networking \<br><br></di=
v>but while building i get this below error<br><br><div><div><br>ERROR: Exp=
ansionError during parsing /home/jarvis/poky/meta-openemb<wbr>edded/meta-ne=
tworking/recipes-<wbr>support/libtdb/<a href=3D"http://libtdb_1.3.15.bb" ta=
rget=3D"_blank">libtdb_1.3.15.b<wbr>b</a><br>Traceback (most recent call la=
st):<br>bb.data_smart.ExpansionError: Failure expanding variable do_compile=
, expression was=C2=A0=C2=A0=C2=A0=C2=A0 python ./buildtools/bin/waf ${@oe.=
utils.parallel_make_argu<wbr>ment(d, &#39;-j%d&#39;, limit=3D64)}<br>=C2=A0=
which triggered exception AttributeError: module &#39;oe.utils&#39; has no =
attribute &#39;parallel_make_argument&#39;<br><br><br></div><div>DO help,<b=
r><br></div><div>is there any other way to establish Internet connection in=
side poky?<br><br></div><div>Thanks<br></div><div><br></div></div></div>
<br></div></div><span class=3D"m_6704635246269763952m_8402836057187324486m_=
7549818448200897835m_-862766904418843875m_473202723307373014m_4339970214154=
050837HOEnZb"><font color=3D"#888888">--<br>
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

--000000000000d021c80567e9e036--
