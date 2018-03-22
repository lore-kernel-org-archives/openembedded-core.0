Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 07E1471BFC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 07:48:19 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id r197so4672591vke.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Elw+jnvSjdrtr2GgyISpPVMLE3y/FU359P04635lRqs=;
	b=WYNz1LQLiDalF0RlyAxg53KDzRrWYl4PAau+I/aLYTW/69ISr8l84PMFkW4yhxa7Fz
	XYx5ho5avFNXCO3WTWsah9oToB0Bw2ygM6cRb3hTN/wpgqsyiZQX+6gOrwb6fdEDqtN/
	3qI7Q0NQe3+74lYYqmiKz7wMcXPnD2f/q79XzgziucMy/NBfe7VGJNz/h8pq8yiFkpSF
	CCF+D7JKeaCuOO6sUYBp+7PGLRdCtKx/Vf4ul5gLAC/BZIsDJ0t8OVjF/gvXLtei6YPG
	Rbj8qrwZWfeW2yw7a8gC6FrAQUpBt+Dq7lBK9Nh2D7ZMHV0zpqgrOj2icsAOzZUWNpfj
	gSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Elw+jnvSjdrtr2GgyISpPVMLE3y/FU359P04635lRqs=;
	b=FjGrHS/2CD8/gjpLelGPIplbNs7FB6dWc1JZNBs4hCyFHIHE2oCq2qCtGQZqXgTJEY
	mr/aBZB9+MsTbj0DxmBexcqj/J9kNbzAxxRQ1/DoNhKLMEvjwS8UIyJ8Wn+nFQuxniVr
	cfVm3sHFCfwOhXykhrqMJCAR2jfLgcVWPIC1unMnzKfFza+PFt8O/N8ik+gMD07h3zYe
	WB1d+qfZce+LzFG83MVcfHY3g/e8SedQP2+fa8cjxIbGjd3wf73U4pvDj20l/BWvRWiJ
	MzWJlAL3uibopbdkTo643BNVJ3gBSqT5+ymMSfl78ExZZOPq6EAtZnrx0gFt5HuUZwKY
	h9/w==
X-Gm-Message-State: AElRT7GzUC8KsD/zjixu7ks7NUX0k3e7yQ6RvHlRxIdkaKtdG8vkOVVo
	b65dN+7akW8gBahG6u6BMHw+JaoR7K6g+f+/dls=
X-Google-Smtp-Source: AG47ELvojJiyQ4PKtCLuIy7BIiAybOsNPsOi2kwx58ksLXfWqrrsijLPc7EfMzxhX5/QdncxfJV6wVwNknElgulBBqk=
X-Received: by 10.31.198.131 with SMTP id w125mr14960347vkf.158.1521704901038; 
	Thu, 22 Mar 2018 00:48:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Thu, 22 Mar 2018 00:48:20 -0700 (PDT)
In-Reply-To: <CAPGMVzEsGUc8XjKFu-VkE=M7A1NvLABriELEFAFn+A3eOCDTiQ@mail.gmail.com>
References: <CAPGMVzHjT8cpXrDo0JVWph9t+RUSE-b-ZPpi+ZMg8kH1LPq-Zg@mail.gmail.com>
	<CAPGMVzEhY3iagj0z3w=6QXWhMe2o8UXYwhQCUjjFVPodsoFHug@mail.gmail.com>
	<CAB2nKc-kdosjmpEk0cBVP4=B304MZc9sF4D6mY=2j1hUeCFW-A@mail.gmail.com>
	<CAPGMVzEsGUc8XjKFu-VkE=M7A1NvLABriELEFAFn+A3eOCDTiQ@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Thu, 22 Mar 2018 13:18:20 +0530
Message-ID: <CAPGMVzHEDDk4OTY2y4suGD93j6x2GFYeneEU9yL4WC-_RVNn3w@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: QUERY regarding package inclusion - Yocto
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
X-List-Received-Date: Thu, 22 Mar 2018 07:48:20 -0000
Content-Type: multipart/alternative; boundary="001a114db6c21459a70567fb8848"

--001a114db6c21459a70567fb8848
Content-Type: text/plain; charset="UTF-8"

i'd like to know if the recipe named 'tensorrt' in the layer 'meta-tegra'
equivalent to tensorflow? Because i need to install tensorflow packages on
to my yocto image and there are no recipes for it

Rajath C S,
9964182112,
Bangalore - 560060

On Thu, Mar 22, 2018 at 1:16 PM, Rajath C S <rajathcs.1996@gmail.com> wrote:

