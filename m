Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CE535610F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 10:07:58 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XIEQR-0007di-Bs from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Aug 2014 03:07:59 -0700
Received: from SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 15 Aug 2014 03:07:59 -0700
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.3]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.02.0247.003; Fri, 15 Aug 2014 11:07:58 +0100
From: "Khan, Yasir" <Yasir_Khan@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] bluez5: Allow method calls over dbus for bluetooth daemon
Thread-Index: AQHPsKBpbzR/5wqtqk6Ckdoa0+3Yi5vRf/12
Date: Fri, 15 Aug 2014 10:07:57 +0000
Message-ID: <428317DA8188854B9B82598D29DA15E24E0E76F9@EU-MBX-02.mgc.mentorg.com>
References: <1407238076-60915-1-git-send-email-yasir_khan@mentor.com>
In-Reply-To: <1407238076-60915-1-git-send-email-yasir_khan@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
X-OriginalArrivalTime: 15 Aug 2014 10:07:59.0206 (UTC)
	FILETIME=[CA9B5860:01CFB870]
Subject: Re: [PATCH] bluez5: Allow method calls over dbus for bluetooth daemon
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
X-List-Received-Date: Fri, 15 Aug 2014 10:08:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,=0A=
=0A=
Any response on this ?=0A=
=0A=
Regards=0A=
Yasir=0A=
________________________________________=0A=
From: Khan, Yasir=0A=
Sent: Tuesday, August 05, 2014 4:27 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Cc: Khan, Yasir=0A=
Subject: [PATCH] bluez5: Allow method calls over dbus for bluetooth daemon=
=0A=
=0A=
From: Yasir-Khan <yasir_khan@mentor.com>=0A=
=0A=
This patch changes the dbus policy settings in order to allow=0A=
calling methods over dbus. bluez5 and pulseaudio rely on this=0A=
mechanism to configure media end points. Previously bluetoothd=0A=
was failing to configure the media end points with error=0A=
org.freedesktop.DBus.Error.AccessDenied, due to which bluetooth=0A=
headset and smartphone were unable to connect in A2DP mode.=0A=
=0A=
Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>=0A=
---=0A=
 .../bluez5/bluez5/bluetooth.conf                   |    1 +=0A=
 1 file changed, 1 insertion(+)=0A=
=0A=
diff --git a/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf b/meta/=
recipes-connectivity/bluez5/bluez5/bluetooth.conf=0A=
index e21e72e..26845bb 100644=0A=
--- a/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf=0A=
+++ b/meta/recipes-connectivity/bluez5/bluez5/bluetooth.conf=0A=
@@ -11,6 +11,7 @@=0A=
     <allow own=3D"org.bluez"/>=0A=
     <allow send_destination=3D"org.bluez"/>=0A=
     <allow send_interface=3D"org.bluez.Agent1"/>=0A=
+    <allow send_type=3D"method_call"/>=0A=
   </policy>=0A=
=0A=
 </busconfig>=0A=
--=0A=
1.7.9.5=0A=
=0A=

