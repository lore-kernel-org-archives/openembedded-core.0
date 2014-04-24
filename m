Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id E201165D0A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 16:32:48 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id s7so1260011qap.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 09:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=r91hABbKR5/0UtVyPFY4JYr7cekKcLBLmHjNNxqgTsg=;
	b=KiaB3EifjRQ0x7IuOup2lWvvFirc/rkCygIGJjuTcuQT+AYLZXggN9HsKlfLKjeaod
	+8iqiJJAIxQk0PpyQtgXUx6a7RL3/sfpSwJ8nW8fIfVEoAg67e+5ePy+pj4B0xmWSob2
	jc29HidD83TKVgzSx7d2VHfMdMXMcgXjIWGE6DIjwoCYS5dhXWrXLpDPmYY0o7KC7f4K
	O8enZ7tIBxABKfiN8DBVLzZYaJ99FQJGGp5jpGZ2IHlPsh3trFvUaMwb+tQcwnwWzQ24
	yoTJ+Q9G9Er3lCjJmsK/4JqDxf6CCJZyqNyrgQCRJqlSx2FvOGfMLzeV+TqoRldC/MoF
	+h9g==
MIME-Version: 1.0
X-Received: by 10.140.81.197 with SMTP id f63mr4009177qgd.114.1398357169113;
	Thu, 24 Apr 2014 09:32:49 -0700 (PDT)
Received: by 10.96.148.2 with HTTP; Thu, 24 Apr 2014 09:32:49 -0700 (PDT)
In-Reply-To: <CAMKF1soB12wsTJ_V0+9Fq8FWX8=HWEv9iANmBvBOb4=kiKv4mQ@mail.gmail.com>
References: <CACS+7ZR=mA9+=NzxF=XLXvxxgypsjzcftZQ0UVWG-0rBLk202A@mail.gmail.com>
	<5357EBAE.6040408@linux.intel.com>
	<CACS+7ZQOx4JqsRERztKBgFrNZTkQmdG0CoGN0DbdxZxWy75NDg@mail.gmail.com>
	<CAMKF1soB12wsTJ_V0+9Fq8FWX8=HWEv9iANmBvBOb4=kiKv4mQ@mail.gmail.com>
Date: Thu, 24 Apr 2014 10:32:49 -0600
Message-ID: <CACS+7ZTnASgh688cjGJ_g4rb_Ls7Ymbq4KWXUib=ppYwrouDwQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: fix tests when not using gold
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
X-List-Received-Date: Thu, 24 Apr 2014 16:32:53 -0000
Content-Type: multipart/alternative; boundary=001a11c129be55b32f04f7cc668f

--001a11c129be55b32f04f7cc668f
Content-Type: text/plain; charset=UTF-8

On 23 April 2014 20:37, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Apr 23, 2014 at 9:43 AM, Dan McGregor <danismostlikely@gmail.com>
> wrote:
> > On 23 April 2014 10:34, Saul Wold <sgw@linux.intel.com> wrote:
> >>
> >> On 04/23/2014 08:01 AM, Dan McGregor wrote:
> >>>
> >>> From: Dan McGregor <dan.mcgregor@usask.ca>
> >>>
> >>> Explicitly mark the dummy function as externally visible
> >>> so that ld can find the symbol at link time. This is needed
> >>> when the DISTRO_FEATURE ld-is-gold is not enabled; systemd
> >>> uses -flto anyway.
> >>>
> >>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> >>> ---
> >>>   meta/recipes-core/systemd/systemd/systemd-lto-fix.patch | 14
> >>> ++++++++++++++
> >>>   meta/recipes-core/systemd/systemd_211.bb                |  1 +
> >>>   2 files changed, 15 insertions(+)
> >>>   create mode 100644
> >>> meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
> >>>
> >>> diff --git a/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
> >>> b/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
> >>> new file mode 100644
> >>> index 0000000..90875e4
> >>> --- /dev/null
> >>> +++ b/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch
> >>
> >>
> >> The patch also needs an appropriate Upstream-Status and Signed-off-by
> tags
> >> here.
> >>
> >> Thanks
> >>         Sau!
> >>
> >
> > As I said to Ross off-list (accidentally), this patch was for Linaro GCC
> as
> > of 2014-03-20. I'm going to check that it's still vald, and if so I'll
> send
> > it upstream too.
>
> FWIW, I have updated the systemd recipe to 212+ its here
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/musl&id=f4283b924c13ea4d98b4251e11dd6a3388f195d5
>
> can you check if this patch is still needed there ? I use gold/arm and
> did not run into this issue.
>
>
I'll take a look at soon, I switched to gold because of this issue, so a
systemd build may take some time. I'll let you know when I'm done.


