Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 583CE7894A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 10:34:59 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id c14so2979870uak.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C1w0R/e0Mgq8xURQ99voqPLJBoaLw0fiV36rmPgm0R0=;
	b=PX2tVuMauJ2dCjcHZ2/HaZ8laaxyxt6As2WihExeB6D536Ehppdy4hWMwF5/mMq4tc
	URuI3LObIWpEN4NE1tB0f2cdqQ8RMmU6G/AaI/6JudCeMXrRjLinOGtXr99bpMjNfgGh
	vDXuJfX+QaBM0KaAQ9F5Sqpjr+sRDn0ftTRAf1LnfaabalqmhpWL4wQGwaPwUVhaTKK3
	xUtfIWsW3OPY5Ot169rXjq9QHquUm1t39eIRkJ9oKUV4nhEIszqAUr5Vos1Tq8gbgd23
	u/Db8I9DSQbS0NQ1rLm9ZtDVsiWW0s6pTxAsTqGodbu98uNl2+ko5pyAb5aqwD1nfH73
	WZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C1w0R/e0Mgq8xURQ99voqPLJBoaLw0fiV36rmPgm0R0=;
	b=kJ8E5Z+dvQUloZblJ0eP9fva5/cHn27II++/OFnNLc4tz+ojluiF8yFFt8MqaXhAB+
	oHYoixnuGv84oSXeO85BvWSHSEadw+ETHhbjY5rN1vx8rSryiwjtQBEb2BjOEHcAEAyx
	oB3kT4uA2LrVqMAk2XGH58rQRxFoWGXsqfCXc8XMqaNBkDh+8R5vtQIcmBjTE/9AQ7pg
	Bm7qyFHd6yh6G5hP+hZQ1pcHpAzF+mSRRUi3ZdEwmn9HrTm5DhFN/9scDCl4GgH33q19
	ymSCELK0MTVOPPOrwjudanqJVPpUwNLcpsQnT12mY3MCe2vj72M4FthVt1Q/BBD7RmYz
	pykw==
X-Gm-Message-State: AElRT7HUOHlMnJuIaxQB/2iu7fAfPXMBGTeWi79bKWxyTiSajT6RnOjM
	R8B4kB+w7m6uvjsWgrCT7DqEv+7sL9e3zdWWg0M=
X-Google-Smtp-Source: AG47ELsCL1gxejmE2P7h9Dbmzj4jfPErFJihimPMfeurR1jfWhIXtRxA+9wkewo0XNIs4OxES1Hzben1N4sDqWVnyzI=
X-Received: by 10.159.61.203 with SMTP id e11mr6447255uaj.115.1521628500987;
	Wed, 21 Mar 2018 03:35:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Wed, 21 Mar 2018 03:35:00 -0700 (PDT)
In-Reply-To: <CAJTo0LZ49vPGn8rWMSj607aQZP8HQLMb4o9cq3yvTAEk57ecaA@mail.gmail.com>
References: <CAPGMVzEUccZZpxwJpH0akzn7+FyaZf0NbDZoN=73+u8g=yA4Fg@mail.gmail.com>
	<CAJTo0LYGumRqn5=GeB=41abhNn8s6dqoE_d3gMZThwkLor-_zA@mail.gmail.com>
	<CAPGMVzEqtt8C0DCR28fMik6c+9jGtM3=uKRbxrMDEv=8CexdiQ@mail.gmail.com>
	<CAPGMVzHyC098J=w5Xbt8z__2-9LVSeBhiJ1U+EHQLiGU1x+huw@mail.gmail.com>
	<CAJTo0LZ49vPGn8rWMSj607aQZP8HQLMb4o9cq3yvTAEk57ecaA@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Wed, 21 Mar 2018 16:05:00 +0530
Message-ID: <CAPGMVzHgcsNe9mjrTvGTyBztX-TKuip1Tx4+HDOk7UP-H9mwxA@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Mar 2018 10:35:00 -0000
Content-Type: multipart/alternative; boundary="089e082450284813890567e9beae"

--089e082450284813890567e9beae
Content-Type: text/plain; charset="UTF-8"

so the  connman / ifupdown and wireless-tools have to be placed in the
local.conf file right?

Rajath C S,
9964182112,
Bangalore - 560060

On Wed, Mar 21, 2018 at 3:57 PM, Burton, Ross <ross.burton@intel.com> wrote:

