Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9B0A16025F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2018 16:37:20 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id b9-v6so3639285pgf.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Apr 2018 09:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=w7aWOOFvPxT2qIoEBkMp4jIQ/HrGqmhoOdO5sAvXuH4=;
	b=ja07YXl4Rec6oeWM1a6CZ0mCoaksL92Tb/e62zN/FPxEWRw9MH7DMHOFC9FtECyBBw
	6X9/OXXx3cbQGrDH4sFuOCFcEPPyP1FsoIZ9rmyVDsT9bG7zTa8V0Bf7BKH63odPiNz/
	+juM/FOozBRFIAdGCk0B7HeeLKHxVA+5q2fIjqy8Hhlai/LqvVRXHV+zjACjqws2CV6b
	J1dHta5sYeUBIxaFcfi5CH0SWkQxP3iJ0q5koNaSTtUhw5bfpNrNuPqJl8DfUzIavVkX
	lqjgcrPYL03BXeXLag4Rqz0ZF+I5jNY1CjqTjuCkchgawhTCiOaPzK1WEWKBE3Ns+tdM
	ytJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=w7aWOOFvPxT2qIoEBkMp4jIQ/HrGqmhoOdO5sAvXuH4=;
	b=Nw2AE/9+8bXr8FDfxD7bvW6qp22S/FIdKWPH/di6D5E5M7axnDxppKm4b2YqaCNcnj
	9pRI6GWINhy1ZBDUqFtz3fBOhnWMxG1VX0cnigTLbrIsbXnIV/FHgG7KGSAIV4las5Dv
	pvnhx9updqdQYsiX6i+j2NpFBwOGIrZ/yeP1YGt1kPoThos5KnnuOj7YCb6pCfpjcQnB
	mOY3JBwgxjql0XusTDr6pmJ+VA+357HFmOU3Y7oOejaYNq9iwcGjBFvuyg0JYmYoneqf
	FrfSfIaZo/kuqsTnhcA9R+Z16dt29gkdbfrTjJQcdBQ/E6EMBQWgflXQTfnAFMjezLBc
	q9AA==
X-Gm-Message-State: ALQs6tCeE+ii6Tlcjs2qtnHD2KjXegAd+vJ8GD9n/EOnT581DxSZocIH
	qDOIBhy8ty8qsJ7J9XMvR9g/2Q==
X-Google-Smtp-Source: AB8JxZqk+aQxpUnuwGac/0NrGAZ1SBxzZoKbj1XNJDdo8hjQu+WOFdjM5b91RtFeB8t+iiXpptVz7w==
X-Received: by 2002:a17:902:5948:: with SMTP id
	e8-v6mr6638750plj.121.1524933441793; 
	Sat, 28 Apr 2018 09:37:21 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:e849:397b:8351:da78?
	([2601:202:4000:1184:e849:397b:8351:da78])
	by smtp.gmail.com with ESMTPSA id
	x2-v6sm2781523pgc.53.2018.04.28.09.37.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 28 Apr 2018 09:37:20 -0700 (PDT)
To: wouterlucas <wouter@wouterlucas.com>,
	openembedded-core@lists.openembedded.org
References: <20180428033806.21451-1-wouter@wouterlucas.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <23be1398-3a48-8071-70aa-b17f6f394178@gmail.com>
Date: Sat, 28 Apr 2018 09:37:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180428033806.21451-1-wouter@wouterlucas.com>
Subject: Re: [pyro][PATCH] gstreamer1.0-plugins-bad: Refresh patches for live streaming and add mpdparser for Dash playready support
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
X-List-Received-Date: Sat, 28 Apr 2018 16:37:22 -0000
Content-Type: multipart/alternative;
	boundary="------------8CBED067B820C6B63226B3E3"
Content-Language: en-US

--------------8CBED067B820C6B63226B3E3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 04/27/2018 08:38 PM, wouterlucas wrote:
> Signed-off-by: wouterlucas <wouter@wouterlucas.com>
> ---
>  ...demux-improved-live-playback-support.patch | 358 ++++++++----------
>  ...implement-adaptivedemux-s-get_live_s.patch |  63 +--
>  ...vedemux-minimal-HTTP-context-support.patch | 142 +++++++
>  ...-PlayReady-ContentProtection-parsing.patch | 109 ++++++
>  .../gstreamer1.0-plugins-bad_1.10.4.bb        |   9 +-
>  5 files changed, 452 insertions(+), 229 deletions(-)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-support.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch

This fails with:

RROR: gstreamer1.0-plugins-bad-1.10.4-r0 do_fetch: Fetcher failure:
Unable to find file
file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch
anywhere. The paths that were searched were:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/poky
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/poky
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/files/poky
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/qemux86
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/qemux86
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/files/qemux86
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/qemuall
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/qemuall
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/files/qemuall
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/x86
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/x86
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/files/x86
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/i586
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/i586
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/files/i586
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/files/
/srv/autobuilder/autobuilder.yoctoproject.org/current_sources ERROR:
gstreamer1.0-plugins-bad-1.10.4-r0 do_fetch: Fetcher failure for URL:
'file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch'.
Unable to fetch URL from any source. ERROR:
gstreamer1.0-plugins-bad-1.10.4-r0 do_fetch: Function failed:
base_do_fetch ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/build/tmp/work/i586-poky-linux/gstreamer1.0-plugins-bad/1.10.4-r0/temp/log.do_fetch.1786
NOTE: recipe gstreamer1.0-plugins-bad-1.10.4-r0: task do_fetch: Failed
ERROR: Task
(/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb:do_fetch)


> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
> index 4832c18e78..041a3d6313 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
> @@ -1,7 +1,7 @@
> -From 73721ad4e9e2d32e1c8b6a3b4aaa98401530e58a Mon Sep 17 00:00:00 2001
> +From 12b9645c4c5b94ff4fd5062bdb02b63db7648db9 Mon Sep 17 00:00:00 2001
>  From: Philippe Normand <philn@igalia.com>
> -Date: Tue, 29 Nov 2016 14:43:41 +0100
> -Subject: [PATCH] mssdemux: improved live playback support
> +Date: Thu, 10 Sep 2015 16:13:30 +0200
> +Subject: [PATCH 1/6] mssdemux: improved live playback support
>  
>  When a MSS server hosts a live stream the fragments listed in the
>  manifest usually don't have accurate timestamps and duration, except
> @@ -12,23 +12,20 @@ be incrementally built by parsing the first/current fragment.
>  
>  https://bugzilla.gnome.org/show_bug.cgi?id=755036
>  ---
> -Upstream-Status: Backport
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
>   ext/smoothstreaming/Makefile.am               |   2 +
> - ext/smoothstreaming/gstmssdemux.c             |  60 ++++++
> - ext/smoothstreaming/gstmssfragmentparser.c    | 266 ++++++++++++++++++++++++++
> - ext/smoothstreaming/gstmssfragmentparser.h    |  84 ++++++++
> - ext/smoothstreaming/gstmssmanifest.c          | 158 ++++++++++++++-
> - ext/smoothstreaming/gstmssmanifest.h          |   7 +
> - gst-libs/gst/adaptivedemux/gstadaptivedemux.c |  27 ++-
> + ext/smoothstreaming/gstmssdemux.c             |  61 ++++++
> + ext/smoothstreaming/gstmssfragmentparser.c    | 255 ++++++++++++++++++++++++++
> + ext/smoothstreaming/gstmssfragmentparser.h    |  84 +++++++++
> + ext/smoothstreaming/gstmssmanifest.c          | 155 ++++++++++++++--
> + ext/smoothstreaming/gstmssmanifest.h          |   3 +
> + gst-libs/gst/adaptivedemux/gstadaptivedemux.c |  28 ++-
>   gst-libs/gst/adaptivedemux/gstadaptivedemux.h |  14 ++
> - 8 files changed, 606 insertions(+), 12 deletions(-)
> + 8 files changed, 586 insertions(+), 16 deletions(-)
>   create mode 100644 ext/smoothstreaming/gstmssfragmentparser.c
>   create mode 100644 ext/smoothstreaming/gstmssfragmentparser.h
>  
>  diff --git a/ext/smoothstreaming/Makefile.am b/ext/smoothstreaming/Makefile.am
> -index 4faf9df9f..a5e1ad6ae 100644
> +index 4faf9df..a5e1ad6 100644
>  --- a/ext/smoothstreaming/Makefile.am
>  +++ b/ext/smoothstreaming/Makefile.am
>  @@ -13,8 +13,10 @@ libgstsmoothstreaming_la_LIBADD = \
> @@ -43,10 +40,10 @@ index 4faf9df9f..a5e1ad6ae 100644
>  +	gstmssfragmentparser.h \
>   	gstmssmanifest.h
>  diff --git a/ext/smoothstreaming/gstmssdemux.c b/ext/smoothstreaming/gstmssdemux.c
> -index 12fb40497..120d9c22b 100644
> +index 9d0aece..70b541e 100644
>  --- a/ext/smoothstreaming/gstmssdemux.c
>  +++ b/ext/smoothstreaming/gstmssdemux.c
> -@@ -135,11 +135,18 @@ gst_mss_demux_stream_update_fragment_info (GstAdaptiveDemuxStream * stream);
> +@@ -135,9 +135,16 @@ gst_mss_demux_stream_update_fragment_info (GstAdaptiveDemuxStream * stream);
>   static gboolean gst_mss_demux_seek (GstAdaptiveDemux * demux, GstEvent * seek);
>   static gint64
>   gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux);
> @@ -56,16 +53,14 @@ index 12fb40497..120d9c22b 100644
>   static GstFlowReturn
>   gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
>       GstBuffer * buffer);
> - static gboolean gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux,
> -     gint64 * start, gint64 * stop);
>  +static GstFlowReturn gst_mss_demux_data_received (GstAdaptiveDemux * demux,
> -+    GstAdaptiveDemuxStream * stream, GstBuffer * buffer);
> ++    GstAdaptiveDemuxStream * stream);
>  +static gboolean
>  +gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * demux);
>   
>   static void
>   gst_mss_demux_class_init (GstMssDemuxClass * klass)
> -@@ -192,10 +199,15 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
> +@@ -190,8 +197,13 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
>         gst_mss_demux_stream_select_bitrate;
>     gstadaptivedemux_class->stream_update_fragment_info =
>         gst_mss_demux_stream_update_fragment_info;
> @@ -73,36 +68,39 @@ index 12fb40497..120d9c22b 100644
>  +      gst_mss_demux_stream_get_fragment_waiting_time;
>     gstadaptivedemux_class->update_manifest_data =
>         gst_mss_demux_update_manifest_data;
> -   gstadaptivedemux_class->get_live_seek_range =
> -       gst_mss_demux_get_live_seek_range;
>  +  gstadaptivedemux_class->data_received = gst_mss_demux_data_received;
>  +  gstadaptivedemux_class->requires_periodical_playlist_update =
>  +      gst_mss_demux_requires_periodical_playlist_update;
>   
>     GST_DEBUG_CATEGORY_INIT (mssdemux_debug, "mssdemux", 0, "mssdemux plugin");
>   }
> -@@ -650,6 +662,13 @@ gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux)
> +@@ -648,6 +660,17 @@ gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux)
>     return interval;
>   }
>   
>  +static gint64
>  +gst_mss_demux_stream_get_fragment_waiting_time (GstAdaptiveDemuxStream * stream)
>  +{
> -+  /* Wait a second for live streams so we don't try premature fragments downloading */
> -+  return GST_SECOND;
> ++  GstMssDemuxStream *mssstream = (GstMssDemuxStream *) stream;
> ++  GstMssStreamType streamtype =
> ++      gst_mss_stream_get_type (mssstream->manifest_stream);
> ++
> ++  /* Wait a second for live audio streams so we don't try premature fragments downloading */
> ++  return streamtype == MSS_STREAM_TYPE_AUDIO ? GST_SECOND : 0;
>  +}
>  +
>   static GstFlowReturn
>   gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
>       GstBuffer * buffer)
> -@@ -670,3 +689,44 @@ gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux, gint64 * start,
> - 
> -   return gst_mss_manifest_get_live_seek_range (mssdemux->manifest, start, stop);
> +@@ -659,3 +682,41 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
> +   gst_mss_manifest_reload_fragments (mssdemux->manifest, buffer);
> +   return GST_FLOW_OK;
>   }
>  +
> ++
>  +static GstFlowReturn
>  +gst_mss_demux_data_received (GstAdaptiveDemux * demux,
> -+    GstAdaptiveDemuxStream * stream, GstBuffer * buffer)
> ++    GstAdaptiveDemuxStream * stream)
>  +{
>  +  GstMssDemux *mssdemux = GST_MSS_DEMUX_CAST (demux);
>  +  GstMssDemuxStream *mssstream = (GstMssDemuxStream *) stream;
> @@ -110,27 +108,23 @@ index 12fb40497..120d9c22b 100644
>  +
>  +  if (!gst_mss_manifest_is_live (mssdemux->manifest)) {
>  +    return GST_ADAPTIVE_DEMUX_CLASS (parent_class)->data_received (demux,
> -+        stream, buffer);
> ++        stream);
>  +  }
>  +
>  +  if (gst_mss_stream_fragment_parsing_needed (mssstream->manifest_stream)) {
> -+    gst_mss_manifest_live_adapter_push (mssstream->manifest_stream, buffer);
> -+    available =
> -+        gst_mss_manifest_live_adapter_available (mssstream->manifest_stream);
> ++    available = gst_adapter_available (stream->adapter);
>  +    // FIXME: try to reduce this minimal size.
>  +    if (available < 4096) {
>  +      return GST_FLOW_OK;
>  +    } else {
> ++      GstBuffer *buffer = gst_adapter_get_buffer (stream->adapter, available);
>  +      GST_LOG_OBJECT (stream->pad, "enough data, parsing fragment.");
> -+      buffer =
> -+          gst_mss_manifest_live_adapter_take_buffer (mssstream->manifest_stream,
> -+          available);
> -+      gst_mss_stream_parse_fragment (mssstream->manifest_stream, buffer);
> ++      gst_mss_stream_fragment_parse (mssstream->manifest_stream, buffer);
> ++      gst_buffer_unref (buffer);
>  +    }
>  +  }
>  +
> -+  return GST_ADAPTIVE_DEMUX_CLASS (parent_class)->data_received (demux, stream,
> -+      buffer);
> ++  return GST_ADAPTIVE_DEMUX_CLASS (parent_class)->data_received (demux, stream);
>  +}
>  +
>  +static gboolean
> @@ -142,17 +136,17 @@ index 12fb40497..120d9c22b 100644
>  +}
>  diff --git a/ext/smoothstreaming/gstmssfragmentparser.c b/ext/smoothstreaming/gstmssfragmentparser.c
>  new file mode 100644
> -index 000000000..b554d4f31
> +index 0000000..01c3b15
>  --- /dev/null
>  +++ b/ext/smoothstreaming/gstmssfragmentparser.c
> -@@ -0,0 +1,266 @@
> +@@ -0,0 +1,255 @@
>  +/*
>  + * Microsoft Smooth-Streaming fragment parsing library
>  + *
>  + * gstmssfragmentparser.h
>  + *
> -+ * Copyright (C) 2016 Igalia S.L
> -+ * Copyright (C) 2016 Metrological
> ++ * Copyright (C) 2015 Igalia S.L
> ++ * Copyright (C) 2015 Metrological
>  + *   Author: Philippe Normand <philn@igalia.com>
>  + *
>  + * This library is free software; you can redistribute it and/or
> @@ -333,12 +327,8 @@ index 000000000..b554d4f31
>  +          size = gst_byte_reader_get_uint32_be_unchecked (&reader);
>  +          fourcc = gst_byte_reader_get_uint32_le_unchecked (&reader);
>  +          if (fourcc == GST_MSS_FRAGMENT_FOURCC_TRUN) {
> -+            GST_TRACE ("trun box found, size: %" G_GUINT32_FORMAT, size);
> -+            if (!gst_byte_reader_skip (&reader, size - 8)) {
> -+              GST_WARNING ("Failed to skip trun box, enough data?");
> -+              error = TRUE;
> -+              goto beach;
> -+            }
> ++            gst_byte_reader_skip_unchecked (&reader, size - 8);
> ++            GST_TRACE ("trun box found, size: %u", size);
>  +          }
>  +        }
>  +      }
> @@ -354,11 +344,7 @@ index 000000000..b554d4f31
>  +    }
>  +
>  +    GST_TRACE ("box size: %" G_GUINT32_FORMAT, size);
> -+    if (!gst_byte_reader_get_uint32_le (&reader, &fourcc)) {
> -+      GST_WARNING ("Failed to get fourcc, enough data?");
> -+      error = TRUE;
> -+      break;
> -+    }
> ++    fourcc = gst_byte_reader_get_uint32_le_unchecked (&reader);
>  +
>  +    if (fourcc == GST_MSS_FRAGMENT_FOURCC_MDAT) {
>  +      GST_LOG ("mdat box found");
> @@ -367,8 +353,7 @@ index 000000000..b554d4f31
>  +    }
>  +
>  +    if (fourcc != GST_MSS_FRAGMENT_FOURCC_UUID) {
> -+      GST_ERROR ("invalid UUID fourcc: %" GST_FOURCC_FORMAT,
> -+          GST_FOURCC_ARGS (fourcc));
> ++      GST_ERROR ("invalid UUID fourcc");
>  +      error = TRUE;
>  +      break;
>  +    }
> @@ -403,8 +388,6 @@ index 000000000..b554d4f31
>  +    }
>  +  }
>  +
> -+beach:
> -+
>  +  if (!error)
>  +    parser->status = GST_MSS_FRAGMENT_HEADER_PARSER_FINISHED;
>  +
> @@ -414,7 +397,7 @@ index 000000000..b554d4f31
>  +}
>  diff --git a/ext/smoothstreaming/gstmssfragmentparser.h b/ext/smoothstreaming/gstmssfragmentparser.h
>  new file mode 100644
> -index 000000000..cf4711865
> +index 0000000..6626358
>  --- /dev/null
>  +++ b/ext/smoothstreaming/gstmssfragmentparser.h
>  @@ -0,0 +1,84 @@
> @@ -423,8 +406,8 @@ index 000000000..cf4711865
>  + *
>  + * gstmssfragmentparser.h
>  + *
> -+ * Copyright (C) 2016 Igalia S.L
> -+ * Copyright (C) 2016 Metrological
> ++ * Copyright (C) 2015 Igalia S.L
> ++ * Copyright (C) 2015 Metrological
>  + *   Author: Philippe Normand <philn@igalia.com>
>  + *
>  + * This library is free software; you can redistribute it and/or
> @@ -503,14 +486,14 @@ index 000000000..cf4711865
>  +
>  +#endif /* __GST_MSS_FRAGMENT_PARSER_H__ */
>  diff --git a/ext/smoothstreaming/gstmssmanifest.c b/ext/smoothstreaming/gstmssmanifest.c
> -index 144bbb42d..e1031ba55 100644
> +index 1b72e8d..d50a51a 100644
>  --- a/ext/smoothstreaming/gstmssmanifest.c
>  +++ b/ext/smoothstreaming/gstmssmanifest.c
>  @@ -1,5 +1,7 @@
>   /* GStreamer
>    * Copyright (C) 2012 Smart TV Alliance
> -+ * Copyright (C) 2016 Igalia S.L
> -+ * Copyright (C) 2016 Metrological
> ++ * Copyright (C) 2015 Igalia S.L
> ++ * Copyright (C) 2015 Metrological
>    *  Author: Thiago Sousa Santos <thiago.sousa.santos@collabora.com>, Collabora Ltd.
>    *
>    * gstmssmanifest.c:
> @@ -522,12 +505,12 @@ index 144bbb42d..e1031ba55 100644
>   
>   GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
>   #define GST_CAT_DEFAULT mssdemux_debug
> -@@ -74,12 +77,17 @@ struct _GstMssStream
> +@@ -73,12 +76,17 @@ struct _GstMssStream
>     gboolean active;              /* if the stream is currently being used */
>     gint selectedQualityIndex;
>   
>  +  gboolean has_live_fragments;
> -+  GstAdapter *live_adapter;
> ++  GQueue live_fragments;
>  +
>     GList *fragments;
>     GList *qualities;
> @@ -540,15 +523,15 @@ index 144bbb42d..e1031ba55 100644
>     guint fragment_repetition_index;
>     GList *current_fragment;
>     GList *current_quality;
> -@@ -96,6 +104,7 @@ struct _GstMssManifest
> +@@ -94,6 +102,7 @@ struct _GstMssManifest
> +   xmlNodePtr xmlrootnode;
>   
>     gboolean is_live;
> -   gint64 dvr_window;
>  +  guint64 look_ahead_fragment_count;
>   
>     GString *protection_system_id;
>     gchar *protection_data;
> -@@ -235,7 +244,8 @@ compare_bitrate (GstMssStreamQuality * a, GstMssStreamQuality * b)
> +@@ -233,7 +242,8 @@ compare_bitrate (GstMssStreamQuality * a, GstMssStreamQuality * b)
>   }
>   
>   static void
> @@ -558,7 +541,7 @@ index 144bbb42d..e1031ba55 100644
>   {
>     xmlNodePtr iter;
>     GstMssFragmentListBuilder builder;
> -@@ -248,9 +258,21 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
> +@@ -246,9 +256,18 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
>     stream->url = (gchar *) xmlGetProp (node, (xmlChar *) MSS_PROP_URL);
>     stream->lang = (gchar *) xmlGetProp (node, (xmlChar *) MSS_PROP_LANGUAGE);
>   
> @@ -567,9 +550,6 @@ index 144bbb42d..e1031ba55 100644
>  +   * playlist can be built incrementally from the first fragment
>  +   * of the manifest.
>  +   */
> -+
> -+  GST_DEBUG ("Live stream: %s, look-ahead fragments: %" G_GUINT64_FORMAT,
> -+      manifest->is_live ? "yes" : "no", manifest->look_ahead_fragment_count);
>  +  stream->has_live_fragments = manifest->is_live
>  +      && manifest->look_ahead_fragment_count;
>  +
> @@ -581,13 +561,15 @@ index 144bbb42d..e1031ba55 100644
>       } else if (node_has_type (iter, MSS_NODE_STREAM_QUALITY)) {
>         GstMssStreamQuality *quality = gst_mss_stream_quality_new (iter);
>         stream->qualities = g_list_prepend (stream->qualities, quality);
> -@@ -259,17 +281,24 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
> +@@ -257,17 +276,26 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
>       }
>     }
>   
>  -  stream->fragments = g_list_reverse (builder.fragments);
>  +  if (stream->has_live_fragments) {
> -+    stream->live_adapter = gst_adapter_new ();
> ++    g_queue_init (&stream->live_fragments);
> ++    g_queue_push_tail (&stream->live_fragments, builder.fragments->data);
> ++    stream->current_fragment = g_queue_peek_head_link (&stream->live_fragments);
>  +  }
>  +
>  +  if (builder.fragments) {
> @@ -609,7 +591,7 @@ index 144bbb42d..e1031ba55 100644
>   }
>   
>   
> -@@ -315,6 +344,7 @@ gst_mss_manifest_new (GstBuffer * data)
> +@@ -313,6 +341,7 @@ gst_mss_manifest_new (GstBuffer * data)
>     xmlNodePtr nodeiter;
>     gchar *live_str;
>     GstMapInfo mapinfo;
> @@ -617,33 +599,21 @@ index 144bbb42d..e1031ba55 100644
>   
>     if (!gst_buffer_map (data, &mapinfo, GST_MAP_READ)) {
>       return NULL;
> -@@ -335,6 +365,7 @@ gst_mss_manifest_new (GstBuffer * data)
> -   /* the entire file is always available for non-live streams */
> -   if (!manifest->is_live) {
> -     manifest->dvr_window = 0;
> -+    manifest->look_ahead_fragment_count = 0;
> -   } else {
> -     /* if 0, or non-existent, the length is infinite */
> -     gchar *dvr_window_str = (gchar *) xmlGetProp (root,
> -@@ -346,6 +377,17 @@ gst_mss_manifest_new (GstBuffer * data)
> -         manifest->dvr_window = 0;
> -       }
> -     }
> -+
> -+    look_ahead_fragment_count_str =
> -+        (gchar *) xmlGetProp (root, (xmlChar *) "LookAheadFragmentCount");
> -+    if (look_ahead_fragment_count_str) {
> -+      manifest->look_ahead_fragment_count =
> -+          g_ascii_strtoull (look_ahead_fragment_count_str, NULL, 10);
> -+      xmlFree (look_ahead_fragment_count_str);
> -+      if (manifest->look_ahead_fragment_count <= 0) {
> -+        manifest->look_ahead_fragment_count = 0;
> -+      }
> -+    }
> +@@ -330,13 +359,21 @@ gst_mss_manifest_new (GstBuffer * data)
> +     xmlFree (live_str);
>     }
>   
> ++  look_ahead_fragment_count_str =
> ++      (gchar *) xmlGetProp (root, (xmlChar *) "LookAheadFragmentCount");
> ++  if (look_ahead_fragment_count_str) {
> ++    manifest->look_ahead_fragment_count =
> ++        g_ascii_strtoull (look_ahead_fragment_count_str, NULL, 10);
> ++    xmlFree (look_ahead_fragment_count_str);
> ++  }
> ++
>     for (nodeiter = root->children; nodeiter; nodeiter = nodeiter->next) {
> -@@ -354,7 +396,7 @@ gst_mss_manifest_new (GstBuffer * data)
> +     if (nodeiter->type == XML_ELEMENT_NODE
> +         && (strcmp ((const char *) nodeiter->name, "StreamIndex") == 0)) {
>         GstMssStream *stream = g_new0 (GstMssStream, 1);
>   
>         manifest->streams = g_slist_append (manifest->streams, stream);
> @@ -652,39 +622,56 @@ index 144bbb42d..e1031ba55 100644
>       }
>   
>       if (nodeiter->type == XML_ELEMENT_NODE
> -@@ -371,6 +413,11 @@ gst_mss_manifest_new (GstBuffer * data)
> +@@ -353,13 +390,19 @@ gst_mss_manifest_new (GstBuffer * data)
>   static void
>   gst_mss_stream_free (GstMssStream * stream)
>   {
> -+  if (stream->live_adapter) {
> -+    gst_adapter_clear (stream->live_adapter);
> -+    g_object_unref (stream->live_adapter);
> +-  g_list_free_full (stream->fragments, g_free);
> ++  if (stream->has_live_fragments) {
> ++    g_queue_foreach (&stream->live_fragments, (GFunc) g_free, NULL);
> ++    g_queue_clear (&stream->live_fragments);
> ++  } else {
> ++    g_list_free_full (stream->fragments, g_free);
>  +  }
> -+
> -   g_list_free_full (stream->fragments, g_free);
>     g_list_free_full (stream->qualities,
>         (GDestroyNotify) gst_mss_stream_quality_free);
> -@@ -379,6 +426,7 @@ gst_mss_stream_free (GstMssStream * stream)
> +   xmlFree (stream->url);
> +   xmlFree (stream->lang);
>     g_regex_unref (stream->regex_position);
>     g_regex_unref (stream->regex_bitrate);
> -   g_free (stream);
>  +  gst_mss_fragment_parser_clear (&stream->fragment_parser);
> +   g_free (stream);
>   }
>   
> - void
> -@@ -1079,6 +1127,9 @@ GstFlowReturn
> +@@ -984,7 +1027,12 @@ gst_mss_stream_get_fragment_gst_timestamp (GstMssStream * stream)
> +   g_return_val_if_fail (stream->active, GST_CLOCK_TIME_NONE);
> + 
> +   if (!stream->current_fragment) {
> +-    GList *last = g_list_last (stream->fragments);
> ++    GList *last;
> ++
> ++    if (stream->has_live_fragments)
> ++      last = g_queue_peek_tail_link (&stream->live_fragments);
> ++    else
> ++      last = g_list_last (stream->fragments);
> +     if (last == NULL)
> +       return GST_CLOCK_TIME_NONE;
> + 
> +@@ -1037,21 +1085,54 @@ GstFlowReturn
>   gst_mss_stream_advance_fragment (GstMssStream * stream)
>   {
>     GstMssStreamFragment *fragment;
> ++  GstMssStreamFragment *prev_fragment;
>  +  const gchar *stream_type_name =
>  +      gst_mss_stream_type_name (gst_mss_stream_get_type (stream));
>  +
>     g_return_val_if_fail (stream->active, GST_FLOW_ERROR);
>   
>     if (stream->current_fragment == NULL)
> -@@ -1086,14 +1137,20 @@ gst_mss_stream_advance_fragment (GstMssStream * stream)
> +     return GST_FLOW_EOS;
>   
> -   fragment = stream->current_fragment->data;
> +-  fragment = stream->current_fragment->data;
> ++  prev_fragment = fragment = stream->current_fragment->data;
>     stream->fragment_repetition_index++;
>  -  if (stream->fragment_repetition_index < fragment->repetitions) {
>  -    return GST_FLOW_OK;
> @@ -693,10 +680,34 @@ index 144bbb42d..e1031ba55 100644
>  +    goto beach;
>   
>     stream->fragment_repetition_index = 0;
> -   stream->current_fragment = g_list_next (stream->current_fragment);
> +-  stream->current_fragment = g_list_next (stream->current_fragment);
> ++
> ++  if (stream->has_live_fragments)
> ++    stream->current_fragment = g_queue_pop_head_link (&stream->live_fragments);
> ++  else
> ++    stream->current_fragment = g_list_next (stream->current_fragment);
> ++
> ++  if (stream->current_fragment != NULL) {
> ++    fragment = stream->current_fragment->data;
> ++    if (fragment->time <= prev_fragment->time) {
> ++      while (fragment->time <= prev_fragment->time) {
> ++        if (stream->has_live_fragments)
> ++          stream->current_fragment =
> ++              g_queue_pop_head_link (&stream->live_fragments);
> ++        else
> ++          stream->current_fragment = g_list_next (stream->current_fragment);
> ++        if (stream->current_fragment == NULL)
> ++          break;
> ++        fragment = stream->current_fragment->data;
> ++      }
> ++    }
> ++  }
>  +
>  +  GST_DEBUG ("Advanced to fragment #%d on %s stream", fragment->number,
>  +      stream_type_name);
> ++  if (stream->has_live_fragments)
> ++    GST_LOG ("%u fragments left in the %s stream queue",
> ++        g_queue_get_length (&stream->live_fragments), stream_type_name);
>     if (stream->current_fragment == NULL)
>       return GST_FLOW_EOS;
>  +
> @@ -706,57 +717,22 @@ index 144bbb42d..e1031ba55 100644
>     return GST_FLOW_OK;
>   }
>   
> -@@ -1173,6 +1230,11 @@ gst_mss_stream_seek (GstMssStream * stream, gboolean forward,
> -   GST_DEBUG ("Stream %s seeking to %" G_GUINT64_FORMAT, stream->url, time);
> -   for (iter = stream->fragments; iter; iter = g_list_next (iter)) {
> -     fragment = iter->data;
> -+    if (stream->has_live_fragments) {
> -+      if (fragment->time + fragment->repetitions * fragment->duration > time)
> -+        stream->current_fragment = iter;
> -+      break;
> -+    }
> -     if (fragment->time + fragment->repetitions * fragment->duration > time) {
> -       stream->current_fragment = iter;
> -       stream->fragment_repetition_index =
> -@@ -1256,9 +1318,14 @@ static void
> - gst_mss_stream_reload_fragments (GstMssStream * stream, xmlNodePtr streamIndex)
> - {
> -   xmlNodePtr iter;
> --  guint64 current_gst_time = gst_mss_stream_get_fragment_gst_timestamp (stream);
> -+  guint64 current_gst_time;
> -   GstMssFragmentListBuilder builder;
> +@@ -1125,6 +1206,10 @@ gst_mss_stream_seek (GstMssStream * stream, gboolean forward,
> +   guint64 timescale;
> +   GstMssStreamFragment *fragment = NULL;
>   
> ++  // FIXME: Seek support for live scenario using DVR window.
>  +  if (stream->has_live_fragments)
>  +    return;
>  +
> -+  current_gst_time = gst_mss_stream_get_fragment_gst_timestamp (stream);
> -+
> -   gst_mss_fragment_list_builder_init (&builder);
> +   timescale = gst_mss_stream_get_timescale (stream);
> +   time = gst_util_uint64_scale_round (time, timescale, GST_SECOND);
>   
> -   GST_DEBUG ("Current position: %" GST_TIME_FORMAT,
> -@@ -1514,3 +1581,74 @@ gst_mss_manifest_get_live_seek_range (GstMssManifest * manifest, gint64 * start,
> - 
> -   return ret;
> +@@ -1406,3 +1491,47 @@ gst_mss_stream_get_lang (GstMssStream * stream)
> + {
> +   return stream->lang;
>   }
>  +
> -+void
> -+gst_mss_manifest_live_adapter_push (GstMssStream * stream, GstBuffer * buffer)
> -+{
> -+  gst_adapter_push (stream->live_adapter, buffer);
> -+}
> -+
> -+gsize
> -+gst_mss_manifest_live_adapter_available (GstMssStream * stream)
> -+{
> -+  return gst_adapter_available (stream->live_adapter);
> -+}
> -+
> -+GstBuffer *
> -+gst_mss_manifest_live_adapter_take_buffer (GstMssStream * stream, gsize nbytes)
> -+{
> -+  return gst_adapter_take_buffer (stream->live_adapter, nbytes);
> -+}
> -+
>  +gboolean
>  +gst_mss_stream_fragment_parsing_needed (GstMssStream * stream)
>  +{
> @@ -764,11 +740,11 @@ index 144bbb42d..e1031ba55 100644
>  +}
>  +
>  +void
> -+gst_mss_stream_parse_fragment (GstMssStream * stream, GstBuffer * buffer)
> ++gst_mss_stream_fragment_parse (GstMssStream * stream, GstBuffer * buffer)
>  +{
>  +  GstMssStreamFragment *current_fragment = NULL;
> -+  const gchar *stream_type_name;
> -+  guint8 index;
> ++  const gchar *stream_type_name =
> ++      gst_mss_stream_type_name (gst_mss_stream_get_type (stream));
>  +
>  +  if (!stream->has_live_fragments)
>  +    return;
> @@ -780,29 +756,20 @@ index 144bbb42d..e1031ba55 100644
>  +  current_fragment->time = stream->fragment_parser.tfxd.time;
>  +  current_fragment->duration = stream->fragment_parser.tfxd.duration;
>  +
> -+  stream_type_name =
> -+      gst_mss_stream_type_name (gst_mss_stream_get_type (stream));
> -+
> -+  for (index = 0; index < stream->fragment_parser.tfrf.entries_count; index++) {
> -+    GList *l = g_list_last (stream->fragments);
> -+    GstMssStreamFragment *last;
> ++  for (guint8 index = 0; index < stream->fragment_parser.tfrf.entries_count;
> ++      index++) {
> ++    GstMssStreamFragment *last = g_queue_peek_tail (&stream->live_fragments);
>  +    GstMssStreamFragment *fragment;
>  +
> -+    if (l == NULL)
> -+      break;
> -+
> -+    last = (GstMssStreamFragment *) l->data;
> -+
> -+    if (last->time == stream->fragment_parser.tfrf.entries[index].time)
> -+      continue;
> -+
> ++    if (last == NULL)
> ++        break;
>  +    fragment = g_new (GstMssStreamFragment, 1);
>  +    fragment->number = last->number + 1;
>  +    fragment->repetitions = 1;
>  +    fragment->time = stream->fragment_parser.tfrf.entries[index].time;
>  +    fragment->duration = stream->fragment_parser.tfrf.entries[index].duration;
>  +
> -+    stream->fragments = g_list_append (stream->fragments, fragment);
> ++    g_queue_push_tail (&stream->live_fragments, fragment);
>  +    GST_LOG ("Adding fragment number: %u to %s stream, time: %" G_GUINT64_FORMAT
>  +        ", duration: %" G_GUINT64_FORMAT ", repetitions: %u",
>  +        fragment->number, stream_type_name,
> @@ -810,31 +777,20 @@ index 144bbb42d..e1031ba55 100644
>  +  }
>  +}
>  diff --git a/ext/smoothstreaming/gstmssmanifest.h b/ext/smoothstreaming/gstmssmanifest.h
> -index 6b7b1f971..03b066ae5 100644
> +index af7419c..039877f 100644
>  --- a/ext/smoothstreaming/gstmssmanifest.h
>  +++ b/ext/smoothstreaming/gstmssmanifest.h
> -@@ -26,6 +26,7 @@
> - #include <glib.h>
> - #include <gio/gio.h>
> - #include <gst/gst.h>
> -+#include <gst/base/gstadapter.h>
> - 
> - G_BEGIN_DECLS
> - 
> -@@ -73,5 +74,11 @@ const gchar * gst_mss_stream_get_lang (GstMssStream * stream);
> +@@ -72,5 +72,8 @@ const gchar * gst_mss_stream_get_lang (GstMssStream * stream);
>   
>   const gchar * gst_mss_stream_type_name (GstMssStreamType streamtype);
>   
> -+void gst_mss_manifest_live_adapter_push(GstMssStream * stream, GstBuffer * buffer);
> -+gsize gst_mss_manifest_live_adapter_available(GstMssStream * stream);
> -+GstBuffer * gst_mss_manifest_live_adapter_take_buffer(GstMssStream * stream, gsize nbytes);
>  +gboolean gst_mss_stream_fragment_parsing_needed(GstMssStream * stream);
> -+void gst_mss_stream_parse_fragment(GstMssStream * stream, GstBuffer * buffer);
> ++void gst_mss_stream_fragment_parse(GstMssStream * stream, GstBuffer * buffer);
>  +
>   G_END_DECLS
>   #endif /* __GST_MSS_MANIFEST_H__ */
>  diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
> -index 634e4f388..ddca726b6 100644
> +index bf311d3..20bd839 100644
>  --- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
>  +++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
>  @@ -291,6 +291,9 @@ gst_adaptive_demux_wait_until (GstClock * clock, GCond * cond, GMutex * mutex,
> @@ -868,7 +824,7 @@ index 634e4f388..ddca726b6 100644
>             }
>           } else {
>             /* no streams */
> -@@ -2125,6 +2133,13 @@ gst_adaptive_demux_stream_data_received_default (GstAdaptiveDemux * demux,
> +@@ -2113,6 +2121,13 @@ gst_adaptive_demux_stream_data_received_default (GstAdaptiveDemux * demux,
>     return gst_adaptive_demux_stream_push_buffer (stream, buffer);
>   }
>   
> @@ -882,25 +838,33 @@ index 634e4f388..ddca726b6 100644
>   static GstFlowReturn
>   _src_chain (GstPad * pad, GstObject * parent, GstBuffer * buffer)
>   {
> -@@ -3338,7 +3353,15 @@ gst_adaptive_demux_stream_download_loop (GstAdaptiveDemuxStream * stream)
> +@@ -2209,7 +2224,7 @@ _src_chain (GstPad * pad, GstObject * parent, GstBuffer * buffer)
> +       stream->download_chunk_start_time;
> +   stream->download_total_bytes += gst_buffer_get_size (buffer);
> + 
> +-  GST_DEBUG_OBJECT (stream->pad, "Received buffer of size %" G_GSIZE_FORMAT,
> ++  GST_LOG_OBJECT (stream->pad, "Received buffer of size %" G_GSIZE_FORMAT,
> +       gst_buffer_get_size (buffer));
> + 
> +   ret = klass->data_received (demux, stream, buffer);
> +@@ -3326,7 +3341,14 @@ gst_adaptive_demux_stream_download_loop (GstAdaptiveDemuxStream * stream)
>         GST_DEBUG_OBJECT (stream->pad, "EOS, checking to stop download loop");
>         /* we push the EOS after releasing the object lock */
>         if (gst_adaptive_demux_is_live (demux)) {
>  -        if (gst_adaptive_demux_stream_wait_manifest_update (demux, stream)) {
>  +        GstAdaptiveDemuxClass *demux_class =
> -+            GST_ADAPTIVE_DEMUX_GET_CLASS (demux);
> ++          GST_ADAPTIVE_DEMUX_GET_CLASS (demux);
>  +
>  +        /* this might be a fragment download error, refresh the manifest, just in case */
>  +        if (!demux_class->requires_periodical_playlist_update (demux)) {
>  +          ret = gst_adaptive_demux_update_manifest (demux);
>  +          break;
> -+        } else if (gst_adaptive_demux_stream_wait_manifest_update (demux,
> -+                stream)) {
> ++        } else if (gst_adaptive_demux_stream_wait_manifest_update (demux, stream)) {
>             goto end;
>           }
>           gst_task_stop (stream->download_task);
>  diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.h b/gst-libs/gst/adaptivedemux/gstadaptivedemux.h
> -index 780f4d93f..9a1a1b7d1 100644
> +index 780f4d9..9a1a1b7 100644
>  --- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.h
>  +++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.h
>  @@ -459,6 +459,20 @@ struct _GstAdaptiveDemuxClass
> @@ -925,5 +889,5 @@ index 780f4d93f..9a1a1b7d1 100644
>   
>   GType    gst_adaptive_demux_get_type (void);
>  -- 
> -2.11.0
> +2.7.4
>  
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
> index 76d29e151b..c4639a2cda 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
> @@ -1,7 +1,7 @@
> -From e9178fa082116d4bf733b184a8b6951112c17900 Mon Sep 17 00:00:00 2001
> +From e8155c77d8dcaf39ec564b85c4a56e64fce6de2b Mon Sep 17 00:00:00 2001
>  From: Matthew Waters <matthew@centricular.com>
>  Date: Thu, 10 Nov 2016 17:18:36 +1100
> -Subject: [PATCH] smoothstreaming: implement adaptivedemux's
> +Subject: [PATCH 1/2] smoothstreaming: implement adaptivedemux's
>   get_live_seek_range()
>  
>  Allows seeking through the available fragments that are still available
> @@ -10,40 +10,45 @@ manifest.
>  
>  https://bugzilla.gnome.org/show_bug.cgi?id=774178
>  ---
> -Upstream-Status: Backport
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> - ext/smoothstreaming/gstmssdemux.c    | 13 ++++++
> + ext/smoothstreaming/gstmssdemux.c    | 14 +++++-
>   ext/smoothstreaming/gstmssmanifest.c | 84 ++++++++++++++++++++++++++++++++++++
>   ext/smoothstreaming/gstmssmanifest.h |  1 +
> - 3 files changed, 98 insertions(+)
> + 3 files changed, 98 insertions(+), 1 deletion(-)
>  
>  diff --git a/ext/smoothstreaming/gstmssdemux.c b/ext/smoothstreaming/gstmssdemux.c
> -index 9d0aece2b..b66e19514 100644
> +index 1a122d4..26147fd 100644
>  --- a/ext/smoothstreaming/gstmssdemux.c
>  +++ b/ext/smoothstreaming/gstmssdemux.c
> -@@ -138,6 +138,8 @@ gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux);
> - static GstFlowReturn
> - gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
> -     GstBuffer * buffer);
> +@@ -146,6 +146,8 @@ static GstFlowReturn gst_mss_demux_data_received (GstAdaptiveDemux * demux,
> +     GstAdaptiveDemuxStream * stream, GstBuffer * buffer);
> + static gboolean
> + gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * demux);
>  +static gboolean gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux,
>  +    gint64 * start, gint64 * stop);
>   
>   static void
>   gst_mss_demux_class_init (GstMssDemuxClass * klass)
> -@@ -192,6 +194,8 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
> -       gst_mss_demux_stream_update_fragment_info;
> -   gstadaptivedemux_class->update_manifest_data =
> -       gst_mss_demux_update_manifest_data;
> +@@ -206,6 +208,8 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
> +   gstadaptivedemux_class->data_received = gst_mss_demux_data_received;
> +   gstadaptivedemux_class->requires_periodical_playlist_update =
> +       gst_mss_demux_requires_periodical_playlist_update;
>  +  gstadaptivedemux_class->get_live_seek_range =
>  +      gst_mss_demux_get_live_seek_range;
>   
>     GST_DEBUG_CATEGORY_INIT (mssdemux_debug, "mssdemux", 0, "mssdemux plugin");
>   }
> -@@ -659,3 +663,12 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
> -   gst_mss_manifest_reload_fragments (mssdemux->manifest, buffer);
> +@@ -694,7 +698,6 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
>     return GST_FLOW_OK;
>   }
> + 
> +-
> + static GstFlowReturn
> + gst_mss_demux_data_received (GstAdaptiveDemux * demux,
> +     GstAdaptiveDemuxStream * stream, GstBuffer *buffer)
> +@@ -739,3 +742,12 @@ gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * demux)
> + 
> +   return (!gst_mss_manifest_is_live (mssdemux->manifest));
> + }
>  +
>  +static gboolean
>  +gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux, gint64 * start,
> @@ -54,10 +59,10 @@ index 9d0aece2b..b66e19514 100644
>  +  return gst_mss_manifest_get_live_seek_range (mssdemux->manifest, start, stop);
>  +}
>  diff --git a/ext/smoothstreaming/gstmssmanifest.c b/ext/smoothstreaming/gstmssmanifest.c
> -index 1b72e8de1..317b3cef9 100644
> +index b9dacb3..291080a 100644
>  --- a/ext/smoothstreaming/gstmssmanifest.c
>  +++ b/ext/smoothstreaming/gstmssmanifest.c
> -@@ -42,6 +42,7 @@ GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
> +@@ -45,6 +45,7 @@ GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
>   
>   #define MSS_PROP_BITRATE              "Bitrate"
>   #define MSS_PROP_DURATION             "d"
> @@ -65,16 +70,16 @@ index 1b72e8de1..317b3cef9 100644
>   #define MSS_PROP_LANGUAGE             "Language"
>   #define MSS_PROP_NUMBER               "n"
>   #define MSS_PROP_REPETITIONS          "r"
> -@@ -94,6 +95,7 @@ struct _GstMssManifest
> -   xmlNodePtr xmlrootnode;
> +@@ -103,6 +104,7 @@ struct _GstMssManifest
>   
>     gboolean is_live;
> +   guint64 look_ahead_fragment_count;
>  +  gint64 dvr_window;
>   
>     GString *protection_system_id;
>     gchar *protection_data;
> -@@ -330,6 +332,22 @@ gst_mss_manifest_new (GstBuffer * data)
> -     xmlFree (live_str);
> +@@ -367,6 +369,22 @@ gst_mss_manifest_new (GstBuffer * data)
> +     xmlFree (look_ahead_fragment_count_str);
>     }
>   
>  +  /* the entire file is always available for non-live streams */
> @@ -96,9 +101,9 @@ index 1b72e8de1..317b3cef9 100644
>     for (nodeiter = root->children; nodeiter; nodeiter = nodeiter->next) {
>       if (nodeiter->type == XML_ELEMENT_NODE
>           && (strcmp ((const char *) nodeiter->name, "StreamIndex") == 0)) {
> -@@ -1406,3 +1424,69 @@ gst_mss_stream_get_lang (GstMssStream * stream)
> - {
> -   return stream->lang;
> +@@ -1546,3 +1564,69 @@ gst_mss_stream_fragment_parse (GstMssStream * stream, GstBuffer * buffer)
> +         fragment->time, fragment->duration, fragment->repetitions);
> +   }
>   }
>  +
>  +static GstClockTime
> @@ -167,7 +172,7 @@ index 1b72e8de1..317b3cef9 100644
>  +  return ret;
>  +}
>  diff --git a/ext/smoothstreaming/gstmssmanifest.h b/ext/smoothstreaming/gstmssmanifest.h
> -index af7419c23..6b7b1f971 100644
> +index 039877f..29545af 100644
>  --- a/ext/smoothstreaming/gstmssmanifest.h
>  +++ b/ext/smoothstreaming/gstmssmanifest.h
>  @@ -54,6 +54,7 @@ void gst_mss_manifest_reload_fragments (GstMssManifest * manifest, GstBuffer * d
> @@ -179,5 +184,5 @@ index af7419c23..6b7b1f971 100644
>   GstMssStreamType gst_mss_stream_get_type (GstMssStream *stream);
>   GstCaps * gst_mss_stream_get_caps (GstMssStream * stream);
>  -- 
> -2.11.0
> +1.8.3.2
>  
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-support.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-support.patch
> new file mode 100644
> index 0000000000..8a4ca68d83
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-support.patch
> @@ -0,0 +1,142 @@
> +From 992bd23193978742029966e0a2232b1bfcc06122 Mon Sep 17 00:00:00 2001
> +From: Philippe Normand <philn@igalia.com>
> +Date: Wed, 28 Oct 2015 11:52:49 +0100
> +Subject: [PATCH 3/6] adaptivedemux: minimal HTTP context support
> +
> +The uridownloader is now querying the source element for an HTTP
> +context, which stores session data (cookies only for now), and reusing
> +the data when fetching data over HTTP. Additionally the context is set
> +on adaptivedemux, which allows it to also properly use session data
> +when downloading fragments.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=726314
> +---
> + gst-libs/gst/adaptivedemux/gstadaptivedemux.c | 16 ++++++++++++-
> + gst-libs/gst/uridownloader/gsturidownloader.c | 34 +++++++++++++++++++++++++--
> + gst-libs/gst/uridownloader/gsturidownloader.h |  2 +-
> + 3 files changed, 48 insertions(+), 4 deletions(-)
> +
> +diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
> +index 20bd839..1b5cace 100644
> +--- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
> ++++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
> +@@ -432,7 +432,7 @@ gst_adaptive_demux_init (GstAdaptiveDemux * demux,
> + 
> +   demux->priv = GST_ADAPTIVE_DEMUX_GET_PRIVATE (demux);
> +   demux->priv->input_adapter = gst_adapter_new ();
> +-  demux->downloader = gst_uri_downloader_new ();
> ++  demux->downloader = gst_uri_downloader_new (GST_ELEMENT (demux));
> +   demux->stream_struct_size = sizeof (GstAdaptiveDemuxStream);
> +   demux->priv->segment_seqnum = gst_util_seqnum_next ();
> +   demux->have_group_id = FALSE;
> +@@ -2547,6 +2547,7 @@ gst_adaptive_demux_stream_update_source (GstAdaptiveDemuxStream * stream,
> +     GstPadLinkReturn pad_link_ret;
> +     GObjectClass *gobject_class;
> +     gchar *internal_name, *bin_name;
> ++    GstContext *context = NULL;
> + 
> +     /* Our src consists of a bin containing uri_handler -> queue2 . The
> +      * purpose of the queue2 is to allow the uri_handler to download an
> +@@ -2598,6 +2599,19 @@ gst_adaptive_demux_stream_update_source (GstAdaptiveDemuxStream * stream,
> +       }
> +     }
> + 
> ++    context =
> ++        gst_element_get_context (GST_ELEMENT_CAST (demux), "http-headers");
> ++    if (context) {
> ++      const GstStructure *s = gst_context_get_structure (context);
> ++      const gchar **cookies = NULL;
> ++      gst_structure_get (s, "cookies", G_TYPE_STRV, &cookies, NULL);
> ++      if (cookies) {
> ++        GST_DEBUG_OBJECT (demux, "Passing cookies through");
> ++        g_object_set (uri_handler, "cookies", cookies, NULL);
> ++      }
> ++      gst_context_unref (context);
> ++    }
> ++
> +     /* Source bin creation */
> +     bin_name = g_strdup_printf ("srcbin-%s", GST_PAD_NAME (stream->pad));
> +     stream->src = gst_bin_new (bin_name);
> +diff --git a/gst-libs/gst/uridownloader/gsturidownloader.c b/gst-libs/gst/uridownloader/gsturidownloader.c
> +index 47b6f29..1f61250 100644
> +--- a/gst-libs/gst/uridownloader/gsturidownloader.c
> ++++ b/gst-libs/gst/uridownloader/gsturidownloader.c
> +@@ -33,6 +33,8 @@ GST_DEBUG_CATEGORY (uridownloader_debug);
> + 
> + struct _GstUriDownloaderPrivate
> + {
> ++  GstElement *parent;
> ++
> +   /* Fragments fetcher */
> +   GstElement *urisrc;
> +   GstBus *bus;
> +@@ -148,9 +150,11 @@ gst_uri_downloader_finalize (GObject * object)
> + }
> + 
> + GstUriDownloader *
> +-gst_uri_downloader_new (void)
> ++gst_uri_downloader_new (GstElement * parent)
> + {
> +-  return g_object_new (GST_TYPE_URI_DOWNLOADER, NULL);
> ++  GstUriDownloader *downloader = g_object_new (GST_TYPE_URI_DOWNLOADER, NULL);
> ++  downloader->priv->parent = parent;
> ++  return downloader;
> + }
> + 
> + static gboolean
> +@@ -413,6 +417,7 @@ gst_uri_downloader_set_uri (GstUriDownloader * downloader, const gchar * uri,
> + {
> +   GstPad *pad;
> +   GObjectClass *gobject_class;
> ++  GstContext *context = NULL;
> + 
> +   if (!gst_uri_is_valid (uri))
> +     return FALSE;
> +@@ -449,6 +454,31 @@ gst_uri_downloader_set_uri (GstUriDownloader * downloader, const gchar * uri,
> +     }
> +   }
> + 
> ++  context = gst_element_get_context (downloader->priv->parent, "http-headers");
> ++  if (!context) {
> ++    GstQuery *context_query = gst_query_new_context ("http-headers");
> ++    GstPad *parent_sink_pad =
> ++        gst_element_get_static_pad (downloader->priv->parent, "sink");
> ++    if (gst_pad_peer_query (parent_sink_pad, context_query)) {
> ++
> ++      gst_query_parse_context (context_query, &context);
> ++      gst_element_set_context (downloader->priv->parent, context);
> ++    }
> ++    gst_object_unref (parent_sink_pad);
> ++    gst_query_unref (context_query);
> ++  }
> ++
> ++  if (context) {
> ++    const GstStructure *s = gst_context_get_structure (context);
> ++    const gchar **cookies = NULL;
> ++    gst_structure_get (s, "cookies", G_TYPE_STRV, &cookies, NULL);
> ++    if (cookies) {
> ++      GST_DEBUG_OBJECT (downloader, "Passing cookies through");
> ++      g_object_set (downloader->priv->urisrc, "cookies", cookies, NULL);
> ++    }
> ++    gst_context_unref (context);
> ++  }
> ++
> +   /* add a sync handler for the bus messages to detect errors in the download */
> +   gst_element_set_bus (GST_ELEMENT (downloader->priv->urisrc),
> +       downloader->priv->bus);
> +diff --git a/gst-libs/gst/uridownloader/gsturidownloader.h b/gst-libs/gst/uridownloader/gsturidownloader.h
> +index 80b8a3e..36cbf65 100644
> +--- a/gst-libs/gst/uridownloader/gsturidownloader.h
> ++++ b/gst-libs/gst/uridownloader/gsturidownloader.h
> +@@ -60,7 +60,7 @@ struct _GstUriDownloaderClass
> + 
> + GType gst_uri_downloader_get_type (void);
> + 
> +-GstUriDownloader * gst_uri_downloader_new (void);
> ++GstUriDownloader * gst_uri_downloader_new (GstElement * parent);
> + GstFragment * gst_uri_downloader_fetch_uri (GstUriDownloader * downloader, const gchar * uri, const gchar * referer, gboolean compress, gboolean refresh, gboolean allow_cache, GError ** err);
> + GstFragment * gst_uri_downloader_fetch_uri_with_range (GstUriDownloader * downloader, const gchar * uri, const gchar * referer, gboolean compress, gboolean refresh, gboolean allow_cache, gint64 range_start, gint64 range_end, GError ** err);
> + void gst_uri_downloader_reset (GstUriDownloader *downloader);
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch
> new file mode 100644
> index 0000000000..97d83aa4f7
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch
> @@ -0,0 +1,109 @@
> +From cbf3d75b3d693e50722534d30a8f51995a419803 Mon Sep 17 00:00:00 2001
> +From: Philippe Normand <philn@igalia.com>
> +Date: Fri, 4 Nov 2016 09:56:33 +0100
> +Subject: [PATCH 5/6] mpdparser: MS PlayReady ContentProtection parsing
> +
> +The "pro" (PlayReady Object) element contents are now base64-decoded
> +and properly stored in Protection events.
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=773936
> +---
> + ext/dash/gstdashdemux.c |  2 +-
> + ext/dash/gstmpdparser.c | 41 ++++++++++++++++++++++++++++++++++++++++-
> + ext/dash/gstmpdparser.h |  1 +
> + 3 files changed, 42 insertions(+), 2 deletions(-)
> +
> +diff --git a/ext/dash/gstdashdemux.c b/ext/dash/gstdashdemux.c
> +index 271f70f..b10465e 100644
> +--- a/ext/dash/gstdashdemux.c
> ++++ b/ext/dash/gstdashdemux.c
> +@@ -745,7 +745,7 @@ gst_dash_demux_send_content_protection_event (gpointer data, gpointer userdata)
> +   /* RFC 2141 states: The leading "urn:" sequence is case-insensitive */
> +   schemeIdUri = g_ascii_strdown (cp->schemeIdUri, -1);
> +   if (g_str_has_prefix (schemeIdUri, "urn:uuid:")) {
> +-    pssi_len = strlen (cp->value);
> ++    pssi_len = cp->value_len;
> +     pssi = gst_buffer_new_wrapped (g_memdup (cp->value, pssi_len), pssi_len);
> +     GST_LOG_OBJECT (stream, "Queuing Protection event on source pad");
> +     /* RFC 4122 states that the hex part of a UUID is in lower case,
> +diff --git a/ext/dash/gstmpdparser.c b/ext/dash/gstmpdparser.c
> +index 15d6d98..f0b3ceb 100644
> +--- a/ext/dash/gstmpdparser.c
> ++++ b/ext/dash/gstmpdparser.c
> +@@ -1313,6 +1313,7 @@ gst_mpdparser_parse_descriptor_type_node (GList ** list, xmlNode * a_node)
> +     /* if no value attribute, use XML string representation of the node */
> +     gst_mpdparser_get_xml_node_as_string (a_node, &new_descriptor->value);
> +   }
> ++  new_descriptor->value_len = strlen(new_descriptor->value);
> + }
> + 
> + static void
> +@@ -1734,6 +1735,44 @@ error:
> + }
> + 
> + static void
> ++gst_mpdparser_parse_content_protection_node (GList ** list, xmlNode * a_node)
> ++{
> ++  gchar *value = NULL;
> ++  if (gst_mpdparser_get_xml_prop_string (a_node, "value", &value)) {
> ++    if (!g_strcmp0 (value, "MSPR 2.0")) {
> ++      xmlNode *cur_node;
> ++      for (cur_node = a_node->children; cur_node; cur_node = cur_node->next) {
> ++        if (cur_node->type == XML_ELEMENT_NODE) {
> ++          if (xmlStrcmp (cur_node->name, (xmlChar *) "pro") == 0) {
> ++            gsize decoded_len;
> ++            GstDescriptorType *new_descriptor;
> ++            new_descriptor = g_slice_new0 (GstDescriptorType);
> ++            *list = g_list_append (*list, new_descriptor);
> ++
> ++            gst_mpdparser_get_xml_prop_string (a_node, "schemeIdUri",
> ++                &new_descriptor->schemeIdUri);
> ++
> ++            gst_mpdparser_get_xml_node_content (cur_node,
> ++                &new_descriptor->value);
> ++            g_base64_decode_inplace (new_descriptor->value, &decoded_len);
> ++            *(new_descriptor->value + decoded_len) = '\0';
> ++            new_descriptor->value_len = decoded_len;
> ++            goto beach;
> ++          }
> ++        }
> ++      }
> ++    } else {
> ++      gst_mpdparser_parse_descriptor_type_node (list, a_node);
> ++    }
> ++  } else {
> ++    gst_mpdparser_parse_descriptor_type_node (list, a_node);
> ++  }
> ++beach:
> ++  if (value)
> ++    g_free (value);
> ++}
> ++
> ++static void
> + gst_mpdparser_parse_representation_base_type (GstRepresentationBaseType **
> +     pointer, xmlNode * a_node)
> + {
> +@@ -1788,7 +1827,7 @@ gst_mpdparser_parse_representation_base_type (GstRepresentationBaseType **
> +             (&representation_base->AudioChannelConfiguration, cur_node);
> +       } else if (xmlStrcmp (cur_node->name,
> +               (xmlChar *) "ContentProtection") == 0) {
> +-        gst_mpdparser_parse_descriptor_type_node
> ++        gst_mpdparser_parse_content_protection_node
> +             (&representation_base->ContentProtection, cur_node);
> +       }
> +     }
> +diff --git a/ext/dash/gstmpdparser.h b/ext/dash/gstmpdparser.h
> +index 85b97ea..738de68 100644
> +--- a/ext/dash/gstmpdparser.h
> ++++ b/ext/dash/gstmpdparser.h
> +@@ -277,6 +277,7 @@ struct _GstDescriptorType
> + {
> +   gchar *schemeIdUri;
> +   gchar *value;
> ++  glong value_len;
> + };
> + 
> + struct _GstContentComponentNode
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
> index 0bb4053e43..c894945748 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
> @@ -11,13 +11,16 @@ SRC_URI = " \
>      file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
>      file://avoid-including-sys-poll.h-directly.patch \
>      file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
> +    file://0001-mssdemux-improved-live-playback-support.patch \
>      file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
> -    file://0009-glimagesink-Downrank-to-marginal.patch \
>      file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
>      file://0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch \
> -    file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch \
>      file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
> -    file://0001-mssdemux-improved-live-playback-support.patch \
> +    file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch \
> +    file://0003-adaptivedemux-minimal-HTTP-context-support.patch \
> +    file://0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch \
> +    file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch \
> +    file://0009-glimagesink-Downrank-to-marginal.patch \
>  "
>  SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
>  SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"


--------------8CBED067B820C6B63226B3E3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 04/27/2018 08:38 PM, wouterlucas
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20180428033806.21451-1-wouter@wouterlucas.com">
      <pre wrap="">Signed-off-by: wouterlucas <a class="moz-txt-link-rfc2396E" href="mailto:wouter@wouterlucas.com">&lt;wouter@wouterlucas.com&gt;</a>
---
 ...demux-improved-live-playback-support.patch | 358 ++++++++----------
 ...implement-adaptivedemux-s-get_live_s.patch |  63 +--
 ...vedemux-minimal-HTTP-context-support.patch | 142 +++++++
 ...-PlayReady-ContentProtection-parsing.patch | 109 ++++++
 .../gstreamer1.0-plugins-bad_1.10.4.bb        |   9 +-
 5 files changed, 452 insertions(+), 229 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-support.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch</pre>
    </blockquote>
    <br>
    This fails with:<br>
    <br>
    <pre><span class="stderr">RROR: gstreamer1.0-plugins-bad-1.10.4-r0 do_fetch: Fetcher failure: Unable to find file <a class="moz-txt-link-freetext" href="file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch">file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch</a> anywhere. The paths that were searched were:
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/poky
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/poky
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/files/poky
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/qemux86
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/qemux86
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/files/qemux86
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/qemuall
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/qemuall
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/files/qemuall
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/x86
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/x86
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/files/x86
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/i586
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/i586
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/files/i586
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad-1.10.4/
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/
    /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/files/
    /srv/autobuilder/autobuilder.yoctoproject.org/current_sources
ERROR: gstreamer1.0-plugins-bad-1.10.4-r0 do_fetch: Fetcher failure for URL: '<a class="moz-txt-link-freetext" href="file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch">file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch</a>'. Unable to fetch URL from any source.
ERROR: gstreamer1.0-plugins-bad-1.10.4-r0 do_fetch: Function failed: base_do_fetch
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/build/tmp/work/i586-poky-linux/gstreamer1.0-plugins-bad/1.10.4-r0/temp/log.do_fetch.1786
</span><span class="stdout">NOTE: recipe gstreamer1.0-plugins-bad-1.10.4-r0: task do_fetch: Failed
</span><span class="stderr">ERROR: Task (/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb:do_fetch) </span></pre>
    <blockquote type="cite"
      cite="mid:20180428033806.21451-1-wouter@wouterlucas.com">
      <pre wrap="">
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
index 4832c18e78..041a3d6313 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
@@ -1,7 +1,7 @@
-From 73721ad4e9e2d32e1c8b6a3b4aaa98401530e58a Mon Sep 17 00:00:00 2001
+From 12b9645c4c5b94ff4fd5062bdb02b63db7648db9 Mon Sep 17 00:00:00 2001
 From: Philippe Normand <a class="moz-txt-link-rfc2396E" href="mailto:philn@igalia.com">&lt;philn@igalia.com&gt;</a>
-Date: Tue, 29 Nov 2016 14:43:41 +0100
-Subject: [PATCH] mssdemux: improved live playback support
+Date: Thu, 10 Sep 2015 16:13:30 +0200
+Subject: [PATCH 1/6] mssdemux: improved live playback support
 
 When a MSS server hosts a live stream the fragments listed in the
 manifest usually don't have accurate timestamps and duration, except
@@ -12,23 +12,20 @@ be incrementally built by parsing the first/current fragment.
 
 <a class="moz-txt-link-freetext" href="https://bugzilla.gnome.org/show_bug.cgi?id=755036">https://bugzilla.gnome.org/show_bug.cgi?id=755036</a>
 ---
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
-
  ext/smoothstreaming/Makefile.am               |   2 +
- ext/smoothstreaming/gstmssdemux.c             |  60 ++++++
- ext/smoothstreaming/gstmssfragmentparser.c    | 266 ++++++++++++++++++++++++++
- ext/smoothstreaming/gstmssfragmentparser.h    |  84 ++++++++
- ext/smoothstreaming/gstmssmanifest.c          | 158 ++++++++++++++-
- ext/smoothstreaming/gstmssmanifest.h          |   7 +
- gst-libs/gst/adaptivedemux/gstadaptivedemux.c |  27 ++-
+ ext/smoothstreaming/gstmssdemux.c             |  61 ++++++
+ ext/smoothstreaming/gstmssfragmentparser.c    | 255 ++++++++++++++++++++++++++
+ ext/smoothstreaming/gstmssfragmentparser.h    |  84 +++++++++
+ ext/smoothstreaming/gstmssmanifest.c          | 155 ++++++++++++++--
+ ext/smoothstreaming/gstmssmanifest.h          |   3 +
+ gst-libs/gst/adaptivedemux/gstadaptivedemux.c |  28 ++-
  gst-libs/gst/adaptivedemux/gstadaptivedemux.h |  14 ++
- 8 files changed, 606 insertions(+), 12 deletions(-)
+ 8 files changed, 586 insertions(+), 16 deletions(-)
  create mode 100644 ext/smoothstreaming/gstmssfragmentparser.c
  create mode 100644 ext/smoothstreaming/gstmssfragmentparser.h
 
 diff --git a/ext/smoothstreaming/Makefile.am b/ext/smoothstreaming/Makefile.am
-index 4faf9df9f..a5e1ad6ae 100644
+index 4faf9df..a5e1ad6 100644
 --- a/ext/smoothstreaming/Makefile.am
 +++ b/ext/smoothstreaming/Makefile.am
 @@ -13,8 +13,10 @@ libgstsmoothstreaming_la_LIBADD = \
@@ -43,10 +40,10 @@ index 4faf9df9f..a5e1ad6ae 100644
 +	gstmssfragmentparser.h \
  	gstmssmanifest.h
 diff --git a/ext/smoothstreaming/gstmssdemux.c b/ext/smoothstreaming/gstmssdemux.c
-index 12fb40497..120d9c22b 100644
+index 9d0aece..70b541e 100644
 --- a/ext/smoothstreaming/gstmssdemux.c
 +++ b/ext/smoothstreaming/gstmssdemux.c
-@@ -135,11 +135,18 @@ gst_mss_demux_stream_update_fragment_info (GstAdaptiveDemuxStream * stream);
+@@ -135,9 +135,16 @@ gst_mss_demux_stream_update_fragment_info (GstAdaptiveDemuxStream * stream);
  static gboolean gst_mss_demux_seek (GstAdaptiveDemux * demux, GstEvent * seek);
  static gint64
  gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux);
@@ -56,16 +53,14 @@ index 12fb40497..120d9c22b 100644
  static GstFlowReturn
  gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
      GstBuffer * buffer);
- static gboolean gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux,
-     gint64 * start, gint64 * stop);
 +static GstFlowReturn gst_mss_demux_data_received (GstAdaptiveDemux * demux,
-+    GstAdaptiveDemuxStream * stream, GstBuffer * buffer);
++    GstAdaptiveDemuxStream * stream);
 +static gboolean
 +gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * demux);
  
  static void
  gst_mss_demux_class_init (GstMssDemuxClass * klass)
-@@ -192,10 +199,15 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
+@@ -190,8 +197,13 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
        gst_mss_demux_stream_select_bitrate;
    gstadaptivedemux_class-&gt;stream_update_fragment_info =
        gst_mss_demux_stream_update_fragment_info;
@@ -73,36 +68,39 @@ index 12fb40497..120d9c22b 100644
 +      gst_mss_demux_stream_get_fragment_waiting_time;
    gstadaptivedemux_class-&gt;update_manifest_data =
        gst_mss_demux_update_manifest_data;
-   gstadaptivedemux_class-&gt;get_live_seek_range =
-       gst_mss_demux_get_live_seek_range;
 +  gstadaptivedemux_class-&gt;data_received = gst_mss_demux_data_received;
 +  gstadaptivedemux_class-&gt;requires_periodical_playlist_update =
 +      gst_mss_demux_requires_periodical_playlist_update;
  
    GST_DEBUG_CATEGORY_INIT (mssdemux_debug, "mssdemux", 0, "mssdemux plugin");
  }
-@@ -650,6 +662,13 @@ gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux)
+@@ -648,6 +660,17 @@ gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux)
    return interval;
  }
  
 +static gint64
 +gst_mss_demux_stream_get_fragment_waiting_time (GstAdaptiveDemuxStream * stream)
 +{
-+  /* Wait a second for live streams so we don't try premature fragments downloading */
-+  return GST_SECOND;
++  GstMssDemuxStream *mssstream = (GstMssDemuxStream *) stream;
++  GstMssStreamType streamtype =
++      gst_mss_stream_get_type (mssstream-&gt;manifest_stream);
++
++  /* Wait a second for live audio streams so we don't try premature fragments downloading */
++  return streamtype == MSS_STREAM_TYPE_AUDIO ? GST_SECOND : 0;
 +}
 +
  static GstFlowReturn
  gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
      GstBuffer * buffer)
