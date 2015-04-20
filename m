Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 106386AC24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 08:21:59 +0000 (UTC)
Received: by oblw8 with SMTP id w8so113651974obl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 01:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=F051CUtP5lWDl8UGCz45d4V1XtUDreJI5n8DcwELUdQ=;
	b=I2z/Nko9tmIwcMkUcEjkaIxD1612fnYwEi03klr7vpXw6TFOgIwfuobKUAupsl520p
	eFP2iuym4w1RHrHIB/1NpQg1HZsGKUh8MgBqBJgVu8ick+Wv+/7NsxBe+Sy3M6yQwjHt
	RW5ULGlSmMon8mQZwJjWkjlsc0iJFc6uqtsChLv8Y5erj4cUCSclhK0l679bUWFmX9Ds
	PDunNbv/7E5woQeXy90Hpvezqr/oISHTacOLVq4C+9sLT5WOVl5B0CPNMMNAczE1XRJp
	ONq1luekkge60Q9RR9ImHkZwGNeYLkBKzEnNrLdjkrZQ4brys1aDKShsUO5V9TOa4V9f
	S3ww==
X-Gm-Message-State: ALoCoQlwopjd7nwQaa8c9kV8+Rf49rI7vfX6zCoiys/FnCqo2N3AGWnpcrGoK86vq75kJ5BtJEP5
X-Received: by 10.202.193.8 with SMTP id r8mr2794259oif.27.1429518120196; Mon,
	20 Apr 2015 01:22:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.177.67 with HTTP; Mon, 20 Apr 2015 01:21:30 -0700 (PDT)
In-Reply-To: <1429479956-27143-1-git-send-email-akuster808@gmail.com>
References: <1429479956-27143-1-git-send-email-akuster808@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 20 Apr 2015 11:21:30 +0300
Message-ID: <CAHiDW_F1HTv9As6rd=Y82ttPaeRnj99rTgtkeQtO7L0VtywGsg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lz4: fix QA issue
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
X-List-Received-Date: Mon, 20 Apr 2015 08:22:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 20 April 2015 at 00:45, Armin Kuster <akuster808@gmail.com> wrote:
> WARNING: Could not copy license file
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-support/lz4/lz4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/lz4/lz4.bb b/meta/recipes-support/lz4/l=
z4.bb
> index ee5de0a..0b0c632 100644
> --- a/meta/recipes-support/lz4/lz4.bb
> +++ b/meta/recipes-support/lz4/lz4.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Extremely Fast Compression algorithm"
>  DESCRIPTION =3D "LZ4 is a very fast lossless compression algorithm, prov=
iding compression speed at 400 MB/s per core, scalable with multi-cores CPU=
. It also features an extremely fast decoder, with speed in multiple GB/s p=
er core, typically reaching RAM speed limits on multi-core systems."
>
>  LICENSE =3D "BSD"

This is not directly related to your patch but I happened to take a
look at the source and the license seems wrong: The library is indeed
BSD but all the binaries are actually GPLv2 (see programs/COPYING and
the individual source files).

> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0b0d063f37a4477b54af2459477dc=
afd"
> +LIC_FILES_CHKSUM =3D "file://lib/LICENSE;md5=3D0b0d063f37a4477b54af24594=
77dcafd"
>
>  SRCREV =3D "5780864c0ce08622238a267c46fb489d7066cad4"
>
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

