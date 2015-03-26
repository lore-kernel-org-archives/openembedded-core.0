Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4C3866013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 12:46:04 +0000 (UTC)
Received: by qgf60 with SMTP id 60so77603301qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 05:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7lgwIXmWOF2+MQFttIwkRHLVfO7sCtAledUHhFa41g8=;
	b=bs3kHd2ucoIi7VOzR53hoBLCbnPMtZoSLzOgMw6FPaJryw1IwdsRxnAPDZC3tSU7ak
	Ucbrbt+zJZABmGUUteHTeg80wjk6E+upTRblNH5jTblLQISUmYRaTuBzKjGkBEeLIV3N
	5pVKrACqDYLYYM4oS8tT0F4vDcWwnQWyG+3m50Y40GifjJbp70NgyYL/DkCDCGbb45/u
	0eagfQlREULu8Haeqz9p4ILWUxmc6sa9wWEcjIfup7CmO3s44RBarDzh9eg7h78t62/k
	UgDHmustyyVJG5Ne8X2H+4rQvZNBYuqJ/FZdDxST4RIvuwnSIv4erolRdyrrjiETSZvM
	3k8Q==
X-Gm-Message-State: ALoCoQl3ZWtVcwWLIInmIgaItD0n0y7yoTwWpxWgcY8WljeekPo39xE5SVFH4bVwwHfbnf3mpmlb
X-Received: by 10.55.31.32 with SMTP id f32mr28979613qkf.41.1427373965298;
	Thu, 26 Mar 2015 05:46:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 26 Mar 2015 05:45:45 -0700 (PDT)
In-Reply-To: <1427322405-34441-1-git-send-email-anibal.limon@linux.intel.com>
References: <1427322405-34441-1-git-send-email-anibal.limon@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Mar 2015 12:45:45 +0000
Message-ID: <CAJTo0LbsqWcoddvK+xs=u0QQ7rDsn7=9eh5j+o2=KtP-v2MUDw@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lzop: Fix build using x32 ABI
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
X-List-Received-Date: Thu, 26 Mar 2015 12:46:06 -0000
Content-Type: multipart/alternative; boundary=001a1147b0dc29e55f0512306618

--001a1147b0dc29e55f0512306618
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25 March 2015 at 22:26, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel=
.com>
wrote:

> +PR =3D "r1"
>

No need to add a PR.

Ross

--001a1147b0dc29e55f0512306618
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 March 2015 at 22:26, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a =
href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.limon=
@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":ye" class=3D"a3s" style=3D"overflow:hidden">+PR =3D &quot;r1&quot=
;<br></div></blockquote></div><br></div><div class=3D"gmail_extra">No need =
to add a PR.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a1147b0dc29e55f0512306618--
