Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SUj8j-0001U6-Rs
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 20:40:02 +0200
Received: from mail143-ch1-R.bigfish.com (10.43.68.233) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.23; Wed, 16 May 2012 18:29:53 +0000
Received: from mail143-ch1 (localhost [127.0.0.1])	by
	mail143-ch1-R.bigfish.com (Postfix) with ESMTP id 0096F4C0238	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 18:29:53 +0000 (UTC)
X-SpamScore: -9
X-BigFish: VS-9(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail143-ch1 (localhost.localdomain [127.0.0.1]) by mail143-ch1
	(MessageSwitch) id 1337192990610934_623;
	Wed, 16 May 2012 18:29:50 +0000 (UTC)
Received: from CH1EHSMHS021.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.238])	by mail143-ch1.bigfish.com (Postfix) with ESMTP id
	914D038005C	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 18:29:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS021.bigfish.com
	(10.43.70.21) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 16 May 2012 18:29:49 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.151]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0298.005; Wed, 16 May 2012 13:29:55 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] Fix X server on PowerPC when built with
	GCC 4.7.x
Thread-Index: AQHNM5HjyVomt9ccUEaaFRuS3qvevQ==
Date: Wed, 16 May 2012 18:29:54 +0000
Message-ID: <CAEsOVNc1rANV_mYhsBm5u0CJjiryXB=9Lo30b4uSYgAbGiG0MA@mail.gmail.com>
References: <1337191928-4807-1-git-send-email-gary@mlbassoc.com>
In-Reply-To: <1337191928-4807-1-git-send-email-gary@mlbassoc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2] Fix X server on PowerPC when built with GCC 4.7.x
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 16 May 2012 18:40:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E11B2DA4487F4A46BAEF02AF6A5BE482@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Gary,

I'm curious what did you test this on?

-M

