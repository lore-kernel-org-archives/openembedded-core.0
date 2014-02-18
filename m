Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id D760B6EB0A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 16:53:40 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id ar20so2833339iec.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 08:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4sH/GmoDX0qeH0BZlT23NomPSzKZn3pRd47eASkAvLQ=;
	b=IPoknmMBSeGxtLIWU6asmM4fOdU5cANXClgss7YPXb0cucHb0/0vtO2nX4Bh6WYdiQ
	2QgrXP0G5bjw52pIE91AwJtGZIsCrCB3sybIcr+2tikN9bDPu0sPtTXlWea8J4H5hkGx
	Y2INNwI9iwtsTJjmMLcRs8p2aF/637MTQOhG3zvDKy2eb9RPSZR8/ONMdLLVjkxIgkir
	t7s6pspEot1fu2z7Ur2KS09tu6aiD5V6TiNS1kogOjsu1NznaPjDHbxnoYCX/ZXY7P32
	Nb1u99W/t9o2fvmTnC//Np5MqEmvHbte73WjHi8pHU/yuz/5R/eMFOJhVPbFJnqSnpx7
	gu5w==
X-Received: by 10.43.182.74 with SMTP id pl10mr1428280icc.70.1392742421542;
	Tue, 18 Feb 2014 08:53:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Tue, 18 Feb 2014 08:53:11 -0800 (PST)
In-Reply-To: <1392742198-23333-1-git-send-email-diego.sueiro@gmail.com>
References: <1392742198-23333-1-git-send-email-diego.sueiro@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Feb 2014 08:53:11 -0800
Message-ID: <CAMKF1sox1wFEdRx2tdox_fAqVx_VGZwz_OEU=+02wzRaAcYP6Q@mail.gmail.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-toolchain-qt[e]: add qt4[-embedded]-staticdev
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
X-List-Received-Date: Tue, 18 Feb 2014 16:53:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 18, 2014 at 8:49 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> libQtUiTools[E].a needs to be installed on toolchain.
> qt4[-embedded]-staticdev is the package which provides this library.
>
> Signed-off-by: Diego Sueiro <diego.sueiro@gmail.com>
> ---
>  meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> index fc1ccba..b040182 100644
> --- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> +++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
> @@ -33,4 +33,5 @@ RDEPENDS_${PN} += " \
>          libqt${QTLIBPREFIX}xmlpatterns4-dev \
>          libsqlite3-dev \
>          expat-dev \
> +        qt4${QTLIBPREFIX}-staticdev \
>

hmmm you just want this 1 static library not all. So lets first
package the .a into a package of its own and then include that instead
          "
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

