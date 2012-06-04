Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SbVK9-0003RH-V7
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 13:19:49 +0200
Received: by wgbdr1 with SMTP id dr1so3607605wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 04:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=sEyoT7926ruYP36dj1VL4lGfzN63VdT8I9WKfG4B3AI=;
	b=TOv7R0T+sZaQDCBWzn2Vqonrpj5RjkTXa4ZNp6IosNjTGDzImhjMP8UuMEDiz6ZQA2
	NazVK39YLNYIcC0E6MiQXAJ3HgzM80zwnreUsdBuPtH2IyyRtw5TQJZSBtjtAZRI+PS2
	YU8pjR/FqtrgQ8yW5n6Fg3i/EPV2+v22/A/Bq5Bh9kW7e8vq2G2Vf7NcWdUlR8ZR833u
	nBQH++s8yY1LLdL9+xfFejAyIu4KV2OY/6aSwLMDuix4yiCW0I3/ZrboQ6I8BrQqOaTb
	8eeA0Kb7F20MExfqu3EvyZkHVMChjDBKCm9DJuV4UQIDBhTZoxBbum6hJ5R3TO1Dw3SH
	NqcA==
Received: by 10.216.207.151 with SMTP id n23mr10966983weo.100.1338808165443;
	Mon, 04 Jun 2012 04:09:25 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id f7sm31289444wiv.2.2012.06.04.04.09.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 04:09:24 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Mon, 4 Jun 2012 13:09:22 +0200
Message-Id: <F96148FF-8851-435D-B51C-0D12505AB294@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: qemuppc does not respond to mouse input when running inside Ubuntu12.04 VMware image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jun 2012 11:19:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      I'm running all my Yocto builds using an Ubuntu 12.04 VMware image =
using VMware Fusion. My host operating system is Mac OS X 10.7.4.

I just built a core-image-sato image, and ran it. It brings up the sato =
desktop, but I cannot interact with QEMU using the mouse. If I press =
ctrl+alt it releases the mouse grab, but if I click on the QEMU window, =
I can see the mouse cursor moving around, but it doesn't interact with =
the sato desktop.

Is there a fix or workaround for this issue?

Elvis Dowson=


