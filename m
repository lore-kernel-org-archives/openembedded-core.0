Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4EFD275129
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 16:33:58 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id t5-v6so1148578qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2018 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fY6uzSdBdjI94aj7OzPUfwUQo5+JxD8Qq0vKlSh8kmE=;
	b=bAu1YAx/c/oFPgBO9Z3umcIg/Cg5GqKX7vvX5n/QzUPCgi85rSlMu4z0p+B1LiZPR2
	FS1ZHGMvgIHtlF9LdDOjnGcqolWr0kiJ8JAxezV5UZYiFYT2IU1RXGQGcyzeFKvBa/uu
	kv/4X6H1AvuB8hHRXreIv91ETHOw4eA4iczZDedyC4MdXvMfJLLE7xGFV05RKA888U8Y
	xAUU/Pg6HNiq2DhRyyndBKGHB498yU42S1AxaZWEHbjFvNLEXdOSEsJ1ZTbmTyaQz4A8
	zDf75tPJWjn4NzlDStFaL7FT3euzS1w39z5B1ftbjXiebjjEVvzRajuMaT7bcFh6ovh2
	fdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fY6uzSdBdjI94aj7OzPUfwUQo5+JxD8Qq0vKlSh8kmE=;
	b=PJnpRSM+PLPIkLlQU1/JsfBdMvX6KsxCdWAjPnbjtPY+ioT5n59u8/G35eFGGU7QXt
	7Xw1uAbnLVa2/brZ/39EGVv6uAeEa/LPwUYy6pze8oFcOUEJC519aiwY4jeENeoUg5h9
	vlP2qoV+sLFveV+6gSO8aGQ+XtrxcX1eBLdyFOmtlsViZL2SBebuhS6ceDJV+GuZ6vNf
	6FqKTxqZloAkjxNe9rPSF8RBk2mvzHrTLx2jusluWULfh5bKXSM+ie8CgSYXjn4aYBKY
	dO6Hx+Cx2vDl8RkXQFCsfbP8I8425yRDZI7VwTRN+zTsbhfRXoPcZYanxINP4WUNUNqX
	5WaA==
X-Gm-Message-State: APzg51CYnuBUYUl+pHwZyQzIK2T2nVxzcM9J6Tei25IpLCk0CLopX9jj
	rIJVyQyM8WrbnTCR4oBOzpS2zWWLaE/e5ydDUAlOJA==
X-Google-Smtp-Source: ANB0VdZ8t/BT4KezUX/l5hfTc/IdlVwFnRcdve2uVk2zKyrWFkMQjE0YRCnPlEUc0YIS9rTZOuBaciE8e3jk5ZQOEGA=
X-Received: by 2002:a0c:f78d:: with SMTP id
	s13-v6mr26180010qvn.194.1535992438956; 
	Mon, 03 Sep 2018 09:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535601148.git.raj.khem@gmail.com>
	<fae07991f994982404930e78c225db460bd14ae6.1535601148.git.raj.khem@gmail.com>
	<c712539f5fd74697831fb7ed806e6fea@XBOX02.axis.com>
	<02ee117d-3465-62e9-00da-8dedf441d0f2@windriver.com>
	<8F3C0D30-7FBD-468C-AE67-D190DB5EDB98@linux.intel.com>
In-Reply-To: <8F3C0D30-7FBD-468C-AE67-D190DB5EDB98@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Sep 2018 09:33:32 -0700
Message-ID: <CAMKF1sq5M90z1X8nLgHFj1jppoTcoH-2tqj=h7He7BXEmjaH0Q@mail.gmail.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] sysklogd: Use update-alternatives
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
X-List-Received-Date: Mon, 03 Sep 2018 16:33:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 2, 2018 at 11:49 PM Markus Lehtonen
<markus.lehtonen@linux.intel.com> wrote:
>
> Hi,
>
> IIRC, the problem was that all the syslog packages were providing ${sysco=
nfdir}/init.d/syslog which caused problems. And I don't think that has chan=
ged.
>
> Why would you want to install two syslog daemons on the system? You shoul=
d be able to install busybox after syslog as busybox-syslog is packaged in =
separate binary rpm.
>

