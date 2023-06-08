Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAFBC7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 16:16:50 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.13793.1686241000524612827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 09:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=jc3upGya;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9786fc23505so124434666b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 09:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686240999; x=1688832999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DejPgcpJVIJhjeVuLG5RLw6yElrjPAmLRJVzJPTrgwA=;
        b=jc3upGyarzNdC5qM06mS7xi5QqWW019hpZXW54a7lPnKPtSy5E59zbaSBP3+LSXqqE
         kJSM34FgYZksr0IxOhta0V9hkH477P1r/gM6YNnt0fF5AVEgau8mVTGV7xEvE7lbhuX3
         alD+vJ/+qAex/PopbWkTo0YUg1JyIMZK6nitEzPBqazTBxO/8IyTJA2VQ+7zA/X7b0C9
         /APlhZR8DMf4+/6IODHf4Pta2K48YUwvpzrtN1nRsKfobg4QJCcDwRH2PvCJ+/5jAySo
         KcZe/9efQwDANFryUcceWtTmxLv8m3b4qSbOlY0ym/2HncvoCcQXmIJmlMyxCvcDtl/w
         ybCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686240999; x=1688832999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DejPgcpJVIJhjeVuLG5RLw6yElrjPAmLRJVzJPTrgwA=;
        b=K2TdwlYqKguo5jOFaVjgQsZ8QdHYyo9mqS9jabFMt6ZqAjACneAAr7ZaWLyK8Vy7lX
         7SM0LiyK5XEc2C45s16Cd2Tr3+1rQTKyD3MfhJQRCOnMltpM4fy6IRr6dkkEkSoepyGO
         nPVg7WawS46fJfhGzVlSB5t5oyHaCkN9IG4bcYZPDAnvaIxTqJB7Dl1bzta/xxANVWEF
         dul7AzBRcaKaT8JWd83HoMGwx94yLe8Pl3+6jMdJrnyheuBT3pnVPY1tRQ9WKH7LPDMV
         5ezW+fPBYNGgVlS34yS2h3TzZTpprozwelXIhzuJAU8RgUnIOps7mG9zzgCO3g3oBI5s
         +aig==
X-Gm-Message-State: AC+VfDxkAAJFTMHRLnunIOCHJAzCBgM03OKihYKZ4JBZu2xf2kDMcBRh
	OV/bVD2M0Dsh3/N6nluQuFCi6+kdOeRBqAhNOR3mrA==
X-Google-Smtp-Source: ACHHUZ6RSwnYALRGrjBBViEG0me+w/z3x9rnQAdWymQ+eCWHUhNRZr9Jimn0cyE5v7Ktng60PLAc+e50kjMShDH/O08=
X-Received: by 2002:a17:907:944f:b0:94e:ec32:ba28 with SMTP id
 dl15-20020a170907944f00b0094eec32ba28mr236705ejc.29.1686240998538; Thu, 08
 Jun 2023 09:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230608095227.34548-1-badganchipv@gmail.com>
In-Reply-To: <20230608095227.34548-1-badganchipv@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 8 Jun 2023 06:16:27 -1000
Message-ID: <CAOSpxdZ=WuNY9M6r=EFwYoK4CDZ5m=-6-c0Kd_BPW84dnv3AXA@mail.gmail.com>
Subject: Feedback request: Re: [OE-core][dunfell][PATCH 1/2] systemd:
 implement --initialized-match/nomatch arguments
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 16:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182513

This patch series adds a feature to systemd, which is typically not
allowed in a stable branch.

However I can see that there might be an argument that this is
actually fixing a bug (needless re-triggering of devices)

I'd love to get feedback from others as to whether I should take this patch=
.

Steve

