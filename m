Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 03B0D78DCF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 21:28:52 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f21-v6so7617235wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 14:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SlYkaTSteaFCP7lYI4r/L7yZjaojHRb+R9SYR2yC8yY=;
	b=Fa4MOFAOC+bFHuHaeuWNLSft4QyyZ3juj+x073Telw8yfE94m2fyWdL4FRwhGYOenN
	IGKFnd0lnNpV1W7mtoX8QvqxpJpvXS3PiVFgH/t67gcFIaCeejmh2RvfUvF46swosFCf
	/I9XoLhxlyidPR+FEvhxafQOT2VWC/p9Cjjb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SlYkaTSteaFCP7lYI4r/L7yZjaojHRb+R9SYR2yC8yY=;
	b=BS+9gQJTrDm5dlnoj6U5ZZuti2uydnjGsfSPGmRv+CDJ/owOT4mfaEU+ruwfpEPcwS
	xQYA4q5YPS7s/dHRKP3i9JN53siLVXzg/l249hudMCI5jO31AG4SAgLjU6CfMk+EOQ1P
	zt+D5Np5JKAOH1vbWf3JBHqDALOTZ1FvV5dxmwrb+SjorohrKrhLUir717KziVXZ3SGw
	o29POTTqWZoREbdIVLaLJNpk9ja8/k2b/wTBeft7PEtEIPlgvjwOQE+JlV117OxTLfUq
	e7e/bZ1wdZW3vk5yVI0aSe7jRP/wmfbOSj/525E+URIBTPOdz2xqJyI1OjtKCYroqh6S
	69dA==
X-Gm-Message-State: AOUpUlHi55mTpg+zHJO1l5MY71/0gzoVQRUyqYPXnQzD2jbWgBPGy+hX
	ycIZ+GRbIomUGVULpdccwPkrvA==
X-Google-Smtp-Source: AAOMgpe4GeC7EwodG+7/FLgz2k3P+rHgrg1ZSJBa2D1hL5jhadHlc8iKtDXhGKq328TxAWqmKaQqyg==
X-Received: by 2002:a1c:b213:: with SMTP id
	b19-v6mr5740022wmf.141.1533331733491; 
	Fri, 03 Aug 2018 14:28:53 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y206-v6sm317438wmg.45.2018.08.03.14.28.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 Aug 2018 14:28:52 -0700 (PDT)
Message-ID: <178d4c597dac03d0d39b55450f023c57bd6c7c3e.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: kai.kang@windriver.com
Date: Fri, 03 Aug 2018 22:28:50 +0100
In-Reply-To: <20180803014947.23598-2-kai.kang@windriver.com>
References: <20180803014947.23598-1-kai.kang@windriver.com>
	<20180803014947.23598-2-kai.kang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] remove allarch from recipes which rdepends on TUNE_PKGARCH packages
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
X-List-Received-Date: Fri, 03 Aug 2018 21:28:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-03 at 09:49 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> The following allarch packages rdepends on TUNE_PKGARCH packages. So
> remove allarch from these recipes.
> 
> ca-certificates -> openssl

Should we reverse this, i.e. have openssl RRECOMMENDS ca-certificates?

> docbook-xsl-stylesheets -> perl
> font-alias -> font-util
> initramfs-module-setup-live -> udev-extraconf
> initramfs-framework -> ${VIRTUAL-RUNTIME_base-utils} (busybox by
> default)
> ppp-dialin -> ppp

ppp RRECOMMENDS ppp-dialin?

> resolvconf -> bash
> weston-init -> weston kbd

weston RRECOMMENDS weston-init?

Not really sure about some of these but we should at least consider
it...

Cheers,

Richard


