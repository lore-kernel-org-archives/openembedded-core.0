Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7274B7680A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 06:46:54 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aoQBy-0007Do-S1 from Awais_Belal@mentor.com ;
	Thu, 07 Apr 2016 23:46:55 -0700
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.95]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.03.0224.002; Fri, 8 Apr 2016 07:46:53 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>
Thread-Topic: [OE-core] [master][jethro][PATCH] systemd-serialgetty: allow
	baud	rate overriding
Thread-Index: AQHRimeTsHlP4iQNi0KfYNcsxP58q59/r1gw
Date: Fri, 8 Apr 2016 06:46:52 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FBAA156@EU-MBX-03.mgc.mentorg.com>
References: <1459330515-11129-1-git-send-email-awais_belal@mentor.com>
In-Reply-To: <1459330515-11129-1-git-send-email-awais_belal@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][jethro][PATCH] systemd-serialgetty: allow baud	rate overriding
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
X-List-Received-Date: Fri, 08 Apr 2016 06:46:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Robert,=0A=
=0A=
Seems like you are the maintainer for jethro, this went in to master but I =
do not see it applied to jethro yet.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
Sent: Wednesday, March 30, 2016 2:35 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [master][jethro][PATCH] systemd-serialgetty: allow baud =
     rate overriding=0A=
=0A=
In case a getty is required on a UART which is not being=0A=
used as the kernel console, the current agetty invocation=0A=
fails to obey the baud rate configured through the=0A=
SERIAL_CONSOLES variable because it uses --keep-baud.=0A=
=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service | 2 +-=
=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.se=
rvice b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service=
=0A=
index 182167b..e8b027e 100644=0A=
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service=
=0A=
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service=
=0A=
@@ -21,7 +21,7 @@ IgnoreOnIsolate=3Dyes=0A=
=0A=
 [Service]=0A=
 Environment=3D"TERM=3Dxterm"=0A=
-ExecStart=3D-/sbin/agetty -8 -L --keep-baud %I @BAUDRATE@ $TERM=0A=
+ExecStart=3D-/sbin/agetty -8 -L %I @BAUDRATE@ $TERM=0A=
 Type=3Didle=0A=
 Restart=3Dalways=0A=
 RestartSec=3D0=0A=
--=0A=
1.9.1=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

