Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SLxR6-0007a3-4r
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Apr 2012 16:06:44 +0200
Received: by wibhj13 with SMTP id hj13so1846412wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 06:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer:x-gm-message-state;
	bh=zzA+LktSBYVbkZgXR34FH0oUOf2SZL3NV8OVoeRpZUo=;
	b=M1qeGEZdGrxpOOjaXpEIqMiqkAM5fsmxOKfspShw46U/CiGGMwabu4Xib2yt0WTOEG
	pHjCrvQqx/Mn1pZRXrPp1FKO/T2HWF55Sn76U/PZ4WiTYmGVqjnX64G4lpYcw8QW6Zbj
	iDm3q2LTfBqchRqEyfelmYujSb4Q+leGX7y2mk2e5unTv53MLM7eU/KXaBPZCR9iOOiU
	KL9GiSjZL7tLIygLurHFAn4gIMfuxblsTW+v4fUAlGl74LFIbfjEDV5TiKVo01FO0lPw
	OC6nNl6s8k64IRGFSUC3WNPSXq5eM0LptymubtSFVRv32+oC+JRC9Icf8b1NrSDcho4B
	6yrw==
Received: by 10.180.79.72 with SMTP id h8mr13597903wix.1.1335103031913;
	Sun, 22 Apr 2012 06:57:11 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l5sm14773956wia.11.2012.04.22.06.57.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Apr 2012 06:57:11 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 22 Apr 2012 15:57:09 +0200
Message-Id: <91F01C72-881B-47AD-BBC3-99F505939D29@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1257)
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmaG+OZqMtFttSTB3ap56AXd5dWcYLu0/5O+GpbRRJpMPWegMF/RXXiLSXPyB0VvKrvFay9
Subject: Suspicous tune args for armv5te machines
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
X-List-Received-Date: Sun, 22 Apr 2012 14:06:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

Is the following still valid for the current oe-core (and =
toolchain-layer) toolchains:

koen@dominion:/OE/tentacle/sources/openembedded-core$ git grep CCARGS_pn
meta/conf/machine/include/tune-xscale.inc:TUNE_CCARGS_pn-webkit-gtk =3D =
"-march=3Darmv4t"
meta/conf/machine/include/tune-xscale.inc:TUNE_CCARGS_pn-cairo =3D =
"-march=3Darmv4t"

?

I know why and when it was added by Marcin, but is this still needed?

regards,

Koen=


