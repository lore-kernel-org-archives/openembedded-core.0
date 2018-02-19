Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id BE0206093F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 20:07:11 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id o13so10340316ito.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 12:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PnYXN6RYf6+sWq+ngkCnZ1dxrilYvQ+arQIgl4PsLa4=;
	b=utOGAfAq5gjhdgi0sPHMNu0H9hPXdp5rrb0Q/9X/H/iFF2g3OlZbXxiBHPYdkLiKbS
	92NK1ahRfZXAKwrLdWHAauldb6/DIfuxH4XX8+VmVikpJ7R7Ce1+rzwP8kuAnQ0RGBsd
	R8hJ906HNqknBLoAjb56Y1S2RRSpl+oKGjvHssEkuDjvsaeRzQCrRYcyyQH6MghSFY8B
	4PPhjZJFEAaV0h+bSMCjJ8GXMfVgLMJ7UGXH7Flm4gvfX7l9ZYjFr36QgU/54E2o0Qsh
	v5rAq7FmKVpxZXlVaaIIQugI3+a/Q+b2LOlp51K+p2hqRi5yQLhZp66+wiexF7HlLQlL
	Ay4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PnYXN6RYf6+sWq+ngkCnZ1dxrilYvQ+arQIgl4PsLa4=;
	b=K43hK0dLkxzpAQMMkWcHb3Uw5oVJGEXfOq5wJCAVBBbOIVi7xW6YIBSMjur6vi8hHK
	B1Jsv0W4MZbkY5HWp7g225/d8XohG4beYnUk6L5tXtEub3oOiM/fBMkbDYelopwQrGyj
	qM1Q+2OgZsRWtfx2cJBadfXj6Sur+aFoX1dmFB1qoAbkSt3wcMI34XRxkC2aDTEcq5xC
	i5HNv3GXgGxx/pYsHSNkVzDuYuc/VVf3/LXDve0WOVLn0rVWCHRBHUM9esP44DQUKt/5
	vEMxqUZxYgwPDFAI0atjbNkOlhnyJQdOHQ9BvtAOcKC0d6nPoyYpcBYcQpMn/XRjAUop
	aKVA==
X-Gm-Message-State: APf1xPAXFITDNr17QORRcTqzGoKKvQetM/5bnc25kb0ktfz/iE4ub0Kv
	x5GF/TcqlPATHAx+SvdHptxARhNpOxLXmqdKMfT4oQ==
X-Google-Smtp-Source: AH8x225LjgGZnrTdzch1rWgT1ZB5cZuOqqzlTlSBSfqH6TT3peK9siCEtNZgF4jAnleqwoN8hNxW0qau3hT1Tx+FyD4=
X-Received: by 10.36.36.5 with SMTP id f5mr685107ita.131.1519070832996; Mon,
	19 Feb 2018 12:07:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Mon, 19 Feb 2018 12:06:52 -0800 (PST)
In-Reply-To: <089d4714-011d-5cca-5af6-8f7a8e3568c4@gmail.com>
References: <cover.1517524576.git.raj.khem@gmail.com>
	<aa96375d5517a1f0170609aac7283bd71566f46a.1517524576.git.raj.khem@gmail.com>
	<CAJTo0Lax4NpwLPN2Ly_9seKFLYp-qCVJCuyzXhtN6aiXKgVKRg@mail.gmail.com>
	<CAMKF1sp8riyhF=6N_ak-TyZ6_w=aj+az=qx+mjepXPQagV7vqw@mail.gmail.com>
	<CAJTo0LYEO1e2i_dnXDT7sNRyScH_KT3Ge38yWundnr2hk3de9g@mail.gmail.com>
	<089d4714-011d-5cca-5af6-8f7a8e3568c4@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Feb 2018 20:06:52 +0000
Message-ID: <CAJTo0LaaNqCjg_+ATQ70b54NTKrdfo=_xm6JAeyX3XpFYmQezQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.27 release
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
X-List-Received-Date: Mon, 19 Feb 2018 20:07:11 -0000
Content-Type: multipart/alternative; boundary="001a1146f2c063ee7f0565963d38"

--001a1146f2c063ee7f0565963d38
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

Sigh, sorry, should have realised.  So locale-archives are not compatible
between glibc releases?  Good to know, I guess.

Ross

On 18 February 2018 at 07:58, Khem Raj <raj.khem@gmail.com> wrote:

