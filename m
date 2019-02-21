Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id A53CB7CBAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 14:57:52 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id j5so9446275pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 06:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=sGTuJRPupOkpX543ZkrstOAtKko5dZAaYuM0Zzy/udk=;
	b=ie5sZAr+DI5HRDEItF+z3FTHRT90KMIbUl3SzWKFCUszi/9+bTqXhnWMdUWQics/uF
	rH7ryDWEwuupHAxSkNpEpjWvna4eoFJQasjPjqB1t87Acmw+2CR2fsuJyeutrE1cFHxY
	m23NcCYo7OKysMX5gAKACNN+rwVhBogo5K14659/laYR1NDONKHQkv6Ximrrly0LyOgk
	6xAp9qnfit8QVxBUsHbXmeYN8krmpi5DaHUm1Sris4r3UIInFTGGyhdxuUrRB3VZsHQV
	2oie7p4Ql/EWdJNzLAU2DimfbVd2IhwkhJGJWxsQugnCP4jMQT/R8o2YznNsitK1m+v4
	sa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=sGTuJRPupOkpX543ZkrstOAtKko5dZAaYuM0Zzy/udk=;
	b=CSTS6LPnRRXVCwgY8zjijjxWt2f1SEOZWTLbzJnjme++UBMzmsGPsnzAI39WIbLvVg
	svcNWdWjpEgN4vgFpzsqJpJqJEmyyGzyU1wBDbYokaRzZmomxi96RZk2L8s6CiIPH9lF
	6WoByQcXAXuREg71koK9Ug1QlVeqpvhz7hAE/ymmXmJwYyWTOg0PIB4SJ02z+DdDXAVi
	XrqsszDRcZYEsPvuHBjpBot2pLACkJJqZ7p8L7JiJg69vrdY9347bTtxcfi8Ei8P4tdZ
	eOCQYORjeol6S34inXgUdZSogoQm+Ur283RXZ1zJr2Blo1EYstpk9fOpnlvPAuEGlSID
	0hWw==
X-Gm-Message-State: AHQUAua6fKYN16PAf4nqAjOvL+bDX1w3EsZolrQYSNr7V/uQGdgceRoF
	+7DX9xm9DQlVf4x7ObE7qLwSPe4T
X-Google-Smtp-Source: AHgI3IaU/sgvopwVULJWD5eWuGINsZtKNJqAtT5SBna1OlFSX1+6xOYJ7RfxNqfGn5p8qR9JZHjOgA==
X-Received: by 2002:a63:e447:: with SMTP id i7mr34583954pgk.70.1550761073399; 
	Thu, 21 Feb 2019 06:57:53 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:f89a:1cd7:1eb2:3c81?
	([2601:202:4180:c33:f89a:1cd7:1eb2:3c81])
	by smtp.gmail.com with ESMTPSA id
	e9sm83361214pfh.42.2019.02.21.06.57.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 06:57:52 -0800 (PST)
To: Hoang Anh Tuan <tuanha@viosoft.com>,
	openembedded-core@lists.openembedded.org
References: <f4138dfe-562a-b30d-89bd-cde546bfc762@viosoft.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <dd5bcd00-9995-9f65-bf36-657a737a33eb@gmail.com>
Date: Thu, 21 Feb 2019 06:57:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <f4138dfe-562a-b30d-89bd-cde546bfc762@viosoft.com>
Subject: Re: [meta-oe] [PATCH 2/2] gtkwave: add version 3.3.98
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
X-List-Received-Date: Thu, 21 Feb 2019 14:57:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2/20/19 11:33 PM, Hoang Anh Tuan wrote:
>
> Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>

Wrong ML, please send to openembedded-devel@lists.openembedded.org
> ---
>  meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb | 19
> +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
>
> diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> new file mode 100644
> index 0000000..6fd9392
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "VCD (Value Change Dump) file waveform viewer"
> +DESCRIPTION = "gtkwave is a viewer for VCD (Value Change Dump) files
> which are usually created by digital circuit simulators. (These files
> have no connection to video CDs!) "
> +HOMEPAGE = "http://gtkwave.sourceforge.net/"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
> +
> +SRC_URI = "http://gtkwave.sourceforge.net/${PN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "eac3073ef381e0c09da33590296ca37f"
> +SRC_URI[sha256sum] =
> "efa6bbbeb3bd54104425a69a2aa0d079bb5c3ecc1c420ba57dcaa1c97c5a22f6"
> +
> +inherit pkgconfig autotools gettext texinfo
> +DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf
> glib-2.0"
> +RDEPENDS_${PN} = "tk-lib"
> +
> +EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS}
> --with-tk=${STAGING_BINDIR_CROSS}"
> +
> +FILES_${PN} = "${bindir} ${datadir}"


