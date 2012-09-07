Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1T9uP1-00050C-3U
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 10:59:03 +0200
Received: by obblz20 with SMTP id lz20so4431631obb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2012 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ZGqbi0sKnXnKcwkqGGmzdl2gsyA6Q3o+CK+P7rmgybs=;
	b=FkX6LgJntQRd8DPlJoWjTgR/SiwtiJrUx8dcjiNSmEPiFB3uT3baM1KfK/kr3V24Cp
	Lx3rcLQIT5OLW6jSm424zCcglCvTx0GEz33HMDA6Dhp6c02/+MUkz6iXg7BNJYNIa7Rg
	YuPO/fa/PWy44P38Jy4eipLE1lOEx2pLX4AM6feDPNoOo5tgKe//EdFLstDlJxna3nK8
	teB5Q/phOQWibbEbzq54YuiqQ3vZuFVWvW3fi9hnOgptx4Z39moYREd7YrwMyOEoFTHP
	kYfqk5mdzWJwhNGqWXOyjK9itZnDLi6J+1tnKyBY9eTf7HP5GeLjWfHU0mKSTuiW/l3u
	TD8Q==
MIME-Version: 1.0
Received: by 10.182.50.103 with SMTP id b7mr4981992obo.15.1347007597283; Fri,
	07 Sep 2012 01:46:37 -0700 (PDT)
Received: by 10.60.33.201 with HTTP; Fri, 7 Sep 2012 01:46:37 -0700 (PDT)
In-Reply-To: <CAOHjBZvo0yyLXfxUGgEq1cBiTn0--wYj+Jvv_2NYAwAF0VjaqQ@mail.gmail.com>
References: <CAOHjBZs0nD_7QjvxpQjF+on5a-e2nSDz_+NyatkVPKB4qyXkYw@mail.gmail.com>
	<CAOHjBZvb3Zne1eQbw=2J4fVXdQH3QpynzrXsnE17gRNxowFi0A@mail.gmail.com>
	<CAMKF1sqCgp-yH7hP-izT=L0qiWfuGpkiCSbuJQ0OtGZ1TgfGgQ@mail.gmail.com>
	<CAOHjBZvkfpvmwFn+VpMyJrb2tfZ5j45OqXgRyzVJh6Ozj-HnDg@mail.gmail.com>
	<CAOHjBZvo0yyLXfxUGgEq1cBiTn0--wYj+Jvv_2NYAwAF0VjaqQ@mail.gmail.com>
Date: Fri, 7 Sep 2012 10:46:37 +0200
Message-ID: <CAOHjBZsUj7ObbzVQUTKeV6kf29YP3_o0Pnm_tJujfXhpGSD9MA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cannot find -lssp during uclibc package build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2012 08:59:03 -0000
Content-Type: multipart/alternative; boundary=f46d04451a095888c704c918a5fa

--f46d04451a095888c704c918a5fa
Content-Type: text/plain; charset=ISO-8859-1

Update: removing ssp from DISTRO_FEATURES solve to build error but
(obviously) remove ssp support
from uclibc package.
Is there a way to avoid this?

Cheers,
Giuseppe

2012/9/7 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>

> This is a forward of the mail erroneously sent only to Khem.
>
>
> ---------- Forwarded message ----------
> From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
> Date: 2012/9/7
> Subject: Re: [OE-core] Cannot find -lssp during uclibc package build
> To: Khem Raj <raj.khem@gmail.com>
>
>
> Hi Khem,
>
> many thanks for your reply (see below).
>
> 2012/9/7 Khem Raj <raj.khem@gmail.com>
>
>> On Fri, Sep 7, 2012 at 12:11 AM, Giuseppe Condorelli
>> <giuseppe.condorelli@gmail.com> wrote:
>> > Any news?
>> >
>> >
>> > 2012/9/3 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
>> >>
>> >> Hi Khem, All
>> >>
>> >> I'm building an uclibc image using gcc 4.6.3 instead of the 4.7 version
>> >> oe-core provides.
>> >> I'm falling in the following linker error during uClibc package build:
>> >>
>> >> "Cannot find -lssp"
>>
>> have a look at the 4.6 recipes from meta-openemebedded/toolchain-layer
>> does that work for you ?
>>
> I'll look soon
>
>>
>> and may be you have 'ssp' in DISTRO_FEATURES then remove that.
>>
> Yes, I've ssp enabled in DISTRO_FEATURES and I thought this was right
> because
> uclibc uses DISTRO_FEATURES to create its .config where UCLIBC_HAS_SSP=y
> should be available, isnt' it?
>
>>
>> >>
>> >> Now, ssp support is enabled in the uClibc package and disabled in the
>> >> gcc-cross-initial package, so
>> >> ld should not include that by default. Instead it does and if I switch
>> to
>> >> old OE-Core repository (June 2012)
>> >> I can see all goes right just because the gcc-cross-intermediate
>> package
>> >> was still present and uClibc depends on it
>> >> for building. Now, I know the -intermediate package was moved out and
>> the
>> >> -initial one should include it, but
>> >> that's it.
>> >> I've not tested that with gcc 4.7 version, this is out of my scope.
>> >> Please, can you address me to solve this issue?
>> >>
>> >> Best Regards,
>> >> Giuseppe
>> >>
>> >
>> >
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> >
>>
>
>
>