> Wanted to send update on this issue
>
> I got to bottom of this issue and Ross you should have known it :)
>
> https://patchwork.openembedded.org/patch/127105/
>
> introduced an optimization into nativesdk glibc to let it ride on
> localedate from SDK host. This has now broken in glibc with
>
> https://github.com/kraj/glibc/commit/95cb863a1ef7760a11272bb
> d7ba5fe62dc41be54
>
> it is recommended for static programs to be relinked if using glibc 2.27
> our case is also similar mismatch of libc version and localedata just in
> opposite direction where we are trying to read old data with new glibc
> instead.
>
> I have initiated a discussion within glibc community on it to explore what
> options we have, but be prepared to ship full localedata in worst case with
> glibc 2.27,  this might be the worst case option if no alternative is found.
>
> Thank you
> -Khem
>
> On 2/15/18 4:12 AM, Burton, Ross wrote:
>
>> Yes, that's it.
>>
>> Ross
>>
>> On 12 February 2018 at 07:32, Khem Raj <raj.khem@gmail.com <mailto:
>> raj.khem@gmail.com>> wrote:
>>
>>     On Sat, Feb 3, 2018 at 2:21 AM, Burton, Ross <ross.burton@intel.com
>>     <mailto:ross.burton@intel.com>> wrote:
>>     > Getting there: https://autobuilder.yocto.io/tgrid <
>> https://autobuilder.yocto.io/tgrid>
>>     >
>>     > Just two actual problems:
>>     > - The non-gplv3 build failed as the make fix needs to be backported
>> to
>>     > meta-gplv2
>>     > - The eSDK selftests all failed with en_US.UTF-8 problems, the new
>> glibc
>>     > shouldn't be causing a problem with uninative so this is
>> interesting, maybe
>>     > the new one is behaving slightly differently.  Should be easy to
>> replicate.
>>     > The same problem caused selftest to fail.
>>     >
>>
>>     is the UTF error like this one
>>     https://gist.github.com/25a84d23618824f0e5e6857a960eaca4
>>     <https://gist.github.com/25a84d23618824f0e5e6857a960eaca4>
>>
>>      > Ross
>>
>>
>>

--001a1146f2c063ee7f0565963d38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Khem,<div><br></div><div>Sigh, sorry, should have reali=
sed.=C2=A0 So locale-archives are not compatible between glibc releases?=C2=
=A0 Good to know, I guess.</div><div><br></div><div>Ross</div></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 18 February 2018 at 0=
7:58, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Wanted to send update on this issue<br>
<br>
I got to bottom of this issue and Ross you should have known it :)<br>
<br>
<a href=3D"https://patchwork.openembedded.org/patch/127105/" rel=3D"norefer=
rer" target=3D"_blank">https://patchwork.openembedded<wbr>.org/patch/127105=
/</a><br>
<br>
introduced an optimization into nativesdk glibc to let it ride on localedat=
e from SDK host. This has now broken in glibc with<br>
<br>
<a href=3D"https://github.com/kraj/glibc/commit/95cb863a1ef7760a11272bbd7ba=
5fe62dc41be54" rel=3D"noreferrer" target=3D"_blank">https://github.com/kraj=
/glibc/<wbr>commit/95cb863a1ef7760a11272bb<wbr>d7ba5fe62dc41be54</a><br>
<br>
it is recommended for static programs to be relinked if using glibc 2.27<br=
>
our case is also similar mismatch of libc version and localedata just in op=
posite direction where we are trying to read old data with new glibc instea=
d.<br>
<br>
I have initiated a discussion within glibc community on it to explore what =
options we have, but be prepared to ship full localedata in worst case with=
 glibc 2.27,=C2=A0 this might be the worst case option if no alternative is=
 found.<br>
<br>
Thank you<br>
-Khem<span class=3D""><br>
<br>
On 2/15/18 4:12 AM, Burton, Ross wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
Yes, that&#39;s it.<br>
<br>
Ross<br>
<br></span><span class=3D"">
On 12 February 2018 at 07:32, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a> &lt;mailto:<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&gt; wrote=
:<br>
<br>
=C2=A0 =C2=A0 On Sat, Feb 3, 2018 at 2:21 AM, Burton, Ross &lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a><br=
></span>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:ross.burton@intel.com" target=3D=
"_blank">ross.burton@intel.com</a>&gt;<wbr>&gt; wrote:<br>
=C2=A0 =C2=A0 &gt; Getting there: <a href=3D"https://autobuilder.yocto.io/t=
grid" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto.io/t<w=
br>grid</a> &lt;<a href=3D"https://autobuilder.yocto.io/tgrid" rel=3D"noref=
errer" target=3D"_blank">https://autobuilder.yocto.io/<wbr>tgrid</a>&gt;<sp=
an class=3D""><br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; Just two actual problems:<br>
=C2=A0 =C2=A0 &gt; - The non-gplv3 build failed as the make fix needs to be=
 backported to<br>
=C2=A0 =C2=A0 &gt; meta-gplv2<br>
=C2=A0 =C2=A0 &gt; - The eSDK selftests all failed with en_US.UTF-8 problem=
s, the new glibc<br>
=C2=A0 =C2=A0 &gt; shouldn&#39;t be causing a problem with uninative so thi=
s is interesting, maybe<br>
=C2=A0 =C2=A0 &gt; the new one is behaving slightly differently.=C2=A0 Shou=
ld be easy to replicate.<br>
=C2=A0 =C2=A0 &gt; The same problem caused selftest to fail.<br>
=C2=A0 =C2=A0 &gt;<br>
<br>
=C2=A0 =C2=A0 is the UTF error like this one<br>
=C2=A0 =C2=A0 <a href=3D"https://gist.github.com/25a84d23618824f0e5e6857a96=
0eaca4" rel=3D"noreferrer" target=3D"_blank">https://gist.github.com/25a84d=
<wbr>23618824f0e5e6857a960eaca4</a><br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"https://gist.github.com/25a84d23618824f0e5e685=
7a960eaca4" rel=3D"noreferrer" target=3D"_blank">https://gist.github.com/25=
a84<wbr>d23618824f0e5e6857a960eaca4</a>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0&gt; Ross<br>
<br>
<br>
</blockquote>
</blockquote></div><br></div>

--001a1146f2c063ee7f0565963d38--