> >
> > Thanks,
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--001a11c129be55b32f04f7cc668f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
3 April 2014 20:37, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On Wed, Apr 23, 2014 at 9:43 AM, Da=
n McGregor &lt;<a href=3D"mailto:danismostlikely@gmail.com">danismostlikely=
@gmail.com</a>&gt; wrote:<br>
&gt; On 23 April 2014 10:34, Saul Wold &lt;<a href=3D"mailto:sgw@linux.inte=
l.com">sgw@linux.intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 04/23/2014 08:01 AM, Dan McGregor wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; From: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@usask.ca=
">dan.mcgregor@usask.ca</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Explicitly mark the dummy function as externally visible<br>
&gt;&gt;&gt; so that ld can find the symbol at link time. This is needed<br=
>
&gt;&gt;&gt; when the DISTRO_FEATURE ld-is-gold is not enabled; systemd<br>
&gt;&gt;&gt; uses -flto anyway.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor=
@usask.ca">dan.mcgregor@usask.ca</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; =C2=A0 meta/recipes-core/systemd/systemd/systemd-lto-fix.patch=
 | 14<br>
&gt;&gt;&gt; ++++++++++++++<br>
&gt;&gt;&gt; =C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_211=
.bb" target=3D"_blank">systemd_211.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A01 +<br>
&gt;&gt;&gt; =C2=A0 2 files changed, 15 insertions(+)<br>
&gt;&gt;&gt; =C2=A0 create mode 100644<br>
&gt;&gt;&gt; meta/recipes-core/systemd/systemd/systemd-lto-fix.patch<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta/recipes-core/systemd/systemd/systemd-lto-fix=
.patch<br>
&gt;&gt;&gt; b/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 0000000..90875e4<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/meta/recipes-core/systemd/systemd/systemd-lto-fix.patch<=
br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; The patch also needs an appropriate Upstream-Status and Signed-off=
-by tags<br>
&gt;&gt; here.<br>
&gt;&gt;<br>
&gt;&gt; Thanks<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 Sau!<br>
&gt;&gt;<br>
&gt;<br>
&gt; As I said to Ross off-list (accidentally), this patch was for Linaro G=
CC as<br>
&gt; of 2014-03-20. I&#39;m going to check that it&#39;s still vald, and if=
 so I&#39;ll send<br>
&gt; it upstream too.<br>
<br>
</div></div>FWIW, I have updated the systemd recipe to 212+ its here<br>
<a href=3D"http://git.openembedded.org/openembedded-core-contrib/commit/?h=
=3Dkraj/musl&amp;id=3Df4283b924c13ea4d98b4251e11dd6a3388f195d5" target=3D"_=
blank">http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkr=
aj/musl&amp;id=3Df4283b924c13ea4d98b4251e11dd6a3388f195d5</a><br>

<br>
can you check if this patch is still needed there ? I use gold/arm and<br>
did not run into this issue.<br>
<br></blockquote><div><br></div><div>I&#39;ll take a look at soon, I switch=
ed to gold because of this issue, so a systemd build may take some time. I&=
#39;ll let you know when I&#39;m done.<br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">

&gt;<br>
&gt; Thanks,<br>
<span class=3D"HOEnZb"><font color=3D"#888888">&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core</a><br>
&gt;<br>
</font></span></blockquote></div><br></div></div>

--001a11c129be55b32f04f7cc668f--
