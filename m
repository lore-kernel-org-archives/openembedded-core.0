Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5C568609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 14:14:50 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z60so2707900qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 06:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iFz/LuLPkoc8t1W85FPCpwH7xHf7PKm0aYuvEtIFW0E=;
	b=BYZq3t2/KkJR7hwZTNpfV5tdkXfh/YWdXrm45toEX9I82X9wy4qm5ZRnSS/B0p9/G+
	9M2JEA9TjveY8C6lkOxx69FFYZa6xOCNDy6ErdocnWHKJoLcwmUpmtIDzpY0GSjVHNts
	pstCI8TEpNYUq7GBBOTA5ZM6zHHO2uqu5TJvaRBW1qinEvoNW6r94XWxaZVIS17ivr6/
	f65SIrNtpt2w2oLA3TQhRQ1+QFjQcySY7L/QpEWwChW97mWvMJ9/3KMO8DZ0/iJtjMtr
	KSp+plQvepdV7ulMHrLUzenoaZqXncs84kXbzg15g6nps9bsonnJWIkD3uwMqjSzOlrC
	1dQQ==
X-Gm-Message-State: ALoCoQmc3DYyxjkuy5IICx7CzbdLOopEG3J0bWrgMM4cWizN4wmS6SLP/kMbRATrq97yYGC0pOyi
X-Received: by 10.224.123.193 with SMTP id q1mr14422002qar.64.1423664091826;
	Wed, 11 Feb 2015 06:14:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 11 Feb 2015 06:14:31 -0800 (PST)
In-Reply-To: <2303631.cvGGEx5voH@peggleto-mobl5.ger.corp.intel.com>
References: <1423613857-19514-1-git-send-email-paul.gortmaker@windriver.com>
	<CAJTo0LYJpt2XpPL6SYtY+2sT9oR4DuBKdjoCtMZR7CHqygSF0Q@mail.gmail.com>
	<2303631.cvGGEx5voH@peggleto-mobl5.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Feb 2015 14:14:31 +0000
Message-ID: <CAJTo0LaqdcHA6WsXmFkP=8yeF7QcA93-fmUQL8xV0vZyr95grA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi: fix do_rootfs failure due to version skew
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
X-List-Received-Date: Wed, 11 Feb 2015 14:14:51 -0000
Content-Type: multipart/alternative; boundary=047d7bdc177e791f6e050ed0a091

--047d7bdc177e791f6e050ed0a091
Content-Type: text/plain; charset=UTF-8

On 11 February 2015 at 13:38, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> A bit short on details, but here's the bug that triggered splitting it in
> the
> first place:
>
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=1492
>
> We already had what you're proposing before the split was done. Given that
> avahi is somewhat a core component (if one needs zeroconf), if we go back
> to
> one recipe, there still needs to be a packaging split between the parts
> that
> need gtk and those that don't.
>

That's from back when gnome-common had a GPLv3 license, which I've since
fixed upstream.  I've just confirmed that avahi with GPLv3 excluded at
least starts to build.

Ross

--047d7bdc177e791f6e050ed0a091
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 February 2015 at 13:38, Paul Eggleton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@l=
inux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":8tx" class=3D"a3s" style=3D"overflow:hidden">A bit short on details=
, but here&#39;s the bug that triggered splitting it in the<br>
first place:<br>
<br>
=C2=A0 <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1492"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1492=
</a><br>
<br>
We already had what you&#39;re proposing before the split was done. Given t=
hat<br>
avahi is somewhat a core component (if one needs zeroconf), if we go back t=
o<br>
one recipe, there still needs to be a packaging split between the parts tha=
t<br>
need gtk and those that don&#39;t.<br></div></blockquote></div><br>That&#39=
;s from back when gnome-common had a GPLv3 license, which I&#39;ve since fi=
xed upstream.=C2=A0 I&#39;ve just confirmed that avahi with GPLv3 excluded =
at least starts to build.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--047d7bdc177e791f6e050ed0a091--
