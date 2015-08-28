Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id F34E471633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 15:45:32 +0000 (UTC)
Received: by vkhf67 with SMTP id f67so11408406vkh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zaD6Xm+nMfvWQNNYFRDkdQ4qTdjhg6eka+1W509jBkU=;
	b=hCcxWMVye5Z/Eft7SXsotTUdhXoPud94c/p+nodMkNDGaTQbi190hNOvS0cXSiGHKX
	lUegW+ftofujBFZtaVQTPbKBuiDTbZUXK4Za7nQ8FJuXaydbHTpjVyT2p1QUxevBZajA
	aRBs4GUYHAmb8N3j4dOlGlNNTH2PEyaGQGHdOHfUKkj+9VDemNJ0hul2I/NzHVBHlfAm
	a8NYOURF9Bz9oQ8PWOuiHcTQjL1qV9/s7DqIrHvQAgUhltgHl/Nr1Frbqe6eJAVdNyqw
	7XVhKFpBlaereyj63CwZC5jyaMIgMCEziNGdKVg9LZF/H15l9irAvblht9/tPQ+Ipvvp
	Dm1A==
X-Received: by 10.52.165.76 with SMTP id yw12mr9695792vdb.91.1440776732755;
	Fri, 28 Aug 2015 08:45:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.203.2 with HTTP; Fri, 28 Aug 2015 08:44:22 -0700 (PDT)
In-Reply-To: <3747805E-B6F6-4B4F-B803-4E39098D0F5A@gmail.com>
References: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440700983.git.chris_larson@mentor.com>
	<cover.1440700983.git.chris_larson@mentor.com>
	<9873f94b4a88ca4ecf7ed28737c5f7c6f9d6d199.1440700983.git.chris_larson@mentor.com>
	<3747805E-B6F6-4B4F-B803-4E39098D0F5A@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 28 Aug 2015 08:44:22 -0700
Message-ID: <CABcZANkZDv3qSf4=Fj59zfN4JhN3Jqvsbz9Qfvjygo0yrdgUAA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] packagegroup-base: pull in iw as well as wireless-tools
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
X-List-Received-Date: Fri, 28 Aug 2015 15:45:33 -0000
Content-Type: multipart/alternative; boundary=001a11c2c2ae5b7d45051e60f90b

--001a11c2c2ae5b7d45051e60f90b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2015 at 10:50 PM, Khem Raj <raj.khem@gmail.com> wrote:

> > +VIRTUAL-RUNTIME_wireless-tools ?=3D "iw wireless-tools=E2=80=9D
>
> wouldn=E2=80=99t the define from default-providers.inc be enough ?
>

Yeah, I guess I'm just paranoid and like to avoid the implicit dependency,
but duplicating the value isn't ideal either. I'll remove the dupe when I
re-submit to fix the missing Upstream-Status. Thanks.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c2c2ae5b7d45051e60f90b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Aug 27, 2015 at 10:50 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":by" class=3D"a3s"=
 style=3D"overflow:hidden">&gt; +VIRTUAL-RUNTIME_wireless-tools ?=3D &quot;=
iw wireless-tools=E2=80=9D<br>
<br>
wouldn=E2=80=99t the define from default-providers.inc be enough ?</div></b=
lockquote></div><br>Yeah, I guess I&#39;m just paranoid and like to avoid t=
he implicit dependency, but duplicating the value isn&#39;t ideal either. I=
&#39;ll remove the dupe when I re-submit to fix the missing Upstream-Status=
. Thanks.=C2=A0<br>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">C=
hristopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmb=
edded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor=
 Graphics</div></div>
</div></div>

--001a11c2c2ae5b7d45051e60f90b--
