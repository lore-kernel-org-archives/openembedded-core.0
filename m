Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1ADCC433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 21:36:35 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 by mx.groups.io with SMTP id smtpd.web11.540.1654032991344672611
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 14:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.194,
 mailfrom: marcel@ziswiler.com)
Received: from toolbox.int.toradex.com ([81.221.243.92]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MRF0r-1oNTQi38IB-00Uboh;
 Tue, 31 May 2022 23:36:28 +0200
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-core@lists.openembedded.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [oe-core][PATCH v2] gstreamer1.0-plugins-bad: add libavtp
 packageconfig
Date: Tue, 31 May 2022 23:36:24 +0200
Message-Id: <20220531213624.7414-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QHFXUwUI18XRzAPiWz9iTogBnfX2U9+Ct+LjxX6x6g+M7usv2pD
 fx1+FbOH2EcD684oeklPrBNQe8hk5CXRjNbl6yTrB0DwTNdhSgrxWAlNCHufGCiljTtnSrw
 IeQilCgz/DYThbRqlZBw3dToCBHc3zJ44TCnUkSL9trrjvdNt0NkbQh/OouCGmlJZyOYGNs
 mA7fUGYyhhiNssoioF5eQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:l9tetYidxAw=:F45+jU9Db4CtJW5UgZY4nI
 pOPaiREr77V58IoHSgtIJVHZY9/FtORNuR9CV6aVEKYxz2xsMDVImns8S25BZmOyMdvenWsFE
 RNmOuaXEg1GlfMEwLPiyJp8nHzzmGd5/gc+Y9V1vDOFDjTLDpTx+lUG7oPfxxs74EW+AwMFmE
 QeDMt8Gu0XrMO0peZku2qLdvVUH/LSohzUATI9EN+MTz+27/zDfE56/hoGVmOipNMhl18emcj
 6vKuliiJIwMrLi/ZYC0HPJMzF+t6ka5b5b4ToCVw1wtKUt7z4dGgoGSofgSUH1rIX8ja7v8JD
 EejWEieRBPiFTzAGmb4caO0+NhGsXINT00kJfzS+MQ4q20+7cNj6gFw4YqHfUulhjrZDmO/3v
 2gL348ndB615s0GmZLVSEL6hkhjzqfKmAEKHfu5TMJ1NadNaKt/97an/Z5nOXj89jJ2u8DbJF
 nvU8v+yQIBabXlQGJyQT0Z2FC+DILEA/xWWRO3RUM1huMjqahnf6qXTHIEOB9AqyPkYlSv61B
 xkTLzIGzkSE/xpqKTN+PL52AeCLHQyDeXly0jOc9OGBMg0mGE+bW4R2uA9cNfF2DvsLZ4Ybdw
 VeZaYbZ85Vz/Ms/verob+1Nm6YsJT1zimHr/Q7b8dXgKZI5x/2CDvhAWgvJ0KbVTI/+BnS3DM
 lL9jg3wKGetFdwP8c5ZGqHSkKJC+m9Q6ziB0KPpvE5PNAAPM2uoRKgAK29snalOy1g8NMIiGh
 4blWyhSg3+88OyfRWdGpeC1pKzdr1bJKp/0pyQ==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 21:36:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166339

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add avtp resp. libavtp PACKAGECONFIG. This allows building them
GStreamer Audio Video Transport Protocol (AVTP) Plugins which rely on
Avnu's libavtp.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---
End-to-end tested on Verdin iMX8M Plus.
Will talk about it at the Embedded World Conference in the TSN & Linux
track next month [1].

[1] https://events.weka-fachmedien.de/embedded-world-conference/program/

Changes in v2:
- Rename avtp to libavtp in the subject to make this more clear.

 .../gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
index bb33e3822e..53c78d4366 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
@@ -35,6 +35,7 @@ PACKAGECONFIG ??= " \
 
 PACKAGECONFIG[aom]             = "-Daom=enabled,-Daom=disabled,aom"
 PACKAGECONFIG[assrender]       = "-Dassrender=enabled,-Dassrender=disabled,libass"
+PACKAGECONFIG[avtp]            = "-Davtp=enabled,-Davtp=disabled,libavtp"
 PACKAGECONFIG[bluez]           = "-Dbluez=enabled,-Dbluez=disabled,bluez5"
 PACKAGECONFIG[bz2]             = "-Dbz2=enabled,-Dbz2=disabled,bzip2"
 PACKAGECONFIG[closedcaption]   = "-Dclosedcaption=enabled,-Dclosedcaption=disabled,pango cairo"
@@ -112,7 +113,6 @@ EXTRA_OEMESON += " \
     -Dandroidmedia=disabled \
     -Dapplemedia=disabled \
     -Dasio=disabled \
-    -Davtp=disabled \
     -Dbs2b=disabled \
     -Dchromaprint=disabled \
     -Dd3dvideosink=disabled \
-- 
2.36.1