thats fine, we need to have a RCONFLICTS statement to catch these
issues explicitly during packaging.

> Cheers,
>   Markus
>
> =EF=BB=BFOn 30/08/2018, 12.41, "ChenQi" <Qi.Chen@windriver.com> wrote:
>
>     On 08/30/2018 03:44 PM, Peter Kjellerstedt wrote:
>     >> -----Original Message-----
>     >> From: openembedded-core-bounces@lists.openembedded.org <openembedd=
ed-
>     >> core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
>     >> Sent: den 30 augusti 2018 05:56
>     >> To: openembedded-core@lists.openembedded.org
>     >> Subject: [OE-core] [PATCH 3/7] sysklogd: Use update-alternatives
>     >>
>     >> busybox also provides klogd and syslogd, this change makes it coex=
ist
>     >> peacefully. Currently rootfs fails in situations where both of the=
m are
>     >> providing these binaries and busybox postinsts fail
>     >>
>     >> update-alternatives: Error: not linking
>     >> /mnt/a/oe/build/tmp/work/qemuriscv64-bec-linux/core-image-full-
>     >> cmdline/1.0-r0/rootfs/sbin/klogd
>     >> to /bin/busybox.nosuid since
>     >> /mnt/a/oe/build/tmp/work/qemuriscv64-bec-linux/core-image-full-
>     >> cmdline/1.0-r0/rootfs/sbin/klogd
>     >> exists and is not a link
>     >>
>     >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     >> ---
>     >>   meta/recipes-extended/sysklogd/sysklogd.inc | 8 +++++++-
>     >>   1 file changed, 7 insertions(+), 1 deletion(-)
>     >>
>     >> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc
>     >> b/meta/recipes-extended/sysklogd/sysklogd.inc
>     >> index fc4e67c18e..2a8bed00f3 100644
>     >> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
>     >> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
>     >> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43=
cbc842c2336e835926c2166c28b \
>     >>                       file://klogd.c;beginline=3D2;endline=3D19;md=
5=3D7e87ed0ae6142de079bce738c10c899d \
>     >>                      "
>     >>
>     >> -inherit update-rc.d systemd
>     >> +inherit update-rc.d systemd update-alternatives
>     >>
>     >>   SRC_URI =3D "http://www.infodrom.org/projects/sysklogd/download/=
sysklogd-${PV}.tar.gz \
>     >>              file://no-strip-install.patch \
>     >> @@ -70,3 +70,9 @@ python () {
>     >>       if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True=
, False, d):
>     >>           d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
>     >>   }
>     >> +
>     >> +ALTERNATIVE_PRIORITY =3D "100"
>     >> +ALTERNATIVE_${PN} =3D "klogd syslogd"
>     >> +ALTERNATIVE_LINK_NAME[klogd] =3D "${base_sbindir}/klogd"
>     >> +ALTERNATIVE_LINK_NAME[syslogd] =3D "${base_sbindir}/syslogd"
>     >> +
>     >> --
>     >> 2.18.0
>     > This is a (partial) revert of commit 988aad01b2 (sysklogd: don't us=
e
>     > update-alternatives). Can you come to an agreement regarding which =
is
>     > the correct solution?
>     >
>     > //Peter
>     >
>
>
>     I think the previous commit (syslogd: don't use update-alternatives) =
is
>     made because syslog daemon conflict with each other. I guess the auth=
or
>     assumed that the 'syslogd' and 'klogd' alternatives entries are handl=
ed
>     by busybox-syslog package.
>
>     On the other hand, I think the patch is trying to solve the problem o=
f
>     busybox being installed after sysklogd.
>     We are currently not seeing errors because busybox is likely to be
>     installed before sysklogd. Even in this situation, the result is not =
all
>     correct, because the links busybox's postinstall creates are covered =
by
>     the real binaries from sysklogd.
>
>     I think the problem is about busybox's handling of alternatives.
>
>     Khem, I've sent out a patch to fix busybox's alternatives logic. Coul=
d
>     you please help review it?
>
>     Best Regards,
>     Chen Qi
>
>
>

