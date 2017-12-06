Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 134197869E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 16:29:13 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id p139so7866238itb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 08:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kdMJ07/OkIIN+SV6VJAo87TjgCNQtPxZtIHjHhHKZWg=;
	b=AG1TvZVYON/IoadJwm0vgyzgWp0qpPAJI60BFbd4eRHbVkO9SPO/+/8Hfxn9EMbXpb
	DH31asaqCwU6Scc/LyBh/XD013fjxQq+GRcZapRevDEOkv0dg1lr6kxMarxKkZq69T5h
	iM5v4pp9rGErk1kjChhW24hOMqPxUOZ/VXYV5MlxSCzsnb7gep97v6cK9zghfWrEKTux
	MsGUrN6X3/SP81E4STvijE1kq97EbTNNOutwifWQHbtfDOvHn3NyP8ftDGP6adSaxSdV
	vL0fO2ah1RS2JcIa1drumlN1h94h6/Dz4aQze/5xLIT16Dvb2xwoSta2uas7/uD1/Enz
	UMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kdMJ07/OkIIN+SV6VJAo87TjgCNQtPxZtIHjHhHKZWg=;
	b=sL85qVR2i5URzHixlwWLYP4jpfB60l/wu3yeNyQvSZOfelkK4gmSgJaMLRDFJbc4gB
	WmKkqJQDn/kFWYMvRwdC3E5DDI+lNf4fW/q7Ebya72OZOez7aKVMFKuyW+XNchLrnXQJ
	GEhTFZwPeFsiEFFSq6FuvRP+Np3MNVQmVZ9zRyfdzRi7+FGd05OtOxDe1g496kjdBnUU
	OdyL5SCuc84K5fYokTiHKL3wyeu26Kl1aL7U5WqFun6PQ7CNWlR535ihoj++raVU4ox9
	c3muiwm8Uf4hTLqOvBO7nTRx4Ci930aKe/hkpEdfZYWQJbAud5vKKc4fCRNHqpH4Gv8c
	cJQg==
X-Gm-Message-State: AKGB3mI/OV8JFUI4/fieENA4mVF1rZQ8rF5L4whVFY098UG/XkmAzZR0
	BTbPs0m3Jz5XC6CjFFKbzzYs96kE3uVG5PjhAVmdZQ==
X-Google-Smtp-Source: AGs4zMbDzL+WugeeyFJ9WTBSFVs8Yj3tkmKIPG8uTW5SToVjp/BA7YbdyhYctrLsDocvwHjKxQtvZDm9InzGZ/3zxNo=
X-Received: by 10.36.93.5 with SMTP id w5mr3240596ita.124.1512577755035; Wed,
	06 Dec 2017 08:29:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Wed, 6 Dec 2017 08:28:54 -0800 (PST)
In-Reply-To: <0c894d04-7262-727f-8a64-63939359feb2@windriver.com>
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
	<fc66fbd898d637782560e123ec6a87a62dde89fc.1512401707.git.bruce.ashfield@windriver.com>
	<CAMKF1soUD8m1vOyzVwiygp3ib4jCyy7dfdqxde2Y-LG_CXqOTA@mail.gmail.com>
	<ad367df7-795c-20c9-eef3-436f12038f97@windriver.com>
	<1512409179.862.212.camel@linuxfoundation.org>
	<0c894d04-7262-727f-8a64-63939359feb2@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Dec 2017 16:28:54 +0000
Message-ID: <CAJTo0LbzN9_7iAOZPqiqQYXxii-+zwwDkSFwrSnFQNmnYXUXJg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] linux-yocto-dev: update to v4.15+
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
X-List-Received-Date: Wed, 06 Dec 2017 16:29:14 -0000
Content-Type: multipart/alternative; boundary="001a1143f14cc8ed8e055fae7319"

--001a1143f14cc8ed8e055fae7319
Content-Type: text/plain; charset="UTF-8"

The amended commit has mismatching commit log and patch (target elfutils is
in the commit log but not the patch), and doesn't mention installing target
elfutils if they want it.

