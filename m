Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD88E83856
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 05:22:43 +0000 (UTC)
Subject: Re: [openembedded-core] [master] [PATCH] cmake-native: disable libidn2 for native build
To: openembedded-core@lists.openembedded.org
From: "Deepak Rathore" <deeratho@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 16 Feb 2026 21:22:36 -0800
References: <20260212050352.4090817-1-deeratho@cisco.com> <D158E9C9-E6C0-4FD3-939F-E941A85A4FDB@arm.com>
In-Reply-To: <D158E9C9-E6C0-4FD3-939F-E941A85A4FDB@arm.com>
Message-ID: <15866.1771305756039212558@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="7qIxeobZva5tvjKozFiT"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 05:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231228

--7qIxeobZva5tvjKozFiT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

If I don't include this change then I am not able to build cmake-native pac=
kage at my end. I am getting compilation failure with cmake-native package =
as following:

build/tmp/work/x86_64-linux/cmake-native/4.2.3/sources/cmake-4.2.3/Utilitie=
s/cmcurl/lib/idn.c:37:10: fatal error: idn2.h: No such file or directory
37 | #include <idn2.h>
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~
compilation terminated.
make[2]: *** [Utilities/cmcurl/lib/CMakeFiles/cmcurl.dir/build.make:1062: U=
tilities/cmcurl/lib/CMakeFiles/cmcurl.dir/idn.c.o] Error 1
make[2]: *** Waiting for unfinished jobs....
[ 29%] Building C object Utilities/cmcurl/lib/CMakeFiles/cmcurl.dir/llist.c=
.o

And just now, I checked and it is still failed. Are you able to build cmake=
-native package at your end without any failure?

--7qIxeobZva5tvjKozFiT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>If I don't include this change then I am not able to build cmake-nativ=
e package at my end. I am getting compilation failure with cmake-native pac=
kage as following:</div>
<div><br />build/tmp/work/x86_64-linux/cmake-native/4.2.3/sources/cmake-4.2=
.3/Utilities/cmcurl/lib/idn.c:37:10: fatal error: idn2.h: No such file or d=
irectory<br />&nbsp; &nbsp;37 | #include &lt;idn2.h&gt;<br />&nbsp; &nbsp; =
&nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~~~~~~<br />compilation termin=
ated.<br />make[2]: *** [Utilities/cmcurl/lib/CMakeFiles/cmcurl.dir/build.m=
ake:1062: Utilities/cmcurl/lib/CMakeFiles/cmcurl.dir/idn.c.o] Error 1<br />=
make[2]: *** Waiting for unfinished jobs....<br />[ 29%] Building C object =
Utilities/cmcurl/lib/CMakeFiles/cmcurl.dir/llist.c.o</div>
<div>&nbsp;</div>
<div>And just now, I checked and it is still failed. Are you able to build =
cmake-native package at your end without any failure?</div>

--7qIxeobZva5tvjKozFiT--

