Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SVOGz-0000x9-RF
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 16:35:18 +0200
Received: by yhjj56 with SMTP id j56so3099126yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 07:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=qpMoSmOS/zgQlM/x6L8BVzDOtoJnBZzRfMlEEvRhUuo=;
	b=Ufss5SJ3ReHaSQFvr1/Kbk+AvMJbSUhufcZQhZNv5kJe8q0mz3kbCmGYYjnnad4JNp
	c1m8AaVtTXSt5xNJ17jUpPGkowi45haZt7AXfvJ3TqB2TiLLB8DWNwmttPZ+ETBFbIK2
	XZy1yrI8CftRa1BmHO36pYKsoXO0C9VkOnuEAB6lUGTRszKVOu7trDjntjImOKyS2o9d
	KY9BnSTShKdQuzISv3jouDGIZPtUayaypEtuU2YlHUa6OuWiy5SVFWZJmmPRmhJyPaIn
	doo+iYdcKFu8RfzWlktcRf+1SNA/aHahOv3pwb54Vjb85ouELvKskRrKgiowYRpMAuG/
	LFtw==
Received: by 10.42.89.8 with SMTP id e8mr1746378icm.50.1337351112515; Fri, 18
	May 2012 07:25:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.25.18 with HTTP; Fri, 18 May 2012 07:24:52 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <4FB659C3.8030503@mlbassoc.com>
References: <1337203583-27729-1-git-send-email-gary@mlbassoc.com>
	<4FB659C3.8030503@mlbassoc.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 18 May 2012 17:24:52 +0300
Message-ID: <CAK18fxEHyDZGeXWstwEW8nFrcf9zEU=dXwEOzjrr2484tvST3A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl6NvbxvhYdsl8c8bsaepC0BIK9wA8G3CAiFCMK3T79vMCJQ+Ve5/mVXc2zgZHWlN7QWHUZ
Subject: Re: [PATCH v4] xserver-kdrive: Fix X server on PowerPC when built with GCC 4.7.x
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
X-List-Received-Date: Fri, 18 May 2012 14:35:18 -0000
Content-Type: multipart/alternative; boundary=90e6ba614d1200623404c05052dd

--90e6ba614d1200623404c05052dd
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 18, 2012 at 5:16 PM, Gary Thomas <gary@mlbassoc.com> wrote:

> On 2012-05-16 15:26, Gary Thomas wrote:
>
>> Newer versions of GCC uncovered illegal code practice which can cause
>> runtime failures in the Xext/xace.c code.  This problem has been fixed
>> upstream:
>>   http://cgit.freedesktop.org/**xorg/xserver/patch/Xext/xace.**c?id=**
>> 6dae7f3792611aace1df0cca63bf50**c50d93de43<http://cgit.freedesktop.org/xorg/xserver/patch/Xext/xace.c?id=6dae7f3792611aace1df0cca63bf50c50d93de43>
>>   Subject: xace: Invalid reference to out-of-scope data.
>>
>> Incorporate this patch into the recipe, with a PR bump.
>>
>> Signed-off-by: Gary Thomas<gary@mlbassoc.com>
>>
>
> Ping?
>

Double ping.


