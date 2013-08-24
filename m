Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id D94E460846
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 19:15:12 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id up15so1922903pbc.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 12:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=SSR7U+/jaAnS1BxhgmWYg/fjm/kNOxOZ+ZSpn2hOMAo=;
	b=DthPGLepJpVp+vL2T9VauWe0kYhinnT333mv+L3Fu2MU6+krOq81j4IMyCktRUqZmY
	mkMg/1Krwj04QK2cExMPvuT2iHUx78SiXgBhloNRJ6MLiEX/44aiO96NP6ZfLZgFeJx5
	YrJ/ws3vH+v9M3n8jmG4PY2mUodbp+O7blIeKR37g7PjMACIXn3XbFMnoFDDFQYk7bhK
	0zFbkzayXZSk4GzjEFJ6OHaCxDUahaguDXkncNPZ6/TkRUZ5qM/s8c8gix74YULD7lKy
	A6yMnpjSuv7pTHscUVhaDtDmWWgiLG/FQztpI829e2DBbBOGicHeVnf+z7hzHmQu+6xd
	mgfA==
X-Gm-Message-State: ALoCoQm6B6yZSee+E56rCpVBIU4+kvU1mRmEj3/L0obamzU97nKJLEE8jxcIIktHv76KJ/0pQGm8
MIME-Version: 1.0
X-Received: by 10.68.175.99 with SMTP id bz3mr6345585pbc.75.1377371713554;
	Sat, 24 Aug 2013 12:15:13 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Sat, 24 Aug 2013 12:15:12 -0700 (PDT)
In-Reply-To: <521905BF.4010908@linux.intel.com>
References: <1377362952-29061-1-git-send-email-eric.nelson@boundarydevices.com>
	<521905BF.4010908@linux.intel.com>
Date: Sat, 24 Aug 2013 20:15:12 +0100
X-Google-Sender-Auth: SilCqmo8Uv32lA0-C-H38Bp1cL4
Message-ID: <CAOMwXhOGuSNGHJogiDewqnd-_-JtahNwb6xxDPO3fgnkXNTGnw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-qt: add fix for QWSLock on qt4e
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
X-List-Received-Date: Sat, 24 Aug 2013 19:15:13 -0000
Content-Type: multipart/alternative; boundary=047d7bd6b3aab5daf604e4b65791

--047d7bd6b3aab5daf604e4b65791
Content-Type: text/plain; charset=ISO-8859-1

This is strange. According to the bugtracker it should be in 4.8.5
already... and the recipe seems to be about 4.8.5. It needs more
investigation.


