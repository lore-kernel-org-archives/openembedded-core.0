Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id F1F5B601A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 17:14:09 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id z76so33961827iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 09:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B6CY6Iff0KOVBjzwwo5goMlqCeRevja69UR2lTDqpJg=;
	b=h6SUUQAwg0YeYzqm3PUAlBvxebZgOQPJPjKcDOaWbeNP9K6KxbQ8K6s3/olUM71pcI
	WyG2WZg/E0lfvX4+fD0teObf1JEuWF1tllJiZP1PDx6kt8jeleSRUq7MOlVAE430KvhK
	B4BkJraJLPJg+BQAzbLJhx3b8qFE8IH5dC7IiiBDtREBNxxFDkvRisSSAuuaT6G7WU0o
	Rk4RdRi/boeObF8w+ElC68rVEUjViJrWYgMvsPxNjC1NRXWZoU4UTQjNz8mE5cwu+qrj
	QG5kHmoyujve7+eXtoZcL47deWis8Ph9orSQA8VkGGshPiCBjNH2zUK43IAauP156964
	IDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B6CY6Iff0KOVBjzwwo5goMlqCeRevja69UR2lTDqpJg=;
	b=X5WF5n7tRJwtgsczBL5xn+/xZuFavO1fUFrAMzu9UeoJUjzQUwi6O/keV4N17/ZgSQ
	TCUfm76CJEjtomosaX8RrLSAqDPXrRz4HBDWe6xhb5RfLTh31PSjXVfC3bZVaz/RSiA2
	6CfoxypaHrNfWvSWxe3ZTBo6hlvtaU73EFNmgz8hE+a1faUNQBMUNzhJwkoo9U3L/mJB
	GjI8+ho4OgytFFwZE36fBnaAvd9ybWWwvzbSMsdJSEh29Dut9RS/CpwIUEc+nNNJKrDT
	cpLbuIOrddQUEQA83KtAQslo8XSR65A1rKfc+++h9HOdLvCyos77vnr57KFFS23xoKPJ
	Vm+w==
X-Gm-Message-State: AD7BkJJ3mfd8w6vqbpcGdN14P3wPrYdW8aIAe8yryyFiDlZbajEsSxXXoTjhwrBf5wZsqzzF0kohAfQOLSl04zD5
X-Received: by 10.107.16.19 with SMTP id y19mr14140165ioi.148.1457457250209;
	Tue, 08 Mar 2016 09:14:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 8 Mar 2016 09:13:50 -0800 (PST)
In-Reply-To: <CABcZANnVfCAK3dXoGjbhYXs+=qJw9C1WcD3tZA76=TA+eOiTpA@mail.gmail.com>
References: <1457392718-14397-1-git-send-email-sgw@linux.intel.com>
	<CABcZANnVfCAK3dXoGjbhYXs+=qJw9C1WcD3tZA76=TA+eOiTpA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Mar 2016 17:13:50 +0000
Message-ID: <CAJTo0LYZi+eiNL1Kz73u0id5sCCkJ_+03R3njhuSH52d=2zYhw@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] no-static-libs: Ensure correct whitespace is set for _append
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
X-List-Received-Date: Tue, 08 Mar 2016 17:14:10 -0000
Content-Type: multipart/alternative; boundary=001a113fd1eaaca915052d8cb5af

--001a113fd1eaaca915052d8cb5af
Content-Type: text/plain; charset=UTF-8

On 8 March 2016 at 16:57, Christopher Larson <clarson@kergoth.com> wrote:

> Just a note that doing it this way will result in do_configure checksums
> changing for everything when no-static-libs gets included, even if
> DISABLE_STATIC is explicitly set to the empty string, as there'll be a
> trailing space always added to EXTRA_OECONF. If that's okay, so be it, but
> I wanted to make sure it was considered.
>

Mostly agreed.  The libical change is right, but keeping the no-impact
behaviour for the DISABLE_STATIC variable seems like the right thing to do.

Ross

--001a113fd1eaaca915052d8cb5af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 March 2016 at 16:57, Christopher Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Just a =
note that doing it this way will result in do_configure checksums changing =
for everything when no-static-libs gets included, even if DISABLE_STATIC is=
 explicitly set to the empty string, as there&#39;ll be a trailing space al=
ways added to EXTRA_OECONF. If that&#39;s okay, so be it, but I wanted to m=
ake sure it was considered.<div></div></div></blockquote></div><br>Mostly a=
greed.=C2=A0 The libical change is right, but keeping the no-impact behavio=
ur for the DISABLE_STATIC variable seems like the right thing to do.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a113fd1eaaca915052d8cb5af--
