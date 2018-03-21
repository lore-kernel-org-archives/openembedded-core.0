Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 61FF3788C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 10:42:57 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id x5so2759182vkd.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OfGpjRGXscMKdYNTQVzBpQ70MjaiNw8p05q+T8Qitmg=;
	b=MD6TlJ69t2TtI/ujFfTycbuupDZFd+yxXKo3/BreZOowOGXLN9SevFODe2lF5oRYSS
	vfbCgO0YsCTm5+9Cbwpp2Ep+8QC5D8wXdJs2DgPKGurRoPn3ha6x5neCPId21JmtiDUU
	Jo+/yCdXRYzuE2gmdPiRTKqYJhXLDx9ysCaOV52w4q1+yndlBAS+0Y8a1DRl4xyJc1Em
	Ol340MVm+Uwv3/dy1NsD/te1IqnyaHWzssk5PW2P5mTwrXnJGpKt3pklC7xmhwDGalFk
	JDGLB066Ch95lmVskvRDu1biH9Mwqz5DYVrTZF9JKJIW4TwOO36li7k4f1Pu5LDe/0sB
	XaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OfGpjRGXscMKdYNTQVzBpQ70MjaiNw8p05q+T8Qitmg=;
	b=Z9nVuTpG+BWAcwOApm3F28I+YWwLP/hyCgtcG7yiR9/NnvJHltyvuu+O24crAwrTBG
	H/r/8AN7VXQdUA/6VXSyVpSJCnCRt3X7kt58kwz8liVi8lBPYHbe2zE9eqm2y9gfdn15
	BnKSSKoxcdGV5Ww5hGBIcrkEyc5sMAEHcxR7MC4ZszCnrjXRKlPro+Xu+hbDfIw6U4bs
	QTfeYlt6G+Ia90nPvv/e/usEHE23IvExfAs+ykQE8eClq9zS5KIzd/grb8kGbwyQsA8n
	Tc9Km1aCDK0m2TVp5uNQ2kgyzQugjjScyWhOf6p844GlkjXR1YmX9XMOfo4V/1VDsqF4
	g1QQ==
X-Gm-Message-State: AElRT7HBu6wvqt8C4R7Cs9HrJV4MHUMzQnx1RGuTWq9sJBu8m6lWskZb
	RqKS8ukI15aFUrj1ZHYCgaMeCQcoHUPB6HwZc4o=
X-Google-Smtp-Source: AG47ELs0ABnmGiwnfyAkB2XITCN/tjvblWEPoWmhbnvTzrYaMpNm7D4jbIXuydc/H2ay7r9+M/qOLJG/+D+Fd+7AIPw=
X-Received: by 10.31.74.1 with SMTP id x1mr4660632vka.44.1521628979047; Wed,
	21 Mar 2018 03:42:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Wed, 21 Mar 2018 03:42:58 -0700 (PDT)
In-Reply-To: <CAJTo0LYbWfqRe4hE3279Wmpy-5dSCNfXeT9VwFvp_qHtS+BcHQ@mail.gmail.com>
References: <CAPGMVzEUccZZpxwJpH0akzn7+FyaZf0NbDZoN=73+u8g=yA4Fg@mail.gmail.com>
	<CAJTo0LYGumRqn5=GeB=41abhNn8s6dqoE_d3gMZThwkLor-_zA@mail.gmail.com>
	<CAPGMVzEqtt8C0DCR28fMik6c+9jGtM3=uKRbxrMDEv=8CexdiQ@mail.gmail.com>
	<CAPGMVzHyC098J=w5Xbt8z__2-9LVSeBhiJ1U+EHQLiGU1x+huw@mail.gmail.com>
	<CAJTo0LZ49vPGn8rWMSj607aQZP8HQLMb4o9cq3yvTAEk57ecaA@mail.gmail.com>
	<CAPGMVzHgcsNe9mjrTvGTyBztX-TKuip1Tx4+HDOk7UP-H9mwxA@mail.gmail.com>
	<CAJTo0LYbWfqRe4hE3279Wmpy-5dSCNfXeT9VwFvp_qHtS+BcHQ@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Wed, 21 Mar 2018 16:12:58 +0530
Message-ID: <CAPGMVzEO8K4gM=_f_+wTrqeyF12W4S-v7nx5Ff6HvN7vvOkjnA@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Mar 2018 10:42:58 -0000
Content-Type: multipart/alternative; boundary="001a114db110c6b4190567e9dae8"

--001a114db110c6b4190567e9dae8
Content-Type: text/plain; charset="UTF-8"

sure, i will look into that, thanks.
and , i am actually using core-image-sato

regards,
Rajath C S

Rajath C S,
9964182112,
Bangalore - 560060

