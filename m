Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
	[209.85.217.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1E68B7E684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 14:04:58 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id y16so69814008vsc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=J79gsHw6tcsr168tS1YzBZulSa/imrzaq9bbZw3EfvY=;
	b=X5PhO9xTgluNDEBarPh75UhIVittHCxPDGb/2QFCaBusgTUn48i4rFYN9pSrhFLw0N
	cpMtzHxQbaWIZfpTVHEzL/nddkxKJXgcfo+8ib4Rdh+UYvv1kaeFnWEnMnVNnowBRqKZ
	cESZN/avYbJsL0QzfStln4KXpfss174q6f5mvH6dF4dfedE0vGoF5ptsAYIF0UM6BQd+
	t6FJOKqiqK+iDPoiMhhhtdzr+vSH+eh+cp4EQ9JPJ69PxP7xDScOJmSIVy1aVsWaqfW7
	VyScw+dxjQEG0aT3gkhG6NF5pkM7je3TdrSz5uK8gl8TGafCFOEiO0bB6fnEu91x24V5
	8UoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=J79gsHw6tcsr168tS1YzBZulSa/imrzaq9bbZw3EfvY=;
	b=GocRPD+NvmFpMqYWmscytc6P7ERX6UZLFRj8n1dI1jrhbPg6uHXw/5EMJMkFMpUsV6
	Olnfmw4AsU8VGYAvr/JYJOjpDBdAHGaTpiH4nwYxrsKnoDOqLbpBUXMvdtCKJz5mWZEW
	hhT+9oT21I7lTZ0tZc2j2IeLSK+ACrJgd865Rpg2exzHRblD+Xp8v33b13phonVAdrfE
	+c3Jo7Vu+t+dF7IOP9RCvy3qtba+/HdjdbVi3nILqDmKHOWeOWzmhjO7XNv2rP6g80HL
	Emf1iucAd7r6tzOiJMl2Q8XKThuxAq8awMoOQgv0o6W0y95NxQJysr20WAhwf1NVPkUq
	PLyw==
X-Gm-Message-State: APjAAAXZD3SjGL9dobh1fnXMrPqUVcraUafqU0yoyS112eVex/FJHtjc
	b9+nDEyGJ0h/QduDQ73PH5VCIyeC2/09yfDsDKCuRbS5
X-Google-Smtp-Source: APXvYqz7JqWyQSlkhsxdjAubJhOi392bGpL0j0Hk0cmcbIdsJq+IvV1Tnv+ynVqSVTvDBxAYIJLlZOdlcBA0rdwArPQ=
X-Received: by 2002:a67:e8c3:: with SMTP id y3mr20773078vsn.94.1565618699678; 
	Mon, 12 Aug 2019 07:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190812134903.55045-1-alex.kanavin@gmail.com>
	<20190812140214.2330.21572@do>
In-Reply-To: <20190812140214.2330.21572@do>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Aug 2019 16:04:48 +0200
Message-ID: <CANNYZj-Eu9F0rseHBMg7_Tm3oHhzHEtp0_1TT__-aMAv6HCYmQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJweXRob24tbnVtcHk6IHJlbW92ZSB0aGUgcHl0aG8uLi4iIGFuZCAzIG1vcmU=?=
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
X-List-Received-Date: Mon, 12 Aug 2019 14:04:59 -0000
Content-Type: multipart/alternative; boundary="00000000000072b8ba058fec02db"

--00000000000072b8ba058fec02db
Content-Type: text/plain; charset="UTF-8"

Again, this is intentional, as it replaces a part of the earlier patchset I
sent.

Alex


On Mon, 12 Aug 2019 at 16:02, Patchwork <
patchwork@patchwork.openembedded.org> wrote:

> == Series Details ==
>
> Series: "python-numpy: remove the pytho..." and 3 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/19237/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 30a2af80f5)
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your
> concerns.
> Otherwise we would appreciate you correcting the issues and submitting a
> new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
>

--00000000000072b8ba058fec02db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Again, this is intentional, as it replaces a part of =
the earlier patchset I sent.</div><div><br></div><div>Alex<br></div><br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, 12 Aug 2019 at 16:02, Patchwork &lt;<a href=3D"mailto:patchwork@patchw=
ork.openembedded.org">patchwork@patchwork.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">=3D=3D Series Det=
ails =3D=3D<br>
<br>
Series: &quot;python-numpy: remove the pytho...&quot; and 3 more<br>
Revision: 1<br>
URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/series/1923=
7/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.openembedded.org=
/series/19237/</a><br>
State : failure<br>
<br>
=3D=3D Summary =3D=3D<br>
<br>
<br>
Thank you for submitting this patch series to OpenEmbedded Core. This is<br=
>
an automated response. Several tests have been executed on the proposed<br>
series by patchtest resulting in the following failures:<br>
<br>
<br>
<br>
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Series does not appl=
y on top of target branch [test_series_merge_on_head] <br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Rebase your series on top of targeted bra=
nch<br>
=C2=A0 Targeted branch=C2=A0 master (currently at 30a2af80f5)<br>
<br>
<br>
<br>
If you believe any of these test results are incorrect, please reply to the=
<br>
mailing list (<a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a>) raising your=
 concerns.<br>
Otherwise we would appreciate you correcting the issues and submitting a ne=
w<br>
version of the patchset if applicable. Please ensure you add/increment the<=
br>
version number when sending the new version (i.e. [PATCH] -&gt; [PATCH v2] =
-&gt;<br>
[PATCH v3] -&gt; ...).<br>
<br>
---<br>
Guidelines:=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.openembedded.org/wiki=
/Commit_Patch_Message_Guidelines" rel=3D"noreferrer" target=3D"_blank">http=
s://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a><br>
Test framework: <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/patcht=
est" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/cgit/=
cgit.cgi/patchtest</a><br>
Test suite:=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit/=
cgit.cgi/patchtest-oe" rel=3D"noreferrer" target=3D"_blank">http://git.yoct=
oproject.org/cgit/cgit.cgi/patchtest-oe</a><br>
<br>
</blockquote></div>

--00000000000072b8ba058fec02db--
