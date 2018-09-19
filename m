Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5E903794EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 10:27:58 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id r37-v6so4574319qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 03:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ca+wb/H0r1wwHpFfXS/nZpySQ45mCj8dd5bZSFA3eKI=;
	b=xrvWq93I6rq+O7gludWv/euqPvLV+GBMtKnqqX3RKgLFcLaJObD9G728pG8zR7W4Gz
	3DRECboP9L+B78e9CXIWXz5JL3/mXOEXJXBYPlK3jhBDn+DullxRrDOqwUmVVAVbhNBF
	CExFzsymxSxEJsPh2LCLyB8QglTBymvWR1JvJSHceNOrq8TiPCGYERz512XY/qhvk0z1
	dnIKmy5CfrDt5dPZ43NNqdT1V2f02fSfODYhk2L9A8h13vwe1gKYzX+vkoutfRO75sWq
	s4E+OpT03d0WWsrq3DEhPj3Pg7Ab9TrxdDROxWZCdljZau4qQM+KsMA4jFlm5EELdkMT
	OT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ca+wb/H0r1wwHpFfXS/nZpySQ45mCj8dd5bZSFA3eKI=;
	b=G3YVwfa2tWWLX2ft8ZANJQhieLgTY+++kFEpSdCTxiJojvllAJu9ZRbRT4p5HsgteR
	DvQhlx1OyRjiNJwdm2zGas2owZM8KT9uQNVkkVYVpkwgwRmzqe3IPFX573Qnbnpxegio
	AKqMgKSUxKSJ1q6gEukGW2q5Lh01f37v3K7U2Z6g+ufXVz9GbrDoEOpJ+MwkTe9eBis+
	v5YGJp7eeoVZI4/Wi9+9DYH1IHh4lZio/rxV/XUl7Z3E+wXwHtijTqJqedlum0td4jJ+
	5gv0z2PDOqEkP6g6Thq6JS8XS8bKuhgU+DzNtajb4ueilCsZLE41o3u9GLCFI6lcehXf
	Y5Qw==
X-Gm-Message-State: APzg51CL/B13XNpTEmB4sxneGO1x40pT+PjRuyR4D+eh/tguWVyo5dUy
	Ro0Wh5mjshUzsXxn7pp3ITqycl3SM5I9O2x/TxDnCYWD
X-Google-Smtp-Source: ANB0VdZUQ51EtykPu31JYkihPaHEuDZjPei3GukLbQ86mzGy2P9zxdl36+zGH6ZCsjtU33nt/+/B6q7FxjbgXPfCVAc=
X-Received: by 2002:a0c:e083:: with SMTP id l3-v6mr24155430qvk.1.1537352878497;
	Wed, 19 Sep 2018 03:27:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:3f2a:0:0:0:0:0 with HTTP; Wed, 19 Sep 2018 03:27:57
	-0700 (PDT)
X-Originating-IP: [83.218.80.243]
In-Reply-To: <CANNYZj-TTaAbEKFf0TZK5EaMaO5tFE75fQn_R8R8BH51m18d5Q@mail.gmail.com>
References: <20180913190444.9320-1-dev@sashko.rv.ua>
	<CANNYZj_fdS4DF=4ARQnpCjyb1icVyr-icXdUh3pR9aqW5zHP_A@mail.gmail.com>
	<ed13c32b-791a-96a6-d01f-d033e37d189a@sashko.rv.ua>
	<CANNYZj8RzKdLk7Ny+7p1-ZArUPQXSzE57WziiUeF=Mes1yR5vA@mail.gmail.com>
	<4e104369-2c06-68d0-fac6-a612b9bb1b08@sashko.rv.ua>
	<CANNYZj-TTaAbEKFf0TZK5EaMaO5tFE75fQn_R8R8BH51m18d5Q@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Date: Wed, 19 Sep 2018 12:27:57 +0200
Message-ID: <CAGoQ_idBSs-2YwFbX9ivC2bW5e90AWTMm-BE55=euek4oU-KXA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: update to 1.36
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
X-List-Received-Date: Wed, 19 Sep 2018 10:27:58 -0000
Content-Type: multipart/alternative; boundary="00000000000037b737057636dc5b"

--00000000000037b737057636dc5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Those two patches were mainstreamed, which will be described in the new
commit message as was requested.