-@@ -670,3 +689,44 @@ gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux, gint64 * start,
- 
-   return gst_mss_manifest_get_live_seek_range (mssdemux-&gt;manifest, start, stop);
+@@ -659,3 +682,41 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
+   gst_mss_manifest_reload_fragments (mssdemux-&gt;manifest, buffer);
+   return GST_FLOW_OK;
  }
 +
++
 +static GstFlowReturn
 +gst_mss_demux_data_received (GstAdaptiveDemux * demux,
-+    GstAdaptiveDemuxStream * stream, GstBuffer * buffer)
++    GstAdaptiveDemuxStream * stream)
 +{
 +  GstMssDemux *mssdemux = GST_MSS_DEMUX_CAST (demux);
 +  GstMssDemuxStream *mssstream = (GstMssDemuxStream *) stream;
@@ -110,27 +108,23 @@ index 12fb40497..120d9c22b 100644
 +
 +  if (!gst_mss_manifest_is_live (mssdemux-&gt;manifest)) {
 +    return GST_ADAPTIVE_DEMUX_CLASS (parent_class)-&gt;data_received (demux,
-+        stream, buffer);
++        stream);
 +  }
 +
 +  if (gst_mss_stream_fragment_parsing_needed (mssstream-&gt;manifest_stream)) {
-+    gst_mss_manifest_live_adapter_push (mssstream-&gt;manifest_stream, buffer);
-+    available =
-+        gst_mss_manifest_live_adapter_available (mssstream-&gt;manifest_stream);
++    available = gst_adapter_available (stream-&gt;adapter);
 +    // FIXME: try to reduce this minimal size.
 +    if (available &lt; 4096) {
 +      return GST_FLOW_OK;
 +    } else {
++      GstBuffer *buffer = gst_adapter_get_buffer (stream-&gt;adapter, available);
 +      GST_LOG_OBJECT (stream-&gt;pad, "enough data, parsing fragment.");
-+      buffer =
-+          gst_mss_manifest_live_adapter_take_buffer (mssstream-&gt;manifest_stream,
-+          available);
-+      gst_mss_stream_parse_fragment (mssstream-&gt;manifest_stream, buffer);
++      gst_mss_stream_fragment_parse (mssstream-&gt;manifest_stream, buffer);
++      gst_buffer_unref (buffer);
 +    }
 +  }
 +
