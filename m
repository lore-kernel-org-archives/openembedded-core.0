Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id A3FA270678
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 16:54:03 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id c1so3263511igq.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 09:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=lKRjV/RXlhhha2bGDkTT8H3qt418axjQLDEscezVoWM=;
	b=DDkBnFrWCbBp2nBqxworDvdwuh/nutY+cSks41rkOhaIAurZg2RxAfaHExMkaxyOTq
	TJJx2eTvLggktaesOphRyDDUoUTzRkvSyMfWKII8xQWb4bRUa4JIWxCeqZwUF3ac7eY3
	EZu6FtirztBg7oKbtH8Q3M2S7NepHO7FEDfixAWRdEyt68FpcvLwDtIe6htwjbbxNOjE
	2oZH/NwVGpC4z3J/ukcNFld+mviWmYxT1LdXGyeUYHASyQqwCcZHorjFnFUnWg4Fsxfy
	HVz58Kr3/1gZHAbBLgtCMuivqENrDG7WZXfTM8ZSB1ayMyzXaSDkuGplDrwfH+z/IQCe
	tbuA==
X-Gm-Message-State: ALoCoQnGBWObYhpr7H7Qj59MFRvyEL5KMqO9/yiwPUX5nRqsHADMEvgdtd3YbR9ezJggsK57SEef
X-Received: by 10.50.25.196 with SMTP id e4mr29753433igg.28.1405616043460;
	Thu, 17 Jul 2014 09:54:03 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id v8sm7996020igh.19.2014.07.17.09.54.01
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Jul 2014 09:54:02 -0700 (PDT)
Message-ID: <53C7FFA7.5060001@linaro.org>
Date: Thu, 17 Jul 2014 12:53:59 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1405095061-29714-1-git-send-email-trevor.woerner@linaro.org>
In-Reply-To: <1405095061-29714-1-git-send-email-trevor.woerner@linaro.org>
Subject: Re: [PATCH] grub_git: bump version, remove patch
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
X-List-Received-Date: Thu, 17 Jul 2014 16:54:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

ping?

On 07/11/14 12:11, Trevor Woerner wrote:
> A previously upstreamed patch has been applied. Bump the version to
> incorporate this upstream update.
>
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> ---
>  .../grub/grub/asciih-fix-build-warning-error.patch | 34 ----------------------
>  meta/recipes-bsp/grub/grub_git.bb                  |  3 +-
>  2 files changed, 1 insertion(+), 36 deletions(-)
>  delete mode 100644 meta/recipes-bsp/grub/grub/asciih-fix-build-warning-error.patch
>
> diff --git a/meta/recipes-bsp/grub/grub/asciih-fix-build-warning-error.patch b/meta/recipes-bsp/grub/grub/asciih-fix-build-warning-error.patch
> deleted file mode 100644
> index 48ace56..0000000
> --- a/meta/recipes-bsp/grub/grub/asciih-fix-build-warning-error.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -util/grub-gen-asciih.c: fix build warning->error
> -
> -A potential problem is flagged by the compiler and generates a warning. This
> -warning is promoted to an error via -Werror. This patch fixes the original
> -issue, avoids the warning, and therefore avoids the build error.
> -
> -Upstream-Status: Pending
> -
> -Index: git/util/grub-gen-asciih.c
> -===================================================================
> ---- git.orig/util/grub-gen-asciih.c
> -+++ git/util/grub-gen-asciih.c
> -@@ -131,6 +131,8 @@ write_font_ascii_bitmap (FILE *file, FT_
> -   struct grub_glyph_info glyph;
> -   int char_code;
> - 
> -+  memset (&glyph, 0, sizeof(glyph));
> -+
> -   fprintf (file, "/* THIS CHUNK OF BYTES IS AUTOMATICALLY GENERATED */\n");
> -   fprintf (file, "unsigned char ascii_bitmaps[] =\n");
> -   fprintf (file, "{\n");
> -@@ -144,6 +146,12 @@ write_font_ascii_bitmap (FILE *file, FT_
> - 	return;
> -       add_glyph (glyph_idx, face, char_code, &glyph);
> - 
> -+      if (glyph.bitmap == 0)
> -+        {
> -+          fprintf (stderr, "grub-gen-asciih: add_glyph not successful");
> -+          exit (1);
> -+        }
> -+
> -       if (glyph.width == 8 && glyph.height == 16
> - 	  && glyph.x_ofs == 0 && glyph.y_ofs == 0)
> - 	{
> diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
> index 7f89739..f74bae8 100644
> --- a/meta/recipes-bsp/grub/grub_git.bb
> +++ b/meta/recipes-bsp/grub/grub_git.bb
> @@ -17,11 +17,10 @@ DEFAULT_PREFERENCE = "-1"
>  DEFAULT_PREFERENCE_arm = "1"
>  
>  PV = "2.00+${SRCPV}"
> -SRCREV = "4b8b9135f1676924a8458da528d264bbc7bbb301"
> +SRCREV = "87de66d9d83446ecddb29cfbdf7369102c8e209e"
>  SRC_URI = "git://git.savannah.gnu.org/grub.git \
>             file://autogen.sh-exclude-pc.patch \
>             file://grub-2.00-add-oe-kernel.patch \
> -           file://asciih-fix-build-warning-error.patch \
>            "
>  
>  S = "${WORKDIR}/git"


