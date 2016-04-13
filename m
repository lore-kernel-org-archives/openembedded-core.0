Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id CDA786612C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 12:08:29 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id s79so60510541oie.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 05:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fwflLxsXoas2U2QXaR/cEX2axHTWQIguAH9OElQsMss=;
	b=zuXLEjIe742oLw1idVLlI3fqs0Zv+aZrVmd534+IRQf7ab0z1eALYE9CAU1B6iS1RR
	1r4oig4XCLIwj9WKeyXOtlWFsWlwMWyrrogPjoyISbxohSYpKPQBtAwct6FVRUZeIDB2
	Jk1uZPYTAySNlVNytV3Mb3Xuq9ATneqvUBSaaVu3KRM4nMldmdqUcbkbZIeqVHiX0Ycj
	ZxL2uaRrEvtHFO5WXib7NRiyn2ZIAhXWv6EmcMgQfAw+YvaPprOLOdMpMbez5FZp3/zI
	i0H/7yP5jLJItKFJ3fMhs3LOXIZO3JJMhGc/K1sm5d6df6KnGZx1aCapICkQKvLIQT0z
	JUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fwflLxsXoas2U2QXaR/cEX2axHTWQIguAH9OElQsMss=;
	b=PY/8vATJ7WMCw/RbH/12rRzVDRVBzeqgT82YAgmK9iuW9mA204zCnWhDhzXDSy5HFq
	koIYm7X7bpt6pYKxAAb9asvHUWWHi+6pCSOcNbgwkk9doI44HvEhTbh0oM//zWpwBWrP
	upN9xj9+Trw2d9HZjN4zaipynSohIuakP+IkGobd5qDTd91c2lYYJTCZFBdVGGW4CRek
	K6KMfhzIAVRiwPjc6njz+6G/3SxaUPbVfgvihR+RfVoa7AzNglB2HWPArbGj1bSSr0tw
	cDX2RFbVQRz4JKz3XRLl3bneYVPfRwUykUP8In+jBEmuCfcBy893djxo9fnG9rYEP9L8
	/2nA==
X-Gm-Message-State: AOPr4FXWIOLxXHpW/RVtBerC2s0HuHhjJQeW84kC1dOnM1rZM3HCyu0iiSN47mrToDsLn7LgDUn+m+64sS2TVqCj
X-Received: by 10.157.44.135 with SMTP id p7mr4274502otb.98.1460549310183;
	Wed, 13 Apr 2016 05:08:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.173.77 with HTTP; Wed, 13 Apr 2016 05:08:00 -0700 (PDT)
In-Reply-To: <570E2F11.4070308@mlbassoc.com>
References: <1460448862-16134-1-git-send-email-jussi.kukkonen@intel.com>
	<570E2F11.4070308@mlbassoc.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 13 Apr 2016 15:08:00 +0300
Message-ID: <CAHiDW_GLpb20KWeHX4s6BmcbmX4tAv9ORvbBqzbfaK5CMYQ8JA@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] matchbox-keyboard: Hide desktop launcher
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
X-List-Received-Date: Wed, 13 Apr 2016 12:08:32 -0000
Content-Type: multipart/alternative; boundary=001a113cbcf6cf99c605305ca2c8

--001a113cbcf6cf99c605305ca2c8
Content-Type: text/plain; charset=UTF-8

On 13 April 2016 at 14:35, Gary Thomas <gary@mlbassoc.com> wrote:

