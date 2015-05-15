Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id D7FCF73779
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 10:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id B9DC2315468B;
	Fri, 15 May 2015 12:16:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id IZlr-Iuf90ax; Fri, 15 May 2015 12:16:33 +0200 (CEST)
Received: from [172.22.22.61] (55d41029.access.ecotel.net [85.212.16.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id D8773315468A;
	Fri, 15 May 2015 12:16:32 +0200 (CEST)
Message-ID: <5555C780.5090905@opendreambox.org>
Date: Fri, 15 May 2015 12:16:32 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1431333085.git.liezhi.yang@windriver.com>	<d81cfb100f102438213c54a72c1f412323a80dd2.1431333085.git.liezhi.yang@windriver.com>	<CAJTo0LZ40TNQ4NiFKChiYikMsyKN3hUyZ9GjhezVeEtSQqSeVQ@mail.gmail.com>	<55516887.5080908@windriver.com>	<CAJTo0LYsOyP27CHxMvy87fgU=+YhMREtfbodMSv4o+C4jgh1_g@mail.gmail.com>	<5552A982.3090100@windriver.com>	<CAJTo0LZTnpZ6jkWO1aQFSVK54g=0wOaSLUFUVkwcu2iqbjXTFw@mail.gmail.com>
	<55544886.4040206@windriver.com>
In-Reply-To: <55544886.4040206@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] xserver-xorg: disable xwayland
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
X-List-Received-Date: Fri, 15 May 2015 10:16:37 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Robert,

On 14.05.2015 09:02, Robert Yang wrote:
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -62,7 +62,9 @@ PACKAGES =+ "${PN}-security-policy \
>               ${PN}-module-exa \
>               ${PN}-module-xaa \
>               ${PN}-module-libxf1bpp \
> -             ${PN}-module-libxf4bpp"
> +             ${PN}-module-libxf4bpp \
> +             ${@bb.utils.contains("DISTRO_FEATURES", "wayland",
> "${PN}-xwayland", "", d)} \
> +"

You don't need a conditional here, because empty packages get ignored.

Regards,
Andreas

