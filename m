Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id C05116FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 14:32:57 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id o13-v6so11494626otl.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 07:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=I7BShdmaDPvRtmOFwQnFZE4/ssh2URjh37xQ+bZfaG8=;
	b=CDFEN0+BC6K/pAvK6MHcnD4TOZqTAbQX9ghnWSks8FyNXcSDQHwaiWm8NWdV92IEdi
	G77Z5C/mlLjc4ZO29i47e2dCgY2eZHvsTDVyWusVDCYJ9utNR2oxPe80QIdLDOi1vaDB
	oT816pCdRBQD2AkF6TihVvAUxhihaPXcWlIhD0MT7+emwdok7qKZTdFiJEX3Rd2NtIR3
	fGRbVu4pzSVXgKlnThz0sImEeEU0gZ/QJZGpdqud8BHL9OA4lBaN5ND9bxd93SWX4jRN
	3xXToEAn+geRqeWxQQkXExpsIbSnlUio3ilC+qKe4LNKHDI08hOjKTkL55G5CNB3NbEX
	bXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=I7BShdmaDPvRtmOFwQnFZE4/ssh2URjh37xQ+bZfaG8=;
	b=LT7Y1OWXpDlQ39eQ4YtcliGl8dKNJ9mlW91A98iHb8ba+oTB+VZ24Isb5d2mBc5xtm
	RMf0KCP2IJXRoZSYEQGczthOVqU6GDt+dbSUWIIwaiTDMrSYe0LViOqULa2gIdI+m8X2
	42sCO10wQSDHOb+qCIOX08E4bd36ttlf+Vrser2qfOUAEtHs6CR8XzrKBWWaVlWPbx0g
	odmu9g2wgETiJfcHcFbpszQsCGvT0KnKMP3bq6BO4Ydz6y1LJrqu5+SBIj7Jo6cEodsb
	FoIVl7K87Iwineprz2UWNKjxKMOKvX6H2I/xmtb2NMc1i0dEN0JsCsNncQWzQvyo3SKV
	epZg==
X-Gm-Message-State: APzg51C2//f9zWbfAv7sPIKjCHyJNDPnawQomTjljQsL2zaviWhhUhiw
	8jyL6S4f5/vO3S20ibLHk9M8ES3M/+8uR4xb66Zu3a5n
X-Google-Smtp-Source: ANB0VdbrD7wZf/w1Ip2VtMGNYP7bvWOwj52/AEShekK6KlHQeEhTnVGgmtsXKTG220jSwqgI3t3xvL3v8krciPTpRUg=
X-Received: by 2002:a9d:4ea:: with SMTP id 97-v6mr11862978otm.99.1537194778691;
	Mon, 17 Sep 2018 07:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20180917134140.4558-1-andrej.valek@siemens.com>
In-Reply-To: <20180917134140.4558-1-andrej.valek@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Sep 2018 15:32:47 +0100
Message-ID: <CAJTo0LbE8a1u_t7f813dX-ZTc9cdm-MnP=sYafAVYPfPJpYzyA@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] unzip: add nativesdk support
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
X-List-Received-Date: Mon, 17 Sep 2018 14:32:58 -0000
Content-Type: text/plain; charset="UTF-8"

No need to bump PR.

Ross
On Mon, 17 Sep 2018 at 14:42, Andrej Valek <andrej.valek@siemens.com> wrote:
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/recipes-extended/unzip/unzip_6.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
> index a47491ea4a..4a5f8e960e 100644
> --- a/meta/recipes-extended/unzip/unzip_6.0.bb
> +++ b/meta/recipes-extended/unzip/unzip_6.0.bb
> @@ -4,7 +4,7 @@ SECTION = "console/utils"
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=94caec5a51ef55ef711ee4e8b1c69e29"
>  PE = "1"
> -PR = "r5"
> +PR = "r6"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz \
>         file://avoid-strip.patch \
> @@ -60,4 +60,4 @@ ALTERNATIVE_PRIORITY = "100"
>  ALTERNATIVE_${PN} = "unzip"
>  ALTERNATIVE_LINK_NAME[unzip] = "${bindir}/unzip"
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

