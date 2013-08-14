Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 4F4436007B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 12:05:03 +0000 (UTC)
Received: from LMUC430092 (lmuc430092.bmw-carit.intra [192.168.101.1])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 7813140016;
	Wed, 14 Aug 2013 13:04:40 +0200 (CEST)
From: "Lukas Bulwahn" <lukas.bulwahn@oss.bmw-carit.de>
To: "'Stefan Herbrechtsmeier'" <stefan@herbrechtsmeier.net>,
	<openembedded-core@lists.openembedded.org>
References: <1376470064-6391-1-git-send-email-stefan@herbrechtsmeier.net>
In-Reply-To: <1376470064-6391-1-git-send-email-stefan@herbrechtsmeier.net>
Date: Wed, 14 Aug 2013 14:05:03 +0200
Message-ID: <015801ce98e6$826796d0$8736c470$@oss.bmw-carit.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQKrYRA611gHUL0K9n7SR8qKDgTAUpfbCk9w
Subject: Re: [PATCH] cmake.bbclass: Don't use packages from the native	build machine
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
X-List-Received-Date: Wed, 14 Aug 2013 12:05:03 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: de

Hi Stefan,

I have been working with this patch for quite some time on my
OpenEmbedded-Core repository and I have not seen any problems, but I do =
not
know if it breaks anything on the complete 'bitbake world'.

Lukas

> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] Im
> Auftrag von Stefan Herbrechtsmeier
> Gesendet: Mittwoch, 14. August 2013 10:48
> An: openembedded-core@lists.openembedded.org
> Betreff: [OE-core] [PATCH] cmake.bbclass: Don't use packages from the
> native build machine
>=20
> Signed-off-by: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
> ---
>  meta/classes/cmake.bbclass |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass =
index
> 310242e..8e579a7 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -49,6 +49,7 @@ set( CMAKE_CXX_LINK_FLAGS
> "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )  # only search
> in the paths provided so cmake doesnt pick  # up libraries and tools =
from
the
> native build machine  set( CMAKE_FIND_ROOT_PATH
> ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR}
> ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH}
> ${EXTERNAL_TOOLCHAIN})
> +set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
>  set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )  set(
> CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )  set(
> CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
> --
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