>  ---
>>  .../fix-bogus-stack-variables.**patch                |  231
>> ++++++++++++++++++++
>>  .../xorg-xserver/xserver-**kdrive_1.7.99.2.bb<http://xserver-kdrive_1.7.99.2.bb>       |    3 +-
>>  2 files changed, 233 insertions(+), 1 deletions(-)
>>  create mode 100644 meta/recipes-graphics/xorg-**
>> xserver/xserver-kdrive-1.7.99.**2/fix-bogus-stack-variables.**patch
>>
>> diff --git a/meta/recipes-graphics/xorg-**xserver/xserver-kdrive-1.7.99.*
>> *2/fix-bogus-stack-variables.**patch b/meta/recipes-graphics/xorg-**
>> xserver/xserver-kdrive-1.7.99.**2/fix-bogus-stack-variables.**patch
>> new file mode 100644
>> index 0000000..d900fc3
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-**xserver/xserver-kdrive-1.7.99.**
>> 2/fix-bogus-stack-variables.**patch
>> @@ -0,0 +1,233 @@
>> +From 6dae7f3792611aace1df0cca63bf50**c50d93de43 Mon Sep 17 00:00:00 2001
>> +From: Chris Wilson<chris@chris-wilson.co.**uk <chris@chris-wilson.co.uk>
>> >
>> +Date: Tue, 10 Aug 2010 18:30:20 +0000
>> +Subject: xace: Invalid reference to out-of-scope data.
>> +
>> +The callback data passed by reference to the hook was allocated on stack
>> +within the scope of the case statement. The compiler is free to reuse
>> +any of that stack space whilst making the function call so we may end up
>> +passing garbage into the callback.
>> +
>> +References:
>> +
>> +  Bug 18451 - Xorg server 1.5.2 SEGV during XFixesGetCursorImage()
>> +  https://bugs.freedesktop.org/**show_bug.cgi?id=18451<https://bugs.freedesktop.org/show_bug.cgi?id=18451>
>> +
>> +v2: Drop the unrelated hunk that snuck in when ammending the commit
>> +message.
>> +
>> +Signed-off-by: Chris Wilson<chris@chris-wilson.co.**uk<chris@chris-wilson.co.uk>
>> >
>> +Reviewed-by: Alan Coopersmith<alan.coopersmith@**oracle.com<alan.coopersmith@oracle.com>
>> >
>> +Signed-off-by: Keith Packard<keithp@keithp.com>
>> +
>> +Upstream-Status: accepted
>> +---
>> +(limited to 'Xext/xace.c')
>> +
>> +diff --git a/Xext/xace.c b/Xext/xace.c
>> +index e10d837..c757cad 100644
>> +--- a/Xext/xace.c
>> ++++ b/Xext/xace.c
>> +@@ -87,7 +87,18 @@ void XaceHookAuditEnd(ClientPtr ptr, int result)
>> +  */
>> + int XaceHook(int hook, ...)
>> + {
>> +-    pointer calldata; /* data passed to callback */
>> ++    union {
>> ++      XaceResourceAccessRec res;
>> ++      XaceDeviceAccessRec dev;
>> ++      XaceSendAccessRec send;
>> ++      XaceReceiveAccessRec recv;
>> ++      XaceClientAccessRec client;
>> ++      XaceExtAccessRec ext;
>> ++      XaceServerAccessRec server;
>> ++      XaceScreenAccessRec screen;
>> ++      XaceAuthAvailRec auth;
>> ++      XaceKeyAvailRec key;
>> ++    } u;
>> +     int *prv = NULL;  /* points to return value from callback */
>> +     va_list ap;               /* argument list */
>> +     va_start(ap, hook);
>> +@@ -99,117 +110,86 @@ int XaceHook(int hook, ...)
>> +      */
>> +     switch (hook)
>> +     {
>> +-      case XACE_RESOURCE_ACCESS: {
>> +-          XaceResourceAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.id = va_arg(ap, XID);
>> +-          rec.rtype = va_arg(ap, RESTYPE);
>> +-          rec.res = va_arg(ap, pointer);
>> +-          rec.ptype = va_arg(ap, RESTYPE);
>> +-          rec.parent = va_arg(ap, pointer);
>> +-          rec.access_mode = va_arg(ap, Mask);
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_RESOURCE_ACCESS:
>> ++          u.res.client = va_arg(ap, ClientPtr);
>> ++          u.res.id = va_arg(ap, XID);
>> ++          u.res.rtype = va_arg(ap, RESTYPE);
>> ++          u.res.res = va_arg(ap, pointer);
>> ++          u.res.ptype = va_arg(ap, RESTYPE);
>> ++          u.res.parent = va_arg(ap, pointer);
>> ++          u.res.access_mode = va_arg(ap, Mask);
>> ++          u.res.status = Success; /* default allow */
>> ++          prv =&u.res.status;
>> +           break;
>> +-      }
>> +-      case XACE_DEVICE_ACCESS: {
>> +-          XaceDeviceAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.dev = va_arg(ap, DeviceIntPtr);
>> +-          rec.access_mode = va_arg(ap, Mask);
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_DEVICE_ACCESS:
>> ++          u.dev.client = va_arg(ap, ClientPtr);
>> ++          u.dev.dev = va_arg(ap, DeviceIntPtr);
>> ++          u.dev.access_mode = va_arg(ap, Mask);
>> ++          u.dev.status = Success; /* default allow */
>> ++          prv =&u.dev.status;
>> +           break;
>> +-      }
>> +-      case XACE_SEND_ACCESS: {
>> +-          XaceSendAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.dev = va_arg(ap, DeviceIntPtr);
>> +-          rec.pWin = va_arg(ap, WindowPtr);
>> +-          rec.events = va_arg(ap, xEventPtr);
>> +-          rec.count = va_arg(ap, int);
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_SEND_ACCESS:
>> ++          u.send.client = va_arg(ap, ClientPtr);
>> ++          u.send.dev = va_arg(ap, DeviceIntPtr);
>> ++          u.send.pWin = va_arg(ap, WindowPtr);
>> ++          u.send.events = va_arg(ap, xEventPtr);
>> ++          u.send.count = va_arg(ap, int);
>> ++          u.send.status = Success; /* default allow */
>> ++          prv =&u.send.status;
>> +           break;
>> +-      }
>> +-      case XACE_RECEIVE_ACCESS: {
>> +-          XaceReceiveAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.pWin = va_arg(ap, WindowPtr);
>> +-          rec.events = va_arg(ap, xEventPtr);
>> +-          rec.count = va_arg(ap, int);
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_RECEIVE_ACCESS:
>> ++          u.recv.client = va_arg(ap, ClientPtr);
>> ++          u.recv.pWin = va_arg(ap, WindowPtr);
>> ++          u.recv.events = va_arg(ap, xEventPtr);
>> ++          u.recv.count = va_arg(ap, int);
>> ++          u.recv.status = Success; /* default allow */
>> ++          prv =&u.recv.status;
>> +           break;
>> +-      }
>> +-      case XACE_CLIENT_ACCESS: {
>> +-          XaceClientAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.target = va_arg(ap, ClientPtr);
>> +-          rec.access_mode = va_arg(ap, Mask);
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_CLIENT_ACCESS:
>> ++          u.client.client = va_arg(ap, ClientPtr);
>> ++          u.client.target = va_arg(ap, ClientPtr);
>> ++          u.client.access_mode = va_arg(ap, Mask);
>> ++          u.client.status = Success; /* default allow */
>> ++          prv =&u.client.status;
>> +           break;
>> +-      }
>> +-      case XACE_EXT_ACCESS: {
>> +-          XaceExtAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.ext = va_arg(ap, ExtensionEntry*);
>> +-          rec.access_mode = DixGetAttrAccess;
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_EXT_ACCESS:
>> ++          u.ext.client = va_arg(ap, ClientPtr);
>> ++          u.ext.ext = va_arg(ap, ExtensionEntry*);
>> ++          u.ext.access_mode = DixGetAttrAccess;
>> ++          u.ext.status = Success; /* default allow */
>> ++          prv =&u.ext.status;
>> +           break;
>> +-      }
>> +-      case XACE_SERVER_ACCESS: {
>> +-          XaceServerAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.access_mode = va_arg(ap, Mask);
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_SERVER_ACCESS:
>> ++          u.server.client = va_arg(ap, ClientPtr);
>> ++          u.server.access_mode = va_arg(ap, Mask);
>> ++          u.server.status = Success; /* default allow */
>> ++          prv =&u.server.status;
>> +           break;
>> +-      }
>> +       case XACE_SCREEN_ACCESS:
>> +-      case XACE_SCREENSAVER_ACCESS: {
>> +-          XaceScreenAccessRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.screen = va_arg(ap, ScreenPtr);
>> +-          rec.access_mode = va_arg(ap, Mask);
>> +-          rec.status = Success; /* default allow */
>> +-          calldata =&rec;
>> +-          prv =&rec.status;
>> ++      case XACE_SCREENSAVER_ACCESS:
>> ++          u.screen.client = va_arg(ap, ClientPtr);
>> ++          u.screen.screen = va_arg(ap, ScreenPtr);
>> ++          u.screen.access_mode = va_arg(ap, Mask);
>> ++          u.screen.status = Success; /* default allow */
>> ++          prv =&u.screen.status;
>> +           break;
>> +-      }
>> +-      case XACE_AUTH_AVAIL: {
>> +-          XaceAuthAvailRec rec;
>> +-          rec.client = va_arg(ap, ClientPtr);
>> +-          rec.authId = va_arg(ap, XID);
>> +-          calldata =&rec;
>> ++      case XACE_AUTH_AVAIL:
>> ++          u.auth.client = va_arg(ap, ClientPtr);
>> ++          u.auth.authId = va_arg(ap, XID);
>> +           break;
>> +-      }
>> +-      case XACE_KEY_AVAIL: {
>> +-          XaceKeyAvailRec rec;
>> +-          rec.event = va_arg(ap, xEventPtr);
>> +-          rec.keybd = va_arg(ap, DeviceIntPtr);
>> +-          rec.count = va_arg(ap, int);
>> +-          calldata =&rec;
>> ++      case XACE_KEY_AVAIL:
>> ++          u.key.event = va_arg(ap, xEventPtr);
>> ++          u.key.keybd = va_arg(ap, DeviceIntPtr);
>> ++          u.key.count = va_arg(ap, int);
>> +           break;
>> +-      }
>> +-      default: {
>> ++      default:
>> +           va_end(ap);
>> +           return 0;   /* unimplemented hook number */
>> +-      }
>> +     }
>> +     va_end(ap);
>> +
>> +     /* call callbacks and return result, if any. */
>> +-    CallCallbacks(&XaceHooks[hook]**, calldata);
>> ++    CallCallbacks(&XaceHooks[hook]**,&u);
>> +     return prv ? *prv : Success;
>> + }
>> +
>> +--
>> +cgit v0.9.0.2-2-gbebe
>> diff --git a/meta/recipes-graphics/xorg-**xserver/xserver-kdrive_1.7.99.*
>> *2.bb <http://xserver-kdrive_1.7.99.2.bb> b/meta/recipes-graphics/xorg-**
>> xserver/xserver-kdrive_1.7.99.**2.bb <http://xserver-kdrive_1.7.99.2.bb>
>> index 360a0f3..d90dc25 100644
>> --- a/meta/recipes-graphics/xorg-**xserver/xserver-kdrive_1.7.99.**2.bb<http://xserver-kdrive_1.7.99.2.bb>
>> +++ b/meta/recipes-graphics/xorg-**xserver/xserver-kdrive_1.7.99.**2.bb<http://xserver-kdrive_1.7.99.2.bb>
>> @@ -7,7 +7,7 @@ RDEPENDS_${PN} += "xkeyboard-config"
>>  EXTRA_OECONF += "--disable-glx"
>>
>>  PE = "1"
>> -PR = "r29"
>> +PR = "r30"
>>
>>  SRC_URI = "${XORG_MIRROR}/individual/**xserver/xorg-server-${PV}.tar.**bz2
>> \
>>        file://extra-kmodes.patch \
>> @@ -20,6 +20,7 @@ SRC_URI = "${XORG_MIRROR}/individual/**
>> xserver/xorg-server-${PV}.tar.**bz2 \
>>        file://fix-newer-xorg-headers.**patch \
>>        file://crosscompile.patch \
>>        file://error-address-work-**around.patch \
>> +        file://fix-bogus-stack-**variables.patch \
>>        file://nodolt.patch"
>>  #     file://kdrive-evdev.patch
>>  #     file://kdrive-use-evdev.patch
>>
>
> --
> ------------------------------**------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------**------------------------------
>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>

