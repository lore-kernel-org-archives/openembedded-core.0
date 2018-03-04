Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id DC97978883
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 13:40:23 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k9so14541316wre.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 05:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w5MOePZVf1pkqFLG7XHJlqySYVtfxQZsZeEXNhke9jE=;
	b=qPRm1D54RpHOmFwBoKnkpk9dCzGTKjs+mqeS7vxarRzvcKQ2Q0eqj+4KeMMIdHarul
	u+f5AmV3ENsqm8VgZ8lkr8UAWj7reZYkLHOrSwWhuZtN7o6c/y77s3BiS9+g2t6dkvVx
	0ZMdRRiRhZnw8+aFl/eCTgg6XA98fDdy458r2HysfrU0gX/9u2jUCA4GgbVHlqljFUc0
	6E9dv+z5IY448gZbHNCzeDv9SdA/q2EmpPhBvsi5FPFWjlajs/eQYiYtIlUcFYlnlwpa
	dhZKq939VcbGDfPgs/2lHALrLc3gX1Iy53FsJp4kol8EGqHcg5mXNfkEPm4ASCeeOlxX
	IiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w5MOePZVf1pkqFLG7XHJlqySYVtfxQZsZeEXNhke9jE=;
	b=o93XHWoFkBoi6dh/N+3heowQ7aJArccd2ZCwoegI2xbXVS6SKew2a+IjdUohFFtnpT
	iBdlTBW3Pw7H0joyVADl1gKUJfw/G4WODyCykLFGuLilctfTx3YEj2EvnHECUJdiRWyK
	0eBBEvhpcgeNFuH2G7AmpD9cuwz4/T8Xv8T07tRhZ7dBsqq0AU9btpXo4KXP97W1F2t+
	/agLsRSVOB/89lsT9Q3bk+ryhXp9P1CX5YftN1lX5CBusGOr4akQaeCzd29DGJK5cHbX
	Orx0sEncfjYqc9NU8SwLMDk0U7nQgCxgULqVOrTdH6lcEFNBGr93HHPgW5snmbE42I/h
	qFXQ==
X-Gm-Message-State: APf1xPAIyaTQ1V8ikTIaCyPTWhw9/q74nIw9SUwAgOD+UqHPFdy5Hp7k
	gf8/5gC34Cj9w4QdPjARtdKiXUOmN+30sC+MSPI=
X-Google-Smtp-Source: AG47ELub3sFYwQuVaOv2cwxFZZviW8FgUBAAbfGf8YPAfRhIBSJM3YdcehFheT1hGiUwjSFGWwCGUztU7w1n0mJRlWw=
X-Received: by 10.223.160.42 with SMTP id k39mr10857002wrk.138.1520170824694; 
	Sun, 04 Mar 2018 05:40:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 4 Mar 2018 05:40:24 -0800 (PST)
In-Reply-To: <CA+chaQe3UXNRjTZ0CQjtU7w5qMg+Z42uFWr6yvYKCLM+zr8kaw@mail.gmail.com>
References: <1520162580-30003-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CA+chaQeV1f7yUt3w5t7iXrYf5OyMjbxr-C_dqKGqG+jDt4gFcA@mail.gmail.com>
	<CA+chaQdU0RoRG_5pKr5qrKS2KauOfii_F-_CHPB4cy_0v2P-pQ@mail.gmail.com>
	<CA+chaQeKutNQ5G8=6ph4fYZVJb8KkF0OWeExCJUQTWArBZirKA@mail.gmail.com>
	<1520170010.3436.66.camel@linuxfoundation.org>
	<CA+chaQe3UXNRjTZ0CQjtU7w5qMg+Z42uFWr6yvYKCLM+zr8kaw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 4 Mar 2018 14:40:24 +0100
Message-ID: <CA+chaQcjfrZMv=oSByNCeFK-=yXFy=3NReYGx9q4jX+MDBmwgg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][pyro] gcc6: Upgrade to 6.4.0 (latest stable series release)
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
X-List-Received-Date: Sun, 04 Mar 2018 13:40:24 -0000
Content-Type: multipart/alternative; boundary="94eb2c05ddb20101690566965a97"

--94eb2c05ddb20101690566965a97
Content-Type: text/plain; charset="UTF-8"

I'm sorry, for some reason this thread in Gmail starts with the morty
review you've sent, but when I look in my favorite mutt, I see that my
replies were linked with pyro review where you're right the files aren't
included.

Still I would like to see what's the diff between gcc-6.4 in morty and pyro
and gcc-6.4 which was in master (and there is still gcc-6.3 in rocko which
should imho be upgraded first to preserve continuity).

