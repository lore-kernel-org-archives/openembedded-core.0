Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id AA43D6E672
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 10:30:12 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id i40so16205120qti.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Dec 2017 02:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lkNH9pZAKvm2mJ5vgmeUQ3UdWVU9wHr8kbzh4kzbgQ4=;
	b=RDfbi34014QymIOMyGLqi6iO8Z60rltIRKUQUSMdUdIhVLsbGhClVBBNj2/K0Qv3fA
	OeoHop9CU/l6bEofKxyf+e9KxbKmLUQXwxG/VkDf6wdIxJ7tVgErcJkc2J6oPA9iDyFB
	I50JUU3VZWBXdvxeQUfbkhd6Ss6L/8CRFJs4EK7JHDgb6Nv+qryuHUrc3cI5zXzc6fQG
	EFqZuLdIPbzVQzYWCwzyquTfT/LIOie8O3i4+VgC+4rAJriYdBMMZm8JuZLWC+mxveop
	y1hnl8X01gqWdKLDFp7efHvN5ynCCs7aJvLcjQPj+VtXABwGvzSBgbmWu+cvc2TchUju
	mcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lkNH9pZAKvm2mJ5vgmeUQ3UdWVU9wHr8kbzh4kzbgQ4=;
	b=oXG9ZWFPZ0KWMIAEUwxiD1ZoY3hhc5KWYuTsi93i9u1T2j9V1xUsRLZqiXD0rTUZx+
	CEFTdHB37aCt6mUclG1R4NnAGRerYoZlEtTuW5NqUfcvkZ0xndJ1t/tY/ATjla71nkfC
	CjcCmm/KfkCxpGTHIImLVbcBrc2v5fuFNGpR+QTBSXp8wY/7pIlOXDMEmXi3DrLgQSBL
	tKrpp3BfamasDmHEufLtTJHdXOM79f59nB1rQDVInicxrXjVwYQVQUtn+goh4VfHXb+y
	z/VY0rkHGNrmd6lU/I48K2RhlYyRl/Ewb+XoSwdEx5GdOTSJsibze2RQuBTL/vhp5qjf
	n3YQ==
X-Gm-Message-State: AKGB3mLs82+oTm1IdqXV8TJKbx7QjAu0ZPMfTnfAX4ypjJ0DrCYsR1w+
	WsbgJFjDPHLTR5VG64E7Ohgt23SY2zCy0MSppik=
X-Google-Smtp-Source: AGs4zMYxYfaMf7qNhj8nXVtPdJ0h9Mb0tqt63g2wMTJfz2iO5VDGNTKMAU33HM17JRgIH1op0tryJ90YGe+N5XqZrhw=
X-Received: by 10.55.195.216 with SMTP id r85mr27128813qkl.218.1512642613280; 
	Thu, 07 Dec 2017 02:30:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Thu, 7 Dec 2017 02:30:12 -0800 (PST)
In-Reply-To: <CAJTo0LbzN9_7iAOZPqiqQYXxii-+zwwDkSFwrSnFQNmnYXUXJg@mail.gmail.com>
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
	<fc66fbd898d637782560e123ec6a87a62dde89fc.1512401707.git.bruce.ashfield@windriver.com>
	<CAMKF1soUD8m1vOyzVwiygp3ib4jCyy7dfdqxde2Y-LG_CXqOTA@mail.gmail.com>
	<ad367df7-795c-20c9-eef3-436f12038f97@windriver.com>
	<1512409179.862.212.camel@linuxfoundation.org>
	<0c894d04-7262-727f-8a64-63939359feb2@windriver.com>
	<CAJTo0LbzN9_7iAOZPqiqQYXxii-+zwwDkSFwrSnFQNmnYXUXJg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 7 Dec 2017 05:30:12 -0500
Message-ID: <CADkTA4N6RfoCyKZGR-zJXkNv-k1zZ+HvFhC8-MpECekLLAVa_g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
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
X-List-Received-Date: Thu, 07 Dec 2017 10:30:12 -0000
Content-Type: multipart/alternative; boundary="001a1146ef26a30518055fbd8d15"

--001a1146ef26a30518055fbd8d15
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 6, 2017 at 11:28 AM, Burton, Ross <ross.burton@intel.com> wrote:

> The amended commit has mismatching commit log and patch (target elfutils
> is in the commit log but not the patch), and doesn't mention installing
> target elfutils if they want it.
>