On Wed, May 16, 2012 at 1:12 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> Incorporate patch from upstream:
> =A0http://cgit.freedesktop.org/xorg/xserver/patch/Xext/xace.c?id=3D6dae7f=
3792611aace1df0cca63bf50c50d93de43
> =A0Subject: xace: Invalid reference to out-of-scope data.
> ---
> =A0.../fix-bogus-stack-variables.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0231 ++++++++++++++++++++
> =A0.../xorg-xserver/xserver-kdrive_1.7.99.2.bb =A0 =A0 =A0 =A0| =A0 =A03 =
+-
> =A02 files changed, 233 insertions(+), 1 deletions(-)
> =A0create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1=
.7.99.2/fix-bogus-stack-variables.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/f=
ix-bogus-stack-variables.patch b/meta/recipes-graphics/xorg-xserver/xserver=
-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
> new file mode 100644
> index 0000000..d900fc3
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogu=
s-stack-variables.patch
> @@ -0,0 +1,231 @@
> +From 6dae7f3792611aace1df0cca63bf50c50d93de43 Mon Sep 17 00:00:00 2001
> +From: Chris Wilson <chris@chris-wilson.co.uk>
> +Date: Tue, 10 Aug 2010 18:30:20 +0000
> +Subject: xace: Invalid reference to out-of-scope data.
> +
> +The callback data passed by reference to the hook was allocated on stack
> +within the scope of the case statement. The compiler is free to reuse
> +any of that stack space whilst making the function call so we may end up
> +passing garbage into the callback.
> +
> +References:
> +
> + =A0Bug 18451 - Xorg server 1.5.2 SEGV during XFixesGetCursorImage()
> + =A0https://bugs.freedesktop.org/show_bug.cgi?id=3D18451
> +
> +v2: Drop the unrelated hunk that snuck in when ammending the commit
> +message.
> +
> +Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> +Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
> +Signed-off-by: Keith Packard <keithp@keithp.com>
> +---
> +(limited to 'Xext/xace.c')
> +
> +diff --git a/Xext/xace.c b/Xext/xace.c
> +index e10d837..c757cad 100644
> +--- a/Xext/xace.c
> ++++ b/Xext/xace.c
> +@@ -87,7 +87,18 @@ void XaceHookAuditEnd(ClientPtr ptr, int result)
> + =A0*/
> + int XaceHook(int hook, ...)
> + {
> +- =A0 =A0pointer calldata; /* data passed to callback */
> ++ =A0 =A0union {
> ++ =A0 =A0 =A0XaceResourceAccessRec res;
> ++ =A0 =A0 =A0XaceDeviceAccessRec dev;
> ++ =A0 =A0 =A0XaceSendAccessRec send;
> ++ =A0 =A0 =A0XaceReceiveAccessRec recv;
> ++ =A0 =A0 =A0XaceClientAccessRec client;
> ++ =A0 =A0 =A0XaceExtAccessRec ext;
> ++ =A0 =A0 =A0XaceServerAccessRec server;
> ++ =A0 =A0 =A0XaceScreenAccessRec screen;
> ++ =A0 =A0 =A0XaceAuthAvailRec auth;
> ++ =A0 =A0 =A0XaceKeyAvailRec key;
> ++ =A0 =A0} u;
> + =A0 =A0 int *prv =3D NULL; =A0/* points to return value from callback *=
/
> + =A0 =A0 va_list ap; =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* argument list */
> + =A0 =A0 va_start(ap, hook);
> +@@ -99,117 +110,86 @@ int XaceHook(int hook, ...)
> + =A0 =A0 =A0*/
> + =A0 =A0 switch (hook)
> + =A0 =A0 {
> +- =A0 =A0 =A0case XACE_RESOURCE_ACCESS: {
> +- =A0 =A0 =A0 =A0 =A0XaceResourceAccessRec rec;
> +- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.id =3D va_arg(ap, XID);
> +- =A0 =A0 =A0 =A0 =A0rec.rtype =3D va_arg(ap, RESTYPE);
> +- =A0 =A0 =A0 =A0 =A0rec.res =3D va_arg(ap, pointer);
> +- =A0 =A0 =A0 =A0 =A0rec.ptype =3D va_arg(ap, RESTYPE);
> +- =A0 =A0 =A0 =A0 =A0rec.parent =3D va_arg(ap, pointer);
> +- =A0 =A0 =A0 =A0 =A0rec.access_mode =3D va_arg(ap, Mask);
> +- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */
> +- =A0 =A0 =A0 =A0 =A0calldata =3D &rec;
> +- =A0 =A0 =A0 =A0 =A0prv =3D &rec.status;
> ++ =A0 =A0 =A0case XACE_RESOURCE_ACCESS:
> ++ =A0 =A0 =A0 =A0 =A0u.res.client =3D va_arg(ap, ClientPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.res.id =3D va_arg(ap, XID);
> ++ =A0 =A0 =A0 =A0 =A0u.res.rtype =3D va_arg(ap, RESTYPE);
> ++ =A0 =A0 =A0 =A0 =A0u.res.res =3D va_arg(ap, pointer);
> ++ =A0 =A0 =A0 =A0 =A0u.res.ptype =3D va_arg(ap, RESTYPE);
> ++ =A0 =A0 =A0 =A0 =A0u.res.parent =3D va_arg(ap, pointer);
> ++ =A0 =A0 =A0 =A0 =A0u.res.access_mode =3D va_arg(ap, Mask);
> ++ =A0 =A0 =A0 =A0 =A0u.res.status =3D Success; /* default allow */
> ++ =A0 =A0 =A0 =A0 =A0prv =3D &u.res.status;
> + =A0 =A0 =A0 =A0 =A0 break;
> +- =A0 =A0 =A0}
> +- =A0 =A0 =A0case XACE_DEVICE_ACCESS: {
> +- =A0 =A0 =A0 =A0 =A0XaceDeviceAccessRec rec;
> +- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.dev =3D va_arg(ap, DeviceIntPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.access_mode =3D va_arg(ap, Mask);
> +- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */
> +- =A0 =A0 =A0 =A0 =A0calldata =3D &rec;
> +- =A0 =A0 =A0 =A0 =A0prv =3D &rec.status;
> ++ =A0 =A0 =A0case XACE_DEVICE_ACCESS:
> ++ =A0 =A0 =A0 =A0 =A0u.dev.client =3D va_arg(ap, ClientPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.dev.dev =3D va_arg(ap, DeviceIntPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.dev.access_mode =3D va_arg(ap, Mask);
> ++ =A0 =A0 =A0 =A0 =A0u.dev.status =3D Success; /* default allow */
> ++ =A0 =A0 =A0 =A0 =A0prv =3D &u.dev.status;
> + =A0 =A0 =A0 =A0 =A0 break;
> +- =A0 =A0 =A0}
> +- =A0 =A0 =A0case XACE_SEND_ACCESS: {
> +- =A0 =A0 =A0 =A0 =A0XaceSendAccessRec rec;
> +- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.dev =3D va_arg(ap, DeviceIntPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.pWin =3D va_arg(ap, WindowPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.events =3D va_arg(ap, xEventPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.count =3D va_arg(ap, int);
> +- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */
> +- =A0 =A0 =A0 =A0 =A0calldata =3D &rec;
> +- =A0 =A0 =A0 =A0 =A0prv =3D &rec.status;
> ++ =A0 =A0 =A0case XACE_SEND_ACCESS:
> ++ =A0 =A0 =A0 =A0 =A0u.send.client =3D va_arg(ap, ClientPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.send.dev =3D va_arg(ap, DeviceIntPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.send.pWin =3D va_arg(ap, WindowPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.send.events =3D va_arg(ap, xEventPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.send.count =3D va_arg(ap, int);
> ++ =A0 =A0 =A0 =A0 =A0u.send.status =3D Success; /* default allow */
> ++ =A0 =A0 =A0 =A0 =A0prv =3D &u.send.status;
> + =A0 =A0 =A0 =A0 =A0 break;
> +- =A0 =A0 =A0}
> +- =A0 =A0 =A0case XACE_RECEIVE_ACCESS: {
> +- =A0 =A0 =A0 =A0 =A0XaceReceiveAccessRec rec;
> +- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.pWin =3D va_arg(ap, WindowPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.events =3D va_arg(ap, xEventPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.count =3D va_arg(ap, int);
> +- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */
> +- =A0 =A0 =A0 =A0 =A0calldata =3D &rec;
> +- =A0 =A0 =A0 =A0 =A0prv =3D &rec.status;
> ++ =A0 =A0 =A0case XACE_RECEIVE_ACCESS:
> ++ =A0 =A0 =A0 =A0 =A0u.recv.client =3D va_arg(ap, ClientPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.recv.pWin =3D va_arg(ap, WindowPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.recv.events =3D va_arg(ap, xEventPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.recv.count =3D va_arg(ap, int);
> ++ =A0 =A0 =A0 =A0 =A0u.recv.status =3D Success; /* default allow */
> ++ =A0 =A0 =A0 =A0 =A0prv =3D &u.recv.status;
> + =A0 =A0 =A0 =A0 =A0 break;
> +- =A0 =A0 =A0}
> +- =A0 =A0 =A0case XACE_CLIENT_ACCESS: {
> +- =A0 =A0 =A0 =A0 =A0XaceClientAccessRec rec;
> +- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.target =3D va_arg(ap, ClientPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.access_mode =3D va_arg(ap, Mask);
> +- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */
> +- =A0 =A0 =A0 =A0 =A0calldata =3D &rec;
> +- =A0 =A0 =A0 =A0 =A0prv =3D &rec.status;
> ++ =A0 =A0 =A0case XACE_CLIENT_ACCESS:
> ++ =A0 =A0 =A0 =A0 =A0u.client.client =3D va_arg(ap, ClientPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.client.target =3D va_arg(ap, ClientPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.client.access_mode =3D va_arg(ap, Mask);
> ++ =A0 =A0 =A0 =A0 =A0u.client.status =3D Success; /* default allow */
> ++ =A0 =A0 =A0 =A0 =A0prv =3D &u.client.status;
> + =A0 =A0 =A0 =A0 =A0 break;
> +- =A0 =A0 =A0}
> +- =A0 =A0 =A0case XACE_EXT_ACCESS: {
> +- =A0 =A0 =A0 =A0 =A0XaceExtAccessRec rec;
> +- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.ext =3D va_arg(ap, ExtensionEntry*);
> +- =A0 =A0 =A0 =A0 =A0rec.access_mode =3D DixGetAttrAccess;
> +- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */
> +- =A0 =A0 =A0 =A0 =A0calldata =3D &rec;
> +- =A0 =A0 =A0 =A0 =A0prv =3D &rec.status;
> ++ =A0 =A0 =A0case XACE_EXT_ACCESS:
> ++ =A0 =A0 =A0 =A0 =A0u.ext.client =3D va_arg(ap, ClientPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.ext.ext =3D va_arg(ap, ExtensionEntry*);
> ++ =A0 =A0 =A0 =A0 =A0u.ext.access_mode =3D DixGetAttrAccess;
> ++ =A0 =A0 =A0 =A0 =A0u.ext.status =3D Success; /* default allow */
> ++ =A0 =A0 =A0 =A0 =A0prv =3D &u.ext.status;
> + =A0 =A0 =A0 =A0 =A0 break;
> +- =A0 =A0 =A0}
> +- =A0 =A0 =A0case XACE_SERVER_ACCESS: {
> +- =A0 =A0 =A0 =A0 =A0XaceServerAccessRec rec;
> +- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.access_mode =3D va_arg(ap, Mask);
> +- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */
> +- =A0 =A0 =A0 =A0 =A0calldata =3D &rec;
> +- =A0 =A0 =A0 =A0 =A0prv =3D &rec.status;
> ++ =A0 =A0 =A0case XACE_SERVER_ACCESS:
> ++ =A0 =A0 =A0 =A0 =A0u.server.client =3D va_arg(ap, ClientPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.server.access_mode =3D va_arg(ap, Mask);
> ++ =A0 =A0 =A0 =A0 =A0u.server.status =3D Success; /* default allow */
> ++ =A0 =A0 =A0 =A0 =A0prv =3D &u.server.status;
> + =A0 =A0 =A0 =A0 =A0 break;
> +- =A0 =A0 =A0}
> + =A0 =A0 =A0 case XACE_SCREEN_ACCESS:
> +- =A0 =A0 =A0case XACE_SCREENSAVER_ACCESS: {
> +- =A0 =A0 =A0 =A0 =A0XaceScreenAccessRec rec;
> +- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.screen =3D va_arg(ap, ScreenPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.access_mode =3D va_arg(ap, Mask);
> +- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */
> +- =A0 =A0 =A0 =A0 =A0calldata =3D &rec;
> +- =A0 =A0 =A0 =A0 =A0prv =3D &rec.status;
> ++ =A0 =A0 =A0case XACE_SCREENSAVER_ACCESS:
> ++ =A0 =A0 =A0 =A0 =A0u.screen.client =3D va_arg(ap, ClientPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.screen.screen =3D va_arg(ap, ScreenPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.screen.access_mode =3D va_arg(ap, Mask);
> ++ =A0 =A0 =A0 =A0 =A0u.screen.status =3D Success; /* default allow */
> ++ =A0 =A0 =A0 =A0 =A0prv =3D &u.screen.status;
> + =A0 =A0 =A0 =A0 =A0 break;
> +- =A0 =A0 =A0}
> +- =A0 =A0 =A0case XACE_AUTH_AVAIL: {
> +- =A0 =A0 =A0 =A0 =A0XaceAuthAvailRec rec;
> +- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.authId =3D va_arg(ap, XID);
> +- =A0 =A0 =A0 =A0 =A0calldata =3D &rec;
> ++ =A0 =A0 =A0case XACE_AUTH_AVAIL:
> ++ =A0 =A0 =A0 =A0 =A0u.auth.client =3D va_arg(ap, ClientPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.auth.authId =3D va_arg(ap, XID);
> + =A0 =A0 =A0 =A0 =A0 break;
> +- =A0 =A0 =A0}
> +- =A0 =A0 =A0case XACE_KEY_AVAIL: {
> +- =A0 =A0 =A0 =A0 =A0XaceKeyAvailRec rec;
> +- =A0 =A0 =A0 =A0 =A0rec.event =3D va_arg(ap, xEventPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.keybd =3D va_arg(ap, DeviceIntPtr);
> +- =A0 =A0 =A0 =A0 =A0rec.count =3D va_arg(ap, int);
> +- =A0 =A0 =A0 =A0 =A0calldata =3D &rec;
> ++ =A0 =A0 =A0case XACE_KEY_AVAIL:
> ++ =A0 =A0 =A0 =A0 =A0u.key.event =3D va_arg(ap, xEventPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.key.keybd =3D va_arg(ap, DeviceIntPtr);
> ++ =A0 =A0 =A0 =A0 =A0u.key.count =3D va_arg(ap, int);
> + =A0 =A0 =A0 =A0 =A0 break;
> +- =A0 =A0 =A0}
> +- =A0 =A0 =A0default: {
> ++ =A0 =A0 =A0default:
> + =A0 =A0 =A0 =A0 =A0 va_end(ap);
> + =A0 =A0 =A0 =A0 =A0 return 0; =A0 /* unimplemented hook number */
> +- =A0 =A0 =A0}
> + =A0 =A0 }
> + =A0 =A0 va_end(ap);
> +
> + =A0 =A0 /* call callbacks and return result, if any. */
> +- =A0 =A0CallCallbacks(&XaceHooks[hook], calldata);
> ++ =A0 =A0CallCallbacks(&XaceHooks[hook], &u);
> + =A0 =A0 return prv ? *prv : Success;
> + }
> +
> +--
> +cgit v0.9.0.2-2-gbebe
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.b=
b b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> index 360a0f3..d90dc25 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
> @@ -7,7 +7,7 @@ RDEPENDS_${PN} +=3D "xkeyboard-config"
> =A0EXTRA_OECONF +=3D "--disable-glx"
>
> =A0PE =3D "1"
> -PR =3D "r29"
> +PR =3D "r30"
>
> =A0SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.b=
z2 \
> =A0 =A0 =A0 =A0file://extra-kmodes.patch \
> @@ -20,6 +20,7 @@ SRC_URI =3D "${XORG_MIRROR}/individual/xserver/xorg-ser=
ver-${PV}.tar.bz2 \
> =A0 =A0 =A0 =A0file://fix-newer-xorg-headers.patch \
> =A0 =A0 =A0 =A0file://crosscompile.patch \
> =A0 =A0 =A0 =A0file://error-address-work-around.patch \
> + =A0 =A0 =A0 =A0file://fix-bogus-stack-variables.patch \
> =A0 =A0 =A0 =A0file://nodolt.patch"
> =A0# =A0 =A0 =A0file://kdrive-evdev.patch
> =A0# =A0 =A0 =A0file://kdrive-use-evdev.patch
> --
> 1.7.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



