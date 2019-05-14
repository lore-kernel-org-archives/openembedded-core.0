Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D17057C861
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 17:36:30 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 7so3658512wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 10:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=5O7oydJ8FXNOSi6tUXdfLngjPqajehBfTeBpiTLVTJE=;
	b=djYHRfABVbtVh+ngrHTq4axvTNISLOYuJ+iKYs6FkXaVg2jNiE/ian/jGdYrl5AAdC
	x2DeFBGDQoOJr/i7mcq85Hpkk0fW+uoeRjk2g6TQdnDTQe+nxUoFBL5+iBebvWyqw/mb
	AKjScFjKlzYgOR08OmfpqZBMNYOEXUbkvk1hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=5O7oydJ8FXNOSi6tUXdfLngjPqajehBfTeBpiTLVTJE=;
	b=hsUNduXqkYUsupWrirnkfavku0G0MotoovYpw8nCSBYQy3N8sY2HwALRvm5PN1+19L
	RhQhVVC2uVIUJFGvVkfFth9pIaFTEXlSpypLxPBGD9/sSMYky0as2Vumbp4IPi3eepVn
	w3slwUOIxB2Zp8fJDRkBCX9uijjw9223aK27n8wAvBur7l3/UscHJSi9obGgjhbOnaWz
	QbRQm9HsVRTjwzhnwOu0lBd0nRACxQYhSaBD4jxzK0qAXzu54fQE73/aim9keMo2GQAc
	M656noPH3Yo2G/NncFUAtzH1hESkmTKHc2yZ4LmwqoPuM4l5idP6YqGU2d+deEDF+4rS
	3qcA==
X-Gm-Message-State: APjAAAWiX/idGjcP3a54zNMaew8bhwUiyL2clLWOZmcooF1TLiKDHeUi
	6HfR1tF52Sc9eVLYIKSyBpGRJg==
X-Google-Smtp-Source: APXvYqx9cpkf04a3mO7gMdxkZTZs3AbrvhYOas8ueSo1JTr9LpJ+/biCO5pKPDB+mXV3fBMxdjJtCQ==
X-Received: by 2002:a1c:80d7:: with SMTP id b206mr19331494wmd.48.1557855391588;
	Tue, 14 May 2019 10:36:31 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r2sm42185591wrr.65.2019.05.14.10.36.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 May 2019 10:36:30 -0700 (PDT)
Message-ID: <d2813cd316e8c8574f532727cb464d2a6e0bd796.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <Alistair.Francis@wdc.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 14 May 2019 18:36:29 +0100
In-Reply-To: <20190513225205.14791-1-alistair.francis@wdc.com>
References: <20190513225205.14791-1-alistair.francis@wdc.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] gdb: Upgrade from 8.2.1 to 8.3
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
X-List-Received-Date: Tue, 14 May 2019 17:36:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-13 at 22:53 +0000, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> If there are issues with the patch the branch is avaliable here:
> https://github.com/alistair23/openembedded-core/tree/alistair/gdb-8.3

Seems there is a problem in oe-selftest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/174/steps/7/logs/step2d

"oe-selftest -r package.PackageTests.test_gdb_hardlink_debug" should
reproduce and it seemed to happen on more than one host.

Cheers,

Richard