On Wed, Mar 21, 2018 at 4:11 PM, Burton, Ross <ross.burton@intel.com> wrote:

> Ideally in an image of your own creation, as local.conf tweaking is for
> experimentation only.
>
> There's a section in the manual about customising images, and I recommend
> that you start from an image with functionality instead of starting from a
> minimal image and trying to discover how to do basics such as make
> networking functional.
>
> Ross
>
> On 21 March 2018 at 10:35, Rajath C S <rajathcs.1996@gmail.com> wrote:
>
>> so the  connman / ifupdown and wireless-tools have to be placed in the
>> local.conf file right?
>>
>> Rajath C S,
>> 9964182112,
>> Bangalore - 560060
>>
>> On Wed, Mar 21, 2018 at 3:57 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>
>>> ifupdown and wireless-tools will give you the basics to configure it by
>>> hand, or use connman.  Or network-manager, in meta-oe.
>>>
>>> core-image-sato includes both connman and a UI to join to wifi.
>>>
>>> Ross
>>>
>>> On 21 March 2018 at 10:25, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>>
>>>>
>>>> thanks,
>>>>
>>>> i will follow the said things,
>>>>
>>>> but as of now my situation is as such : "
>>>> sure, i will have one other question that is how to establish internet
>>>> connection on to poky?
>>>> that is , i have placed the meta-networking layer in bblayer.conf file
>>>> so after that which recipe should i add to local.conf so that wireless
>>>> connection is established on the poky?
>>>>
>>>> Do help with the steps
>>>>
>>>> Thanks"
>>>> I will try and implement networking from oe-core
>>>>
>>>>
>>>> Rajath C S,
>>>> 9964182112,
>>>> Bangalore - 560060
>>>>
>>>> On Wed, Mar 21, 2018 at 3:40 PM, Burton, Ross <ross.burton@intel.com>
>>>> wrote:
>>>>
>>>>> First, you don't need meta-networking to make networking "work",
>>>>> because oe-core has the basics.
>>>>>
>>>>> Second, you need to match the release of layers.  You're using
>>>>> meta-networking master, and a previous release of poky.  Checkout the
>>>>> corresponding release branch of meta-networking.
>>>>>
>>>>> Ross
>>>>>
>>>>> On 21 March 2018 at 07:29, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>>>>
>>>>>> I am tryiing to add meta-networking layer (to get Internet connection
>>>>>> to poky)and i have included the following line of code in bbconfig file
>>>>>> /home/jarvis/poky/meta-openembedded/meta-networking \
>>>>>>
>>>>>> but while building i get this below error
>>>>>>
>>>>>>
>>>>>> ERROR: ExpansionError during parsing /home/jarvis/poky/meta-openemb
>>>>>> edded/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb
>>>>>> Traceback (most recent call last):
>>>>>> bb.data_smart.ExpansionError: Failure expanding variable do_compile,
>>>>>> expression was     python ./buildtools/bin/waf
>>>>>> ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
>>>>>>  which triggered exception AttributeError: module 'oe.utils' has no
>>>>>> attribute 'parallel_make_argument'
>>>>>>
>>>>>>
>>>>>> DO help,
>>>>>>
>>>>>> is there any other way to establish Internet connection inside poky?
>>>>>>
>>>>>> Thanks
>>>>>>
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>
>>>>>>
>>>>>
>>>>
>>>>
>>>
>>
>

--001a114db110c6b4190567e9dae8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>sure, i will look into that, thanks.<br></d=
iv>and , i am actually using core-image-sato<br><br></div>regards,<br></div=
>Rajath C S <br></div><div class=3D"gmail_extra"><br clear=3D"all"><div><di=
v class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"=
ltr"><div><div>Rajath C S,<br>9964182112,<br></div></div>Bangalore - 560060=
<br></div></div></div>
<br><div class=3D"gmail_quote">On Wed, Mar 21, 2018 at 4:11 PM, Burton, Ros=
s <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"=
_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr">Ideally in an image of your own creation, as lo=
cal.conf tweaking is for experimentation only.<div><br></div><div>There&#39=
;s a section in the manual about customising images, and I recommend that y=
ou start from an image with functionality instead of starting from a minima=
l image and trying to discover how to do basics such as make networking fun=
ctional.</div><span class=3D"HOEnZb"><font color=3D"#888888"><div><br></div=
><div>Ross</div></font></span></div><div class=3D"HOEnZb"><div class=3D"h5"=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 March 2018=
 at 10:35, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996=