> On 2016-04-12 10:14, Jussi Kukkonen wrote:
>
>> Add patch that hides the keyboard desktop launcher, remove patch that
>> tries and fails to make the keyboard a single-instance application.
>>
>> The desktop launcher of matchbox-keyboard is a source of far more
>> problems than solutions: As an example there's supposed to be only
>> one instance running at a time but we give the user several ways to
>> start multiple instances (and the Matchbox WM Single-Instance
>> implementation is broken by both design and implementation).
>>
>> After this patch the only instance of matchbox-keyboard is the
>> daemonized one that can be shown/hidden with the panel applet (when
>> there is not hardware keyboard). If an additional matchbox-keyboard
>> needs to be started for debug reasons, it can still be done from
>> command line.
>>
>> Fixes [YOCTO #3093].
>>
>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>
>
> Sadly, with this change (and the one it tries to fix), I no longer get
> a pop-up matchbox keyboard on my touch-only device.  It used to work
> great - any time I had a program wanting input, the keyboard would
> appear until I pressed enter.  Now I get nothing and the keyboard icon
> in the toolbar is also missing, so my touch based device (no physical
> keyboard) is useless :-(
>
> How can I get this behaviour back?  I tried bisecting the changes to find
> the cause of the change, but it didn't really tell me much.


This commit _should_ not affect the panel applet or the daemonized
keyboard, it really only hides the icon from the desktop launcher.

Have you checked that your /etc/formfactor/machconfig contains
"HAVE_KEYBOARD=0"? This value is used by /etc/matchbox/session to decide
whether to load the keyboard panel or not, and by .the Xsession script to
decide whether to start the daemonized keyboard or not.

Jussi



>
> ---
>>
>> This change would have been nice to have much before release to give
>> people time to react (in the unlikely case that someone actually has a
>> reasonable use case for the launcher). Unfortunately I only thought of
>> this solution now.
>>
>> Also available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib jku/hide-matchbox-keyboard
>>
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/hide-matchbox-keyboard
>>
>> Cheers,
>>    Jussi
>>
>>
>>   ...ktop-file-Hide-the-keyboard-from-app-list.patch | 33
>> ++++++++++++++++++++++
>>   .../matchbox-keyboard/files/single-instance.patch  | 23 ---------------
>>   .../matchbox-keyboard/matchbox-keyboard_git.bb     |  2 +-
>>   3 files changed, 34 insertions(+), 24 deletions(-)
>>   create mode 100644
>> meta/recipes-sato/matchbox-keyboard/files/0001-desktop-file-Hide-the-keyboard-from-app-list.patch
>>   delete mode 100644
>> meta/recipes-sato/matchbox-keyboard/files/single-instance.patch
>>
>> diff --git
>> a/meta/recipes-sato/matchbox-keyboard/files/0001-desktop-file-Hide-the-keyboard-from-app-list.patch
>> b/meta/recipes-sato/matchbox-keyboard/files/0001-desktop-file-Hide-the-keyboard-from-app-list.patch
>> new file mode 100644
>> index 0000000..6b7a5cf
>> --- /dev/null
>> +++
>> b/meta/recipes-sato/matchbox-keyboard/files/0001-desktop-file-Hide-the-keyboard-from-app-list.patch
>> @@ -0,0 +1,33 @@
>> +From 38da4cd575edb7463cfff241afff64c2f66ea09a Mon Sep 17 00:00:00 2001
>> +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> +Date: Tue, 12 Apr 2016 09:40:37 +0300
>> +Subject: [PATCH] desktop file: Hide the keyboard from app list
>> +
>> +matchbox-keyboard is not a normal app and there's no need to start
>> +it via the desktop app grid when using Sato desktop:
>> +* when there's no hardware keyboard, the panel applet can be used to
>> +  show/hide the daemonized matchbox-keyboard
>> +* when there is a hardware keyboard, matchbox-keyboard can still be
>> +  started for debug purposes from command line or the applet can be
>> +  enabled by editing /etc/formfactor/machconfig
>> +
>> +So hide the keyboard from the desktop app list.
>> +
>> +Upstream-Status: Inappropriate [configuration]
>> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> +---
>> + matchbox-keyboard.desktop | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/matchbox-keyboard.desktop b/matchbox-keyboard.desktop
>> +index c092bfe..613d349 100644
>> +--- a/matchbox-keyboard.desktop
>> ++++ b/matchbox-keyboard.desktop
>> +@@ -6,3 +6,4 @@ Type=Application
>> + Icon=matchbox-keyboard.png
>> + Categories=Panel;Utility;MB
>> + X-MB-INPUT-MECHANSIM=True
>> ++NoDisplay=true
>> +--
>> +2.1.4
>> +
>> diff --git
>> a/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch
>> b/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch
>> deleted file mode 100644
>> index 18b6c41..0000000
>> --- a/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch
>> +++ /dev/null
>> @@ -1,23 +0,0 @@
>> -Multiple matchbox-keyboard instances would occupy whole screen and cause
>> X
>> -window segfault(Bug 509). Making matchbox-keyboard singleton is one work
>> -around.
>> -
>> -This patch allow only one instance of matchbox-keyboard based on some
>> mechanism
>> -in matchbox-desktop. In future, an applet and GTK-IM modules in
>> -matchbox-keyboard can be used to automatically map/unmap the virtual
>> keyboard
>> -on demand.
>> -
>> -Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
>> -
>> -Upstream-Status: Inappropriate [configuration]
>> -
>> -Index: matchbox-keyboard/matchbox-keyboard.desktop
>> -===================================================================
>> ---- matchbox-keyboard.orig/matchbox-keyboard.desktop   2010-12-22
>> 20:41:40.000000000 +0800
>> -+++ matchbox-keyboard/matchbox-keyboard.desktop        2010-12-22
>> 20:42:12.000000000 +0800
>> -@@ -6,3 +6,5 @@
>> - Icon=matchbox-keyboard.png
>> - Categories=Panel;Utility;MB
>> - X-MB-INPUT-MECHANSIM=True
>> -+X-MB-SingleInstance=true
>> -+StartupNotify=true
>> diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
>> b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
>> index 183cba2..eba1970 100644
>> --- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
>> +++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
>> @@ -15,7 +15,7 @@ PV = "0.0+git${SRCPV}"
>>   PR = "r4"
>>
>>   SRC_URI = "git://
>> git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1
>> <http://git.yoctoproject.org/$%7BBPN%7D;branch=matchbox-keyboard-0-1> \
>> -           file://single-instance.patch \
>> +
>>  file://0001-desktop-file-Hide-the-keyboard-from-app-list.patch \
>>              file://80matchboxkeyboard.sh"
>>
>>   S = "${WORKDIR}/git"
>>
>>
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113cbcf6cf99c605305ca2c8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
3 April 2016 at 14:35, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mailto:=
gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><span class=3D"">On 2016-04-12 10:14, J=
ussi Kukkonen wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Add patch that hides the keyboard desktop launcher, remove patch that<br>
tries and fails to make the keyboard a single-instance application.<br>
<br>
The desktop launcher of matchbox-keyboard is a source of far more<br>
problems than solutions: As an example there&#39;s supposed to be only<br>
one instance running at a time but we give the user several ways to<br>
start multiple instances (and the Matchbox WM Single-Instance<br>
implementation is broken by both design and implementation).<br>
<br>
After this patch the only instance of matchbox-keyboard is the<br>
daemonized one that can be shown/hidden with the panel applet (when<br>
there is not hardware keyboard). If an additional matchbox-keyboard<br>
needs to be started for debug reasons, it can still be done from<br>
command line.<br>
<br>
Fixes [YOCTO #3093].<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
</blockquote>
<br></span>
Sadly, with this change (and the one it tries to fix), I no longer get<br>
a pop-up matchbox keyboard on my touch-only device.=C2=A0 It used to work<b=
r>
great - any time I had a program wanting input, the keyboard would<br>
appear until I pressed enter.=C2=A0 Now I get nothing and the keyboard icon=
<br>
in the toolbar is also missing, so my touch based device (no physical<br>
keyboard) is useless :-(<br>
<br>
How can I get this behaviour back?=C2=A0 I tried bisecting the changes to f=
ind<br>
the cause of the change, but it didn&#39;t really tell me much.</blockquote=
><div><br></div><div>This commit _should_ not affect the panel applet or th=
e daemonized keyboard, it really only hides the icon from the desktop launc=
her.</div><div><br></div><div>Have you checked that your /etc/formfactor/ma=
chconfig contains &quot;HAVE_KEYBOARD=3D0&quot;? This value is used by /etc=
/matchbox/session to decide whether to load the keyboard panel or not, and =
by .the Xsession script to decide whether to start the daemonized keyboard =
or not.</div><div><br></div><div>Jussi</div><div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div><div class=3D"h5">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
---<br>
<br>
This change would have been nice to have much before release to give<br>
people time to react (in the unlikely case that someone actually has a<br>
reasonable use case for the launcher). Unfortunately I only thought of<br>
this solution now.<br>
<br>
Also available in the git repository at:<br>
<br>
=C2=A0 =C2=A0git://<a href=3D"http://git.yoctoproject.org/poky-contrib" rel=
=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/poky-contrib</a> jku=
/hide-matchbox-keyboard<br>
=C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/l=
og/?h=3Djku/hide-matchbox-keyboard" rel=3D"noreferrer" target=3D"_blank">ht=
tp://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Djku/hide-matchbox-=
keyboard</a><br>
<br>
Cheers,<br>
=C2=A0 =C2=A0Jussi<br>
<br>
<br>
=C2=A0 ...ktop-file-Hide-the-keyboard-from-app-list.patch | 33 ++++++++++++=
++++++++++<br>
=C2=A0 .../matchbox-keyboard/files/single-instance.patch=C2=A0 | 23 -------=
--------<br>
=C2=A0 .../matchbox-keyboard/<a href=3D"http://matchbox-keyboard_git.bb" re=
l=3D"noreferrer" target=3D"_blank">matchbox-keyboard_git.bb</a>=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0 3 files changed, 34 insertions(+), 24 deletions(-)<br>
=C2=A0 create mode 100644 meta/recipes-sato/matchbox-keyboard/files/0001-de=
sktop-file-Hide-the-keyboard-from-app-list.patch<br>
=C2=A0 delete mode 100644 meta/recipes-sato/matchbox-keyboard/files/single-=
instance.patch<br>
<br>
diff --git a/meta/recipes-sato/matchbox-keyboard/files/0001-desktop-file-Hi=
de-the-keyboard-from-app-list.patch b/meta/recipes-sato/matchbox-keyboard/f=
iles/0001-desktop-file-Hide-the-keyboard-from-app-list.patch<br>
new file mode 100644<br>
index 0000000..6b7a5cf<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/matchbox-keyboard/files/0001-desktop-file-Hide-the-=
keyboard-from-app-list.patch<br>
@@ -0,0 +1,33 @@<br>
+From 38da4cd575edb7463cfff241afff64c2f66ea09a Mon Sep 17 00:00:00 2001<br>
+From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com" targe=
t=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
+Date: Tue, 12 Apr 2016 09:40:37 +0300<br>
+Subject: [PATCH] desktop file: Hide the keyboard from app list<br>
+<br>
+matchbox-keyboard is not a normal app and there&#39;s no need to start<br>
+it via the desktop app grid when using Sato desktop:<br>
+* when there&#39;s no hardware keyboard, the panel applet can be used to<b=
r>
+=C2=A0 show/hide the daemonized matchbox-keyboard<br>
+* when there is a hardware keyboard, matchbox-keyboard can still be<br>
+=C2=A0 started for debug purposes from command line or the applet can be<b=
r>
+=C2=A0 enabled by editing /etc/formfactor/machconfig<br>
+<br>
+So hide the keyboard from the desktop app list.<br>
+<br>
+Upstream-Status: Inappropriate [configuration]<br>
+Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
+---<br>
+ matchbox-keyboard.desktop | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/matchbox-keyboard.desktop b/matchbox-keyboard.desktop<br>
+index c092bfe..613d349 100644<br>
+--- a/matchbox-keyboard.desktop<br>
++++ b/matchbox-keyboard.desktop<br>
+@@ -6,3 +6,4 @@ Type=3DApplication<br>
+ Icon=3Dmatchbox-keyboard.png<br>
+ Categories=3DPanel;Utility;MB<br>
+ X-MB-INPUT-MECHANSIM=3DTrue<br>
++NoDisplay=3Dtrue<br>
+--<br>
+2.1.4<br>
+<br>
diff --git a/meta/recipes-sato/matchbox-keyboard/files/single-instance.patc=
h b/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch<br>
deleted file mode 100644<br>
index 18b6c41..0000000<br>
--- a/meta/recipes-sato/matchbox-keyboard/files/single-instance.patch<br>
+++ /dev/null<br>
@@ -1,23 +0,0 @@<br>
-Multiple matchbox-keyboard instances would occupy whole screen and cause X=
<br>
-window segfault(Bug 509). Making matchbox-keyboard singleton is one work<b=
r>
-around.<br>
-<br>
-This patch allow only one instance of matchbox-keyboard based on some mech=
anism<br>
-in matchbox-desktop. In future, an applet and GTK-IM modules in<br>
-matchbox-keyboard can be used to automatically map/unmap the virtual keybo=
ard<br>
-on demand.<br>
-<br>
-Signed-off-by: Zhai Edwin &lt;<a href=3D"mailto:edwin.zhai@intel.com" targ=
et=3D"_blank">edwin.zhai@intel.com</a>&gt;<br>
-<br>
-Upstream-Status: Inappropriate [configuration]<br>
-<br>
-Index: matchbox-keyboard/matchbox-keyboard.desktop<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- matchbox-keyboard.orig/matchbox-keyboard.desktop=C2=A0 =C2=A02010-12-2=
2 20:41:40.000000000 +0800<br>
-+++ matchbox-keyboard/matchbox-keyboard.desktop=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 2010-12-22 20:42:12.000000000 +0800<br>
-@@ -6,3 +6,5 @@<br>
- Icon=3Dmatchbox-keyboard.png<br>
- Categories=3DPanel;Utility;MB<br>
- X-MB-INPUT-MECHANSIM=3DTrue<br>
-+X-MB-SingleInstance=3Dtrue<br>
-+StartupNotify=3Dtrue<br>
diff --git a/meta/recipes-sato/matchbox-keyboard/<a href=3D"http://matchbox=
-keyboard_git.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-keyboard_gi=
t.bb</a> b/meta/recipes-sato/matchbox-keyboard/<a href=3D"http://matchbox-k=
eyboard_git.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-keyboard_git.=
bb</a><br>
index 183cba2..eba1970 100644<br>
--- a/meta/recipes-sato/matchbox-keyboard/<a href=3D"http://matchbox-keyboa=
rd_git.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-keyboard_git.bb</a=
><br>
+++ b/meta/recipes-sato/matchbox-keyboard/<a href=3D"http://matchbox-keyboa=
rd_git.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-keyboard_git.bb</a=
><br>
@@ -15,7 +15,7 @@ PV =3D &quot;0.0+git${SRCPV}&quot;<br>
=C2=A0 PR =3D &quot;r4&quot;<br>
<br>
=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/$%7BB=
PN%7D;branch=3Dmatchbox-keyboard-0-1" rel=3D"noreferrer" target=3D"_blank">=
git.yoctoproject.org/${BPN};branch=3Dmatchbox-keyboard-0-1</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://single-instance.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-desktop-file-Hide-the=
-keyboard-from-app-list.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://80matchboxkeyboard.s=
h&quot;<br>
<br>
=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
</blockquote>
<br>
<br>
-- <br></div></div>
------------------------------------------------------------<br>
Gary Thomas=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 Consulting for the<br>
MLB Associates=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 Embedded world<br>
------------------------------------------------------------<span class=3D"=
HOEnZb"><font color=3D"#888888"><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--001a113cbcf6cf99c605305ca2c8--