On Wed, Sep 19, 2018 at 9:49 AM, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Well, no. The patch file contains three different patches, all fixing
> different things, and this information about the second and third one
> for instance has vanished:
>
> -From b8b7878e6cb2a1ed4fcfa256f7e232511a40e3d9 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Tue, 9 Aug 2016 15:37:50 +0100
> -Subject: [PATCH 2/3] Check for in6_pktinfo.ipi6_addr explicitly
> -
> -Instead of assuming that just glibc has this structure, check for it at
> -configure as musl also has it.
> -
> -Based on work by Khem Raj <raj.khem@gmail.com>.
>
>
> -From c0726e432fa0274a2b9c70179b03df6720972816 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Tue, 9 Aug 2016 15:19:23 +0100
> -Subject: [PATCH 3/3] Rationalise includes
> -
> -gweb/gresolv.c uses snprintf() and isspace() so it should include stdio.=
h
> and
> -ctype.h.
> -
> -tools/dnsproxy-test uses functions from stdio.h.
> -
> -musl warns when sys/ headers are included when the non-sys form should b=
e
> used,
> -so switch sys/errno.h and so on to errno.h.
> -
> -musl also causes redefinition errors when pieces of the networking
> headers are
> -included, so remove the redundant includes.
> -
> -Based on work by Khem Raj <raj.khem@gmail.com>.
>
> Alex
>
>
>
> 2018-09-19 0:24 GMT+02:00 Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com>:
> > Sorry for the delay. This patch hasn't really been changed much: it was
> > simply rebased, renamed and converted into git format. Would it be
> > enough to keep it the way it is and describe the changes in the commit
> > message?
> >
> > On 13/09/2018 23:38, Alexander Kanavin wrote:
> >> This one:
> >> rename meta/recipes-connectivity/connman/connman/{includes.patch =3D>
> >> 0001-Use-AC_USE_SYSTEM_EXTENSIONS.patch} (68%)
> >>
> >> I think you should make two commits: one that splits this patch in
> >> three, and another which actually does the version update.
> >>
> >> Alex
> >>
> >> 2018-09-13 23:08 GMT+02:00 Oleksandr Kravchuk
> >> <open.source@oleksandr-kravchuk.com>:
> >>> Sure, will do.
> >>>
> >>>>> Also, one patch is changed in a way that makes it lose significant
> amount
> >>>>> of information (it's an amalgamation of three patches)
> >>> Could you please clarify which one do you mean? Thank you.
> >>>
> >>>
> >>> On 9/13/18 9:46 PM, Alexander Kanavin wrote:
> >>>> Please explain the changes to patches (not as a reply to me, but in
> >>>> the commit message itself).
> >>>> If they are deleted because upstream already has them, it should be
> >>>> mentioned explicitly.
> >>>>
> >>>> Also, one patch is changed in a way that makes it lose significant
> >>>> amount of information
> >>>> (it's an amalgamation of three patches). Perhaps we should just spli=
t
> >>>> it in three?
> >>>>
> >>>> Alex
> >>>>
> >>>> 2018-09-13 21:04 GMT+02:00 Oleksandr Kravchuk
> >>>> <open.source@oleksandr-kravchuk.com>:
> >>>>> Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
> >>>>> ---
> >>>>>   meta/recipes-connectivity/connman/connman.inc |   2 +-
> >>>>>   ...> 0001-Use-AC_USE_SYSTEM_EXTENSIONS.patch} | 446
> ++++++++----------
> >>>>>   ...tls-Fix-a-crash-using-wispr-over-TLS.patch |  41 --
> >>>>>   ...refixlen-to-iproute_default_function.patch |  63 ---
> >>>>>   ...eep-track-of-addr-in-fw_snat-session.patch | 112 -----
> >>>>>   ...ubnet-route-creation-deletion-in-ipr.patch |  69 ---
> >>>>>   ...PIs-for-creating-and-deleting-subnet.patch |  68 ---
> >>>>>   ...net-route-creation-and-deletion-APIs.patch |  77 ---
> >>>>>   .../connman/connman_1.35.bb                   |  22 -
> >>>>>   .../connman/connman_1.36.bb                   |  17 +
> >>>>>   10 files changed, 212 insertions(+), 705 deletions(-)
> >>>>>   rename meta/recipes-connectivity/connman/connman/{includes.patch
> =3D>
> >>>>> 0001-Use-AC_USE_SYSTEM_EXTENSIONS.patch} (68%)
> >>>>>   delete mode 100644
> >>>>> meta/recipes-connectivity/connman/connman/0001-
> giognutls-Fix-a-crash-using-wispr-over-TLS.patch
> >>>>>   delete mode 100644
> >>>>> meta/recipes-connectivity/connman/connman/0001-inet-Add-
> prefixlen-to-iproute_default_function.patch
> >>>>>   delete mode 100644
> >>>>> meta/recipes-connectivity/connman/connman/0001-session-
> Keep-track-of-addr-in-fw_snat-session.patch
> >>>>>   delete mode 100644
> >>>>> meta/recipes-connectivity/connman/connman/0002-inet-
> Implement-subnet-route-creation-deletion-in-ipr.patch
> >>>>>   delete mode 100644
> >>>>> meta/recipes-connectivity/connman/connman/0003-inet-
> Implement-APIs-for-creating-and-deleting-subnet.patch
> >>>>>   delete mode 100644
> >>>>> meta/recipes-connectivity/connman/connman/0004-session-
> Use-subnet-route-creation-and-deletion-APIs.patch
> >>>>>   delete mode 100644 meta/recipes-connectivity/connman/
> connman_1.35.bb
> >>>>>   create mode 100644 meta/recipes-connectivity/connman/
> connman_1.36.bb
> >>>>>
> >>>>> diff --git a/meta/recipes-connectivity/connman/connman.inc
> >>>>> b/meta/recipes-connectivity/connman/connman.inc
> >>>>> index 2b03f9cb06..0ba375137d 100644
> >>>>> --- a/meta/recipes-connectivity/connman/connman.inc
> >>>>> +++ b/meta/recipes-connectivity/connman/connman.inc
> >>>>> @@ -156,7 +156,7 @@ RDEPENDS_${PN}-client =3D"${PN}"
> >>>>>
> >>>>>   FILES_${PN} =3D "${bindir}/* ${sbindir}/* ${libexecdir}/*
> >>>>> ${libdir}/lib*.so.* \
> >>>>>               ${libdir}/connman/plugins \
> >>>>> -            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
> >>>>> +            ${sysconfdir} ${sharedstatedir} ${localstatedir}
> ${datadir}
> >>>>> \
> >>>>>               ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.s=
o*
> >>>>> ${datadir}/${PN} \
> >>>>>               ${datadir}/dbus-1/system-services/* \
> >>>>>               ${sysconfdir}/tmpfiles.d/connman_resolvconf.conf"
> >>>>> diff --git a/meta/recipes-connectivity/
> connman/connman/includes.patch
> >>>>> b/meta/recipes-connectivity/connman/connman/0001-Use-AC_
> USE_SYSTEM_EXTENSIONS.patch
> >>>>> similarity index 68%
> >>>>> rename from meta/recipes-connectivity/connman/connman/includes.patc=
h
> >>>>> rename to
> >>>>> meta/recipes-connectivity/connman/connman/0001-Use-AC_
> USE_SYSTEM_EXTENSIONS.patch
> >>>>> index 55cb187931..e826bf002d 100644
> >>>>> --- a/meta/recipes-connectivity/connman/connman/includes.patch
> >>>>> +++
> >>>>> b/meta/recipes-connectivity/connman/connman/0001-Use-AC_
> USE_SYSTEM_EXTENSIONS.patch
> >>>>> @@ -1,36 +1,40 @@
> >>>>> -Fix various issues which cause problems under musl.
> >>>>> -
> >>>>> -Upstream-Status: Submitted
> >>>>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> >>>>> -
> >>>>> -From 630516bcc0233b047f65665c003201ba6e77453d Mon Sep 17 00:00:00
> 2001
> >>>>> +From 56fc228eebadc546d969a7073caf14d465ef3e5a Mon Sep 17 00:00:00
> 2001
> >>>>>   From: Ross Burton <ross.burton@intel.com>
> >>>>> -Date: Tue, 9 Aug 2016 16:22:36 +0100
> >>>>> -Subject: [PATCH 1/3] Use AC_USE_SYSTEM_EXTENSIONS
> >>>>> +Date: Thu, 13 Sep 2018 19:57:54 +0200
> >>>>> +Subject: [PATCH] Use AC_USE_SYSTEM_EXTENSIONS
> >>>>>
> >>>>> -Instead of using #define _GNU_SOURCE in some source files which
> causes
> >>>>> problems
> >>>>> -when building with musl as more files need the define, simply use
> >>>>> -AC_USE_SYSTEM_EXTENSIONS in configure.ac to get it defined
> globally.
> >>>>> +Instead of using #define _GNU_SOURCE in some source files which
> causes
> >>>>> +problems when building with musl as more files need the define,
> simply
> >>>>> +use AC_USE_SYSTEM_EXTENSIONS in configure.ac to get it defined
> globally.
> >>>>>   ---
> >>>>> - configure.ac       | 1 +
> >>>>> - gdhcp/client.c     | 1 -
> >>>>> - plugins/tist.c     | 1 -
> >>>>> - src/backtrace.c    | 1 -
> >>>>> - src/inet.c         | 1 -
> >>>>> - src/log.c          | 1 -
> >>>>> - src/ntp.c          | 1 -
> >>>>> - src/resolver.c     | 1 -
> >>>>> - src/rfkill.c       | 1 -
> >>>>> - src/stats.c        | 1 -
> >>>>> - src/timezone.c     | 1 -
> >>>>> - tools/stats-tool.c | 1 -
> >>>>> - tools/tap-test.c   | 1 -
> >>>>> - tools/wispr.c      | 1 -
> >>>>> - vpn/plugins/vpn.c  | 1 -
> >>>>> - 15 files changed, 1 insertion(+), 14 deletions(-)
> >>>>> + configure.ac                 | 3 +++
> >>>>> + gdhcp/client.c               | 1 -
> >>>>> + gdhcp/common.h               | 5 +++--
> >>>>> + gweb/gresolv.c               | 2 ++
> >>>>> + plugins/tist.c               | 1 -
> >>>>> + plugins/wifi.c               | 3 +--
> >>>>> + src/backtrace.c              | 1 -
> >>>>> + src/inet.c                   | 1 -
> >>>>> + src/ippool.c                 | 1 -
> >>>>> + src/iptables.c               | 2 +-
> >>>>> + src/log.c                    | 1 -
> >>>>> + src/ntp.c                    | 1 -
> >>>>> + src/resolver.c               | 1 -
> >>>>> + src/rfkill.c                 | 1 -
> >>>>> + src/stats.c                  | 1 -
> >>>>> + src/tethering.c              | 2 --
> >>>>> + src/timezone.c               | 1 -
> >>>>> + tools/dhcp-test.c            | 1 -
> >>>>> + tools/dnsproxy-test.c        | 1 +
> >>>>> + tools/private-network-test.c | 2 +-
> >>>>> + tools/stats-tool.c           | 1 -
> >>>>> + tools/tap-test.c             | 3 +--
> >>>>> + tools/wispr.c                | 1 -
> >>>>> + vpn/plugins/vpn.c            | 1 -
> >>>>> + 24 files changed, 13 insertions(+), 25 deletions(-)
> >>>>>
> >>>>>   diff --git a/configure.ac b/configure.ac
> >>>>> -index 6e66ab3..bacf5ec 100644
> >>>>> +index 39745f76..984126c2 100644
> >>>>>   --- a/configure.ac
> >>>>>   +++ b/configure.ac
> >>>>>   @@ -20,6 +20,7 @@ AC_SUBST(abs_top_srcdir)
> >>>>> @@ -41,8 +45,17 @@ index 6e66ab3..bacf5ec 100644
> >>>>>
> >>>>>    AC_PROG_CC
> >>>>>    AM_PROG_CC_C_O
> >>>>> +@@ -185,6 +186,8 @@ AC_CHECK_LIB(resolv, ns_initparse, dummy=3Dyes=
, [
> >>>>> + AC_CHECK_HEADERS([execinfo.h])
> >>>>> + AM_CONDITIONAL([BACKTRACE], [test "${ac_cv_header_execinfo_h}" =
=3D
> >>>>> "yes"])
> >>>>> +
> >>>>> ++AC_CHECK_MEMBERS([struct in6_pktinfo.ipi6_addr], [], [], [[#inclu=
de
> >>>>> <netinet/in.h>]])
> >>>>> ++
> >>>>> + AC_CHECK_FUNC(signalfd, dummy=3Dyes,
> >>>>> +                       AC_MSG_ERROR(signalfd support is required))
> >>>>> +
> >>>>>   diff --git a/gdhcp/client.c b/gdhcp/client.c
> >>>>> -index fbb40ab..3aeb089 100644
> >>>>> +index 67357782..c7db76f0 100644
> >>>>>   --- a/gdhcp/client.c
> >>>>>   +++ b/gdhcp/client.c
> >>>>>   @@ -23,7 +23,6 @@
> >>>>> @@ -53,8 +66,49 @@ index fbb40ab..3aeb089 100644
> >>>>>    #include <stdio.h>
> >>>>>    #include <errno.h>
> >>>>>    #include <unistd.h>
> >>>>> +diff --git a/gdhcp/common.h b/gdhcp/common.h
> >>>>> +index 75abc183..6899499e 100644
> >>>>> +--- a/gdhcp/common.h
> >>>>> ++++ b/gdhcp/common.h
> >>>>> +@@ -19,6 +19,7 @@
> >>>>> +  *
> >>>>> +  */
> >>>>> +
> >>>>> ++#include <config.h>
> >>>>> + #include <netinet/udp.h>
> >>>>> + #include <netinet/ip.h>
> >>>>> +
> >>>>> +@@ -170,8 +171,8 @@ static const uint8_t dhcp_option_lengths[] =3D=
 {
> >>>>> +       [OPTION_U32]    =3D 4,
> >>>>> + };
> >>>>> +
> >>>>> +-/* already defined within netinet/in.h if using GNU compiler */
> >>>>> +-#ifndef __USE_GNU
> >>>>> ++/* already defined within netinet/in.h if using glibc or musl */
> >>>>> ++#ifndef HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
> >>>>> + struct in6_pktinfo {
> >>>>> +       struct in6_addr ipi6_addr;  /* src/dst IPv6 address */
> >>>>> +       unsigned int ipi6_ifindex;  /* send/recv interface index */
> >>>>> +diff --git a/gweb/gresolv.c b/gweb/gresolv.c
> >>>>> +index 81c79b6c..180e57ba 100644
> >>>>> +--- a/gweb/gresolv.c
> >>>>> ++++ b/gweb/gresolv.c
> >>>>> +@@ -23,11 +23,13 @@
> >>>>> + #include <config.h>
> >>>>> + #endif
> >>>>> +
> >>>>> ++#include <ctype.h>
> >>>>> + #include <errno.h>
> >>>>> + #include <unistd.h>
> >>>>> + #include <stdarg.h>
> >>>>> + #include <string.h>
> >>>>> + #include <stdlib.h>
> >>>>> ++#include <stdio.h>
> >>>>> + #include <resolv.h>
> >>>>> + #include <sys/types.h>
> >>>>> + #include <sys/socket.h>
> >>>>>   diff --git a/plugins/tist.c b/plugins/tist.c
> >>>>> -index ad5ef79..cc2800a 100644
> >>>>> +index ad5ef79e..cc2800a1 100644
> >>>>>   --- a/plugins/tist.c
> >>>>>   +++ b/plugins/tist.c
> >>>>>   @@ -23,7 +23,6 @@
> >>>>> @@ -65,8 +119,23 @@ index ad5ef79..cc2800a 100644
> >>>>>    #include <stdio.h>
> >>>>>    #include <stdbool.h>
> >>>>>    #include <stdlib.h>
> >>>>> +diff --git a/plugins/wifi.c b/plugins/wifi.c
> >>>>> +index dc08c6af..46e4cca4 100644
> >>>>> +--- a/plugins/wifi.c
> >>>>> ++++ b/plugins/wifi.c
> >>>>> +@@ -30,9 +30,8 @@
> >>>>> + #include <string.h>
> >>>>> + #include <sys/ioctl.h>
> >>>>> + #include <sys/socket.h>
> >>>>> +-#include <linux/if_arp.h>
> >>>>> +-#include <linux/wireless.h>
> >>>>> + #include <net/ethernet.h>
> >>>>> ++#include <linux/wireless.h>
> >>>>> +
> >>>>> + #ifndef IFF_LOWER_UP
> >>>>> + #define IFF_LOWER_UP  0x10000
> >>>>>   diff --git a/src/backtrace.c b/src/backtrace.c
> >>>>> -index 6a66c0a..4dbdda8 100644
> >>>>> +index e8d7f432..bede6698 100644
> >>>>>   --- a/src/backtrace.c
> >>>>>   +++ b/src/backtrace.c
> >>>>>   @@ -24,7 +24,6 @@
> >>>>> @@ -78,7 +147,7 @@ index 6a66c0a..4dbdda8 100644
> >>>>>    #include <unistd.h>
> >>>>>    #include <stdlib.h>
> >>>>>   diff --git a/src/inet.c b/src/inet.c
> >>>>> -index 69ded19..81d92c2 100644
> >>>>> +index a31372b5..a58ce7c1 100644
> >>>>>   --- a/src/inet.c
> >>>>>   +++ b/src/inet.c
> >>>>>   @@ -25,7 +25,6 @@
> >>>>> @@ -89,8 +158,33 @@ index 69ded19..81d92c2 100644
> >>>>>    #include <stdio.h>
> >>>>>    #include <errno.h>
> >>>>>    #include <unistd.h>
> >>>>> +diff --git a/src/ippool.c b/src/ippool.c
> >>>>> +index cea1dccd..8a645da2 100644
> >>>>> +--- a/src/ippool.c
> >>>>> ++++ b/src/ippool.c
> >>>>> +@@ -28,7 +28,6 @@
> >>>>> + #include <stdio.h>
> >>>>> + #include <string.h>
> >>>>> + #include <unistd.h>
> >>>>> +-#include <sys/errno.h>
> >>>>> + #include <sys/socket.h>
> >>>>> +
> >>>>> + #include "connman.h"
> >>>>> +diff --git a/src/iptables.c b/src/iptables.c
> >>>>> +index f3670e77..469effed 100644
> >>>>> +--- a/src/iptables.c
> >>>>> ++++ b/src/iptables.c
> >>>>> +@@ -28,7 +28,7 @@
> >>>>> + #include <stdio.h>
> >>>>> + #include <string.h>
> >>>>> + #include <unistd.h>
> >>>>> +-#include <sys/errno.h>
> >>>>> ++#include <errno.h>
> >>>>> + #include <sys/socket.h>
> >>>>> + #include <xtables.h>
> >>>>> + #include <inttypes.h>
> >>>>>   diff --git a/src/log.c b/src/log.c
> >>>>> -index 9bae4a3..f7e82e5 100644
> >>>>> +index 9bae4a3d..f7e82e5d 100644
> >>>>>   --- a/src/log.c
> >>>>>   +++ b/src/log.c
> >>>>>   @@ -23,7 +23,6 @@
> >>>>> @@ -102,7 +196,7 @@ index 9bae4a3..f7e82e5 100644
> >>>>>    #include <unistd.h>
> >>>>>    #include <stdarg.h>
> >>>>>   diff --git a/src/ntp.c b/src/ntp.c
> >>>>> -index dd246eb..db8ae96 100644
> >>>>> +index 51ba9aac..724ca188 100644
> >>>>>   --- a/src/ntp.c
> >>>>>   +++ b/src/ntp.c
> >>>>>   @@ -23,7 +23,6 @@
> >>>>> @@ -114,7 +208,7 @@ index dd246eb..db8ae96 100644
> >>>>>    #include <fcntl.h>
> >>>>>    #include <unistd.h>
> >>>>>   diff --git a/src/resolver.c b/src/resolver.c
> >>>>> -index fbe4be7..ef61f92 100644
> >>>>> +index 76f0a8e1..10121aa5 100644
> >>>>>   --- a/src/resolver.c
> >>>>>   +++ b/src/resolver.c
> >>>>>   @@ -23,7 +23,6 @@
> >>>>> @@ -126,7 +220,7 @@ index fbe4be7..ef61f92 100644
> >>>>>    #include <errno.h>
> >>>>>    #include <fcntl.h>
> >>>>>   diff --git a/src/rfkill.c b/src/rfkill.c
> >>>>> -index 2bfb092..af49d12 100644
> >>>>> +index d9bed4d2..b2514c41 100644
> >>>>>   --- a/src/rfkill.c
> >>>>>   +++ b/src/rfkill.c
> >>>>>   @@ -23,7 +23,6 @@
> >>>>> @@ -138,7 +232,7 @@ index 2bfb092..af49d12 100644
> >>>>>    #include <errno.h>
> >>>>>    #include <fcntl.h>
> >>>>>   diff --git a/src/stats.c b/src/stats.c
> >>>>> -index 26343b1..cfcdc94 100644
> >>>>> +index 663bc382..c9ddc2e8 100644
> >>>>>   --- a/src/stats.c
> >>>>>   +++ b/src/stats.c
> >>>>>   @@ -23,7 +23,6 @@
> >>>>> @@ -149,8 +243,21 @@ index 26343b1..cfcdc94 100644
> >>>>>    #include <errno.h>
> >>>>>    #include <sys/mman.h>
> >>>>>    #include <sys/types.h>
> >>>>> +diff --git a/src/tethering.c b/src/tethering.c
> >>>>> +index 4b202369..f3cb36f4 100644
> >>>>> +--- a/src/tethering.c
> >>>>> ++++ b/src/tethering.c
> >>>>> +@@ -34,8 +34,6 @@
> >>>>> + #include <string.h>
> >>>>> + #include <fcntl.h>
> >>>>> + #include <netinet/in.h>
> >>>>> +-#include <linux/sockios.h>
> >>>>> +-#include <linux/if_tun.h>
> >>>>> + #include <linux/if_bridge.h>
> >>>>> +
> >>>>> + #include "connman.h"
> >>>>>   diff --git a/src/timezone.c b/src/timezone.c
> >>>>> -index e346b11..8e91267 100644
> >>>>> +index e346b11a..8e912670 100644
> >>>>>   --- a/src/timezone.c
> >>>>>   +++ b/src/timezone.c
> >>>>>   @@ -23,7 +23,6 @@
> >>>>> @@ -161,216 +268,8 @@ index e346b11..8e91267 100644
> >>>>>    #include <errno.h>
> >>>>>    #include <stdio.h>
> >>>>>    #include <fcntl.h>
> >>>>> -diff --git a/tools/stats-tool.c b/tools/stats-tool.c
> >>>>> -index b076478..428d94b 100644
> >>>>> ---- a/tools/stats-tool.c
> >>>>> -+++ b/tools/stats-tool.c
> >>>>> -@@ -22,7 +22,6 @@
> >>>>> - #include <config.h>
> >>>>> - #endif
> >>>>> -
> >>>>> --#define _GNU_SOURCE
> >>>>> - #include <sys/mman.h>
> >>>>> - #include <sys/types.h>
> >>>>> - #include <sys/stat.h>
> >>>>> -diff --git a/tools/tap-test.c b/tools/tap-test.c
> >>>>> -index fdc098a..57917f5 100644
> >>>>> ---- a/tools/tap-test.c
> >>>>> -+++ b/tools/tap-test.c
> >>>>> -@@ -23,7 +23,6 @@
> >>>>> - #include <config.h>
> >>>>> - #endif
> >>>>> -
> >>>>> --#define _GNU_SOURCE
> >>>>> - #include <stdio.h>
> >>>>> - #include <errno.h>
> >>>>> - #include <fcntl.h>
> >>>>> -diff --git a/tools/wispr.c b/tools/wispr.c
> >>>>> -index d5f9341..e56dfc1 100644
> >>>>> ---- a/tools/wispr.c
> >>>>> -+++ b/tools/wispr.c
> >>>>> -@@ -23,7 +23,6 @@
> >>>>> - #include <config.h>
> >>>>> - #endif
> >>>>> -
> >>>>> --#define _GNU_SOURCE
> >>>>> - #include <stdio.h>
> >>>>> - #include <fcntl.h>
> >>>>> - #include <unistd.h>
> >>>>> -diff --git a/vpn/plugins/vpn.c b/vpn/plugins/vpn.c
> >>>>> -index 9a42385..479c3a7 100644
> >>>>> ---- a/vpn/plugins/vpn.c
> >>>>> -+++ b/vpn/plugins/vpn.c
> >>>>> -@@ -23,7 +23,6 @@
> >>>>> - #include <config.h>
> >>>>> - #endif
> >>>>> -
> >>>>> --#define _GNU_SOURCE
> >>>>> - #include <string.h>
> >>>>> - #include <fcntl.h>
> >>>>> - #include <unistd.h>
> >>>>> ---
> >>>>> -2.8.1
> >>>>> -
> >>>>> -
> >>>>> -From b8b7878e6cb2a1ed4fcfa256f7e232511a40e3d9 Mon Sep 17 00:00:00
> 2001
> >>>>> -From: Ross Burton <ross.burton@intel.com>
> >>>>> -Date: Tue, 9 Aug 2016 15:37:50 +0100
> >>>>> -Subject: [PATCH 2/3] Check for in6_pktinfo.ipi6_addr explicitly
> >>>>> -
> >>>>> -Instead of assuming that just glibc has this structure, check for
> it at
> >>>>> -configure as musl also has it.
> >>>>> -
> >>>>> -Based on work by Khem Raj <raj.khem@gmail.com>.
> >>>>> ----
> >>>>> - configure.ac   | 2 ++
> >>>>> - gdhcp/common.h | 5 +++--
> >>>>> - 2 files changed, 5 insertions(+), 2 deletions(-)
> >>>>> -
> >>>>> -diff --git a/configure.ac b/configure.ac
> >>>>> -index bacf5ec..ad00456 100644
> >>>>> ---- a/configure.ac
> >>>>> -+++ b/configure.ac
> >>>>> -@@ -186,6 +186,8 @@ AC_CHECK_LIB(resolv, ns_initparse, dummy=3Dyes=
, [
> >>>>> - AC_CHECK_HEADERS([execinfo.h])
> >>>>> - AM_CONDITIONAL([BACKTRACE], [test "${ac_cv_header_execinfo_h}" =
=3D
> >>>>> "yes"])
> >>>>> -
> >>>>> -+AC_CHECK_MEMBERS([struct in6_pktinfo.ipi6_addr], [], [], [[#inclu=
de
> >>>>> <netinet/in.h>]])
> >>>>> -+
> >>>>> - AC_CHECK_FUNC(signalfd, dummy=3Dyes,
> >>>>> -                       AC_MSG_ERROR(signalfd support is required))
> >>>>> -
> >>>>> -diff --git a/gdhcp/common.h b/gdhcp/common.h
> >>>>> -index 75abc18..6899499 100644
> >>>>> ---- a/gdhcp/common.h
> >>>>> -+++ b/gdhcp/common.h
> >>>>> -@@ -19,6 +19,7 @@
> >>>>> -  *
> >>>>> -  */
> >>>>> -
> >>>>> -+#include <config.h>
> >>>>> - #include <netinet/udp.h>
> >>>>> - #include <netinet/ip.h>
> >>>>> -
> >>>>> -@@ -170,8 +171,8 @@ static const uint8_t dhcp_option_lengths[] =3D=
 {
> >>>>> -       [OPTION_U32]    =3D 4,
> >>>>> - };
> >>>>> -
> >>>>> --/* already defined within netinet/in.h if using GNU compiler */
> >>>>> --#ifndef __USE_GNU
> >>>>> -+/* already defined within netinet/in.h if using glibc or musl */
> >>>>> -+#ifndef HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
> >>>>> - struct in6_pktinfo {
> >>>>> -       struct in6_addr ipi6_addr;  /* src/dst IPv6 address */
> >>>>> -       unsigned int ipi6_ifindex;  /* send/recv interface index */
> >>>>> ---
> >>>>> -2.8.1
> >>>>> -
> >>>>> -
> >>>>> -From c0726e432fa0274a2b9c70179b03df6720972816 Mon Sep 17 00:00:00
> 2001
> >>>>> -From: Ross Burton <ross.burton@intel.com>
> >>>>> -Date: Tue, 9 Aug 2016 15:19:23 +0100
> >>>>> -Subject: [PATCH 3/3] Rationalise includes
> >>>>> -
> >>>>> -gweb/gresolv.c uses snprintf() and isspace() so it should include
> >>>>> stdio.h and
> >>>>> -ctype.h.
> >>>>> -
> >>>>> -tools/dnsproxy-test uses functions from stdio.h.
> >>>>> -
> >>>>> -musl warns when sys/ headers are included when the non-sys form
> should
> >>>>> be used,
> >>>>> -so switch sys/errno.h and so on to errno.h.
> >>>>> -
> >>>>> -musl also causes redefinition errors when pieces of the networking
> >>>>> headers are
> >>>>> -included, so remove the redundant includes.
> >>>>> -
> >>>>> -Based on work by Khem Raj <raj.khem@gmail.com>.
> >>>>> ----
> >>>>> - gweb/gresolv.c               | 2 ++
> >>>>> - plugins/wifi.c               | 3 +--
> >>>>> - src/ippool.c                 | 1 -
> >>>>> - src/iptables.c               | 2 +-
> >>>>> - src/tethering.c              | 2 --
> >>>>> - tools/dhcp-test.c            | 1 -
> >>>>> - tools/dnsproxy-test.c        | 1 +
> >>>>> - tools/private-network-test.c | 2 +-
> >>>>> - tools/tap-test.c             | 2 +-
> >>>>> - 9 files changed, 7 insertions(+), 9 deletions(-)
> >>>>> -
> >>>>> -diff --git a/gweb/gresolv.c b/gweb/gresolv.c
> >>>>> -index 8a51a9f..d55027c 100644
> >>>>> ---- a/gweb/gresolv.c
> >>>>> -+++ b/gweb/gresolv.c
> >>>>> -@@ -23,11 +23,13 @@
> >>>>> - #include <config.h>
> >>>>> - #endif
> >>>>> -
> >>>>> -+#include <ctype.h>
> >>>>> - #include <errno.h>
> >>>>> - #include <unistd.h>
> >>>>> - #include <stdarg.h>
> >>>>> - #include <string.h>
> >>>>> - #include <stdlib.h>
> >>>>> -+#include <stdio.h>
> >>>>> - #include <resolv.h>
> >>>>> - #include <sys/types.h>
> >>>>> - #include <sys/socket.h>
> >>>>> -diff --git a/plugins/wifi.c b/plugins/wifi.c
> >>>>> -index 9d56671..148131d 100644
> >>>>> ---- a/plugins/wifi.c
> >>>>> -+++ b/plugins/wifi.c
> >>>>> -@@ -30,9 +30,8 @@
> >>>>> - #include <string.h>
> >>>>> - #include <sys/ioctl.h>
> >>>>> - #include <sys/socket.h>
> >>>>> --#include <linux/if_arp.h>
> >>>>> --#include <linux/wireless.h>
> >>>>> - #include <net/ethernet.h>
> >>>>> -+#include <linux/wireless.h>
> >>>>> -
> >>>>> - #ifndef IFF_LOWER_UP
> >>>>> - #define IFF_LOWER_UP  0x10000
> >>>>> -diff --git a/src/ippool.c b/src/ippool.c
> >>>>> -index cea1dcc..8a645da 100644
> >>>>> ---- a/src/ippool.c
> >>>>> -+++ b/src/ippool.c
> >>>>> -@@ -28,7 +28,6 @@
> >>>>> - #include <stdio.h>
> >>>>> - #include <string.h>
> >>>>> - #include <unistd.h>
> >>>>> --#include <sys/errno.h>
> >>>>> - #include <sys/socket.h>
> >>>>> -
> >>>>> - #include "connman.h"
> >>>>> -diff --git a/src/iptables.c b/src/iptables.c
> >>>>> -index 5ef757a..82e3ac4 100644
> >>>>> ---- a/src/iptables.c
> >>>>> -+++ b/src/iptables.c
> >>>>> -@@ -28,7 +28,7 @@
> >>>>> - #include <stdio.h>
> >>>>> - #include <string.h>
> >>>>> - #include <unistd.h>
> >>>>> --#include <sys/errno.h>
> >>>>> -+#include <errno.h>
> >>>>> - #include <sys/socket.h>
> >>>>> - #include <xtables.h>
> >>>>> - #include <inttypes.h>
> >>>>> -diff --git a/src/tethering.c b/src/tethering.c
> >>>>> -index 3153349..ad062d5 100644
> >>>>> ---- a/src/tethering.c
> >>>>> -+++ b/src/tethering.c
> >>>>> -@@ -31,10 +31,8 @@
> >>>>> - #include <stdio.h>
> >>>>> - #include <sys/ioctl.h>
> >>>>> - #include <net/if.h>
> >>>>> --#include <linux/sockios.h>
> >>>>> - #include <string.h>
> >>>>> - #include <fcntl.h>
> >>>>> --#include <linux/if_tun.h>
> >>>>> - #include <netinet/in.h>
> >>>>> - #include <linux/if_bridge.h>
> >>>>> -
> >>>>>   diff --git a/tools/dhcp-test.c b/tools/dhcp-test.c
> >>>>> -index c34e10a..eae66fc 100644
> >>>>> +index c34e10a8..eae66fc2 100644
> >>>>>   --- a/tools/dhcp-test.c
> >>>>>   +++ b/tools/dhcp-test.c
> >>>>>   @@ -33,7 +33,6 @@
> >>>>> @@ -382,7 +281,7 @@ index c34e10a..eae66fc 100644
> >>>>>    #include <gdhcp/gdhcp.h>
> >>>>>
> >>>>>   diff --git a/tools/dnsproxy-test.c b/tools/dnsproxy-test.c
> >>>>> -index 551cae9..371e2e2 100644
> >>>>> +index 551cae91..371e2e23 100644
> >>>>>   --- a/tools/dnsproxy-test.c
> >>>>>   +++ b/tools/dnsproxy-test.c
> >>>>>   @@ -24,6 +24,7 @@
> >>>>> @@ -394,7 +293,7 @@ index 551cae9..371e2e2 100644
> >>>>>    #include <string.h>
> >>>>>    #include <unistd.h>
> >>>>>   diff --git a/tools/private-network-test.c
> >>>>> b/tools/private-network-test.c
> >>>>> -index 3dd115b..2828bb3 100644
> >>>>> +index 3dd115ba..2828bb30 100644
> >>>>>   --- a/tools/private-network-test.c
> >>>>>   +++ b/tools/private-network-test.c
> >>>>>   @@ -32,7 +32,7 @@
> >>>>> @@ -406,11 +305,29 @@ index 3dd115b..2828bb3 100644
> >>>>>    #include <sys/signalfd.h>
> >>>>>    #include <unistd.h>
> >>>>>
> >>>>> +diff --git a/tools/stats-tool.c b/tools/stats-tool.c
> >>>>> +index efa39de2..5695048f 100644
> >>>>> +--- a/tools/stats-tool.c
> >>>>> ++++ b/tools/stats-tool.c
> >>>>> +@@ -22,7 +22,6 @@
> >>>>> + #include <config.h>
> >>>>> + #endif
> >>>>> +
> >>>>> +-#define _GNU_SOURCE
> >>>>> + #include <sys/mman.h>
> >>>>> + #include <sys/types.h>
> >>>>> + #include <sys/stat.h>
> >>>>>   diff --git a/tools/tap-test.c b/tools/tap-test.c
> >>>>> -index 57917f5..cb3ee62 100644
> >>>>> +index fdc098aa..cb3ee622 100644
> >>>>>   --- a/tools/tap-test.c
> >>>>>   +++ b/tools/tap-test.c
> >>>>> -@@ -28,7 +28,7 @@
> >>>>> +@@ -23,13 +23,12 @@
> >>>>> + #include <config.h>
> >>>>> + #endif
> >>>>> +
> >>>>> +-#define _GNU_SOURCE
> >>>>> + #include <stdio.h>
> >>>>> + #include <errno.h>
> >>>>>    #include <fcntl.h>
> >>>>>    #include <unistd.h>
> >>>>>    #include <string.h>
> >>>>> @@ -419,5 +336,30 @@ index 57917f5..cb3ee62 100644
> >>>>>    #include <sys/ioctl.h>
> >>>>>
> >>>>>    #include <netinet/in.h>
> >>>>> +diff --git a/tools/wispr.c b/tools/wispr.c
> >>>>> +index d5f9341f..e56dfc16 100644
> >>>>> +--- a/tools/wispr.c
> >>>>> ++++ b/tools/wispr.c
> >>>>> +@@ -23,7 +23,6 @@
> >>>>> + #include <config.h>
> >>>>> + #endif
> >>>>> +
> >>>>> +-#define _GNU_SOURCE
> >>>>> + #include <stdio.h>
> >>>>> + #include <fcntl.h>
> >>>>> + #include <unistd.h>
> >>>>> +diff --git a/vpn/plugins/vpn.c b/vpn/plugins/vpn.c
> >>>>> +index 10548aaf..6e3f640c 100644
> >>>>> +--- a/vpn/plugins/vpn.c
> >>>>> ++++ b/vpn/plugins/vpn.c
> >>>>> +@@ -23,7 +23,6 @@
> >>>>> + #include <config.h>
> >>>>> + #endif
> >>>>> +
> >>>>> +-#define _GNU_SOURCE
> >>>>> + #include <string.h>
> >>>>> + #include <fcntl.h>
> >>>>> + #include <unistd.h>
> >>>>>   --
> >>>>> -2.8.1
> >>>>> +2.17.1
> >>>>> +
> >>>>> diff --git
> >>>>> a/meta/recipes-connectivity/connman/connman/0001-
> giognutls-Fix-a-crash-using-wispr-over-TLS.patch
> >>>>> b/meta/recipes-connectivity/connman/connman/0001-
> giognutls-Fix-a-crash-using-wispr-over-TLS.patch
> >>>>> deleted file mode 100644
> >>>>> index f9080d4ba9..0000000000
> >>>>> ---
> >>>>> a/meta/recipes-connectivity/connman/connman/0001-
> giognutls-Fix-a-crash-using-wispr-over-TLS.patch
> >>>>> +++ /dev/null
> >>>>> @@ -1,41 +0,0 @@
> >>>>> -From 929fc9b7068100444e0ffcccd25841f78791e619 Mon Sep 17 00:00:00
> 2001
> >>>>> -From: Jian Liang <jianliang@tycoint.com>
> >>>>> -Date: Fri, 15 Sep 2017 06:40:08 -0400
> >>>>> -Subject: [PATCH] gweb: Fix a crash using wispr over TLS
> >>>>> -To: connman@lists.01.org
> >>>>> -Cc: wagi@monom.org
> >>>>> -
> >>>>> -When gnutls_channel is instantiated, the gnutls_channel->establish=
ed
> >>>>> -has to be initiated as FALSE. Otherwise, check_handshake function
> >>>>> -won't work. A random initial value 1 of gnutls_channel->establishe=
d
> >>>>> -will make check_handshake return G_IO_STATUS_NORMAL, when the
> channel
> >>>>> -is actually not ready to be used. The observed behaviours are,
> >>>>> -
> >>>>> -- wispr is getting random errors in wispr_portal_web_result
> >>>>> -- ConnMan crashes on exit after those random errors
> >>>>> -- when wispr is luckly working, ConnMan doesn't crash on exit
> >>>>> -
> >>>>> -Signed-off-by: Jian Liang <jianliang@tycoint.com>
> >>>>> -
> >>>>> ----
> >>>>> -Upstream-Status: Backport
> >>>>> [https://git.kernel.org/pub/scm/network/connman/connman.
> git/commit/?id=3D73e53f3bd9e7debae86341f1eee7b97862a56a5e]
> >>>>> -Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> >>>>> - gweb/giognutls.c | 2 +-
> >>>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>> -
> >>>>> -diff --git a/gweb/giognutls.c b/gweb/giognutls.c
> >>>>> -index 09dc9e7..c029a8b 100644
> >>>>> ---- a/gweb/giognutls.c
> >>>>> -+++ b/gweb/giognutls.c
> >>>>> -@@ -421,7 +421,7 @@ GIOChannel *g_io_channel_gnutls_new(int fd)
> >>>>> -
> >>>>> -       DBG("");
> >>>>> -
> >>>>> --      gnutls_channel =3D g_new(GIOGnuTLSChannel, 1);
> >>>>> -+      gnutls_channel =3D g_new0(GIOGnuTLSChannel, 1);
> >>>>> -
> >>>>> -       channel =3D (GIOChannel *) gnutls_channel;
> >>>>> -
> >>>>> ---
> >>>>> -2.7.4
> >>>>> -
> >>>>> diff --git
> >>>>> a/meta/recipes-connectivity/connman/connman/0001-inet-Add-
> prefixlen-to-iproute_default_function.patch
> >>>>> b/meta/recipes-connectivity/connman/connman/0001-inet-Add-
> prefixlen-to-iproute_default_function.patch
> >>>>> deleted file mode 100644
> >>>>> index dd7b356741..0000000000
> >>>>> ---
> >>>>> a/meta/recipes-connectivity/connman/connman/0001-inet-Add-
> prefixlen-to-iproute_default_function.patch
> >>>>> +++ /dev/null
> >>>>> @@ -1,63 +0,0 @@
> >>>>> -From 508dc60a1f0758ebc586b6b086478a176d493086 Mon Sep 17 00:00:00
> 2001
> >>>>> -From: Jian Liang <jianliang@tycoint.com>
> >>>>> -Date: Thu, 5 Oct 2017 09:34:41 +0100
> >>>>> -Subject: [PATCH 1/4] inet: Add prefixlen to iproute_default_functi=
on
> >>>>> -To: connman@lists.01.org
> >>>>> -Cc: wagi@monom.org
> >>>>> -
> >>>>> -Add prefixlen parameter to this function in preparation for using
> >>>>> -it also in creating subnet route later, e.g.
> >>>>> -
> >>>>> -default via 192.168.100.1 dev eth0
> >>>>> -192.168.100.0/24 dev eth0
> >>>>> -
> >>>>> -Signed-off-by: Jian Liang <jianliang@tycoint.com>
> >>>>> -
> >>>>> ----
> >>>>> -Upstream-Status: Backport
> >>>>> [https://git.kernel.org/pub/scm/network/connman/connman.
> git/commit/?id=3Dedda5b695de2ee79f02314abc9b46fdd46b388e1]
> >>>>> -Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> >>>>> - src/inet.c | 7 ++++---
> >>>>> - 1 file changed, 4 insertions(+), 3 deletions(-)
> >>>>> -
> >>>>> -diff --git a/src/inet.c b/src/inet.c
> >>>>> -index b887aa0..ab8aec8 100644
> >>>>> ---- a/src/inet.c
> >>>>> -+++ b/src/inet.c
> >>>>> -@@ -2796,7 +2796,7 @@ int __connman_inet_del_fwmark_rule(uint32_t
> >>>>> table_id, int family, uint32_t fwmar
> >>>>> - }
> >>>>> -
> >>>>> - static int iproute_default_modify(int cmd, uint32_t table_id, int
> >>>>> ifindex,
> >>>>> --                      const char *gateway)
> >>>>> -+                      const char *gateway, unsigned char prefixle=
n)
> >>>>> - {
> >>>>> -       struct __connman_inet_rtnl_handle rth;
> >>>>> -       unsigned char buf[sizeof(struct in6_addr)];
> >>>>> -@@ -2829,6 +2829,7 @@ static int iproute_default_modify(int cmd,
> >>>>> uint32_t table_id, int ifindex,
> >>>>> -       rth.req.u.r.rt.rtm_protocol =3D RTPROT_BOOT;
> >>>>> -       rth.req.u.r.rt.rtm_scope =3D RT_SCOPE_UNIVERSE;
> >>>>> -       rth.req.u.r.rt.rtm_type =3D RTN_UNICAST;
> >>>>> -+      rth.req.u.r.rt.rtm_dst_len =3D prefixlen;
> >>>>> -
> >>>>> -       __connman_inet_rtnl_addattr_l(&rth.req.n, sizeof(rth.req),
> >>>>> RTA_GATEWAY,
> >>>>> -                                                               buf=
,
> >>>>> len);
> >>>>> -@@ -2860,7 +2861,7 @@ int __connman_inet_add_default_to_
> table(uint32_t
> >>>>> table_id, int ifindex,
> >>>>> - {
> >>>>> -       /* ip route add default via 1.2.3.4 dev wlan0 table 1234 */
> >>>>> -
> >>>>> --      return iproute_default_modify(RTM_NEWROUTE, table_id,
> ifindex,
> >>>>> gateway);
> >>>>> -+      return iproute_default_modify(RTM_NEWROUTE, table_id,
> ifindex,
> >>>>> gateway, 0);
> >>>>> - }
> >>>>> -
> >>>>> - int __connman_inet_del_default_from_table(uint32_t table_id, int
> >>>>> ifindex,
> >>>>> -@@ -2868,7 +2869,7 @@ int __connman_inet_del_default_
> from_table(uint32_t
> >>>>> table_id, int ifindex,
> >>>>> - {
> >>>>> -       /* ip route del default via 1.2.3.4 dev wlan0 table 1234 */
> >>>>> -
> >>>>> --      return iproute_default_modify(RTM_DELROUTE, table_id,
> ifindex,
> >>>>> gateway);
> >>>>> -+      return iproute_default_modify(RTM_DELROUTE, table_id,
> ifindex,
> >>>>> gateway, 0);
> >>>>> - }
> >>>>> -
> >>>>> - int __connman_inet_get_interface_ll_address(int index, int family=
,
> >>>>> ---
> >>>>> -2.7.4
> >>>>> -
> >>>>> diff --git
> >>>>> a/meta/recipes-connectivity/connman/connman/0001-session-
> Keep-track-of-addr-in-fw_snat-session.patch
> >>>>> b/meta/recipes-connectivity/connman/connman/0001-session-
> Keep-track-of-addr-in-fw_snat-session.patch
> >>>>> deleted file mode 100644
> >>>>> index f1b4d0aaa7..0000000000
> >>>>> ---
> >>>>> a/meta/recipes-connectivity/connman/connman/0001-session-
> Keep-track-of-addr-in-fw_snat-session.patch
> >>>>> +++ /dev/null
> >>>>> @@ -1,112 +0,0 @@
> >>>>> -From b5fd5945886fa1845db5c969424b63d894fe0376 Mon Sep 17 00:00:00
> 2001
> >>>>> -From: Jian Liang <jianliang@tycoint.com>
> >>>>> -Date: Fri, 25 Aug 2017 10:02:16 -0400
> >>>>> -Subject: [PATCH 1/2] session: Keep track of addr in fw_snat &
> session
> >>>>> -To: connman@lists.01.org
> >>>>> -Cc: wagi@monom.org
> >>>>> -
> >>>>> -When there is more than one session in fw_snat's list of sessions,
> >>>>> -fw_snat failed to be re-created when update-session-state is
> triggered
> >>>>> -with new IP address. This is because index alone is not sufficient
> to
> >>>>> -decide if fw_snat needs to be re-created. The solution here is to
> keep
> >>>>> -a track of IP addr and use it to avoid false lookup of fw_snat.
> >>>>> -
> >>>>> -Signed-off-by: Jian Liang <jianliang@tycoint.com>
> >>>>> -
> >>>>> ----
> >>>>> -Upstream-Status: Backport
> >>>>> [https://git.kernel.org/pub/scm/network/connman/connman.
> git/commit/?id=3Df9e27d4abfcab5c80a38e0850b5ddb26277f97c1]
> >>>>> -Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> >>>>> - src/session.c | 19 +++++++++++++++----
> >>>>> - 1 file changed, 15 insertions(+), 4 deletions(-)
> >>>>> -
> >>>>> -diff --git a/src/session.c b/src/session.c
> >>>>> -index 9e3c559..965ac06 100644
> >>>>> ---- a/src/session.c
> >>>>> -+++ b/src/session.c
> >>>>> -@@ -65,6 +65,7 @@ struct connman_session {
> >>>>> -       struct firewall_context *fw;
> >>>>> -       uint32_t mark;
> >>>>> -       int index;
> >>>>> -+      char *addr;
> >>>>> -       char *gateway;
> >>>>> -       bool policy_routing;
> >>>>> -       bool snat_enabled;
> >>>>> -@@ -79,6 +80,7 @@ struct fw_snat {
> >>>>> -       GSList *sessions;
> >>>>> -       int id;
> >>>>> -       int index;
> >>>>> -+      char *addr;
> >>>>> -       struct firewall_context *fw;
> >>>>> - };
> >>>>> -
> >>>>> -@@ -200,7 +202,7 @@ static char *service2bearer(enum
> >>>>> connman_service_type type)
> >>>>> -       return "";
> >>>>> - }
> >>>>> -
> >>>>> --static struct fw_snat *fw_snat_lookup(int index)
> >>>>> -+static struct fw_snat *fw_snat_lookup(int index, const char *addr=
)
> >>>>> - {
> >>>>> -       struct fw_snat *fw_snat;
> >>>>> -       GSList *list;
> >>>>> -@@ -208,8 +210,11 @@ static struct fw_snat *fw_snat_lookup(int
> index)
> >>>>> -       for (list =3D fw_snat_list; list; list =3D list->next) {
> >>>>> -               fw_snat =3D list->data;
> >>>>> -
> >>>>> --              if (fw_snat->index =3D=3D index)
> >>>>> -+              if (fw_snat->index =3D=3D index) {
> >>>>> -+                      if (g_strcmp0(addr, fw_snat->addr) !=3D 0)
> >>>>> -+                              continue;
> >>>>> -                       return fw_snat;
> >>>>> -+              }
> >>>>> -       }
> >>>>> -       return NULL;
> >>>>> - }
> >>>>> -@@ -224,6 +229,7 @@ static int fw_snat_create(struct connman_sessi=
on
> >>>>> *session,
> >>>>> -
> >>>>> -       fw_snat->fw =3D __connman_firewall_create();
> >>>>> -       fw_snat->index =3D index;
> >>>>> -+      fw_snat->addr =3D g_strdup(addr);
> >>>>> -
> >>>>> -       fw_snat->id =3D __connman_firewall_enable_snat(fw_snat->fw,
> >>>>> -                                               index, ifname, addr=
);
> >>>>> -@@ -238,6 +244,7 @@ static int fw_snat_create(struct connman_sessi=
on
> >>>>> *session,
> >>>>> -       return 0;
> >>>>> - err:
> >>>>> -       __connman_firewall_destroy(fw_snat->fw);
> >>>>> -+      g_free(fw_snat->addr);
> >>>>> -       g_free(fw_snat);
> >>>>> -       return err;
> >>>>> - }
> >>>>> -@@ -393,7 +400,7 @@ static void del_nat_rules(struct connman_sessi=
on
> >>>>> *session)
> >>>>> -               return;
> >>>>> -
> >>>>> -       session->snat_enabled =3D false;
> >>>>> --      fw_snat =3D fw_snat_lookup(session->index);
> >>>>> -+      fw_snat =3D fw_snat_lookup(session->index, session->addr);
> >>>>> -
> >>>>> -       if (!fw_snat)
> >>>>> -               return;
> >>>>> -@@ -420,8 +427,11 @@ static void add_nat_rules(struct
> connman_session
> >>>>> *session)
> >>>>> -       if (!addr)
> >>>>> -               return;
> >>>>> -
> >>>>> -+      g_free(session->addr);
> >>>>> -+      session->addr =3D g_strdup(addr);
> >>>>> -+
> >>>>> -       session->snat_enabled =3D true;
> >>>>> --      fw_snat =3D fw_snat_lookup(index);
> >>>>> -+      fw_snat =3D fw_snat_lookup(index, session->addr);
> >>>>> -       if (fw_snat) {
> >>>>> -               fw_snat_ref(session, fw_snat);
> >>>>> -               return;
> >>>>> -@@ -502,6 +512,7 @@ static void free_session(struct connman_sessio=
n
> >>>>> *session)
> >>>>> -       g_free(session->info);
> >>>>> -       g_free(session->info_last);
> >>>>> -       g_free(session->gateway);
> >>>>> -+      g_free(session->addr);
> >>>>> -
> >>>>> -       g_free(session);
> >>>>> - }
> >>>>> ---
> >>>>> -2.7.4
> >>>>> -
> >>>>> diff --git
> >>>>> a/meta/recipes-connectivity/connman/connman/0002-inet-
> Implement-subnet-route-creation-deletion-in-ipr.patch
> >>>>> b/meta/recipes-connectivity/connman/connman/0002-inet-
> Implement-subnet-route-creation-deletion-in-ipr.patch
> >>>>> deleted file mode 100644
> >>>>> index 9c953e5d51..0000000000
> >>>>> ---
> >>>>> a/meta/recipes-connectivity/connman/connman/0002-inet-
> Implement-subnet-route-creation-deletion-in-ipr.patch
> >>>>> +++ /dev/null
> >>>>> @@ -1,69 +0,0 @@
> >>>>> -From 08cda4004491d3971a8b9df937426c43800d15b1 Mon Sep 17 00:00:00
> 2001
> >>>>> -From: Jian Liang <jianliang@tycoint.com>
> >>>>> -Date: Thu, 5 Oct 2017 09:37:06 +0100
> >>>>> -Subject: [PATCH 2/4] inet: Implement subnet route creation/deletio=
n
> in
> >>>>> - iproute_default_modify
> >>>>> -To: connman@lists.01.org
> >>>>> -Cc: wagi@monom.org
> >>>>> -
> >>>>> -- Calculate subnet address base on gateway address and prefixlen
> >>>>> -- Differentiate creation of routes to gateway and subnet
> >>>>> -
> >>>>> -Signed-off-by: Jian Liang <jianliang@tycoint.com>
> >>>>> -
> >>>>> ----
> >>>>> -Upstream-Status: Backport
> >>>>> [https://git.kernel.org/pub/scm/network/connman/connman.
> git/commit/?id=3Dff7dcf91f12a2a237feebc6e606d0a8e92975528]
> >>>>> -Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> >>>>> - src/inet.c | 22 +++++++++++++++++++---
> >>>>> - 1 file changed, 19 insertions(+), 3 deletions(-)
> >>>>> -
> >>>>> -diff --git a/src/inet.c b/src/inet.c
> >>>>> -index ab8aec8..0ddb030 100644
> >>>>> ---- a/src/inet.c
> >>>>> -+++ b/src/inet.c
> >>>>> -@@ -2802,6 +2802,9 @@ static int iproute_default_modify(int cmd,
> >>>>> uint32_t table_id, int ifindex,
> >>>>> -       unsigned char buf[sizeof(struct in6_addr)];
> >>>>> -       int ret, len;
> >>>>> -       int family =3D connman_inet_check_ipaddress(gateway);
> >>>>> -+      char *dst =3D NULL;
> >>>>> -+
> >>>>> -+      DBG("gateway %s/%u table %u", gateway, prefixlen, table_id)=
;
> >>>>> -
> >>>>> -       switch (family) {
> >>>>> -       case AF_INET:
> >>>>> -@@ -2814,7 +2817,19 @@ static int iproute_default_modify(int cmd,
> >>>>> uint32_t table_id, int ifindex,
> >>>>> -               return -EINVAL;
> >>>>> -       }
> >>>>> -
> >>>>> --      ret =3D inet_pton(family, gateway, buf);
> >>>>> -+      if (prefixlen) {
> >>>>> -+              struct in_addr ipv4_subnet_addr, ipv4_mask;
> >>>>> -+
> >>>>> -+              memset(&ipv4_subnet_addr, 0,
> sizeof(ipv4_subnet_addr));
> >>>>> -+              ipv4_mask.s_addr =3D htonl((0xffffffff << (32 -
> prefixlen))
> >>>>> & 0xffffffff);
> >>>>> -+              ipv4_subnet_addr.s_addr =3D inet_addr(gateway);
> >>>>> -+              ipv4_subnet_addr.s_addr &=3D ipv4_mask.s_addr;
> >>>>> -+
> >>>>> -+              dst =3D g_strdup(inet_ntoa(ipv4_subnet_addr));
> >>>>> -+      }
> >>>>> -+
> >>>>> -+      ret =3D inet_pton(family, dst ? dst : gateway, buf);
> >>>>> -+      g_free(dst);
> >>>>> -       if (ret <=3D 0)
> >>>>> -               return -EINVAL;
> >>>>> -
> >>>>> -@@ -2831,8 +2846,9 @@ static int iproute_default_modify(int cmd,
> >>>>> uint32_t table_id, int ifindex,
> >>>>> -       rth.req.u.r.rt.rtm_type =3D RTN_UNICAST;
> >>>>> -       rth.req.u.r.rt.rtm_dst_len =3D prefixlen;
> >>>>> -
> >>>>> --      __connman_inet_rtnl_addattr_l(&rth.req.n, sizeof(rth.req),
> >>>>> RTA_GATEWAY,
> >>>>> --                                                              buf=
,
> >>>>> len);
> >>>>> -+      __connman_inet_rtnl_addattr_l(&rth.req.n, sizeof(rth.req),
> >>>>> -+              prefixlen > 0 ? RTA_DST : RTA_GATEWAY, buf, len);
> >>>>> -+
> >>>>> -       if (table_id < 256) {
> >>>>> -               rth.req.u.r.rt.rtm_table =3D table_id;
> >>>>> -       } else {
> >>>>> ---
> >>>>> -2.7.4
> >>>>> -
> >>>>> diff --git
> >>>>> a/meta/recipes-connectivity/connman/connman/0003-inet-
> Implement-APIs-for-creating-and-deleting-subnet.patch
> >>>>> b/meta/recipes-connectivity/connman/connman/0003-inet-
> Implement-APIs-for-creating-and-deleting-subnet.patch
> >>>>> deleted file mode 100644
> >>>>> index 56ba5c3f4b..0000000000
> >>>>> ---
> >>>>> a/meta/recipes-connectivity/connman/connman/0003-inet-
> Implement-APIs-for-creating-and-deleting-subnet.patch
> >>>>> +++ /dev/null
> >>>>> @@ -1,68 +0,0 @@
> >>>>> -From a9243f13d6e1aadd69bfcc27f75f69c38be51677 Mon Sep 17 00:00:00
> 2001
> >>>>> -From: Jian Liang <jianliang@tycoint.com>
> >>>>> -Date: Wed, 4 Oct 2017 17:30:17 +0100
> >>>>> -Subject: [PATCH 3/4] inet: Implement APIs for creating and deletin=
g
> >>>>> subnet
> >>>>> - route
> >>>>> -To: connman@lists.01.org
> >>>>> -Cc: wagi@monom.org
> >>>>> -
> >>>>> -Signed-off-by: Jian Liang <jianliang@tycoint.com>
> >>>>> -
> >>>>> ----
> >>>>> -Upstream-Status: Backport
> >>>>> [https://git.kernel.org/pub/scm/network/connman/connman.
> git/commit/?id=3D3a15b0b7fccd053aff91da2cc68585509d0c509b]
> >>>>> -Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> >>>>> - src/connman.h |  4 ++++
> >>>>> - src/inet.c    | 14 ++++++++++++++
> >>>>> - 2 files changed, 18 insertions(+)
> >>>>> -
> >>>>> -diff --git a/src/connman.h b/src/connman.h
> >>>>> -index 21b7080..da4446a 100644
> >>>>> ---- a/src/connman.h
> >>>>> -+++ b/src/connman.h
> >>>>> -@@ -240,7 +240,11 @@ int __connman_inet_rtnl_addattr32(struct
> nlmsghdr
> >>>>> *n, size_t maxlen,
> >>>>> - int __connman_inet_add_fwmark_rule(uint32_t table_id, int family,
> >>>>> uint32_t fwmark);
> >>>>> - int __connman_inet_del_fwmark_rule(uint32_t table_id, int family,
> >>>>> uint32_t fwmark);
> >>>>> - int __connman_inet_add_default_to_table(uint32_t table_id, int
> ifindex,
> >>>>> const char *gateway);
> >>>>> -+int __connman_inet_add_subnet_to_table(uint32_t table_id, int
> ifindex,
> >>>>> -+                      const char *gateway, unsigned char
> prefixlen);
> >>>>> - int __connman_inet_del_default_from_table(uint32_t table_id, int
> >>>>> ifindex, const char *gateway);
> >>>>> -+int __connman_inet_del_subnet_from_table(uint32_t table_id, int
> >>>>> ifindex,
> >>>>> -+                      const char *gateway, unsigned char
> prefixlen);
> >>>>> - int __connman_inet_get_address_netmask(int ifindex,
> >>>>> -               struct sockaddr_in *address, struct sockaddr_in
> >>>>> *netmask);
> >>>>> -
> >>>>> -diff --git a/src/inet.c b/src/inet.c
> >>>>> -index 0ddb030..dcd1ab2 100644
> >>>>> ---- a/src/inet.c
> >>>>> -+++ b/src/inet.c
> >>>>> -@@ -2880,6 +2880,13 @@ int __connman_inet_add_default_to_
> table(uint32_t
> >>>>> table_id, int ifindex,
> >>>>> -       return iproute_default_modify(RTM_NEWROUTE, table_id,
> ifindex,
> >>>>> gateway, 0);
> >>>>> - }
> >>>>> -
> >>>>> -+int __connman_inet_add_subnet_to_table(uint32_t table_id, int
> ifindex,
> >>>>> -+                                              const char *gateway=
,
> >>>>> unsigned char prefixlen)
> >>>>> -+{
> >>>>> -+      /* ip route add 1.2.3.4/24 dev eth0 table 1234 */
> >>>>> -+      return iproute_default_modify(RTM_NEWROUTE, table_id,
> ifindex,
> >>>>> gateway, prefixlen);
> >>>>> -+}
> >>>>> -+
> >>>>> - int __connman_inet_del_default_from_table(uint32_t table_id, int
> >>>>> ifindex,
> >>>>> -                                               const char *gateway=
)
> >>>>> - {
> >>>>> -@@ -2888,6 +2895,13 @@ int
> >>>>> __connman_inet_del_default_from_table(uint32_t table_id, int
> ifindex,
> >>>>> -       return iproute_default_modify(RTM_DELROUTE, table_id,
> ifindex,
> >>>>> gateway, 0);
> >>>>> - }
> >>>>> -
> >>>>> -+int __connman_inet_del_subnet_from_table(uint32_t table_id, int
> >>>>> ifindex,
> >>>>> -+                                              const char *gateway=
,
> >>>>> unsigned char prefixlen)
> >>>>> -+{
> >>>>> -+      /* ip route del 1.2.3.4/24 dev eth0 table 1234 */
> >>>>> -+      return iproute_default_modify(RTM_DELROUTE, table_id,
> ifindex,
> >>>>> gateway, prefixlen);
> >>>>> -+}
> >>>>> -+
> >>>>> - int __connman_inet_get_interface_ll_address(int index, int family=
,
> >>>>> -                                                               voi=
d
> >>>>> *address)
> >>>>> - {
> >>>>> ---
> >>>>> -2.7.4
> >>>>> -
> >>>>> diff --git
> >>>>> a/meta/recipes-connectivity/connman/connman/0004-session-
> Use-subnet-route-creation-and-deletion-APIs.patch
> >>>>> b/meta/recipes-connectivity/connman/connman/0004-session-
> Use-subnet-route-creation-and-deletion-APIs.patch
> >>>>> deleted file mode 100644
> >>>>> index ca213eb18b..0000000000
> >>>>> ---
> >>>>> a/meta/recipes-connectivity/connman/connman/0004-session-
> Use-subnet-route-creation-and-deletion-APIs.patch
> >>>>> +++ /dev/null
> >>>>> @@ -1,77 +0,0 @@
> >>>>> -From deb9372db8396da4f7cd20555ce7c9a8b3ad96bd Mon Sep 17 00:00:00
> 2001
> >>>>> -From: Jian Liang <jianliang@tycoint.com>
> >>>>> -Date: Fri, 6 Oct 2017 11:40:16 +0100
> >>>>> -Subject: [PATCH 4/4] session: Use subnet route creation and deleti=
on
> >>>>> APIs
> >>>>> -To: connman@lists.01.org
> >>>>> -Cc: wagi@monom.org
> >>>>> -
> >>>>> -As subnet route is address and session specific in this case, so a=
dd
> >>>>> -prefixlen into struct connman_session, and update it along with
> >>>>> ipconfig.
> >>>>> -Then use it in subnet route related APIs.
> >>>>> -
> >>>>> -Signed-off-by: Jian Liang <jianliang@tycoint.com>
> >>>>> -
> >>>>> ----
> >>>>> -Upstream-Status: Backport
> >>>>> [https://git.kernel.org/pub/scm/network/connman/connman.
> git/commit/?id=3D285f25ef6cc9e4a43dab83523f3e2eab4365ac26]
> >>>>> -Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> >>>>> - src/session.c | 20 ++++++++++++++++----
> >>>>> - 1 file changed, 16 insertions(+), 4 deletions(-)
> >>>>> -
> >>>>> -diff --git a/src/session.c b/src/session.c
> >>>>> -index 965ac06..7b7a14b 100644
> >>>>> ---- a/src/session.c
> >>>>> -+++ b/src/session.c
> >>>>> -@@ -67,6 +67,7 @@ struct connman_session {
> >>>>> -       int index;
> >>>>> -       char *addr;
> >>>>> -       char *gateway;
> >>>>> -+      unsigned char prefixlen;
> >>>>> -       bool policy_routing;
> >>>>> -       bool snat_enabled;
> >>>>> - };
> >>>>> -@@ -357,13 +358,17 @@ static void del_default_route(struct
> >>>>> connman_session *session)
> >>>>> -       if (!session->gateway)
> >>>>> -               return;
> >>>>> -
> >>>>> --      DBG("index %d routing table %d default gateway %s",
> >>>>> --              session->index, session->mark, session->gateway);
> >>>>> -+      DBG("index %d routing table %d default gateway %s/%u",
> >>>>> -+              session->index, session->mark, session->gateway,
> >>>>> session->prefixlen);
> >>>>> -+
> >>>>> -+              __connman_inet_del_subnet_from_table(session->mark,
> >>>>> -+                      session->index, session->gateway,
> >>>>> session->prefixlen);
> >>>>> -
> >>>>> -       __connman_inet_del_default_from_table(session->mark,
> >>>>> -                                       session->index,
> >>>>> session->gateway);
> >>>>> -       g_free(session->gateway);
> >>>>> -       session->gateway =3D NULL;
> >>>>> -+      session->prefixlen =3D 0;
> >>>>> -       session->index =3D -1;
> >>>>> - }
> >>>>> -
> >>>>> -@@ -383,13 +388,20 @@ static void add_default_route(struct
> >>>>> connman_session *session)
> >>>>> -       if (!session->gateway)
> >>>>> -               session->gateway =3D g_strdup(inet_ntoa(addr));
> >>>>> -
> >>>>> --      DBG("index %d routing table %d default gateway %s",
> >>>>> --              session->index, session->mark, session->gateway);
> >>>>> -+      session->prefixlen =3D __connman_ipconfig_get_
> prefixlen(ipconfig);
> >>>>> -+
> >>>>> -+      DBG("index %d routing table %d default gateway %s/%u",
> >>>>> -+              session->index, session->mark, session->gateway,
> >>>>> session->prefixlen);
> >>>>> -
> >>>>> -       err =3D __connman_inet_add_default_to_table(session->mark,
> >>>>> -                                       session->index,
> >>>>> session->gateway);
> >>>>> -       if (err < 0)
> >>>>> -               DBG("session %p %s", session, strerror(-err));
> >>>>> -+
> >>>>> -+      err =3D __connman_inet_add_subnet_to_table(session->mark,
> >>>>> -+                                      session->index,
> session->gateway,
> >>>>> session->prefixlen);
> >>>>> -+      if (err < 0)
> >>>>> -+              DBG("session add subnet route %p %s", session,
> >>>>> strerror(-err));
> >>>>> - }
> >>>>> -
> >>>>> - static void del_nat_rules(struct connman_session *session)
> >>>>> ---
> >>>>> -2.7.4
> >>>>> -
> >>>>> diff --git a/meta/recipes-connectivity/connman/connman_1.35.bb
> >>>>> b/meta/recipes-connectivity/connman/connman_1.35.bb
> >>>>> deleted file mode 100644
> >>>>> index ff2118113f..0000000000
> >>>>> --- a/meta/recipes-connectivity/connman/connman_1.35.bb
> >>>>> +++ /dev/null
> >>>>> @@ -1,22 +0,0 @@
> >>>>> -require connman.inc
> >>>>> -
> >>>>> -SRC_URI  =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.x=
z \
> >>>>> -
> >>>>> file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.pa=
tch
> \
> >>>>> -
> >>>>> file://0001-connman.service-stop-systemd-resolved-when-we-use-co.pa=
tch
> \
> >>>>> -            file://connman \
> >>>>> -            file://no-version-scripts.patch \
> >>>>> -            file://includes.patch \
> >>>>> -
> >>>>> file://0001-session-Keep-track-of-addr-in-fw_snat-session.patch \
> >>>>> -            file://0001-giognutls-Fix-a-crash-using-wispr-over-TLS=
.
> patch
> >>>>> \
> >>>>> -
> >>>>> file://0001-inet-Add-prefixlen-to-iproute_default_function.patch \
> >>>>> -
> >>>>> file://0002-inet-Implement-subnet-route-creation-deletion-in-ipr.pa=
tch
> \
> >>>>> -
> >>>>> file://0003-inet-Implement-APIs-for-creating-and-deleting-subnet.pa=
tch
> \
> >>>>> -
> >>>>> file://0004-session-Use-subnet-route-creation-and-deletion-APIs.pat=
ch
> \
> >>>>> -            "
> >>>>> -SRC_URI_append_libc-musl =3D "
> >>>>> file://0002-resolve-musl-does-not-implement-res_ninit.patch \
> >>>>> -                             "
> >>>>> -
> >>>>> -SRC_URI[md5sum] =3D "bae37b45ee9b3db5ec8115188f8a7652"
> >>>>> -SRC_URI[sha256sum] =3D
> >>>>> "66d7deb98371545c6e417239a9b3b3e3201c1529d08eedf40afbc859842cf2aa"
> >>>>> -
> >>>>> -RRECOMMENDS_${PN} =3D "connman-conf"
> >>>>> diff --git a/meta/recipes-connectivity/connman/connman_1.36.bb
> >>>>> b/meta/recipes-connectivity/connman/connman_1.36.bb
> >>>>> new file mode 100644
> >>>>> index 0000000000..62c89b1e5d
> >>>>> --- /dev/null
> >>>>> +++ b/meta/recipes-connectivity/connman/connman_1.36.bb
> >>>>> @@ -0,0 +1,17 @@
> >>>>> +require connman.inc
> >>>>> +
> >>>>> +SRC_URI  =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.x=
z \
> >>>>> +
> >>>>> file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.pa=
tch
> \
> >>>>> +
> >>>>> file://0001-connman.service-stop-systemd-resolved-when-we-use-co.pa=
tch
> \
> >>>>> +            file://connman \
> >>>>> +            file://no-version-scripts.patch \
> >>>>> +            file://0001-Use-AC_USE_SYSTEM_EXTENSIONS.patch \
> >>>>> +"
> >>>>> +
> >>>>> +SRC_URI_append_libc-musl =3D "
> >>>>> file://0002-resolve-musl-does-not-implement-res_ninit.patch \
> >>>>> +"
> >>>>> +
> >>>>> +SRC_URI[md5sum] =3D "dae77d9c904d2c223ae849e32079d57e"
> >>>>> +SRC_URI[sha256sum] =3D
> >>>>> "c789db41cc443fa41e661217ea321492ad59a004bebcd1aa013f3bc10a6e0074"
> >>>>> +
> >>>>> +RRECOMMENDS_${PN} =3D "connman-conf"
> >>>>> --
> >>>>> 2.17.1
> >>>>>
> >>>>> --
> >>>>> _______________________________________________
> >>>>> Openembedded-core mailing list
> >>>>> Openembedded-core@lists.openembedded.org
> >>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--=20
Oleksandr Kravchuk
http://oleksandr-kravchuk.com/

--00000000000037b737057636dc5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Those two patches were mainstreamed, which will be describ=
ed in the new commit message as was requested.</div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On Wed, Sep 19, 2018 at 9:49 AM, Alexand=
er Kanavin <span dir=3D"ltr">&lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Well, no. The patch file contains three different pat=
ches, all fixing<br>
different things, and this information about the second and third one<br>
for instance has vanished:<br>
<span class=3D""><br>
-From b8b7878e6cb2a1ed4fcfa256f7e232<wbr>511a40e3d9 Mon Sep 17 00:00:00 200=
1<br>
-From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton=
@intel.com</a>&gt;<br>
-Date: Tue, 9 Aug 2016 15:37:50 +0100<br>
-Subject: [PATCH 2/3] Check for in6_pktinfo.ipi6_addr explicitly<br>
-<br>
-Instead of assuming that just glibc has this structure, check for it at<br=
>
-configure as musl also has it.<br>
-<br>
-Based on work by Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.kh=
em@gmail.com</a>&gt;.<br>
<br>
<br>
</span><span class=3D"">-From c0726e432fa0274a2b9c70179b03df<wbr>6720972816=
 Mon Sep 17 00:00:00 2001<br>
-From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton=
@intel.com</a>&gt;<br>
-Date: Tue, 9 Aug 2016 15:19:23 +0100<br>
-Subject: [PATCH 3/3] Rationalise includes<br>
-<br>
-gweb/gresolv.c uses snprintf() and isspace() so it should include stdio.h =
and<br>
-ctype.h.<br>
-<br>
-tools/dnsproxy-test uses functions from stdio.h.<br>
-<br>
-musl warns when sys/ headers are included when the non-sys form should be =
used,<br>
-so switch sys/errno.h and so on to errno.h.<br>
-<br>
-musl also causes redefinition errors when pieces of the networking headers=
 are<br>
-included, so remove the redundant includes.<br>
-<br>
-Based on work by Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.kh=
em@gmail.com</a>&gt;.<br>
<br>
</span>Alex<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
2018-09-19 0:24 GMT+02:00 Oleksandr Kravchuk<br>
&lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com">open.source@oleks=
andr-<wbr>kravchuk.com</a>&gt;:<br>
&gt; Sorry for the delay. This patch hasn&#39;t really been changed much: i=
t was<br>
&gt; simply rebased, renamed and converted into git format. Would it be<br>
&gt; enough to keep it the way it is and describe the changes in the commit=
<br>
&gt; message?<br>
&gt;<br>
&gt; On 13/09/2018 23:38, Alexander Kanavin wrote:<br>
&gt;&gt; This one:<br>
&gt;&gt; rename meta/recipes-connectivity/<wbr>connman/connman/{includes.<w=
br>patch =3D&gt;<br>
&gt;&gt; 0001-Use-AC_USE_SYSTEM_<wbr>EXTENSIONS.patch} (68%)<br>
&gt;&gt;<br>
&gt;&gt; I think you should make two commits: one that splits this patch in=
<br>
&gt;&gt; three, and another which actually does the version update.<br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt; 2018-09-13 23:08 GMT+02:00 Oleksandr Kravchuk<br>
&gt;&gt; &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com">open.sou=
rce@oleksandr-<wbr>kravchuk.com</a>&gt;:<br>
&gt;&gt;&gt; Sure, will do.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Also, one patch is changed in a way that makes it lose=
 significant amount<br>
&gt;&gt;&gt;&gt;&gt; of information (it&#39;s an amalgamation of three patc=
hes)<br>
&gt;&gt;&gt; Could you please clarify which one do you mean? Thank you.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 9/13/18 9:46 PM, Alexander Kanavin wrote:<br>
&gt;&gt;&gt;&gt; Please explain the changes to patches (not as a reply to m=
e, but in<br>
&gt;&gt;&gt;&gt; the commit message itself).<br>
&gt;&gt;&gt;&gt; If they are deleted because upstream already has them, it =
should be<br>
&gt;&gt;&gt;&gt; mentioned explicitly.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Also, one patch is changed in a way that makes it lose sig=
nificant<br>
&gt;&gt;&gt;&gt; amount of information<br>
&gt;&gt;&gt;&gt; (it&#39;s an amalgamation of three patches). Perhaps we sh=
ould just split<br>
&gt;&gt;&gt;&gt; it in three?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Alex<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; 2018-09-13 21:04 GMT+02:00 Oleksandr Kravchuk<br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com">=
open.source@oleksandr-<wbr>kravchuk.com</a>&gt;:<br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Oleksandr Kravchuk &lt;<a href=3D"mailt=
o:dev@sashko.rv.ua">dev@sashko.rv.ua</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0meta/recipes-connectivity/<wbr>connman/con=
nman.inc |=C2=A0 =C2=A02 +-<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0...&gt; 0001-Use-AC_USE_SYSTEM_<wbr>EXTENS=
IONS.patch} | 446 ++++++++----------<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0...tls-Fix-a-crash-using-<wbr>wispr-over-T=
LS.patch |=C2=A0 41 --<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0...refixlen-to-iproute_<wbr>default_functi=
on.patch |=C2=A0 63 ---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0...eep-track-of-addr-in-fw_<wbr>snat-sessi=
on.patch | 112 -----<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0...ubnet-route-creation-<wbr>deletion-in-i=
pr.patch |=C2=A0 69 ---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0...PIs-for-creating-and-<wbr>deleting-subn=
et.patch |=C2=A0 68 ---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0...net-route-creation-and-<wbr>deletion-AP=
Is.patch |=C2=A0 77 ---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../connman/<a href=3D"http://connman_1.35=
.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.35.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 22 -<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0.../connman/<a href=3D"http://connman_1.36=
.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.36.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 17 +<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A010 files changed, 212 insertions(+), 705 d=
eletions(-)<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0rename meta/recipes-connectivity/<wbr>conn=
man/connman/{includes.<wbr>patch =3D&gt;<br>
&gt;&gt;&gt;&gt;&gt; 0001-Use-AC_USE_SYSTEM_<wbr>EXTENSIONS.patch} (68%)<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0delete mode 100644<br>
&gt;&gt;&gt;&gt;&gt; meta/recipes-connectivity/<wbr>connman/connman/0001-<w=
br>giognutls-Fix-a-crash-using-<wbr>wispr-over-TLS.patch<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0delete mode 100644<br>
&gt;&gt;&gt;&gt;&gt; meta/recipes-connectivity/<wbr>connman/connman/0001-in=
et-Add-<wbr>prefixlen-to-iproute_default_<wbr>function.patch<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0delete mode 100644<br>
&gt;&gt;&gt;&gt;&gt; meta/recipes-connectivity/<wbr>connman/connman/0001-se=
ssion-<wbr>Keep-track-of-addr-in-fw_snat-<wbr>session.patch<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0delete mode 100644<br>
&gt;&gt;&gt;&gt;&gt; meta/recipes-connectivity/<wbr>connman/connman/0002-in=
et-<wbr>Implement-subnet-route-<wbr>creation-deletion-in-ipr.patch<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0delete mode 100644<br>
&gt;&gt;&gt;&gt;&gt; meta/recipes-connectivity/<wbr>connman/connman/0003-in=
et-<wbr>Implement-APIs-for-creating-<wbr>and-deleting-subnet.patch<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0delete mode 100644<br>
&gt;&gt;&gt;&gt;&gt; meta/recipes-connectivity/<wbr>connman/connman/0004-se=
ssion-<wbr>Use-subnet-route-creation-and-<wbr>deletion-APIs.patch<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-connectivi=
ty/<wbr>connman/<a href=3D"http://connman_1.35.bb" rel=3D"noreferrer" targe=
t=3D"_blank">connman_1.35.bb</a><br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-connectivi=
ty/<wbr>connman/<a href=3D"http://connman_1.36.bb" rel=3D"noreferrer" targe=
t=3D"_blank">connman_1.36.bb</a><br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/meta/recipes-connectivity/<wbr>connman/co=
nnman.inc<br>
&gt;&gt;&gt;&gt;&gt; b/meta/recipes-connectivity/<wbr>connman/connman.inc<b=
r>
&gt;&gt;&gt;&gt;&gt; index 2b03f9cb06..0ba375137d 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/meta/recipes-connectivity/<wbr>connman/connman.i=
nc<br>
&gt;&gt;&gt;&gt;&gt; +++ b/meta/recipes-connectivity/<wbr>connman/connman.i=
nc<br>
&gt;&gt;&gt;&gt;&gt; @@ -156,7 +156,7 @@ RDEPENDS_${PN}-client =3D&quot;${P=
N}&quot;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0FILES_${PN} =3D &quot;${bindir}/* ${sbindi=
r}/* ${libexecdir}/*<br>
&gt;&gt;&gt;&gt;&gt; ${libdir}/lib*.so.* \<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
${libdir}/connman/plugins \<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdi=
r} ${sharedstatedir} ${localstatedir} \<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdi=
r} ${sharedstatedir} ${localstatedir} ${datadir}<br>
&gt;&gt;&gt;&gt;&gt; \<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so*<br>
&gt;&gt;&gt;&gt;&gt; ${datadir}/${PN} \<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
${datadir}/dbus-1/system-<wbr>services/* \<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
${sysconfdir}/tmpfiles.d/<wbr>connman_resolvconf.conf&quot;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/meta/recipes-connectivity/<wbr>connman/co=
nnman/includes.patch<br>
&gt;&gt;&gt;&gt;&gt; b/meta/recipes-connectivity/<wbr>connman/connman/0001-=
Use-AC_<wbr>USE_SYSTEM_EXTENSIONS.patch<br>
&gt;&gt;&gt;&gt;&gt; similarity index 68%<br>
&gt;&gt;&gt;&gt;&gt; rename from meta/recipes-connectivity/<wbr>connman/con=
nman/includes.patch<br>
&gt;&gt;&gt;&gt;&gt; rename to<br>
&gt;&gt;&gt;&gt;&gt; meta/recipes-connectivity/<wbr>connman/connman/0001-Us=
e-AC_<wbr>USE_SYSTEM_EXTENSIONS.patch<br>
&gt;&gt;&gt;&gt;&gt; index 55cb187931..e826bf002d 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/meta/recipes-connectivity/<wbr>connman/connman/i=
ncludes.patch<br>
&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;&gt; b/meta/recipes-connectivity/<wbr>connman/connman/0001-=
Use-AC_<wbr>USE_SYSTEM_EXTENSIONS.patch<br>
&gt;&gt;&gt;&gt;&gt; @@ -1,36 +1,40 @@<br>
&gt;&gt;&gt;&gt;&gt; -Fix various issues which cause problems under musl.<b=
r>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -Upstream-Status: Submitted<br>
&gt;&gt;&gt;&gt;&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross=
.burton@intel.com">ross.burton@intel.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -From 630516bcc0233b047f65665c003201<wbr>ba6e77453d Mo=
n Sep 17 00:00:00 2001<br>
&gt;&gt;&gt;&gt;&gt; +From 56fc228eebadc546d969a7073caf14<wbr>d465ef3e5a Mo=
n Sep 17 00:00:00 2001<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0From: Ross Burton &lt;<a href=3D"mailto:ro=
ss.burton@intel.com">ross.burton@intel.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -Date: Tue, 9 Aug 2016 16:22:36 +0100<br>
&gt;&gt;&gt;&gt;&gt; -Subject: [PATCH 1/3] Use AC_USE_SYSTEM_EXTENSIONS<br>
&gt;&gt;&gt;&gt;&gt; +Date: Thu, 13 Sep 2018 19:57:54 +0200<br>
&gt;&gt;&gt;&gt;&gt; +Subject: [PATCH] Use AC_USE_SYSTEM_EXTENSIONS<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; -Instead of using #define _GNU_SOURCE in some source f=
iles which causes<br>
&gt;&gt;&gt;&gt;&gt; problems<br>
&gt;&gt;&gt;&gt;&gt; -when building with musl as more files need the define=
, simply use<br>
&gt;&gt;&gt;&gt;&gt; -AC_USE_SYSTEM_EXTENSIONS in <a href=3D"http://configu=
re.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a> to get it defi=
ned globally.<br>
&gt;&gt;&gt;&gt;&gt; +Instead of using #define _GNU_SOURCE in some source f=
iles which causes<br>
&gt;&gt;&gt;&gt;&gt; +problems when building with musl as more files need t=
he define, simply<br>
&gt;&gt;&gt;&gt;&gt; +use AC_USE_SYSTEM_EXTENSIONS in <a href=3D"http://con=
figure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a> to get it =
defined globally.<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0---<br>
&gt;&gt;&gt;&gt;&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;&gt;&gt;&gt;&gt; - gdhcp/client.c=C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; - plugins/tist.c=C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; - src/backtrace.c=C2=A0 =C2=A0 | 1 -<br>
&gt;&gt;&gt;&gt;&gt; - src/inet.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br=
>
&gt;&gt;&gt;&gt;&gt; - src/log.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br=
>
&gt;&gt;&gt;&gt;&gt; - src/ntp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br=
>
&gt;&gt;&gt;&gt;&gt; - src/resolver.c=C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; - src/rfkill.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; - src/stats.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt;&gt;&gt;&gt;&gt; - src/timezone.c=C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; - tools/stats-tool.c | 1 -<br>
&gt;&gt;&gt;&gt;&gt; - tools/tap-test.c=C2=A0 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; - tools/wispr.c=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt;&gt;&gt;&gt;&gt; - vpn/plugins/vpn.c=C2=A0 | 1 -<br>
&gt;&gt;&gt;&gt;&gt; - 15 files changed, 1 insertion(+), 14 deletions(-)<br=
>
&gt;&gt;&gt;&gt;&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 3 +++<br>
&gt;&gt;&gt;&gt;&gt; + gdhcp/client.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; + gdhcp/common.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 5 +++--<br>
&gt;&gt;&gt;&gt;&gt; + gweb/gresolv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;&gt;&gt;&gt;&gt; + plugins/tist.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; + plugins/wifi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 3 +--<br>
&gt;&gt;&gt;&gt;&gt; + src/backtrace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
&gt;&gt;&gt;&gt;&gt; + src/inet.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; + src/ippool.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; + src/iptables.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;&gt;&gt;&gt;&gt; + src/log.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt;&gt;&gt;&gt;&gt; + src/ntp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt;&gt;&gt;&gt;&gt; + src/resolver.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; + src/rfkill.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; + src/stats.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt;&gt;&gt;&gt;&gt; + src/tethering.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 --<br>
&gt;&gt;&gt;&gt;&gt; + src/timezone.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; + tools/dhcp-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
&gt;&gt;&gt;&gt;&gt; + tools/dnsproxy-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
 +<br>
&gt;&gt;&gt;&gt;&gt; + tools/private-network-test.c | 2 +-<br>
&gt;&gt;&gt;&gt;&gt; + tools/stats-tool.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; + tools/tap-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 3 +--<br>
&gt;&gt;&gt;&gt;&gt; + tools/wispr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt;&gt;&gt;&gt;&gt; + vpn/plugins/vpn.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
&gt;&gt;&gt;&gt;&gt; + 24 files changed, 13 insertions(+), 25 deletions(-)<=
br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/<a href=3D"http://configure.a=
c" rel=3D"noreferrer" target=3D"_blank">configure.ac</a> b/<a href=3D"http:=
//configure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt;&gt;&gt;&gt;&gt; -index 6e66ab3..bacf5ec 100644<br>
&gt;&gt;&gt;&gt;&gt; +index 39745f76..984126c2 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/<a href=3D"http://configure.ac" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/<a href=3D"http://configure.ac" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0@@ -20,6 +20,7 @@ AC_SUBST(abs_top_srcdir)=
<br>
&gt;&gt;&gt;&gt;&gt; @@ -41,8 +45,17 @@ index 6e66ab3..bacf5ec 100644<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 AC_PROG_CC<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 AM_PROG_CC_C_O<br>
&gt;&gt;&gt;&gt;&gt; +@@ -185,6 +186,8 @@ AC_CHECK_LIB(resolv, ns_initparse=
, dummy=3Dyes, [<br>
&gt;&gt;&gt;&gt;&gt; + AC_CHECK_HEADERS([execinfo.h])<br>
&gt;&gt;&gt;&gt;&gt; + AM_CONDITIONAL([BACKTRACE], [test &quot;${ac_cv_head=
er_execinfo_h}&quot; =3D<br>
&gt;&gt;&gt;&gt;&gt; &quot;yes&quot;])<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; ++AC_CHECK_MEMBERS([struct in6_pktinfo.ipi6_addr], [],=
 [], [[#include<br>
&gt;&gt;&gt;&gt;&gt; &lt;netinet/in.h&gt;]])<br>
&gt;&gt;&gt;&gt;&gt; ++<br>
&gt;&gt;&gt;&gt;&gt; + AC_CHECK_FUNC(signalfd, dummy=3Dyes,<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR(signalfd support is required))<=
br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/gdhcp/client.c b/gdhcp/client=
.c<br>
&gt;&gt;&gt;&gt;&gt; -index fbb40ab..3aeb089 100644<br>
&gt;&gt;&gt;&gt;&gt; +index 67357782..c7db76f0 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/gdhcp/client.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/gdhcp/client.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0@@ -23,7 +23,6 @@<br>
&gt;&gt;&gt;&gt;&gt; @@ -53,8 +66,49 @@ index fbb40ab..3aeb089 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +diff --git a/gdhcp/common.h b/gdhcp/common.h<br>
&gt;&gt;&gt;&gt;&gt; +index 75abc183..6899499e 100644<br>
&gt;&gt;&gt;&gt;&gt; +--- a/gdhcp/common.h<br>
&gt;&gt;&gt;&gt;&gt; ++++ b/gdhcp/common.h<br>
&gt;&gt;&gt;&gt;&gt; +@@ -19,6 +19,7 @@<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 *<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 */<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; ++#include &lt;config.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;netinet/udp.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;netinet/ip.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +@@ -170,8 +171,8 @@ static const uint8_t dhcp_option_=
lengths[] =3D {<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[OPTION_U32]=C2=A0 =C2=A0 =
=3D 4,<br>
&gt;&gt;&gt;&gt;&gt; + };<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +-/* already defined within netinet/in.h if using GNU =
compiler */<br>
&gt;&gt;&gt;&gt;&gt; +-#ifndef __USE_GNU<br>
&gt;&gt;&gt;&gt;&gt; ++/* already defined within netinet/in.h if using glib=
c or musl */<br>
&gt;&gt;&gt;&gt;&gt; ++#ifndef HAVE_STRUCT_IN6_PKTINFO_IPI6_<wbr>ADDR<br>
&gt;&gt;&gt;&gt;&gt; + struct in6_pktinfo {<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct in6_addr ipi6_addr;=
=C2=A0 /* src/dst IPv6 address */<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int ipi6_ifindex;=
=C2=A0 /* send/recv interface index */<br>
&gt;&gt;&gt;&gt;&gt; +diff --git a/gweb/gresolv.c b/gweb/gresolv.c<br>
&gt;&gt;&gt;&gt;&gt; +index 81c79b6c..180e57ba 100644<br>
&gt;&gt;&gt;&gt;&gt; +--- a/gweb/gresolv.c<br>
&gt;&gt;&gt;&gt;&gt; ++++ b/gweb/gresolv.c<br>
&gt;&gt;&gt;&gt;&gt; +@@ -23,11 +23,13 @@<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;config.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #endif<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; ++#include &lt;ctype.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;stdarg.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;string.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;stdlib.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; ++#include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;resolv.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;sys/types.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;sys/socket.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/plugins/tist.c b/plugins/tist=
.c<br>
&gt;&gt;&gt;&gt;&gt; -index ad5ef79..cc2800a 100644<br>
&gt;&gt;&gt;&gt;&gt; +index ad5ef79e..cc2800a1 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/plugins/tist.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/plugins/tist.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0@@ -23,7 +23,6 @@<br>
&gt;&gt;&gt;&gt;&gt; @@ -65,8 +119,23 @@ index ad5ef79..cc2800a 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;stdbool.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;stdlib.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +diff --git a/plugins/wifi.c b/plugins/wifi.c<br>
&gt;&gt;&gt;&gt;&gt; +index dc08c6af..46e4cca4 100644<br>
&gt;&gt;&gt;&gt;&gt; +--- a/plugins/wifi.c<br>
&gt;&gt;&gt;&gt;&gt; ++++ b/plugins/wifi.c<br>
&gt;&gt;&gt;&gt;&gt; +@@ -30,9 +30,8 @@<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;string.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;sys/ioctl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;sys/socket.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +-#include &lt;linux/if_arp.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +-#include &lt;linux/wireless.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;net/ethernet.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; ++#include &lt;linux/wireless.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; + #ifndef IFF_LOWER_UP<br>
&gt;&gt;&gt;&gt;&gt; + #define IFF_LOWER_UP=C2=A0 0x10000<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/src/backtrace.c b/src/backtra=
ce.c<br>
&gt;&gt;&gt;&gt;&gt; -index 6a66c0a..4dbdda8 100644<br>
&gt;&gt;&gt;&gt;&gt; +index e8d7f432..bede6698 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/src/backtrace.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/src/backtrace.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0@@ -24,7 +24,6 @@<br>
&gt;&gt;&gt;&gt;&gt; @@ -78,7 +147,7 @@ index 6a66c0a..4dbdda8 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;stdlib.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/src/inet.c b/src/inet.c<br>
&gt;&gt;&gt;&gt;&gt; -index 69ded19..81d92c2 100644<br>
&gt;&gt;&gt;&gt;&gt; +index a31372b5..a58ce7c1 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/src/inet.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/src/inet.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0@@ -25,7 +25,6 @@<br>
&gt;&gt;&gt;&gt;&gt; @@ -89,8 +158,33 @@ index 69ded19..81d92c2 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +diff --git a/src/ippool.c b/src/ippool.c<br>
&gt;&gt;&gt;&gt;&gt; +index cea1dccd..8a645da2 100644<br>
&gt;&gt;&gt;&gt;&gt; +--- a/src/ippool.c<br>
&gt;&gt;&gt;&gt;&gt; ++++ b/src/ippool.c<br>
&gt;&gt;&gt;&gt;&gt; +@@ -28,7 +28,6 @@<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;string.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +-#include &lt;sys/errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;sys/socket.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; + #include &quot;connman.h&quot;<br>
&gt;&gt;&gt;&gt;&gt; +diff --git a/src/iptables.c b/src/iptables.c<br>
&gt;&gt;&gt;&gt;&gt; +index f3670e77..469effed 100644<br>
&gt;&gt;&gt;&gt;&gt; +--- a/src/iptables.c<br>
&gt;&gt;&gt;&gt;&gt; ++++ b/src/iptables.c<br>
&gt;&gt;&gt;&gt;&gt; +@@ -28,7 +28,7 @@<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;string.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +-#include &lt;sys/errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; ++#include &lt;errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;sys/socket.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;xtables.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;inttypes.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/src/log.c b/src/log.c<br>
&gt;&gt;&gt;&gt;&gt; -index 9bae4a3..f7e82e5 100644<br>
&gt;&gt;&gt;&gt;&gt; +index 9bae4a3d..f7e82e5d 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/src/log.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/src/log.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0@@ -23,7 +23,6 @@<br>
&gt;&gt;&gt;&gt;&gt; @@ -102,7 +196,7 @@ index 9bae4a3..f7e82e5 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;stdarg.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/src/ntp.c b/src/ntp.c<br>
&gt;&gt;&gt;&gt;&gt; -index dd246eb..db8ae96 100644<br>
&gt;&gt;&gt;&gt;&gt; +index 51ba9aac..724ca188 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/src/ntp.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/src/ntp.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0@@ -23,7 +23,6 @@<br>
&gt;&gt;&gt;&gt;&gt; @@ -114,7 +208,7 @@ index dd246eb..db8ae96 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;fcntl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/src/resolver.c b/src/resolver=
.c<br>
&gt;&gt;&gt;&gt;&gt; -index fbe4be7..ef61f92 100644<br>
&gt;&gt;&gt;&gt;&gt; +index 76f0a8e1..10121aa5 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/src/resolver.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/src/resolver.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0@@ -23,7 +23,6 @@<br>
&gt;&gt;&gt;&gt;&gt; @@ -126,7 +220,7 @@ index fbe4be7..ef61f92 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;fcntl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/src/rfkill.c b/src/rfkill.c<b=
r>
&gt;&gt;&gt;&gt;&gt; -index 2bfb092..af49d12 100644<br>
&gt;&gt;&gt;&gt;&gt; +index d9bed4d2..b2514c41 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/src/rfkill.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/src/rfkill.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0@@ -23,7 +23,6 @@<br>
&gt;&gt;&gt;&gt;&gt; @@ -138,7 +232,7 @@ index 2bfb092..af49d12 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;fcntl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/src/stats.c b/src/stats.c<br>
&gt;&gt;&gt;&gt;&gt; -index 26343b1..cfcdc94 100644<br>
&gt;&gt;&gt;&gt;&gt; +index 663bc382..c9ddc2e8 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/src/stats.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/src/stats.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0@@ -23,7 +23,6 @@<br>
&gt;&gt;&gt;&gt;&gt; @@ -149,8 +243,21 @@ index 26343b1..cfcdc94 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;sys/mman.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;sys/types.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +diff --git a/src/tethering.c b/src/tethering.c<br>
&gt;&gt;&gt;&gt;&gt; +index 4b202369..f3cb36f4 100644<br>
&gt;&gt;&gt;&gt;&gt; +--- a/src/tethering.c<br>
&gt;&gt;&gt;&gt;&gt; ++++ b/src/tethering.c<br>
&gt;&gt;&gt;&gt;&gt; +@@ -34,8 +34,6 @@<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;string.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;fcntl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;netinet/in.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +-#include &lt;linux/sockios.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +-#include &lt;linux/if_tun.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;linux/if_bridge.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; + #include &quot;connman.h&quot;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/src/timezone.c b/src/timezone=
.c<br>
&gt;&gt;&gt;&gt;&gt; -index e346b11..8e91267 100644<br>
&gt;&gt;&gt;&gt;&gt; +index e346b11a..8e912670 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/src/timezone.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/src/timezone.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0@@ -23,7 +23,6 @@<br>
&gt;&gt;&gt;&gt;&gt; @@ -161,216 +268,8 @@ index e346b11..8e91267 100644<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;fcntl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/tools/stats-tool.c b/tools/stats-tool.c<=
br>
&gt;&gt;&gt;&gt;&gt; -index b076478..428d94b 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/tools/stats-tool.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/tools/stats-tool.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -22,7 +22,6 @@<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;config.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #endif<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; --#define _GNU_SOURCE<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;sys/mman.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;sys/types.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;sys/stat.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/tools/tap-test.c b/tools/tap-test.c<br>
&gt;&gt;&gt;&gt;&gt; -index fdc098a..57917f5 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/tools/tap-test.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/tools/tap-test.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -23,7 +23,6 @@<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;config.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #endif<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; --#define _GNU_SOURCE<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;fcntl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/tools/wispr.c b/tools/wispr.c<br>
&gt;&gt;&gt;&gt;&gt; -index d5f9341..e56dfc1 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/tools/wispr.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/tools/wispr.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -23,7 +23,6 @@<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;config.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #endif<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; --#define _GNU_SOURCE<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;fcntl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/vpn/plugins/vpn.c b/vpn/plugins/vpn.c<br=
>
&gt;&gt;&gt;&gt;&gt; -index 9a42385..479c3a7 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/vpn/plugins/vpn.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/vpn/plugins/vpn.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -23,7 +23,6 @@<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;config.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #endif<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; --#define _GNU_SOURCE<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;string.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;fcntl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; -2.8.1<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -From b8b7878e6cb2a1ed4fcfa256f7e232<wbr>511a40e3d9 Mo=
n Sep 17 00:00:00 2001<br>
&gt;&gt;&gt;&gt;&gt; -From: Ross Burton &lt;<a href=3D"mailto:ross.burton@i=
ntel.com">ross.burton@intel.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -Date: Tue, 9 Aug 2016 15:37:50 +0100<br>
&gt;&gt;&gt;&gt;&gt; -Subject: [PATCH 2/3] Check for in6_pktinfo.ipi6_addr =
explicitly<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -Instead of assuming that just glibc has this structur=
e, check for it at<br>
&gt;&gt;&gt;&gt;&gt; -configure as musl also has it.<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -Based on work by Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com">raj.khem@gmail.com</a>&gt;.<br>
&gt;&gt;&gt;&gt;&gt; ----<br>
&gt;&gt;&gt;&gt;&gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a>=C2=A0 =C2=A0| 2 ++<br>
&gt;&gt;&gt;&gt;&gt; - gdhcp/common.h | 5 +++--<br>
&gt;&gt;&gt;&gt;&gt; - 2 files changed, 5 insertions(+), 2 deletions(-)<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"n=
oreferrer" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure=
.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt;&gt;&gt;&gt;&gt; -index bacf5ec..ad00456 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a><br>
&gt;&gt;&gt;&gt;&gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a><br>
&gt;&gt;&gt;&gt;&gt; -@@ -186,6 +186,8 @@ AC_CHECK_LIB(resolv, ns_initparse=
, dummy=3Dyes, [<br>
&gt;&gt;&gt;&gt;&gt; - AC_CHECK_HEADERS([execinfo.h])<br>
&gt;&gt;&gt;&gt;&gt; - AM_CONDITIONAL([BACKTRACE], [test &quot;${ac_cv_head=
er_execinfo_h}&quot; =3D<br>
&gt;&gt;&gt;&gt;&gt; &quot;yes&quot;])<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -+AC_CHECK_MEMBERS([struct in6_pktinfo.ipi6_addr], [],=
 [], [[#include<br>
&gt;&gt;&gt;&gt;&gt; &lt;netinet/in.h&gt;]])<br>
&gt;&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt;&gt; - AC_CHECK_FUNC(signalfd, dummy=3Dyes,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR(signalfd support is required))<=
br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/gdhcp/common.h b/gdhcp/common.h<br>
&gt;&gt;&gt;&gt;&gt; -index 75abc18..6899499 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/gdhcp/common.h<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/gdhcp/common.h<br>
&gt;&gt;&gt;&gt;&gt; -@@ -19,6 +19,7 @@<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 *<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 */<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -+#include &lt;config.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;netinet/udp.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;netinet/ip.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -@@ -170,8 +171,8 @@ static const uint8_t dhcp_option_=
lengths[] =3D {<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0[OPTION_U32]=C2=A0 =C2=A0 =
=3D 4,<br>
&gt;&gt;&gt;&gt;&gt; - };<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; --/* already defined within netinet/in.h if using GNU =
compiler */<br>
&gt;&gt;&gt;&gt;&gt; --#ifndef __USE_GNU<br>
&gt;&gt;&gt;&gt;&gt; -+/* already defined within netinet/in.h if using glib=
c or musl */<br>
&gt;&gt;&gt;&gt;&gt; -+#ifndef HAVE_STRUCT_IN6_PKTINFO_IPI6_<wbr>ADDR<br>
&gt;&gt;&gt;&gt;&gt; - struct in6_pktinfo {<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct in6_addr ipi6_addr;=
=C2=A0 /* src/dst IPv6 address */<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int ipi6_ifindex;=
=C2=A0 /* send/recv interface index */<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; -2.8.1<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -From c0726e432fa0274a2b9c70179b03df<wbr>6720972816 Mo=
n Sep 17 00:00:00 2001<br>
&gt;&gt;&gt;&gt;&gt; -From: Ross Burton &lt;<a href=3D"mailto:ross.burton@i=
ntel.com">ross.burton@intel.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -Date: Tue, 9 Aug 2016 15:19:23 +0100<br>
&gt;&gt;&gt;&gt;&gt; -Subject: [PATCH 3/3] Rationalise includes<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -gweb/gresolv.c uses snprintf() and isspace() so it sh=
ould include<br>
&gt;&gt;&gt;&gt;&gt; stdio.h and<br>
&gt;&gt;&gt;&gt;&gt; -ctype.h.<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -tools/dnsproxy-test uses functions from stdio.h.<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -musl warns when sys/ headers are included when the no=
n-sys form should<br>
&gt;&gt;&gt;&gt;&gt; be used,<br>
&gt;&gt;&gt;&gt;&gt; -so switch sys/errno.h and so on to errno.h.<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -musl also causes redefinition errors when pieces of t=
he networking<br>
&gt;&gt;&gt;&gt;&gt; headers are<br>
&gt;&gt;&gt;&gt;&gt; -included, so remove the redundant includes.<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -Based on work by Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com">raj.khem@gmail.com</a>&gt;.<br>
&gt;&gt;&gt;&gt;&gt; ----<br>
&gt;&gt;&gt;&gt;&gt; - gweb/gresolv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;&gt;&gt;&gt;&gt; - plugins/wifi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 3 +--<br>
&gt;&gt;&gt;&gt;&gt; - src/ippool.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;&gt;&gt;&gt;&gt; - src/iptables.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;&gt;&gt;&gt;&gt; - src/tethering.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 --<br>
&gt;&gt;&gt;&gt;&gt; - tools/dhcp-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 1 -<br>
&gt;&gt;&gt;&gt;&gt; - tools/dnsproxy-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
 +<br>
&gt;&gt;&gt;&gt;&gt; - tools/private-network-test.c | 2 +-<br>
&gt;&gt;&gt;&gt;&gt; - tools/tap-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 2 +-<br>
&gt;&gt;&gt;&gt;&gt; - 9 files changed, 7 insertions(+), 9 deletions(-)<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/gweb/gresolv.c b/gweb/gresolv.c<br>
&gt;&gt;&gt;&gt;&gt; -index 8a51a9f..d55027c 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/gweb/gresolv.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/gweb/gresolv.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -23,11 +23,13 @@<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;config.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #endif<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -+#include &lt;ctype.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;stdarg.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;string.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;stdlib.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; -+#include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;resolv.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;sys/types.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;sys/socket.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/plugins/wifi.c b/plugins/wifi.c<br>
&gt;&gt;&gt;&gt;&gt; -index 9d56671..148131d 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/plugins/wifi.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/plugins/wifi.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -30,9 +30,8 @@<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;string.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;sys/ioctl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;sys/socket.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; --#include &lt;linux/if_arp.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; --#include &lt;linux/wireless.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;net/ethernet.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; -+#include &lt;linux/wireless.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; - #ifndef IFF_LOWER_UP<br>
&gt;&gt;&gt;&gt;&gt; - #define IFF_LOWER_UP=C2=A0 0x10000<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/src/ippool.c b/src/ippool.c<br>
&gt;&gt;&gt;&gt;&gt; -index cea1dcc..8a645da 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/src/ippool.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/src/ippool.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -28,7 +28,6 @@<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;string.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; --#include &lt;sys/errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;sys/socket.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; - #include &quot;connman.h&quot;<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/src/iptables.c b/src/iptables.c<br>
&gt;&gt;&gt;&gt;&gt; -index 5ef757a..82e3ac4 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/src/iptables.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/src/iptables.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -28,7 +28,7 @@<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;string.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; --#include &lt;sys/errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; -+#include &lt;errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;sys/socket.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;xtables.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;inttypes.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/src/tethering.c b/src/tethering.c<br>
&gt;&gt;&gt;&gt;&gt; -index 3153349..ad062d5 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/src/tethering.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/src/tethering.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -31,10 +31,8 @@<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;sys/ioctl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;net/if.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; --#include &lt;linux/sockios.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;string.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;fcntl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; --#include &lt;linux/if_tun.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;netinet/in.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; - #include &lt;linux/if_bridge.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/tools/dhcp-test.c b/tools/dhc=
p-test.c<br>
&gt;&gt;&gt;&gt;&gt; -index c34e10a..eae66fc 100644<br>
&gt;&gt;&gt;&gt;&gt; +index c34e10a8..eae66fc2 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/tools/dhcp-test.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/tools/dhcp-test.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0@@ -33,7 +33,6 @@<br>
&gt;&gt;&gt;&gt;&gt; @@ -382,7 +281,7 @@ index c34e10a..eae66fc 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;gdhcp/gdhcp.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/tools/dnsproxy-test.c b/tools=
/dnsproxy-test.c<br>
&gt;&gt;&gt;&gt;&gt; -index 551cae9..371e2e2 100644<br>
&gt;&gt;&gt;&gt;&gt; +index 551cae91..371e2e23 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/tools/dnsproxy-test.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/tools/dnsproxy-test.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0@@ -24,6 +24,7 @@<br>
&gt;&gt;&gt;&gt;&gt; @@ -394,7 +293,7 @@ index 551cae9..371e2e2 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;string.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/tools/private-network-test.c<=
br>
&gt;&gt;&gt;&gt;&gt; b/tools/private-network-test.c<br>
&gt;&gt;&gt;&gt;&gt; -index 3dd115b..2828bb3 100644<br>
&gt;&gt;&gt;&gt;&gt; +index 3dd115ba..2828bb30 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/tools/private-network-test.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/tools/private-network-test.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0@@ -32,7 +32,7 @@<br>
&gt;&gt;&gt;&gt;&gt; @@ -406,11 +305,29 @@ index 3dd115b..2828bb3 100644<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;sys/signalfd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; +diff --git a/tools/stats-tool.c b/tools/stats-tool.c<=
br>
&gt;&gt;&gt;&gt;&gt; +index efa39de2..5695048f 100644<br>
&gt;&gt;&gt;&gt;&gt; +--- a/tools/stats-tool.c<br>
&gt;&gt;&gt;&gt;&gt; ++++ b/tools/stats-tool.c<br>
&gt;&gt;&gt;&gt;&gt; +@@ -22,7 +22,6 @@<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;config.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #endif<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +-#define _GNU_SOURCE<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;sys/mman.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;sys/types.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;sys/stat.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0diff --git a/tools/tap-test.c b/tools/tap-=
test.c<br>
&gt;&gt;&gt;&gt;&gt; -index 57917f5..cb3ee62 100644<br>
&gt;&gt;&gt;&gt;&gt; +index fdc098aa..cb3ee622 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--- a/tools/tap-test.c<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0+++ b/tools/tap-test.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -28,7 +28,7 @@<br>
&gt;&gt;&gt;&gt;&gt; +@@ -23,13 +23,12 @@<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;config.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #endif<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +-#define _GNU_SOURCE<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;errno.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;fcntl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;string.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; @@ -419,5 +336,30 @@ index 57917f5..cb3ee62 100644<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;sys/ioctl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 #include &lt;netinet/in.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +diff --git a/tools/wispr.c b/tools/wispr.c<br>
&gt;&gt;&gt;&gt;&gt; +index d5f9341f..e56dfc16 100644<br>
&gt;&gt;&gt;&gt;&gt; +--- a/tools/wispr.c<br>
&gt;&gt;&gt;&gt;&gt; ++++ b/tools/wispr.c<br>
&gt;&gt;&gt;&gt;&gt; +@@ -23,7 +23,6 @@<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;config.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #endif<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +-#define _GNU_SOURCE<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;stdio.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;fcntl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; +diff --git a/vpn/plugins/vpn.c b/vpn/plugins/vpn.c<br=
>
&gt;&gt;&gt;&gt;&gt; +index 10548aaf..6e3f640c 100644<br>
&gt;&gt;&gt;&gt;&gt; +--- a/vpn/plugins/vpn.c<br>
&gt;&gt;&gt;&gt;&gt; ++++ b/vpn/plugins/vpn.c<br>
&gt;&gt;&gt;&gt;&gt; +@@ -23,7 +23,6 @@<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;config.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #endif<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +-#define _GNU_SOURCE<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;string.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;fcntl.h&gt;<br>
&gt;&gt;&gt;&gt;&gt; + #include &lt;unistd.h&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0--<br>
&gt;&gt;&gt;&gt;&gt; -2.8.1<br>
&gt;&gt;&gt;&gt;&gt; +2.17.1<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;&gt; a/meta/recipes-connectivity/<wbr>connman/connman/0001-=
<wbr>giognutls-Fix-a-crash-using-<wbr>wispr-over-TLS.patch<br>
&gt;&gt;&gt;&gt;&gt; b/meta/recipes-connectivity/<wbr>connman/connman/0001-=
<wbr>giognutls-Fix-a-crash-using-<wbr>wispr-over-TLS.patch<br>
&gt;&gt;&gt;&gt;&gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt;&gt; index f9080d4ba9..0000000000<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; a/meta/recipes-connectivity/<wbr>connman/connman/0001-=
<wbr>giognutls-Fix-a-crash-using-<wbr>wispr-over-TLS.patch<br>
&gt;&gt;&gt;&gt;&gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt;&gt; @@ -1,41 +0,0 @@<br>
&gt;&gt;&gt;&gt;&gt; -From 929fc9b7068100444e0ffcccd25841<wbr>f78791e619 Mo=
n Sep 17 00:00:00 2001<br>
&gt;&gt;&gt;&gt;&gt; -From: Jian Liang &lt;<a href=3D"mailto:jianliang@tyco=
int.com">jianliang@tycoint.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -Date: Fri, 15 Sep 2017 06:40:08 -0400<br>
&gt;&gt;&gt;&gt;&gt; -Subject: [PATCH] gweb: Fix a crash using wispr over T=
LS<br>
&gt;&gt;&gt;&gt;&gt; -To: <a href=3D"mailto:connman@lists.01.org">connman@l=
ists.01.org</a><br>
&gt;&gt;&gt;&gt;&gt; -Cc: <a href=3D"mailto:wagi@monom.org">wagi@monom.org<=
/a><br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -When gnutls_channel is instantiated, the gnutls_chann=
el-&gt;established<br>
&gt;&gt;&gt;&gt;&gt; -has to be initiated as FALSE. Otherwise, check_handsh=
ake function<br>
&gt;&gt;&gt;&gt;&gt; -won&#39;t work. A random initial value 1 of gnutls_ch=
annel-&gt;established<br>
&gt;&gt;&gt;&gt;&gt; -will make check_handshake return G_IO_STATUS_NORMAL, =
when the channel<br>
&gt;&gt;&gt;&gt;&gt; -is actually not ready to be used. The observed behavi=
ours are,<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -- wispr is getting random errors in wispr_portal_web_=
result<br>
&gt;&gt;&gt;&gt;&gt; -- ConnMan crashes on exit after those random errors<b=
r>
&gt;&gt;&gt;&gt;&gt; -- when wispr is luckly working, ConnMan doesn&#39;t c=
rash on exit<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -Signed-off-by: Jian Liang &lt;<a href=3D"mailto:jianl=
iang@tycoint.com">jianliang@tycoint.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; ----<br>
&gt;&gt;&gt;&gt;&gt; -Upstream-Status: Backport<br>
&gt;&gt;&gt;&gt;&gt; [<a href=3D"https://git.kernel.org/pub/scm/network/con=
nman/connman.git/commit/?id=3D73e53f3bd9e7debae86341f1eee7b97862a56a5e" rel=
=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/<wbr>scm/netwo=
rk/connman/connman.<wbr>git/commit/?id=3D<wbr>73e53f3bd9e7debae86341f1eee7b=
9<wbr>7862a56a5e</a>]<br>
&gt;&gt;&gt;&gt;&gt; -Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mail=
to:andre.draszik@jci.com">andre.draszik@jci.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; - gweb/giognutls.c | 2 +-<br>
&gt;&gt;&gt;&gt;&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/gweb/giognutls.c b/gweb/giognutls.c<br>
&gt;&gt;&gt;&gt;&gt; -index 09dc9e7..c029a8b 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/gweb/giognutls.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/gweb/giognutls.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -421,7 +421,7 @@ GIOChannel *g_io_channel_gnutls_n=
ew(int fd)<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0DBG(&quot;&quot;);<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 gnutls_channel =3D g_new(GIOGnu=
TLSChannel, 1);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 gnutls_channel =3D g_new0(GIOGn=
uTLSChannel, 1);<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0channel =3D (GIOChannel *)=
 gnutls_channel;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; -2.7.4<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;&gt; a/meta/recipes-connectivity/<wbr>connman/connman/0001-=
inet-Add-<wbr>prefixlen-to-iproute_default_<wbr>function.patch<br>
&gt;&gt;&gt;&gt;&gt; b/meta/recipes-connectivity/<wbr>connman/connman/0001-=
inet-Add-<wbr>prefixlen-to-iproute_default_<wbr>function.patch<br>
&gt;&gt;&gt;&gt;&gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt;&gt; index dd7b356741..0000000000<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; a/meta/recipes-connectivity/<wbr>connman/connman/0001-=
inet-Add-<wbr>prefixlen-to-iproute_default_<wbr>function.patch<br>
&gt;&gt;&gt;&gt;&gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt;&gt; @@ -1,63 +0,0 @@<br>
&gt;&gt;&gt;&gt;&gt; -From 508dc60a1f0758ebc586b6b086478a<wbr>176d493086 Mo=
n Sep 17 00:00:00 2001<br>
&gt;&gt;&gt;&gt;&gt; -From: Jian Liang &lt;<a href=3D"mailto:jianliang@tyco=
int.com">jianliang@tycoint.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -Date: Thu, 5 Oct 2017 09:34:41 +0100<br>
&gt;&gt;&gt;&gt;&gt; -Subject: [PATCH 1/4] inet: Add prefixlen to iproute_d=
efault_function<br>
&gt;&gt;&gt;&gt;&gt; -To: <a href=3D"mailto:connman@lists.01.org">connman@l=
ists.01.org</a><br>
&gt;&gt;&gt;&gt;&gt; -Cc: <a href=3D"mailto:wagi@monom.org">wagi@monom.org<=
/a><br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -Add prefixlen parameter to this function in preparati=
on for using<br>
&gt;&gt;&gt;&gt;&gt; -it also in creating subnet route later, e.g.<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -default via 192.168.100.1 dev eth0<br>
&gt;&gt;&gt;&gt;&gt; -<a href=3D"http://192.168.100.0/24" rel=3D"noreferrer=
" target=3D"_blank">192.168.100.0/24</a> dev eth0<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -Signed-off-by: Jian Liang &lt;<a href=3D"mailto:jianl=
iang@tycoint.com">jianliang@tycoint.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; ----<br>
&gt;&gt;&gt;&gt;&gt; -Upstream-Status: Backport<br>
&gt;&gt;&gt;&gt;&gt; [<a href=3D"https://git.kernel.org/pub/scm/network/con=
nman/connman.git/commit/?id=3Dedda5b695de2ee79f02314abc9b46fdd46b388e1" rel=
=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/<wbr>scm/netwo=
rk/connman/connman.<wbr>git/commit/?id=3D<wbr>edda5b695de2ee79f02314abc9b46=
f<wbr>dd46b388e1</a>]<br>
&gt;&gt;&gt;&gt;&gt; -Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mail=
to:andre.draszik@jci.com">andre.draszik@jci.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; - src/inet.c | 7 ++++---<br>
&gt;&gt;&gt;&gt;&gt; - 1 file changed, 4 insertions(+), 3 deletions(-)<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/src/inet.c b/src/inet.c<br>
&gt;&gt;&gt;&gt;&gt; -index b887aa0..ab8aec8 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/src/inet.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/src/inet.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -2796,7 +2796,7 @@ int __connman_inet_del_fwmark_<=
wbr>rule(uint32_t<br>
&gt;&gt;&gt;&gt;&gt; table_id, int family, uint32_t fwmar<br>
&gt;&gt;&gt;&gt;&gt; - }<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; - static int iproute_default_modify(int cmd, uint32_t =
table_id, int<br>
&gt;&gt;&gt;&gt;&gt; ifindex,<br>
&gt;&gt;&gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const char *gateway)<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const char *gateway, unsigned char prefixlen)<br>
&gt;&gt;&gt;&gt;&gt; - {<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct __connman_inet_rtnl=
_handle rth;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char buf[sizeof(s=
truct in6_addr)];<br>
&gt;&gt;&gt;&gt;&gt; -@@ -2829,6 +2829,7 @@ static int iproute_default_modi=
fy(int cmd,<br>
&gt;&gt;&gt;&gt;&gt; uint32_t table_id, int ifindex,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rth.req.u.r.rt.rtm_protoco=
l =3D RTPROT_BOOT;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rth.req.u.r.rt.rtm_scope =
=3D RT_SCOPE_UNIVERSE;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rth.req.u.r.rt.rtm_type =
=3D RTN_UNICAST;<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 rth.req.u.r.rt.rtm_dst_len =3D =
prefixlen;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0__connman_inet_rtnl_addatt=
r_l(<wbr>&amp;rth.req.n, sizeof(rth.req),<br>
&gt;&gt;&gt;&gt;&gt; RTA_GATEWAY,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0buf,<br>
&gt;&gt;&gt;&gt;&gt; len);<br>
&gt;&gt;&gt;&gt;&gt; -@@ -2860,7 +2861,7 @@ int __connman_inet_add_default_=
to_<wbr>table(uint32_t<br>
&gt;&gt;&gt;&gt;&gt; table_id, int ifindex,<br>
&gt;&gt;&gt;&gt;&gt; - {<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ip route add default vi=
a 1.2.3.4 dev wlan0 table 1234 */<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 return iproute_default_modify(R=
TM_<wbr>NEWROUTE, table_id, ifindex,<br>
&gt;&gt;&gt;&gt;&gt; gateway);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 return iproute_default_modify(R=
TM_<wbr>NEWROUTE, table_id, ifindex,<br>
&gt;&gt;&gt;&gt;&gt; gateway, 0);<br>
&gt;&gt;&gt;&gt;&gt; - }<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; - int __connman_inet_del_default_<wbr>from_table(uint3=
2_t table_id, int<br>
&gt;&gt;&gt;&gt;&gt; ifindex,<br>
&gt;&gt;&gt;&gt;&gt; -@@ -2868,7 +2869,7 @@ int __connman_inet_del_default_=
<wbr>from_table(uint32_t<br>
&gt;&gt;&gt;&gt;&gt; table_id, int ifindex,<br>
&gt;&gt;&gt;&gt;&gt; - {<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ip route del default vi=
a 1.2.3.4 dev wlan0 table 1234 */<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 return iproute_default_modify(R=
TM_<wbr>DELROUTE, table_id, ifindex,<br>
&gt;&gt;&gt;&gt;&gt; gateway);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 return iproute_default_modify(R=
TM_<wbr>DELROUTE, table_id, ifindex,<br>
&gt;&gt;&gt;&gt;&gt; gateway, 0);<br>
&gt;&gt;&gt;&gt;&gt; - }<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; - int __connman_inet_get_interface_<wbr>ll_address(int=
 index, int family,<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; -2.7.4<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;&gt; a/meta/recipes-connectivity/<wbr>connman/connman/0001-=
session-<wbr>Keep-track-of-addr-in-fw_snat-<wbr>session.patch<br>
&gt;&gt;&gt;&gt;&gt; b/meta/recipes-connectivity/<wbr>connman/connman/0001-=
session-<wbr>Keep-track-of-addr-in-fw_snat-<wbr>session.patch<br>
&gt;&gt;&gt;&gt;&gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt;&gt; index f1b4d0aaa7..0000000000<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; a/meta/recipes-connectivity/<wbr>connman/connman/0001-=
session-<wbr>Keep-track-of-addr-in-fw_snat-<wbr>session.patch<br>
&gt;&gt;&gt;&gt;&gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt;&gt; @@ -1,112 +0,0 @@<br>
&gt;&gt;&gt;&gt;&gt; -From b5fd5945886fa1845db5c969424b63<wbr>d894fe0376 Mo=
n Sep 17 00:00:00 2001<br>
&gt;&gt;&gt;&gt;&gt; -From: Jian Liang &lt;<a href=3D"mailto:jianliang@tyco=
int.com">jianliang@tycoint.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -Date: Fri, 25 Aug 2017 10:02:16 -0400<br>
&gt;&gt;&gt;&gt;&gt; -Subject: [PATCH 1/2] session: Keep track of addr in f=
w_snat &amp; session<br>
&gt;&gt;&gt;&gt;&gt; -To: <a href=3D"mailto:connman@lists.01.org">connman@l=
ists.01.org</a><br>
&gt;&gt;&gt;&gt;&gt; -Cc: <a href=3D"mailto:wagi@monom.org">wagi@monom.org<=
/a><br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -When there is more than one session in fw_snat&#39;s =
list of sessions,<br>
&gt;&gt;&gt;&gt;&gt; -fw_snat failed to be re-created when update-session-s=
tate is triggered<br>
&gt;&gt;&gt;&gt;&gt; -with new IP address. This is because index alone is n=
ot sufficient to<br>
&gt;&gt;&gt;&gt;&gt; -decide if fw_snat needs to be re-created. The solutio=
n here is to keep<br>
&gt;&gt;&gt;&gt;&gt; -a track of IP addr and use it to avoid false lookup o=
f fw_snat.<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -Signed-off-by: Jian Liang &lt;<a href=3D"mailto:jianl=
iang@tycoint.com">jianliang@tycoint.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; ----<br>
&gt;&gt;&gt;&gt;&gt; -Upstream-Status: Backport<br>
&gt;&gt;&gt;&gt;&gt; [<a href=3D"https://git.kernel.org/pub/scm/network/con=
nman/connman.git/commit/?id=3Df9e27d4abfcab5c80a38e0850b5ddb26277f97c1" rel=
=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/<wbr>scm/netwo=
rk/connman/connman.<wbr>git/commit/?id=3D<wbr>f9e27d4abfcab5c80a38e0850b5dd=
b<wbr>26277f97c1</a>]<br>
&gt;&gt;&gt;&gt;&gt; -Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mail=
to:andre.draszik@jci.com">andre.draszik@jci.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; - src/session.c | 19 +++++++++++++++----<br>
&gt;&gt;&gt;&gt;&gt; - 1 file changed, 15 insertions(+), 4 deletions(-)<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/src/session.c b/src/session.c<br>
&gt;&gt;&gt;&gt;&gt; -index 9e3c559..965ac06 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/src/session.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/src/session.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -65,6 +65,7 @@ struct connman_session {<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct firewall_context *f=
w;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t mark;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int index;<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 char *addr;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0char *gateway;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bool policy_routing;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bool snat_enabled;<br>
&gt;&gt;&gt;&gt;&gt; -@@ -79,6 +80,7 @@ struct fw_snat {<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0GSList *sessions;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int id;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int index;<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 char *addr;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct firewall_context *f=
w;<br>
&gt;&gt;&gt;&gt;&gt; - };<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -@@ -200,7 +202,7 @@ static char *service2bearer(enum<=
br>
&gt;&gt;&gt;&gt;&gt; connman_service_type type)<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&quot;;<br>
&gt;&gt;&gt;&gt;&gt; - }<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; --static struct fw_snat *fw_snat_lookup(int index)<br>
&gt;&gt;&gt;&gt;&gt; -+static struct fw_snat *fw_snat_lookup(int index, con=
st char *addr)<br>
&gt;&gt;&gt;&gt;&gt; - {<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct fw_snat *fw_snat;<b=
r>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0GSList *list;<br>
&gt;&gt;&gt;&gt;&gt; -@@ -208,8 +210,11 @@ static struct fw_snat *fw_snat_l=
ookup(int index)<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for (list =3D fw_snat_list=
; list; list =3D list-&gt;next) {<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0fw_snat =3D list-&gt;data;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
(fw_snat-&gt;index =3D=3D index)<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
(fw_snat-&gt;index =3D=3D index) {<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (g_strcmp0(addr, fw_snat-&gt;addr) !=3D 0)<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fw_snat;<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<b=
r>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;&gt;&gt;&gt;&gt; - }<br>
&gt;&gt;&gt;&gt;&gt; -@@ -224,6 +229,7 @@ static int fw_snat_create(struct =
connman_session<br>
&gt;&gt;&gt;&gt;&gt; *session,<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fw_snat-&gt;fw =3D __connm=
an_firewall_create();<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fw_snat-&gt;index =3D inde=
x;<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 fw_snat-&gt;addr =3D g_strdup(a=
ddr);<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fw_snat-&gt;id =3D __connm=
an_firewall_enable_<wbr>snat(fw_snat-&gt;fw,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index, ifname, addr);<br>
&gt;&gt;&gt;&gt;&gt; -@@ -238,6 +244,7 @@ static int fw_snat_create(struct =
connman_session<br>
&gt;&gt;&gt;&gt;&gt; *session,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt;&gt;&gt;&gt; - err:<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0__connman_firewall_destroy=
(fw_<wbr>snat-&gt;fw);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 g_free(fw_snat-&gt;addr);<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(fw_snat);<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt;&gt;&gt;&gt;&gt; - }<br>
&gt;&gt;&gt;&gt;&gt; -@@ -393,7 +400,7 @@ static void del_nat_rules(struct =
connman_session<br>
&gt;&gt;&gt;&gt;&gt; *session)<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0session-&gt;snat_enabled =
=3D false;<br>
&gt;&gt;&gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 fw_snat =3D fw_snat_lookup(sess=
ion-&gt;index)<wbr>;<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 fw_snat =3D fw_snat_lookup(sess=
ion-&gt;index, session-&gt;addr);<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fw_snat)<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return;<br>
&gt;&gt;&gt;&gt;&gt; -@@ -420,8 +427,11 @@ static void add_nat_rules(struct=
 connman_session<br>
&gt;&gt;&gt;&gt;&gt; *session)<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!addr)<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 g_free(session-&gt;addr);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 session-&gt;addr =3D g_strdup(a=
ddr);<br>
&gt;&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0session-&gt;snat_enabled =
=3D true;<br>
&gt;&gt;&gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 fw_snat =3D fw_snat_lookup(inde=
x);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 fw_snat =3D fw_snat_lookup(inde=
x, session-&gt;addr);<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fw_snat) {<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0fw_snat_ref(session, fw_snat);<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return;<br>
&gt;&gt;&gt;&gt;&gt; -@@ -502,6 +512,7 @@ static void free_session(struct c=
onnman_session<br>
&gt;&gt;&gt;&gt;&gt; *session)<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(session-&gt;info);<=
br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(session-&gt;info_la=
st);<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(session-&gt;gateway=
);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 g_free(session-&gt;addr);<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(session);<br>
&gt;&gt;&gt;&gt;&gt; - }<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; -2.7.4<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;&gt; a/meta/recipes-connectivity/<wbr>connman/connman/0002-=
inet-<wbr>Implement-subnet-route-<wbr>creation-deletion-in-ipr.patch<br>
&gt;&gt;&gt;&gt;&gt; b/meta/recipes-connectivity/<wbr>connman/connman/0002-=
inet-<wbr>Implement-subnet-route-<wbr>creation-deletion-in-ipr.patch<br>
&gt;&gt;&gt;&gt;&gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt;&gt; index 9c953e5d51..0000000000<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; a/meta/recipes-connectivity/<wbr>connman/connman/0002-=
inet-<wbr>Implement-subnet-route-<wbr>creation-deletion-in-ipr.patch<br>
&gt;&gt;&gt;&gt;&gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt;&gt; @@ -1,69 +0,0 @@<br>
&gt;&gt;&gt;&gt;&gt; -From 08cda4004491d3971a8b9df937426c<wbr>43800d15b1 Mo=
n Sep 17 00:00:00 2001<br>
&gt;&gt;&gt;&gt;&gt; -From: Jian Liang &lt;<a href=3D"mailto:jianliang@tyco=
int.com">jianliang@tycoint.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -Date: Thu, 5 Oct 2017 09:37:06 +0100<br>
&gt;&gt;&gt;&gt;&gt; -Subject: [PATCH 2/4] inet: Implement subnet route cre=
ation/deletion in<br>
&gt;&gt;&gt;&gt;&gt; - iproute_default_modify<br>
&gt;&gt;&gt;&gt;&gt; -To: <a href=3D"mailto:connman@lists.01.org">connman@l=
ists.01.org</a><br>
&gt;&gt;&gt;&gt;&gt; -Cc: <a href=3D"mailto:wagi@monom.org">wagi@monom.org<=
/a><br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -- Calculate subnet address base on gateway address an=
d prefixlen<br>
&gt;&gt;&gt;&gt;&gt; -- Differentiate creation of routes to gateway and sub=
net<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -Signed-off-by: Jian Liang &lt;<a href=3D"mailto:jianl=
iang@tycoint.com">jianliang@tycoint.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; ----<br>
&gt;&gt;&gt;&gt;&gt; -Upstream-Status: Backport<br>
&gt;&gt;&gt;&gt;&gt; [<a href=3D"https://git.kernel.org/pub/scm/network/con=
nman/connman.git/commit/?id=3Dff7dcf91f12a2a237feebc6e606d0a8e92975528" rel=
=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/<wbr>scm/netwo=
rk/connman/connman.<wbr>git/commit/?id=3D<wbr>ff7dcf91f12a2a237feebc6e606d0=
a<wbr>8e92975528</a>]<br>
&gt;&gt;&gt;&gt;&gt; -Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mail=
to:andre.draszik@jci.com">andre.draszik@jci.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; - src/inet.c | 22 +++++++++++++++++++---<br>
&gt;&gt;&gt;&gt;&gt; - 1 file changed, 19 insertions(+), 3 deletions(-)<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/src/inet.c b/src/inet.c<br>
&gt;&gt;&gt;&gt;&gt; -index ab8aec8..0ddb030 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/src/inet.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/src/inet.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -2802,6 +2802,9 @@ static int iproute_default_modi=
fy(int cmd,<br>
&gt;&gt;&gt;&gt;&gt; uint32_t table_id, int ifindex,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char buf[sizeof(s=
truct in6_addr)];<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret, len;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int family =3D connman_ine=
t_check_ipaddress(<wbr>gateway);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 char *dst =3D NULL;<br>
&gt;&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 DBG(&quot;gateway %s/%u table %=
u&quot;, gateway, prefixlen, table_id);<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (family) {<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0case AF_INET:<br>
&gt;&gt;&gt;&gt;&gt; -@@ -2814,7 +2817,19 @@ static int iproute_default_mod=
ify(int cmd,<br>
&gt;&gt;&gt;&gt;&gt; uint32_t table_id, int ifindex,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return -EINVAL;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 ret =3D inet_pton(family, gatew=
ay, buf);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 if (prefixlen) {<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str=
uct in_addr ipv4_subnet_addr, ipv4_mask;<br>
&gt;&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem=
set(&amp;ipv4_subnet_addr, 0, sizeof(ipv4_subnet_addr));<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ipv=
4_mask.s_addr =3D htonl((0xffffffff &lt;&lt; (32 - prefixlen))<br>
&gt;&gt;&gt;&gt;&gt; &amp; 0xffffffff);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ipv=
4_subnet_addr.s_addr =3D inet_addr(gateway);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ipv=
4_subnet_addr.s_addr &amp;=3D ipv4_mask.s_addr;<br>
&gt;&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst=
 =3D g_strdup(inet_ntoa(ipv4_<wbr>subnet_addr));<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 ret =3D inet_pton(family, dst ?=
 dst : gateway, buf);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 g_free(dst);<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt;=3D 0)<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return -EINVAL;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -@@ -2831,8 +2846,9 @@ static int iproute_default_modi=
fy(int cmd,<br>
&gt;&gt;&gt;&gt;&gt; uint32_t table_id, int ifindex,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rth.req.u.r.rt.rtm_type =
=3D RTN_UNICAST;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0rth.req.u.r.rt.rtm_dst_len=
 =3D prefixlen;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 __connman_inet_rtnl_addattr_l(<=
wbr>&amp;rth.req.n, sizeof(rth.req),<br>
&gt;&gt;&gt;&gt;&gt; RTA_GATEWAY,<br>
&gt;&gt;&gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 buf,<br>
&gt;&gt;&gt;&gt;&gt; len);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 __connman_inet_rtnl_addattr_l(<=
wbr>&amp;rth.req.n, sizeof(rth.req),<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pre=
fixlen &gt; 0 ? RTA_DST : RTA_GATEWAY, buf, len);<br>
&gt;&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (table_id &lt; 256) {<b=
r>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0rth.req.u.r.rt.rtm_table =3D table_id;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; -2.7.4<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;&gt; a/meta/recipes-connectivity/<wbr>connman/connman/0003-=
inet-<wbr>Implement-APIs-for-creating-<wbr>and-deleting-subnet.patch<br>
&gt;&gt;&gt;&gt;&gt; b/meta/recipes-connectivity/<wbr>connman/connman/0003-=
inet-<wbr>Implement-APIs-for-creating-<wbr>and-deleting-subnet.patch<br>
&gt;&gt;&gt;&gt;&gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt;&gt; index 56ba5c3f4b..0000000000<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; a/meta/recipes-connectivity/<wbr>connman/connman/0003-=
inet-<wbr>Implement-APIs-for-creating-<wbr>and-deleting-subnet.patch<br>
&gt;&gt;&gt;&gt;&gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt;&gt; @@ -1,68 +0,0 @@<br>
&gt;&gt;&gt;&gt;&gt; -From a9243f13d6e1aadd69bfcc27f75f69<wbr>c38be51677 Mo=
n Sep 17 00:00:00 2001<br>
&gt;&gt;&gt;&gt;&gt; -From: Jian Liang &lt;<a href=3D"mailto:jianliang@tyco=
int.com">jianliang@tycoint.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -Date: Wed, 4 Oct 2017 17:30:17 +0100<br>
&gt;&gt;&gt;&gt;&gt; -Subject: [PATCH 3/4] inet: Implement APIs for creatin=
g and deleting<br>
&gt;&gt;&gt;&gt;&gt; subnet<br>
&gt;&gt;&gt;&gt;&gt; - route<br>
&gt;&gt;&gt;&gt;&gt; -To: <a href=3D"mailto:connman@lists.01.org">connman@l=
ists.01.org</a><br>
&gt;&gt;&gt;&gt;&gt; -Cc: <a href=3D"mailto:wagi@monom.org">wagi@monom.org<=
/a><br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -Signed-off-by: Jian Liang &lt;<a href=3D"mailto:jianl=
iang@tycoint.com">jianliang@tycoint.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; ----<br>
&gt;&gt;&gt;&gt;&gt; -Upstream-Status: Backport<br>
&gt;&gt;&gt;&gt;&gt; [<a href=3D"https://git.kernel.org/pub/scm/network/con=
nman/connman.git/commit/?id=3D3a15b0b7fccd053aff91da2cc68585509d0c509b" rel=
=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/<wbr>scm/netwo=
rk/connman/connman.<wbr>git/commit/?id=3D<wbr>3a15b0b7fccd053aff91da2cc6858=
5<wbr>509d0c509b</a>]<br>
&gt;&gt;&gt;&gt;&gt; -Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mail=
to:andre.draszik@jci.com">andre.draszik@jci.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; - src/connman.h |=C2=A0 4 ++++<br>
&gt;&gt;&gt;&gt;&gt; - src/inet.c=C2=A0 =C2=A0 | 14 ++++++++++++++<br>
&gt;&gt;&gt;&gt;&gt; - 2 files changed, 18 insertions(+)<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/src/connman.h b/src/connman.h<br>
&gt;&gt;&gt;&gt;&gt; -index 21b7080..da4446a 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/src/connman.h<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/src/connman.h<br>
&gt;&gt;&gt;&gt;&gt; -@@ -240,7 +240,11 @@ int __connman_inet_rtnl_addattr3=
2(<wbr>struct nlmsghdr<br>
&gt;&gt;&gt;&gt;&gt; *n, size_t maxlen,<br>
&gt;&gt;&gt;&gt;&gt; - int __connman_inet_add_fwmark_<wbr>rule(uint32_t tab=
le_id, int family,<br>
&gt;&gt;&gt;&gt;&gt; uint32_t fwmark);<br>
&gt;&gt;&gt;&gt;&gt; - int __connman_inet_del_fwmark_<wbr>rule(uint32_t tab=
le_id, int family,<br>
&gt;&gt;&gt;&gt;&gt; uint32_t fwmark);<br>
&gt;&gt;&gt;&gt;&gt; - int __connman_inet_add_default_to_<wbr>table(uint32_=
t table_id, int ifindex,<br>
&gt;&gt;&gt;&gt;&gt; const char *gateway);<br>
&gt;&gt;&gt;&gt;&gt; -+int __connman_inet_add_subnet_to_<wbr>table(uint32_t=
 table_id, int ifindex,<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const char *gateway, unsigned char prefixlen);<br>
&gt;&gt;&gt;&gt;&gt; - int __connman_inet_del_default_<wbr>from_table(uint3=
2_t table_id, int<br>
&gt;&gt;&gt;&gt;&gt; ifindex, const char *gateway);<br>
&gt;&gt;&gt;&gt;&gt; -+int __connman_inet_del_subnet_<wbr>from_table(uint32=
_t table_id, int<br>
&gt;&gt;&gt;&gt;&gt; ifindex,<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 const char *gateway, unsigned char prefixlen);<br>
&gt;&gt;&gt;&gt;&gt; - int __connman_inet_get_address_<wbr>netmask(int ifin=
dex,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct sockaddr_in *address, struct sockaddr_in<br>
&gt;&gt;&gt;&gt;&gt; *netmask);<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/src/inet.c b/src/inet.c<br>
&gt;&gt;&gt;&gt;&gt; -index 0ddb030..dcd1ab2 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/src/inet.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/src/inet.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -2880,6 +2880,13 @@ int __connman_inet_add_default=
_to_<wbr>table(uint32_t<br>
&gt;&gt;&gt;&gt;&gt; table_id, int ifindex,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return iproute_default_mod=
ify(RTM_<wbr>NEWROUTE, table_id, ifindex,<br>
&gt;&gt;&gt;&gt;&gt; gateway, 0);<br>
&gt;&gt;&gt;&gt;&gt; - }<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -+int __connman_inet_add_subnet_to_<wbr>table(uint32_t=
 table_id, int ifindex,<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *gateway,<br>
&gt;&gt;&gt;&gt;&gt; unsigned char prefixlen)<br>
&gt;&gt;&gt;&gt;&gt; -+{<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 /* ip route add <a href=3D"http=
://1.2.3.4/24" rel=3D"noreferrer" target=3D"_blank">1.2.3.4/24</a> dev eth0=
 table 1234 */<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 return iproute_default_modify(R=
TM_<wbr>NEWROUTE, table_id, ifindex,<br>
&gt;&gt;&gt;&gt;&gt; gateway, prefixlen);<br>
&gt;&gt;&gt;&gt;&gt; -+}<br>
&gt;&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt;&gt; - int __connman_inet_del_default_<wbr>from_table(uint3=
2_t table_id, int<br>
&gt;&gt;&gt;&gt;&gt; ifindex,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *gateway)<br>
&gt;&gt;&gt;&gt;&gt; - {<br>
&gt;&gt;&gt;&gt;&gt; -@@ -2888,6 +2895,13 @@ int<br>
&gt;&gt;&gt;&gt;&gt; __connman_inet_del_default_<wbr>from_table(uint32_t ta=
ble_id, int ifindex,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return iproute_default_mod=
ify(RTM_<wbr>DELROUTE, table_id, ifindex,<br>
&gt;&gt;&gt;&gt;&gt; gateway, 0);<br>
&gt;&gt;&gt;&gt;&gt; - }<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -+int __connman_inet_del_subnet_<wbr>from_table(uint32=
_t table_id, int<br>
&gt;&gt;&gt;&gt;&gt; ifindex,<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *gateway,<br>
&gt;&gt;&gt;&gt;&gt; unsigned char prefixlen)<br>
&gt;&gt;&gt;&gt;&gt; -+{<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 /* ip route del <a href=3D"http=
://1.2.3.4/24" rel=3D"noreferrer" target=3D"_blank">1.2.3.4/24</a> dev eth0=
 table 1234 */<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 return iproute_default_modify(R=
TM_<wbr>DELROUTE, table_id, ifindex,<br>
&gt;&gt;&gt;&gt;&gt; gateway, prefixlen);<br>
&gt;&gt;&gt;&gt;&gt; -+}<br>
&gt;&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt;&gt; - int __connman_inet_get_interface_<wbr>ll_address(int=
 index, int family,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void<br>
&gt;&gt;&gt;&gt;&gt; *address)<br>
&gt;&gt;&gt;&gt;&gt; - {<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; -2.7.4<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;&gt; a/meta/recipes-connectivity/<wbr>connman/connman/0004-=
session-<wbr>Use-subnet-route-creation-and-<wbr>deletion-APIs.patch<br>
&gt;&gt;&gt;&gt;&gt; b/meta/recipes-connectivity/<wbr>connman/connman/0004-=
session-<wbr>Use-subnet-route-creation-and-<wbr>deletion-APIs.patch<br>
&gt;&gt;&gt;&gt;&gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt;&gt; index ca213eb18b..0000000000<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; a/meta/recipes-connectivity/<wbr>connman/connman/0004-=
session-<wbr>Use-subnet-route-creation-and-<wbr>deletion-APIs.patch<br>
&gt;&gt;&gt;&gt;&gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt;&gt; @@ -1,77 +0,0 @@<br>
&gt;&gt;&gt;&gt;&gt; -From deb9372db8396da4f7cd20555ce7c9<wbr>a8b3ad96bd Mo=
n Sep 17 00:00:00 2001<br>
&gt;&gt;&gt;&gt;&gt; -From: Jian Liang &lt;<a href=3D"mailto:jianliang@tyco=
int.com">jianliang@tycoint.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -Date: Fri, 6 Oct 2017 11:40:16 +0100<br>
&gt;&gt;&gt;&gt;&gt; -Subject: [PATCH 4/4] session: Use subnet route creati=
on and deletion<br>
&gt;&gt;&gt;&gt;&gt; APIs<br>
&gt;&gt;&gt;&gt;&gt; -To: <a href=3D"mailto:connman@lists.01.org">connman@l=
ists.01.org</a><br>
&gt;&gt;&gt;&gt;&gt; -Cc: <a href=3D"mailto:wagi@monom.org">wagi@monom.org<=
/a><br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -As subnet route is address and session specific in th=
is case, so add<br>
&gt;&gt;&gt;&gt;&gt; -prefixlen into struct connman_session, and update it =
along with<br>
&gt;&gt;&gt;&gt;&gt; ipconfig.<br>
&gt;&gt;&gt;&gt;&gt; -Then use it in subnet route related APIs.<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -Signed-off-by: Jian Liang &lt;<a href=3D"mailto:jianl=
iang@tycoint.com">jianliang@tycoint.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; ----<br>
&gt;&gt;&gt;&gt;&gt; -Upstream-Status: Backport<br>
&gt;&gt;&gt;&gt;&gt; [<a href=3D"https://git.kernel.org/pub/scm/network/con=
nman/connman.git/commit/?id=3D285f25ef6cc9e4a43dab83523f3e2eab4365ac26" rel=
=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/<wbr>scm/netwo=
rk/connman/connman.<wbr>git/commit/?id=3D<wbr>285f25ef6cc9e4a43dab83523f3e2=
e<wbr>ab4365ac26</a>]<br>
&gt;&gt;&gt;&gt;&gt; -Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mail=
to:andre.draszik@jci.com">andre.draszik@jci.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; - src/session.c | 20 ++++++++++++++++----<br>
&gt;&gt;&gt;&gt;&gt; - 1 file changed, 16 insertions(+), 4 deletions(-)<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -diff --git a/src/session.c b/src/session.c<br>
&gt;&gt;&gt;&gt;&gt; -index 965ac06..7b7a14b 100644<br>
&gt;&gt;&gt;&gt;&gt; ---- a/src/session.c<br>
&gt;&gt;&gt;&gt;&gt; -+++ b/src/session.c<br>
&gt;&gt;&gt;&gt;&gt; -@@ -67,6 +67,7 @@ struct connman_session {<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int index;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0char *addr;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0char *gateway;<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 unsigned char prefixlen;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bool policy_routing;<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bool snat_enabled;<br>
&gt;&gt;&gt;&gt;&gt; - };<br>
&gt;&gt;&gt;&gt;&gt; -@@ -357,13 +358,17 @@ static void del_default_route(s=
truct<br>
&gt;&gt;&gt;&gt;&gt; connman_session *session)<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!session-&gt;gateway)<=
br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 DBG(&quot;index %d routing tabl=
e %d default gateway %s&quot;,<br>
&gt;&gt;&gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ses=
sion-&gt;index, session-&gt;mark, session-&gt;gateway);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 DBG(&quot;index %d routing tabl=
e %d default gateway %s/%u&quot;,<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ses=
sion-&gt;index, session-&gt;mark, session-&gt;gateway,<br>
&gt;&gt;&gt;&gt;&gt; session-&gt;prefixlen);<br>
&gt;&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __c=
onnman_inet_del_subnet_<wbr>from_table(session-&gt;mark,<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 session-&gt;index, session-&gt;gateway,<br>
&gt;&gt;&gt;&gt;&gt; session-&gt;prefixlen);<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0__connman_inet_del_default=
_<wbr>from_table(session-&gt;mark,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0session-&gt;index,<br>
&gt;&gt;&gt;&gt;&gt; session-&gt;gateway);<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(session-&gt;gateway=
);<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0session-&gt;gateway =3D NU=
LL;<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 session-&gt;prefixlen =3D 0;<br=
>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0session-&gt;index =3D -1;<=
br>
&gt;&gt;&gt;&gt;&gt; - }<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -@@ -383,13 +388,20 @@ static void add_default_route(s=
truct<br>
&gt;&gt;&gt;&gt;&gt; connman_session *session)<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!session-&gt;gateway)<=
br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0session-&gt;gateway =3D g_strdup(inet_ntoa(addr));<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 DBG(&quot;index %d routing tabl=
e %d default gateway %s&quot;,<br>
&gt;&gt;&gt;&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ses=
sion-&gt;index, session-&gt;mark, session-&gt;gateway);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 session-&gt;prefixlen =3D __con=
nman_ipconfig_get_<wbr>prefixlen(ipconfig);<br>
&gt;&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 DBG(&quot;index %d routing tabl=
e %d default gateway %s/%u&quot;,<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ses=
sion-&gt;index, session-&gt;mark, session-&gt;gateway,<br>
&gt;&gt;&gt;&gt;&gt; session-&gt;prefixlen);<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D __connman_inet_add=
_default_to_<wbr>table(session-&gt;mark,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0session-&gt;index,<br>
&gt;&gt;&gt;&gt;&gt; session-&gt;gateway);<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0)<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0DBG(&quot;session %p %s&quot;, session, strerror(-err));<br>
&gt;&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 err =3D __connman_inet_add_subn=
et_to_<wbr>table(session-&gt;mark,<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 session-&gt;index, session-&gt;gateway,<br>
&gt;&gt;&gt;&gt;&gt; session-&gt;prefixlen);<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 if (err &lt; 0)<br>
&gt;&gt;&gt;&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DBG=
(&quot;session add subnet route %p %s&quot;, session,<br>
&gt;&gt;&gt;&gt;&gt; strerror(-err));<br>
&gt;&gt;&gt;&gt;&gt; - }<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; - static void del_nat_rules(struct connman_session *se=
ssion)<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt; -2.7.4<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/meta/recipes-connectivity/<wbr>connman/<a=
 href=3D"http://connman_1.35.bb" rel=3D"noreferrer" target=3D"_blank">connm=
an_1.35.bb</a><br>
&gt;&gt;&gt;&gt;&gt; b/meta/recipes-connectivity/<wbr>connman/<a href=3D"ht=
tp://connman_1.35.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.35.bb<=
/a><br>
&gt;&gt;&gt;&gt;&gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt;&gt; index ff2118113f..0000000000<br>
&gt;&gt;&gt;&gt;&gt; --- a/meta/recipes-connectivity/<wbr>connman/<a href=
=3D"http://connman_1.35.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.=
35.bb</a><br>
&gt;&gt;&gt;&gt;&gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt;&gt; @@ -1,22 +0,0 @@<br>
&gt;&gt;&gt;&gt;&gt; -require connman.inc<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -SRC_URI=C2=A0 =3D &quot;${KERNELORG_MIRROR}/linux/<wb=
r>network/${BPN}/${BP}.tar.xz \<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; file://0001-plugin.h-Change-<wbr>visibility-to-default=
-for-<wbr>debug-symb.patch \<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; file://0001-connman.service-<wbr>stop-systemd-resolved=
-when-we-<wbr>use-co.patch \<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://conn=
man \<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://no-v=
ersion-scripts.<wbr>patch \<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://incl=
udes.patch \<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; file://0001-session-Keep-<wbr>track-of-addr-in-fw_snat=
-<wbr>session.patch \<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001=
-giognutls-Fix-a-<wbr>crash-using-wispr-over-TLS.<wbr>patch<br>
&gt;&gt;&gt;&gt;&gt; \<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; file://0001-inet-Add-<wbr>prefixlen-to-iproute_default=
_<wbr>function.patch \<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; file://0002-inet-Implement-<wbr>subnet-route-creation-=
<wbr>deletion-in-ipr.patch \<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; file://0003-inet-Implement-<wbr>APIs-for-creating-and-=
<wbr>deleting-subnet.patch \<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; file://0004-session-Use-<wbr>subnet-route-creation-and=
-<wbr>deletion-APIs.patch \<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt;&gt;&gt;&gt; -SRC_URI_append_libc-musl =3D &quot;<br>
&gt;&gt;&gt;&gt;&gt; file://0002-resolve-musl-does-<wbr>not-implement-res_n=
init.patch \<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -SRC_URI[md5sum] =3D &quot;<wbr>bae37b45ee9b3db5ec8115=
188f8a76<wbr>52&quot;<br>
&gt;&gt;&gt;&gt;&gt; -SRC_URI[sha256sum] =3D<br>
&gt;&gt;&gt;&gt;&gt; &quot;<wbr>66d7deb98371545c6e417239a9b3b3<wbr>e3201c15=
29d08eedf40afbc859842c<wbr>f2aa&quot;<br>
&gt;&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;&gt; -RRECOMMENDS_${PN} =3D &quot;connman-conf&quot;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/meta/recipes-connectivity/<wbr>connman/<a=
 href=3D"http://connman_1.36.bb" rel=3D"noreferrer" target=3D"_blank">connm=
an_1.36.bb</a><br>
&gt;&gt;&gt;&gt;&gt; b/meta/recipes-connectivity/<wbr>connman/<a href=3D"ht=
tp://connman_1.36.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.36.bb<=
/a><br>
&gt;&gt;&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt;&gt;&gt; index 0000000000..62c89b1e5d<br>
&gt;&gt;&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt;&gt;&gt; +++ b/meta/recipes-connectivity/<wbr>connman/<a href=
=3D"http://connman_1.36.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.=
36.bb</a><br>
&gt;&gt;&gt;&gt;&gt; @@ -0,0 +1,17 @@<br>
&gt;&gt;&gt;&gt;&gt; +require connman.inc<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +SRC_URI=C2=A0 =3D &quot;${KERNELORG_MIRROR}/linux/<wb=
r>network/${BPN}/${BP}.tar.xz \<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; file://0001-plugin.h-Change-<wbr>visibility-to-default=
-for-<wbr>debug-symb.patch \<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; file://0001-connman.service-<wbr>stop-systemd-resolved=
-when-we-<wbr>use-co.patch \<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://conn=
man \<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://no-v=
ersion-scripts.<wbr>patch \<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001=
-Use-AC_USE_SYSTEM_<wbr>EXTENSIONS.patch \<br>
&gt;&gt;&gt;&gt;&gt; +&quot;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +SRC_URI_append_libc-musl =3D &quot;<br>
&gt;&gt;&gt;&gt;&gt; file://0002-resolve-musl-does-<wbr>not-implement-res_n=
init.patch \<br>
&gt;&gt;&gt;&gt;&gt; +&quot;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +SRC_URI[md5sum] =3D &quot;<wbr>dae77d9c904d2c223ae849=
e32079d5<wbr>7e&quot;<br>
&gt;&gt;&gt;&gt;&gt; +SRC_URI[sha256sum] =3D<br>
&gt;&gt;&gt;&gt;&gt; &quot;<wbr>c789db41cc443fa41e661217ea3214<wbr>92ad59a0=
04bebcd1aa013f3bc10a6e<wbr>0074&quot;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +RRECOMMENDS_${PN} =3D &quot;connman-conf&quot;<br>
&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt; 2.17.1<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt; ______________________________<wbr>_________________<b=
r>
&gt;&gt;&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded=
.org">Openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listi=
nfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.op=
enembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div>Olek=
sandr Kravchuk</div><div><a href=3D"http://oleksandr-kravchuk.com/" target=
=3D"_blank">http://oleksandr-kravchuk.com/</a></div></div>
</div>

--00000000000037b737057636dc5b--