On Wed, Jun 7, 2023 at 11:52=E2=80=AFPM Pawan Badganchi <badganchipv@gmail.=
com> wrote:
>
> systemd-udev-trigger.service by default triggeres all devices regardless
> of whether they were already recognized by systemd-udevd.
>
> There are machines (especially in embedded environments) where
> systemd-udev-trigger.service is configured to run at a later stage of
> the boot sequence, which can lead to quite a lot of devices being
> triggered although they were already recognized by systemd-udevd.
>
> Re-triggering a lot of devices is a relatively expensive operation and
> therefore should be avoided if unnecessary.
>
> Therefore this patch introduces --initialized-nomatch, which filters out
> devices that are already present in the udev database. For consistance
> reasons --initialized-match is implemented as well, which filters out dev=
ices
> that are *not* already present in the udev database.
>
> Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
> ---
>  ...-initialized-match-nomatch-arguments.patch | 156 ++++++++++++++++++
>  meta/recipes-core/systemd/systemd_244.5.bb    |   1 +
>  2 files changed, 157 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-udevadm-trigge=
r-implement-initialized-match-nomatch-arguments.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0001-udevadm-trigger-imple=
ment-initialized-match-nomatch-arguments.patch b/meta/recipes-core/systemd/=
systemd/0001-udevadm-trigger-implement-initialized-match-nomatch-arguments.=
patch
> new file mode 100644
> index 0000000000..2f7da0aff9
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-udevadm-trigger-implement-in=
itialized-match-nomatch-arguments.patch
> @@ -0,0 +1,156 @@
> +From 678f2b16676cd566c50bdec78350f732a9a3ee41 Mon Sep 17 00:00:00 2001
> +From: Danilo Krummrich <danilo.krummrich@bmw.de>
> +Date: Mon, 14 Jun 2021 17:46:00 +0200
> +Subject: [PATCH] udevadm: trigger: implement --initialized-match/nomatch
> + arguments
> +
> +systemd-udev-trigger.service by default triggeres all devices regardless
> +of whether they were already recognized by systemd-udevd.
> +
> +There are machines (especially in embedded environments) where
> +systemd-udev-trigger.service is configured to run at a later stage of
> +the boot sequence, which can lead to quite a lot of devices being
> +triggered although they were already recognized by systemd-udevd.
> +
> +Re-triggering a lot of devices is a relatively expensive operation and
> +therefore should be avoided if unnecessary.
> +
> +Therefore this patch introduces --initialized-nomatch, which filters out
> +devices that are already present in the udev database. For consistance
> +reasons --initialized-match is implemented as well, which filters out de=
vices
> +that are *not* already present in the udev database.
> +
> +Replaces #19949.
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/678=
f2b16676cd566c50bdec78350f732a9a3ee41.patch]
> +Comment: Refreshed hunk from udevadm, _udevadm and udevadm-trigger.c
> +Signed-off-by: Pawan Badganchi <pawan.badganchi@kpit.com>
> +---
> + man/udevadm.xml               | 29 +++++++++++++++++++++++++++++
> + shell-completion/bash/udevadm |  3 ++-
> + shell-completion/zsh/_udevadm |  2 ++
> + src/udev/udevadm-trigger.c    | 13 +++++++++++++
> + 4 files changed, 46 insertions(+), 1 deletion(-)
> +
> +diff --git a/man/udevadm.xml b/man/udevadm.xml
> +index 24ed4a29c71d..af485711222e 100644
> +--- a/man/udevadm.xml
> ++++ b/man/udevadm.xml
> +@@ -395,6 +395,35 @@
> +             then each matching result is ORed, that is, all children of=
 each specified device are triggered.</para>