> ifupdown and wireless-tools will give you the basics to configure it by
> hand, or use connman.  Or network-manager, in meta-oe.
>
> core-image-sato includes both connman and a UI to join to wifi.
>
> Ross
>
> On 21 March 2018 at 10:25, Rajath C S <rajathcs.1996@gmail.com> wrote:
>
>>
>> thanks,
>>
>> i will follow the said things,
>>
>> but as of now my situation is as such : "
>> sure, i will have one other question that is how to establish internet
>> connection on to poky?
>> that is , i have placed the meta-networking layer in bblayer.conf file so
>> after that which recipe should i add to local.conf so that wireless
>> connection is established on the poky?
>>
>> Do help with the steps
>>
>> Thanks"
>> I will try and implement networking from oe-core
>>
>>
>> Rajath C S,
>> 9964182112,
>> Bangalore - 560060
>>
>> On Wed, Mar 21, 2018 at 3:40 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>
>>> First, you don't need meta-networking to make networking "work", because
>>> oe-core has the basics.
>>>
>>> Second, you need to match the release of layers.  You're using
>>> meta-networking master, and a previous release of poky.  Checkout the
>>> corresponding release branch of meta-networking.
>>>
>>> Ross
>>>
>>> On 21 March 2018 at 07:29, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>>
>>>> I am tryiing to add meta-networking layer (to get Internet connection
>>>> to poky)and i have included the following line of code in bbconfig file
>>>> /home/jarvis/poky/meta-openembedded/meta-networking \
>>>>
>>>> but while building i get this below error
>>>>
>>>>
>>>> ERROR: ExpansionError during parsing /home/jarvis/poky/meta-openemb
>>>> edded/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb
>>>> Traceback (most recent call last):
>>>> bb.data_smart.ExpansionError: Failure expanding variable do_compile,
>>>> expression was     python ./buildtools/bin/waf
>>>> ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
>>>>  which triggered exception AttributeError: module 'oe.utils' has no
>>>> attribute 'parallel_make_argument'
>>>>
>>>>
>>>> DO help,
>>>>
>>>> is there any other way to establish Internet connection inside poky?
>>>>
>>>> Thanks
>>>>
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>>
>>>
>>
>>
>

--089e082450284813890567e9beae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">so the=C2=A0 connman / ifupdown and wireless-tools have to=
 be placed in the local.conf file right?<br></div><div class=3D"gmail_extra=
"><br clear=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br></=
div></div>Bangalore - 560060<br></div></div></div>
<br><div class=3D"gmail_quote">On Wed, Mar 21, 2018 at 3:57 PM, Burton, Ros=
s <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"=
_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr">ifupdown and wireless-tools will give you the b=
asics to configure it by hand, or use connman.=C2=A0 Or network-manager, in=
 meta-oe.<div><br></div><div>core-image-sato includes both connman and a UI=
 to join to wifi.</div><span class=3D"HOEnZb"><font color=3D"#888888"><div>=
<br></div><div>Ross</div></font></span></div><div class=3D"HOEnZb"><div cla=
ss=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 M=
arch 2018 at 10:25, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:raja=
thcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div class=3D"m_-86276690441884=
3875HOEnZb"><div class=3D"m_-862766904418843875h5"><div dir=3D"ltr"><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr"><div><div><div>thanks,<br><br></di=
v>i will follow the said things,<br><br></div>but as of now my situation is=
 as such : &quot;<div><div><div>sure, i will have one other question that i=
s how to establish internet connection on to poky?<br></div>that
 is , i have placed the meta-networking layer in bblayer.conf file so=20
after that which recipe should i add to local.conf so that wireless=20
connection is established on the poky?<br><br></div>Do help with the steps =
<br><br></div>Thanks&quot;<br></div>I will try and implement networking fro=
m oe-core<span class=3D"m_-862766904418843875m_473202723307373014HOEnZb"><f=
ont color=3D"#888888"><br><div><br></div></font></span></div><div class=3D"=
gmail_extra"><span class=3D"m_-862766904418843875m_473202723307373014HOEnZb=
"><font color=3D"#888888"><br clear=3D"all"><div><div class=3D"m_-862766904=
418843875m_473202723307373014m_4339970214154050837gmail_signature" data-sma=
rtmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>Rajath C S,<br>996418=
2112,<br></div></div>Bangalore - 560060<br></div></div></div></font></span>=
<div><div class=3D"m_-862766904418843875m_473202723307373014h5">
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
e"><div><div class=3D"m_-862766904418843875m_473202723307373014m_4339970214=
154050837h5">On 21 March 2018 at 07:29, Rajath C S <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gm=
ail.com</a>&gt;</span> wrote:<br></div></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div><div class=3D"m_-862766904418843875m_473202723307373014m_433997021415=
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
<br></div></div><span class=3D"m_-862766904418843875m_473202723307373014m_4=
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
</div></div></blockquote></div><br></div>

--089e082450284813890567e9beae--
