Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 90D6178960
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 10:25:31 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id l123so2729287vke.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RYGyyTica9XbOIZYeXbCSAPzomUYAav2dsyOC0J8ELw=;
	b=DftgmDGMJmZZNscSgqGxQCvt+9P8K9RKOPaPzMXUzRoz4Bh+kjc8q7gDKAkRR2yv/E
	sI0JEoV0qZlHPfjd5YmZ0nWR8q9JQBlS1mkLrWl/FNd7F58MpBPDMj+eXGQNQGkCT4X1
	1qamDFa7Q/6lIn/HM+PMhEpS7ajvOCg8Zjnis1UvVBKkikjwMC8lq32MXvMCHAXcGeK7
	fpFQEFLKkqeQhLL78b/tYWxgdvegxcAhtmyLSnMogrdCNHhFXDjTkp9v74X9P20ywGIm
	vQyIrK3FyzGu/WGcnE0+kYLolVq4MFXRbDzJ71cx49pzjZ4dfAfDBns1ITCpBq35i384
	JLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RYGyyTica9XbOIZYeXbCSAPzomUYAav2dsyOC0J8ELw=;
	b=g507CGklc+bW8X5dqy1imlN5p4NYVHTsPWXwshs6hk7uqD1Vm/sumucWxapivz3mWo
	+ZctJQxPYnQzaZtjDFI3yXnaT1Zi9UAHcG4RKcWCmohYBTaTKhLO1JnXXasAvXb5RJil
	ShaATA+aKfWVu7lLJA23r6HMeudZ+anwPsK4xleRXsXN7m8nrr6FKuwpbYp+p6NcECaN
	aBhByIZGKEwTG9UF4XJRJnqt3d7/+nn43maHLJiml9VsIXmgE4Luu9Vq/tzl/xsnGa1J
	mxb3tfBDfxfDq+o/nNS65CyfiT9kyj5XY3fT0FrmVIb/L1G2e4ZIKO0ZnADSNIyWaMbK
	TkRA==
X-Gm-Message-State: AElRT7HBhRN8JuDLO1go4k6EU6oR+pe3Y1nDI07WOY2WQUmHOwiHlspf
	h8RcDuRvQ83OMh8FZUuSELCv8Hb/VG9oXCa5dYc=
X-Google-Smtp-Source: AG47ELtqdPyCMBcBzQwbbWI14oLPJlqaiu5IYZfm2jsI1JYizpfmaNdwcwiQSAE6s3CcpEnPtwt6Uw62WsehbIMqz7Y=
X-Received: by 10.31.134.147 with SMTP id i141mr12591807vkd.128.1521627932497; 
	Wed, 21 Mar 2018 03:25:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Wed, 21 Mar 2018 03:25:32 -0700 (PDT)
In-Reply-To: <CAPGMVzEqtt8C0DCR28fMik6c+9jGtM3=uKRbxrMDEv=8CexdiQ@mail.gmail.com>
References: <CAPGMVzEUccZZpxwJpH0akzn7+FyaZf0NbDZoN=73+u8g=yA4Fg@mail.gmail.com>
	<CAJTo0LYGumRqn5=GeB=41abhNn8s6dqoE_d3gMZThwkLor-_zA@mail.gmail.com>
	<CAPGMVzEqtt8C0DCR28fMik6c+9jGtM3=uKRbxrMDEv=8CexdiQ@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Wed, 21 Mar 2018 15:55:32 +0530
Message-ID: <CAPGMVzHyC098J=w5Xbt8z__2-9LVSeBhiJ1U+EHQLiGU1x+huw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-openembeded] bug in adding network layer
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
X-List-Received-Date: Wed, 21 Mar 2018 10:25:31 -0000
Content-Type: multipart/alternative; boundary="001a11411038659e180567e99cf5"

--001a11411038659e180567e99cf5
Content-Type: text/plain; charset="UTF-8"

thanks,

i will follow the said things,

but as of now my situation is as such : "
sure, i will have one other question that is how to establish internet
connection on to poky?
that is , i have placed the meta-networking layer in bblayer.conf file so
after that which recipe should i add to local.conf so that wireless
connection is established on the poky?

