Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6031B6DF25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:30:26 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id w5so2349523qac.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 08:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UOEWwEVfso2mWMf+wPMaanKhZtBOiZv4ySn2MKsSXKQ=;
	b=PTNs+tC0EbfIeP3v5YIlUvVtfo7X0UM2GJNdvwfdUPUL/4axHbY6GMJjNgIcn+uyBc
	Jipl2OAEt/BVzrGSHtXkQ+ja+Jv55zFkDGucL2ZeYVm2G9sILHaqyKHGR39oMDOMzpRM
	InVMKvTxGWMUiam3fKBTunYcvGjFYzKF7pMY/A0jH/ikE+N9VMQqGz+1zhdsu+8ygKDS
	O7n0/F2fz45TflUJo3+CvRG5seCpfT1rP916iSz41yJuG0axNlcS10IZKDTLVydBmVoq
	UAS1JNnPMfVJbMvCzCJn+8FfHdWMr5/COxFWAlPlIgl+25bctHRAyTCISL6FxVc10Em7
	onng==
X-Gm-Message-State: ALoCoQmxgxaXF491NNk/Z4xAbNXOw661er+QLs5sDa+Pr9l6YI2lfKQEOFC0kGECtw+wMTQ2jyB8
X-Received: by 10.140.81.112 with SMTP id e103mr3001165qgd.99.1395847827441;
	Wed, 26 Mar 2014 08:30:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Wed, 26 Mar 2014 08:30:07 -0700 (PDT)
In-Reply-To: <1395844085-9929-7-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
	<1395844085-9929-7-git-send-email-lauren.post@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Mar 2014 15:30:07 +0000
Message-ID: <CAJTo0LbeQbR_9+trpBA7E0VKdpdj4=x+WRGUi=8uy01SXHytWQ@mail.gmail.com>
To: Lauren Post <lauren.post@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/11] pulseaudio: Change PACKAGECONFIG from bluez4 to virtual/bluez
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
X-List-Received-Date: Wed, 26 Mar 2014 15:30:28 -0000
Content-Type: text/plain; charset=UTF-8

On 26 March 2014 14:28, Lauren Post <lauren.post@freescale.com> wrote:
> -PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'virtual/bluez', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +
> +PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,virtual/bluez sbc"

I'm pretty sure you either didn't look at this patch, or didn't
understand what it's doing.

As it's clearly been untested, I'm NAKing the entire series.

Ross

