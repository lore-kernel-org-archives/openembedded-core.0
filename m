Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id A3DCE6FF80
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 18:33:32 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id l21so768249uak.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 11:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oR9U8CDZ/x0LwebROd3/9Y5gWno5qhWnbBEoJISuFmc=;
	b=fBxpftmxSnXteCDJE97gpd8ayQmgJ1lqCLwywZyfE5JMwwpQ6uFqvz/WnIC9WP+xMG
	OYlh1Z3fO3ExRUEC7DzxzrLADyoJKz9V2QC1Emy7HyaVY4bTE0x4Yu5XtV7dpwxq/BG6
	m2jzMG/vKqm7H+jmFJ/sEp/RRhSZd8aPF/C3ozXF/wnzEP5wkMW668yypgmi28KHSLXP
	znRWBqHf/9jQqP01nm4HtOclm4Sz+bFLTWofuGnOUgS0jSBK5DGQSngtYVPYpalFPVzX
	2srYvTYHXKMqot7GPm/RnWTJpBaVmTLtlj/pOjAHhfG4dJxKVFLmtCtWZmhCW0LfNOXE
	YmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oR9U8CDZ/x0LwebROd3/9Y5gWno5qhWnbBEoJISuFmc=;
	b=MLVaQonFPZWWQy+x9v01SBSZI62pDamB4Nxh6VCs9bcGLu8MmXUTyv40B2ZKWNokrG
	hU1WQKXD0/7Tv7wQe2CcLTa0EZlJE79ZLFmNDrMS7at+nt7E/NknnQ2InkZNfmu4Btxu
	Eq6rShYEJTI30CoXHORHfAAgwTgGa9SgM3ZnqPhyuOprrJhw5vVyp8MK4gJV5bJt4t3T
	3B6sIZcuPW3A5YYZ1N8j5v3jMlbgtKT61NYwXJlBpF0ItSktUiPnLQJbYyinVsrteS6z
	0jYY9yATSbeyjHT/lIdBIIKd9aTUWMClLUslRSN3igZF0yDBZY6zc5OIavyBHVDb7GFr
	8Skg==
X-Gm-Message-State: AElRT7E9bnbVQEHycGRixxtPXdJCPBRWQNFa5VfHieEd/pSpN6N4pCAR
	W1aCEhXNPkaoosg1tVFeUBxCGSfDUgZ408EaXWU=
X-Google-Smtp-Source: AG47ELsWzT6QwlZp1izgIsNryu+ZCmF7LisL2Ct94Qi+B/SwkGkHKd23oUKIULFKWrMMf5J2YTbQ6gbUyxnICNYYGws=
X-Received: by 10.176.78.167 with SMTP id l39mr18550108uah.193.1521743613533; 
	Thu, 22 Mar 2018 11:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAPGMVzF+sVEzWbTfuYdKkVHv+ktcUU7Lxdv_2C_ArEBbDiSUsw@mail.gmail.com>
	<CAMKF1sr+NAJEDVProHEExtHZk96Zygbiwq7+5V0wTO6KRB8pMw@mail.gmail.com>
	<CAPGMVzEJq6rdUemqXvDewvBDBSn1Gg7=j-=EdveosFiWgHJPrQ@mail.gmail.com>
	<CAMKF1sr79gKW9ZEYMqjcWC3dTMRe2a-xivzyvG1_wC_uHv5Z9A@mail.gmail.com>
In-Reply-To: <CAMKF1sr79gKW9ZEYMqjcWC3dTMRe2a-xivzyvG1_wC_uHv5Z9A@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Thu, 22 Mar 2018 18:33:22 +0000
Message-ID: <CAPGMVzGE3Hmdjf2-DW1PdCLTcSojhoqdtnmKVp8_4ziD34Et2Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: package inclusion and networking
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
X-List-Received-Date: Thu, 22 Mar 2018 18:33:32 -0000
Content-Type: multipart/alternative; boundary="f403043eee7486228b0568048bfd"