> Hi Vincent,
>
>
> where should i be adding this line i mean in which file?
> DEPENDS = "python3-numpy python3-dev python3-pip python3-wheel"
>
> Thanks
>
> Rajath C S,
> 9964182112,
> Bangalore - 560060
>
> On Wed, Mar 21, 2018 at 3:24 PM, Vincent Prince <
> vincent.prince.fr@gmail.com> wrote:
>
>> Hi,
>>
>> There is no support for those yet, so you need to create recipes for
>> them.
>>
>> You can use devtool workflow to do so, i suggest you to look at this
>> video
>> https://www.youtube.com/watch?v=CiD7rB35CRE
>>
>> Every recipes are quite different and reflects how you build them by
>> hand.
>>
>> For tensorflow, first step will be
>> devtool add tensorflow https://github.com/tensorflow/tensorflow
>>
>> Then, you need to look at https://www.tensorflow.org/
>> install/install_sources, and translate it into yocto recipe.
>> For instance, it says it depends on several python packages, so in recipe
>> you will probably need to add those with:
>>
>> DEPENDS = "python3-numpy python3-dev python3-pip python3-wheel"
>>
>> You can look at those url too:
>> https://github.com/snipsco/tensorflow-build
>> https://github.com/madisongh/meta-tegra/blob/master/recipes-
>> devtools/gie/tensorrt_2.1-20170614-1-1.bb
>> https://groups.google.com/forum/?utm_medium=email&utm_source
>> =footer#!msg/bazel-discuss/TmBDKmoEvlI/GXng74b_AAAJ
>> https://stackoverflow.com/questions/36545388/use-pip-install
>> -command-in-recipes-yocto-project
>>
>> It's a hard job, and as seems new to Yocto, I suggest you to hire some
>> guy, or at least try to create easier recipes before.
>>
>> Cheers
>>
>>
>>
>> 2018-03-20 5:37 GMT+01:00 Rajath C S <rajathcs.1996@gmail.com>:
>>
>>> Dear Vincent,
>>>
>>> I am working on yocto from few weeks and my current goal is to include
>>> few set of packages.
>>> Initially i thought i will download the repo of those packages and
>>> compile them and copy the compiled binaries to yocto image, apparently
>>> which i dint know how exactly to be done. So, i followed the method of
>>> recipe & layers.
>>>
>>> Now i need to include *'keras'* and* 'tensorflow'* packages in Poky, i
>>> am not able to find any source that helps me do it and i dont know how to
>>> do it from source. Could you please guide me through this (either the
>>> recipe way or compiling from source way is fine)
>>>
>>> Thank You,
>>>
>>> Rajath C S,
>>> 9964182112,
>>> Bangalore - 560060
>>>
>>>
>>>
>>
>

--001a114db6c21459a70567fb8848
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">i&#39;d like to know if the recipe named &#39;tensorrt&#39=
; in the layer=20
&#39;meta-tegra&#39; equivalent to tensorflow? Because i need to install=20
tensorflow packages on to my yocto image and there are no recipes for it<br=
></div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmai=
l_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>=
Rajath C S,<br>9964182112,<br></div></div>Bangalore - 560060<br></div></div=
></div>
<br><div class=3D"gmail_quote">On Thu, Mar 22, 2018 at 1:16 PM, Rajath C S =
<span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=3D"=
_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div>Hi Vincent,<br><br><div><br></div>where=
 should i be adding this line i mean in which file?<span class=3D""><br>DEP=
ENDS =3D &quot;python3-numpy python3-dev python3-pip python3-wheel&quot;<br=
><br></span></div>Thanks<br></div><div class=3D"gmail_extra"><span class=3D=
""><br clear=3D"all"><div><div class=3D"m_-8029520054667909826gmail_signatu=
re" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div>Rajath C =
S,<br>9964182112,<br></div></div>Bangalore - 560060<br></div></div></div>
<br></span><div><div class=3D"h5"><div class=3D"gmail_quote">On Wed, Mar 21=
, 2018 at 3:24 PM, Vincent Prince <span dir=3D"ltr">&lt;<a href=3D"mailto:v=
incent.prince.fr@gmail.com" target=3D"_blank">vincent.prince.fr@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi,=
=C2=A0<div><br></div><div>There is no support for those yet, so you need to=
 create recipes for them.=C2=A0</div><div><br></div><div>You can use devtoo=
