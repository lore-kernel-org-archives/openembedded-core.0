Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SaC93-0000Lc-LE
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 22:38:57 +0200
Received: by wgbdr1 with SMTP id dr1so1184099wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 13:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version:x-mailer;
	bh=HuXgqeIiKOjEazbFOKZCpjAxKKY1GAzQoy8LI3sBZBQ=;
	b=bajmClaHY/KH2Y64qL8Er0wRw9sdgqbPGdsgLbBGen43n1V3Ixb3RXvu1X+jEm6jnI
	ZqAjzArefg8ROrzCF/Fb1luKK8auKfJdD1H1pE37EGRa247OU2VU6KykGZae0xqmPirX
	ftxLervZGKJe92dtt/zrhQyvC43JJ7oiMcpZuR3WXT0GaDkr6ELTFrRRrUSeicxbs9D7
	F9G1JaLq5ZdToI0SZCsa8hY9QTDHteLGFngrX99Oh7AYA7fMHoFfrtwL9Q1XUfNM5pPM
	fC2JGNFoDetNdIl74DMffjFtqptq6jh12QshKVV8c+1pA5QyY6+mo9X4mdkshco5+XnL
	qTVA==
Received: by 10.216.227.154 with SMTP id d26mr116595weq.9.1338496117513;
	Thu, 31 May 2012 13:28:37 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id ez4sm5837271wid.3.2012.05.31.13.28.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 13:28:36 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Thu, 31 May 2012 22:28:40 +0200
Message-Id: <33616B9B-AAC8-474C-8790-047AA44C1C89@gmail.com>
To: Adrian Alonso <aalonso00@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: [meta-xilinx] Generating device tree for building linux-xilinx kernel
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
X-List-Received-Date: Thu, 31 May 2012 20:38:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Adrian,
                   When I attempt to build the linux-xilinx kernel, it =
doesn't find the device tree (*.dts) in the xilinx-ml507-update BSP =
project. Is the device tree supposed to be generated manually? If so, =
could you please tell me how to generate it?

Best regards,

Elvis Dowson=


