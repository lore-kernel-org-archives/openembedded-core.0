Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACD362134
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 16:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5FGwMw0002225; Wed, 15 Jun 2016 17:58:22 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xLS86IGX9J3w; Wed, 15 Jun 2016 17:58:22 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5FGwImR002221
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Jun 2016 17:58:19 +0100
Message-ID: <1466009898.13979.230.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Jun 2016 17:58:18 +0100
In-Reply-To: <1465996380-32444-4-git-send-email-maxin.john@intel.com>
References: <1465996380-32444-1-git-send-email-maxin.john@intel.com>
	<1465996380-32444-4-git-send-email-maxin.john@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 4/4] pointercal-xinput: add a dummy calibration file for qemu
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
X-List-Received-Date: Wed, 15 Jun 2016 16:58:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-06-15 at 16:13 +0300, Maxin B. John wrote:
> In qemu, the emulated PS/2 mouse reports itself as an "absolute
> coordinate"
> device and that makes xinput_calibrator think it could be calibrated.
> 
> Add a dummy calibration file as a work around to prevent
> xinput_calibrator from
> popping up on every boot in qemu.
> 
> [YOCTO #8380]
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>

This doesn't sound right. In qemu, we add a usb touchpad which allows
absolute coordinate entry, which means qemu doesn't have to grab the
mouse.

Are there two devices? A mouse shouldn't be seen as an absolute
coordinate device.

Cheers,

Richard



