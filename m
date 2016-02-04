Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5351374197
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 03:46:56 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id e6so28950546vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 19:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZjMexHqo4KO72P3fXKP7r5BKeQESOeOW/XobT0VeSUg=;
	b=IMYXboXzdVoeK1GsizZx1MB/S2aQj1K78wbDJrQCboXDuLuA0sdmVZygHPoTRWbYKy
	a5Ikq1Ixwo/PCNZaZoX5rx6vSeZ7oKy4B2r5AylONZbTAwYWKuacoV1SUfyvMtsWRChW
	+rL1wKEqi0qyCtmzCOFItar7sBmf1l2oSkc8UrqAYhDFcUISdZh5Djp3jzOIHhKo+PVJ
	zZfJ3UuyamGq6rwfDx3CJCTVj6yfFVPj3vcJJa/UoDYiAa8xsQvsCy8cLC+eRC9w+q5P
	BI8Hi6PogERFuQVJhcudhnsisMLVvhsdEdyflNtTkgZlyr19k44J3O+sr5HGOmulJFa1
	xNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ZjMexHqo4KO72P3fXKP7r5BKeQESOeOW/XobT0VeSUg=;
	b=UxobXv6JG6FQJxptBqZpU1poB+333c6S5D3AmmPAe9UIhdUgMuas+CSLKG0LRxBS1k
	4mGibGIZw8I+GJQ+JByVqsknx+wm1upqDcsTRR1a98twjA0ABCaPCZlDInY52csNF3nJ
	V2Y4iGjwt8l2PVO4am1uhkVsMk+Tg5eSAN5NNpYxvd0uVgx1sT/QouetBqXG2gi5pNR0
	lw7qHqQqanr4tr1I0NtIGtuI67aUyCzPnAeTGpT0dGYlcecHqJObjsmdIxuWrEh5MOhO
	kjOd1nCId7RK7e34JBorf7be7YoU2HPX0jleF4yyQX3+J10sutNTGqiVEvQJz4MO1tnL
	cnZA==
X-Gm-Message-State: AG10YOT34eHudPftxIiane3A7CgAfsUXNu3G5TNj6R6THoB+UnuZeFZ8a3Cw6KrfNonGP/203vOkLVEfqdKF2Q==
MIME-Version: 1.0
X-Received: by 10.31.47.88 with SMTP id v85mr3944865vkv.118.1454557617335;
	Wed, 03 Feb 2016 19:46:57 -0800 (PST)
Received: by 10.103.82.152 with HTTP; Wed, 3 Feb 2016 19:46:57 -0800 (PST)
Received: by 10.103.82.152 with HTTP; Wed, 3 Feb 2016 19:46:57 -0800 (PST)
In-Reply-To: <56B2C5D5.9040502@gmail.com>
References: <56B25500.7030402@gmail.com>
	<34309FCD-61ED-4DC8-BD3C-219DE8924BDA@gmail.com>
	<1478930.Uaq5cohNMu@peggleto-mobl.ger.corp.intel.com>
	<56E071BC-9E02-44DD-8236-9697A647F8F7@gmail.com>
	<CA+chaQd2Cdzpo0_LP2mJUoYe8UtwmOK3DCpE-yXk_s80t41QSA@mail.gmail.com>
	<56B2C02C.90607@gmail.com>
	<1F06A159-1BC5-4008-92D0-B7939CE41A17@gmail.com>
	<56B2C5D5.9040502@gmail.com>
Date: Wed, 3 Feb 2016 21:46:57 -0600
Message-ID: <CACS+7ZQKBM=A=Js+KNaoh1SQRLyaHhRab0qpzCe=_hWMj7mk7Q@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: binutils upgrade to 2.26 failure - unsupported reloc 42 against global symbol __gmon_start__
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
X-List-Received-Date: Thu, 04 Feb 2016 03:46:57 -0000
Content-Type: multipart/alternative; boundary=001a114408461634fd052ae9963c

--001a114408461634fd052ae9963c
Content-Type: text/plain; charset=UTF-8