-+  return GST_ADAPTIVE_DEMUX_CLASS (parent_class)-&gt;data_received (demux, stream,
-+      buffer);
++  return GST_ADAPTIVE_DEMUX_CLASS (parent_class)-&gt;data_received (demux, stream);
 +}
 +
 +static gboolean
@@ -142,17 +136,17 @@ index 12fb40497..120d9c22b 100644
 +}
 diff --git a/ext/smoothstreaming/gstmssfragmentparser.c b/ext/smoothstreaming/gstmssfragmentparser.c
 new file mode 100644
-index 000000000..b554d4f31
+index 0000000..01c3b15
 --- /dev/null
 +++ b/ext/smoothstreaming/gstmssfragmentparser.c
-@@ -0,0 +1,266 @@
+@@ -0,0 +1,255 @@
 +/*
 + * Microsoft Smooth-Streaming fragment parsing library
 + *
 + * gstmssfragmentparser.h
 + *
-+ * Copyright (C) 2016 Igalia S.L
-+ * Copyright (C) 2016 Metrological
++ * Copyright (C) 2015 Igalia S.L
++ * Copyright (C) 2015 Metrological
 + *   Author: Philippe Normand <a class="moz-txt-link-rfc2396E" href="mailto:philn@igalia.com">&lt;philn@igalia.com&gt;</a>
 + *
 + * This library is free software; you can redistribute it and/or
@@ -333,12 +327,8 @@ index 000000000..b554d4f31
 +          size = gst_byte_reader_get_uint32_be_unchecked (&amp;reader);
 +          fourcc = gst_byte_reader_get_uint32_le_unchecked (&amp;reader);
 +          if (fourcc == GST_MSS_FRAGMENT_FOURCC_TRUN) {
-+            GST_TRACE ("trun box found, size: %" G_GUINT32_FORMAT, size);
-+            if (!gst_byte_reader_skip (&amp;reader, size - 8)) {
-+              GST_WARNING ("Failed to skip trun box, enough data?");
-+              error = TRUE;
-+              goto beach;
-+            }
++            gst_byte_reader_skip_unchecked (&amp;reader, size - 8);
++            GST_TRACE ("trun box found, size: %u", size);
 +          }
 +        }
 +      }
@@ -354,11 +344,7 @@ index 000000000..b554d4f31
 +    }
 +
 +    GST_TRACE ("box size: %" G_GUINT32_FORMAT, size);
-+    if (!gst_byte_reader_get_uint32_le (&amp;reader, &amp;fourcc)) {
-+      GST_WARNING ("Failed to get fourcc, enough data?");
-+      error = TRUE;
-+      break;
-+    }
++    fourcc = gst_byte_reader_get_uint32_le_unchecked (&amp;reader);
 +
 +    if (fourcc == GST_MSS_FRAGMENT_FOURCC_MDAT) {
 +      GST_LOG ("mdat box found<a class="moz-txt-link-rfc2396E" href="mailto:);@@-367,8+353,7@@index000000000..b554d4f31+}++if(fourcc!=GST_MSS_FRAGMENT_FOURCC_UUID){-+GST_ERROR(">");
@@ -367,8 +353,7 @@ index 000000000..b554d4f31
 +    }
 +
 +    if (fourcc != GST_MSS_FRAGMENT_FOURCC_UUID) {
-+      GST_ERROR ("</a>invalid UUID fourcc: %" GST_FOURCC_FORMAT,
-+          GST_FOURCC_ARGS (fourcc));
++      GST_ERROR ("invalid UUID fourcc");
 +      error = TRUE;
 +      break;
 +    }
@@ -403,8 +388,6 @@ index 000000000..b554d4f31
 +    }
 +  }
 +
-+beach:
-+
 +  if (!error)
 +    parser-&gt;status = GST_MSS_FRAGMENT_HEADER_PARSER_FINISHED;
 +
@@ -414,7 +397,7 @@ index 000000000..b554d4f31
 +}
 diff --git a/ext/smoothstreaming/gstmssfragmentparser.h b/ext/smoothstreaming/gstmssfragmentparser.h
 new file mode 100644
-index 000000000..cf4711865
+index 0000000..6626358
 --- /dev/null
 +++ b/ext/smoothstreaming/gstmssfragmentparser.h
 @@ -0,0 +1,84 @@
@@ -423,8 +406,8 @@ index 000000000..cf4711865
 + *
 + * gstmssfragmentparser.h
 + *
-+ * Copyright (C) 2016 Igalia S.L
-+ * Copyright (C) 2016 Metrological
++ * Copyright (C) 2015 Igalia S.L
++ * Copyright (C) 2015 Metrological
 + *   Author: Philippe Normand <a class="moz-txt-link-rfc2396E" href="mailto:philn@igalia.com">&lt;philn@igalia.com&gt;</a>
 + *
 + * This library is free software; you can redistribute it and/or
@@ -503,14 +486,14 @@ index 000000000..cf4711865
 +
 +#endif /* __GST_MSS_FRAGMENT_PARSER_H__ */
 diff --git a/ext/smoothstreaming/gstmssmanifest.c b/ext/smoothstreaming/gstmssmanifest.c
