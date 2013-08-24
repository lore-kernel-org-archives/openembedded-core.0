Return-Path: <eric.nelson@boundarydevices.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF6E61013
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 19:25:13 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bg4so1906834pad.18
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 12:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=lWqt7YrT5GvBYkXeAhtX0vTmTjCfNDp62JhibziQCa4=;
	b=jVDmiljBtB0O4cukXA2ZOBRXemu6eu5D8huI9cOfl+jpkSZiFf2shjTISr+xX0PrGE
	/bPRqTMJ4LhsZOxOW6Oiz1B9g3iTbKJjcS2E+4NVURGgtnyfqiqrZaiTpT1yq4v72DWe
	h6Tm6vo1enpYBtjsRIB7WQBUUDyMfVRkfR4+EMgT4WXejxbbqmTRHa5zYs/0QDx1R6LT
	vkB6xNOjWQqoCQ/W/1EavKNGmrougXr+ECoQBhK7t09CQ5hrp9Cr+fUnqiGq1YoS9q8s
	zKunQ7R1nJo5Igke0yfVFSg0T5W1p4kAX3y1NdZM0xR4Hs5yuddsz20MS2LSVRFOWAAE
	kBvw==
X-Gm-Message-State: ALoCoQn3nmmOjP62NVFeSUirnHzrcHeeWsTOElNxyqQ9FRXwPXC/JTLtukJy9t0ELQ7omzjwywJu
X-Received: by 10.66.100.200 with SMTP id fa8mr5590613pab.148.1377372313606;
	Sat, 24 Aug 2013 12:25:13 -0700 (PDT)
Received: from [192.168.1.8] (ip98-167-230-131.ph.ph.cox.net. [98.167.230.131])
	by mx.google.com with ESMTPSA id uw6sm7740593pbc.8.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 24 Aug 2013 12:25:12 -0700 (PDT)
Message-ID: <52190895.3010208@boundarydevices.com>
Date: Sat, 24 Aug 2013 12:25:09 -0700
From: Eric Nelson <eric.nelson@boundarydevices.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Laszlo Papp <lpapp@kde.org>
References: <1377362952-29061-1-git-send-email-eric.nelson@boundarydevices.com>
	<521905BF.4010908@linux.intel.com>
	<CAOMwXhOGuSNGHJogiDewqnd-_-JtahNwb6xxDPO3fgnkXNTGnw@mail.gmail.com>
In-Reply-To: <CAOMwXhOGuSNGHJogiDewqnd-_-JtahNwb6xxDPO3fgnkXNTGnw@mail.gmail.com>
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
X-List-Received-Date: Sat, 24 Aug 2013 19:25:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Laszlo,

On 08/24/2013 12:15 PM, Laszlo Papp wrote:
> This is strange. According to the bugtracker it should be in 4.8.5
> already... and the recipe seems to be about 4.8.5. It needs more
> investigation.
>

I saw this, but there's no evidence that any change was committed
and I verified that the bug is still there (it's trivially easy to
reproduce) and that this patch fixes it.

>
> On Sat, Aug 24, 2013 at 8:13 PM, Saul Wold <sgw@linux.intel.com
> <mailto:sgw@linux.intel.com>> wrote:
>
>     On 08/24/2013 09:49 AM, Eric Nelson wrote:
>
>         This patch adds a patch for Qt-Embedded to only
>         destroy semaphores in the process which created
>         them.
>
>         Original patch by Neil Jerram for the OpenMoko project:
>         http://lists.openmoko.org/__pipermail/community/2012-__November/067806.html
>         <http://lists.openmoko.org/pipermail/community/2012-November/067806.html>
>
>         See also Bug 31254:
>         https://bugreports.qt-project.__org/browse/QTBUG-31254
>         <https://bugreports.qt-project.org/browse/QTBUG-31254>
>
>         Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.__com
>         <mailto:eric.nelson@boundarydevices.com>>
>
>     Besides this, we need an Upstream-Status: Tag, this is either a
>     Backport or Submitted maybe?
>

I submitted a patch, but haven't received any feedback from the Qt'ers:
	https://codereview.qt-project.org/#change,62842

Should I re-send with Upstream-Status: tag and a reference?

