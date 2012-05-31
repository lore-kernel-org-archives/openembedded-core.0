Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sa9Xq-0004R7-Jy
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 19:52:22 +0200
Received: by wibhm14 with SMTP id hm14so1057652wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 10:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=BiYWNedPqqV+TKoR5Ua7Cy62TXypa1Q5tv6MLm+DxMA=;
	b=SwBzjsKvl/oF1JegkfuPdprxirXBrnkTlzvrLVIz0T15o8xG4/wMgh2rPK+8Nt6tp7
	lwF8WCfx7spGCwrf8+oGDNvX1ljwIbdvRCH6SAJuxhwMLl6noOCF+8/GEWUnHZO1Pg+p
	gSnTEh2YOsZFykftl3Iwt6xS4M79IHm5p9M40GPZi+bP/f8UBreUSHIwzi/sseLSrfJ/
	vTek/whXrHaNIjs6sIxL5raZ/becTjOZtmFT9DlXxDACTKg8WD6Mhu2I0kO4FD0fYZqI
	YgtBU9oZ2UIACp3gTT1o9Oey0atUnAksN/YR/yKw3lEUKuYHJxMAMwsvX+f50uJhrO5u
	hBaQ==
Received: by 10.216.214.82 with SMTP id b60mr14326860wep.38.1338486122767;
	Thu, 31 May 2012 10:42:02 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id e20sm4908788wiv.7.2012.05.31.10.42.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 10:42:02 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Thu, 31 May 2012 19:42:05 +0200
Message-Id: <4B290EB1-572B-4AC1-B917-BF5EFD18CC03@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: [meta-xilinx] libpcre_8.21.bb: IOError: invalid Python installation
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
X-List-Received-Date: Thu, 31 May 2012 17:52:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      I noticed a situation where, when I try to bitbake linux-xilinx, =
it fails a libpcre, because of an invalid python instalation.=20

However, after doing a bitbake -c clean linux-xilinx libpcre, and then =
rebuilding libpcre, python-native gets staged correctly and the build =
succeeds.

Shouldn't python-native get built correctly the first time around?=20

My parallelism options as follows:

BB_NUMBER_THREADS =3D "6"
PARALLEL_MAKE =3D "-j 6"

Best regards,

Elvis Dowson=


