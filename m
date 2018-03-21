Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC8C78954
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 10:41:34 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id v13so6045843iob.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rBQUb8akLl4DeVpRjSWiz1ZkTCHgYN9OdGBFUrkKPUc=;
	b=bcLy5iyWhCO7degfSpPAhb/C1mmdFDlwcC7rES45j4oZ6bW5WyZU530TQjSov1WoTs
	RRJJbPnoPMQQzAaYS9FCWKXVFG6F8h7nYEKWiP6CUD6goEXK1Aio4aXNxyN9b6GniTgK
	gT0Y6eQfVkZgwfkEp4lb4HSamyFJykf6aoSCAGRVOj+sYhPT6c1wnap5UCV8i9h+l8sx
	8sbAWOsCCjqhLo+Ndp3UO0oViDNn5oMitC50JAhuWd/gIjEAAM37BCtgQ4qdn4q2FvAr
	1ZH3JcaOUlFuvt911U37CXrEfdYnXfsGnHiI1+iEUyhAAGKclSkBf3T2nIoAz/DEPiYr
	sAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rBQUb8akLl4DeVpRjSWiz1ZkTCHgYN9OdGBFUrkKPUc=;
	b=RcB2tPxo3loKUgeP57sKgV5E34MRPhGcAcfTMQFcFuyUU3fSA8jtZWbcU7X9PlFf/u
	O6Qca1ZIMtj2oYmfIvNCMQ5rUJ37MlsFWUcT/UIYZwo3P1R9IgFVzuvdK8BYruuw+8CI
	SbogiTDzfnZ5gtRgev2dP60LgmwrUSduArzW4XhCRyc3Iva3C//zLvCdDfY4e8bJWhEb
	g6n32P8pGChKKzEFNu6uBUzsJnydxC7Ddm2l/0wfXQEJOA60K892BelKSr63m0JSN2XF
	5ctqxggBvMGDVerz/aLteByXXLsGjo0KUXGEtdtz9BzRJKaEcq7Ob9gsBmzOXQVSp9Oo
	6IRA==
X-Gm-Message-State: AElRT7GKEnkNg4nmtroAo0PB34AW1MHbOBSimHYoY1FpUWESx5yb3Loo
	xR7DOTEGe3z5pe+mQgI3snMGK4SwTgQ+fEB0XtXvVw==
X-Google-Smtp-Source: AG47ELuum0+SRr69tBLy8Y6i3l0CutMIUH7br4hQuD54CvTz6lLeweg9ovMbjg3ftR05GjKAPyXXmUlBXi4VfGT28Sw=
X-Received: by 10.107.6.231 with SMTP id f100mr20907149ioi.23.1521628896349;
	Wed, 21 Mar 2018 03:41:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 21 Mar 2018 03:41:15 -0700 (PDT)
In-Reply-To: <CAPGMVzHgcsNe9mjrTvGTyBztX-TKuip1Tx4+HDOk7UP-H9mwxA@mail.gmail.com>
References: <CAPGMVzEUccZZpxwJpH0akzn7+FyaZf0NbDZoN=73+u8g=yA4Fg@mail.gmail.com>
	<CAJTo0LYGumRqn5=GeB=41abhNn8s6dqoE_d3gMZThwkLor-_zA@mail.gmail.com>
	<CAPGMVzEqtt8C0DCR28fMik6c+9jGtM3=uKRbxrMDEv=8CexdiQ@mail.gmail.com>
	<CAPGMVzHyC098J=w5Xbt8z__2-9LVSeBhiJ1U+EHQLiGU1x+huw@mail.gmail.com>
	<CAJTo0LZ49vPGn8rWMSj607aQZP8HQLMb4o9cq3yvTAEk57ecaA@mail.gmail.com>
	<CAPGMVzHgcsNe9mjrTvGTyBztX-TKuip1Tx4+HDOk7UP-H9mwxA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Mar 2018 10:41:15 +0000
Message-ID: <CAJTo0LYbWfqRe4hE3279Wmpy-5dSCNfXeT9VwFvp_qHtS+BcHQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 21 Mar 2018 10:41:35 -0000
Content-Type: multipart/alternative; boundary="001a113f9be4d8d9760567e9d568"