I fixed up the commit log on that patch to match the actual code.

As it turns out, I don't see the need to install target elfutils anymore,
so I didn't
include anything about that in the log.

We still have some lttng build issues with the -dev kernel (due to objtool
being
required and the openssl headers required for making the scripts), and those
are being worked on separately. Having this updated linux-yocto-dev recipe
in the tree gets the kernel building and booting and enables us to work
through
the other issues more quickly (not to meention, I've already pushed
4.15-rc2 to
the actual kernel tree, so you get that from a build regardless).

Cheers,

Bruc




>
> Ross
>
> On 4 December 2017 at 17:43, Bruce Ashfield <bruce.ashfield@windriver.com>
> wrote:
>
>> On 2017-12-04 12:39 PM, Richard Purdie wrote:
>>
>>> On Mon, 2017-12-04 at 12:24 -0500, Bruce Ashfield wrote:
>>>
>>>> On 2017-12-04 11:38 AM, Khem Raj wrote:
>>>>
>>>>>
>>>>> On Mon, Dec 4, 2017 at 7:39 AM, Bruce Ashfield
>>>>> <bruce.ashfield@windriver.com> wrote:
>>>>>
>>>>>>
>>>>>> Outside of the normal patch refreshes and boot issues, there are
>>>>>> new
>>>>>> build time tools within the kernel that required the following
>>>>>> dependencies:
>>>>>>
>>>>>> For ORC_UNWINDER support in x86-64:
>>>>>>
>>>>>>    DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-
>>>>>> native elfutils', '', d)}"
>>>>>>
>>>>> do we need both target and host elfutils
>>>>>
>>>> Yup. There were references to both. Some had to run for hostcc
>>>> and others in the target arch.
>>>>
>>>
>>> Just for reference this is pretty bad for performance as it delays the
>>> kernel compile until some substantial parts of userspace build.
>>>
>>>
>> On a second look, I can likely turn off the target part, if someone
>> wants it, they can always install the package (or it could be a
>> rdepends).
>>
>> I'll amend the commit and leave it on that branch with just the
>> DEPENDS on the -native version.
>>
>> Is ORC_UNWINDER useful and commonly used?
>>>
>>
>> The upstream kernel commit turned it on by default, I turned it off in
>> the kernel-cache, but I wanted to make sure the dependency was
>> in place.
>>
>> The commit series from Josh Poimboeuf all lead to it being on as
>> the default choice (even with a slight overhead).
>>
>> Bruce
>>
>>
>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1146ef26a30518055fbd8d15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Dec 6, 2017 at 11:28 AM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
>The amended commit has mismatching commit log and patch (target elfutils i=
s in the commit log but not the patch), and doesn&#39;t mention installing =
target elfutils if they want it.</div></blockquote><div><br></div><div><br>=
</div><div>I fixed up the commit log on that patch to match the actual code=
.</div><div><br></div><div>As it turns out, I don&#39;t see the need to ins=
tall target elfutils anymore, so I didn&#39;t</div><div>include anything ab=
out that in the log.</div><div><br></div><div>We still have some lttng buil=
d issues with the -dev kernel (due to objtool being</div><div>required and =
the openssl headers required for making the scripts), and those</div><div>a=
re being worked on separately. Having this updated linux-yocto-dev recipe</=
div><div>in the tree gets the kernel building and booting and enables us to=
 work through</div><div>the other issues more quickly (not to meention, I&#=
39;ve already pushed 4.15-rc2 to</div><div>the actual kernel tree, so you g=
et that from a build regardless).</div><div><br></div><div>Cheers,</div><di=
v><br></div><div>Bruc</div><div><br></div><div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span class=3D"HOEnZb"><font=
 color=3D"#888888"><div><br></div><div>Ross</div></font></span></div><div c=
lass=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 4 December 2017 at 17:43, Bruce Ashfield <span dir=3D"l=
tr">&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">b=
ruce.ashfield@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><span>On 2017-12-04 12:39 PM, Richard Purdie wrote:<br>
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
DEPENDS on the -native version.<span><br>
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
the default choice (even with a slight overhead).<span class=3D"m_-18938853=
60894538066HOEnZb"><font color=3D"#888888"><br>
<br>
Bruce</font></span><div class=3D"m_-1893885360894538066HOEnZb"><div class=
=3D"m_-1893885360894538066h5"><br>
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
</div></div><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--001a1146ef26a30518055fbd8d15--
