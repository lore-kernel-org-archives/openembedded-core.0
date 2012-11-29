Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Te7Wg-0002iU-4T
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 18:03:51 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so16255406ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 08:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=xTsoL/E385knr8xHtDrXbeddE8AhRh7RAC/uo2MVwno=;
	b=hyFQrfXTB0TPVjJLkIM2o3kTlB7b+XehANDi95yXKYg63fTEB7HSNMjkLu3HlhtQHd
	B/VT2PVfkDOpPQpPUFvB+6rI0T7RapqCvQ2Y1tJM1kiL4ah67BD6oAGuWrTCRdpsCNfe
	o66+gO5+X6X004C5bU22gyliN3jMDI1BYBn8Fhnw50U1JkI5D6PA2biRk2BCeAw2Obmo
	HwFcBoQv380XHGSzarqNdoLQV/fnPMTIcX10Ujn8vr+PDeg/nYEI4EmqG6CC6aZlDApF
	JwnATCELAoTPthvzmP7H4QxEcxXXliwnetgjj6d+PSzgsQH+HwXAfclBGlG68mpbG3Jf
	hBGg==
MIME-Version: 1.0
Received: by 10.50.237.6 with SMTP id uy6mr26566760igc.31.1354207773655; Thu,
	29 Nov 2012 08:49:33 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Thu, 29 Nov 2012 08:49:33 -0800 (PST)
Date: Thu, 29 Nov 2012 17:49:33 +0100
Message-ID: <CALbNGRTD6Tc3xh2upD-Dd-p+YD9asde6PrO8xCPFsd4z9TSZQA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: xorg x-server issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 17:03:51 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Currently I am testing some modifications for lxdm (lxdm+xfce+systemd
image) and get the feeling that the logout behaviour has changed
(maybe since the update of xorg to 1.13 - forgive me I am definitely
not an xorg-expert). Seems that x-server is shutting down when logging
out (screen turns into text mode, it lasts longer and log file is
swapped to Xorg.0.log.old). This I did not yet notice because it is
immediately restarted by systemd. The problem for me is that lxdm does
not detect session closing before shutting down. As a consequence the
scripts PostLogout/PreReboot/PreShutdown are not called.

Anybody else sharing this behaviour?

Andreas


