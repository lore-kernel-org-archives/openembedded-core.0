Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 49BB8719EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:41:25 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id f201so986268oib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 05:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ISXRWjw7qPubcxGQsXGfEtmWEM0mO1VcUOqjLuna/c4=;
	b=JU0eC0H/ue/ejf/mPbuN1MKBMmgPer3LZCsIx/e+sl8f0+gtvQp0tdHB+aVkVFnFDn
	Al9vvWY88BtuxMl6LK/U2H4zTg2sQtwgP46cwvrJl3G3M+pI1ZGUXQ+vkCDJsjqdfbyE
	nIarms1Ur7X15iXDQd0u+Bpg+K3czTLi+0+7Ib2wMpv7UfsiyGAoFhaUBRjTH3Y3H/Ar
	4rPHfDgqlZHJvHiIbJTuaR3l2GAg25PKs0ScrZFlHFFkaDOoXCcvPuL6dsG3y4TrfrZ8
	t9KcMOOjytVwkh/nfhtPaeeX/Syh7j/s6pe27dQ2+wOhvlKnP3KUE02qt8tKjT1j34V2
	kulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ISXRWjw7qPubcxGQsXGfEtmWEM0mO1VcUOqjLuna/c4=;
	b=IvA4T3A0bDB374iqlpZFet4Lg+bHxn4dU2n9LtJnvmE2M9/dIGOhA5zMnv1uSZSqb0
	QV++gcVqCh7KoXWp8pHqY5/LWPKklPeBJz2bcKuZlaDdKiK/UkXxQAvxmaVppOKRuNA8
	GeiYZuOr2BCopogni79k7hUGe1FUwgWsFLNnKK0F6uiHGPehv3r3SAAF0gIFFiRtwcxW
	DSIUTMdDLQr71o6vYQiixiREVo6tWUrjaQuF9vkH3iMsnbQuD3N6q1C61YPqIPtdmFUj
	vnsIWEBXU7Ep9EepE4219OsMiinOaAmmPNDACVFlVAiECn0O8zyKJFyAvnwCk385opn5
	+JTg==
X-Gm-Message-State: AKaTC01b8QJvLcmTc1RzUxMKQei5bkAZgAsmCVW4qL0Mz4+STZFZM4rD1F2DOe15ncgt+pk5qCdkF8z5oBccrQ==
X-Received: by 10.157.40.151 with SMTP id s23mr1805033ota.68.1479908486596;
	Wed, 23 Nov 2016 05:41:26 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.35.65 with HTTP; Wed, 23 Nov 2016 05:41:06 -0800 (PST)
In-Reply-To: <CAP9ODKr7igkbbvi2tu6qwAv+gVLbty0HrkfF30cDtiG+5xqdWQ@mail.gmail.com>
References: <1479396394-26134-1-git-send-email-fabio.berton@ossystems.com.br>
	<CABcZANmh+pV4Xxwi2UY7fA+BctpVXRvM6gLcgMJEx-rwODMi4g@mail.gmail.com>
	<CAAPZna2pDLyq6PH6sb8c0J_Bxa2Pi+FNNZw_tVJ38o90mGsEJw@mail.gmail.com>
	<CABcZAN=55DOHHy0fMJi6pPaR+TuwgwfErOd7YBAN=s_e9D0rwA@mail.gmail.com>
	<CAAPZna2dHKqh-rDSo6UGu0uP=CBLRHaGbhC-c=OisccQ4HUUsQ@mail.gmail.com>
	<CABcZANnL5MxwQmiZZ0i8CGHaYxsD9zapNfcyB_a37OoigHq2oA@mail.gmail.com>
	<CAP9ODKr7igkbbvi2tu6qwAv+gVLbty0HrkfF30cDtiG+5xqdWQ@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 23 Nov 2016 06:41:06 -0700
