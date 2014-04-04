Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id AF71C6E75A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 09:21:36 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id e89so585236qgf.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 02:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pLLbzDoz9LZnnAhun9NS0S0xOlcUPAmiwcOZRbofAHM=;
	b=awEj2mZaet6y3T6fy7uyNdjX19UQdYk5etQA/eZJWZoBkzxKMVb7kj59KgUFdJwudg
	dwAVI4e92RP6YYOdNpxTnE/sv6jPzItZ6pO5IfZfHW4DMbd3vNAyB7sRXGaNv1lfSaub
	imQNZPVMYAQjbmu81v7rL+i1jM26VKaBXbfHQBP+5F0PB+XdaZDUU752IRA2nSTJBGal
	3WWaDr+8ZLDWi9uDZw95pYo1Gm4wkwpTisdACtQ8fM6WBj1Yx+F4A3H65XaxH+JkuX++
	xiNms/mSK9ddPChQo1R0mZNoynEy0eyQtITQzx24NStxt/nl/hsi2q1huzIRviqBDvyh
	+BWQ==
X-Gm-Message-State: ALoCoQmW8Uhv1mRwqS8h7Gvx7BzRpcxdms42HHsLX6P9AlRxcGrSk951vmNBVGyZ83FKi/WC4ClQ
X-Received: by 10.140.42.9 with SMTP id b9mr12097994qga.87.1396603297416; Fri,
	04 Apr 2014 02:21:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Fri, 4 Apr 2014 02:21:17 -0700 (PDT)
In-Reply-To: <1396601617-29638-1-git-send-email-koen.kooi@linaro.org>
References: <1396601617-29638-1-git-send-email-koen.kooi@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Apr 2014 10:21:17 +0100
Message-ID: <CAJTo0LYKL4iyDjQS6hTA=mc9mphnr543dJagP8mM94feRWS1hw@mail.gmail.com>
To: Koen Kooi <koen.kooi@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] dbus: split dbus-launch out into its own package (again)
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
X-List-Received-Date: Fri, 04 Apr 2014 09:21:43 -0000
Content-Type: text/plain; charset=UTF-8

On 4 April 2014 09:53, Koen Kooi <koen.kooi@linaro.org> wrote:
> When installing 'dbus-1' it will drag in X11 libs due to ${bindir}/dbus-launch being in ${PN}. Move it to a seperate package to be able to generate a small filesystem (e.g. initrd) without X11 libs without needed a seperate DISTRO.conf.

What's the concrete requirement for this?  Presumably an initrd that
is starting a system bus but that doesn't also need dbus-launch?

Ross