> +           </listitem>
> +         </varlistentry>
> ++        <varlistentry>
> ++          <term><option>--initialized-match</option></term>
> ++          <term><option>--initialized-nomatch</option></term>
> ++          <listitem>
> ++            <para>When <option>--initialized-match</option> is specifie=
d, trigger events for devices
> ++            that are already initialized by <command>systemd-udevd</com=
mand>, and skip devices that
> ++            are not initialized yet.</para>
> ++            <para>When <option>--initialized-nomatch</option> is specif=
ied, trigger events for devices
> ++            that are not initialized by <command>systemd-udevd</command=
> yet, and skip devices that
> ++            are already initialized.</para>
> ++            <para>Here, initialized devices are those for which at leas=
t one udev rule already
> ++            completed execution =E2=80=93 for any action but <literal>r=
emove</literal> =E2=80=94 that set a property
> ++            or other device setting (and thus has an entry in the udev =
device database). Devices are
> ++            no longer considered initialized if a <literal>remove</lite=
ral> action is seen for them
> ++            (which removes their entry in the udev device database). No=
te that devices that have no
> ++            udev rules are never considered initialized, but might stil=
l be announced via the sd-device
> ++            API (or similar). Typically, it is thus essential that appl=
ications which intend to use
> ++            such a match, make sure a suitable udev rule is installed t=
hat sets at least one property
> ++            on devices that shall be matched.</para>
> ++            <para>WARNING: <option>--initialized-nomatch</option> can p=
otentially save a significant
> ++            amount of time compared to re-triggering all devices in the=
 system and e.g. can be used to
> ++            optimize boot time. However, this is not safe to be used in=
 a boot sequence in general.
> ++            Especially, when udev rules for a device depend on its pare=
nt devices (e.g.
> ++            <literal>ATTRS</literal> or <literal>IMPORT{parent}</litera=
l> keys, see
> ++            <citerefentry><refentrytitle>udev</refentrytitle><manvolnum=
>7</manvolnum></citerefentry>
> ++            for more details), the final state of the device becomes ea=
sily unstable with this option.
> ++            </para>
> ++          </listitem>
> ++        </varlistentry>
> +         <varlistentry>
> +           <term><option>-w</option></term>
> +           <term><option>--settle</option></term>
> +diff --git a/shell-completion/bash/udevadm b/shell-completion/bash/udeva=
dm
> +index 4d52597cbfdf..23ce02365c7f 100644
> +--- a/shell-completion/bash/udevadm
> ++++ b/shell-completion/bash/udevadm
> +@@ -51,7 +51,8 @@
> +         [INFO_STANDALONE]=3D'-r --root -a --attribute-walk -x --export =
-e --export-db -c --cleanup-db
> +                            -w --wait-for-initialization'
> +         [INFO_ARG]=3D'-q --query -p --path -n --name -P --export-prefix=
 -d --device-id-of-file'
