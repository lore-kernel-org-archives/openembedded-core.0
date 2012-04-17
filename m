Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SK64P-0007ZD-KD
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 12:55:37 +0200
Received: by wgbdr12 with SMTP id dr12so5183991wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 03:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=oEt8DL//JPPyQMmsl9iofI5M+v5MMBdJdffhAj1sS74=;
	b=UMDkUowaVZ6BsVMAFbjMobmp2OcvPbPdu+4O1omEV7+aR74r0dMnD6Gw3PAWPtn1b+
	cOwZZ0+IwGcnSvRa5UMdnmSPZ9KyWFNRXO48CVYNmZBJSOPBmPxx5G4C4KVYIkyRyFOq
	t58PqVk3mZXtKzVONXAUJGOucmK4Y40JU5k/CWn3b8JbTdEnGSmBhQlVfzfmpCGFuIrZ
	yLQo9nvHFHHtjveFr2rbRvBhwArkKPIhXgPsiWTb8o5p3rE4TPeA8lN++/mUEwgUGh8J
	VG/YXHtDFamDPPYlQFe084jbxiqJ21gY160f/FWx3Lkj8+24HjrZqmPizgXQvOHY/9rv
	kV9g==
Received: by 10.216.135.20 with SMTP id t20mr8307113wei.99.1334659571730;
	Tue, 17 Apr 2012 03:46:11 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o2sm42063562wiv.11.2012.04.17.03.46.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 03:46:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334659475.616.73.camel@ted>
Date: Tue, 17 Apr 2012 12:46:08 +0200
Message-Id: <E85A0A1A-D863-4955-987D-CB53E7CF4FBA@dominion.thruhere.net>
References: <1332618407-30816-1-git-send-email-obi@opendreambox.org>
	<F744A0A9-A640-4453-8119-18D2DF60364E@dominion.thruhere.net>
	<1334659475.616.73.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmy/Cxxyff6Y4NRmYkuN7U2UpnqDNXeNc2/DXDtPiIiNd8rOPF1jZ3/5XnHYx7PNLhEyJKD
Subject: Re: [PATCH] busybox: move watch to /usr/bin for compatibility with procps
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
X-List-Received-Date: Tue, 17 Apr 2012 10:55:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 apr. 2012, om 12:44 heeft Richard Purdie het volgende geschreven:

> On Tue, 2012-04-17 at 11:40 +0200, Koen Kooi wrote:
>> Ping
>=20
> It merged three weeks ago:
>=20
> =
http://git.openembedded.org/openembedded-core/commit/?id=3Dfa8b2d2bed63fa4=
fc2af45f094998b0f9e69d272


Weird, I still get the opkg errors about /bin/watch, but that's probably =
a bug in opkg :(

regards,

Koen

>=20
> ?
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>> Op 24 mrt. 2012, om 20:46 heeft Andreas Oberritter het volgende =
geschreven:
>>=20
>>> Commit 68dc2a3fa30c03a196d650de34d0c657a7b85454 broke opkg upgrade:
>>>=20
>>> | update-alternatives: Error: cannot register alternative watch to
>>> | /usr/bin/watch since it is already registered to /bin/watch
>>>=20
>>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>>> ---
>>> * Martin, can you please verify whether this really helps? I've =
built a
>>> rootfs with both busybox watch and procps installed. I didn't =
actually
>>> do an opkg upgrade.
>>>=20
>>> .../busybox/busybox-1.19.4/watch.in.usr-bin.patch  |   29 =
++++++++++++++++++++
>>> meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
>>> 2 files changed, 31 insertions(+), 1 deletions(-)
>>> create mode 100644 =
meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
>>>=20
>>> diff --git =
a/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch =
b/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
>>> new file mode 100644
>>> index 0000000..e8e1edf
>>> --- /dev/null
>>> +++ =
b/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
>>> @@ -0,0 +1,29 @@
>>> +Upstream-Status: Inappropriate [configuration]
>>> +
>>> +=46rom f2372ab626a395d067704f4c318180fb6039de15 Mon Sep 17 00:00:00 =
2001
>>> +From: Andreas Oberritter <obi@opendreambox.org>
>>> +Date: Sat, 24 Mar 2012 17:36:48 +0100
>>> +Subject: [PATCH] watch: move from /bin to /usr/bin for =
compatibility with
>>> + procps
>>> +
>>> +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>>> +---
>>> + include/applets.src.h |    2 +-
>>> + 1 files changed, 1 insertions(+), 1 deletions(-)
>>> +
>>> +diff --git a/include/applets.src.h b/include/applets.src.h
>>> +index 87d9cbb..c148a8c 100644
>>> +--- a/include/applets.src.h
>>> ++++ b/include/applets.src.h
>>> +@@ -404,7 +404,7 @@ IF_VLOCK(APPLET(vlock, BB_DIR_USR_BIN, =
BB_SUID_REQUIRE))
>>> + IF_VOLNAME(APPLET(volname, BB_DIR_USR_BIN, BB_SUID_DROP))
>>> + /* Needs to be run by root or be suid root - needs to write to =
/dev/TTY: */
>>> + IF_WALL(APPLET(wall, BB_DIR_USR_BIN, BB_SUID_REQUIRE))
>>> +-IF_WATCH(APPLET(watch, BB_DIR_BIN, BB_SUID_DROP))
>>> ++IF_WATCH(APPLET(watch, BB_DIR_USR_BIN, BB_SUID_DROP))
>>> + IF_WATCHDOG(APPLET(watchdog, BB_DIR_SBIN, BB_SUID_DROP))
>>> + IF_WC(APPLET(wc, BB_DIR_USR_BIN, BB_SUID_DROP))
>>> + IF_WGET(APPLET(wget, BB_DIR_USR_BIN, BB_SUID_DROP))
>>> +--=20
>>> +1.7.5.4
>>> +
>>> diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb =
b/meta/recipes-core/busybox/busybox_1.19.4.bb
>>> index dff616d..3f22669 100644
>>> --- a/meta/recipes-core/busybox/busybox_1.19.4.bb
>>> +++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
>>> @@ -1,5 +1,5 @@
>>> require busybox.inc
>>> -PR =3D "r0"
>>> +PR =3D "r1"
>>>=20
>>> SRC_URI =3D =
"http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
>>>           file://udhcpscript.patch \
>>> @@ -8,6 +8,7 @@ SRC_URI =3D =
"http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
>>>           file://get_header_tar.patch \
>>>           file://busybox-appletlib-dependency.patch \
>>>           file://run-parts.in.usr-bin.patch \
>>> +           file://watch.in.usr-bin.patch \
>>>           file://busybox-udhcpc-no_deconfig.patch \
>>>           file://find-touchscreen.sh \
>>>           file://busybox-cron \
>>> --=20
>>> 1.7.5.4
>>>=20
>>>=20
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



