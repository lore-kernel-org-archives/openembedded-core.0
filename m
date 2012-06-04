Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SbRcW-00081N-Pp
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 09:22:32 +0200
Received: by wibhn14 with SMTP id hn14so2043768wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 00:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=VKR1bLA+q/GoeBHL5CD79XbQ/6wHK7k/u94oPfMEhQ8=;
	b=hKRXxtsUvUCmm9QVyYFOfsYIwj56qdNHgR8I3bixXrH1qEQwjL6HAb5ORYgw5wu89H
	cVd3yCEhNtNWC2DwbPrgJWhw3VFSjS0w+mVrm0bmYd613pGJT/bIzv+hsaeIxxdTbSY8
	d+Zu3EbF0Fqlo3bwe+SE43t9YaUviZh/hOsch3ZV6t6mO7bD52ET4f0STihKDrojKD6K
	b0UmNs/rHYwJ0OfysXPwgVOnMoK8PGZU2wbhTun2TsWuFrw8AWVrHs7ChG+KjKPU3ioU
	FEV2uVDqIrpdPkFJl44XWhzuCJZjhYoIuNyJnygoIfZVbffkAJssOmQwmTNLnAepvoMt
	HpDQ==
Received: by 10.216.194.23 with SMTP id l23mr9739696wen.121.1338793928461;
	Mon, 04 Jun 2012 00:12:08 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id f19sm29505213wiw.11.2012.06.04.00.12.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 00:12:07 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Mon, 4 Jun 2012 09:12:05 +0200
Message-Id: <FFF09E3B-E9FB-4D8C-9CE7-65E014F04F2D@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: [meta-xilinx] Creating a QEMU for Xilinx ARM for Zynq 7020 device
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
X-List-Received-Date: Mon, 04 Jun 2012 07:22:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
     I'd like to add support for qemuxarm and build a core-image-sato =
image, so that I can emulate the ARM processor on the Xilinx Zynq 7020 =
device using Yocto.

The sources for qemuxarm are located below:

http://git.xilinx.com/?p=3Dqemu-xarm.git;a=3Dsummary

I haven't done this before, so if someone could guide me as to what I =
should do, and the recipes I should take a look at, it would be great!

Best regards,

Elvis Dowson=