Ross

On 4 December 2017 at 17:43, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> On 2017-12-04 12:39 PM, Richard Purdie wrote:
>
>> On Mon, 2017-12-04 at 12:24 -0500, Bruce Ashfield wrote:
>>
>>> On 2017-12-04 11:38 AM, Khem Raj wrote:
>>>
>>>>
>>>> On Mon, Dec 4, 2017 at 7:39 AM, Bruce Ashfield
>>>> <bruce.ashfield@windriver.com> wrote:
>>>>
>>>>>
>>>>> Outside of the normal patch refreshes and boot issues, there are
>>>>> new
>>>>> build time tools within the kernel that required the following
>>>>> dependencies:
>>>>>
>>>>> For ORC_UNWINDER support in x86-64:
>>>>>
>>>>>    DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-
>>>>> native elfutils', '', d)}"
>>>>>
>>>> do we need both target and host elfutils
>>>>
>>> Yup. There were references to both. Some had to run for hostcc
>>> and others in the target arch.
>>>
>>
>> Just for reference this is pretty bad for performance as it delays the
>> kernel compile until some substantial parts of userspace build.
>>
>>
> On a second look, I can likely turn off the target part, if someone
> wants it, they can always install the package (or it could be a
> rdepends).
>
> I'll amend the commit and leave it on that branch with just the
> DEPENDS on the -native version.
>
> Is ORC_UNWINDER useful and commonly used?
>>
>
> The upstream kernel commit turned it on by default, I turned it off in
> the kernel-cache, but I wanted to make sure the dependency was
> in place.
>
> The commit series from Josh Poimboeuf all lead to it being on as
> the default choice (even with a slight overhead).
>
> Bruce
>
>
>
>> Cheers,
>>
>> Richard
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1143f14cc8ed8e055fae7319
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The amended commit has mismatching commit log and patch (t=
arget elfutils is in the commit log but not the patch), and doesn&#39;t men=
tion installing target elfutils if they want it.<div><br></div><div>Ross</d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 4 Dec=
ember 2017 at 17:43, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto=
:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriver.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""=
>On 2017-12-04 12:39 PM, Richard Purdie wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Mon, 2017-12-04 at 12:24 -0500, Bruce Ashfield wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 2017-12-04 11:38 AM, Khem Raj wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
On Mon, Dec 4, 2017 at 7:39 AM, Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce=
.ashfield@windriver.com</a>&gt; wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Outside of the normal patch refreshes and boot issues, there are<br>
new<br>
build time tools within the kernel that required the following<br>
dependencies:<br>
<br>
For ORC_UNWINDER support in x86-64:<br>
<br>
=C2=A0=C2=A0 DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x=
86&#39;, &#39;elfutils-<br>
native elfutils&#39;, &#39;&#39;, d)}&quot;<br>
</blockquote>
do we need both target and host elfutils<br>
</blockquote>
Yup. There were references to both. Some had to run for hostcc<br>
and others in the target arch.<br>
</blockquote>
<br>
Just for reference this is pretty bad for performance as it delays the<br>
kernel compile until some substantial parts of userspace build.<br>
<br>
</blockquote>
<br></span>
On a second look, I can likely turn off the target part, if someone<br>
wants it, they can always install the package (or it could be a<br>
rdepends).<br>
<br>
I&#39;ll amend the commit and leave it on that branch with just the<br>
DEPENDS on the -native version.<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Is ORC_UNWINDER useful and commonly used?<br>
</blockquote>
<br></span>
The upstream kernel commit turned it on by default, I turned it off in<br>
the kernel-cache, but I wanted to make sure the dependency was<br>
in place.<br>
<br>
The commit series from Josh Poimboeuf all lead to it being on as<br>
the default choice (even with a slight overhead).<span class=3D"HOEnZb"><fo=
nt color=3D"#888888"><br>
<br>
Bruce</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1143f14cc8ed8e055fae7319--