On 3 Feb 2016 7:30 p.m., "Trevor Woerner" <twoerner@gmail.com> wrote:
>
> On 02/03/16 22:08, Khem Raj wrote:
>>
>>
>>> On Feb 3, 2016, at 7:06 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>>>
>>> On 02/03/16 15:32, Martin Jansa wrote:
>>>>
>>>> This could be caused by chromium using own bundled binutils where the
version doesn't match, I've solved it in our recipe by:
>>>> +GYP_DEFINES_append = " linux_use_bundled_gold=0"
>>>> +GYP_DEFINES_append = " linux_use_bundled_binutils=0"
>>>
>>>
>>> w00t!! awesome. works for me :-)
>>>
>>> So it looks like we both have working chromium recipes, yet the
upstream one doesn't work. What version are you building? For what arch
(which archs)? x11/wayland?
>>
>>
>> please submit your patch for meta-browser
>
>
> Any patch I submit is guaranteed to be rejected. It only supports x11 and
has only been tested on x86_64. If nothing else it would have to be named
chromium-x11_<version>.bb, or something like that. I've actually removed
the wayland/ozone stuff from my recipe.
>
> Considering each build of chromium takes me 2.5 hours (just for chromium
alone!) it makes it hard to care about environments I'm not using.
>
> The only way chromium builds for wayland is when another project (ozone)
is added to the mix. But, in my tests so far, not every release of chromium
builds successfully with every version of ozone. So although building for
x11 is easy and works for just about each release, building for wayland is
much more hit-and-miss (and has less chance of success).
>
>
>>>
>>> I have a working recipe for 50.0.2636.0, but I'm only interested in
x86_64 and x11. wayland+ozone is a whole other mess ;-)
>>>
>>> At some point it'll probably be easier if we build chromium with
llvm-clang, the same as google is doing. Is that possible?
>>
>>
>> you can try using meta-clang
>
>
> Okay. So if I have an image and everything in that image is built with
gcc except for chromium, meta-clang will know what it needs to add to the
image so that one clang-built package can run?
>

Clang built packages and GCC built packages should have the same run time
dependencies. You'd have to go out of your way to build against LLVM's
unwinder or c++ runtime.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a114408461634fd052ae9963c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 3 Feb 2016 7:30 p.m., &quot;Trevor Woerner&quot; &lt;<a href=3D"mailto:t=
woerner@gmail.com">twoerner@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 02/03/16 22:08, Khem Raj wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; On Feb 3, 2016, at 7:06 PM, Trevor Woerner &lt;<a href=3D"mail=
to:twoerner@gmail.com">twoerner@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 02/03/16 15:32, Martin Jansa wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; This could be caused by chromium using own bundled binutil=
s where the version doesn&#39;t match, I&#39;ve solved it in our recipe by:=
<br>
&gt;&gt;&gt;&gt; +GYP_DEFINES_append =3D &quot; linux_use_bundled_gold=3D0&=
quot;<br>
&gt;&gt;&gt;&gt; +GYP_DEFINES_append =3D &quot; linux_use_bundled_binutils=
=3D0&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; w00t!! awesome. works for me :-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; So it looks like we both have working chromium recipes, yet th=
e upstream one doesn&#39;t work. What version are you building? For what ar=
ch (which archs)? x11/wayland?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; please submit your patch for meta-browser<br>
&gt;<br>
&gt;<br>
&gt; Any patch I submit is guaranteed to be rejected. It only supports x11 =
and has only been tested on x86_64. If nothing else it would have to be nam=
ed chromium-x11_&lt;version&gt;.bb, or something like that. I&#39;ve actual=
ly removed the wayland/ozone stuff from my recipe.<br>
&gt;<br>
&gt; Considering each build of chromium takes me 2.5 hours (just for chromi=
um alone!) it makes it hard to care about environments I&#39;m not using.<b=
r>
&gt;<br>
&gt; The only way chromium builds for wayland is when another project (ozon=
e) is added to the mix. But, in my tests so far, not every release of chrom=
ium builds successfully with every version of ozone. So although building f=
or x11 is easy and works for just about each release, building for wayland =
is much more hit-and-miss (and has less chance of success).<br>
&gt;<br>
&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I have a working recipe for 50.0.2636.0, but I&#39;m only inte=
rested in x86_64 and x11. wayland+ozone is a whole other mess ;-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; At some point it&#39;ll probably be easier if we build chromiu=
m with llvm-clang, the same as google is doing. Is that possible?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; you can try using meta-clang<br>
&gt;<br>
&gt;<br>
&gt; Okay. So if I have an image and everything in that image is built with=
 gcc except for chromium, meta-clang will know what it needs to add to the =
image so that one clang-built package can run?<br>
&gt;</p>
<p dir=3D"ltr">Clang built packages and GCC built packages should have the =
same run time dependencies. You&#39;d have to go out of your way to build a=
gainst LLVM&#39;s unwinder or c++ runtime.<br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a114408461634fd052ae9963c--
