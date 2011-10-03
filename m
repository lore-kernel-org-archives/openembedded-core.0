Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RAovK-0000gj-Tp
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 22:15:39 +0200
Received: by yxj17 with SMTP id 17so3822187yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 13:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=c8fgILLzjlDE6Yr6JBd6rWAlZ4cfRfYqmn6HaSkCNH8=;
	b=lzhd/So1S9yxUgLDvz04MTLtH7EvJbGb2YBpV03cgiF3Gn9PmkKhqWRGDmOFaA5cdZ
	37IS3cl7GYUlNPu2/JN6MZtoMzmIfJh1Ybd75U449NwzhhR8FhnH9lORWvkyVH6C6TZO
	53TSfo7CP3ZH6wwexSxIGfhOHSp5nDuURjFaU=
Received: by 10.236.161.200 with SMTP id w48mr2286123yhk.28.1317672605469;
	Mon, 03 Oct 2011 13:10:05 -0700 (PDT)
Received: from [172.23.2.133] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id r30sm16808630yhj.20.2011.10.03.13.10.04
	(version=SSLv3 cipher=OTHER); Mon, 03 Oct 2011 13:10:04 -0700 (PDT)
Message-ID: <4E8A169A.5080207@gmail.com>
Date: Mon, 03 Oct 2011 13:10:02 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
	<c341f97c3102144d6ae36e6669c69905ac9de240.1317367429.git.Martin.Jansa@gmail.com>
In-Reply-To: <c341f97c3102144d6ae36e6669c69905ac9de240.1317367429.git.Martin.Jansa@gmail.com>
Subject: Re: [PATCH 02/13] xserver-xf86-dri-lite: remove COMPATIBLE_HOST
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Oct 2011 20:15:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/2011 12:27 AM, Martin Jansa wrote:
> * ie om-gta02 has mesa-dri module too
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   .../xorg-xserver/xserver-xf86-dri-lite.inc         |    3 ---
>   1 files changed, 0 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
> index 093e049..2e35917 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
> @@ -10,6 +10,3 @@ EXTRA_OECONF += "\
>                    --with-pic \
>                    --with-int10=x86emu \
>   "
> -
> -# Due to mesa-dri
> -COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'

how about powerpc and mips ? they will also become supported with this 
change have you tested that


