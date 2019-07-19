Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id B2C247F118
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 08:10:01 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id p13so31271632wru.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 01:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=MDRPkVKdl9fuCcTy8WbzUb2IXhxH4Q6+6m5yCvjyB6Q=;
	b=SfqLoIJ9qWtT/bvLJFOEXBKAHOl+d+WpOFCqPlpgnFFW0TB2t4icvgDK8gDMGTfDsT
	avAZiO6mYMoARJ+lUZhf9X7kKKQWr0Yv/b1Nhl/zmR333dp/BGy97moNZ0dr3ahhXWQS
	+DOeBhlZFdlBRN40xTlaf4mJtzI66TeDeVqAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MDRPkVKdl9fuCcTy8WbzUb2IXhxH4Q6+6m5yCvjyB6Q=;
	b=aOAxHnPV61QiBXpqEbvS/n/tQnnBhSRraVDVkJ3xWnG6JSf5h/dX7hyu9Gk5+oTNqh
	RzCAloYGQDbcAd/hMfIRFOV9oUde8hzoJ25pyeMS9MXEzLMewsIvyyfkUh1RAQR9ZlU6
	A9iWpGD31gRN08Nl7l3PdZvgicayhn4pMTQESVPBOVGB8xsqzN7WEpP1nXv2PAHFYuAA
	eo/k7xjvfwTuf9FMQhuFv1elkyEr4ETS807XURJXVUP7a+XnSweuSPlrzfRx1pFmsNke
	IhwrpoLRvup1/8plof8NziwEVXrRZXCESTsvjqC4BheCrFWuzOgRP6Y+84p0eHJ9LBQa
	KLjA==
X-Gm-Message-State: APjAAAW6Zxwi3NUfLdyMZCbnZBi24F6Q5/C5JzdIDJkA2eYCovwtM55e
	IRQzlxCwXK5aunojql24acJNnSHnC2s=
X-Google-Smtp-Source: APXvYqzRTL4X0HAPEawkdjSenA0X7on0zMueNypoTKerfJUSxW4Z/ZRwGKE6S3KdlEUdiK9+tNxTug==
X-Received: by 2002:adf:f591:: with SMTP id f17mr40014018wro.119.1563523802557;
	Fri, 19 Jul 2019 01:10:02 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k63sm37340309wmb.2.2019.07.19.01.10.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 01:10:01 -0700 (PDT)
Message-ID: <d8d7ddffe296b619b2e6c124f5a9653db920c377.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 09:10:00 +0100
In-Reply-To: <1563512345-367867-1-git-send-email-changqing.li@windriver.com>
References: <1563512345-367867-1-git-send-email-changqing.li@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] oeqa/parselogs: Whitelist qemuarm64 runtime errors
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
X-List-Received-Date: Fri, 19 Jul 2019 08:10:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-07-19 at 12:59 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> The qemuarm64 machine doesn't have graphics so whitelist the
> X server related failures

qemuarm64 *does* have graphics and we don't see these errors on the
autobuilder?

Cheers,

Richard



