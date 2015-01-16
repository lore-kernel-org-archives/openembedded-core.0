Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7176E722C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 20:00:15 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id i138so19026177oig.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 12:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eyg2hwpTSd5UZGLGbIDyvXRcAbEpZ3Hbko5QtzivLsM=;
	b=FJkgkcPmlvRfcg6JihX2OldoJSMwnRJ0A703hlmdujQ9nHyFB+fV9y6i+0lZJk9JXK
	0kWKfnzN9Enppg0l1pvlottF0J7Ao2riWKscfnbrEtFElpVE0aW8xRePNjyo36fpongh
	qDmK/+k1DYnHdDuxHDl/hZL//0YXqoSGtOIz5rbyml1721aK52kogm8a3sinrurJA9Qj
	KM9cCTTzwCg2upVqZJ4HgKtbZzuVV7UWg6l4gcZnqSheqtk4sUsp7oUXB0HfMEMsQcLZ
	7JFOowOeqsPcszWhoz03bYcAoHAssgy07N24heR9lFvLVWXzgWbI1DqxfplkUHDNtYAO
	ZEIg==
MIME-Version: 1.0
X-Received: by 10.202.203.76 with SMTP id b73mr3291222oig.29.1421438416236;
	Fri, 16 Jan 2015 12:00:16 -0800 (PST)
Received: by 10.202.227.10 with HTTP; Fri, 16 Jan 2015 12:00:16 -0800 (PST)
In-Reply-To: <1421420780-39453-1-git-send-email-maxin.john@enea.com>
References: <1421420780-39453-1-git-send-email-maxin.john@enea.com>
Date: Fri, 16 Jan 2015 12:00:16 -0800
Message-ID: <CAJ86T=XNHXcGd+u1nZt1ZVE3m6SRnw5iqx-tGu+xKDDrCZ6TtA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Maxin B. John" <maxin.john@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] curl: upgrade to 7.40
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
X-List-Received-Date: Fri, 16 Jan 2015 20:00:23 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 16, 2015 at 7:06 AM, Maxin B. John <maxin.john@enea.com> wrote:
> Upgraded version include fixes for these CVE bugs:
> 1. CVE-2014-8150
> 2. CVE-2014-8151
>
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  meta/recipes-support/curl/{curl_7.38.0.bb => curl_7.40.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/curl/{curl_7.38.0.bb => curl_7.40.0.bb} (93%)
>
> diff --git a/meta/recipes-support/curl/curl_7.38.0.bb b/meta/recipes-support/curl/curl_7.40.0.bb
> similarity index 93%
> rename from meta/recipes-support/curl/curl_7.38.0.bb
> rename to meta/recipes-support/curl/curl_7.40.0.bb
> index 85bd3be..209ed94 100644
> --- a/meta/recipes-support/curl/curl_7.38.0.bb
> +++ b/meta/recipes-support/curl/curl_7.40.0.bb
> @@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>  #
>  SRC_URI += " file://configure_ac.patch"
>
> -SRC_URI[md5sum] = "af6b3c299bd891f43cb5f76c4091b7b4"
> -SRC_URI[sha256sum] = "035bd41e99aa1a4e64713f4cea5ccdf366ca8199e9be1b53d5a043d5165f9eba"
> +SRC_URI[md5sum] = "8d30594212e65657a5c32030f0998fa9"
> +SRC_URI[sha256sum] = "899109eb3900fa6b8a2f995df7f449964292776a04763e94fae640700f883fba"
>
>  inherit autotools pkgconfig binconfig multilib_header
>

Perhaps also add a PACKAGECONFIG option for smb?

From the curl 7.40.0 changes:

http_digest: Added support for Windows SSPI based authentication
version info: Added Kerberos V5 to the supported features
Makefile: Added VC targets for WinIDN
config-win32: Introduce build targets for VS2012+
SSL: Add PEM format support for public key pinning
smtp: Added support for the conversion of Unix newlines during mail send
smb: Added initial support for the SMB/CIFS protocol
Added support for HTTP over unix domain sockets, via
CURLOPT_UNIX_SOCKET_PATH and --unix-socket
sasl: Added support for GSS-API based Kerberos V5 authentication


> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

