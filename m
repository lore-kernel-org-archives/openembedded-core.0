Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9F28F6CA54
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 05:37:45 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id ar20so8752394iec.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 22:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=vHZGT9Td8W3fLel0O1JiMmG2FeAM8Q7ugh/P2gntKCQ=;
	b=DJXLGJqzUK5ND7moh/kd8cM14IO6GUU7JXa+Req2tGnrBmVPEJ33bFjFX9OeXXZWXg
	kPZq5hlalPUckdEcG5FNleMSqLqiRI85EJMpvay/KbBF6U5qatgOWcTy2eVu0nfTC1Re
	v3s+fOdvLaDRxEkFcYV5gz646hpfYl5utC0o+e4i9xWAESD9g+1tqwEO/9nKMsYzUUdj
	IrzzgWp+NlS8pmODUPtGLnQ5ZoZJRbo/yp7fGQwnK6Nl8BiVHt694pnva04cQ3RvetSd
	2pqF//kic9gH6BdTC0x2j12jp2hKbstgfBKoZ9t9Dy/gm2/SHoZRK1SEqeg3KzN/MS9y
	7QKg==
X-Received: by 10.42.62.196 with SMTP id z4mr26745848ich.49.1396330665725;
	Mon, 31 Mar 2014 22:37:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Mon, 31 Mar 2014 22:37:15 -0700 (PDT)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B3A7EBE@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3A7EBE@post.tritech.se>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Mar 2014 22:37:15 -0700
Message-ID: <CAMKF1spy5NzfaLVfnUL_tMS_iqT7EE6NE++SUnb4BvVatgpL+Q@mail.gmail.com>
To: =?UTF-8?Q?Mats_K=C3=A4rrman?= <Mats.Karrman@tritech.se>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] Make ppce300c3 tune hard-float by default
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
X-List-Received-Date: Tue, 01 Apr 2014 05:37:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Mats

On Fri, Mar 28, 2014 at 9:43 AM, Mats K=C3=A4rrman <Mats.Karrman@tritech.se=
> wrote:
> +# glibc configure options to make use of 603e specific sqrt/sqrtf routin=
es
> +GLIBC_EXTRA_OECONF +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300c=
3", "--with-cpu=3De300c3", "", d)}"

looks good, may be the comment above can be more explanatory saying that
glibc aliases e300c3 sqrt/sqrtf to 600e versions

