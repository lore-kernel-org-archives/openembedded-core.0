Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B0EDB7C89C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 14:18:23 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y185so12254327wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 06:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=dpzi6yCLUJmstLaE2PdmPhxL7uPTzf/4+z7QZKuysKE=;
	b=Bk65psOpmE1JQFMli4LaDgdQI/JaGWYZtv3PKTqfpZlU9g5sNBOn8D7Sb4bO20RJGQ
	+GS5e/EKRJuX/CcXp0bRIWRKyZy8tyHGcaMLOSr3GhLjeE72GHbYNpc3HX+Ha/glNMWI
	Te4P2AFvD0ShGjtRutHgIRi9nkINATxRKlfvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=dpzi6yCLUJmstLaE2PdmPhxL7uPTzf/4+z7QZKuysKE=;
	b=Hp7rnx8BhDJg8VCHWM+4N57OokXP67926VVEhNBRlslDbHCWQq1MOGO2wJ51TM8tFO
	Hb8OQ3HlY4YOvkAHSIxkoARMV7uNKZ00gPaoI6cl9M4AxeM9saN2wzOVp057XEY1ANXU
	cLSMmOVkeer+rIToW4YGJjZJ+Ik3U6cX6206Itpl0QCEfnPBAvdFBFUTm24ZHmdXXCia
	e7+c9AofQdOLkJD8SubpdfLQc6eO5wti+j4JfRXlcyW8MpH6GdB9a7VO2w6JlfK/cJZC
	+J4O8rJRrGl1GbzqojKaI6GBAPi1BHLe3N281/WCxETWjssCWyb2/Ei1hcKh+cfCT6bB
	mtXQ==
X-Gm-Message-State: AHQUAubCTff4VHmRlAGTjbYZR1fovcs3PKmVP4+QmIQyFrFtlewDCiEP
	CsgGoZ8mVKzMoUUD4I70XZTe3ATSFwk=
X-Google-Smtp-Source: AHgI3IYRHpFVl6M3C9Y7IYPDy/iH/aAqZUS5sdIiYIWX4U+VQp9oSodt0LOf8DnfE2LX80D6s2fZ8w==
X-Received: by 2002:a1c:230e:: with SMTP id j14mr3143904wmj.9.1550499504321;
	Mon, 18 Feb 2019 06:18:24 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n2sm22249611wrq.58.2019.02.18.06.18.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Feb 2019 06:18:23 -0800 (PST)
Message-ID: <b44b056e67f02f40a40be9cef5614123b1caf906.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fabio Berton <fabio.berton@ossystems.com.br>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 14:18:22 +0000
In-Reply-To: <20190218132948.27668-2-fabio.berton@ossystems.com.br>
References: <20190218132948.27668-1-fabio.berton@ossystems.com.br>
	<20190218132948.27668-2-fabio.berton@ossystems.com.br>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Mon, 18 Feb 2019 14:18:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-02-18 at 10:29 -0300, Fabio Berton wrote:
> @@ -61,13 +61,12 @@ PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-
> glx,${X11_DEPS}"
>  PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
>  PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
>  
> -DRIDRIVERS = "swrast"
> -DRIDRIVERS_append_x86_class-target = ",radeon,r200,nouveau,i965,i915"
> -DRIDRIVERS_append_x86-64_class-target = ",radeon,r200,nouveau,i965,i915"
> +DRIDRIVERS_class-native = "swrast"
> +DRIDRIVERS_class-nativesdk = "swrast"
> +DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
> +DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"

I think you need to leave DRIDRIVERS = "swrast" here or the x86 appends
wouldn't have swrast listed?

Do we really want to limit the native version to swrast only? This
seems a fairly major change of behaviour and not what the original code
was intending?

Cheers,

Richard


