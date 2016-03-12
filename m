Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9707F73192
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 14:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2CEhQnI013822; Sat, 12 Mar 2016 14:43:26 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id T3g0G8SPZC0v; Sat, 12 Mar 2016 14:43:26 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2CEhNhZ013819
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 12 Mar 2016 14:43:24 GMT
Message-ID: <1457793803.2804.276.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sat, 12 Mar 2016 14:43:23 +0000
In-Reply-To: <1457721891-28398-1-git-send-email-bruce.ashfield@windriver.com>
References: <1457721891-28398-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-yocto/4.1: usb backports for Apollo Lake/Broxton
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
X-List-Received-Date: Sat, 12 Mar 2016 14:43:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-03-11 at 13:44 -0500, Bruce Ashfield wrote:
> Importing a series of mainline backports to support USB on a couple
> of
> Intel platforms:
> 
>    bbce8fe2cc42 usb: dwc3: pci: add support for Intel Broxton SOC
>    e734e1d9f827 usb: dwc3: pci: Set enblslpm quirk for Synopsys
> platforms
>    1c6bb6694d50 usb: dwc3: Add dis_enblslpm_quirk
>    1c6be99e56b8 usb: dwc3: pci: trivial: Formatting
>    2f2b89764b97 usb: dwc3: pci: passing forward the ACPI companion
>    ea4b3c72d976 usb: dwc3: core: convert to unified device property
> interface
>    dc670b52c69a usb: common: of_usb_get_dr_mode to usb_get_dr_mode
>    586fc5174649 usb: dwc3: st: prepare the driver for generic
> usb_get_dr_mode function
>    0624bd9af7ef usb: common: of_usb_get_maximum_speed to
> usb_get_maximum_speed
>    e65bc5467e07 usb: dwc3: Add frame length adjustment quirk
>    a90954c5d267 usb: musb: dsps: control musb speed based on dts
> setting
>    b48ff160a993 usb: renesas_usbhs: Allow an OTG PHY driver to
> provide VBUS
>    d1c59752195e usb: chipidea: set usb otg capabilities
>    733eada2cdec usb: common: add API to update usb otg capabilities
> by device tree
>    7ab2108dd82b usb: dwc3: core: avoid NULL pointer dereference
>    1aedb48b7dc9 usb: dwc3: add ULPI interface support
>    07e42a29fb7e usb: dwc3: pci: add quirk for Baytrails
>    065917252622 usb: dwc3: add hsphy_interface property
>    b2bb32a363a3 usb: dwc3: setup phys earlier
>    bf6bb0a6ebb5 usb: dwc3: soft reset to it's own function
>    d481da949476 usb: dwc3: cache hwparams earlier
>    9ac66262a201 usb: dwc3: store driver data earlier
>    5f940588938c usb: dwc3: ULPI or UTMI+ select
>    04fdce097f83 usb: dwc3: USB2 PHY register access bits
>    b7209213cc05 usb: add bus type for USB ULPI

I have a suspicion this breaks qemuppc:

https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/builds/683/steps/BuildImages/logs/stdio

Cheers,

Richard

