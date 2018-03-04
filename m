Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1A32D60291
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 13:33:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z9so10709442wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 05:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tFcnFnDiMGTuxBAv3NLZueGEzl136ARPWavSM98m1jE=;
	b=YB4TlMR9BU2f9oGzzn+mgRufTUGF1OaeMlEux0JIhO6IItA7QPMB5ejNV+pD5iT1XI
	hbMm62jnMqSRHNzOVJURzX2/xw6cZ0MeMSqB1CLgMg4tyQwZv4IVQqjdJnvs6olkd+pm
	bC3tgecTB7lJULFDUL+ynzedkjc2i5yMsAhlKVU6Ha9OKfRImGzlFJy/tEg6d4n0Rgx9
	4ytjjBlbNrqbVeApATTEvaEFOUo7QNeEb2Pby8YfxfYEVfYpS962dwAzfx3K94aJ7/Wd
	DEUzR65zsPoZb4L8ChNEZKyGcX4f2s47UBvwPWITnn4wF7OFOWNzpCxhVnhVdQ6G4WUT
	X7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tFcnFnDiMGTuxBAv3NLZueGEzl136ARPWavSM98m1jE=;
	b=I92wQ1pHfn3sRKDiiCurjjnmPAsQbFG4X9ZWXOyiP+ATz/RC61iN37Xiiz9DlVP/vT
	tf9tJfuhFpy9KaR4ATlDXgv9+WbTO4U+bMsPbEpbdbhYK0DmACOEh4HJa2R2kFcDxszH
	hlZgbcKxksxy3iNpwWfWVNJXFGn/l9hQaqpLQ63RwFJPHm452Ye9mtV5z0i9RP9qSV0c
	hIe0b0sLAFknjLB4ZWn8mU8ZJcTTU8S3zHxtYsJfrvw57NkYW+LmqKcHVUTfUENRQVa9
	r/cD9HeZEZI4XzmAm/dHaR9JNTvGtPgEP+06kj04NsuQsIUAyYEVvyizp0wV2hDlhDye
	o/DA==
X-Gm-Message-State: AElRT7HFwL/HKmFnrtF7vtOKTXZ4hmhwm0ow3bWLHheguJDj+Vm48dl1
	KF5kc/eMEZ9ZTda0L6UgIG+IR1uyNufR81vPRKQ=
X-Google-Smtp-Source: AG47ELvmSuQcz86M3dnFVOYAKW9wtQqHmFVaKZSjYh0tpvsc0CdTy8J6cf7XoWMtwlHgmwoaPedLPLXhPv4LKfsidX4=
X-Received: by 10.28.225.130 with SMTP id y124mr5613487wmg.60.1520170426161;
	Sun, 04 Mar 2018 05:33:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 4 Mar 2018 05:33:45 -0800 (PST)
In-Reply-To: <1520169914.3436.65.camel@linuxfoundation.org>
References: <1520162580-30003-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CA+chaQeV1f7yUt3w5t7iXrYf5OyMjbxr-C_dqKGqG+jDt4gFcA@mail.gmail.com>
	<CA+chaQdU0RoRG_5pKr5qrKS2KauOfii_F-_CHPB4cy_0v2P-pQ@mail.gmail.com>
	<1520169914.3436.65.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 4 Mar 2018 14:33:45 +0100
Message-ID: <CA+chaQfeBK9q3QxDHRvoFDTbDodStoi-=WKyd6LP=K0AAEfCmg@mail.gmail.com>
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
X-List-Received-Date: Sun, 04 Mar 2018 13:33:46 -0000
Content-Type: multipart/alternative; boundary="001a114a4cfa3fde020566964241"

--001a114a4cfa3fde020566964241
Content-Type: text/plain; charset="UTF-8"

> As far as I can tell, this patch doesn't add that file?

My git doesn't agree:

docker-shr @ ~/openembedded-core $ git log origin/morty-next --
meta/recipes-devtools/gcc/gcc-6.4/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
commit a926f3986174b67375c4486e5b3f27ad3b939e28
Author: Juro Bystricky <juro.bystricky@intel.com>
Date:   Thu Mar 1 13:38:08 2018 -0800

    gcc6: Upgrade to 6.4.0 (latest stable series release)

    Changed BINV and PV from 6.2.0 to 6.4.0
    Modified BASEURI to load xz tarball instead of bz2

    Backported series of patches from https://github.com/hjl-tools/gcc.git
    branch /hjl/indirect/gcc-6-branch/master which contains
    an IA patch series for security related issues

    ubsan-fix-check-empty-string.patch : removed, already applied

    Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>