On Sun, Mar 4, 2018 at 2:35 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> Are we both talking about the same morty-next?
>
> docker-shr @ ~/openembedded-core $ git log origin/morty-next  --
> meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-4490.patch
> commit a926f3986174b67375c4486e5b3f27ad3b939e28
> Author: Juro Bystricky <juro.bystricky@intel.com>
> Date:   Thu Mar 1 13:38:08 2018 -0800
>
>     gcc6: Upgrade to 6.4.0 (latest stable series release)
>
>     Changed BINV and PV from 6.2.0 to 6.4.0
>     Modified BASEURI to load xz tarball instead of bz2
>
>     Backported series of patches from https://github.com/hjl-tools/gcc.git
>     branch /hjl/indirect/gcc-6-branch/master which contains
>     an IA patch series for security related issues
>
>     ubsan-fix-check-empty-string.patch : removed, already applied
>
>     Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> docker-shr @ ~/openembedded-core $ git show -1
> a926f3986174b67375c4486e5b3f27ad3b939e28 -M  | grep CVE-2016-4490.patch
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch
> b/meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-4490.patch
> rename from meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch
> rename to meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-4490.patch
>
>
> On Sun, Mar 4, 2018 at 2:26 PM, Richard Purdie <richard.purdie@
> linuxfoundation.org> wrote:
>
>> On Sun, 2018-03-04 at 13:08 +0100, Martin Jansa wrote:
>> > And the same with
>> > meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-4490.patch
>> > which isn't included in SRC_URI since:
>>
>> As far as I can tell this isn't included in the patch or the
>> repository?
>>
>> Cheers,
>>
>> Richard
>>
>
>

--94eb2c05ddb20101690566965a97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m sorry, for some reason this thread in Gmail starts=
 with the morty review you&#39;ve sent, but when I look in my favorite mutt=
, I see that my replies were linked with pyro review where you&#39;re right=
 the files aren&#39;t included.<div><br></div><div>Still I would like to se=
e what&#39;s the diff between gcc-6.4 in morty and pyro and gcc-6.4 which w=
as in master (and there is still gcc-6.3 in rocko which should imho be upgr=
aded first to preserve continuity).</div></div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On Sun, Mar 4, 2018 at 2:35 PM, Martin Jansa =
<span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_=
blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr"><div>Are we both talking about the same morty-n=
ext?</div><div><br></div><div><span style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">docker-shr @ ~/open=
embedded-core $<span>=C2=A0</span></span>git log origin/morty-next=C2=A0 --=
 meta/recipes-devtools/gcc/gcc-<wbr>6.4/CVE-2016-4490.patch</div><span clas=
s=3D""><div>commit a926f3986174b67375c4486e5b3f27<wbr>ad3b939e28</div><div>=
Author: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.com" targ=
et=3D"_blank">juro.bystricky@intel.com</a>&gt;</div><div>Date:=C2=A0 =C2=A0=
Thu Mar 1 13:38:08 2018 -0800</div><div><br></div><div>=C2=A0 =C2=A0 gcc6: =
Upgrade to 6.4.0 (latest stable series release)</div><div>=C2=A0 =C2=A0=C2=
=A0</div></span><div>=C2=A0 =C2=A0 Changed BINV and PV from 6.2.0 to 6.4.0<=
/div><span class=3D""><div>=C2=A0 =C2=A0 Modified BASEURI to load xz tarbal=
l instead of bz2</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 Back=
ported series of patches from <a href=3D"https://github.com/hjl-tools/gcc.g=
it" target=3D"_blank">https://github.com/hjl-tools/<wbr>gcc.git</a></div><d=
iv>=C2=A0 =C2=A0 branch /hjl/indirect/gcc-6-branch/<wbr>master which contai=
ns</div><div>=C2=A0 =C2=A0 an IA patch series for security related issues</=
div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 ubsan-fix-check-empty-=
string.<wbr>patch : removed, already applied</div><div>=C2=A0 =C2=A0=C2=A0<=
/div></span><div>=C2=A0 =C2=A0 Signed-off-by: Juro Bystricky &lt;<a href=3D=
"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky@intel.co=
m</a>&gt;</div><div>docker-shr @ ~/openembedded-core $ git show -1 a926f398=
6174b67375c4486e5b3f27<wbr>ad3b939e28 -M=C2=A0 | grep CVE-2016-4490.patch</=
div><div>diff --git a/meta/recipes-devtools/gcc/<wbr>gcc-6.2/CVE-2016-4490.=
patch b/meta/recipes-devtools/gcc/<wbr>gcc-6.4/CVE-2016-4490.patch</div><di=
v>rename from meta/recipes-devtools/gcc/gcc-<wbr>6.2/CVE-2016-4490.patch</d=
iv><div>rename to meta/recipes-devtools/gcc/gcc-<wbr>6.4/CVE-2016-4490.patc=
h</div><div><br></div></div><div class=3D"HOEnZb"><div class=3D"h5"><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Mar 4, 2018 at 2=
:26 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org" target=3D"_blank">richard.purdie@<wbr>linuxfoundati=
on.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On Sun=
, 2018-03-04 at 13:08 +0100, Martin Jansa wrote:<br>
&gt; And the same with<br>
&gt; meta/recipes-devtools/gcc/gcc-<wbr>6.4/CVE-2016-4490.patch<br>
&gt; which isn&#39;t included in SRC_URI since:<br>
<br>
</span>As far as I can tell this isn&#39;t included in the patch or the<br>
repository?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--94eb2c05ddb20101690566965a97--
