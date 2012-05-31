Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sa9UO-0004LM-M4
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 19:48:48 +0200
Received: by wgbdr1 with SMTP id dr1so1059602wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 10:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=+k5ku7P5w/LMw7TMw8b46URz/GJVDUK8O2zJze++Ib8=;
	b=zstQF1mNTELmPBH+MjeZ/Q2KW26zMTdVE8GZT99SSx3pmnDIm4TYuZX+j1CZGaI/Om
	HPK1RD4ete9vP56/KeccTQgebl3wlWy2R8GXB/HlWs/NJR2/IszOkbmR09F1ZrhorNEe
	d37JaGcySYDaGQqmkWqWGFB1dj7YZeARv6VsAFbrPKy7IvpcUCiZSs69597KyMRMT46Z
	+vQ+7t0VRdaWs70fKgXA0mhhVC0W/YgcKZYYOz2CyUXQxf5bKe5H42LWhgqKGkshAZaX
	S+RAQ/t5qQqJD4/hW+NJ2DNWBrAIlLVkble2DW5EjFYkoGtkR6wN/Og2ezfDP0QzFF/k
	LxMQ==
Received: by 10.216.215.201 with SMTP id e51mr14043018wep.214.1338485908789;
	Thu, 31 May 2012 10:38:28 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id f7sm3518871wiv.2.2012.05.31.10.38.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 10:38:27 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Thu, 31 May 2012 19:38:31 +0200
Message-Id: <72EA6980-26CF-4ABB-A6F9-9CD5F555EBEB@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: [meta-xilinx] WARNING: QA Issue: bash & shell scripts
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
X-List-Received-Date: Thu, 31 May 2012 17:48:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      I've found the following warnings while attempting to build =
linux-xilinx. How can I trace which package it's originating from and =
what can I do to fix it?

WARNING: QA Issue: bash: Found a reference to /usr/ in =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/bash-4.2-r2/packages-spl=
it/bash/bin/bashbug
WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir should =
not reference anything in exec_prefix

Best regards,

Elvis Dowson=