--90e6ba614d1200623404c05052dd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, May 18, 2012 at 5:16 PM, Gary Thomas <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:gary@mlbassoc.com" target=3D"_blank">g=
ary@mlbassoc.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

On 2012-05-16 15:26, Gary Thomas wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Newer versions of GCC uncovered illegal code practice which can cause<br>
runtime failures in the Xext/xace.c code. =A0This problem has been fixed up=
stream:<br>
 =A0 <a href=3D"http://cgit.freedesktop.org/xorg/xserver/patch/Xext/xace.c?=
id=3D6dae7f3792611aace1df0cca63bf50c50d93de43" target=3D"_blank">http://cgi=
t.freedesktop.org/<u></u>xorg/xserver/patch/Xext/xace.<u></u>c?id=3D<u></u>=
6dae7f3792611aace1df0cca63bf50<u></u>c50d93de43</a><br>


 =A0 Subject: xace: Invalid reference to out-of-scope data.<br>
<br>
Incorporate this patch into the recipe, with a PR bump.<br>
<br>
Signed-off-by: Gary Thomas&lt;<a href=3D"mailto:gary@mlbassoc.com" target=
=3D"_blank">gary@mlbassoc.com</a>&gt;<br>
</blockquote>
<br>
Ping?<br></blockquote><div><br></div><div>Double ping.=A0</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
---<br>
 =A0.../fix-bogus-stack-variables.<u></u>patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0231 ++++++++++++++++++++<br>
 =A0.../xorg-xserver/<a href=3D"http://xserver-kdrive_1.7.99.2.bb" target=
