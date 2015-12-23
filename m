Return-Path: <mike.looijmans@topic.nl>
Received: from smtp01.mail.online.nl (smtp01.mail.online.nl [194.134.25.71])
	by mail.openembedded.org (Postfix) with ESMTP id A35D370101
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 13:17:35 +0000 (UTC)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp01.mail.online.nl (Postfix) with ESMTP id 37E1E4005C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 14:17:33 +0100 (CET)
To: OE <openembedded-core@lists.openembedded.org>
References: <1450857946-8428-1-git-send-email-mike.looijmans@topic.nl>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <567A9EED.7040305@topic.nl>
Date: Wed, 23 Dec 2015 14:17:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1450857946-8428-1-git-send-email-mike.looijmans@topic.nl>
Subject: Re: [PATCH] libav: Add "--enable-gpl" to PACKAGECONFIG[x264]
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
X-List-Received-Date: Wed, 23 Dec 2015 13:17:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

hmm, apparently there's already a "gpl" PACKAGECONFIG item.
I don't think we have dependencies in that, so there's no easy way to 
tell people that "if you include 'x264' in the list you must include 
'gpl' as well"?

I guess this patch better be dropped then.

On 23-12-15 09:05, Mike Looijmans wrote:
> Building libav resulted in the following message during configure:
>    libx264 is gpl and --enable-gpl is not specified.
> Resolve it by adding --enable-gpl to the x264 package config.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>   meta/recipes-multimedia/libav/libav.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
> index 05b7e87..8ae6739 100644
> --- a/meta/recipes-multimedia/libav/libav.inc
> +++ b/meta/recipes-multimedia/libav/libav.inc
> @@ -52,7 +52,7 @@ PACKAGECONFIG[theora] = "--enable-libtheora,--disable-libtheora,libtheora"
>   PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
>   PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
>   PACKAGECONFIG[x11] = "--enable-x11grab,--disable-x11grab,virtual/libx11 libxfixes libxext xproto virtual/libsdl"
> -PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
> +PACKAGECONFIG[x264] = "--enable-gpl --enable-libx264,--disable-libx264,x264"
>
>   # Check codecs that require --enable-nonfree
>   USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'openssl' ], 'yes', '', d)}"
>


-- 
Mike Looijmans

