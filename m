Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4472360169
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 15:14:13 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id c9so6789146qcz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 07:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=II6CER0iN4iMXuWUqmKUCh8uW8wIHxnns+E3JXj9hFs=;
	b=MPXlylr5KdhfgfIX/d5A0gCnr7LpDESA6Nwjr0ZLo9yhELX+OuYGP0H6Er3E+X8zKH
	FK7nTfurS3Zx8Gs/eoEqfe4kRl6Y6b6j5HxKdbBStt7qTo033TW7viPkPRP8sTWhcd86
	FcOXMdM8sTomP/ccQNgvyfpsAstTPHcZByQpjr6nugoXnYYUXNiakWhIWXXoVD/ok2bC
	GZJky1+zetiy2fWwA6ppbv5fuuh4+IPNQxNb7u3y7RWN64fXvvzUrR7PYvqNoyMPqAxN
	BtcC6T82VVFZfhLGWYS2mEYbjSl/E7tA0DKwOHMW90W7IZDWw/T175ixYlN+Cd8+k+Kf
	XV0Q==
X-Gm-Message-State: ALoCoQkxdXVGjlcCdJCvJyZriHHANCuQnfOKI7f5MY5C04cisDe0xzC9mh/jFRmBrrdXvTnjR5dy
X-Received: by 10.224.24.132 with SMTP id v4mr9136223qab.17.1423149254359;
	Thu, 05 Feb 2015 07:14:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 5 Feb 2015 07:13:54 -0800 (PST)
In-Reply-To: <af9632a1314db8be121b76ca6144fa46137cc429.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
	<af9632a1314db8be121b76ca6144fa46137cc429.1422925725.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Feb 2015 15:13:54 +0000
Message-ID: <CAJTo0LaVfL3mN8d_EW804SSBWkMhRVikHYqpTMQR5wnmvNyOGg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/21] coreutils 6.9: fix unknown-configure-option
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
X-List-Received-Date: Thu, 05 Feb 2015 15:14:17 -0000
Content-Type: multipart/alternative; boundary=001a11c2b49ec4d4fb050e58c198

--001a11c2b49ec4d4fb050e58c198
Content-Type: text/plain; charset=UTF-8

Hi Robert,

On 3 February 2015 at 01:12, Robert Yang <liezhi.yang@windriver.com> wrote:

> -PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
> +PACKAGECONFIG[acl] = ",,acl,"
>

Introducing non-deterministic behaviour doesn't seem like a good idea.
Presumably we can seed the autoconf checks instead of passing configure
arguments? (see e.g. libice's arc4 option).

Ross

--001a11c2b49ec4d4fb050e58c198
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Robert,</div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On 3 February 2015 at 01:12, Rob=
ert Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
 target=3D"_blank">liezhi.yang@windriver.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div id=3D":e6" class=3D"a3s" style=3D"overflow:h=
idden">-PACKAGECONFIG[acl] =3D &quot;--enable-acl,--disable-acl,acl,&quot;<=
br>
+PACKAGECONFIG[acl] =3D &quot;,,acl,&quot;<br></div></blockquote></div><br>=
Introducing non-deterministic behaviour doesn&#39;t seem like a good idea. =
=C2=A0 Presumably we can seed the autoconf checks instead of passing config=
ure arguments? (see e.g. libice&#39;s arc4 option).</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c2b49ec4d4fb050e58c198--