--001a113f9be4d8d9760567e9d568
Content-Type: text/plain; charset="UTF-8"

Ideally in an image of your own creation, as local.conf tweaking is for
experimentation only.

There's a section in the manual about customising images, and I recommend
that you start from an image with functionality instead of starting from a
minimal image and trying to discover how to do basics such as make
networking functional.

Ross

On 21 March 2018 at 10:35, Rajath C S <rajathcs.1996@gmail.com> wrote:

> so the  connman / ifupdown and wireless-tools have to be placed in the
> local.conf file right?
>
> Rajath C S,
> 9964182112,
> Bangalore - 560060
>
> On Wed, Mar 21, 2018 at 3:57 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>> ifupdown and wireless-tools will give you the basics to configure it by
>> hand, or use connman.  Or network-manager, in meta-oe.
>>
>> core-image-sato includes both connman and a UI to join to wifi.
>>
>> Ross
>>
>> On 21 March 2018 at 10:25, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>
>>>
>>> thanks,
>>>
>>> i will follow the said things,
>>>
>>> but as of now my situation is as such : "
>>> sure, i will have one other question that is how to establish internet
>>> connection on to poky?
>>> that is , i have placed the meta-networking layer in bblayer.conf file
>>> so after that which recipe should i add to local.conf so that wireless
>>> connection is established on the poky?
>>>
>>> Do help with the steps
>>>
>>> Thanks"
>>> I will try and implement networking from oe-core
>>>
>>>
>>> Rajath C S,
>>> 9964182112,
>>> Bangalore - 560060
>>>
>>> On Wed, Mar 21, 2018 at 3:40 PM, Burton, Ross <ross.burton@intel.com>
>>> wrote:
>>>
>>>> First, you don't need meta-networking to make networking "work",
>>>> because oe-core has the basics.
>>>>
>>>> Second, you need to match the release of layers.  You're using
>>>> meta-networking master, and a previous release of poky.  Checkout the
>>>> corresponding release branch of meta-networking.
>>>>
>>>> Ross
>>>>
>>>> On 21 March 2018 at 07:29, Rajath C S <rajathcs.1996@gmail.com> wrote:
>>>>
>>>>> I am tryiing to add meta-networking layer (to get Internet connection
>>>>> to poky)and i have included the following line of code in bbconfig file
>>>>> /home/jarvis/poky/meta-openembedded/meta-networking \
>>>>>
>>>>> but while building i get this below error
>>>>>
>>>>>
>>>>> ERROR: ExpansionError during parsing /home/jarvis/poky/meta-openemb
>>>>> edded/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb
>>>>> Traceback (most recent call last):
>>>>> bb.data_smart.ExpansionError: Failure expanding variable do_compile,
>>>>> expression was     python ./buildtools/bin/waf
>>>>> ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
>>>>>  which triggered exception AttributeError: module 'oe.utils' has no
>>>>> attribute 'parallel_make_argument'
>>>>>
>>>>>
>>>>> DO help,
>>>>>
>>>>> is there any other way to establish Internet connection inside poky?
>>>>>
>>>>> Thanks
>>>>>
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>
>>>>>
>>>>
>>>
>>>
>>
>

--001a113f9be4d8d9760567e9d568
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ideally in an image of your own creation, as local.conf tw=
eaking is for experimentation only.<div><br></div><div>There&#39;s a sectio=
n in the manual about customising images, and I recommend that you start fr=
om an image with functionality instead of starting from a minimal image and=
 trying to discover how to do basics such as make networking functional.</d=
