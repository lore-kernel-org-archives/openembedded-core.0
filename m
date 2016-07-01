Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id CDC6C60124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 20:47:39 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id f6so3342354ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 13:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Avx5+Dlw8yMcgnstC9Nmb4x5n0u4/rsKc8VhcgFZEbM=;
	b=d9+lco0E+r3hvB6fgCoRDkxRksivIZ9X9+38x4m7hUDsY3iW12DQTsACTg8obP+dsW
	/atogGzlAapWjKbSEEFb59TGdijs/wlwYofs/Sce7RdLOlG9EZyFx++2fH5S8V3KOU7X
	9kMxm4Mn1b+y+T5C7Fc/ke0Vplva8BjNKoUsjQDmfqF62fxGyiYBXkbFD6vHLpmDmMM6
	9uFGXTdR+pFFObhCt2n4NDiVT4+xw3HA060Lcb3YJELbq7iNqRjoqGgeP50iDAr/I8za
	3ahoVn92F3w4WxWYH7lA1O2PFMgQgQIqKKRBNddxLdRKkH+ZDi3d4D/5CEfF2URnKOHB
	smow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Avx5+Dlw8yMcgnstC9Nmb4x5n0u4/rsKc8VhcgFZEbM=;
	b=QCz59a4OOGhmbjDJb42TFb8BNsORWL4nyqMxu9TRYF1hzlftT14d7aXBvY4aXc2eJx
	WhgOMlw2QC4cqGbIJ4k47sB72WHdaLJGJ9xsbmjyUzzmO0FjNDIufT87wto1uP84wpXJ
	XGJNn3jl+3t+JSIkbVgubvq51pGlqjDeo3as606drlwgXqy47dLSdJDBHHOYz302oNMe
	SbHX686UjWPyyw8TC7y9ks0nWRdwXUnwLrkMVbJd5kGvxD7RKDHbMZ3y04kow3a1JezY
	qaPQusAqWswqfwPCzZTUnvaQg/vlLECD76aGle7vZZrO6CbbLHcNmPE2CA23x+PQGBYB
	hWpg==
X-Gm-Message-State: ALyK8tLF3BZfIdyUF4pjs/jlSuekGcJBTKsVYHaO/9uEtbhQyF92KuUttB4FA1t8QLeAcqSTaS7G3n1ELVX6AA==
X-Received: by 10.36.43.216 with SMTP id h207mr188615ita.66.1467406059796;
	Fri, 01 Jul 2016 13:47:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.19.70 with HTTP; Fri, 1 Jul 2016 13:47:20 -0700 (PDT)
In-Reply-To: <1467405897-14036-1-git-send-email-kergoth@gmail.com>
References: <1467405897-14036-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Fri, 1 Jul 2016 13:47:20 -0700
X-Google-Sender-Auth: uipYqVUdzBoV3SrJiIsQsOlC00w
Message-ID: <CABcZANkSdOTP+KWytUrDPnQ8cEwS4fACmQiHAPiOK3t9gsjk6A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCHv2] gcc-cross: remove --with-linker-hash-style
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
X-List-Received-Date: Fri, 01 Jul 2016 20:47:40 -0000
Content-Type: multipart/alternative; boundary=001a114748a2ef801305369918da

--001a114748a2ef801305369918da
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 1, 2016 at 1:44 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> We explicitly set the hash style to gnu in our LDFLAGS. Setting the
> default to
> this in the toolchain, while convenient, actually hides bugs, as a failure
> to
> obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to how we
> poison the sysroot -- rather than relying on the default, notice right
> away if
> somoeone isn't obeying the needed flags.
>
> This will result in a failure to obey LDFLAGS causing a GNU_HASH QA
> failure,
> which is what's often seen with external toolchains. This brings us all on
> the
> same page, and makes sure a failure to obey LDFLAGS is seen early.
>
> This is limited to cross, to retain ease of use for SDKs.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

v2 changes: dropped the change to the sdk to keep ease of use there, as we
mainly want this for fixing recipes, not externally built stuff. The fixes
for qt3 and some other recipes were merged. Only one is pending, a fix for
service in meta-skeleton to obey LDFLAGS, which is forthcoming.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a114748a2ef801305369918da
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jul 1, 2016 at 1:44 PM, Christopher Larson <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":123" class=
=3D"a3s aXjCH m155a8351e2550f08">From: Christopher Larson &lt;<a href=3D"ma=
ilto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
We explicitly set the hash style to gnu in our LDFLAGS. Setting the default=
 to<br>
this in the toolchain, while convenient, actually hides bugs, as a failure =
to<br>
obey LDFLAGS isn&#39;t noticed. By removing this, it&#39;s not dissimilar t=
o how we<br>
poison the sysroot -- rather than relying on the default, notice right away=
 if<br>
somoeone isn&#39;t obeying the needed flags.<br>
<br>
This will result in a failure to obey LDFLAGS causing a GNU_HASH QA failure=
,<br>
which is what&#39;s often seen with external toolchains. This brings us all=
 on the<br>
same page, and makes sure a failure to obey LDFLAGS is seen early.<br>
<br>
This is limited to cross, to retain ease of use for SDKs.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;</div></blockquote></div><br>v2 change=
s: dropped the change to the sdk to keep ease of use there, as we mainly wa=
nt this for fixing recipes, not externally built stuff. The fixes for qt3 a=
nd some other recipes were merged. Only one is pending, a fix for service i=
n meta-skeleton to obey LDFLAGS, which is forthcoming.<br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Ch=
ristopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbe=
dded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor =
Graphics</div></div>
</div></div>

--001a114748a2ef801305369918da--
