Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3270161055
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2013 17:59:18 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id x13so11514968ief.17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2013 10:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=7PWdh/3Fx20qRcbTQFPfDH4PO+aZi7+30e3bHCXWXj0=;
	b=pc+SJHi46MeFC2YkZfFfp+nHi8Z/sOZnBECPWOtoGS9YfhtuAvOf1rGx1inbRbo9xO
	DjpZa+4JUZcQquvw4iXlxOSnMuPZTJzE1FPFw3TjN+kL7cCt9Lac2uwPEZe12Lz3cxAJ
	C6AF34bUTqRQ1WFk1d/BxirTLHYD7fdNKXJZZNQzM9sYLtVq7hInKUS+B/X/vCm7Cd0v
	iwzmUj2+3AJiGUO3dgr/H1x7nHGOA1fhSFuBIWct8zbZXh56HouW2dYyRUcFmHMbQbaX
	BzQ0Al91xQsE7RjuPWHEz6dQmshCEwLWE1SsIXVcZ92NgXAHGUHjOa12xubtm1fHS/ym
	8LtA==
MIME-Version: 1.0
X-Received: by 10.43.162.136 with SMTP id mk8mr15638738icc.9.1381600759312;
	Sat, 12 Oct 2013 10:59:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Sat, 12 Oct 2013 10:59:19 -0700 (PDT)
In-Reply-To: <1381573062-29065-1-git-send-email-fathi.boudra@linaro.org>
References: <1381573062-29065-1-git-send-email-fathi.boudra@linaro.org>
Date: Sat, 12 Oct 2013 14:59:19 -0300
X-Google-Sender-Auth: CLtH4jJX3WiUg23I0VC7_Fk1EUA
Message-ID: <CAP9ODKoO7xmkw0X39a7J2gQdzsjneBHLbV6hyF2JKKrvCaKDVA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] openssl: add Aarch64 bie-endian support
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
X-List-Received-Date: Sat, 12 Oct 2013 17:59:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Oct 12, 2013 at 7:17 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
...
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> @@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
>
>  CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"

Please don't change PR here; this is not need anymore for general use
(but exceptions).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

