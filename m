Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 70E6271DE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:04:24 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id l7so126207416qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 06:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y3J3lkZaAoLw0bMTz8pP3Vsyn/5b+RaDsacDiibIn/A=;
	b=QgwOnc7MMFHmtjdUXIVbBZdpUoRvPE3THOnyG7Qxsh6ahZx4rcdfJdyKVv8VzfSU35
	TvIrnCVM8zAplMS9/73IWIrVqQvZceqJPA51RuB6thWgmll8SRdXsS6/aia/Y6Zs+Acx
	7UdPlSOmtp8TaTScsrdZlEKORD3ITjJUn5cCFaezWJbQOsAXsva0iG+4WIFYWzXByiWu
	adVjp7bZf9KgjYwGhPz1olsOP4F1XrDrrhI9AFQtKF7E1U5526OTbgvlm8wv01to96KR
	JW+7FgSqefBxVU3YEMAQe2gz+NAzaeJ8Dj9r7xnHfFkABzjlcCQBrtGJXmxBXUwlj+cO
	q6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y3J3lkZaAoLw0bMTz8pP3Vsyn/5b+RaDsacDiibIn/A=;
	b=B2DfZTaO4SxwiG4KZiCjShXkcV0M0EnMQ8rK95QmGtj2Y3NWFyeAPMBvXOIlOIIE20
	MTA7Cf6X1jk4pCgtDclV7+6hSopowSDmITEd+kBEkbW4uEI7yqPQkD0L2soIMKt+fB+g
	i5+oEhn7vnxFh/Hg9q0yq11CfRPb3e1zy9KfkclNY+zCX8QHXAl2aL39Jc5KHJ+eB3UV
	6conAgsFlDZT/0O8/N1+w3iCRv8R0GWunJTuPJ1bNd6gYQPMIqvwEaAn9SqhgvVcN7bv
	GE53s+/ZX2hVh8k1tO7uQnL5G/FrnFwYndCBeCY/FxdF5IXK3GLj7aqPty3M54DmR6bV
	z/9A==
X-Gm-Message-State: AIkVDXKzNyW0ePl6OBFsI3QMS6D5ScAD/movEQ8BTS1AHJBNsXcm13+cJclXMz+kzigMjdym4fFaG9GbjIIj9Sl/
X-Received: by 10.200.53.247 with SMTP id l52mr24366348qtb.144.1485180264536; 
	Mon, 23 Jan 2017 06:04:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 23 Jan 2017 06:04:04 -0800 (PST)
In-Reply-To: <1485178169-27145-1-git-send-email-schnitzeltony@googlemail.com>
References: <1485178169-27145-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jan 2017 14:04:04 +0000
Message-ID: <CAJTo0LYogrcREAzmPUdBwcP6Yx5e-oZEBOTL1EnpVD9jwg=XiA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] alsa-lib: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Mon, 23 Jan 2017 14:04:24 -0000
Content-Type: multipart/alternative; boundary=001a1142ba2018c59f0546c37ac3

--001a1142ba2018c59f0546c37ac3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23 January 2017 at 13:29, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
wrote:

> +# no python -> smixer is not build
> +ALLOW_EMPTY_${PN} =3D "1"
>

Not sure this is the right fix.  What package does the Python support go
into?  The smixer files should be in that package, and the real dependency
on PN-dev is to libasound, not PN.  Can we fiddle the PN-dev RDEPENDS to
ensure that it depends on libasound instead of PN?

Ross

--001a1142ba2018c59f0546c37ac3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 January 2017 at 13:29, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony=
@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":3ih" class=3D"a3s aXjCH m159cb85301a79957">+# no python -&gt; smix=
er is not build<br>
+ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br></div></blockquote></div><br>Not su=
re this is the right fix.=C2=A0 What package does the Python support go int=
o?=C2=A0 The smixer files should be in that package, and the real dependenc=
y on PN-dev is to libasound, not PN.=C2=A0 Can we fiddle the PN-dev RDEPEND=
S to ensure that it depends on libasound instead of PN?</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1142ba2018c59f0546c37ac3--
