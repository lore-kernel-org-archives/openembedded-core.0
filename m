Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 9608577E76
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 13:15:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 37EF9209FD;
	Fri, 28 Apr 2017 09:15:06 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Fri, 28 Apr 2017 09:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=bxqUkq+wssz+JW7UNUlyjz69/N61LVXtYA+/Vv85asY=; b=XQzs0wlp
	P2eFuqE4klBRyKPvhHHmRScc0wq/d29Dp7WmzWK9J08Q63r9tZjrQGxIULk1cKo+
	TIaSKRyhTdvL4D9T217eUfK/G+pFvaSvWM3YFHyiKukRwNtQl73QcI8fJsiVZ0eX
	IJlnR5obavPbhNvf07peepr+pgfdjGvJ8SsGch96/SWMcifg4mUNtiLwRO9DZ61F
	KaX9xlJZsJjdf+xg86Jk6uDckXjhJUMJEbrepXJ34JCpHFETk23jMN2Alwv2qQCU
	2M0lvStmBtsC2TH8pJR68PYwK7E60dw8+h/yHdCWbTAQAq8CEzg8J2mP1yU5f3TN
	7Asq90ww16yrBg==
X-ME-Sender: <xms:WkADWSNTnevkOMsMB9KuCp5kEBIyseon1qqqCSAoe1apRRrL6jPG2g>
X-Sasl-enc: wC4WlQnkl4/IQWpKfXAeb2Q1F28fzaNkudraiiTW1YMs 1493385305
Received: from laptop (unknown [192.40.95.6])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7F8D07E6A3;
	Fri, 28 Apr 2017 09:15:05 -0400 (EDT)
Message-ID: <1493385304.3156.5.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Marc Ferland <ferlandm@amotus.ca>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 28 Apr 2017 16:15:04 +0300
In-Reply-To: <1493307588-14557-1-git-send-email-ferlandm@amotus.ca>
References: <1493307588-14557-1-git-send-email-ferlandm@amotus.ca>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH] speex: upgrade 1.2rc2 -> 1.2.0
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
X-List-Received-Date: Fri, 28 Apr 2017 13:15:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-04-27 at 11:39 -0400, Marc Ferland wrote:
> Upgrade speex to 1.2.0. Very small diff between 1.2rc2 and 1.2.0, mostly
> compiler warning fixes, tabs vs spaces, trailing whitespaces and one
> liners.
> 
> Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
> ---
>  meta/recipes-multimedia/speex/speex_1.2.0.bb  | 19 +++++++++++++++++++
>  meta/recipes-multimedia/speex/speex_1.2rc2.bb | 19 -------------------
>  2 files changed, 19 insertions(+), 19 deletions(-)
>  create mode 100644 meta/recipes-multimedia/speex/speex_1.2.0.bb
>  delete mode 100644 meta/recipes-multimedia/speex/speex_1.2rc2.bb
> 
> diff --git a/meta/recipes-multimedia/speex/speex_1.2.0.bb b/meta/recipes-multimedia/speex/speex_1.2.0.bb
> new file mode 100644
> index 0000000..fc020a2
> --- /dev/null
> +++ b/meta/recipes-multimedia/speex/speex_1.2.0.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Speech Audio Codec"
> +DESCRIPTION = "Speex is an Open Source/Free Software patent-free audio compression format designed for speech."
> +HOMEPAGE = "http://www.speex.org"
> +SECTION = "libs"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8 \
> +                    file://include/speex/speex.h;beginline=1;endline=34;md5=ef8c8ea4f7198d71cf3509c6ed05ea50"
> +DEPENDS = "libogg speexdsp"
> +
> +SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "8ab7bb2589110dfaf0ed7fa7757dc49c"
> +SRC_URI[sha256sum] = "eaae8af0ac742dc7d542c9439ac72f1f385ce838392dc849cae4536af9210094"
> +
> +inherit autotools pkgconfig lib_package
> +
> +EXTRA_OECONF = "\
> +        ${@bb.utils.contains('TARGET_FPU', 'soft', '--enable-fixed-point --disable-float-api --disable-vbr', '', d)} \
> +"
> diff --git a/meta/recipes-multimedia/speex/speex_1.2rc2.bb b/meta/recipes-multimedia/speex/speex_1.2rc2.bb
> deleted file mode 100644
> index f7d23db..0000000
> --- a/meta/recipes-multimedia/speex/speex_1.2rc2.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -SUMMARY = "Speech Audio Codec"
> -DESCRIPTION = "Speex is an Open Source/Free Software patent-free audio compression format designed for speech."
> -HOMEPAGE = "http://www.speex.org"
> -SECTION = "libs"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8 \
> -                    file://include/speex/speex.h;beginline=1;endline=34;md5=ef8c8ea4f7198d71cf3509c6ed05ea50"
> -DEPENDS = "libogg speexdsp"
> -
> -SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "6ae7db3bab01e1d4b86bacfa8ca33e81"
> -SRC_URI[sha256sum] = "caa27c7247ff15c8521c2ae0ea21987c9e9710a8f2d3448e8b79da9806bce891"
> -
> -inherit autotools pkgconfig lib_package
> -
> -EXTRA_OECONF = "\
> -        ${@bb.utils.contains('TARGET_FPU', 'soft', '--enable-fixed-point --disable-float-api --disable-vbr', '', d)} \
> -"
> -- 
> 2.7.4

Oh, I'm on speex-dev, and I missed the announcement of the new
version... The recipe reporting system didn't notice the new version
either, probably because it thought "1.2.0" is less than "1.2rc2". I
wonder if this will be a problem for package managers too...

It's hard to see from the patch what you changed. I've sent a couple of
similar patches before I discovered the diff.renames option in git. I
recommend you set diff.renames to "true" in your git configuration.

-- 
Tanu

https://www.patreon.com/tanuk

