Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id B5A71744BF;
	Wed, 25 Apr 2018 14:30:32 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id m18-v6so8493721lfb.0;
	Wed, 25 Apr 2018 07:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BWkHus4d0ldViRiXV1XPx5J3X3K18B5alJT+AnHYZXU=;
	b=BzfAxsxozA5BV7k58PCip4wXWi06t85LgkNAVZcVXdg3A5zXcGxjxJ8p0o9vVpMt0C
	qcPzbaYJ0Pp4zFlgZIiNJpVZ9HotNfO6uJoZt+EeTfMurBr43O3TKSpzy7eOW525HxFr
	KbbQgOtRwcmGuGs87WM3p7+sQi6SCa0Z4oNOg0HvI1vOefmPu2g0U1+S8ogc3/n3gZb8
	USHW9jhxldydJq61IIKfKmFvCiG7ukod2vOZ4icorVXB9d8SrOAa4TVQL8Jv065qNWm3
	Rq4JFZgrqY39XRCPc1C09XF5NCscrKPnhA42G93Adja3BKeKUqKQ4Mjyz9ftzUX6GO/M
	D6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BWkHus4d0ldViRiXV1XPx5J3X3K18B5alJT+AnHYZXU=;
	b=J0cam1SvYp+Kr9AyZ72Vv3tR3wA7QbklyDg4gv6p5q+ueU0OZURSu1Gs2P7zKMvNB/
	uxD2D8e7naYmtgVnY+sZMzbhfPjk8KJ/OOHIoBt6fq3G8uSpos8pyIKOnxRNM3gaOsE3
	pXpV0RkhIvQdX64vQpe2Sg1+s+n7xNTJ0v39baLe3WA4+GdtV4xsTbfMt7UMzAvrQSom
	JGdLAQkfhdJEqRafo7ufTD3J9bONizSqqsAlzDt2VaiPDxYp1INJjUQeNHF7aR8Z+/I2
	TgVFc2m/6gq4yik/Od8ZU6Ki6WrwjJWMjL++1t4+E4WCbxDwH+hhsu3E1g8bg7LT+jcO
	QGpg==
X-Gm-Message-State: ALQs6tDkHCAYrl3H5gckxRwdrtio2FOoOfkTU8ywkd3N63DYE/Q+is8r
	sW6+KOheJJJWAnSsAtOTte27sIUv9bvBw741q78=
X-Google-Smtp-Source: AIpwx4/Cqhhv6IEE2p+caOxsjg3nWWLHJZfobP62BMySnnFom6vHe1fPka3+PerSU3p4SFgJlzPODSEtfxGWQwnrqrw=
X-Received: by 10.46.148.75 with SMTP id o11mr19019178ljh.39.1524666633199;
	Wed, 25 Apr 2018 07:30:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:c9:0:0:0:0:0 with HTTP;
	Wed, 25 Apr 2018 07:30:32 -0700 (PDT)
In-Reply-To: <CAJKOXPe0SWcHYxKjKUsiAT+YMJFsjWzroguaO8aQO69T=cTkgg@mail.gmail.com>
References: <1524664054-21717-1-git-send-email-krzk@kernel.org>
	<CAJKOXPe0SWcHYxKjKUsiAT+YMJFsjWzroguaO8aQO69T=cTkgg@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 25 Apr 2018 10:30:32 -0400
Message-ID: <CAHUNapTZrzO+25mSCsqPYU35nJp0ZKtW+doPk_sJW3UQeUtq4w@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Poky Project <poky@yoctoproject.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-networking][rocko][PATCH 1/2] kernel_wireless_regdb: Add class for embedding regulatory data into the kernel
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
X-List-Received-Date: Wed, 25 Apr 2018 14:30:33 -0000
Content-Type: multipart/alternative; boundary="f4f5e80c590012a3c4056aad1d1f"

--f4f5e80c590012a3c4056aad1d1f
Content-Type: text/plain; charset="UTF-8"

Please don't cross-post this to multiple repository lists. meta-networking
only exists in meta-openembedded, therefore this patch only needs to be
sent to openembedded-devel.

--f4f5e80c590012a3c4056aad1d1f
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Please don&#39;t cross-post this to multiple repository lists. meta-networking only exists in meta-openembedded, therefore this patch only needs to be sent to openembedded-devel.<br></div></div>

--f4f5e80c590012a3c4056aad1d1f--
