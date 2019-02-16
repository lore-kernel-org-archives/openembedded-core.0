Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 81E696C149
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 21:38:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id o17so14054557wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 13:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=iMbHr8uXwnkBDE4j2L8OAVdYn5MSF8F8AO4+LwPRC5A=;
	b=TxDkSDBtB7qqonuSBClSZiXUjtBtiDaAfYJJCEa5giadwJ1yXehZ+K/9efN7gDEVft
	jPh4csJpiHEtyv7c+R1D6Fqa+RzkQHTZ9iQcextFN4cBzVQ5Az1CJkxOLypTQCJM13n4
	wdCtjwDNOzlFmdXifDV2O/P6AAU4LBkh5L/BU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=iMbHr8uXwnkBDE4j2L8OAVdYn5MSF8F8AO4+LwPRC5A=;
	b=U++cIjBBdAlNZVHGJrlWOSkbdRDd5Cxh0eVq9G2FgDikL8BNBXyBeFj8UMapldDgv0
	OCXIep2I+KqsDJw4yOjx/VErGqJ13nk5puATcdEPWVb7EuUZiGft/5Yvr2VBj9O+erom
	281BZSwaQTJAFqQbuA8lg8Cv+zp2v/dxemKEhvXhi/zMkZpeEWVNuBTKJjrkJEUdrI4m
	0gnK1LKpyiXxucilOBe9s1ImRNjzdbKMG6fEJ15nUrLmZoT+Qk8wPlYpt8m0Sv4uRh6O
	Di5B5ffGb9Bat5oJ8455V6mz1mGQsfddz9znK5vz/p0W1BEJ9GmlR9dzMiFprzFTMGOp
	wv5Q==
X-Gm-Message-State: AHQUAuaCFPUWOiz2ICjz9tewls0id5szsiyU+IgWHMbjbOM+tzC9axC+
	3QKSJZuOJ2+zwR6GZsuYnmN1dg==
X-Google-Smtp-Source: AHgI3Ib7eM9rccdFLzEl/rXAoY6/Dxh/o3X9O1/psMrB2Amgyl/e05UjDVliMPoeWtv+l70LicSr+g==
X-Received: by 2002:a5d:4090:: with SMTP id o16mr10266436wrp.208.1550353129105;
	Sat, 16 Feb 2019 13:38:49 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n26sm5298060wmk.29.2019.02.16.13.38.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 16 Feb 2019 13:38:48 -0800 (PST)
Message-ID: <d1a6ccb19112c13eed8bddba5900bd754717a804.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 16 Feb 2019 21:38:47 +0000
In-Reply-To: <20190216194048.6256-1-andrej.valek@siemens.com>
References: <20190215082252.2726-1-andrej.valek@siemens.com>
	<20190216194048.6256-1-andrej.valek@siemens.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 1/2] busybox: 1.29.3 -> 1.30.1
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
X-List-Received-Date: Sat, 16 Feb 2019 21:38:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-16 at 20:40 +0100, Andrej Valek wrote:
> - update to last stable version 1.30.1
> - remove and refresh already merged patches
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  ...inittab_1.29.3.bb => busybox-inittab_1.30.1.bb} |  0
>  ...te-check-CONFIG_DESKTOP-before-using-od-t.patch | 83 ------------
> ----------
>  ...-testsuite-check-uudecode-before-using-it.patch |  6 +-
>  .../{busybox_1.29.3.bb => busybox_1.30.1.bb}       |  5 +-
>  4 files changed, 5 insertions(+), 89 deletions(-)
>  rename meta/recipes-core/busybox/{busybox-inittab_1.29.3.bb =>
> busybox-inittab_1.30.1.bb} (100%)
>  delete mode 100644 meta/recipes-core/busybox/busybox/0001-testsuite-
> check-CONFIG_DESKTOP-before-using-od-t.patch
>  rename meta/recipes-core/busybox/{busybox_1.29.3.bb =>
> busybox_1.30.1.bb} (89%)

I had a closer look at this and I think we need to refresh the
defconfig with the new version of busybox and be explicit about the new
things we're taking or not taking...

Cheers,

Richard