=3D"_blank">xserver-<u></u>kdrive_1.7.99.2.bb</a> =A0 =A0 =A0 =A0| =A0 =A03=
 +-<br>
 =A02 files changed, 233 insertions(+), 1 deletions(-)<br>
 =A0create mode 100644 meta/recipes-graphics/xorg-<u></u>xserver/xserver-kd=
rive-1.7.99.<u></u>2/fix-bogus-stack-variables.<u></u>patch<br>
<br>
diff --git a/meta/recipes-graphics/xorg-<u></u>xserver/xserver-kdrive-1.7.9=
9.<u></u>2/fix-bogus-stack-variables.<u></u>patch b/meta/recipes-graphics/x=
org-<u></u>xserver/xserver-kdrive-1.7.99.<u></u>2/fix-bogus-stack-variables=
.<u></u>patch<br>


new file mode 100644<br>
index 0000000..d900fc3<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/xorg-<u></u>xserver/xserver-kdrive-1.7.99.<u></=
u>2/fix-bogus-stack-variables.<u></u>patch<br>
@@ -0,0 +1,233 @@<br>
+From 6dae7f3792611aace1df0cca63bf50<u></u>c50d93de43 Mon Sep 17 00:00:00 2=
001<br>
+From: Chris Wilson&lt;<a href=3D"mailto:chris@chris-wilson.co.uk" target=
=3D"_blank">chris@chris-wilson.co.<u></u>uk</a>&gt;<br>
+Date: Tue, 10 Aug 2010 18:30:20 +0000<br>
+Subject: xace: Invalid reference to out-of-scope data.<br>
+<br>
+The callback data passed by reference to the hook was allocated on stack<b=
r>
+within the scope of the case statement. The compiler is free to reuse<br>
+any of that stack space whilst making the function call so we may end up<b=
r>
+passing garbage into the callback.<br>
+<br>
+References:<br>
+<br>
+ =A0Bug 18451 - Xorg server 1.5.2 SEGV during XFixesGetCursorImage()<br>
+ =A0<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D18451" targe=
t=3D"_blank">https://bugs.freedesktop.org/<u></u>show_bug.cgi?id=3D18451</a=
><br>
+<br>
+v2: Drop the unrelated hunk that snuck in when ammending the commit<br>
+message.<br>
+<br>
+Signed-off-by: Chris Wilson&lt;<a href=3D"mailto:chris@chris-wilson.co.uk"=
 target=3D"_blank">chris@chris-wilson.co.<u></u>uk</a>&gt;<br>