It's moved from gcc-6.2 to gcc-6.4 directory in this patch:
diff --git
a/meta/recipes-devtools/gcc/gcc-6.2/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
b/meta/recipes-devtools/gcc/gcc-6.4/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
rename from
meta/recipes-devtools/gcc/gcc-6.2/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
rename to
meta/recipes-devtools/gcc/gcc-6.4/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch


On Sun, Mar 4, 2018 at 2:25 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2018-03-04 at 13:00 +0100, Martin Jansa wrote:
> > Also
> > meta/recipes-devtools/gcc/gcc-6.4/0048-ARM-PR-target-71056-Don-t-use-
> > vectorized-builtins-wh.patch
> > added in this patch doesn't seem to be used anywhere.
>
> As far as I can tell, this patch doesn't add that file?
>
> Cheers,
>
> Richard
>

--001a114a4cfa3fde020566964241
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">&gt; As far as I can tell,=
 this patch doesn&#39;t add that file?</span><br></div><div><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline"><br></span></div><div>My git doesn&#39;t agree:</div><div><br><=
/div><div>docker-shr @ ~/openembedded-core $ git log origin/morty-next -- m=
eta/recipes-devtools/gcc/gcc-6.4/0048-ARM-PR-target-71056-Don-t-use-vectori=
zed-builtins-wh.patch</div><div>commit a926f3986174b67375c4486e5b3f27ad3b93=
9e28</div><div>Author: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@=
intel.com">juro.bystricky@intel.com</a>&gt;</div><div>Date:=C2=A0 =C2=A0Thu=
 Mar 1 13:38:08 2018 -0800</div><div><br></div><div>=C2=A0 =C2=A0 gcc6: Upg=
rade to 6.4.0 (latest stable series release)</div><div>=C2=A0 =C2=A0=C2=A0<=
/div><div>=C2=A0 =C2=A0 Changed BINV and PV from 6.2.0 to 6.4.0</div><div>=
=C2=A0 =C2=A0 Modified BASEURI to load xz tarball instead of bz2</div><div>=
=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 Backported series of patches fr=
om <a href=3D"https://github.com/hjl-tools/gcc.git">https://github.com/hjl-=
tools/gcc.git</a></div><div>=C2=A0 =C2=A0 branch /hjl/indirect/gcc-6-branch=
/master which contains</div><div>=C2=A0 =C2=A0 an IA patch series for secur=
ity related issues</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 ub=
san-fix-check-empty-string.patch : removed, already applied</div><div>=C2=
=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 Signed-off-by: Juro Bystricky &lt;=
<a href=3D"mailto:juro.bystricky@intel.com">juro.bystricky@intel.com</a>&gt=
;</div><div><br></div><div>It&#39;s moved from gcc-6.2 to gcc-6.4 directory=
 in this patch:</div><div><div>diff --git a/meta/recipes-devtools/gcc/gcc-6=
.2/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch b/meta/r=
ecipes-devtools/gcc/gcc-6.4/0048-ARM-PR-target-71056-Don-t-use-vectorized-b=
uiltins-wh.patch</div><div>rename from meta/recipes-devtools/gcc/gcc-6.2/00=
48-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch</div><div>ren=
ame to meta/recipes-devtools/gcc/gcc-6.4/0048-ARM-PR-target-71056-Don-t-use=
-vectorized-builtins-wh.patch</div></div><div><br></div></div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Mar 4, 2018 at 2:25 PM=
, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, 2018-03-04 at 1=
3:00 +0100, Martin Jansa wrote:<br>
&gt; Also<br>
&gt; meta/recipes-devtools/gcc/gcc-<wbr>6.4/0048-ARM-PR-target-71056-<wbr>D=
on-t-use-<br>
<span class=3D"">&gt; vectorized-builtins-wh.patch<br>
&gt; added in this patch doesn&#39;t seem to be used anywhere.<br>
<br>
</span>As far as I can tell, this patch doesn&#39;t add that file?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--001a114a4cfa3fde020566964241--
