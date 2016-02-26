Return-Path: <net147@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 65F0D7017D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 14:06:48 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id q63so52674168pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 06:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=bAjSk1ZNdHWFjf/9cJLX9EHyL4aspv2w/HAE5ukzpBM=;
	b=Advemh8KrLsgmWax9TQ06bBRgFqjOe72xdjE26HxKRiaTlrpvdvvwaqcr2baQ7kSld
	ncshib4dRciiL6udvl6Og5maPSD+9OJeHcEG8K0v8y0ZbCD4gVAVIRDzpH+MVN9zv9bh
	yE8Sb1sxaozOrgVU7ED0cQTD6rziBSb4HP+ld1T8PiptJzNV+rLcV4pSOSz4+XBWk6Cz
	Pkbq96vG07cRD02xah7W/kpTJbwSqGXmxAKRIDMi+qy0+M8KNq6gnp240RwXBKpXJSzS
	lalTVa9j+wXlcOsuA7VPALIQjBENqtq3GfJBczYGxFUn5/QPNp5g7eO6JZv6yV/g0ITJ
	RqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=bAjSk1ZNdHWFjf/9cJLX9EHyL4aspv2w/HAE5ukzpBM=;
	b=dolWN6lpWhD1tV/mrMWMEhCT7N97382bb5aVkJqp10cuy2Bm7AomnNa9YKw2gEpvkJ
	R55JHSzluDRczpniqNUgdL/GhJ9KkSwNi9riCQA+IIIpOyM8t6XzUAjkOsqcxtGGKAbY
	HUMgDrrHyQ2Ygll6qjyxxaOBwIGkBTE0Z0351xSl1oBX2Mlqx8i4OB81u+uDFFA88A6j
	16kAyZzPmCWvNHLvCmX5W+ETLbcO5CFpL6yDbl0GScydsDUD31igq4EicnvowHACsOk0
	la7FkDOkERsUjcADJjlpI9Dmub67rjFHE+Z5BQcSGX5vzrt9MaZjRXS/F5vOIycjaH0e
	hR8w==
X-Gm-Message-State: AD7BkJIhmO1hqkidkNwtNMFkTlfJSUWR683tvJU7AHR3sLHjkrT06AdMQRUgUPEa9l3zULqG2LcpfKnKqcVfyA==
MIME-Version: 1.0
X-Received: by 10.98.72.193 with SMTP id q62mr2316634pfi.117.1456495609452;
	Fri, 26 Feb 2016 06:06:49 -0800 (PST)
Received: by 10.66.155.201 with HTTP; Fri, 26 Feb 2016 06:06:49 -0800 (PST)
In-Reply-To: <1456485390-1390-1-git-send-email-net147@gmail.com>
References: <1456485390-1390-1-git-send-email-net147@gmail.com>
Date: Sat, 27 Feb 2016 01:06:49 +1100
Message-ID: <CANwerB1SUCBUN7ppby7u7LnD_TOme=PL+6k8u2oxkPm58jZEyQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: add bzlib and lzma PACKAGECONFIGs
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
X-List-Received-Date: Fri, 26 Feb 2016 14:06:50 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2016 at 22:16, Jonathan Liu <net147@gmail.com> wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
> index e7b20fa..53156ed 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb
> @@ -30,14 +30,16 @@ DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'avdevice', bb.utils.contains(
>
>  inherit autotools pkgconfig
>
> -PACKAGECONFIG ??= "avdevice avfilter gpl theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +PACKAGECONFIG ??= "avdevice avfilter bzlib gpl lzma theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>  PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice"
>  PACKAGECONFIG[avfilter] = "--enable-avfilter,--disable-avfilter"
> +PACKAGECONFIG[bzlib] = "--enable-bzlib,--disable-bzlib,bzip2"
>  PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
>  PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
>  PACKAGECONFIG[gsm] = "--enable-libgsm,--disable-libgsm,libgsm"
>  PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
>  PACKAGECONFIG[libvorbis] = "--enable-libvorbis,--disable-libvorbis,libvorbis"
> +PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz"
>  PACKAGECONFIG[mp3lame] = "--enable-libmp3lame,--disable-libmp3lame,lame"
>  PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
>  PACKAGECONFIG[schroedinger] = "--enable-libschroedinger,--disable-libschroedinger,schroedinger"
> --
> 2.7.1
>

Please disregard this patch. I will rework it to include a
PACKAGECONFIG for xv as well.

Regards,
Jonathan