-index 144bbb42d..e1031ba55 100644
+index 1b72e8d..d50a51a 100644
 --- a/ext/smoothstreaming/gstmssmanifest.c
 +++ b/ext/smoothstreaming/gstmssmanifest.c
 @@ -1,5 +1,7 @@
  /* GStreamer
   * Copyright (C) 2012 Smart TV Alliance
-+ * Copyright (C) 2016 Igalia S.L
-+ * Copyright (C) 2016 Metrological
++ * Copyright (C) 2015 Igalia S.L
++ * Copyright (C) 2015 Metrological
   *  Author: Thiago Sousa Santos <a class="moz-txt-link-rfc2396E" href="mailto:thiago.sousa.santos@collabora.com">&lt;thiago.sousa.santos@collabora.com&gt;</a>, Collabora Ltd.
   *
   * gstmssmanifest.c:
@@ -522,12 +505,12 @@ index 144bbb42d..e1031ba55 100644
  
  GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
  #define GST_CAT_DEFAULT mssdemux_debug
-@@ -74,12 +77,17 @@ struct _GstMssStream
+@@ -73,12 +76,17 @@ struct _GstMssStream
    gboolean active;              /* if the stream is currently being used */
    gint selectedQualityIndex;
  
 +  gboolean has_live_fragments;