> +-        [TRIGGER_STANDALONE]=3D'-v --verbose -n --dry-run -w --settle -=
-wait-daemon'
> ++        [TRIGGER_STANDALONE]=3D'-v --verbose -n --dry-run -w --settle -=
-wait-daemon
> ++                              --initialized-match --initialized-nomatch=
'
> +         [TRIGGER_ARG]=3D'-t --type -c --action -s --subsystem-match -S =
--subsystem-nomatch
> +                        -a --attr-match -A --attr-nomatch -p --property-=
match
> +                        -g --tag-match -y --sysname-match --name-match -=
b --parent-match'
> +diff --git a/shell-completion/zsh/_udevadm b/shell-completion/zsh/_udeva=
dm
> +index 8a10237e3d66..63df8b7c9ecc 100644
> +--- a/shell-completion/zsh/_udevadm
> ++++ b/shell-completion/zsh/_udevadm
> +@@ -30,7 +30,9 @@
> +         '--property-match=3D[Trigger events for devices with a matching=
 property value.]' \
> +         '--tag-match=3Dproperty[Trigger events for devices with a match=
ing tag.]' \
> +         '--sysname-match=3D[Trigger events for devices with a matching =
sys device name.]' \
> +-        '--parent-match=3D[Trigger events for all children of a given d=
evice.]'
> ++        '--parent-match=3D[Trigger events for all children of a given d=
evice.]' \
> ++        '--initialized-match[Trigger events for devices that are alread=
y initialized.]' \
> ++        '--initialized-nomatch[Trigger events for devices that are not =
initialized yet.]'
> + }
> +
> + (( $+functions[_udevadm_settle] )) ||
> +diff --git a/src/udev/udevadm-trigger.c b/src/udev/udevadm-trigger.c
> +index e4b3150e6039..56921e2cc62e 100644
> +--- a/src/udev/udevadm-trigger.c
> ++++ b/src/udev/udevadm-trigger.c
> +@@ -10,6 +10,7 @@
> + #include "device-private.h"
> + #include "fd-util.h"
> + #include "fileio.h"
> ++#include "parse-util.h"
> + #include "path-util.h"
> + #include "process-util.h"
> + #include "set.h"
> +@@ -130,6 +131,8 @@
> +                "  -y --sysname-match=3DNAME           Trigger devices w=
ith this /sys path\n"
> +                "     --name-match=3DNAME              Trigger devices w=
ith this /dev name\n"
> +                "  -b --parent-match=3DNAME            Trigger devices w=
ith that parent device\n"
> ++               "     --initialized-match            Trigger devices tha=
t are already initialized\n"
> ++               "     --initialized-nomatch          Trigger devices tha=
t are not initialized yet\n"
> +                "  -w --settle                       Wait for the trigge=
red events to complete\n"
> +                "     --wait-daemon[=3DSECONDS]        Wait for udevd da=
emon to be initialized\n"
> +                "                                    before triggering u=
events\n"
> +@@ -142,6 +145,8 @@
> +         enum {
> +                 ARG_NAME =3D 0x100,
> +                 ARG_PING,
> ++                ARG_INITIALIZED_MATCH,
> ++                ARG_INITIALIZED_NOMATCH,
> +         };
> +
> +         static const struct option options[] =3D {
> +@@ -158,6 +163,8 @@
> +                 { "sysname-match",     required_argument, NULL, 'y'    =
  },
> +                 { "name-match",        required_argument, NULL, ARG_NAM=
E },
> +                 { "parent-match",      required_argument, NULL, 'b'    =
  },
> ++                { "initialized-match",     no_argument,       NULL, ARG=
_INITIALIZED_MATCH     },
> ++                { "initialized-nomatch",   no_argument,       NULL, ARG=
_INITIALIZED_NOMATCH   },
> +                 { "settle",            no_argument,       NULL, 'w'    =
  },
> +                 { "wait-daemon",       optional_argument, NULL, ARG_PIN=
G },
> +                 { "version",           no_argument,       NULL, 'V'    =
  },
> +@@ -301,7 +308,12 @@
> +                         }
> +                         break;
> +                 }
> +-
> ++                case ARG_INITIALIZED_MATCH:
> ++                case ARG_INITIALIZED_NOMATCH:
> ++                        r =3D device_enumerator_add_match_is_initialize=
d(e, c =3D=3D ARG_INITIALIZED_MATCH ? MATCH_INITIALIZED_YES : MATCH_INITIAL=
IZED_NO);
> ++                        if (r < 0)
> ++                                return log_error_errno(r, "Failed to se=
t initialized filter: %m");
> ++                        break;
> +                 case 'V':
> +                         return print_version();
> +                 case 'h':
> diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-co=
re/systemd/systemd_244.5.bb
> index bd66d82932..a398043308 100644
> --- a/meta/recipes-core/systemd/systemd_244.5.bb
> +++ b/meta/recipes-core/systemd/systemd_244.5.bb
> @@ -39,6 +39,7 @@ SRC_URI +=3D "file://touchscreen.rules \
>             file://CVE-2023-26604-2.patch \
>             file://CVE-2023-26604-3.patch \
>             file://CVE-2023-26604-4.patch \
> +           file://0001-udevadm-trigger-implement-initialized-match-nomat=
ch-arguments.patch \
>             "
>
>  # patches needed by musl
> --
> 2.38.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182500): https://lists.openembedded.org/g/openembedde=
d-core/message/182500
> Mute This Topic: https://lists.openembedded.org/mt/99403398/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

