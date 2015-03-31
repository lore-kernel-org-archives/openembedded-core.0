Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 81D4173CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 18:03:34 +0000 (UTC)
Received: by pacgg7 with SMTP id gg7so26700667pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 11:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Eo3UEtcErYUVtAGesYvIezeyjFAUIi+Zetn98qQeyq0=;
	b=nSUf7U+722cw9zEizy0U05xbHfE6a/l9nqOY+AvG4/QKQNjnBvCL4STY95jUUEuqOp
	Kmb9IH50oVnGAKfL3N+bQor//KdB5srh4sGY+Tw1hUo8TMvrbk+uW7Ze1Jsll+NX86D1
	FZETY8noFPHCLcs4HTAbBfuCqWfnoRFqdLyHnfRHY692JMWJWAoUzUXw6o25Q4BeJhSh
	q/ez1meBl+/GkBrZ9cYMzL28I3AFAx9fjrqFa5ZyRT/wpPloaeLGa6Hq6+rATceouf7F
	UzxMBc4NBbc1xKXIk29pgDQLs07n3Rj3oOrwvwvbDNqh87yaHHdyLCO6NPGlbJDPtWDj
	tx+w==
X-Received: by 10.70.134.234 with SMTP id pn10mr69808888pdb.144.1427825015977; 
	Tue, 31 Mar 2015 11:03:35 -0700 (PDT)
Received: from ?IPv6:2601:9:500:ece:6:cdb2:cfe6:6df6?
	([2601:9:500:ece:6:cdb2:cfe6:6df6]) by mx.google.com with ESMTPSA id
	jd5sm14602256pbd.35.2015.03.31.11.03.34
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 31 Mar 2015 11:03:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1427815329.14020.358.camel@linuxfoundation.org>
Date: Tue, 31 Mar 2015 11:03:34 -0700
Message-Id: <B13BA224-B90E-4C26-AEEE-EC91F065F143@gmail.com>
References: <1427815329.14020.358.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] siteinfo: Add x86_64-elf support
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
X-List-Received-Date: Tue, 31 Mar 2015 18:03:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Mar 31, 2015, at 8:22 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> Teach siteinfo about x86_64-elf so that baremetal toolchains =
parse/build.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/classes/siteinfo.bbclass =
b/meta/classes/siteinfo.bbclass
> index 2c1f9d0..5fd99bf 100644
> --- a/meta/classes/siteinfo.bbclass
> +++ b/meta/classes/siteinfo.bbclass
> @@ -95,6 +95,7 @@ def siteinfo_data(d):
>         "x86_64-linux": "bit-64",
>         "x86_64-linux-musl": "x86_64-linux bit-64",
>         "x86_64-linux-uclibc": "bit-64",
> +        "x86_64-elf": "bit-64=E2=80=9D,

is 32bit bare metal already taken care of ?

>         "x86_64-linux-gnu": "bit-64 x86_64-linux",
>         "x86_64-linux-gnux32": "bit-32 ix86-common x32-linux",
>         "x86_64-mingw32": "bit-64",
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


