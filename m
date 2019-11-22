Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D487B7C89C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 23:10:15 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t1so10562785wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 15:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Y+L5TECxyckn+5ed2Ht1orZpDckLRK02S1hzni0UqW8=;
	b=VXMyiLivB2AeywYMCT18yu6z2H9J0LOUrWNcP1mHZnBnYSoCH74oWzUAgLp9FhLF6F
	4UN18dJZfXvMvaRuqR4l6g82U0gdCzU0X3lV1ecX/GODr0m01X3wA+QRmG3Vs0HPuaHN
	9i1u+2EzVMDiHLfX/0fmhudWpv6BI2khx5/f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Y+L5TECxyckn+5ed2Ht1orZpDckLRK02S1hzni0UqW8=;
	b=eQ4r/4DzLTqIH0j0JdWqiQqZ/JHKZv71yq3f2LDsumbj7UmY+yLGFZN4WTPliicpVQ
	DLxUvKY9/0t2GTsmvBEEHUrpZUBATjUc84JWx8qZdCSuUiL190kW0VoX4vr8d+K66HDO
	RCCmewHyKEs9Yxe06w+0Jb7tf+L/wzMUIHBHlVTXIq143a/yGw1a0a5VS6FopksigGUC
	aSPG3uvj/L5dt8dW8XgUwweRyXAsTLSmuXCQELPBPQ8u8ukwefprNSnA44nJr+XvAeWj
	o9LehclTAdWXQm4qcMG9QWxDPzmwx5OKOOskTmXzRCkiiE/w844ehfidBc9Lirp4PiDJ
	U7sA==
X-Gm-Message-State: APjAAAXNCa26P7MmgAqs+rTpltLBEyGpR6nvgahAxF8qLPb+yMH93CqB
	w0t8fXIfvDK4E7OVmboBKEJQeQ==
X-Google-Smtp-Source: APXvYqy+O12PQS6zt3kRRXo/hngz4aTGAbj8wAlgIuvqpSxfiptQshbyUvuce61fmSlHEPe6tl8RMA==
X-Received: by 2002:a5d:4684:: with SMTP id u4mr19361492wrq.352.1574464216501; 
	Fri, 22 Nov 2019 15:10:16 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t13sm3857647wrp.36.2019.11.22.15.10.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 22 Nov 2019 15:10:15 -0800 (PST)
Message-ID: <6396b0dfd5c33ac1633eecd3a2f6d519d87438df.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, Denys
	Dmytriyenko <denis@denix.org>
Date: Fri, 22 Nov 2019 23:10:14 +0000
In-Reply-To: <CALbNGRQFFrkNuv8---ck=16VLaN09_9G+=r1Ppb-yAerQYEbEw@mail.gmail.com>
References: <1573778407-13250-1-git-send-email-denis@denix.org>
	<CALbNGRQFFrkNuv8---ck=16VLaN09_9G+=r1Ppb-yAerQYEbEw@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH v2] distro_features_check: expand with MACHINE_FEATURES and COMBINED_FEATURES, rename
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
X-List-Received-Date: Fri, 22 Nov 2019 23:10:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-11-22 at 23:58 +0100, Andreas Müller wrote:
> Whatever this patch does renaming does nothing but causing me lots of
> useles (rebasing) efforts. To me ist is simlpy the worst patch of
> this
> year and thanks for blocking me with this. I am really really
> upset!!!!!!!

FWIW you can probably unblock yourself by adding a local copy of the
compatibility bbclass with the warning removed. That will then let you
fix the fallout at a time of your choosing.

I was in two minds about the change to be honest but nobody commented
in review and I get really tired of a reputation for saying "no" to
"everything". What probably swung the balance is the ways you can work
around the change at least temporarily.

Cheers,

Richard