+Reviewed-by: Alan Coopersmith&lt;<a href=3D"mailto:alan.coopersmith@oracle=
.com" target=3D"_blank">alan.coopersmith@<u></u>oracle.com</a>&gt;<br>
+Signed-off-by: Keith Packard&lt;<a href=3D"mailto:keithp@keithp.com" targe=
t=3D"_blank">keithp@keithp.com</a>&gt;<br>
+<br>
+Upstream-Status: accepted<br>
+---<br>
+(limited to &#39;Xext/xace.c&#39;)<br>
+<br>
+diff --git a/Xext/xace.c b/Xext/xace.c<br>
+index e10d837..c757cad 100644<br>
+--- a/Xext/xace.c<br>
++++ b/Xext/xace.c<br>
+@@ -87,7 +87,18 @@ void XaceHookAuditEnd(ClientPtr ptr, int result)<br>
+ =A0*/<br>
+ int XaceHook(int hook, ...)<br>
+ {<br>
+- =A0 =A0pointer calldata; /* data passed to callback */<br>
++ =A0 =A0union {<br>
++ =A0 =A0 =A0XaceResourceAccessRec res;<br>
++ =A0 =A0 =A0XaceDeviceAccessRec dev;<br>
++ =A0 =A0 =A0XaceSendAccessRec send;<br>
++ =A0 =A0 =A0XaceReceiveAccessRec recv;<br>
++ =A0 =A0 =A0XaceClientAccessRec client;<br>
++ =A0 =A0 =A0XaceExtAccessRec ext;<br>
++ =A0 =A0 =A0XaceServerAccessRec server;<br>
++ =A0 =A0 =A0XaceScreenAccessRec screen;<br>
++ =A0 =A0 =A0XaceAuthAvailRec auth;<br>
++ =A0 =A0 =A0XaceKeyAvailRec key;<br>
++ =A0 =A0} u;<br>
+ =A0 =A0 int *prv =3D NULL; =A0/* points to return value from callback */<=
br>
+ =A0 =A0 va_list ap; =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* argument list */<br>
+ =A0 =A0 va_start(ap, hook);<br>
+@@ -99,117 +110,86 @@ int XaceHook(int hook, ...)<br>
+ =A0 =A0 =A0*/<br>
+ =A0 =A0 switch (hook)<br>
+ =A0 =A0 {<br>
+- =A0 =A0 =A0case XACE_RESOURCE_ACCESS: {<br>
+- =A0 =A0 =A0 =A0 =A0XaceResourceAccessRec rec;<br>
+- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);<br>
+- =A0 =A0 =A0 =A0 =A0<a href=3D"http://rec.id" target=3D"_blank">rec.id</a=
> =3D va_arg(ap, XID);<br>
+- =A0 =A0 =A0 =A0 =A0rec.rtype =3D va_arg(ap, RESTYPE);<br>
+- =A0 =A0 =A0 =A0 =A0rec.res =3D va_arg(ap, pointer);<br>
+- =A0 =A0 =A0 =A0 =A0rec.ptype =3D va_arg(ap, RESTYPE);<br>
+- =A0 =A0 =A0 =A0 =A0rec.parent =3D va_arg(ap, pointer);<br>
+- =A0 =A0 =A0 =A0 =A0rec.access_mode =3D va_arg(ap, Mask);<br>
+- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */<br>
+- =A0 =A0 =A0 =A0 =A0calldata =3D&amp;rec;<br>
+- =A0 =A0 =A0 =A0 =A0prv =3D&amp;rec.status;<br>
++ =A0 =A0 =A0case XACE_RESOURCE_ACCESS:<br>
++ =A0 =A0 =A0 =A0 =A0u.res.client =3D va_arg(ap, ClientPtr);<br>
++ =A0 =A0 =A0 =A0 =A0<a href=3D"http://u.res.id" target=3D"_blank">u.res.i=
d</a> =3D va_arg(ap, XID);<br>
++ =A0 =A0 =A0 =A0 =A0u.res.rtype =3D va_arg(ap, RESTYPE);<br>
++ =A0 =A0 =A0 =A0 =A0u.res.res =3D va_arg(ap, pointer);<br>
++ =A0 =A0 =A0 =A0 =A0u.res.ptype =3D va_arg(ap, RESTYPE);<br>
++ =A0 =A0 =A0 =A0 =A0u.res.parent =3D va_arg(ap, pointer);<br>
++ =A0 =A0 =A0 =A0 =A0u.res.access_mode =3D va_arg(ap, Mask);<br>
++ =A0 =A0 =A0 =A0 =A0u.res.status =3D Success; /* default allow */<br>
++ =A0 =A0 =A0 =A0 =A0prv =3D&amp;u.res.status;<br>
+ =A0 =A0 =A0 =A0 =A0 break;<br>
+- =A0 =A0 =A0}<br>
+- =A0 =A0 =A0case XACE_DEVICE_ACCESS: {<br>
+- =A0 =A0 =A0 =A0 =A0XaceDeviceAccessRec rec;<br>
+- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.dev =3D va_arg(ap, DeviceIntPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.access_mode =3D va_arg(ap, Mask);<br>
+- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */<br>
+- =A0 =A0 =A0 =A0 =A0calldata =3D&amp;rec;<br>
+- =A0 =A0 =A0 =A0 =A0prv =3D&amp;rec.status;<br>
++ =A0 =A0 =A0case XACE_DEVICE_ACCESS:<br>
++ =A0 =A0 =A0 =A0 =A0u.dev.client =3D va_arg(ap, ClientPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.dev.dev =3D va_arg(ap, DeviceIntPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.dev.access_mode =3D va_arg(ap, Mask);<br>
++ =A0 =A0 =A0 =A0 =A0u.dev.status =3D Success; /* default allow */<br>
++ =A0 =A0 =A0 =A0 =A0prv =3D&amp;u.dev.status;<br>
+ =A0 =A0 =A0 =A0 =A0 break;<br>
+- =A0 =A0 =A0}<br>
+- =A0 =A0 =A0case XACE_SEND_ACCESS: {<br>
+- =A0 =A0 =A0 =A0 =A0XaceSendAccessRec rec;<br>
+- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.dev =3D va_arg(ap, DeviceIntPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.pWin =3D va_arg(ap, WindowPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.events =3D va_arg(ap, xEventPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.count =3D va_arg(ap, int);<br>
+- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */<br>
+- =A0 =A0 =A0 =A0 =A0calldata =3D&amp;rec;<br>
+- =A0 =A0 =A0 =A0 =A0prv =3D&amp;rec.status;<br>
++ =A0 =A0 =A0case XACE_SEND_ACCESS:<br>
++ =A0 =A0 =A0 =A0 =A0u.send.client =3D va_arg(ap, ClientPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.send.dev =3D va_arg(ap, DeviceIntPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.send.pWin =3D va_arg(ap, WindowPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.send.events =3D va_arg(ap, xEventPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.send.count =3D va_arg(ap, int);<br>
++ =A0 =A0 =A0 =A0 =A0u.send.status =3D Success; /* default allow */<br>
++ =A0 =A0 =A0 =A0 =A0prv =3D&amp;u.send.status;<br>
+ =A0 =A0 =A0 =A0 =A0 break;<br>
+- =A0 =A0 =A0}<br>
+- =A0 =A0 =A0case XACE_RECEIVE_ACCESS: {<br>
+- =A0 =A0 =A0 =A0 =A0XaceReceiveAccessRec rec;<br>
+- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.pWin =3D va_arg(ap, WindowPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.events =3D va_arg(ap, xEventPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.count =3D va_arg(ap, int);<br>
+- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */<br>
+- =A0 =A0 =A0 =A0 =A0calldata =3D&amp;rec;<br>
+- =A0 =A0 =A0 =A0 =A0prv =3D&amp;rec.status;<br>
++ =A0 =A0 =A0case XACE_RECEIVE_ACCESS:<br>
++ =A0 =A0 =A0 =A0 =A0u.recv.client =3D va_arg(ap, ClientPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.recv.pWin =3D va_arg(ap, WindowPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.recv.events =3D va_arg(ap, xEventPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.recv.count =3D va_arg(ap, int);<br>
++ =A0 =A0 =A0 =A0 =A0u.recv.status =3D Success; /* default allow */<br>
++ =A0 =A0 =A0 =A0 =A0prv =3D&amp;u.recv.status;<br>
+ =A0 =A0 =A0 =A0 =A0 break;<br>
+- =A0 =A0 =A0}<br>
+- =A0 =A0 =A0case XACE_CLIENT_ACCESS: {<br>
+- =A0 =A0 =A0 =A0 =A0XaceClientAccessRec rec;<br>
+- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.target =3D va_arg(ap, ClientPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.access_mode =3D va_arg(ap, Mask);<br>
+- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */<br>
+- =A0 =A0 =A0 =A0 =A0calldata =3D&amp;rec;<br>
+- =A0 =A0 =A0 =A0 =A0prv =3D&amp;rec.status;<br>
++ =A0 =A0 =A0case XACE_CLIENT_ACCESS:<br>
++ =A0 =A0 =A0 =A0 =A0u.client.client =3D va_arg(ap, ClientPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.client.target =3D va_arg(ap, ClientPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.client.access_mode =3D va_arg(ap, Mask);<br>
++ =A0 =A0 =A0 =A0 =A0u.client.status =3D Success; /* default allow */<br>
++ =A0 =A0 =A0 =A0 =A0prv =3D&amp;u.client.status;<br>
+ =A0 =A0 =A0 =A0 =A0 break;<br>
+- =A0 =A0 =A0}<br>
+- =A0 =A0 =A0case XACE_EXT_ACCESS: {<br>
+- =A0 =A0 =A0 =A0 =A0XaceExtAccessRec rec;<br>
+- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.ext =3D va_arg(ap, ExtensionEntry*);<br>
+- =A0 =A0 =A0 =A0 =A0rec.access_mode =3D DixGetAttrAccess;<br>
+- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */<br>
+- =A0 =A0 =A0 =A0 =A0calldata =3D&amp;rec;<br>
+- =A0 =A0 =A0 =A0 =A0prv =3D&amp;rec.status;<br>
++ =A0 =A0 =A0case XACE_EXT_ACCESS:<br>
++ =A0 =A0 =A0 =A0 =A0u.ext.client =3D va_arg(ap, ClientPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.ext.ext =3D va_arg(ap, ExtensionEntry*);<br>
++ =A0 =A0 =A0 =A0 =A0u.ext.access_mode =3D DixGetAttrAccess;<br>
++ =A0 =A0 =A0 =A0 =A0u.ext.status =3D Success; /* default allow */<br>
++ =A0 =A0 =A0 =A0 =A0prv =3D&amp;u.ext.status;<br>
+ =A0 =A0 =A0 =A0 =A0 break;<br>
+- =A0 =A0 =A0}<br>
+- =A0 =A0 =A0case XACE_SERVER_ACCESS: {<br>
+- =A0 =A0 =A0 =A0 =A0XaceServerAccessRec rec;<br>
+- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.access_mode =3D va_arg(ap, Mask);<br>
+- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */<br>
+- =A0 =A0 =A0 =A0 =A0calldata =3D&amp;rec;<br>
+- =A0 =A0 =A0 =A0 =A0prv =3D&amp;rec.status;<br>
++ =A0 =A0 =A0case XACE_SERVER_ACCESS:<br>
++ =A0 =A0 =A0 =A0 =A0u.server.client =3D va_arg(ap, ClientPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.server.access_mode =3D va_arg(ap, Mask);<br>
++ =A0 =A0 =A0 =A0 =A0u.server.status =3D Success; /* default allow */<br>
++ =A0 =A0 =A0 =A0 =A0prv =3D&amp;u.server.status;<br>
+ =A0 =A0 =A0 =A0 =A0 break;<br>
+- =A0 =A0 =A0}<br>
+ =A0 =A0 =A0 case XACE_SCREEN_ACCESS:<br>
+- =A0 =A0 =A0case XACE_SCREENSAVER_ACCESS: {<br>
+- =A0 =A0 =A0 =A0 =A0XaceScreenAccessRec rec;<br>
+- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.screen =3D va_arg(ap, ScreenPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.access_mode =3D va_arg(ap, Mask);<br>
+- =A0 =A0 =A0 =A0 =A0rec.status =3D Success; /* default allow */<br>
+- =A0 =A0 =A0 =A0 =A0calldata =3D&amp;rec;<br>
+- =A0 =A0 =A0 =A0 =A0prv =3D&amp;rec.status;<br>
++ =A0 =A0 =A0case XACE_SCREENSAVER_ACCESS:<br>
++ =A0 =A0 =A0 =A0 =A0u.screen.client =3D va_arg(ap, ClientPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.screen.screen =3D va_arg(ap, ScreenPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.screen.access_mode =3D va_arg(ap, Mask);<br>
++ =A0 =A0 =A0 =A0 =A0u.screen.status =3D Success; /* default allow */<br>
++ =A0 =A0 =A0 =A0 =A0prv =3D&amp;u.screen.status;<br>
+ =A0 =A0 =A0 =A0 =A0 break;<br>
+- =A0 =A0 =A0}<br>
+- =A0 =A0 =A0case XACE_AUTH_AVAIL: {<br>
+- =A0 =A0 =A0 =A0 =A0XaceAuthAvailRec rec;<br>
+- =A0 =A0 =A0 =A0 =A0rec.client =3D va_arg(ap, ClientPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.authId =3D va_arg(ap, XID);<br>
+- =A0 =A0 =A0 =A0 =A0calldata =3D&amp;rec;<br>
++ =A0 =A0 =A0case XACE_AUTH_AVAIL:<br>
++ =A0 =A0 =A0 =A0 =A0u.auth.client =3D va_arg(ap, ClientPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.auth.authId =3D va_arg(ap, XID);<br>
+ =A0 =A0 =A0 =A0 =A0 break;<br>
+- =A0 =A0 =A0}<br>
+- =A0 =A0 =A0case XACE_KEY_AVAIL: {<br>
+- =A0 =A0 =A0 =A0 =A0XaceKeyAvailRec rec;<br>
+- =A0 =A0 =A0 =A0 =A0rec.event =3D va_arg(ap, xEventPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.keybd =3D va_arg(ap, DeviceIntPtr);<br>
+- =A0 =A0 =A0 =A0 =A0rec.count =3D va_arg(ap, int);<br>
+- =A0 =A0 =A0 =A0 =A0calldata =3D&amp;rec;<br>
++ =A0 =A0 =A0case XACE_KEY_AVAIL:<br>
++ =A0 =A0 =A0 =A0 =A0u.key.event =3D va_arg(ap, xEventPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.key.keybd =3D va_arg(ap, DeviceIntPtr);<br>
++ =A0 =A0 =A0 =A0 =A0u.key.count =3D va_arg(ap, int);<br>
+ =A0 =A0 =A0 =A0 =A0 break;<br>
+- =A0 =A0 =A0}<br>
+- =A0 =A0 =A0default: {<br>
++ =A0 =A0 =A0default:<br>
+ =A0 =A0 =A0 =A0 =A0 va_end(ap);<br>
+ =A0 =A0 =A0 =A0 =A0 return 0; =A0 /* unimplemented hook number */<br>
+- =A0 =A0 =A0}<br>
+ =A0 =A0 }<br>
+ =A0 =A0 va_end(ap);<br>
+<br>
+ =A0 =A0 /* call callbacks and return result, if any. */<br>
+- =A0 =A0CallCallbacks(&amp;XaceHooks[hook]<u></u>, calldata);<br>
++ =A0 =A0CallCallbacks(&amp;XaceHooks[hook]<u></u>,&amp;u);<br>
+ =A0 =A0 return prv ? *prv : Success;<br>
+ }<br>
+<br>
+--<br>
+cgit v0.9.0.2-2-gbebe<br>
diff --git a/meta/recipes-graphics/xorg-<u></u>xserver/<a href=3D"http://xs=
erver-kdrive_1.7.99.2.bb" target=3D"_blank">xserver-kdrive_1.7.99.<u></u>2.=
bb</a> b/meta/recipes-graphics/xorg-<u></u>xserver/<a href=3D"http://xserve=
r-kdrive_1.7.99.2.bb" target=3D"_blank">xserver-kdrive_1.7.99.<u></u>2.bb</=
a><br>


index 360a0f3..d90dc25 100644<br>
--- a/meta/recipes-graphics/xorg-<u></u>xserver/<a href=3D"http://xserver-k=
drive_1.7.99.2.bb" target=3D"_blank">xserver-kdrive_1.7.99.<u></u>2.bb</a><=
br>
+++ b/meta/recipes-graphics/xorg-<u></u>xserver/<a href=3D"http://xserver-k=
drive_1.7.99.2.bb" target=3D"_blank">xserver-kdrive_1.7.99.<u></u>2.bb</a><=
br>
@@ -7,7 +7,7 @@ RDEPENDS_${PN} +=3D &quot;xkeyboard-config&quot;<br>
 =A0EXTRA_OECONF +=3D &quot;--disable-glx&quot;<br>
<br>
 =A0PE =3D &quot;1&quot;<br>
-PR =3D &quot;r29&quot;<br>
+PR =3D &quot;r30&quot;<br>
<br>
 =A0SRC_URI =3D &quot;${XORG_MIRROR}/individual/<u></u>xserver/xorg-server-=
${PV}.tar.<u></u>bz2 \<br>
 =A0 =A0 =A0 =A0file://extra-kmodes.patch \<br>
@@ -20,6 +20,7 @@ SRC_URI =3D &quot;${XORG_MIRROR}/individual/<u></u>xserve=
r/xorg-server-${PV}.tar.<u></u>bz2 \<br>
 =A0 =A0 =A0 =A0file://fix-newer-xorg-headers.<u></u>patch \<br>
 =A0 =A0 =A0 =A0file://crosscompile.patch \<br>
 =A0 =A0 =A0 =A0file://error-address-work-<u></u>around.patch \<br>
+ =A0 =A0 =A0 =A0file://fix-bogus-stack-<u></u>variables.patch \<br>
 =A0 =A0 =A0 =A0file://nodolt.patch&quot;<br>
 =A0# =A0 =A0 file://kdrive-evdev.patch<br>
 =A0# =A0 =A0 file://kdrive-use-evdev.patch<span class=3D"HOEnZb"><font col=
or=3D"#888888"><br>
</font></span></blockquote><span class=3D"HOEnZb"><font color=3D"#888888">
<br>
-- <br>
------------------------------<u></u>------------------------------<br>
Gary Thomas =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0Consulting for the<br>
MLB Associates =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0Embedded world<br>
------------------------------<u></u>------------------------------<br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</font></span></blockquote></div><br>

--90e6ba614d1200623404c05052dd--
