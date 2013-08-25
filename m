Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3ACCB6010E;
	Sun, 25 Aug 2013 14:38:03 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id y10so2467402pdj.36
	for <multiple recipients>; Sun, 25 Aug 2013 07:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:message-id:date:to:mime-version;
	bh=d3WQlxz2pkWaw0AkYj+2nR5djZrTCr1Zo5mIkQ2NWbs=;
	b=e/5d/uqAOxDLij8lJP3yuxEI0xWF0fHtohgGgGdGJmFhcjHg+IvdEg7YuHBAv1cKEX
	08qZxEEQKYchiWXbtcKbLFPUzupoEUt+pTiyQ5+jg8UwG/aW4yhSiHQ8zgiSS6jbgRCh
	xdinz78Wh7NLu6GZkK+WcXfp+omHm2J+0N4ZWSQSAfegwsvwlJEF/nUKiRfZtnX9Qhig
	7XvSsMG7m5NvjBMJgfz7jjn9404/w2nh9iHktH/mAjWsU7FGpQ6r6Qaxl/s/dnAAs9sc
	lOADpzJ4mdOBZxvm4i/B08SZMpJRecumgzPfbemqV/oZsv6pXUJ6dn1ZXX8Xju29C2Gp
	1TzA==
X-Received: by 10.68.160.193 with SMTP id xm1mr10392128pbb.88.1377441483259;
	Sun, 25 Aug 2013 07:38:03 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id s5sm12229591pbo.38.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 25 Aug 2013 07:38:01 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Message-Id: <8683DB7C-B756-4E61-B5EF-856E288139C4@gmail.com>
Date: Sun, 25 Aug 2013 18:37:54 +0400
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
X-Mailer: Apple Mail (2.1498)
Subject: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Sun, 25 Aug 2013 14:38:04 -0000
X-Groupsio-MsgNum: 43992
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_F557ECFA-BB60-4F43-8636-823099E589D4"

--Apple-Mail=_F557ECFA-BB60-4F43-8636-823099E589D4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,
       I have modified the default qemuarm.conf file, to switch it over =
to using ARM Cortex A9, with hard float, vfp and neon support, by =
applying the following patch (which basically includes the =
tune-cortexa9.inc file).

diff --git a/meta/conf/machine/qemuarm.conf =
b/meta/conf/machine/qemuarm.conf
index d07084b..2ec57d8 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -1,10 +1,9 @@
 #@TYPE: Machine
-#@NAME: arm_versatile_926ejs
-#@DESCRIPTION: arm_versatile_926ejs
+#@NAME: qemuarmhf
+#@DESCRIPTION: Machine configuration for QEMU ARM Cortex A9 hard float.
=20
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-arm926ejs.inc
-#require conf/machine/include/tune-arm1136jf-s.inc
+require conf/machine/include/tune-cortexa9.inc
=20
 KERNEL_IMAGETYPE =3D "zImage"

I find that the kernel panics upon boot.=20

Is it possible to have a QEMU build with support for hard float?=20

I need this, so that I can bootstrap a Ubuntu build from scratch, using =
a QEMU arm hard float machine, using a oe-core generated QEMU and =
toolchain. I don't want to use the default armel or armhf emulator and =
toolchain provided by debian, and want to build my own version of the =
emulator and toolchain, specifically optimized for a particular target =
machine.

I've attached a screenshot below.



Best regards,

Elvis Dowson



--Apple-Mail=_F557ECFA-BB60-4F43-8636-823099E589D4
Content-Type: multipart/related;
	type="text/html";
	boundary="Apple-Mail=_70F089C7-C77F-4837-8844-C7A71FE9C53C"

--Apple-Mail=_70F089C7-C77F-4837-8844-C7A71FE9C53C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
">Hi,<div>&nbsp; &nbsp; &nbsp; &nbsp;I have modified the default =
qemuarm.conf file, to switch it over to using ARM Cortex A9, with hard =
float, vfp and neon support, by applying the following patch (which =
basically includes the tune-cortexa9.inc =
file).</div><div><br></div><div><div>diff --git =
a/meta/conf/machine/qemuarm.conf =
b/meta/conf/machine/qemuarm.conf</div><div>index d07084b..2ec57d8 =
100644</div><div>--- a/meta/conf/machine/qemuarm.conf</div><div>+++ =
b/meta/conf/machine/qemuarm.conf</div><div>@@ -1,10 +1,9 =
@@</div><div>&nbsp;#@TYPE: Machine</div><div>-#@NAME: =
arm_versatile_926ejs</div><div>-#@DESCRIPTION: =
arm_versatile_926ejs</div><div>+#@NAME: =
qemuarmhf</div><div>+#@DESCRIPTION: Machine configuration for QEMU ARM =
Cortex A9 hard float.</div><div>&nbsp;</div><div>&nbsp;require =
conf/machine/include/qemu.inc</div><div>-require =
conf/machine/include/tune-arm926ejs.inc</div><div>-#require =
conf/machine/include/tune-arm1136jf-s.inc</div><div>+require =
conf/machine/include/tune-cortexa9.inc</div><div>&nbsp;</div><div>&nbsp;KE=
RNEL_IMAGETYPE =3D "zImage"</div></div><div><br></div><div>I find that =
the kernel panics upon boot.&nbsp;</div><div><br></div><div>Is it =
possible to have a QEMU build with support for hard =
float?&nbsp;</div><div><br></div><div>I need this, so that I can =
bootstrap a Ubuntu build from scratch, using a QEMU arm hard float =
machine, using a oe-core generated QEMU and toolchain. I don't want to =
use the default armel or armhf emulator and toolchain provided by =
debian, and want to build my own version of the emulator and toolchain, =
specifically optimized for a particular target =
machine.</div><div><br></div><div>I've attached a screenshot =
below.</div><div><br></div><div><img =
id=3D"9b9bcb7f-05a3-492f-a279-e2160f12fe2e" height=3D"480" width=3D"640" =
apple-width=3D"yes" apple-height=3D"yes" =
src=3D"cid:A948751C-C4A8-4F86-8F08-F6FFA455B230@du.ae"></div><div><br></di=
v><div>Best regards,</div><div><br></div><div>Elvis =
Dowson</div><div><br></div><div><br></div></body></html>=

--Apple-Mail=_70F089C7-C77F-4837-8844-C7A71FE9C53C
Content-Transfer-Encoding: base64
Content-Disposition: inline;
	filename="qemuarm kernel panic with hard float.png"
Content-Type: image/png;
	x-unix-mode=0664;
	name="qemuarm kernel panic with hard float.png"
Content-Id: <A948751C-C4A8-4F86-8F08-F6FFA455B230@du.ae>

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
AAAA4Bv5H5YsrTbTDWDFAAAAAElFTkSuQmCC

--Apple-Mail=_70F089C7-C77F-4837-8844-C7A71FE9C53C--

--Apple-Mail=_F557ECFA-BB60-4F43-8636-823099E589D4--
