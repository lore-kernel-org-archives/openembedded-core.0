Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id BA18774D7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 14:55:02 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id c9-v6so14616446iob.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 07:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rTZYh9w6DWyOAqJBG2OMLfKlZJChOMlwE700xPBiLbA=;
	b=PjimH0f3C9//xvp/J3h/70z/s7UTsJMh1fsheqxqCX5ohfW0DaLySi9tNNBDNfRj7P
	oNUqobo76ldidvMWKACqHHXIjsQCU5aGnGjofXWLxjhotS+ZNQWBDGLp5hfK/OFFv7v1
	jG0l5OYU42m3pYKn3HX88Gu4n+cUApe7hXdlqGG6EHFTRLtVIUbXSggAOy+LEXPR+W06
	c+3Fw+Kj8DcdLxb8A1QiW8dULhDcM+O9WEjNaJkpOPZoy0u1G6E9ZGUlY55vM5RDvxFe
	2D9xp2/gZENBlJxLSt/3GXfLgoitHMy0bf8vI3mgMIS0jzz5qxEtECSO66VWSlwey76Q
	nOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rTZYh9w6DWyOAqJBG2OMLfKlZJChOMlwE700xPBiLbA=;
	b=sXQD5jn8vFfe7c2Hk4dN8KpU3lVjR10wRgqtav6jwR5eopP1G4wNdJhtlPkBmpLxPR
	2XZoMllyz12LCUbvJrupzSRYvPHKnkrBw8ogEz8OSLoQvsotybbzHqpJRJMQxM8fc6F0
	czgo8zXnG782t4DutQeKcnEajXj3AI1SulO/jxHDPg6Xcn6ykLlhntn43Rr+G71t89GS
	YUCmxuHIy4f5x6r9tUONnCsBfqeF9Xrfoo3LiaUmFYGu9NdOdkDbgRAh0hKihiVP/6zr
	d0We/JtKi2uuQLba3wP3bNWSG8F6iqqLV5i62X8AUD0h6MjGfQ/DYeY2rJCX8tHzYnpj
	fsmA==
X-Gm-Message-State: ALKqPwesHhXfdLpU+9FmwjvFm9saJxfYMp8j1ziLBzUth6yLUWz/cteK
	4ySWfDQAdLZ4hIB4hbFBtMGatfb74iSG7VcSzxkSJQ==
X-Google-Smtp-Source: AB8JxZoo4kay6cXEXWgOvaair9L3GDha6RaUUya+EVZP8PYOqF+krLXmu0wAK/jhm5uqGzTv7hw01TuXJane0O9wZdY=
X-Received: by 2002:a6b:248e:: with SMTP id
	k136-v6mr20783412iok.270.1526914503521; 
	Mon, 21 May 2018 07:55:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Mon, 21 May 2018 07:54:42 -0700 (PDT)
In-Reply-To: <20180521133742.15994-1-raj.khem@gmail.com>
References: <20180521133742.15994-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 May 2018 15:54:42 +0100
Message-ID: <CAJTo0LZh_zqn4wb=BsRsYR3PC43fHLtkOR5PdpDm8w7HgW2PBg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] webkitgtk: Upgrade to 2.20.2
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
X-List-Received-Date: Mon, 21 May 2018 14:55:02 -0000
Content-Type: text/plain; charset="UTF-8"

My patch metrics[1] will love you if you can replace that patch with a
backport...

Ross
[1] http://www.burtonini.com/temp/status/

On 21 May 2018 at 14:37, Khem Raj <raj.khem@gmail.com> wrote:
> Patch it to build with clang
>
> clang 6.0+ driver can correclty detect corss gold linker now
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> V2:
> - Remove code to disabel gold with clang instead of commenting, and descrive the removal
>
>  .../0012-soup-Forward-declare-URL-class.patch | 31 +++++++++++++++++++
>  ...ebkitgtk_2.20.1.bb => webkitgtk_2.20.2.bb} |  6 ++--
>  2 files changed, 34 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.20.1.bb => webkitgtk_2.20.2.bb} (96%)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch b/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
> new file mode 100644
> index 0000000000..c689117650
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
> @@ -0,0 +1,31 @@
> +From 59f6903ad96f3213f248b672d5fd526cc0d666ce Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 20 May 2018 14:28:27 -0700
> +Subject: [PATCH] soup: Forward declare URL class
> +
> +This helps getting away with compiler errors seen with clang
> +
> +/mnt/a/oe/workspace/sources/webkitgtk/Source/WebCore/platform/network/soup/SoupNetworkSession.h:68:62:
> +error: unknown type name 'URL'
> +    static std::optional<ResourceError> checkTLSErrors(const URL&,
> +GTlsCertificate*, GTlsCertificateFlags);
> +                                                             ^
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Source/WebCore/platform/network/soup/SoupNetworkSession.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Source/WebCore/platform/network/soup/SoupNetworkSession.h b/Source/WebCore/platform/network/soup/SoupNetworkSession.h
> +index 03bd72ba..7ca8792d 100644
> +--- a/Source/WebCore/platform/network/soup/SoupNetworkSession.h
> ++++ b/Source/WebCore/platform/network/soup/SoupNetworkSession.h
> +@@ -43,6 +43,7 @@ namespace WebCore {
> +
> + class CertificateInfo;
> + class ResourceError;
> ++class URL;
> + struct SoupNetworkProxySettings;
> +
> + class SoupNetworkSession {
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
> similarity index 96%
> rename from meta/recipes-sato/webkit/webkitgtk_2.20.1.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
> index 360ab8e69b..a68a69f43c 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.20.1.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
> @@ -21,10 +21,11 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
>             file://0001-Fix-build-with-musl.patch \
>             file://detect-gstreamer-gl.patch \
> +           file://0012-soup-Forward-declare-URL-class.patch \
>             "
>
> -SRC_URI[md5sum] = "0cd9b9ae1f48c04de5314f77806eceb4"
> -SRC_URI[sha256sum] = "43e43285fa4e393080cc4fbd5ad8644749a75b1e0b811b230b63ae56806c8959"
> +SRC_URI[md5sum] = "3fdda40dc10eb2a00d5fba4219b83967"
> +SRC_URI[sha256sum] = "dffe93a241f03f1c73b369f4e323e4d8f12e39d33d5515948cbf454ca4b526e2"
>
>  inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
>
> @@ -85,7 +86,6 @@ EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
>  EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
>  EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
>  EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
> -EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
>
>  EXTRA_OECMAKE_append_aarch64 = " -DWTF_CPU_ARM64_CORTEXA53=ON"
>
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

