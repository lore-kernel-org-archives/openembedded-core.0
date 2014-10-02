Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2F9487029A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 10:49:28 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id j5so1589729qga.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Oct 2014 03:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VGGVjGsCPa8f8XAlGValT/yX1qfu8SCe99elNo6zDq8=;
	b=hz01WpoksHXmMgyAH7e+e+i0y9SWtQucEPxtWsTa3baV+1ZLJEyOQQWR2g8WBJLFlW
	hRyHdEmZoqQe6GJYzRQjvi6UxYwRgGAu1dcMpc2vgb0nZjGqpTO08ylIq5Bi9CoEvQc+
	zOGycy8ngGzNNpKThRATLEin5QOaDcC4NEvVpfXH28e3oeZjDACuQ1aWCBi7DMI/pEuP
	5vdbmdQW6WE8EY/1+P5pLwJ2Eps6DrQoeBBJO/77ItjkjKJQ+RRJnMlcGytkMtCS0eyG
	G72/3J3Jror+XpIpUuU9tJiOZaE6e5LoYxUarlpXtXXJCLFqB+ARIdgPjs3pncy51R4Y
	rXjg==
X-Gm-Message-State: ALoCoQmH+9Eo8TKTDY6F5pvOxyerrkwb7Acwmah9UYoE9RopI56q57YQ8SPXNGSFjrXO+WaRAIgG
X-Received: by 10.140.27.239 with SMTP id 102mr1921817qgx.59.1412246969271;
	Thu, 02 Oct 2014 03:49:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Thu, 2 Oct 2014 03:49:09 -0700 (PDT)
In-Reply-To: <1412237161-48093-1-git-send-email-javier.viguera@digi.com>
References: <1412237161-48093-1-git-send-email-javier.viguera@digi.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Oct 2014 11:49:09 +0100
Message-ID: <CAJTo0Lazv8xfBPA51UF_NDz0MJm7tCgjEP9Ya404x0V54q7dAA@mail.gmail.com>
To: Javier Viguera <javier.viguera@digi.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nativesdk-packagegroup-sdk-host: add nativesdk-u-boot-mkimage
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
X-List-Received-Date: Thu, 02 Oct 2014 10:49:30 -0000
Content-Type: text/plain; charset=UTF-8

On 2 October 2014 09:06, Javier Viguera <javier.viguera@digi.com> wrote:
> Add the 'mkimage' host tool to the toolchains generated with 'bitbake
> meta-toolchain' or with 'bitbake -c populate_sdk <image>'.

But not all BSPs uses u-boot.  Having the bootloader tooling makes
sense, but it needs to be the right tooling.

Ross

