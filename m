Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80486C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:36:45 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.11144.1643193404704674214
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:36:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=EJYdA6JG;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 357278069C;
	Wed, 26 Jan 2022 11:36:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643193402;
	bh=FIRG4u8OJxc/uciPJFP9ds49jXhj0lVzgJIGv1xIoXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EJYdA6JG9KMlT1DRTYOznLqA4wr18H9k17NamJfAIxSzXGqAfYvhyUvTGseVHBy4n
	 dCxj+/WibmVZUFLW/7myMH7b1ooYGc/dRRRtsp/ZG+MwITvPlT4n1g5jm3jQdPacxI
	 0pRa8S32vToN8IJHIz/rZs1g5ZZ5vRBdNZQ/IyeRT2gThc75tpOAhlm7CBCKplpetx
	 +o3rNEvfLjYOWOXMRlBR/oImvArq6DJ8SzcRi9otIs2Xkhe381EPttGvW3+1gop8se
	 2uoAny1EMkoW697/Rz9+N6VL42UblnW9EocZHpnnYCCTBTs2ekIk1Nsz6qlN4ToJId
	 DgPwURUWvYLIQ==
Message-ID: <a9088b97-0ead-f297-6922-d582fd8476b9@denx.de>
Date: Wed, 26 Jan 2022 11:36:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core][RFC PATCH 01/12] gstreamer1.0: 1.18.5 -> 1.20.0
Content-Language: en-US
To: Claudius Heine <ch@denx.de>, openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20220126102814.4173943-1-ch@denx.de>
 <20220126102814.4173943-2-ch@denx.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220126102814.4173943-2-ch@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:36:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160978

On 1/26/22 11:28, Claudius Heine wrote:

[...]

> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-source.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-source.inc
> new file mode 100644
> index 0000000000..ca38322576
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-source.inc
> @@ -0,0 +1,5 @@
> +REVISION = "4f7e881fcc2e6df3ce04584cf5edb07b2682891a"
> +
> +SRC_BASE = "${WORKDIR}/gstreamer-${REVISION}"
> +SRC_URI = "https://gitlab.freedesktop.org/gstreamer/gstreamer/-/archive/${REVISION}/gstreamer-${REVISION}.tar.gz"
> +SRC_URI[sha256sum] = "bc9f6b9402d7575d8a7490f0aae347e6b524741cc459cb7aa25040fb55fcb606"

Would it make sense to fetch gstreamer sources from git instead of 
tarballs ?

Then you just set SRCREV to point to specific commit .

Git also seems to make development a bit easier .

[...]

> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb

Maybe the filename should be 1.19.90 until 1.20 is out ?

[...]