Do help with the steps

Thanks"
I will try and implement networking from oe-core


Rajath C S,
9964182112,
Bangalore - 560060

On Wed, Mar 21, 2018 at 3:40 PM, Burton, Ross <ross.burton@intel.com> wrote:

> First, you don't need meta-networking to make networking "work", because
> oe-core has the basics.
>
> Second, you need to match the release of layers.  You're using
> meta-networking master, and a previous release of poky.  Checkout the
> corresponding release branch of meta-networking.
>
> Ross
>
> On 21 March 2018 at 07:29, Rajath C S <rajathcs.1996@gmail.com> wrote:
>
>> I am tryiing to add meta-networking layer (to get Internet connection to
>> poky)and i have included the following line of code in bbconfig file
>> /home/jarvis/poky/meta-openembedded/meta-networking \
>>
>> but while building i get this below error
>>
>>
>> ERROR: ExpansionError during parsing /home/jarvis/poky/meta-openemb
>> edded/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb
>> Traceback (most recent call last):
>> bb.data_smart.ExpansionError: Failure expanding variable do_compile,
>> expression was     python ./buildtools/bin/waf
>> ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
>>  which triggered exception AttributeError: module 'oe.utils' has no
>> attribute 'parallel_make_argument'
>>
>>
>> DO help,
>>
>> is there any other way to establish Internet connection inside poky?
>>
>> Thanks
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>

--001a11411038659e180567e99cf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr"><div><div>=
<div>thanks,<br><br></div>i will follow the said things,<br><br></div>but a=
s of now my situation is as such : &quot;<div><div><div>sure, i will have o=
ne other question that is how to establish internet connection on to poky?<=
br></div>that
 is , i have placed the meta-networking layer in bblayer.conf file so=20
after that which recipe should i add to local.conf so that wireless=20
connection is established on the poky?<br><br></div>Do help with the steps =
<br><br></div>Thanks&quot;<br></div>I will try and implement networking fro=
m oe-core<span class=3D"HOEnZb"><font color=3D"#888888"><br><div><br></div>=
</font></span></div><div class=3D"gmail_extra"><span class=3D"HOEnZb"><font=
 color=3D"#888888"><br clear=3D"all"><div><div class=3D"m_43399702141540508=
37gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div=
><div>Rajath C S,<br>9964182112,<br></div></div>Bangalore - 560060<br></div=
></div></div></font></span><div><div class=3D"h5">
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
e"><div><div class=3D"m_4339970214154050837h5">On 21 March 2018 at 07:29, R=
ajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" =
target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br></div></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div><div class=3D"m_4339970214154050837=
h5"><div dir=3D"ltr"><div>I am tryiing to add meta-networking layer (to get=
 Internet connection to poky)and i have included the following line of code=
 in bbconfig file <br>/home/jarvis/poky/meta-openemb<wbr>edded/meta-network=
ing \<br><br></div>but while building i get this below error<br><br><div><d=
iv><br>ERROR: ExpansionError during parsing /home/jarvis/poky/meta-openemb<=
wbr>edded/meta-networking/recipes-<wbr>support/libtdb/<a href=3D"http://lib=
tdb_1.3.15.bb" target=3D"_blank">libtdb_1.3.15.b<wbr>b</a><br>Traceback (mo=
st recent call last):<br>bb.data_smart.ExpansionError: Failure expanding va=
riable do_compile, expression was=C2=A0=C2=A0=C2=A0=C2=A0 python ./buildtoo=
ls/bin/waf ${@oe.utils.parallel_make_argu<wbr>ment(d, &#39;-j%d&#39;, limit=
=3D64)}<br>=C2=A0which triggered exception AttributeError: module &#39;oe.u=
tils&#39; has no attribute &#39;parallel_make_argument&#39;<br><br><br></di=
v><div>DO help,<br><br></div><div>is there any other way to establish Inter=
net connection inside poky?<br><br></div><div>Thanks<br></div><div><br></di=
v></div></div>
<br></div></div><span class=3D"m_4339970214154050837HOEnZb"><font color=3D"=
#888888">--<br>
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

--001a11411038659e180567e99cf5--