-+  GstAdapter *live_adapter;
++  GQueue live_fragments;
 +
    GList *fragments;
    GList *qualities;
@@ -540,15 +523,15 @@ index 144bbb42d..e1031ba55 100644
    guint fragment_repetition_index;
    GList *current_fragment;
    GList *current_quality;
-@@ -96,6 +104,7 @@ struct _GstMssManifest
+@@ -94,6 +102,7 @@ struct _GstMssManifest
+   xmlNodePtr xmlrootnode;
  
    gboolean is_live;
-   gint64 dvr_window;
 +  guint64 look_ahead_fragment_count;
  
    GString *protection_system_id;
    gchar *protection_data;
-@@ -235,7 +244,8 @@ compare_bitrate (GstMssStreamQuality * a, GstMssStreamQuality * b)
+@@ -233,7 +242,8 @@ compare_bitrate (GstMssStreamQuality * a, GstMssStreamQuality * b)
  }
  
  static void
@@ -558,7 +541,7 @@ index 144bbb42d..e1031ba55 100644
  {
    xmlNodePtr iter;
    GstMssFragmentListBuilder builder;
-@@ -248,9 +258,21 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
+@@ -246,9 +256,18 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
    stream-&gt;url = (gchar *) xmlGetProp (node, (xmlChar *) MSS_PROP_URL);
    stream-&gt;lang = (gchar *) xmlGetProp (node, (xmlChar *) MSS_PROP_LANGUAGE);
  
@@ -567,9 +550,6 @@ index 144bbb42d..e1031ba55 100644
 +   * playlist can be built incrementally from the first fragment
 +   * of the manifest.
 +   */
-+
-+  GST_DEBUG ("Live stream: %s, look-ahead fragments: %" G_GUINT64_FORMAT,
-+      manifest-&gt;is_live ? "yes" : "no", manifest-&gt;look_ahead_fragment_count);
 +  stream-&gt;has_live_fragments = manifest-&gt;is_live
 +      &amp;&amp; manifest-&gt;look_ahead_fragment_count;
 +
@@ -581,13 +561,15 @@ index 144bbb42d..e1031ba55 100644
      } else if (node_has_type (iter, MSS_NODE_STREAM_QUALITY)) {
        GstMssStreamQuality *quality = gst_mss_stream_quality_new (iter);
        stream-&gt;qualities = g_list_prepend (stream-&gt;qualities, quality);
-@@ -259,17 +281,24 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
+@@ -257,17 +276,26 @@ _gst_mss_stream_init (GstMssStream * stream, xmlNodePtr node)
      }
    }
  
 -  stream-&gt;fragments = g_list_reverse (builder.fragments);
 +  if (stream-&gt;has_live_fragments) {
-+    stream-&gt;live_adapter = gst_adapter_new ();
++    g_queue_init (&amp;stream-&gt;live_fragments);
++    g_queue_push_tail (&amp;stream-&gt;live_fragments, builder.fragments-&gt;data);
++    stream-&gt;current_fragment = g_queue_peek_head_link (&amp;stream-&gt;live_fragments);
 +  }
 +
 +  if (builder.fragments) {
@@ -609,7 +591,7 @@ index 144bbb42d..e1031ba55 100644
  }
  
  
-@@ -315,6 +344,7 @@ gst_mss_manifest_new (GstBuffer * data)
+@@ -313,6 +341,7 @@ gst_mss_manifest_new (GstBuffer * data)
    xmlNodePtr nodeiter;
    gchar *live_str;
    GstMapInfo mapinfo;
@@ -617,33 +599,21 @@ index 144bbb42d..e1031ba55 100644
  
    if (!gst_buffer_map (data, &amp;mapinfo, GST_MAP_READ)) {
      return NULL;
-@@ -335,6 +365,7 @@ gst_mss_manifest_new (GstBuffer * data)
-   /* the entire file is always available for non-live streams */
-   if (!manifest-&gt;is_live) {
-     manifest-&gt;dvr_window = 0;
-+    manifest-&gt;look_ahead_fragment_count = 0;
-   } else {
-     /* if 0, or non-existent, the length is infinite */
-     gchar *dvr_window_str = (gchar *) xmlGetProp (root,
-@@ -346,6 +377,17 @@ gst_mss_manifest_new (GstBuffer * data)
-         manifest-&gt;dvr_window = 0;
-       }
-     }
-+
-+    look_ahead_fragment_count_str =
-+        (gchar *) xmlGetProp (root, (xmlChar *) "LookAheadFragmentCount");
-+    if (look_ahead_fragment_count_str) {
-+      manifest-&gt;look_ahead_fragment_count =
-+          g_ascii_strtoull (look_ahead_fragment_count_str, NULL, 10);
-+      xmlFree (look_ahead_fragment_count_str);
-+      if (manifest-&gt;look_ahead_fragment_count &lt;= 0) {
-+        manifest-&gt;look_ahead_fragment_count = 0;
-+      }
-+    }
+@@ -330,13 +359,21 @@ gst_mss_manifest_new (GstBuffer * data)
+     xmlFree (live_str);
    }
  
