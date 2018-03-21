Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8FA7895E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 10:27:22 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id v13so5999352iob.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e33wibWUrcJqfNGomMp1w9DhuvRKTLZ3lHHv9xQlZwA=;
	b=R51k9HFjJGrwD7j37jCSzYiYdSJtuZ7E/ooAsBxrMJh3dNTfNjzPpRpbNWYS68crVi
	7rsP4wV/75QWaYO0GlYNHSIMEKP6+k0WAkofPSUMUca77zyjz3l4wv7edH81oNKZrrFx
	YApnJ//ZXJbScDRsYo8VASEzZc9gQqWoopS4C6Fx004ZlrrJqJXlHG54CLMeW5CpFMXk
	ikBToEn8B89Oy+DupOO9UqurD8InW8iHl8ClqETGKrJ1btPOSdn+G2p96X9iTZooVbK9
	URurcE990UXrXjiTRSS060GjAY0gGZxUevg/DKJj4jg+rVzhQMiuGSVWT2ulM+Q5RR3f
	0Q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e33wibWUrcJqfNGomMp1w9DhuvRKTLZ3lHHv9xQlZwA=;
	b=k188ziz2N//AqRseeed0gN9hTA0P3Q4cukqOyIVOTAA7ZRFIf4bYMWvGvkKwscsleS
	+A0eTQ5VlVxgISHQghB7lbc+6PJQA/tTKm7eVdCSLjL6X85mZygXCf1UBFBLM0BdnSin
	Cald3QUI8Z13W87OnKhklgZVORCtA0hn6IiR/sh2YjBE/5tJqylNG9OPVPlFXXQqooKf
	5iMnLGtKuUUWZ2Aqq4qno63ECo13FbUgE1YN2rMfIq4g8gfRu2SXxMskH+tgzO4h3Esm
	KJFf/OpkzmsAiTFtSSIkLQvcywejF1YV1pdtjVrzqqvf7qbi6vHB192VuBUZ41imEOci
	cmtQ==
X-Gm-Message-State: AElRT7HUKqdiDYXC/h5KaJavgozCre7pQjU4JLbvxDjXgvusjGfTnaYr
	NuwE+d8Ahjz5ZJYEOXtBupoHbOG7ygrlgX1abngH9Q==
X-Google-Smtp-Source: AG47ELtdpCv+bSxuqr1WIA0Jg9iRxEY6fe8qrajWF6UfwUECLO7KdQa1WBq5uMMmvCJ92WUuzK/g9gRCOnnHeaO6pc8=
X-Received: by 10.107.6.231 with SMTP id f100mr20855927ioi.23.1521628044148;
	Wed, 21 Mar 2018 03:27:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 21 Mar 2018 03:27:03 -0700 (PDT)
In-Reply-To: <CAPGMVzHyC098J=w5Xbt8z__2-9LVSeBhiJ1U+EHQLiGU1x+huw@mail.gmail.com>
References: <CAPGMVzEUccZZpxwJpH0akzn7+FyaZf0NbDZoN=73+u8g=yA4Fg@mail.gmail.com>
	<CAJTo0LYGumRqn5=GeB=41abhNn8s6dqoE_d3gMZThwkLor-_zA@mail.gmail.com>
	<CAPGMVzEqtt8C0DCR28fMik6c+9jGtM3=uKRbxrMDEv=8CexdiQ@mail.gmail.com>
	<CAPGMVzHyC098J=w5Xbt8z__2-9LVSeBhiJ1U+EHQLiGU1x+huw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Mar 2018 10:27:03 +0000
Message-ID: <CAJTo0LZ49vPGn8rWMSj607aQZP8HQLMb4o9cq3yvTAEk57ecaA@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Mar 2018 10:27:23 -0000
Content-Type: multipart/alternative; boundary="001a113f9be40d61e00567e9a323"

--001a113f9be40d61e00567e9a323
Content-Type: text/plain; charset="UTF-8"

