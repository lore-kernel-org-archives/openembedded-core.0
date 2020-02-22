Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 737ED60B07
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 18:50:14 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id e9so2224720pjr.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 10:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=DbFtgkyLZVjLEiJFXa2ZLbvrd0lHo5W60rn31ck9H9o=;
	b=mdHP4BBMTqmp8DBN0WzyhcaDWQnrsgIEKqDeLtd2mTHpeNENR1ms4Z1+/vOCkyS+M6
	BirNBamJP3fC/n8x+Jg8/pc2S2sjwcbzyRL2htsm2T/8FQgTFVGoeYOhsdg63INnGdXi
	68PVpxIjNkq8m/4L5jLKCI61ao+9id1HkQ20vmqDbV+3S2vUcegqixqRenh/vlP0pU9w
	P0kYk9nSEiKJTaKey1qaNPIMbbNiC9icxLZDIuEh1epIChL8QT9mj29bR93eYtuzoUyA
	TLNRbmubIbh8j7fWTl5EoiXkJgdPjYdrEwCXvctRJ80nIwsOzt4V7mfZeEpph9bT09iC
	SCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=DbFtgkyLZVjLEiJFXa2ZLbvrd0lHo5W60rn31ck9H9o=;
	b=mdnbe/Ugg2Nn5EfCXfNsSKfPxMqa5n4enHMEKO3nj+yamQA09mksgmMHMd0V3lakXt
	1gzJW+/I9m9R5Qk3o3Iwm6aa9ZbsXuCzAVZSiGhryiFWxREvdYC+xyajUmCKlDcTxf2Z
	rY5YkQHkVKdyNOvB9swIpdhH8cHjhe0rv/E09s00k5wgzZBUySwXHBdXJ6STmlUm9R00
	Qo2zoae/8ErvMwsN5o5+rkRUqalTjoRGvSMEL5gtogX2FsGHwHkecokYqINXffdhVgqr
	nUuNxSP5r7jI7KQ2PtGYI5ZWi6HCEy12XpJkAV26Qho6lZ6RzAjZJM5x3oZlnZ+uhb0b
	s8KA==
X-Gm-Message-State: APjAAAUaqY9r8X6SaCUTI8hhrnrY9p7eo2RKV4wWPovDxuyn0Y6B+DVa
	zH4m8JR4Ranni0/3cW+9iEb6CaLi
X-Google-Smtp-Source: APXvYqzvXbGZ1OYjiLm3PmMG/nBOrN8DqbW0KEoGudqB1ovuxCqCdY8A8H2fs2kjHCfR1oOq/yDNlw==
X-Received: by 2002:a17:902:864a:: with SMTP id
	y10mr42798944plt.2.1582397415071; 
	Sat, 22 Feb 2020 10:50:15 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:f455:4f9:e4a2:b3f5?
	([2601:202:4180:a5c0:f455:4f9:e4a2:b3f5])
	by smtp.gmail.com with ESMTPSA id
	w26sm7111597pfj.119.2020.02.22.10.50.14
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 22 Feb 2020 10:50:14 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20200221210032.3414-1-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3a180667-45cb-a15a-8f6b-20d49802ee71@gmail.com>
Date: Sat, 22 Feb 2020 10:50:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221210032.3414-1-bunk@stusta.de>
Subject: Re: [zeus][PATCH 1/2] libxml2: fix CVE-2020-7595
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
X-List-Received-Date: Sat, 22 Feb 2020 18:50:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 2/21/20 1:00 PM, Adrian Bunk wrote:
> From: Anuj Mittal <anuj.mittal@intel.com>
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>

Is this a backport from Master? please include masters commit id.

Since Master and Zeus are at different versions, was there anything you
had to do to make this apply to Zeus?

I have adopted the kernel stable note of [Fixup for XXX context] so the
folks know things had to be tweaked from the original commit.

- Armin


> ---
>  .../libxml/libxml2/CVE-2020-7595.patch        | 36 +++++++++++++++++++=

>  meta/recipes-core/libxml/libxml2_2.9.9.bb     |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-7595.patc=
h
>
> diff --git a/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch b/met=
a/recipes-core/libxml/libxml2/CVE-2020-7595.patch
> new file mode 100644
> index 0000000000..facfefd362
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
> @@ -0,0 +1,36 @@
> +From 0e1a49c8907645d2e155f0d89d4d9895ac5112b5 Mon Sep 17 00:00:00 2001=

> +From: Zhipeng Xie <xiezhipeng1@huawei.com>
> +Date: Thu, 12 Dec 2019 17:30:55 +0800
> +Subject: [PATCH] Fix infinite loop in xmlStringLenDecodeEntities
> +
> +When ctxt->instate =3D=3D XML_PARSER_EOF,xmlParseStringEntityRef
> +return NULL which cause a infinite loop in xmlStringLenDecodeEntities
> +
> +Found with libFuzzer.
> +
> +Signed-off-by: Zhipeng Xie <xiezhipeng1@huawei.com>
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/comm=
it/0e1a49c89076]
> +CVE: CVE-2020-7595
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>=20
> +---
> + parser.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/parser.c b/parser.c
> +index d1c31963..a34bb6cd 100644
> +--- a/parser.c
> ++++ b/parser.c
> +@@ -2646,7 +2646,8 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt=
, const xmlChar *str, int len,
> +     else
> +         c =3D 0;
> +     while ((c !=3D 0) && (c !=3D end) && /* non input consuming loop =
*/
> +-	   (c !=3D end2) && (c !=3D end3)) {
> ++           (c !=3D end2) && (c !=3D end3) &&
> ++           (ctxt->instate !=3D XML_PARSER_EOF)) {
> +=20
> + 	if (c =3D=3D 0) break;
> +         if ((c =3D=3D '&') && (str[1] =3D=3D '#')) {
> +--=20
> +2.24.1
> +
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.9.bb b/meta/recipes-c=
ore/libxml/libxml2_2.9.9.bb
> index c44a90b1c2..5797dd6bee 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.9.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.9.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D "http://www.xmlsoft.org/sources/libxml2-$=
{PV}.tar.gz;name=3Dlibtar \
>             file://0001-Make-ptest-run-the-python-tests-if-python-is-en=
abled.patch \
>             file://fix-execution-of-ptests.patch \
>             file://Fix-CVE-2019-19956.patch \
> +           file://CVE-2020-7595.patch \
>             "
> =20
>  SRC_URI[libtar.md5sum] =3D "c04a5a0a042eaa157e8e8c9eabe76bd6"