@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">so the=C2=A0 connman / =
ifupdown and wireless-tools have to be placed in the local.conf file right?=
<br></div><div class=3D"gmail_extra"><span><br clear=3D"all"><div><div clas=
s=3D"m_8402836057187324486m_7549818448200897835gmail_signature" data-smartm=
ail=3D"gmail_signature"><div dir=3D"ltr"><div><div>Rajath C S,<br>996418211=
2,<br></div></div>Bangalore - 560060<br></div></div></div>
<br></span><div><div class=3D"m_8402836057187324486h5"><div class=3D"gmail_=
quote">On Wed, Mar 21, 2018 at 3:57 PM, Burton, Ross <span dir=3D"ltr">&lt;=
<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr">ifupdown and wireless-tools will give you the basics to configure it by=
 hand, or use connman.=C2=A0 Or network-manager, in meta-oe.<div><br></div>=
<div>core-image-sato includes both connman and a UI to join to wifi.</div><=
span class=3D"m_8402836057187324486m_7549818448200897835HOEnZb"><font color=
=3D"#888888"><div><br></div><div>Ross</div></font></span></div><div class=
=3D"m_8402836057187324486m_7549818448200897835HOEnZb"><div class=3D"m_84028=
36057187324486m_7549818448200897835h5"><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On 21 March 2018 at 10:25, Rajath C S <span dir=3D"lt=
r">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">rajathc=
s.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv class=3D"m_8402836057187324486m_7549818448200897835m_-862766904418843875=
HOEnZb"><div class=3D"m_8402836057187324486m_7549818448200897835m_-86276690=
4418843875h5"><div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"l=
tr"><div><div><div>thanks,<br><br></div>i will follow the said things,<br><=
br></div>but as of now my situation is as such : &quot;<div><div><div>sure,=
 i will have one other question that is how to establish internet connectio=
n on to poky?<br></div>that
 is , i have placed the meta-networking layer in bblayer.conf file so=20
after that which recipe should i add to local.conf so that wireless=20
connection is established on the poky?<br><br></div>Do help with the steps =
<br><br></div>Thanks&quot;<br></div>I will try and implement networking fro=
m oe-core<span class=3D"m_8402836057187324486m_7549818448200897835m_-862766=
904418843875m_473202723307373014HOEnZb"><font color=3D"#888888"><br><div><b=
r></div></font></span></div><div class=3D"gmail_extra"><span class=3D"m_840=
2836057187324486m_7549818448200897835m_-862766904418843875m_473202723307373=
014HOEnZb"><font color=3D"#888888"><br clear=3D"all"><div><div class=3D"m_8=
402836057187324486m_7549818448200897835m_-862766904418843875m_4732027233073=
73014m_4339970214154050837gmail_signature" data-smartmail=3D"gmail_signatur=
e"><div dir=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br></div></div>Ban=
galore - 560060<br></div></div></div></font></span><div><div class=3D"m_840=
2836057187324486m_7549818448200897835m_-862766904418843875m_473202723307373=
014h5">
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
e"><div><div class=3D"m_8402836057187324486m_7549818448200897835m_-86276690=
4418843875m_473202723307373014m_4339970214154050837h5">On 21 March 2018 at =
07:29, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gma=
il.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br>=
</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"m_84028360571=
87324486m_7549818448200897835m_-862766904418843875m_473202723307373014m_433=
9970214154050837h5"><div dir=3D"ltr"><div>I am tryiing to add meta-networki=
ng layer (to get Internet connection to poky)and i have included the follow=
ing line of code in bbconfig file <br>/home/jarvis/poky/meta-openemb<wbr>ed=
ded/meta-networking \<br><br></div>but while building i get this below erro=
r<br><br><div><div><br>ERROR: ExpansionError during parsing /home/jarvis/po=
ky/meta-openemb<wbr>edded/meta-networking/recipes-<wbr>support/libtdb/<a hr=
ef=3D"http://libtdb_1.3.15.bb" target=3D"_blank">libtdb_1.3.15.b<wbr>b</a><=
br>Traceback (most recent call last):<br>bb.data_smart.ExpansionError: Fail=
ure expanding variable do_compile, expression was=C2=A0=C2=A0=C2=A0=C2=A0 p=
ython ./buildtools/bin/waf ${@oe.utils.parallel_make_argu<wbr>ment(d, &#39;=
-j%d&#39;, limit=3D64)}<br>=C2=A0which triggered exception AttributeError: =
module &#39;oe.utils&#39; has no attribute &#39;parallel_make_argument&#39;=
<br><br><br></div><div>DO help,<br><br></div><div>is there any other way to=
 establish Internet connection inside poky?<br><br></div><div>Thanks<br></d=
iv><div><br></div></div></div>
<br></div></div><span class=3D"m_8402836057187324486m_7549818448200897835m_=
-862766904418843875m_473202723307373014m_4339970214154050837HOEnZb"><font c=
olor=3D"#888888">--<br>
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
</div></div></blockquote></div><br></div>

--001a114db110c6b4190567e9dae8--