iv><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On 21 March 2018 at 10:35, Rajath C S <span dir=3D"lt=
r">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">rajathc=
s.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv dir=3D"ltr">so the=C2=A0 connman / ifupdown and wireless-tools have to b=
e placed in the local.conf file right?<br></div><div class=3D"gmail_extra">=
<span class=3D""><br clear=3D"all"><div><div class=3D"m_7549818448200897835=
gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><=
div>Rajath C S,<br>9964182112,<br></div></div>Bangalore - 560060<br></div><=
/div></div>
<br></span><div><div class=3D"h5"><div class=3D"gmail_quote">On Wed, Mar 21=
, 2018 at 3:57 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ros=
s.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">ifupdown and wire=
less-tools will give you the basics to configure it by hand, or use connman=
.=C2=A0 Or network-manager, in meta-oe.<div><br></div><div>core-image-sato =
includes both connman and a UI to join to wifi.</div><span class=3D"m_75498=
18448200897835HOEnZb"><font color=3D"#888888"><div><br></div><div>Ross</div=
></font></span></div><div class=3D"m_7549818448200897835HOEnZb"><div class=
=3D"m_7549818448200897835h5"><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On 21 March 2018 at 10:25, Rajath C S <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=
=3D"m_7549818448200897835m_-862766904418843875HOEnZb"><div class=3D"m_75498=
18448200897835m_-862766904418843875h5"><div dir=3D"ltr"><br><div class=3D"g=
mail_quote"><div dir=3D"ltr"><div><div><div>thanks,<br><br></div>i will fol=
low the said things,<br><br></div>but as of now my situation is as such : &=
quot;<div><div><div>sure, i will have one other question that is how to est=
ablish internet connection on to poky?<br></div>that
 is , i have placed the meta-networking layer in bblayer.conf file so=20
after that which recipe should i add to local.conf so that wireless=20
connection is established on the poky?<br><br></div>Do help with the steps =
<br><br></div>Thanks&quot;<br></div>I will try and implement networking fro=
m oe-core<span class=3D"m_7549818448200897835m_-862766904418843875m_4732027=
23307373014HOEnZb"><font color=3D"#888888"><br><div><br></div></font></span=
></div><div class=3D"gmail_extra"><span class=3D"m_7549818448200897835m_-86=
2766904418843875m_473202723307373014HOEnZb"><font color=3D"#888888"><br cle=
ar=3D"all"><div><div class=3D"m_7549818448200897835m_-862766904418843875m_4=
73202723307373014m_4339970214154050837gmail_signature" data-smartmail=3D"gm=
ail_signature"><div dir=3D"ltr"><div><div>Rajath C S,<br>9964182112,<br></d=
iv></div>Bangalore - 560060<br></div></div></div></font></span><div><div cl=
ass=3D"m_7549818448200897835m_-862766904418843875m_473202723307373014h5">
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
e"><div><div class=3D"m_7549818448200897835m_-862766904418843875m_473202723=
307373014m_4339970214154050837h5">On 21 March 2018 at 07:29, Rajath C S <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"_bl=
ank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br></div></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div><div class=3D"m_7549818448200897835m_-8627669044=
18843875m_473202723307373014m_4339970214154050837h5"><div dir=3D"ltr"><div>=
I am tryiing to add meta-networking layer (to get Internet connection to po=
ky)and i have included the following line of code in bbconfig file <br>/hom=
e/jarvis/poky/meta-openemb<wbr>edded/meta-networking \<br><br></div>but whi=
le building i get this below error<br><br><div><div><br>ERROR: ExpansionErr=
or during parsing /home/jarvis/poky/meta-openemb<wbr>edded/meta-networking/=
recipes-<wbr>support/libtdb/<a href=3D"http://libtdb_1.3.15.bb" target=3D"_=
blank">libtdb_1.3.15.b<wbr>b</a><br>Traceback (most recent call last):<br>b=
b.data_smart.ExpansionError: Failure expanding variable do_compile, express=
ion was=C2=A0=C2=A0=C2=A0=C2=A0 python ./buildtools/bin/waf ${@oe.utils.par=
allel_make_argu<wbr>ment(d, &#39;-j%d&#39;, limit=3D64)}<br>=C2=A0which tri=
ggered exception AttributeError: module &#39;oe.utils&#39; has no attribute=
 &#39;parallel_make_argument&#39;<br><br><br></div><div>DO help,<br><br></d=
iv><div>is there any other way to establish Internet connection inside poky=
?<br><br></div><div>Thanks<br></div><div><br></div></div></div>
<br></div></div><span class=3D"m_7549818448200897835m_-862766904418843875m_=
473202723307373014m_4339970214154050837HOEnZb"><font color=3D"#888888">--<b=
r>
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

--001a113f9be4d8d9760567e9d568--
