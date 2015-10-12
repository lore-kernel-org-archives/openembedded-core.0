Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 62B8976E3F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 16:22:13 +0000 (UTC)
Received: by qgeb31 with SMTP id b31so22009219qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 09:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MHC04rpzUXD3DLGvzmqiOIOqytt0YEwKv5hENh93Rq0=;
	b=YH0Podt5m7ZDxtZv6TyNgEx/XC6hGitt1cgGaBBPmrjqjuqjumH9JqVXZstodeymsy
	gWAEzhLTCIHKT5KgAjVKn92qwcAYojCw9154wVlqvbY5G/IDBWQYQ4kqc1V0qJP1PY1U
	W1JJB4DtDNhn4+tSJJUAl0zT/6zQWrOmjSqkGfZFOW0ymQqo9oovk4rY8U3QzmcASGpV
	FdjzuffDqrgkvaSs9XOwM/ngCEa625r8mmVD2BJ53LQKugHC2gZcidp3tCBe8kme2sx9
	TN4MslkkKVX5/nFWhdfXkKrfZDdC3IFmcG2PdIygk3IQV9/m/waJXkAh2kKCuVKFEMNS
	LnSQ==
X-Gm-Message-State: ALoCoQn90t67WBu/PdZN/U/3hAm+wCeDU32e8TILS5IkejOf8oMoHPPNx/t8ZE7B9zKRJ2euSR8T
X-Received: by 10.140.132.209 with SMTP id 200mr35341873qhe.64.1444666933815; 
	Mon, 12 Oct 2015 09:22:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Mon, 12 Oct 2015 09:21:54 -0700 (PDT)
In-Reply-To: <1444557068.2003.0.camel@pbcl.net>
References: <20150514114002.GA2402@jama>
	<1444403489-29494-1-git-send-email-Martin.Jansa@gmail.com>
	<1444557068.2003.0.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Oct 2015 17:21:54 +0100
Message-ID: <CAJTo0LbfSj-ZnpXc_4aVP7O0wXiPMLUg=0jy5JhWdGcSj9OgkA@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk, gcr, libsecret: force ARM mode
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
X-List-Received-Date: Mon, 12 Oct 2015 16:22:14 -0000
Content-Type: multipart/alternative; boundary=001a11c07cca68c7860521eabb87

--001a11c07cca68c7860521eabb87
Content-Type: text/plain; charset=UTF-8

On 11 October 2015 at 10:51, Phil Blundell <pb@pbcl.net> wrote:

> > * gcr, libsecret are new since switch to gcc 5.2
>
> The problem with libsecret seems to be caused by its valgrind support
> code (which contains asm statements that only work in ARM state).  I
> wonder if you can just turn WITH_VALGRIND off rather than forcing
> ARM-state for the whole library.


That code is provided by valgrind itself so either fixing valgrind to write
valid code or forcibly disabling the code in valgrind.h if thumb is enabled
seems sensible and more likely to catch more problems in a single patch.

Ross

--001a11c07cca68c7860521eabb87
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 October 2015 at 10:51, Phil Blundell <span dir=3D"ltr">&lt;<a href=3D=
"mailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><span class=3D"">&gt; * gcr, libsecret are =
new since switch to gcc 5.2<br>
<br>
</span>The problem with libsecret seems to be caused by its valgrind suppor=
t<br>
code (which contains asm statements that only work in ARM state).=C2=A0 I<b=
r>
wonder if you can just turn WITH_VALGRIND off rather than forcing<br>
ARM-state for the whole library.</blockquote></div><br>That code is provide=
d by valgrind itself so either fixing valgrind to write valid code or forci=
bly disabling the code in valgrind.h if thumb is enabled seems sensible and=
 more likely to catch more problems in a single patch.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c07cca68c7860521eabb87--