ifupdown and wireless-tools will give you the basics to configure it by
hand, or use connman.  Or network-manager, in meta-oe.

core-image-sato includes both connman and a UI to join to wifi.

Ross

On 21 March 2018 at 10:25, Rajath C S <rajathcs.1996@gmail.com> wrote:

>
> thanks,
>
> i will follow the said things,
>
> but as of now my situation is as such : "
> sure, i will have one other question that is how to establish internet
> connection on to poky?
> that is , i have placed the meta-networking layer in bblayer.conf file so
> after that which recipe should i add to local.conf so that wireless
> connection is established on the poky?
>
> Do help with the steps
>
> Thanks"
> I will try and implement networking from oe-core
>
>
> Rajath C S,
> 9964182112,
> Bangalore - 560060
>
> On Wed, Mar 21, 2018 at 3:40 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>> First, you don't need meta-networking to make networking "work", because
>> oe-core has the basics.
>>
>> Second, you need to match the release of layers.  You're using
>> meta-networking master, and a previous release of poky.  Checkout the
>> corresponding release branch of meta-networking.
>>
>> Ross
>>
>> On 21 March 2018 at 07:29, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>
>>> I am tryiing to add meta-networking layer (to get Internet connection to
>>> poky)and i have included the following line of code in bbconfig file
>>> /home/jarvis/poky/meta-openembedded/meta-networking \
>>>
>>> but while building i get this below error
>>>
>>>
>>> ERROR: ExpansionError during parsing /home/jarvis/poky/meta-openemb
>>> edded/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb
>>> Traceback (most recent call last):
>>> bb.data_smart.ExpansionError: Failure expanding variable do_compile,
>>> expression was     python ./buildtools/bin/waf
>>> ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
>>>  which triggered exception AttributeError: module 'oe.utils' has no
>>> attribute 'parallel_make_argument'
>>>
>>>
>>> DO help,
>>>
>>> is there any other way to establish Internet connection inside poky?
>>>
>>> Thanks
>>>
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>
>
>

--001a113f9be40d61e00567e9a323
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ifupdown and wireless-tools will give you the basics to co=
nfigure it by hand, or use connman.=C2=A0 Or network-manager, in meta-oe.<d=
iv><br></div><div>core-image-sato includes both connman and a UI to join to=
 wifi.</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">On 21 March 2018 at 10:25, Rajath C S <span =
dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank=
">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><div dir=3D"ltr"><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr"><div><div><div>thanks,<br><br></div>i =
will follow the said things,<br><br></div>but as of now my situation is as =
such : &quot;<div><div><div>sure, i will have one other question that is ho=
w to establish internet connection on to poky?<br></div>that
 is , i have placed the meta-networking layer in bblayer.conf file so=20
after that which recipe should i add to local.conf so that wireless=20
connection is established on the poky?<br><br></div>Do help with the steps =
<br><br></div>Thanks&quot;<br></div>I will try and implement networking fro=
m oe-core<span class=3D"m_473202723307373014HOEnZb"><font color=3D"#888888"=
><br><div><br></div></font></span></div><div class=3D"gmail_extra"><span cl=
ass=3D"m_473202723307373014HOEnZb"><font color=3D"#888888"><br clear=3D"all=
"><div><div class=3D"m_473202723307373014m_4339970214154050837gmail_signatu=
re" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>Rajath C =
S,<br>9964182112,<br></div></div>Bangalore - 560060<br></div></div></div></=
font></span><div><div class=3D"m_473202723307373014h5">
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
e"><div><div class=3D"m_473202723307373014m_4339970214154050837h5">On 21 Ma=
rch 2018 at 07:29, Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajat=
hcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span=
> wrote:<br></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"m=
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
<br></div></div><span class=3D"m_473202723307373014m_4339970214154050837HOE=
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

--001a113f9be40d61e00567e9a323--