>     Sau!
>
>
>         ---
>            meta/recipes-qt/qt4/qt4-4.8.5.__inc                  |  1 +
>            ...-Only-destroy-semaphores-__in-process-owner.patch | 77
>         ++++++++++++++++++++++
>            2 files changed, 78 insertions(+)
>            create mode 100644
>         meta/recipes-qt/qt4/qt4-4.8.5/__0028-QWSLock-Only-destroy-__semaphores-in-process-owner.__patch
>
>         diff --git a/meta/recipes-qt/qt4/qt4-4.8.__5.inc
>         b/meta/recipes-qt/qt4/qt4-4.8.__5.inc
>         index 95a14f3..be16bff 100644
>         --- a/meta/recipes-qt/qt4/qt4-4.8.__5.inc
>         +++ b/meta/recipes-qt/qt4/qt4-4.8.__5.inc
>         @@ -24,6 +24,7 @@ SRC_URI =
>         "http://download.qt-project.__org/official_releases/qt/4.8/$__{PV}/qt-ever
>         <http://download.qt-project.org/official_releases/qt/4.8/$%7BPV%7D/qt-ever>
>
>           file://0022-Fix-drawing-of-0-__width-polylines-from-outside-__the-de.patch \
>
>           file://0023-QHttpMultiPart-__fix-data-corruption-in-__readData-metho.patch \
>
>           file://0027-tools.pro-disable-__qmeegographicssystemhelper.__patch \
>         +
>         file://0028-QWSLock-Only-__destroy-semaphores-in-process-__owner.patch
>         \
>                       file://g++.conf \
>                       file://linux.conf \
>                       "
>         diff --git
>         a/meta/recipes-qt/qt4/qt4-4.8.__5/0028-QWSLock-Only-destroy-__semaphores-in-process-owner.__patch
>         b/meta/recipes-qt/qt4/qt4-4.8.__5/0028-QWSLock-Only-destroy-__semaphores-in-process-owner.__patch
>         new file mode 100644
>         index 0000000..d67a746
>         --- /dev/null
>         +++
>         b/meta/recipes-qt/qt4/qt4-4.8.__5/0028-QWSLock-Only-destroy-__semaphores-in-process-owner.__patch
>         @@ -0,0 +1,77 @@
>         +From 9af565935d16ecf8a8c04b5ea850dd__b34a7c1294 Mon Sep 17
>         00:00:00 2001
>         +From: Eric Nelson <eric.nelson@boundarydevices.__com
>         <mailto:eric.nelson@boundarydevices.com>>
>         +Date: Mon, 12 Aug 2013 11:54:05 -0700
>         +Subject: [PATCH] QWSLock: Only destroy semaphores in process owner
>         +
>         +This fixes the case when QT_POSIX_IPC is not defined.
>         +
>         +Original patch by Neil Jerram for the OpenMoko project:
>         +
>         http://lists.openmoko.org/__pipermail/community/2012-__November/067806.html
>         <http://lists.openmoko.org/pipermail/community/2012-November/067806.html>
>         +
>         +See also Bug 31254:
>         + https://bugreports.qt-project.__org/browse/QTBUG-31254
>         <https://bugreports.qt-project.org/browse/QTBUG-31254>
>         +
>         +Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.__com
>         <mailto:eric.nelson@boundarydevices.com>>
>         +---
>         + src/gui/embedded/qwslock.cpp | 13 +++++++++----
>         + src/gui/embedded/qwslock_p.h |  2 +-
>         + 2 files changed, 10 insertions(+), 5 deletions(-)
>         +
>         +diff --git a/src/gui/embedded/qwslock.cpp
>         b/src/gui/embedded/qwslock.cpp
>         +index 3f8f306..cd6a48d 100644
>         +--- a/src/gui/embedded/qwslock.cpp
>         ++++ b/src/gui/embedded/qwslock.cpp
>         +@@ -83,9 +83,12 @@ QWSLock::QWSLock(int id) : semId(id)
>         +     QWSSignalHandler::instance()->__addWSLock(this);
>         + #endif
>         +
>         ++    owned = false;
>         ++
>         + #ifndef QT_POSIX_IPC
>         +     if (semId == -1) {
>         +         semId = semget(IPC_PRIVATE, 3, IPC_CREAT | 0666);
>         ++        owned = true;
>         +         if (semId == -1) {
>         +             perror("QWSLock::QWSLock");
>         +             qFatal("Unable to create semaphore");
>         +@@ -100,7 +103,6 @@ QWSLock::QWSLock(int id) : semId(id)
>         +     }
>         + #else
>         +     sems[0] = sems[1] = sems[2] = SEM_FAILED;
>         +-    owned = false;
>         +
>         +     if (semId == -1) {
>         +         // ### generate really unique IDs
>         +@@ -134,9 +136,12 @@ QWSLock::~QWSLock()
>         +
>         +     if (semId != -1) {
>         + #ifndef QT_POSIX_IPC
>         +-        qt_semun semval;
>         +-        semval.val = 0;
>         +-        semctl(semId, 0, IPC_RMID, semval);
>         ++
>         ++        if (owned) {
>         ++            qt_semun semval;
>         ++            semval.val = 0;
>         ++            semctl(semId, 0, IPC_RMID, semval);
>         ++        }
>         +         semId = -1;
>         + #else
>         +         // emulate the SEM_UNDO behavior for the BackingStore lock
>         +diff --git a/src/gui/embedded/qwslock_p.h
>         b/src/gui/embedded/qwslock_p.h
>         +index ead7b89..d16b3d5 100644
>         +--- a/src/gui/embedded/qwslock_p.h
>         ++++ b/src/gui/embedded/qwslock_p.h
>         +@@ -86,8 +86,8 @@ private:
>         +     int lockCount[2];
>         + #ifdef QT_POSIX_IPC
>         +     sem_t *sems[3];
>         +-    bool owned;
>         + #endif
>         ++    bool owned;
>         + };
>         +
>         + QT_END_NAMESPACE
>         +--
>         +1.8.1.2
>         +
>
>     _________________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.__openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/__mailman/listinfo/openembedded-__core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