++  look_ahead_fragment_count_str =
++      (gchar *) xmlGetProp (root, (xmlChar *) "LookAheadFragmentCount");
++  if (look_ahead_fragment_count_str) {
++    manifest-&gt;look_ahead_fragment_count =
++        g_ascii_strtoull (look_ahead_fragment_count_str, NULL, 10);
++    xmlFree (look_ahead_fragment_count_str);
++  }
++
    for (nodeiter = root-&gt;children; nodeiter; nodeiter = nodeiter-&gt;next) {
-@@ -354,7 +396,7 @@ gst_mss_manifest_new (GstBuffer * data)
+     if (nodeiter-&gt;type == XML_ELEMENT_NODE
+         &amp;&amp; (strcmp ((const char *) nodeiter-&gt;name, "StreamIndex") == 0)) {
        GstMssStream *stream = g_new0 (GstMssStream, 1);
  
        manifest-&gt;streams = g_slist_append (manifest-&gt;streams, stream);
@@ -652,39 +622,56 @@ index 144bbb42d..e1031ba55 100644
      }
  
      if (nodeiter-&gt;type == XML_ELEMENT_NODE
-@@ -371,6 +413,11 @@ gst_mss_manifest_new (GstBuffer * data)
+@@ -353,13 +390,19 @@ gst_mss_manifest_new (GstBuffer * data)
  static void
  gst_mss_stream_free (GstMssStream * stream)
  {
-+  if (stream-&gt;live_adapter) {
-+    gst_adapter_clear (stream-&gt;live_adapter);
-+    g_object_unref (stream-&gt;live_adapter);
+-  g_list_free_full (stream-&gt;fragments, g_free);
++  if (stream-&gt;has_live_fragments) {
++    g_queue_foreach (&amp;stream-&gt;live_fragments, (GFunc) g_free, NULL);
++    g_queue_clear (&amp;stream-&gt;live_fragments);
++  } else {
++    g_list_free_full (stream-&gt;fragments, g_free);
 +  }
-+
-   g_list_free_full (stream-&gt;fragments, g_free);
    g_list_free_full (stream-&gt;qualities,
        (GDestroyNotify) gst_mss_stream_quality_free);
-@@ -379,6 +426,7 @@ gst_mss_stream_free (GstMssStream * stream)
+   xmlFree (stream-&gt;url);
+   xmlFree (stream-&gt;lang);
    g_regex_unref (stream-&gt;regex_position);
    g_regex_unref (stream-&gt;regex_bitrate);
-   g_free (stream);
 +  gst_mss_fragment_parser_clear (&amp;stream-&gt;fragment_parser);
+   g_free (stream);
  }
  
- void
-@@ -1079,6 +1127,9 @@ GstFlowReturn
+@@ -984,7 +1027,12 @@ gst_mss_stream_get_fragment_gst_timestamp (GstMssStream * stream)
+   g_return_val_if_fail (stream-&gt;active, GST_CLOCK_TIME_NONE);
+ 
+   if (!stream-&gt;current_fragment) {
+-    GList *last = g_list_last (stream-&gt;fragments);
++    GList *last;
++
++    if (stream-&gt;has_live_fragments)
++      last = g_queue_peek_tail_link (&amp;stream-&gt;live_fragments);
++    else
++      last = g_list_last (stream-&gt;fragments);
+     if (last == NULL)
+       return GST_CLOCK_TIME_NONE;
+ 
+@@ -1037,21 +1085,54 @@ GstFlowReturn
  gst_mss_stream_advance_fragment (GstMssStream * stream)
  {
    GstMssStreamFragment *fragment;
++  GstMssStreamFragment *prev_fragment;
 +  const gchar *stream_type_name =
 +      gst_mss_stream_type_name (gst_mss_stream_get_type (stream));
 +
    g_return_val_if_fail (stream-&gt;active, GST_FLOW_ERROR);
  
    if (stream-&gt;current_fragment == NULL)
-@@ -1086,14 +1137,20 @@ gst_mss_stream_advance_fragment (GstMssStream * stream)
+     return GST_FLOW_EOS;
  
-   fragment = stream-&gt;current_fragment-&gt;data;
+-  fragment = stream-&gt;current_fragment-&gt;data;
++  prev_fragment = fragment = stream-&gt;current_fragment-&gt;data;
    stream-&gt;fragment_repetition_index++;
 -  if (stream-&gt;fragment_repetition_index &lt; fragment-&gt;repetitions) {
 -    return GST_FLOW_OK;
@@ -693,10 +680,34 @@ index 144bbb42d..e1031ba55 100644
 +    goto beach;
  
    stream-&gt;fragment_repetition_index = 0;
-   stream-&gt;current_fragment = g_list_next (stream-&gt;current_fragment);
+-  stream-&gt;current_fragment = g_list_next (stream-&gt;current_fragment);
++
++  if (stream-&gt;has_live_fragments)
++    stream-&gt;current_fragment = g_queue_pop_head_link (&amp;stream-&gt;live_fragments);
++  else
++    stream-&gt;current_fragment = g_list_next (stream-&gt;current_fragment);
++
++  if (stream-&gt;current_fragment != NULL) {
++    fragment = stream-&gt;current_fragment-&gt;data;
++    if (fragment-&gt;time &lt;= prev_fragment-&gt;time) {
++      while (fragment-&gt;time &lt;= prev_fragment-&gt;time) {
++        if (stream-&gt;has_live_fragments)
++          stream-&gt;current_fragment =
++              g_queue_pop_head_link (&amp;stream-&gt;live_fragments);
++        else
++          stream-&gt;current_fragment = g_list_next (stream-&gt;current_fragment);
++        if (stream-&gt;current_fragment == NULL)
++          break;
++        fragment = stream-&gt;current_fragment-&gt;data;
++      }
++    }
++  }
 +
 +  GST_DEBUG ("Advanced to fragment #%d on %s stream", fragment-&gt;number,
 +      stream_type_name);
++  if (stream-&gt;has_live_fragments)
++    GST_LOG ("%u fragments left in the %s stream queue",
++        g_queue_get_length (&amp;stream-&gt;live_fragments), stream_type_name);
    if (stream-&gt;current_fragment == NULL)
      return GST_FLOW_EOS;
 +
@@ -706,57 +717,22 @@ index 144bbb42d..e1031ba55 100644
    return GST_FLOW_OK;
  }
  
-@@ -1173,6 +1230,11 @@ gst_mss_stream_seek (GstMssStream * stream, gboolean forward,
-   GST_DEBUG ("Stream %s seeking to %" G_GUINT64_FORMAT, stream-&gt;url, time);
-   for (iter = stream-&gt;fragments; iter; iter = g_list_next (iter)) {
-     fragment = iter-&gt;data;
-+    if (stream-&gt;has_live_fragments) {
-+      if (fragment-&gt;time + fragment-&gt;repetitions * fragment-&gt;duration &gt; time)
-+        stream-&gt;current_fragment = iter;
-+      break;
-+    }
-     if (fragment-&gt;time + fragment-&gt;repetitions * fragment-&gt;duration &gt; time) {
-       stream-&gt;current_fragment = iter;
-       stream-&gt;fragment_repetition_index =
-@@ -1256,9 +1318,14 @@ static void
- gst_mss_stream_reload_fragments (GstMssStream * stream, xmlNodePtr streamIndex)
- {
-   xmlNodePtr iter;
--  guint64 current_gst_time = gst_mss_stream_get_fragment_gst_timestamp (stream);
-+  guint64 current_gst_time;
-   GstMssFragmentListBuilder builder;
+@@ -1125,6 +1206,10 @@ gst_mss_stream_seek (GstMssStream * stream, gboolean forward,
+   guint64 timescale;
+   GstMssStreamFragment *fragment = NULL;
  
++  // FIXME: Seek support for live scenario using DVR window.
 +  if (stream-&gt;has_live_fragments)
 +    return;
 +
-+  current_gst_time = gst_mss_stream_get_fragment_gst_timestamp (stream);
-+
-   gst_mss_fragment_list_builder_init (&amp;builder);
+   timescale = gst_mss_stream_get_timescale (stream);
+   time = gst_util_uint64_scale_round (time, timescale, GST_SECOND);
  
-   GST_DEBUG ("Current position: %" GST_TIME_FORMAT,
-@@ -1514,3 +1581,74 @@ gst_mss_manifest_get_live_seek_range (GstMssManifest * manifest, gint64 * start,
- 
-   return ret;
+@@ -1406,3 +1491,47 @@ gst_mss_stream_get_lang (GstMssStream * stream)
+ {
+   return stream-&gt;lang;
  }
 +
-+void
-+gst_mss_manifest_live_adapter_push (GstMssStream * stream, GstBuffer * buffer)
-+{
-+  gst_adapter_push (stream-&gt;live_adapter, buffer);
-+}
-+
-+gsize
-+gst_mss_manifest_live_adapter_available (GstMssStream * stream)
-+{
-+  return gst_adapter_available (stream-&gt;live_adapter);
-+}
-+
-+GstBuffer *
-+gst_mss_manifest_live_adapter_take_buffer (GstMssStream * stream, gsize nbytes)
-+{
-+  return gst_adapter_take_buffer (stream-&gt;live_adapter, nbytes);
-+}
-+
 +gboolean
 +gst_mss_stream_fragment_parsing_needed (GstMssStream * stream)
 +{
@@ -764,11 +740,11 @@ index 144bbb42d..e1031ba55 100644
 +}
 +
 +void
-+gst_mss_stream_parse_fragment (GstMssStream * stream, GstBuffer * buffer)
++gst_mss_stream_fragment_parse (GstMssStream * stream, GstBuffer * buffer)
 +{
 +  GstMssStreamFragment *current_fragment = NULL;
-+  const gchar *stream_type_name;
-+  guint8 index;
++  const gchar *stream_type_name =
++      gst_mss_stream_type_name (gst_mss_stream_get_type (stream));
 +
 +  if (!stream-&gt;has_live_fragments)
 +    return;
@@ -780,29 +756,20 @@ index 144bbb42d..e1031ba55 100644
 +  current_fragment-&gt;time = stream-&gt;fragment_parser.tfxd.time;
 +  current_fragment-&gt;duration = stream-&gt;fragment_parser.tfxd.duration;
 +
-+  stream_type_name =
-+      gst_mss_stream_type_name (gst_mss_stream_get_type (stream));
-+
-+  for (index = 0; index &lt; stream-&gt;fragment_parser.tfrf.entries_count; index++) {
-+    GList *l = g_list_last (stream-&gt;fragments);
-+    GstMssStreamFragment *last;
++  for (guint8 index = 0; index &lt; stream-&gt;fragment_parser.tfrf.entries_count;
++      index++) {
++    GstMssStreamFragment *last = g_queue_peek_tail (&amp;stream-&gt;live_fragments);
 +    GstMssStreamFragment *fragment;
 +
-+    if (l == NULL)
-+      break;
-+
-+    last = (GstMssStreamFragment *) l-&gt;data;
-+
-+    if (last-&gt;time == stream-&gt;fragment_parser.tfrf.entries[index].time)
-+      continue;
-+
++    if (last == NULL)
++        break;
 +    fragment = g_new (GstMssStreamFragment, 1);
 +    fragment-&gt;number = last-&gt;number + 1;
 +    fragment-&gt;repetitions = 1;
 +    fragment-&gt;time = stream-&gt;fragment_parser.tfrf.entries[index].time;
 +    fragment-&gt;duration = stream-&gt;fragment_parser.tfrf.entries[index].duration;
 +
-+    stream-&gt;fragments = g_list_append (stream-&gt;fragments, fragment);
++    g_queue_push_tail (&amp;stream-&gt;live_fragments, fragment);
 +    GST_LOG ("Adding fragment number: %u to %s stream, time: %" G_GUINT64_FORMAT
 +        ", duration: %" G_GUINT64_FORMAT ", repetitions: %u",
 +        fragment-&gt;number, stream_type_name,
@@ -810,31 +777,20 @@ index 144bbb42d..e1031ba55 100644
 +  }
 +}
 diff --git a/ext/smoothstreaming/gstmssmanifest.h b/ext/smoothstreaming/gstmssmanifest.h
-index 6b7b1f971..03b066ae5 100644
+index af7419c..039877f 100644
 --- a/ext/smoothstreaming/gstmssmanifest.h
 +++ b/ext/smoothstreaming/gstmssmanifest.h
-@@ -26,6 +26,7 @@
- #include &lt;glib.h&gt;
- #include &lt;gio/gio.h&gt;
- #include &lt;gst/gst.h&gt;
-+#include &lt;gst/base/gstadapter.h&gt;
- 
- G_BEGIN_DECLS
- 
-@@ -73,5 +74,11 @@ const gchar * gst_mss_stream_get_lang (GstMssStream * stream);
+@@ -72,5 +72,8 @@ const gchar * gst_mss_stream_get_lang (GstMssStream * stream);
  
  const gchar * gst_mss_stream_type_name (GstMssStreamType streamtype);
  
-+void gst_mss_manifest_live_adapter_push(GstMssStream * stream, GstBuffer * buffer);
-+gsize gst_mss_manifest_live_adapter_available(GstMssStream * stream);
-+GstBuffer * gst_mss_manifest_live_adapter_take_buffer(GstMssStream * stream, gsize nbytes);
 +gboolean gst_mss_stream_fragment_parsing_needed(GstMssStream * stream);
-+void gst_mss_stream_parse_fragment(GstMssStream * stream, GstBuffer * buffer);
++void gst_mss_stream_fragment_parse(GstMssStream * stream, GstBuffer * buffer);
 +
  G_END_DECLS
  #endif /* __GST_MSS_MANIFEST_H__ */
 diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
-index 634e4f388..ddca726b6 100644
+index bf311d3..20bd839 100644
 --- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
 +++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
 @@ -291,6 +291,9 @@ gst_adaptive_demux_wait_until (GstClock * clock, GCond * cond, GMutex * mutex,
@@ -868,7 +824,7 @@ index 634e4f388..ddca726b6 100644
            }
          } else {
            /* no streams */
-@@ -2125,6 +2133,13 @@ gst_adaptive_demux_stream_data_received_default (GstAdaptiveDemux * demux,
+@@ -2113,6 +2121,13 @@ gst_adaptive_demux_stream_data_received_default (GstAdaptiveDemux * demux,
    return gst_adaptive_demux_stream_push_buffer (stream, buffer);
  }
  
@@ -882,25 +838,33 @@ index 634e4f388..ddca726b6 100644
  static GstFlowReturn
  _src_chain (GstPad * pad, GstObject * parent, GstBuffer * buffer)
  {
-@@ -3338,7 +3353,15 @@ gst_adaptive_demux_stream_download_loop (GstAdaptiveDemuxStream * stream)
+@@ -2209,7 +2224,7 @@ _src_chain (GstPad * pad, GstObject * parent, GstBuffer * buffer)
+       stream-&gt;download_chunk_start_time;
+   stream-&gt;download_total_bytes += gst_buffer_get_size (buffer);
+ 
+-  GST_DEBUG_OBJECT (stream-&gt;pad, "Received buffer of size %" G_GSIZE_FORMAT,
++  GST_LOG_OBJECT (stream-&gt;pad, "Received buffer of size %" G_GSIZE_FORMAT,
+       gst_buffer_get_size (buffer));
+ 
+   ret = klass-&gt;data_received (demux, stream, buffer);
+@@ -3326,7 +3341,14 @@ gst_adaptive_demux_stream_download_loop (GstAdaptiveDemuxStream * stream)
        GST_DEBUG_OBJECT (stream-&gt;pad, "EOS, checking to stop download loop");
        /* we push the EOS after releasing the object lock */
        if (gst_adaptive_demux_is_live (demux)) {
 -        if (gst_adaptive_demux_stream_wait_manifest_update (demux, stream)) {
 +        GstAdaptiveDemuxClass *demux_class =
-+            GST_ADAPTIVE_DEMUX_GET_CLASS (demux);
++          GST_ADAPTIVE_DEMUX_GET_CLASS (demux);
 +
 +        /* this might be a fragment download error, refresh the manifest, just in case */
 +        if (!demux_class-&gt;requires_periodical_playlist_update (demux)) {
 +          ret = gst_adaptive_demux_update_manifest (demux);
 +          break;
-+        } else if (gst_adaptive_demux_stream_wait_manifest_update (demux,
-+                stream)) {
++        } else if (gst_adaptive_demux_stream_wait_manifest_update (demux, stream)) {
            goto end;
          }
          gst_task_stop (stream-&gt;download_task);
 diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.h b/gst-libs/gst/adaptivedemux/gstadaptivedemux.h
-index 780f4d93f..9a1a1b7d1 100644
+index 780f4d9..9a1a1b7 100644
 --- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.h
 +++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.h
 @@ -459,6 +459,20 @@ struct _GstAdaptiveDemuxClass
@@ -925,5 +889,5 @@ index 780f4d93f..9a1a1b7d1 100644
  
  GType    gst_adaptive_demux_get_type (void);
 -- 
-2.11.0
+2.7.4
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
index 76d29e151b..c4639a2cda 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
@@ -1,7 +1,7 @@
-From e9178fa082116d4bf733b184a8b6951112c17900 Mon Sep 17 00:00:00 2001
+From e8155c77d8dcaf39ec564b85c4a56e64fce6de2b Mon Sep 17 00:00:00 2001
 From: Matthew Waters <a class="moz-txt-link-rfc2396E" href="mailto:matthew@centricular.com">&lt;matthew@centricular.com&gt;</a>
 Date: Thu, 10 Nov 2016 17:18:36 +1100
-Subject: [PATCH] smoothstreaming: implement adaptivedemux's
+Subject: [PATCH 1/2] smoothstreaming: implement adaptivedemux's
  get_live_seek_range()
 
 Allows seeking through the available fragments that are still available
@@ -10,40 +10,45 @@ manifest.
 
 <a class="moz-txt-link-freetext" href="https://bugzilla.gnome.org/show_bug.cgi?id=774178">https://bugzilla.gnome.org/show_bug.cgi?id=774178</a>
 ---
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
-
- ext/smoothstreaming/gstmssdemux.c    | 13 ++++++
+ ext/smoothstreaming/gstmssdemux.c    | 14 +++++-
  ext/smoothstreaming/gstmssmanifest.c | 84 ++++++++++++++++++++++++++++++++++++
  ext/smoothstreaming/gstmssmanifest.h |  1 +
- 3 files changed, 98 insertions(+)
+ 3 files changed, 98 insertions(+), 1 deletion(-)
 
 diff --git a/ext/smoothstreaming/gstmssdemux.c b/ext/smoothstreaming/gstmssdemux.c
-index 9d0aece2b..b66e19514 100644
+index 1a122d4..26147fd 100644
 --- a/ext/smoothstreaming/gstmssdemux.c
 +++ b/ext/smoothstreaming/gstmssdemux.c
-@@ -138,6 +138,8 @@ gst_mss_demux_get_manifest_update_interval (GstAdaptiveDemux * demux);
- static GstFlowReturn
- gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
-     GstBuffer * buffer);
+@@ -146,6 +146,8 @@ static GstFlowReturn gst_mss_demux_data_received (GstAdaptiveDemux * demux,
+     GstAdaptiveDemuxStream * stream, GstBuffer * buffer);
+ static gboolean
+ gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * demux);
 +static gboolean gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux,
 +    gint64 * start, gint64 * stop);
  
  static void
  gst_mss_demux_class_init (GstMssDemuxClass * klass)
-@@ -192,6 +194,8 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
-       gst_mss_demux_stream_update_fragment_info;
-   gstadaptivedemux_class-&gt;update_manifest_data =
-       gst_mss_demux_update_manifest_data;
+@@ -206,6 +208,8 @@ gst_mss_demux_class_init (GstMssDemuxClass * klass)
+   gstadaptivedemux_class-&gt;data_received = gst_mss_demux_data_received;
+   gstadaptivedemux_class-&gt;requires_periodical_playlist_update =
+       gst_mss_demux_requires_periodical_playlist_update;
 +  gstadaptivedemux_class-&gt;get_live_seek_range =
 +      gst_mss_demux_get_live_seek_range;
  
    GST_DEBUG_CATEGORY_INIT (mssdemux_debug, "mssdemux", 0, "mssdemux plugin");
  }
-@@ -659,3 +663,12 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
-   gst_mss_manifest_reload_fragments (mssdemux-&gt;manifest, buffer);
+@@ -694,7 +698,6 @@ gst_mss_demux_update_manifest_data (GstAdaptiveDemux * demux,
    return GST_FLOW_OK;
  }
+ 
+-
+ static GstFlowReturn
+ gst_mss_demux_data_received (GstAdaptiveDemux * demux,
+     GstAdaptiveDemuxStream * stream, GstBuffer *buffer)
+@@ -739,3 +742,12 @@ gst_mss_demux_requires_periodical_playlist_update (GstAdaptiveDemux * demux)
+ 
+   return (!gst_mss_manifest_is_live (mssdemux-&gt;manifest));
+ }
 +
 +static gboolean
 +gst_mss_demux_get_live_seek_range (GstAdaptiveDemux * demux, gint64 * start,
@@ -54,10 +59,10 @@ index 9d0aece2b..b66e19514 100644
 +  return gst_mss_manifest_get_live_seek_range (mssdemux-&gt;manifest, start, stop);
 +}
 diff --git a/ext/smoothstreaming/gstmssmanifest.c b/ext/smoothstreaming/gstmssmanifest.c
-index 1b72e8de1..317b3cef9 100644
+index b9dacb3..291080a 100644
 --- a/ext/smoothstreaming/gstmssmanifest.c
 +++ b/ext/smoothstreaming/gstmssmanifest.c
-@@ -42,6 +42,7 @@ GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
+@@ -45,6 +45,7 @@ GST_DEBUG_CATEGORY_EXTERN (mssdemux_debug);
  
  #define MSS_PROP_BITRATE              "Bitrate"
  #define MSS_PROP_DURATION             "d<a class="moz-txt-link-rfc2396E" href="mailto:@@-65,16+70,16@@index1b72e8de1..317b3cef9100644#defineMSS_PROP_LANGUAGE">"
@@ -65,16 +70,16 @@ index 1b72e8de1..317b3cef9 100644
  #define MSS_PROP_LANGUAGE             "</a>Language"
  #define MSS_PROP_NUMBER               "n"
  #define MSS_PROP_REPETITIONS          "r"
-@@ -94,6 +95,7 @@ struct _GstMssManifest
-   xmlNodePtr xmlrootnode;
+@@ -103,6 +104,7 @@ struct _GstMssManifest
  
    gboolean is_live;
+   guint64 look_ahead_fragment_count;
 +  gint64 dvr_window;
  
    GString *protection_system_id;
    gchar *protection_data;
-@@ -330,6 +332,22 @@ gst_mss_manifest_new (GstBuffer * data)
-     xmlFree (live_str);
+@@ -367,6 +369,22 @@ gst_mss_manifest_new (GstBuffer * data)
+     xmlFree (look_ahead_fragment_count_str);
    }
  
 +  /* the entire file is always available for non-live streams */
@@ -96,9 +101,9 @@ index 1b72e8de1..317b3cef9 100644
    for (nodeiter = root-&gt;children; nodeiter; nodeiter = nodeiter-&gt;next) {
      if (nodeiter-&gt;type == XML_ELEMENT_NODE
          &amp;&amp; (strcmp ((const char *) nodeiter-&gt;name, "StreamIndex") == 0)) {
-@@ -1406,3 +1424,69 @@ gst_mss_stream_get_lang (GstMssStream * stream)
- {
-   return stream-&gt;lang;
+@@ -1546,3 +1564,69 @@ gst_mss_stream_fragment_parse (GstMssStream * stream, GstBuffer * buffer)
+         fragment-&gt;time, fragment-&gt;duration, fragment-&gt;repetitions);
+   }
  }
 +
 +static GstClockTime
@@ -167,7 +172,7 @@ index 1b72e8de1..317b3cef9 100644
 +  return ret;
 +}
 diff --git a/ext/smoothstreaming/gstmssmanifest.h b/ext/smoothstreaming/gstmssmanifest.h
-index af7419c23..6b7b1f971 100644
+index 039877f..29545af 100644
 --- a/ext/smoothstreaming/gstmssmanifest.h
 +++ b/ext/smoothstreaming/gstmssmanifest.h
 @@ -54,6 +54,7 @@ void gst_mss_manifest_reload_fragments (GstMssManifest * manifest, GstBuffer * d
@@ -179,5 +184,5 @@ index af7419c23..6b7b1f971 100644
  GstMssStreamType gst_mss_stream_get_type (GstMssStream *stream);
  GstCaps * gst_mss_stream_get_caps (GstMssStream * stream);
 -- 
-2.11.0
+1.8.3.2
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-support.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-support.patch
new file mode 100644
index 0000000000..8a4ca68d83
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-adaptivedemux-minimal-HTTP-context-support.patch
@@ -0,0 +1,142 @@
+From 992bd23193978742029966e0a2232b1bfcc06122 Mon Sep 17 00:00:00 2001
+From: Philippe Normand <a class="moz-txt-link-rfc2396E" href="mailto:philn@igalia.com">&lt;philn@igalia.com&gt;</a>
+Date: Wed, 28 Oct 2015 11:52:49 +0100
+Subject: [PATCH 3/6] adaptivedemux: minimal HTTP context support
+
+The uridownloader is now querying the source element for an HTTP
+context, which stores session data (cookies only for now), and reusing
+the data when fetching data over HTTP. Additionally the context is set
+on adaptivedemux, which allows it to also properly use session data
+when downloading fragments.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=726314
+---
+ gst-libs/gst/adaptivedemux/gstadaptivedemux.c | 16 ++++++++++++-
+ gst-libs/gst/uridownloader/gsturidownloader.c | 34 +++++++++++++++++++++++++--
+ gst-libs/gst/uridownloader/gsturidownloader.h |  2 +-
+ 3 files changed, 48 insertions(+), 4 deletions(-)
+
+diff --git a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
+index 20bd839..1b5cace 100644
+--- a/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
++++ b/gst-libs/gst/adaptivedemux/gstadaptivedemux.c
+@@ -432,7 +432,7 @@ gst_adaptive_demux_init (GstAdaptiveDemux * demux,
+ 
+   demux-&gt;priv = GST_ADAPTIVE_DEMUX_GET_PRIVATE (demux);
+   demux-&gt;priv-&gt;input_adapter = gst_adapter_new ();
+-  demux-&gt;downloader = gst_uri_downloader_new ();
++  demux-&gt;downloader = gst_uri_downloader_new (GST_ELEMENT (demux));
+   demux-&gt;stream_struct_size = sizeof (GstAdaptiveDemuxStream);
+   demux-&gt;priv-&gt;segment_seqnum = gst_util_seqnum_next ();
+   demux-&gt;have_group_id = FALSE;
+@@ -2547,6 +2547,7 @@ gst_adaptive_demux_stream_update_source (GstAdaptiveDemuxStream * stream,
+     GstPadLinkReturn pad_link_ret;
+     GObjectClass *gobject_class;
+     gchar *internal_name, *bin_name;
++    GstContext *context = NULL;
+ 
+     /* Our src consists of a bin containing uri_handler -&gt; queue2 . The
+      * purpose of the queue2 is to allow the uri_handler to download an
+@@ -2598,6 +2599,19 @@ gst_adaptive_demux_stream_update_source (GstAdaptiveDemuxStream * stream,
+       }
+     }
+ 
++    context =
++        gst_element_get_context (GST_ELEMENT_CAST (demux), "http-headers");
++    if (context) {
++      const GstStructure *s = gst_context_get_structure (context);
++      const gchar **cookies = NULL;
++      gst_structure_get (s, "cookies", G_TYPE_STRV, &amp;cookies, NULL);
++      if (cookies) {
++        GST_DEBUG_OBJECT (demux, "Passing cookies through");
++        g_object_set (uri_handler, "cookies", cookies, NULL);
++      }
++      gst_context_unref (context);
++    }
++
+     /* Source bin creation */
+     bin_name = g_strdup_printf ("srcbin-%s", GST_PAD_NAME (stream-&gt;pad));
+     stream-&gt;src = gst_bin_new (bin_name);
+diff --git a/gst-libs/gst/uridownloader/gsturidownloader.c b/gst-libs/gst/uridownloader/gsturidownloader.c
+index 47b6f29..1f61250 100644
+--- a/gst-libs/gst/uridownloader/gsturidownloader.c
++++ b/gst-libs/gst/uridownloader/gsturidownloader.c
+@@ -33,6 +33,8 @@ GST_DEBUG_CATEGORY (uridownloader_debug);
+ 
+ struct _GstUriDownloaderPrivate
+ {
++  GstElement *parent;
++
+   /* Fragments fetcher */
+   GstElement *urisrc;
+   GstBus *bus;
+@@ -148,9 +150,11 @@ gst_uri_downloader_finalize (GObject * object)
+ }
+ 
+ GstUriDownloader *
+-gst_uri_downloader_new (void)
++gst_uri_downloader_new (GstElement * parent)
+ {
+-  return g_object_new (GST_TYPE_URI_DOWNLOADER, NULL);
++  GstUriDownloader *downloader = g_object_new (GST_TYPE_URI_DOWNLOADER, NULL);
++  downloader-&gt;priv-&gt;parent = parent;
++  return downloader;
+ }
+ 
+ static gboolean
+@@ -413,6 +417,7 @@ gst_uri_downloader_set_uri (GstUriDownloader * downloader, const gchar * uri,
+ {
+   GstPad *pad;
+   GObjectClass *gobject_class;
++  GstContext *context = NULL;
+ 
+   if (!gst_uri_is_valid (uri))
+     return FALSE;
+@@ -449,6 +454,31 @@ gst_uri_downloader_set_uri (GstUriDownloader * downloader, const gchar * uri,
+     }
+   }
+ 
++  context = gst_element_get_context (downloader-&gt;priv-&gt;parent, "http-headers");
++  if (!context) {
++    GstQuery *context_query = gst_query_new_context ("http-headers");
++    GstPad *parent_sink_pad =
++        gst_element_get_static_pad (downloader-&gt;priv-&gt;parent, "sink");
++    if (gst_pad_peer_query (parent_sink_pad, context_query)) {
++
++      gst_query_parse_context (context_query, &amp;context);
++      gst_element_set_context (downloader-&gt;priv-&gt;parent, context);
++    }
++    gst_object_unref (parent_sink_pad);
++    gst_query_unref (context_query);
++  }
++
++  if (context) {
++    const GstStructure *s = gst_context_get_structure (context);
++    const gchar **cookies = NULL;
++    gst_structure_get (s, "cookies", G_TYPE_STRV, &amp;cookies, NULL);
++    if (cookies) {
++      GST_DEBUG_OBJECT (downloader, "Passing cookies through");
++      g_object_set (downloader-&gt;priv-&gt;urisrc, "cookies", cookies, NULL);
++    }
++    gst_context_unref (context);
++  }
++
+   /* add a sync handler for the bus messages to detect errors in the download */
+   gst_element_set_bus (GST_ELEMENT (downloader-&gt;priv-&gt;urisrc),
+       downloader-&gt;priv-&gt;bus);
+diff --git a/gst-libs/gst/uridownloader/gsturidownloader.h b/gst-libs/gst/uridownloader/gsturidownloader.h
+index 80b8a3e..36cbf65 100644
+--- a/gst-libs/gst/uridownloader/gsturidownloader.h
++++ b/gst-libs/gst/uridownloader/gsturidownloader.h
+@@ -60,7 +60,7 @@ struct _GstUriDownloaderClass
+ 
+ GType gst_uri_downloader_get_type (void);
+ 
+-GstUriDownloader * gst_uri_downloader_new (void);
++GstUriDownloader * gst_uri_downloader_new (GstElement * parent);
+ GstFragment * gst_uri_downloader_fetch_uri (GstUriDownloader * downloader, const gchar * uri, const gchar * referer, gboolean compress, gboolean refresh, gboolean allow_cache, GError ** err);
+ GstFragment * gst_uri_downloader_fetch_uri_with_range (GstUriDownloader * downloader, const gchar * uri, const gchar * referer, gboolean compress, gboolean refresh, gboolean allow_cache, gint64 range_start, gint64 range_end, GError ** err);
+ void gst_uri_downloader_reset (GstUriDownloader *downloader);
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch
new file mode 100644
index 0000000000..97d83aa4f7
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch
@@ -0,0 +1,109 @@
+From cbf3d75b3d693e50722534d30a8f51995a419803 Mon Sep 17 00:00:00 2001
+From: Philippe Normand <a class="moz-txt-link-rfc2396E" href="mailto:philn@igalia.com">&lt;philn@igalia.com&gt;</a>
+Date: Fri, 4 Nov 2016 09:56:33 +0100
+Subject: [PATCH 5/6] mpdparser: MS PlayReady ContentProtection parsing
+
+The "pro" (PlayReady Object) element contents are now base64-decoded
+and properly stored in Protection events.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=773936
+---
+ ext/dash/gstdashdemux.c |  2 +-
+ ext/dash/gstmpdparser.c | 41 ++++++++++++++++++++++++++++++++++++++++-
+ ext/dash/gstmpdparser.h |  1 +
+ 3 files changed, 42 insertions(+), 2 deletions(-)
+
+diff --git a/ext/dash/gstdashdemux.c b/ext/dash/gstdashdemux.c
+index 271f70f..b10465e 100644
+--- a/ext/dash/gstdashdemux.c
++++ b/ext/dash/gstdashdemux.c
+@@ -745,7 +745,7 @@ gst_dash_demux_send_content_protection_event (gpointer data, gpointer userdata)
+   /* RFC 2141 states: The leading "urn:" sequence is case-insensitive */
+   schemeIdUri = g_ascii_strdown (cp-&gt;schemeIdUri, -1);
+   if (g_str_has_prefix (schemeIdUri, "urn:uuid:")) {
+-    pssi_len = strlen (cp-&gt;value);
++    pssi_len = cp-&gt;value_len;
+     pssi = gst_buffer_new_wrapped (g_memdup (cp-&gt;value, pssi_len), pssi_len);
+     GST_LOG_OBJECT (stream, "Queuing Protection event on source pad");
+     /* RFC 4122 states that the hex part of a UUID is in lower case,
+diff --git a/ext/dash/gstmpdparser.c b/ext/dash/gstmpdparser.c
+index 15d6d98..f0b3ceb 100644
+--- a/ext/dash/gstmpdparser.c
++++ b/ext/dash/gstmpdparser.c
+@@ -1313,6 +1313,7 @@ gst_mpdparser_parse_descriptor_type_node (GList ** list, xmlNode * a_node)
+     /* if no value attribute, use XML string representation of the node */
+     gst_mpdparser_get_xml_node_as_string (a_node, &amp;new_descriptor-&gt;value);
+   }
++  new_descriptor-&gt;value_len = strlen(new_descriptor-&gt;value);
+ }
+ 
+ static void
+@@ -1734,6 +1735,44 @@ error:
+ }
+ 
+ static void
++gst_mpdparser_parse_content_protection_node (GList ** list, xmlNode * a_node)
++{
++  gchar *value = NULL;
++  if (gst_mpdparser_get_xml_prop_string (a_node, "value", &amp;value)) {
++    if (!g_strcmp0 (value, "MSPR 2.0")) {
++      xmlNode *cur_node;
++      for (cur_node = a_node-&gt;children; cur_node; cur_node = cur_node-&gt;next) {
++        if (cur_node-&gt;type == XML_ELEMENT_NODE) {
++          if (xmlStrcmp (cur_node-&gt;name, (xmlChar *) "pro") == 0) {
++            gsize decoded_len;
++            GstDescriptorType *new_descriptor;
++            new_descriptor = g_slice_new0 (GstDescriptorType);
++            *list = g_list_append (*list, new_descriptor);
++
++            gst_mpdparser_get_xml_prop_string (a_node, "schemeIdUri",
++                &amp;new_descriptor-&gt;schemeIdUri);
++
++            gst_mpdparser_get_xml_node_content (cur_node,
++                &amp;new_descriptor-&gt;value);
++            g_base64_decode_inplace (new_descriptor-&gt;value, &amp;decoded_len);
++            *(new_descriptor-&gt;value + decoded_len) = '\0';
++            new_descriptor-&gt;value_len = decoded_len;
++            goto beach;
++          }
++        }
++      }
++    } else {
++      gst_mpdparser_parse_descriptor_type_node (list, a_node);
++    }
++  } else {
++    gst_mpdparser_parse_descriptor_type_node (list, a_node);
++  }
++beach:
++  if (value)
++    g_free (value);
++}
++
++static void
+ gst_mpdparser_parse_representation_base_type (GstRepresentationBaseType **
+     pointer, xmlNode * a_node)
+ {
+@@ -1788,7 +1827,7 @@ gst_mpdparser_parse_representation_base_type (GstRepresentationBaseType **
+             (&amp;representation_base-&gt;AudioChannelConfiguration, cur_node);
+       } else if (xmlStrcmp (cur_node-&gt;name,
+               (xmlChar *) "ContentProtection") == 0) {
+-        gst_mpdparser_parse_descriptor_type_node
++        gst_mpdparser_parse_content_protection_node
+             (&amp;representation_base-&gt;ContentProtection, cur_node);
+       }
+     }
+diff --git a/ext/dash/gstmpdparser.h b/ext/dash/gstmpdparser.h
+index 85b97ea..738de68 100644
+--- a/ext/dash/gstmpdparser.h
++++ b/ext/dash/gstmpdparser.h
+@@ -277,6 +277,7 @@ struct _GstDescriptorType
+ {
+   gchar *schemeIdUri;
+   gchar *value;
++  glong value_len;
+ };
+ 
+ struct _GstContentComponentNode
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 0bb4053e43..c894945748 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -11,13 +11,16 @@ SRC_URI = " \
     <a class="moz-txt-link-freetext" href="file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch">file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch</a> \
     <a class="moz-txt-link-freetext" href="file://avoid-including-sys-poll.h-directly.patch">file://avoid-including-sys-poll.h-directly.patch</a> \
     <a class="moz-txt-link-freetext" href="file://ensure-valid-sentinels-for-gst_structure_get-etc.patch">file://ensure-valid-sentinels-for-gst_structure_get-etc.patch</a> \
+    <a class="moz-txt-link-freetext" href="file://0001-mssdemux-improved-live-playback-support.patch">file://0001-mssdemux-improved-live-playback-support.patch</a> \
     <a class="moz-txt-link-freetext" href="file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch">file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch</a> \
-    <a class="moz-txt-link-freetext" href="file://0009-glimagesink-Downrank-to-marginal.patch">file://0009-glimagesink-Downrank-to-marginal.patch</a> \
     <a class="moz-txt-link-freetext" href="file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch">file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch</a> \
     <a class="moz-txt-link-freetext" href="file://0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch">file://0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch</a> \
-    <a class="moz-txt-link-freetext" href="file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch">file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch</a> \
     <a class="moz-txt-link-freetext" href="file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch">file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch</a> \
-    <a class="moz-txt-link-freetext" href="file://0001-mssdemux-improved-live-playback-support.patch">file://0001-mssdemux-improved-live-playback-support.patch</a> \
+    <a class="moz-txt-link-freetext" href="file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch">file://0002-mssdemux-Handle-the-adapter-in-the-subclass-after-bu.patch</a> \
+    <a class="moz-txt-link-freetext" href="file://0003-adaptivedemux-minimal-HTTP-context-support.patch">file://0003-adaptivedemux-minimal-HTTP-context-support.patch</a> \
+    <a class="moz-txt-link-freetext" href="file://0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch">file://0005-mpdparser-MS-PlayReady-ContentProtection-parsing.patch</a> \
+    <a class="moz-txt-link-freetext" href="file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch">file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch</a> \
+    <a class="moz-txt-link-freetext" href="file://0009-glimagesink-Downrank-to-marginal.patch">file://0009-glimagesink-Downrank-to-marginal.patch</a> \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------8CBED067B820C6B63226B3E3--