l workflow to do so, i suggest you to look at this video=C2=A0</div><div><a=
 href=3D"https://www.youtube.com/watch?v=3DCiD7rB35CRE" target=3D"_blank">h=
ttps://www.youtube.com/watch?<wbr>v=3DCiD7rB35CRE</a></div><div><br></div><=
div>Every recipes are quite different and reflects how you build them by ha=
nd.=C2=A0<br></div><div><br></div><div>For tensorflow, first step will be=
=C2=A0</div><div>devtool add tensorflow <a href=3D"https://github.com/tenso=
rflow/tensorflow" target=3D"_blank">https://github.com/tensorflow/<wbr>tens=
orflow</a><br></div><div><br></div><div>

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:s=
mall;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">Then, you need to look at=C2=A0<a href=3D"https:/=
/www.tensorflow.org/install/install_sources" target=3D"_blank">https://www.=
tensorflow.org/<wbr>install/install_sources</a>, and translate it into yoct=
o recipe.</span>

<br></div><div>For instance, it says it depends on several python packages,=
 so in recipe you will probably need to add those with:</div><div><br></div=
>DEPENDS =3D &quot;python3-numpy python3-dev python3-pip python3-wheel&quot=
;<div><br></div><div>You can look at those url too:</div><div><a href=3D"ht=
tps://github.com/snipsco/tensorflow-build" target=3D"_blank">https://github=
.com/snipsco/ten<wbr>sorflow-build</a></div><div><a href=3D"https://github.=
com/madisongh/meta-tegra/blob/master/recipes-devtools/gie/tensorrt_2.1-2017=
0614-1-1.bb" target=3D"_blank">https://github.com/madisongh/m<wbr>eta-tegra=
/blob/master/recipes-<wbr>devtools/gie/tensorrt_2.1-2017<wbr>0614-1-1.bb</a=
></div><div><a href=3D"https://groups.google.com/forum/?utm_medium=3Demail&=
amp;utm_source=3Dfooter#!msg/bazel-discuss/TmBDKmoEvlI/GXng74b_AAAJ" target=
=3D"_blank">https://groups.google.com/foru<wbr>m/?utm_medium=3Demail&amp;ut=
m_source<wbr>=3Dfooter#!msg/bazel-discuss/TmB<wbr>DKmoEvlI/GXng74b_AAAJ</a>=
<br></div><div><a href=3D"https://stackoverflow.com/questions/36545388/use-=
pip-install-command-in-recipes-yocto-project" target=3D"_blank">https://sta=
ckoverflow.com/ques<wbr>tions/36545388/use-pip-install<wbr>-command-in-reci=
pes-yocto-proj<wbr>ect</a><br></div><div><br></div><div>It&#39;s a hard job=
, and as seems new to Yocto, I suggest you to hire some guy, or at least tr=
y to create easier recipes before.=C2=A0</div><div><br></div><div>Cheers<br=
><div><br></div><div><br></div></div><div><div class=3D"m_-8029520054667909=
826h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-03-20=
 5:37 GMT+01:00 Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs=
.1996@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span>:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div dir=3D"ltr"><div>Dear Vincent,<br><br></div><div>I am working on yo=
cto from few weeks and my current goal is to include few set of packages. <=
br></div><div>Initially
 i thought i will download the repo of those packages and compile them=20
and copy the compiled binaries to yocto image, apparently which i dint=20
know how exactly to be done. So, i followed the method of recipe &amp;=20
layers.<br><br></div><div>Now i need to include <b>&#39;keras&#39;</b> and<=
b> &#39;tensorflow&#39;</b>
 packages in Poky, i am not able to find any source that helps me do it=20
and i dont know how to do it from source. Could you please guide me=20
through this (either the recipe way or compiling from source way is=20
fine) <br><br></div><div>Thank You,<br><br></div><div><div><div><div class=
=3D"m_-8029520054667909826m_420428235224155962m_-7525334218778509529m_-2010=
27261988464234m_4005454784460524205gmail-m_-2512251676014381749gmail-m_6400=
405892118559791gmail_signature"><div dir=3D"ltr"><div><div>Rajath C S,<br>9=
964182112,<br></div></div>Bangalore - 560060</div></div></div></div></div><=
div><div class=3D"m_-8029520054667909826m_420428235224155962m_-752533421877=
8509529m_-201027261988464234m_4005454784460524205gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><br></div></div></div>
</div>
</div><br></div>
</blockquote></div><br></div></div></div></div>
</blockquote></div><br></div></div></div>
</blockquote></div><br></div>

--001a114db6c21459a70567fb8848--
