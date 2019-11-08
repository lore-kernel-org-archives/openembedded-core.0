Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF657FC9C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 23:07:06 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u18so103590wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2019 15:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=tOJrNMsdW2p3w2ifq+Dg5rmvakVQxLPfAf7SBjUoAtY=;
	b=gYhjToz1PXLb2CYODgpY+kL4LVXqlC0OPv5FWoiZlaCfWZaIZRnGDJr0Hj0khjKLTS
	/ctG1rtbVsL5o/tqO6tXHqJUWwQyfniFZhdn3H0BwHxWROJZS1RWlngRXN4qW4FCUJpk
	Cl80aAPnBIcifUeAFrVN2noXF1u1/besZLvz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tOJrNMsdW2p3w2ifq+Dg5rmvakVQxLPfAf7SBjUoAtY=;
	b=cskVvA13duiDamyeLIZgYVVVLxWYZZtC9erDpGjY6wXi8eRIqGHoz8kAUuogbomDtz
	uc/kVsZnVELk2xf+3Zu/q3RE0sU1/I7gvI9snouhj9/9m64LRidn9X4TJkQ3EwC9uqRu
	8YvWNFwAJeY7u+Zovetc8Ff/6/2l94RT5Gubcgu+adP3+Is8KYiv36z+DSQTbcmgBcUP
	QtN4n6Vv23W61+/pBdU+cVuqKEHKH3OVCuZR3/erY3VgVN5MWasaB42htdzzzBbNQByF
	xowd3t0AF2jn1p4wH2+wRNyw1hmL7vxvMtwqIfCiNXERYHsF2rS8UE4+8WOsEnLTs5wc
	NMKg==
X-Gm-Message-State: APjAAAX3XJUeMdHcihuUo6dQ2BHsYShlCukfIZpaDgGXBnFIniI7Lywz
	FR6YH3025lBW/oG991F3VpGX3g==
X-Google-Smtp-Source: APXvYqznCR9nR3ciwdo6/aT/nbPMzJAMcThOPxem4YSg0PSZq8b7o9OCzIwwR9WvHif6qbURAeXv1A==
X-Received: by 2002:a05:600c:12:: with SMTP id
	g18mr10937757wmc.44.1573254426950; 
	Fri, 08 Nov 2019 15:07:06 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k125sm8780941wmf.2.2019.11.08.15.07.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 08 Nov 2019 15:07:06 -0800 (PST)
Message-ID: <023265d217840d956c5e54d12591d7cfdd0442b5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, Alistair Francis <alistair23@gmail.com>
Date: Fri, 08 Nov 2019 23:07:04 +0000
In-Reply-To: <20191108202438.GA21138@localhost>
References: <20191106181819.12517-1-alistair.francis@wdc.com>
	<20191106221250.GD14721@localhost>
	<CA+aJhH3s7NhB-4YspmXrvrcG4py1=i2fJXg=seWPkJzosqVFGQ@mail.gmail.com>
	<CAKmqyKNVrqT9hHQxp38=72bBkz405P=6UJFPODxr5OLt_GSqDA@mail.gmail.com>
	<20191108202438.GA21138@localhost>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] tune-riscv: Add support for hard and soft float
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
X-List-Received-Date: Fri, 08 Nov 2019 23:07:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-11-08 at 22:24 +0200, Adrian Bunk wrote:
> Especially when looking at the arm64 situation I am wondering
> whether the best option might be to throw away the tunes mess and let
> the user write the compiler options directly.

OE once did that. I think anyone who lived through it would say that
the current situation *is* an improvement over a free-for-all.

This is mainly as at least we're now consistent whereas before the same
thing had different names in each BSP.

I don't know what the answer is but I don't want to go back to that!

Cheers,

Richard