X-Google-Sender-Auth: OXbqK7URaFAmdJKHkEmIylmz7ec
Message-ID: <CABcZANmw1GUVVRiGJ-pv6PLgO247GR9Z9tPPaTerm9RKOkROYA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpcap: Fix build when PACKAGECONFIG ipv6 is not enable
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
X-List-Received-Date: Wed, 23 Nov 2016 13:41:25 -0000
Content-Type: multipart/alternative; boundary=001a11c1494aa4cfc10541f80b18

--001a11c1494aa4cfc10541f80b18
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 3:00 AM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Thu, Nov 17, 2016 at 2:24 PM, Christopher Larson <clarson@kergoth.com>
> wrote:
> >
> > On Thu, Nov 17, 2016 at 9:21 AM, Fabio Berton
> > <fabio.berton@ossystems.com.br> wrote:
> >>
> >> No, I created a patch, git format-patch and then edit generated files
> with
> >> Upstream-Status tag and added to recipe. Is this wrong?
> >
> >
> > As I indicated in my first reply, it=E2=80=99s best to put the tag outs=
ide the
> > generated patch (above it, or below the =E2=80=94-), as it isn=E2=80=99=
t part of the
> commit,
> > only part of the patch file. It=E2=80=99s minor, and you don=E2=80=99t =
need to re-submit,
> > but in general the tag is not part of the commit message. For example, =
if
> > your patch was applied to a git repository with git-am, it=E2=80=99d be=
 in the
> > commit message, which should not be the case.
>
> To be honest, there a many files which does as Fabio did and I also
> personally do as well. I don't like it outside of the commit log as it
> looks out of context.
>
> If someone is getting the patch file, it is expected they will review
> it and not blindly apply it on upstream repository.


I don=E2=80=99t feel too strongly about it, if that=E2=80=99s the consensus=
, that=E2=80=99s fine, I
just wanted to open up a dialogue on the subject. Thanks.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c1494aa4cfc10541f80b18
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Nov 23, 2016 at 3:00 AM, Otavio Salvador <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.sa=
lvador@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><span class=3D"">On Thu, Nov 17, 2016 at 2:24 PM, Christopher Larson &=
lt;<a href=3D"mailto:clarson@kergoth.com">clarson@kergoth.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; On Thu, Nov 17, 2016 at 9:21 AM, Fabio Berton<br>
&gt; &lt;<a href=3D"mailto:fabio.berton@ossystems.com.br">fabio.berton@ossy=
stems.com.br</a><wbr>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; No, I created a patch, git format-patch and then edit generated fi=
les with<br>
&gt;&gt; Upstream-Status tag and added to recipe. Is this wrong?<br>
&gt;<br>
&gt;<br>
&gt; As I indicated in my first reply, it=E2=80=99s best to put the tag out=
side the<br>
&gt; generated patch (above it, or below the =E2=80=94-), as it isn=E2=80=
=99t part of the commit,<br>
&gt; only part of the patch file. It=E2=80=99s minor, and you don=E2=80=99t=
 need to re-submit,<br>
&gt; but in general the tag is not part of the commit message. For example,=
 if<br>
&gt; your patch was applied to a git repository with git-am, it=E2=80=99d b=
e in the<br>
&gt; commit message, which should not be the case.<br>
<br>
</span>To be honest, there a many files which does as Fabio did and I also<=
br>
personally do as well. I don&#39;t like it outside of the commit log as it<=
br>
looks out of context.<br>
<br>
If someone is getting the patch file, it is expected they will review<br>
it and not blindly apply it on upstream repository.</blockquote></div><br>I=
 don=E2=80=99t feel too strongly about it, if that=E2=80=99s the consensus,=
 that=E2=80=99s fine, I just wanted to open up a dialogue on the subject. T=
hanks.<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_sig=
nature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBa=
ke, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engin=
eer, Mentor Graphics</div>
</div></div>

--001a11c1494aa4cfc10541f80b18--
