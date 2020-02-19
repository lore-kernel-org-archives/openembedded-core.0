Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id CE64F613C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 18:37:57 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z7so522756pgk.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 10:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lSQ67ol4Eibk7xIZQ8gVxfPo2LBbb0OSA8I2QI9Y198=;
	b=rglfplcLxWiv0kmKN8KeqwpMXmVBai7pTVRy2sgOE9uJxqzwfTPp655q68dO5AiQN5
	sF7bqZLF+QWI3jy29Ab5oknSk0fRPT1ozOgChZAafkEU9E312tW5gmNsTZMGvPjFnGFP
	HLbEeuhFiR64kNIiAy+tv9pKUVxRoSNXSWmnLuVgUS33bjxR5gSWjmfOrF+WlWCxqvvv
	AQQXsER9Wzlytjpmm3eEOws6vUmOo6ISC4kpf0P1BwEkUomSZs6SjnO6xmolBJoLBnqQ
	p9YObYk7oDwvMfi1h+8Kr70brSwKjDK3jkmv44t7XI/C0z3p6LW6yTiPOBrLgvvqzqpk
	wBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lSQ67ol4Eibk7xIZQ8gVxfPo2LBbb0OSA8I2QI9Y198=;
	b=Psn115unAP9I8fxFcr99/dpc7jQnDW148LQZYFfTCU1zkgEvIRV4dB9b1yeKF6VnFn
	18hu3Ji/Xje+/tcfsHS/DH9ZjzqLLVZ1QsNbFgVcAXjE/9eN9+4+CZmXY1/k2VZ58aM/
	OXI/F4+GFjSCO+LLBWmK5OgByv+bm7sW2dQM96ktc6Bm2IhyPhtPHQjJB8N0ocmqHzW2
	idvK1Y83CwQX9G835Ilyf6LMfQ5njnF9g1GOrWQfQGCrzH6nznqbIxpAlmhfOC5lwA6Y
	2KkfYWQdmMTOyu4EdV+3PjHu5VQYVodfVWrPcTuKa+elgV1PfliVDwCkM2i7RRPO80Ug
	OqXg==
X-Gm-Message-State: APjAAAUfb0M8kS1gSzBtTpArBG9mugscT55QJvSwqVwPvLUoI1OUo56c
	JQUaRJ2uT7m/DeN/RGNJMIzN3zcGi0o=
X-Google-Smtp-Source: APXvYqy3vVAFplwxntD1euPDKDOdioUEbsJ1LB7q+I491YJXuB64yLx+1ByftHOJplom6st5P3145w==
X-Received: by 2002:a63:9214:: with SMTP id o20mr29211568pgd.146.1582137478387;
	Wed, 19 Feb 2020 10:37:58 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:cca7:f312:1961:a4b9?
	([2601:646:9200:4e0:cca7:f312:1961:a4b9])
	by smtp.gmail.com with ESMTPSA id 13sm432689pgo.13.2020.02.19.10.37.57
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 19 Feb 2020 10:37:57 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<CAMKF1sppws+PSjDojzi7+=p_UjEkEafGa1_WtRLCpqO_73nhGA@mail.gmail.com>
	<CANNYZj8W0A12inq_K3kiShN7dsU3tsTuOgh4LZAtP-QcUVDaXQ@mail.gmail.com>
	<CAMKF1so86RKsiAXC=vzpT0wu8E=jiFMzJsVBdGb7SQ2TKxBo6Q@mail.gmail.com>
	<CANNYZj_k+iXWB_V3PQOv8eE8Pvwt8B-q4=x_F4e4hzisW-NXaA@mail.gmail.com>
	<CAMKF1spO36x=P-ts28+BEg+Pvw5FcEWNpyNyJGXcFB_jXSohUA@mail.gmail.com>
	<CANNYZj8ZC_pVkSHTisPryOJE7GfMqot5a=5uP5LUm3fB0nVMYw@mail.gmail.com>
	<CANNYZj9u8f+qD_3RTb+9O9cbNBk0UgteBcV_d7X2ffpCkg4UxA@mail.gmail.com>
	<CAMKF1srMfa-0ADdKErgwXhQa6ypDL7RGznsBQ0ET7cZ29ErzXA@mail.gmail.com>
	<CANNYZj_ktJg=JF=nTPvHWBajA+7t2zMPwZmbUFLOKRWD1uP4_A@mail.gmail.com>
	<CAMKF1sqKV7+uMtvZEOCApvkiBV=cnFhsKJ=e9gx_gcY4iE-kvw@mail.gmail.com>
	<CANNYZj93fYQY6rDVz5t2aaOfn=Vwz88OzZwZVcdwf3pfgWx1NQ@mail.gmail.com>
	<CAMKF1sp1EzMcb0Tndn-rJ02MOccd4J5AJFJ58Lv+0BsceP4gXg@mail.gmail.com>
	<CANNYZj-gvCsW2XzuddVaZTegS81VnHZXXTm2L0jHyG9vcXK-RA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <30085196-1dc5-d64e-73ca-416f52291a9e@gmail.com>
Date: Wed, 19 Feb 2020 10:37:57 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj-gvCsW2XzuddVaZTegS81VnHZXXTm2L0jHyG9vcXK-RA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] weston-init: use the drm backend rather than fbdev one
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
X-List-Received-Date: Wed, 19 Feb 2020 18:37:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/19/20 10:06 AM, Alexander Kanavin wrote:
> Will that take precedence over qemuall though? Sounds brittle. Another 
> option is to make the fbdev configuration specific to mips and arm, as 
> using kms does not need a configuration at all.
> 

I think it will. arch specific overrides should come before generic ones.

> Alex
> 
> On Wed 19. Feb 2020 at 18.21, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     On Wed, Feb 19, 2020 at 1:45 AM Alexander Kanavin
>     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
>      >
>      > On Tue, 18 Feb 2020 at 02:56, Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>> wrote:
>      >>
>      >>
>      >>> but I'll get to it, or you are welcome to try and report.
>      >>> Mips can be either fixed like suggested, or be a specific
>     exception.
>      >>>
>      >>> For the rest of the targets, I see that you have extended the
>     fbdev fallback to qemuall only on Jan 9 this year. So it's very
>     unlikely anyone is using them to run weston (not to mention how
>     painfully slow that would be), and so it would just be wasteful to
>     test or fix them.
>      >>
>      >>
>      >> We should be only applying tested part debugging these breakages
>     is very hard so when we know it will break we should be careful as
>     with this patch
>      >
>      >
>      > I have tested these things now:
>      >
>      > 1. Switching mips from cirrus to std vga works fine, as long as
>     xorg.conf is also deleted (it's written specifically for cirrus and
>     isn't working or needed with std vga). Both weston and sato boot and
>     look right. I'll send a patch for it.
>      >
>      > 2. Switching weston to kms backend degrades performance to
>     unusable level, as neither kvm nor virtio/virgl are available for
>     non-x86 qemu, and kms backend is using software renderer in mesa. So
>     fbdev is the only realistic option there. But for x86 qemu kms is
>     still viable. I'm not sure how to best configure it though.
> 
>     copy qemuall/weston.ini new folders qemux86 and qemux86-64 and point
>     to backend it should be using.
> 
>      >
>      > Alex
> 