--f46d04451a095888c704c918a5fa
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Update: removing ssp from DISTRO_FEATURES solve to build error but (ob=
viously) remove ssp support</div><div>from uclibc package.</div><div>Is the=
re a way to avoid this?</div><div>=A0</div><div>Cheers,</div><div>Giuseppe<=
br>
<br></div><div class=3D"gmail_quote">2012/9/7 Giuseppe Condorelli <span dir=
=3D"ltr">&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com" target=3D"_bl=
ank">giuseppe.condorelli@gmail.com</a>&gt;</span><br><blockquote style=3D"m=
argin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204)=
;border-left-width:1px;border-left-style:solid" class=3D"gmail_quote">
This is a forward of the mail erroneously sent only to Khem.<div class=3D"H=
OEnZb"><div class=3D"h5"><br><br><div class=3D"gmail_quote">---------- Forw=
arded message ----------<br>From: <b class=3D"gmail_sendername">Giuseppe Co=
ndorelli</b> <span dir=3D"ltr">&lt;<a href=3D"mailto:giuseppe.condorelli@gm=
ail.com" target=3D"_blank">giuseppe.condorelli@gmail.com</a>&gt;</span><br>

Date: 2012/9/7<br>Subject: Re: [OE-core] Cannot find -lssp during uclibc pa=
ckage build<br>To: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank">raj.khem@gmail.com</a>&gt;<br><br><br><div>Hi Khem,</div><div>
=A0</div><div>many thanks for your reply (see below).<br>
<br></div><div class=3D"gmail_quote"><div>2012/9/7 Khem Raj <span dir=3D"lt=
r">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gma=
il.com</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div>On Fri, Sep 7, 2012 at 12:11 AM, Giuseppe Condorelli<=
br>



&lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com" target=3D"_blank">gius=
eppe.condorelli@gmail.com</a>&gt; wrote:<br>
&gt; Any news?<br>
&gt;<br>
&gt;<br>
&gt; 2012/9/3 Giuseppe Condorelli &lt;<a href=3D"mailto:giuseppe.condorelli=
@gmail.com" target=3D"_blank">giuseppe.condorelli@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Hi Khem, All<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m building an uclibc image using gcc 4.6.3 instead of the 4.=
7 version<br>
&gt;&gt; oe-core provides.<br>
&gt;&gt; I&#39;m falling in the following linker error during uClibc packag=
e build:<br>
&gt;&gt;<br>
&gt;&gt; &quot;Cannot find -lssp&quot;<br>
<br>
</div>have a look at the 4.6 recipes from meta-openemebedded/toolchain-laye=
r<br>
does that work for you ?<br></blockquote></div><div>I&#39;ll look soon=A0</=
div><div><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;bor=
der-left-color:rgb(204,204,204);border-left-width:1px;border-left-style:sol=
id" class=3D"gmail_quote">



<br>
and may be you have &#39;ssp&#39; in DISTRO_FEATURES then remove that.<br><=
/blockquote></div><div>Yes, I&#39;ve ssp enabled in DISTRO_FEATURES and I t=
hought=A0this was right because</div><div>uclibc uses DISTRO_FEATURES to=A0=
create=A0its .config where UCLIBC_HAS_SSP=3Dy should=A0be available, isnt&#=
39; it?</div>

<div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">
<div><br>
&gt;&gt;<br>
&gt;&gt; Now, ssp support is enabled in the uClibc package and disabled in =
the<br>
&gt;&gt; gcc-cross-initial package, so<br>
&gt;&gt; ld should not include that by default. Instead it does and if I sw=
itch to<br>
&gt;&gt; old OE-Core repository (June 2012)<br>
&gt;&gt; I can see all goes right just because the gcc-cross-intermediate p=
ackage<br>
&gt;&gt; was still present and uClibc depends on it<br>
&gt;&gt; for building. Now, I know the -intermediate package was moved out =
and the<br>
&gt;&gt; -initial one should include it, but<br>
&gt;&gt; that&#39;s it.<br>
&gt;&gt; I&#39;ve not tested that with gcc 4.7 version, this is out of my s=
cope.<br>
&gt;&gt; Please, can you address me to solve this issue?<br>
&gt;&gt;<br>
&gt;&gt; Best Regards,<br>
&gt;&gt; Giuseppe<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
</div>&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
&gt;<br>
</blockquote></div></div><br>
</div><br>
</div></div></blockquote></div><br>

--f46d04451a095888c704c918a5fa--
