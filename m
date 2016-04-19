Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id DEC606014F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 13:33:56 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id zm5so6854314pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=GQxpaYkjdsDYbaS8W7ckdbz242V79+osc6RMhTRCMWk=;
	b=MYvucHreTqXqsuhMF0S7qgePKYMJP41FcURf8qdM58874+zRc5Arwft3ElxJMMqtDO
	4WezO4vQupz29eJhCvsyBKYrpCP5QvOC2zHJqituosAmZoRiIayjTkvcwRas5pl6H54e
	HQCnOW58n5uS8ZIr7aStzZEoN6cmz7uJUcOH7enW/wZWCgh1bJ0oANln4yL7gQsDZXTP
	BseIce+EP1c0SEXS3khfovYMSS1TcrxDrahStJQrAbp+Rnba0zU0AIQwWZI/OQ0eRFLX
	iX6+F0LyIddq+8XwFUJFZBhXkoPdE3azJsX6/G92ZaubvfkSNcGpYIGl9LpD83qMA8dz
	vtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=GQxpaYkjdsDYbaS8W7ckdbz242V79+osc6RMhTRCMWk=;
	b=TtODrxVgCswTMGpzFoRWV7CsmOp6+iR9ZQT4qcPMFeEl+GWP2bo85dzGs5/NCEPdzW
	+a9veFxkokJgxFER1GvjbYocpxZhDyh9LCNSiyJm7XydSzm9jgM17C6EoTbF8xq3vv6H
	ETz9HC8LjzYENcJR0icfSRbX1HBhMqAbrBmoIfAL0tl3WTXo+jxAxl+VD5+pWuR4IkQg
	gemU20ZHx2Af4ywa6Vbf/KfWgoyS7kkdDMHnxd3g/R4jvcuzTJ/DS8YLBJjC+u1SJo9x
	D/ZKGm7lzojesN66faiFSwHq8X4I2N+TKrrX7yMy3PXsI8+ToJsqbbpOqUrxrMRLQJhT
	oFXg==
X-Gm-Message-State: AOPr4FWcwUMUzglC6jlN/MEWr4sarXiUlEqT6OdcX4hsuFQ+1efWUV56EmMuxqD7NvsYbw==
X-Received: by 10.67.15.9 with SMTP id fk9mr4004720pad.77.1461072837429;
	Tue, 19 Apr 2016 06:33:57 -0700 (PDT)
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com.
	[209.85.192.174]) by smtp.gmail.com with ESMTPSA id
	a205sm23500658pfa.6.2016.04.19.06.33.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Apr 2016 06:33:56 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f174.google.com with SMTP id n1so7005774pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 06:33:56 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.78.205 with SMTP id c196mr3991347pfb.129.1461072835698;
	Tue, 19 Apr 2016 06:33:55 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Tue, 19 Apr 2016 06:33:55 -0700 (PDT)
In-Reply-To: <1461070003-12494-5-git-send-email-yannick.gicquel@iot.bzh>
References: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461070003-12494-5-git-send-email-yannick.gicquel@iot.bzh>
Date: Tue, 19 Apr 2016 10:33:55 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo2sy-MmCDRaFEK8OZmX81rC2SAKJktUnva8+oC6euy1Q@mail.gmail.com>
Message-ID: <CAP9ODKo2sy-MmCDRaFEK8OZmX81rC2SAKJktUnva8+oC6euy1Q@mail.gmail.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 4/4] kernel: fitimage: basic support for fitimage signature
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
X-List-Received-Date: Tue, 19 Apr 2016 13:33:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 19, 2016 at 9:46 AM, Yannick Gicquel
<yannick.gicquel@iot.bzh> wrote:
> This is an initial support of fitImage signature to enable U-Boot verified
> boot. This feature is implemented by adding a signature tag to the
> configuration section of the generated fit-image.its file.
>
> When a UBOOT_SIGN_ENABLE variable is set to "1", the signature procedure is
> activated and performs a second call to mkimage to sign the fitImage file and
> to include the public key in the deployed U-Boot device tree blob. (This
> implementation depends on the use of CONFIG_OF_SEPARATE in U-Boot.)
>
> As the U-Boot device tree blob is appended in the deploy dir, a dependency
> on 'u-boot:do_deploy' is added when the feature is activated.
>
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
> ---
>  meta/classes/kernel-fitimage.bbclass | 45 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 62e0017..cbf07ba 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -1,5 +1,8 @@
>  inherit kernel-uboot
>
> +# To resolve the following UBOOT_DTB_BINARY identifier
> +require recipes-bsp/u-boot/u-boot-sign.inc
> +

Again, use a class for it. inc files are being abused this way.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