On Sat, Aug 24, 2013 at 8:13 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 08/24/2013 09:49 AM, Eric Nelson wrote:
>
>> This patch adds a patch for Qt-Embedded to only
>> destroy semaphores in the process which created
>> them.
>>
>> Original patch by Neil Jerram for the OpenMoko project:
>>         http://lists.openmoko.org/**pipermail/community/2012-**
>> November/067806.html<http://lists.openmoko.org/pipermail/community/2012-November/067806.html>
>>
>> See also Bug 31254:
>> https://bugreports.qt-project.**org/browse/QTBUG-31254<https://bugreports.qt-project.org/browse/QTBUG-31254>
>>
>> Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.**com<eric.nelson@boundarydevices.com>
>> >
>>
> Besides this, we need an Upstream-Status: Tag, this is either a Backport
> or Submitted maybe?
>
> Sau!
>
>
>  ---
>>   meta/recipes-qt/qt4/qt4-4.8.5.**inc                  |  1 +
>>   ...-Only-destroy-semaphores-**in-process-owner.patch | 77
>> ++++++++++++++++++++++
>>   2 files changed, 78 insertions(+)
>>   create mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/**
>> 0028-QWSLock-Only-destroy-**semaphores-in-process-owner.**patch
>>
>> diff --git a/meta/recipes-qt/qt4/qt4-4.8.**5.inc
>> b/meta/recipes-qt/qt4/qt4-4.8.**5.inc
>> index 95a14f3..be16bff 100644
>> --- a/meta/recipes-qt/qt4/qt4-4.8.**5.inc
>> +++ b/meta/recipes-qt/qt4/qt4-4.8.**5.inc
>> @@ -24,6 +24,7 @@ SRC_URI = "http://download.qt-project.**
>> org/official_releases/qt/4.8/$**{PV}/qt-ever<http://download.qt-project.org/official_releases/qt/4.8/$%7BPV%7D/qt-ever>
>>              file://0022-Fix-drawing-of-0-**width-polylines-from-outside-
>> **the-de.patch \
>>              file://0023-QHttpMultiPart-**fix-data-corruption-in-**readData-metho.patch
>> \
>>              file://0027-tools.pro-disable-**qmeegographicssystemhelper.*
>> *patch \
>> +           file://0028-QWSLock-Only-**destroy-semaphores-in-process-**owner.patch
>> \
>>              file://g++.conf \
>>              file://linux.conf \
>>              "
>> diff --git a/meta/recipes-qt/qt4/qt4-4.8.**5/0028-QWSLock-Only-destroy-**
>> semaphores-in-process-owner.**patch b/meta/recipes-qt/qt4/qt4-4.8.**
>> 5/0028-QWSLock-Only-destroy-**semaphores-in-process-owner.**patch
>> new file mode 100644
>> index 0000000..d67a746
>> --- /dev/null
>> +++ b/meta/recipes-qt/qt4/qt4-4.8.**5/0028-QWSLock-Only-destroy-**
>> semaphores-in-process-owner.**patch
>> @@ -0,0 +1,77 @@
>> +From 9af565935d16ecf8a8c04b5ea850dd**b34a7c1294 Mon Sep 17 00:00:00 2001
>> +From: Eric Nelson <eric.nelson@boundarydevices.**com<eric.nelson@boundarydevices.com>
>> >
>> +Date: Mon, 12 Aug 2013 11:54:05 -0700
>> +Subject: [PATCH] QWSLock: Only destroy semaphores in process owner
>> +
>> +This fixes the case when QT_POSIX_IPC is not defined.
>> +
>> +Original patch by Neil Jerram for the OpenMoko project:
>> +       http://lists.openmoko.org/**pipermail/community/2012-**
>> November/067806.html<http://lists.openmoko.org/pipermail/community/2012-November/067806.html>
>> +
>> +See also Bug 31254:
>> +       https://bugreports.qt-project.**org/browse/QTBUG-31254<https://bugreports.qt-project.org/browse/QTBUG-31254>
>> +
>> +Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.**com<eric.nelson@boundarydevices.com>
>> >
>> +---
>> + src/gui/embedded/qwslock.cpp | 13 +++++++++----
>> + src/gui/embedded/qwslock_p.h |  2 +-
>> + 2 files changed, 10 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/src/gui/embedded/qwslock.cpp b/src/gui/embedded/qwslock.cpp
>> +index 3f8f306..cd6a48d 100644
>> +--- a/src/gui/embedded/qwslock.cpp
>> ++++ b/src/gui/embedded/qwslock.cpp
>> +@@ -83,9 +83,12 @@ QWSLock::QWSLock(int id) : semId(id)
>> +     QWSSignalHandler::instance()->**addWSLock(this);
>> + #endif
>> +
>> ++    owned = false;
>> ++
>> + #ifndef QT_POSIX_IPC
>> +     if (semId == -1) {
>> +         semId = semget(IPC_PRIVATE, 3, IPC_CREAT | 0666);
>> ++        owned = true;
>> +         if (semId == -1) {
>> +             perror("QWSLock::QWSLock");
>> +             qFatal("Unable to create semaphore");
>> +@@ -100,7 +103,6 @@ QWSLock::QWSLock(int id) : semId(id)
>> +     }
>> + #else
>> +     sems[0] = sems[1] = sems[2] = SEM_FAILED;
>> +-    owned = false;
>> +
>> +     if (semId == -1) {
>> +         // ### generate really unique IDs
>> +@@ -134,9 +136,12 @@ QWSLock::~QWSLock()
>> +
>> +     if (semId != -1) {
>> + #ifndef QT_POSIX_IPC
>> +-        qt_semun semval;
>> +-        semval.val = 0;
>> +-        semctl(semId, 0, IPC_RMID, semval);
>> ++
>> ++        if (owned) {
>> ++            qt_semun semval;
>> ++            semval.val = 0;
>> ++            semctl(semId, 0, IPC_RMID, semval);
>> ++        }
>> +         semId = -1;
>> + #else
>> +         // emulate the SEM_UNDO behavior for the BackingStore lock
>> +diff --git a/src/gui/embedded/qwslock_p.h b/src/gui/embedded/qwslock_p.h
>> +index ead7b89..d16b3d5 100644
>> +--- a/src/gui/embedded/qwslock_p.h
>> ++++ b/src/gui/embedded/qwslock_p.h
>> +@@ -86,8 +86,8 @@ private:
>> +     int lockCount[2];
>> + #ifdef QT_POSIX_IPC
>> +     sem_t *sems[3];
>> +-    bool owned;
>> + #endif
>> ++    bool owned;
>> + };
>> +
>> + QT_END_NAMESPACE
>> +--
>> +1.8.1.2
>> +
>>
>>  ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/**mailman/listinfo/openembedded-**core<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>

--047d7bd6b3aab5daf604e4b65791
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is strange. According to the bugtracker it should be =
in 4.8.5 already... and the recipe seems to be about 4.8.5. It needs more i=
nvestigation.</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_q=
uote">
On Sat, Aug 24, 2013 at 8:13 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D=
"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On 08/24/2013 09:49 AM, Eric Nelson wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This patch adds a patch for Qt-Embedded to only<br>
destroy semaphores in the process which created<br>
them.<br>
<br>
Original patch by Neil Jerram for the OpenMoko project:<br>
=A0 =A0 =A0 =A0 <a href=3D"http://lists.openmoko.org/pipermail/community/20=
12-November/067806.html" target=3D"_blank">http://lists.openmoko.org/<u></u=
>pipermail/community/2012-<u></u>November/067806.html</a><br>
<br>
See also Bug 31254:<br>
<a href=3D"https://bugreports.qt-project.org/browse/QTBUG-31254" target=3D"=
_blank">https://bugreports.qt-project.<u></u>org/browse/QTBUG-31254</a><br>
<br>
Signed-off-by: Eric Nelson &lt;<a href=3D"mailto:eric.nelson@boundarydevice=
s.com" target=3D"_blank">eric.nelson@boundarydevices.<u></u>com</a>&gt;<br>
</blockquote></div>
Besides this, we need an Upstream-Status: Tag, this is either a Backport or=
 Submitted maybe?<br>
<br>
Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
---<br>
=A0 meta/recipes-qt/qt4/qt4-4.8.5.<u></u>inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A01 +<br>
=A0 ...-Only-destroy-semaphores-<u></u>in-process-owner.patch | 77 ++++++++=
++++++++++++++<br>
=A0 2 files changed, 78 insertions(+)<br>
=A0 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/<u></u>0028-QWSLock-On=
ly-destroy-<u></u>semaphores-in-process-owner.<u></u>patch<br>
<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.<u></u>5.inc b/meta/recipes-qt/qt4=
/qt4-4.8.<u></u>5.inc<br>
index 95a14f3..be16bff 100644<br>
--- a/meta/recipes-qt/qt4/qt4-4.8.<u></u>5.inc<br>
+++ b/meta/recipes-qt/qt4/qt4-4.8.<u></u>5.inc<br>
@@ -24,6 +24,7 @@ SRC_URI =3D &quot;<a href=3D"http://download.qt-project.o=
rg/official_releases/qt/4.8/$%7BPV%7D/qt-ever" target=3D"_blank">http://dow=
nload.qt-project.<u></u>org/official_releases/qt/4.8/$<u></u>{PV}/qt-ever</=
a><br>

=A0 =A0 =A0 =A0 =A0 =A0 =A0file://0022-Fix-drawing-of-0-<u></u>width-polyli=
nes-from-outside-<u></u>the-de.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0file://0023-QHttpMultiPart-<u></u>fix-data-corru=
ption-in-<u></u>readData-metho.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0file://0027-tools.pro-disable-<u></u>qmeegograph=
icssystemhelper.<u></u>patch \<br>
+ =A0 =A0 =A0 =A0 =A0 file://0028-QWSLock-Only-<u></u>destroy-semaphores-in=
-process-<u></u>owner.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0file://g++.conf \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0file://linux.conf \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0&quot;<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.<u></u>5/0028-QWSLock-Only-destroy=
-<u></u>semaphores-in-process-owner.<u></u>patch b/meta/recipes-qt/qt4/qt4-=
4.8.<u></u>5/0028-QWSLock-Only-destroy-<u></u>semaphores-in-process-owner.<=
u></u>patch<br>

new file mode 100644<br>
index 0000000..d67a746<br>
--- /dev/null<br>
+++ b/meta/recipes-qt/qt4/qt4-4.8.<u></u>5/0028-QWSLock-Only-destroy-<u></u=
>semaphores-in-process-owner.<u></u>patch<br>
@@ -0,0 +1,77 @@<br>
+From 9af565935d16ecf8a8c04b5ea850dd<u></u>b34a7c1294 Mon Sep 17 00:00:00 2=
001<br>
+From: Eric Nelson &lt;<a href=3D"mailto:eric.nelson@boundarydevices.com" t=
arget=3D"_blank">eric.nelson@boundarydevices.<u></u>com</a>&gt;<br>
+Date: Mon, 12 Aug 2013 11:54:05 -0700<br>
+Subject: [PATCH] QWSLock: Only destroy semaphores in process owner<br>
+<br>
+This fixes the case when QT_POSIX_IPC is not defined.<br>
+<br>
+Original patch by Neil Jerram for the OpenMoko project:<br>
+ =A0 =A0 =A0 <a href=3D"http://lists.openmoko.org/pipermail/community/2012=
-November/067806.html" target=3D"_blank">http://lists.openmoko.org/<u></u>p=
ipermail/community/2012-<u></u>November/067806.html</a><br>
+<br>
+See also Bug 31254:<br>
+ =A0 =A0 =A0 <a href=3D"https://bugreports.qt-project.org/browse/QTBUG-312=
54" target=3D"_blank">https://bugreports.qt-project.<u></u>org/browse/QTBUG=
-31254</a><br>
+<br>
+Signed-off-by: Eric Nelson &lt;<a href=3D"mailto:eric.nelson@boundarydevic=
es.com" target=3D"_blank">eric.nelson@boundarydevices.<u></u>com</a>&gt;<br=
>
+---<br>
+ src/gui/embedded/qwslock.cpp | 13 +++++++++----<br>
+ src/gui/embedded/qwslock_p.h | =A02 +-<br>
+ 2 files changed, 10 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/src/gui/embedded/qwslock.cpp b/src/gui/embedded/qwslock.cpp<b=
r>
+index 3f8f306..cd6a48d 100644<br>
+--- a/src/gui/embedded/qwslock.cpp<br>
++++ b/src/gui/embedded/qwslock.cpp<br>
+@@ -83,9 +83,12 @@ QWSLock::QWSLock(int id) : semId(id)<br>
+ =A0 =A0 QWSSignalHandler::instance()-&gt;<u></u>addWSLock(this);<br>
+ #endif<br>
+<br>
++ =A0 =A0owned =3D false;<br>
++<br>
+ #ifndef QT_POSIX_IPC<br>
+ =A0 =A0 if (semId =3D=3D -1) {<br>
+ =A0 =A0 =A0 =A0 semId =3D semget(IPC_PRIVATE, 3, IPC_CREAT | 0666);<br>
++ =A0 =A0 =A0 =A0owned =3D true;<br>
+ =A0 =A0 =A0 =A0 if (semId =3D=3D -1) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 perror(&quot;QWSLock::QWSLock&quot;);<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 qFatal(&quot;Unable to create semaphore&quot;);<b=
r>
+@@ -100,7 +103,6 @@ QWSLock::QWSLock(int id) : semId(id)<br>
+ =A0 =A0 }<br>
+ #else<br>
+ =A0 =A0 sems[0] =3D sems[1] =3D sems[2] =3D SEM_FAILED;<br>
+- =A0 =A0owned =3D false;<br>
+<br>
+ =A0 =A0 if (semId =3D=3D -1) {<br>
+ =A0 =A0 =A0 =A0 // ### generate really unique IDs<br>
+@@ -134,9 +136,12 @@ QWSLock::~QWSLock()<br>
+<br>
+ =A0 =A0 if (semId !=3D -1) {<br>
+ #ifndef QT_POSIX_IPC<br>
+- =A0 =A0 =A0 =A0qt_semun semval;<br>
+- =A0 =A0 =A0 =A0semval.val =3D 0;<br>
+- =A0 =A0 =A0 =A0semctl(semId, 0, IPC_RMID, semval);<br>
++<br>
++ =A0 =A0 =A0 =A0if (owned) {<br>
++ =A0 =A0 =A0 =A0 =A0 =A0qt_semun semval;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0semval.val =3D 0;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0semctl(semId, 0, IPC_RMID, semval);<br>
++ =A0 =A0 =A0 =A0}<br>
+ =A0 =A0 =A0 =A0 semId =3D -1;<br>
+ #else<br>
+ =A0 =A0 =A0 =A0 // emulate the SEM_UNDO behavior for the BackingStore loc=
k<br>
+diff --git a/src/gui/embedded/qwslock_p.h b/src/gui/embedded/qwslock_p.h<b=
r>
+index ead7b89..d16b3d5 100644<br>
+--- a/src/gui/embedded/qwslock_p.h<br>
++++ b/src/gui/embedded/qwslock_p.h<br>
+@@ -86,8 +86,8 @@ private:<br>
+ =A0 =A0 int lockCount[2];<br>
+ #ifdef QT_POSIX_IPC<br>
+ =A0 =A0 sem_t *sems[3];<br>
+- =A0 =A0bool owned;<br>
+ #endif<br>
++ =A0 =A0bool owned;<br>
+ };<br>
+<br>
+ QT_END_NAMESPACE<br>
+--<br>
+1.8.1.2<br>
+<br>
<br>
</blockquote></div></div><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/<u></u>mailman/listinfo/o=
penembedded-<u></u>core</a><br>
</div></div></blockquote></div><br></div>

--047d7bd6b3aab5daf604e4b65791--