--f403043eee7486228b0568048bfd
Content-Type: text/plain; charset="UTF-8"

Yes I am using Sato only , but I'm not getting how to connect it to WiFi.
Like : I can notice a button on top right but how do i configure it?



On Thu, 22 Mar 2018, 23:43 Khem Raj, <raj.khem@gmail.com> wrote:

> use core-image-sato and it has UI to connect to wifi
>
> On Thu, Mar 22, 2018 at 10:53 AM, Rajath C S <rajathcs.1996@gmail.com>
> wrote:
> > Thanks, I'll check it out.
> >
> > Can you help me setup WiFi connection to poky?
> > Im highly struggling with this, I have placed connman in local.conf file
> ,
> > what next is the procedure such that my poky on qemu can detect the WiFi?
> > Thanks
> >
> > On Thu, 22 Mar 2018, 14:43 Khem Raj, <raj.khem@gmail.com> wrote:
> >>
> >> On Wed, Mar 21, 2018 at 9:58 PM, Rajath C S <rajathcs.1996@gmail.com>
> >> wrote:
> >> > Can i install tensorflow and h5py (since they are not there as
> recipes)
> >> > using Internet on yocto? (just the way they are installed on ubuntu or
> >> > other
> >> > host OS)
> >> >
> >>
> >> may be you can use on device SDK and build it natively on
> >> your target
> >>
> >> EXTRA_IMAGE_FEATURES_append = " tools-sdk"
> >> IMAGE_INSTALL_append = " python coreutils findutils git zlib tar"
> >>
> >> then checkout the sources on target and build it. You might need more
> >> packages then keep adding them to IMAGE_INSTALL and rebuilding image
>

--f403043eee7486228b0568048bfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes I am using Sato only , but I&#39;m not getting how to=
 connect it to WiFi. Like : I can notice a button on top right but how do i=
 configure it?<div dir=3D"auto"><br><div dir=3D"auto"><br></div></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, 22 Mar 2018, 23:43=
 Khem Raj, &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">use core-image-sato and=
 it has UI to connect to wifi<br>
<br>
On Thu, Mar 22, 2018 at 10:53 AM, Rajath C S &lt;<a href=3D"mailto:rajathcs=
.1996@gmail.com" target=3D"_blank" rel=3D"noreferrer">rajathcs.1996@gmail.c=
om</a>&gt; wrote:<br>
&gt; Thanks, I&#39;ll check it out.<br>
&gt;<br>
&gt; Can you help me setup WiFi connection to poky?<br>
&gt; Im highly struggling with this, I have placed connman in local.conf fi=
le ,<br>
&gt; what next is the procedure such that my poky on qemu can detect the Wi=
Fi?<br>
&gt; Thanks<br>
&gt;<br>
&gt; On Thu, 22 Mar 2018, 14:43 Khem Raj, &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Mar 21, 2018 at 9:58 PM, Rajath C S &lt;<a href=3D"mailto:=
rajathcs.1996@gmail.com" target=3D"_blank" rel=3D"noreferrer">rajathcs.1996=
@gmail.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; Can i install tensorflow and h5py (since they are not there a=
s recipes)<br>
&gt;&gt; &gt; using Internet on yocto? (just the way they are installed on =
ubuntu or<br>
&gt;&gt; &gt; other<br>
&gt;&gt; &gt; host OS)<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; may be you can use on device SDK and build it natively on<br>
&gt;&gt; your target<br>
&gt;&gt;<br>
&gt;&gt; EXTRA_IMAGE_FEATURES_append =3D &quot; tools-sdk&quot;<br>
&gt;&gt; IMAGE_INSTALL_append =3D &quot; python coreutils findutils git zli=
b tar&quot;<br>
&gt;&gt;<br>
&gt;&gt; then checkout the sources on target and build it. You might need m=
ore<br>
&gt;&gt; packages then keep adding them to IMAGE_INSTALL and rebuilding ima=
ge<br>
</blockquote></div>

--f403043eee7486228b0568048bfd--
