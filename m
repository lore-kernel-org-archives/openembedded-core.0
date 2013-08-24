Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0F65460846
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 19:28:48 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id fz6so1924934pac.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 12:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Xzf5mTGxTandfEhxQqVvFUTyyd3HzcSUoxiYPvPCNLI=;
	b=m0FKTGyT/vkTpW2fzeGQAlMEylTH3Zsu5GO1+we0ZExRCvpy+cJsGfzKUK6zXcE1Qj
	+U9+u6qy+MH9bB0b6s5IFB6uOwxLqRZlRqzdRZyM+LbZGbeSmbYQiKqQRItJWxPh9iSg
	a/Oj0dzbZCFQvCyhFeexkCaJu3+S1pjNX/RWZmUcpHhJz+zeHTQ+T8R2olxzvdF2vFpx
	9+iqorL6+P6KlkTed+xSG4Kwopim6aFD3QuJfE9i32ar0uV8VEypVmi3oET+KQLGvbbE
	iYbQzLTCFxwuK35H5QMJFFgrq4sn4CRt1rBKGoxCpPMfesF6ZsqWStSSoKLRpuh0HjYL
	Q70A==
X-Gm-Message-State: ALoCoQn9FjE856CdoJSy4tCqHohA0IDjlcfpQ1jnVCBZ5m/8VOHlL823eomfIYhNWC0419iR7elo
MIME-Version: 1.0
X-Received: by 10.68.219.33 with SMTP id pl1mr6296459pbc.147.1377372528965;
	Sat, 24 Aug 2013 12:28:48 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Sat, 24 Aug 2013 12:28:48 -0700 (PDT)
In-Reply-To: <52190895.3010208@boundarydevices.com>
References: <1377362952-29061-1-git-send-email-eric.nelson@boundarydevices.com>
	<521905BF.4010908@linux.intel.com>
	<CAOMwXhOGuSNGHJogiDewqnd-_-JtahNwb6xxDPO3fgnkXNTGnw@mail.gmail.com>
	<52190895.3010208@boundarydevices.com>
Date: Sat, 24 Aug 2013 20:28:48 +0100
X-Google-Sender-Auth: X1cHE1PgE5oZOqsWl5r2rO9gk8k
Message-ID: <CAOMwXhM+U5gQvgKcPXoovsxuCTfhKqb+PBH_F85j9v0KksuE=g@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Eric Nelson <eric.nelson@boundarydevices.com>
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
X-List-Received-Date: Sat, 24 Aug 2013 19:28:48 -0000
Content-Type: multipart/alternative; boundary=047d7b2edb25500d3b04e4b68894

--047d7b2edb25500d3b04e4b68894
Content-Type: text/plain; charset=ISO-8859-1

Well, you should ask upstream about it... maybe it ended up in a decision
it is the wrong way, and something better went in, or being planned to go
in. I think a change should not be integrated like this in grey area.


On Sat, Aug 24, 2013 at 8:25 PM, Eric Nelson <
eric.nelson@boundarydevices.com> wrote:

> Hi Laszlo,
>
>
> On 08/24/2013 12:15 PM, Laszlo Papp wrote:
>
>> This is strange. According to the bugtracker it should be in 4.8.5
>> already... and the recipe seems to be about 4.8.5. It needs more
>> investigation.
>>
>>
> I saw this, but there's no evidence that any change was committed
> and I verified that the bug is still there (it's trivially easy to
> reproduce) and that this patch fixes it.
>
>
>> On Sat, Aug 24, 2013 at 8:13 PM, Saul Wold <sgw@linux.intel.com
>> <mailto:sgw@linux.intel.com>> wrote:
>>
>>     On 08/24/2013 09:49 AM, Eric Nelson wrote:
>>
>>         This patch adds a patch for Qt-Embedded to only
>>         destroy semaphores in the process which created
>>         them.
>>
>>         Original patch by Neil Jerram for the OpenMoko project:
>>         http://lists.openmoko.org/__**pipermail/community/2012-__**
>> November/067806.html<http://lists.openmoko.org/__pipermail/community/2012-__November/067806.html>
>>
>>         <http://lists.openmoko.org/**pipermail/community/2012-**
>> November/067806.html<http://lists.openmoko.org/pipermail/community/2012-November/067806.html>
>> >
>>
>>         See also Bug 31254:
>>         https://bugreports.qt-project.**__org/browse/QTBUG-31254
>>         <https://bugreports.qt-**project.org/browse/QTBUG-31254<https://bugreports.qt-project.org/browse/QTBUG-31254>
>> **>
>>
>>         Signed-off-by: Eric Nelson <eric.nelson@boundarydevices._**_com
>>         <mailto:eric.nelson@**boundarydevices.com<eric.nelson@boundarydevices.com>
>> >>
>>
>>
>>     Besides this, we need an Upstream-Status: Tag, this is either a
>>     Backport or Submitted maybe?
>>
>>
> I submitted a patch, but haven't received any feedback from the Qt'ers:
>         https://codereview.qt-project.**org/#change,62842<https://codereview.qt-project.org/#change,62842>
>
> Should I re-send with Upstream-Status: tag and a reference?
>
>      Sau!
>>
>>
>>         ---
>>            meta/recipes-qt/qt4/qt4-4.8.5.**__inc                  |  1 +
>>            ...-Only-destroy-semaphores-__**in-process-owner.patch | 77
>>
>>         ++++++++++++++++++++++
>>            2 files changed, 78 insertions(+)
>>            create mode 100644
>>         meta/recipes-qt/qt4/qt4-4.8.5/**__0028-QWSLock-Only-destroy-__**
>> semaphores-in-process-owner.__**patch
>>
>>         diff --git a/meta/recipes-qt/qt4/qt4-4.8.**__5.inc
>>         b/meta/recipes-qt/qt4/qt4-4.8.**__5.inc
>>         index 95a14f3..be16bff 100644
>>         --- a/meta/recipes-qt/qt4/qt4-4.8.**__5.inc
>>         +++ b/meta/recipes-qt/qt4/qt4-4.8.**__5.inc
>>
>>         @@ -24,6 +24,7 @@ SRC_URI =
>>         "http://download.qt-project.__**org/official_releases/qt/4.8/$**
>> __{PV}/qt-ever
>>         <http://download.qt-project.**org/official_releases/qt/4.8/$**
>> %7BPV%7D/qt-ever<http://download.qt-project.org/official_releases/qt/4.8/$%7BPV%7D/qt-ever>
>> >
>>
>>           file://0022-Fix-drawing-of-0-_**_width-polylines-from-outside-*
>> *__the-de.patch \
>>
>>           file://0023-QHttpMultiPart-__**fix-data-corruption-in-__**readData-metho.patch
>> \
>>
>>           file://0027-tools.pro-disable-**__qmeegographicssystemhelper._*
>> *_patch \
>>         +
>>         file://0028-QWSLock-Only-__**destroy-semaphores-in-process-**
>> __owner.patch
>>
>>         \
>>                       file://g++.conf \
>>                       file://linux.conf \
>>                       "
>>         diff --git
>>         a/meta/recipes-qt/qt4/qt4-4.8.**__5/0028-QWSLock-Only-destroy-**
>> __semaphores-in-process-owner.**__patch
>>         b/meta/recipes-qt/qt4/qt4-4.8.**__5/0028-QWSLock-Only-destroy-**
>> __semaphores-in-process-owner.**__patch
>>
>>         new file mode 100644
>>         index 0000000..d67a746
>>         --- /dev/null
>>         +++
>>         b/meta/recipes-qt/qt4/qt4-4.8.**__5/0028-QWSLock-Only-destroy-**
>> __semaphores-in-process-owner.**__patch
>>         @@ -0,0 +1,77 @@
>>         +From 9af565935d16ecf8a8c04b5ea850dd**__b34a7c1294 Mon Sep 17
>>         00:00:00 2001
>>         +From: Eric Nelson <eric.nelson@boundarydevices._**_com
>>         <mailto:eric.nelson@**boundarydevices.com<eric.nelson@boundarydevices.com>
>> >>
>>
>>         +Date: Mon, 12 Aug 2013 11:54:05 -0700
>>         +Subject: [PATCH] QWSLock: Only destroy semaphores in process
>> owner
>>         +
>>         +This fixes the case when QT_POSIX_IPC is not defined.
>>         +
>>         +Original patch by Neil Jerram for the OpenMoko project:
>>         +
>>         http://lists.openmoko.org/__**pipermail/community/2012-__**
>> November/067806.html<http://lists.openmoko.org/__pipermail/community/2012-__November/067806.html>
>>
>>         <http://lists.openmoko.org/**pipermail/community/2012-**
>> November/067806.html<http://lists.openmoko.org/pipermail/community/2012-November/067806.html>
>> >
>>         +
>>         +See also Bug 31254:
>>         + https://bugreports.qt-project.**__org/browse/QTBUG-31254
>>         <https://bugreports.qt-**project.org/browse/QTBUG-31254<https://bugreports.qt-project.org/browse/QTBUG-31254>
>> **>
>>         +
>>         +Signed-off-by: Eric Nelson <eric.nelson@boundarydevices._**_com
>>         <mailto:eric.nelson@**boundarydevices.com<eric.nelson@boundarydevices.com>
>> >>
>>
>>         +---
>>         + src/gui/embedded/qwslock.cpp | 13 +++++++++----
>>         + src/gui/embedded/qwslock_p.h |  2 +-
>>         + 2 files changed, 10 insertions(+), 5 deletions(-)
>>         +
>>         +diff --git a/src/gui/embedded/qwslock.cpp
>>         b/src/gui/embedded/qwslock.cpp
>>         +index 3f8f306..cd6a48d 100644
>>         +--- a/src/gui/embedded/qwslock.cpp
>>         ++++ b/src/gui/embedded/qwslock.cpp
>>         +@@ -83,9 +83,12 @@ QWSLock::QWSLock(int id) : semId(id)
>>         +     QWSSignalHandler::instance()->**__addWSLock(this);
>>
>>         + #endif
>>         +
>>         ++    owned = false;
>>         ++
>>         + #ifndef QT_POSIX_IPC
>>         +     if (semId == -1) {
>>         +         semId = semget(IPC_PRIVATE, 3, IPC_CREAT | 0666);
>>         ++        owned = true;
>>         +         if (semId == -1) {
>>         +             perror("QWSLock::QWSLock");
>>         +             qFatal("Unable to create semaphore");
>>         +@@ -100,7 +103,6 @@ QWSLock::QWSLock(int id) : semId(id)
>>         +     }
>>         + #else
>>         +     sems[0] = sems[1] = sems[2] = SEM_FAILED;
>>         +-    owned = false;
>>         +
>>         +     if (semId == -1) {
>>         +         // ### generate really unique IDs
>>         +@@ -134,9 +136,12 @@ QWSLock::~QWSLock()
>>         +
>>         +     if (semId != -1) {
>>         + #ifndef QT_POSIX_IPC
>>         +-        qt_semun semval;
>>         +-        semval.val = 0;
>>         +-        semctl(semId, 0, IPC_RMID, semval);
>>         ++
>>         ++        if (owned) {
>>         ++            qt_semun semval;
>>         ++            semval.val = 0;
>>         ++            semctl(semId, 0, IPC_RMID, semval);
>>         ++        }
>>         +         semId = -1;
>>         + #else
>>         +         // emulate the SEM_UNDO behavior for the BackingStore
>> lock
>>         +diff --git a/src/gui/embedded/qwslock_p.h
>>         b/src/gui/embedded/qwslock_p.h
>>         +index ead7b89..d16b3d5 100644
>>         +--- a/src/gui/embedded/qwslock_p.h
>>         ++++ b/src/gui/embedded/qwslock_p.h
>>         +@@ -86,8 +86,8 @@ private:
>>         +     int lockCount[2];
>>         + #ifdef QT_POSIX_IPC
>>         +     sem_t *sems[3];
>>         +-    bool owned;
>>         + #endif
>>         ++    bool owned;
>>         + };
>>         +
>>         + QT_END_NAMESPACE
>>         +--
>>         +1.8.1.2
>>         +
>>
>>     ______________________________**___________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.__open**embedded.org<http://openembedded.org>
>>     <mailto:Openembedded-core@**lists.openembedded.org<Openembedded-core@lists.openembedded.org>
>> >
>>     http://lists.openembedded.org/**__mailman/listinfo/**
>> openembedded-__core<http://lists.openembedded.org/__mailman/listinfo/openembedded-__core>
>>     <http://lists.openembedded.**org/mailman/listinfo/**openembedded-core<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>> >
>>
>>
>>
>

--047d7b2edb25500d3b04e4b68894
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Well, you should ask upstream about it... maybe it ended u=
p in a decision it is the wrong way, and something better went in, or being=
 planned to go in. I think a change should not be integrated like this in g=
rey area.</div>
<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Sat, Aug 2=
4, 2013 at 8:25 PM, Eric Nelson <span dir=3D"ltr">&lt;<a href=3D"mailto:eri=
c.nelson@boundarydevices.com" target=3D"_blank">eric.nelson@boundarydevices=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Laszlo,<div class=3D"im"><br>
<br>
On 08/24/2013 12:15 PM, Laszlo Papp wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This is strange. According to the bugtracker it should be in 4.8.5<br>
already... and the recipe seems to be about 4.8.5. It needs more<br>
investigation.<br>
<br>
</blockquote>
<br></div>
I saw this, but there&#39;s no evidence that any change was committed<br>
and I verified that the bug is still there (it&#39;s trivially easy to<br>
reproduce) and that this patch fixes it.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">
<br>
On Sat, Aug 24, 2013 at 8:13 PM, Saul Wold &lt;<a href=3D"mailto:sgw@linux.=
intel.com" target=3D"_blank">sgw@linux.intel.com</a><br></div><div class=3D=
"im">
&lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@lin=
ux.intel.com</a>&gt;&gt; wrote:<br>
<br>
=A0 =A0 On 08/24/2013 09:49 AM, Eric Nelson wrote:<br>
<br>
=A0 =A0 =A0 =A0 This patch adds a patch for Qt-Embedded to only<br>
=A0 =A0 =A0 =A0 destroy semaphores in the process which created<br>
=A0 =A0 =A0 =A0 them.<br>
<br>
=A0 =A0 =A0 =A0 Original patch by Neil Jerram for the OpenMoko project:<br>=
</div>
=A0 =A0 =A0 =A0 <a href=3D"http://lists.openmoko.org/__pipermail/community/=
2012-__November/067806.html" target=3D"_blank">http://lists.openmoko.org/__=
<u></u>pipermail/community/2012-__<u></u>November/067806.html</a><div class=
=3D"im"><br>

=A0 =A0 =A0 =A0 &lt;<a href=3D"http://lists.openmoko.org/pipermail/communit=
y/2012-November/067806.html" target=3D"_blank">http://lists.openmoko.org/<u=
></u>pipermail/community/2012-<u></u>November/067806.html</a>&gt;<br>
<br>
=A0 =A0 =A0 =A0 See also Bug 31254:<br></div>
=A0 =A0 =A0 =A0 <a href=3D"https://bugreports.qt-project." target=3D"_blank=
">https://bugreports.qt-project.</a><u></u>__org/browse/QTBUG-31254<br>
=A0 =A0 =A0 =A0 &lt;<a href=3D"https://bugreports.qt-project.org/browse/QTB=
UG-31254" target=3D"_blank">https://bugreports.qt-<u></u>project.org/browse=
/QTBUG-31254</a><u></u>&gt;<br>
<br>
=A0 =A0 =A0 =A0 Signed-off-by: Eric Nelson &lt;eric.nelson@boundarydevices.=
_<u></u>_com<br>
=A0 =A0 =A0 =A0 &lt;mailto:<a href=3D"mailto:eric.nelson@boundarydevices.co=
m" target=3D"_blank">eric.nelson@<u></u>boundarydevices.com</a>&gt;&gt;<div=
 class=3D"im"><br>
<br>
=A0 =A0 Besides this, we need an Upstream-Status: Tag, this is either a<br>
=A0 =A0 Backport or Submitted maybe?<br>
<br>
</div></blockquote>
<br>
I submitted a patch, but haven&#39;t received any feedback from the Qt&#39;=
ers:<br>
=A0 =A0 =A0 =A0 <a href=3D"https://codereview.qt-project.org/#change,62842"=
 target=3D"_blank">https://codereview.qt-project.<u></u>org/#change,62842</=
a><br>
<br>
Should I re-send with Upstream-Status: tag and a reference?<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=A0 =A0 Sau!<br>
<br>
<br>
=A0 =A0 =A0 =A0 ---<br>
=A0 =A0 =A0 =A0 =A0 =A0meta/recipes-qt/qt4/qt4-4.8.5.<u></u>__inc =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0| =A01 +<br>
=A0 =A0 =A0 =A0 =A0 =A0...-Only-destroy-semaphores-__<u></u>in-process-owne=
r.patch | 77<div class=3D"im"><br>
=A0 =A0 =A0 =A0 ++++++++++++++++++++++<br>
=A0 =A0 =A0 =A0 =A0 =A02 files changed, 78 insertions(+)<br>
=A0 =A0 =A0 =A0 =A0 =A0create mode 100644<br></div>
=A0 =A0 =A0 =A0 meta/recipes-qt/qt4/qt4-4.8.5/<u></u>__0028-QWSLock-Only-de=
stroy-__<u></u>semaphores-in-process-owner.__<u></u>patch<br>
<br>
=A0 =A0 =A0 =A0 diff --git a/meta/recipes-qt/qt4/qt4-4.8.<u></u>__5.inc<br>
=A0 =A0 =A0 =A0 b/meta/recipes-qt/qt4/qt4-4.8.<u></u>__5.inc<br>
=A0 =A0 =A0 =A0 index 95a14f3..be16bff 100644<br>
=A0 =A0 =A0 =A0 --- a/meta/recipes-qt/qt4/qt4-4.8.<u></u>__5.inc<br>
=A0 =A0 =A0 =A0 +++ b/meta/recipes-qt/qt4/qt4-4.8.<u></u>__5.inc<div class=
=3D"im"><br>
=A0 =A0 =A0 =A0 @@ -24,6 +24,7 @@ SRC_URI =3D<br></div>
=A0 =A0 =A0 =A0 &quot;<a href=3D"http://download.qt-project." target=3D"_bl=
ank">http://download.qt-project.</a>__<u></u>org/official_releases/qt/4.8/$=
<u></u>__{PV}/qt-ever<br>
=A0 =A0 =A0 =A0 &lt;<a href=3D"http://download.qt-project.org/official_rele=
ases/qt/4.8/$%7BPV%7D/qt-ever" target=3D"_blank">http://download.qt-project=
.<u></u>org/official_releases/qt/4.8/$<u></u>%7BPV%7D/qt-ever</a>&gt;<br>
<br>
=A0 =A0 =A0 =A0 =A0 file://0022-Fix-drawing-of-0-_<u></u>_width-polylines-f=
rom-outside-<u></u>__the-de.patch \<br>
<br>
=A0 =A0 =A0 =A0 =A0 file://0023-QHttpMultiPart-__<u></u>fix-data-corruption=
-in-__<u></u>readData-metho.patch \<br>
<br>
=A0 =A0 =A0 =A0 =A0 file://0027-tools.pro-disable-<u></u>__qmeegographicssy=
stemhelper._<u></u>_patch \<br>
=A0 =A0 =A0 =A0 +<br>
=A0 =A0 =A0 =A0 file://0028-QWSLock-Only-__<u></u>destroy-semaphores-in-pro=
cess-<u></u>__owner.patch<div class=3D"im"><br>
=A0 =A0 =A0 =A0 \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://g++.conf \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://linux.conf \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
=A0 =A0 =A0 =A0 diff --git<br></div>
=A0 =A0 =A0 =A0 a/meta/recipes-qt/qt4/qt4-4.8.<u></u>__5/0028-QWSLock-Only-=
destroy-<u></u>__semaphores-in-process-owner.<u></u>__patch<br>
=A0 =A0 =A0 =A0 b/meta/recipes-qt/qt4/qt4-4.8.<u></u>__5/0028-QWSLock-Only-=
destroy-<u></u>__semaphores-in-process-owner.<u></u>__patch<div class=3D"im=
"><br>
=A0 =A0 =A0 =A0 new file mode 100644<br>
=A0 =A0 =A0 =A0 index 0000000..d67a746<br>
=A0 =A0 =A0 =A0 --- /dev/null<br>
=A0 =A0 =A0 =A0 +++<br></div>
=A0 =A0 =A0 =A0 b/meta/recipes-qt/qt4/qt4-4.8.<u></u>__5/0028-QWSLock-Only-=
destroy-<u></u>__semaphores-in-process-owner.<u></u>__patch<br>
=A0 =A0 =A0 =A0 @@ -0,0 +1,77 @@<br>
=A0 =A0 =A0 =A0 +From 9af565935d16ecf8a8c04b5ea850dd<u></u>__b34a7c1294 Mon=
 Sep 17<br>
=A0 =A0 =A0 =A0 00:00:00 2001<br>
=A0 =A0 =A0 =A0 +From: Eric Nelson &lt;eric.nelson@boundarydevices._<u></u>=
_com<br>
=A0 =A0 =A0 =A0 &lt;mailto:<a href=3D"mailto:eric.nelson@boundarydevices.co=
m" target=3D"_blank">eric.nelson@<u></u>boundarydevices.com</a>&gt;&gt;<div=
 class=3D"im"><br>
=A0 =A0 =A0 =A0 +Date: Mon, 12 Aug 2013 11:54:05 -0700<br>
=A0 =A0 =A0 =A0 +Subject: [PATCH] QWSLock: Only destroy semaphores in proce=
ss owner<br>
=A0 =A0 =A0 =A0 +<br>
=A0 =A0 =A0 =A0 +This fixes the case when QT_POSIX_IPC is not defined.<br>
=A0 =A0 =A0 =A0 +<br>
=A0 =A0 =A0 =A0 +Original patch by Neil Jerram for the OpenMoko project:<br=
>
=A0 =A0 =A0 =A0 +<br></div>
=A0 =A0 =A0 =A0 <a href=3D"http://lists.openmoko.org/__pipermail/community/=
2012-__November/067806.html" target=3D"_blank">http://lists.openmoko.org/__=
<u></u>pipermail/community/2012-__<u></u>November/067806.html</a><div class=
=3D"im"><br>

=A0 =A0 =A0 =A0 &lt;<a href=3D"http://lists.openmoko.org/pipermail/communit=
y/2012-November/067806.html" target=3D"_blank">http://lists.openmoko.org/<u=
></u>pipermail/community/2012-<u></u>November/067806.html</a>&gt;<br>
=A0 =A0 =A0 =A0 +<br>
=A0 =A0 =A0 =A0 +See also Bug 31254:<br></div>
=A0 =A0 =A0 =A0 + <a href=3D"https://bugreports.qt-project." target=3D"_bla=
nk">https://bugreports.qt-project.</a><u></u>__org/browse/QTBUG-31254<br>
=A0 =A0 =A0 =A0 &lt;<a href=3D"https://bugreports.qt-project.org/browse/QTB=
UG-31254" target=3D"_blank">https://bugreports.qt-<u></u>project.org/browse=
/QTBUG-31254</a><u></u>&gt;<br>
=A0 =A0 =A0 =A0 +<br>
=A0 =A0 =A0 =A0 +Signed-off-by: Eric Nelson &lt;eric.nelson@boundarydevices=
._<u></u>_com<br>
=A0 =A0 =A0 =A0 &lt;mailto:<a href=3D"mailto:eric.nelson@boundarydevices.co=
m" target=3D"_blank">eric.nelson@<u></u>boundarydevices.com</a>&gt;&gt;<div=
 class=3D"im"><br>
=A0 =A0 =A0 =A0 +---<br>
=A0 =A0 =A0 =A0 + src/gui/embedded/qwslock.cpp | 13 +++++++++----<br>
=A0 =A0 =A0 =A0 + src/gui/embedded/qwslock_p.h | =A02 +-<br>
=A0 =A0 =A0 =A0 + 2 files changed, 10 insertions(+), 5 deletions(-)<br>
=A0 =A0 =A0 =A0 +<br>
=A0 =A0 =A0 =A0 +diff --git a/src/gui/embedded/qwslock.cpp<br>
=A0 =A0 =A0 =A0 b/src/gui/embedded/qwslock.cpp<br>
=A0 =A0 =A0 =A0 +index 3f8f306..cd6a48d 100644<br>
=A0 =A0 =A0 =A0 +--- a/src/gui/embedded/qwslock.cpp<br>
=A0 =A0 =A0 =A0 ++++ b/src/gui/embedded/qwslock.cpp<br>
=A0 =A0 =A0 =A0 +@@ -83,9 +83,12 @@ QWSLock::QWSLock(int id) : semId(id)<br=
></div>
=A0 =A0 =A0 =A0 + =A0 =A0 QWSSignalHandler::instance()-&gt;<u></u>__addWSLo=
ck(this);<div><div class=3D"h5"><br>
=A0 =A0 =A0 =A0 + #endif<br>
=A0 =A0 =A0 =A0 +<br>
=A0 =A0 =A0 =A0 ++ =A0 =A0owned =3D false;<br>
=A0 =A0 =A0 =A0 ++<br>
=A0 =A0 =A0 =A0 + #ifndef QT_POSIX_IPC<br>
=A0 =A0 =A0 =A0 + =A0 =A0 if (semId =3D=3D -1) {<br>
=A0 =A0 =A0 =A0 + =A0 =A0 =A0 =A0 semId =3D semget(IPC_PRIVATE, 3, IPC_CREA=
T | 0666);<br>
=A0 =A0 =A0 =A0 ++ =A0 =A0 =A0 =A0owned =3D true;<br>
=A0 =A0 =A0 =A0 + =A0 =A0 =A0 =A0 if (semId =3D=3D -1) {<br>
=A0 =A0 =A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 perror(&quot;QWSLock::QWSLock&quo=
t;);<br>
=A0 =A0 =A0 =A0 + =A0 =A0 =A0 =A0 =A0 =A0 qFatal(&quot;Unable to create sem=
aphore&quot;);<br>
=A0 =A0 =A0 =A0 +@@ -100,7 +103,6 @@ QWSLock::QWSLock(int id) : semId(id)<b=
r>
=A0 =A0 =A0 =A0 + =A0 =A0 }<br>
=A0 =A0 =A0 =A0 + #else<br>
=A0 =A0 =A0 =A0 + =A0 =A0 sems[0] =3D sems[1] =3D sems[2] =3D SEM_FAILED;<b=
r>
=A0 =A0 =A0 =A0 +- =A0 =A0owned =3D false;<br>
=A0 =A0 =A0 =A0 +<br>
=A0 =A0 =A0 =A0 + =A0 =A0 if (semId =3D=3D -1) {<br>
=A0 =A0 =A0 =A0 + =A0 =A0 =A0 =A0 // ### generate really unique IDs<br>
=A0 =A0 =A0 =A0 +@@ -134,9 +136,12 @@ QWSLock::~QWSLock()<br>
=A0 =A0 =A0 =A0 +<br>
=A0 =A0 =A0 =A0 + =A0 =A0 if (semId !=3D -1) {<br>
=A0 =A0 =A0 =A0 + #ifndef QT_POSIX_IPC<br>
=A0 =A0 =A0 =A0 +- =A0 =A0 =A0 =A0qt_semun semval;<br>
=A0 =A0 =A0 =A0 +- =A0 =A0 =A0 =A0semval.val =3D 0;<br>
=A0 =A0 =A0 =A0 +- =A0 =A0 =A0 =A0semctl(semId, 0, IPC_RMID, semval);<br>
=A0 =A0 =A0 =A0 ++<br>
=A0 =A0 =A0 =A0 ++ =A0 =A0 =A0 =A0if (owned) {<br>
=A0 =A0 =A0 =A0 ++ =A0 =A0 =A0 =A0 =A0 =A0qt_semun semval;<br>
=A0 =A0 =A0 =A0 ++ =A0 =A0 =A0 =A0 =A0 =A0semval.val =3D 0;<br>
=A0 =A0 =A0 =A0 ++ =A0 =A0 =A0 =A0 =A0 =A0semctl(semId, 0, IPC_RMID, semval=
);<br>
=A0 =A0 =A0 =A0 ++ =A0 =A0 =A0 =A0}<br>
=A0 =A0 =A0 =A0 + =A0 =A0 =A0 =A0 semId =3D -1;<br>
=A0 =A0 =A0 =A0 + #else<br>
=A0 =A0 =A0 =A0 + =A0 =A0 =A0 =A0 // emulate the SEM_UNDO behavior for the =
BackingStore lock<br>
=A0 =A0 =A0 =A0 +diff --git a/src/gui/embedded/qwslock_p.h<br>
=A0 =A0 =A0 =A0 b/src/gui/embedded/qwslock_p.h<br>
=A0 =A0 =A0 =A0 +index ead7b89..d16b3d5 100644<br>
=A0 =A0 =A0 =A0 +--- a/src/gui/embedded/qwslock_p.h<br>
=A0 =A0 =A0 =A0 ++++ b/src/gui/embedded/qwslock_p.h<br>
=A0 =A0 =A0 =A0 +@@ -86,8 +86,8 @@ private:<br>
=A0 =A0 =A0 =A0 + =A0 =A0 int lockCount[2];<br>
=A0 =A0 =A0 =A0 + #ifdef QT_POSIX_IPC<br>
=A0 =A0 =A0 =A0 + =A0 =A0 sem_t *sems[3];<br>
=A0 =A0 =A0 =A0 +- =A0 =A0bool owned;<br>
=A0 =A0 =A0 =A0 + #endif<br>
=A0 =A0 =A0 =A0 ++ =A0 =A0bool owned;<br>
=A0 =A0 =A0 =A0 + };<br>
=A0 =A0 =A0 =A0 +<br>
=A0 =A0 =A0 =A0 + QT_END_NAMESPACE<br>
=A0 =A0 =A0 =A0 +--<br>
=A0 =A0 =A0 =A0 +1.8.1.2<br>
=A0 =A0 =A0 =A0 +<br>
<br></div></div>
=A0 =A0 ______________________________<u></u>___________________<br>
=A0 =A0 Openembedded-core mailing list<br>
=A0 =A0 Openembedded-core@lists.__<a href=3D"http://openembedded.org" targe=
t=3D"_blank">open<u></u>embedded.org</a><br>
=A0 =A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembedded.o=
rg" target=3D"_blank">Openembedded-core@<u></u>lists.openembedded.org</a>&g=
t;<br>
=A0 =A0 <a href=3D"http://lists.openembedded.org/__mailman/listinfo/openemb=
edded-__core" target=3D"_blank">http://lists.openembedded.org/<u></u>__mail=
man/listinfo/<u></u>openembedded-__core</a><br>
=A0 =A0 &lt;<a href=3D"http://lists.openembedded.org/mailman/listinfo/opene=
mbedded-core" target=3D"_blank">http://lists.openembedded.<u></u>org/mailma=
n/listinfo/<u></u>openembedded-core</a>&gt;<br>
<br>
<br>
</blockquote>
<br>
</blockquote></div><br></div>

--047d7b2edb25500d3b04e4b68894--
