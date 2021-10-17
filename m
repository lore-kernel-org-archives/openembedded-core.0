Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <e4e32689f8bddb5de2f34b156620cd9cef488cdf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] webkitgtk: add gperf-native to DEPENDS to fix build
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Sun, 17 Oct 2021 13:03:20 +0100
In-Reply-To: <20211017115703.3801301-1-schnitzeltony@gmail.com>
References: <20211017115703.3801301-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, openembedded-core@lists.openembedded.org

On Sun, 2021-10-17 at 13:57 +0200, Andreas Müller wrote:
> >   Could NOT find Gperf (missing: GPERF_EXECUTABLE) (Required is at least
> >   version "3.0.1")
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.34.0.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb b/meta/recipes-
> sato/webkit/webkitgtk_2.34.0.bb
> index 25e1d422cc..a8e067147c 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> @@ -32,6 +32,7 @@ CVE_PRODUCT = "webkitgtk webkitgtk\+"
>  
>  DEPENDS = " \
>            ruby-native \
> +          gperf-native \
>            cairo \
>            harfbuzz \
>            jpeg \

Out of interest, why are you seeing that and the automated testing isn't?

Cheers,

Richard


