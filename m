Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 55A2C7FE44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 20:56:07 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id u6so2991012vkn.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 12:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ALxyMfTxsa2Z9TP9mo301iAMhSqb4qTgul5FKC9sIhY=;
	b=YQyxadv6QA5iCYOewIm09PnX+EI0iPKt8IMkgEKv3XD6PcOBZjq0k4plrv3xioL67f
	W62TXCLN3M/utMgMNEGsB0J15YcwBdCSaWZXdXlmPBNNdTJHkS1AwzO2t9mkJSYaJa7J
	F1qLdRkRNE3PvG2EtKXhX0fOeLyzluiJUN9bk0jXhasxk7zzo7NLPM0LnocZvWC7DJmL
	4O22byt+nd3rvS/mftBhhHkboPkyqhDXgHfSNMBW+rl8/raJpVfYL9Ei/F1k+S/KHyHo
	S5dzdq91F8XHYB26+H/wiSo7lGEVVSVnI5eu72GvO0BNZcOAZJD/YVTXVhsA8fpopp31
	Iw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ALxyMfTxsa2Z9TP9mo301iAMhSqb4qTgul5FKC9sIhY=;
	b=NxZdUsAUw2n738RUkbCrg9RuU1NKiiIZyQ1iE35Sth0AJc0eI6ynuuxa0knqGAfFS9
	tHJcD4ligTZurqtU7A4Qgi8QnFfbqyTRmM0e6M7I3nNsd453IyvS2c4OIVFVWOQJRv7X
	hfgOcoRkYdRIQxH4zDLii0yl4Un1S0hogab1XTiyJOQAIpvo40TsACJsrETVWXeyAskS
	/uwVPoueqEq6rJk/LEiLTq96HBW5aDa/rnbrQ8yiDU+P4EQjFddQw0sC5bI/S/lhHoz2
	D0roxj1q26ZNPBj319EYuBIIaRbh1sY/pv27+u0ydWPn+m0h/ZOpU7v53QrJDSoTx7mR
	ZVHQ==
X-Gm-Message-State: APjAAAWlthTEhPNVLv/VPG6rvy5PNibQop+Ls9iCy/z6vEcIC0B6TkLb
	/ZiC156SexBM4SQ8woKu13wSXSmiRt0Ar5ocjT0=
X-Google-Smtp-Source: APXvYqxaTfpevMeff5h5g8Uqbq/rCZa1ec/wPEPslRV6eCa0rZAjXiBv7oxSDgFQ0A+p6AjY//wWmLbIvOfF0YuM3sM=
X-Received: by 2002:ac5:cdcd:: with SMTP id u13mr11214704vkn.0.1580158568285; 
	Mon, 27 Jan 2020 12:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
	<20200127141908.84922-7-alex.kanavin@gmail.com>
	<CAMKF1sooYU9dr5nkmgoW0cPjd3L_QJYtQBUMOpJAABTJ=mqrzA@mail.gmail.com>
In-Reply-To: <CAMKF1sooYU9dr5nkmgoW0cPjd3L_QJYtQBUMOpJAABTJ=mqrzA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Jan 2020 21:55:57 +0100
Message-ID: <CANNYZj8Ak0gFwAnupcWJ9eDXP6_hV2hT0u0E4pastRMt+QanZQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] core-image-sato-sdk-ptest: use 2G of RAM
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
X-List-Received-Date: Mon, 27 Jan 2020 20:56:07 -0000
Content-Type: multipart/alternative; boundary="00000000000026ced7059d2556bf"

--00000000000026ced7059d2556bf
Content-Type: text/plain; charset="UTF-8"

This is only used on x86_64 and arm64 by the autobuilder, so we should be
fine.

Alex

On Mon, 27 Jan 2020 at 21:54, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Jan 27, 2020 at 6:20 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Particularly, 1G wasn't enough for lttng-tools ptests as
> > half of that went to /tmp, and lttng-tools needs more.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> > index 7490b773d2e..58c257c49fb 100644
> > --- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> > +++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
> > @@ -16,4 +16,5 @@ IMAGE_OVERHEAD_FACTOR = "1.0"
> >  IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
> >
> >  # ptests need more memory than standard to avoid the OOM killer
> > -QB_MEM = "-m 1024"
> > +# also lttng-tools needs /tmp that has at least 1G
> > +QB_MEM = "-m 2048"
>
> perhaps we need to be cautious here and check if all qemu machines can
> support 2G emulation.
>
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000026ced7059d2556bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is only used on x86_64 and arm64 by the autobuil=
der, so we should be fine.</div><div><br></div><div>Alex<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 2=
7 Jan 2020 at 21:54, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Mon, Jan 27, 2020 at 6:20 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Particularly, 1G wasn&#39;t enough for lttng-tools ptests as<br>
&gt; half of that went to /tmp, and lttng-tools needs more.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk-p=
test.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato-sdk-ptest.bb<=
/a> | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-sato/images/<a href=3D"http://core-image-sat=
o-sdk-ptest.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato-sdk-pt=
est.bb</a> b/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk=
-ptest.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato-sdk-ptest.b=
b</a><br>
&gt; index 7490b773d2e..58c257c49fb 100644<br>
&gt; --- a/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk-p=
test.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato-sdk-ptest.bb<=
/a><br>
&gt; +++ b/meta/recipes-sato/images/<a href=3D"http://core-image-sato-sdk-p=
test.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sato-sdk-ptest.bb<=
/a><br>
&gt; @@ -16,4 +16,5 @@ IMAGE_OVERHEAD_FACTOR =3D &quot;1.0&quot;<br>
&gt;=C2=A0 IMAGE_ROOTFS_EXTRA_SPACE =3D &quot;1124288&quot;<br>
&gt;<br>
&gt;=C2=A0 # ptests need more memory than standard to avoid the OOM killer<=
br>
&gt; -QB_MEM =3D &quot;-m 1024&quot;<br>
&gt; +# also lttng-tools needs /tmp that has at least 1G<br>
&gt; +QB_MEM =3D &quot;-m 2048&quot;<br>
<br>
perhaps we need to be cautious here and check if all qemu machines can<br>
support 2G emulation.<br>
<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000026ced7059d2556bf--
