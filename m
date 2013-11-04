Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 68CF7610D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 23:49:39 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rq13so3664186pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2013 15:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=izxM+yeTSQTkXVVvLk884HYH3HvNht821vUBBi0FOL0=;
	b=nSCE2lwr4pGpJUpxjYMx4fJtF3roFBntwboZBcVJwliXstOe+Xolwsf8uTwzf9DYom
	858DPdwOS4xEB9QFOWvqZoNF2mjLP9pm4MzXwFW1gbre371V3l6WJrcYMabTVqt7Bq7c
	/y2ejFnGrE6ey1vdbI2hUD6EbCpFUtOpwf2GyQBeyWi0k5mv4X7htIHkGjZH9egnKjY+
	qV0sJdoZHPiV19LTipkWO4prECuhOZ0LErdQF/PnMnvzpsl/NFLCV9uNThwnDKROePrE
	uUjWHxaa/1PiWlkhVBPfLjTrqsA1IBZqJWdKDeGmlSvH6UtFKjSz6lP1bo9Ckvbr7qcL
	2FQg==
X-Received: by 10.68.253.67 with SMTP id zy3mr8779057pbc.137.1383608981446;
	Mon, 04 Nov 2013 15:49:41 -0800 (PST)
Received: from yiqingliang-pc.localnet ([117.89.52.52])
	by mx.google.com with ESMTPSA id
	rp8sm30571841pbc.25.2013.11.04.15.49.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Nov 2013 15:49:40 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 05 Nov 2013 07:42:20 +0800
Message-ID: <2950804.p9J3lAVWuT@yiqingliang-pc>
User-Agent: KMail/4.11.2 (Linux/3.11.6-1-ARCH; KDE/4.11.2; x86_64; ; )
MIME-Version: 1.0
Subject: boost package fail
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
X-List-Received-Date: Mon, 04 Nov 2013 23:49:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello,

	I'm working on Archlinux x64. when packaging boost, I got error:

arm-jilong-linux-gnueabi-objcopy:/xxx/tmp/work/armv6-vfp-jilong-linux-
gnueabi/boost/1.54.0-r0/package/usr/lib/libboost_iostreams.so.1.54.0: File 
format not recognized

	I don't know why boost compiled with host ARCH.
	but I have one machine can done it correctly.
	So I compared the two machine, the 'bjam --help' command result is 
different after source yocto environment.

	on the failure machine, it will use '/usr/share/boost-build/user-
config.jam'. the success machine don't have this file.

	so the different result in this error is: the failure machine installed 
package 'boost-build'.

	after remove 'boost-build' from Archlinux and bitbake -c clean boost,
I have done package correctly.

	I think it is oe bug, do you think so:)?

-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

