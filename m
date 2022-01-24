Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFAFC433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 16:18:11 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.5872.1643041090087006723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 08:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=FFwiibau;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id f13so3224934qto.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 08:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=NQeTE4W7eSt5/Eql7AYwYQcSSTTiryMSMVw+fMh5MpA=;
        b=FFwiibaucrownzGX1h5+NyzNciTWRaYfQG6Dy8NWByGALxFPdZYRQIxX1U2BF98GU8
         ZKXtRN7EBpbiSTqln/4UVqI6bqwHz7CJ0yc9tjQeqRrnDhs+nDXHUg6ctmIWAaOKXl6y
         wCrzbCOAtiKiQwEzLerqOzebx6LDg9DbFtn6i8W4liht8L4f/cTi6TSvtLepuQkictrS
         GIYdjQRejpvTzDkQdcCVwFbb91HYD43hnADaQfvyD73u1vL+y5v3w7HWu9J309vfGkC4
         /Lni2qbUHeubAWkUl7whyTTj3srKafIGzq1Ae0SHWVjH6HWYOmDRJyZbEZqaNhGuxwi/
         +C0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=NQeTE4W7eSt5/Eql7AYwYQcSSTTiryMSMVw+fMh5MpA=;
        b=BE/M3Rb5jkBwtf9tdPVQaQvNmDFMR/sahAJcPMAuFZqwAmGkroVQKq3ADAbLs22bWP
         AjqAouFKFwAhcHva8HCpUDgmPlt5W49IxPLIszWeftWhV9Nx03yM+rsltB0nSnG5/p84
         rWB191HRKsTgalTuDMxdjTKwWzo8HtOkefNDi8lcFSQSE7cM1X2oHd/4Izx7mMrmvEqJ
         JiyKuWwRz92N3m2ii5PuktCDNUTqdvwbh79S4AQ7m+FXJP2830gMjA+a32uJ16BkJJDn
         MupOWENAcPcJBWl7Hsl4oc9g5DBxw9L27doXz5cMhsjB9E57TTEWbBks+W+3jMLl91FU
         wxdw==
X-Gm-Message-State: AOAM530JF3GGF3C6pE7KLsxnrrlH2B5lUWUvaP/0gKC0Dc60uFMqZOhT
	nL+hPyaRkRP1EryyeBZOsLznutzXB4kaiIzVIecw8Kinkxsjfg==
X-Google-Smtp-Source: 
 ABdhPJyIUYnxZie9eAzmxepZdOCyV//SE3T8dhme+t9B5tRXAYFT5ASYvKauS4wUOP4uCpElqLv/hLz2/rlKpwvMN5k=
X-Received: by 2002:a05:622a:248:: with SMTP id
 c8mr12888884qtx.661.1643041089038;
 Mon, 24 Jan 2022 08:18:09 -0800 (PST)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 24 Jan 2022 11:17:58 -0500
Message-ID: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
Subject: Inclusive Language Proposal for YP/OE
To: yocto@lists.yoctoproject.org,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 16:18:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160881

From the beginning, OpenEmbedded and The Yocto Project have always
strived to be as inclusive as possible to all races, sexes,
orientations, religions, nationalities, and any other thing which
might divide people.  As continuation of this striving, there are
suggested changes below that are being proposed to make the projects
more inclusive and show the community as the professional, friendly,
and welcoming group that it is.   There are words in use by the
projects directly or one of its derivative layers that could be
offensive to some.  For more information on which words we selected
and why, please consult
https://inclusivenaming.org/word-lists/overview/

In the process of changing these, we are using this opportunity to
make the terms more obvious and useful, as well as removing cruft and
other unused code.  This is the pure definition of a win-win solution.

With this in mind, a group of people have tried to identify issues and
come up with a plan to address these.   We=E2=80=99ve divided the tasks int=
o 3
areas: bitbake variables, oe-core variables, and everything else.

Bitbake Variables
Taking issues in turn, for bitbake:

For BB_DISKMON_DIRS, the actions "ABORT, STOPTASKS and WARN" would
become "HALT, NO_NEW_TASKS and "WARN".

BB_ENV_WHITELIST -> BB_ENV_PASSTHROUGH
BB_ENV_EXTRAWHITE -> BB_ENV_PASSTHROUGH_ADDITIONS

BB_HASHCONFIG_WHITELIST -> BB_HASHCONFIG_IGNORE_VARS
BB_SETSCENE_ENFORCE_WHITELIST -> BB_SETSCENE_ENFORCE_IGNORE_TASKS
BB_HASHBASE_WHITELIST -> BB_BASEHASH_IGNORE_VARS
MULTI_PROVIDER_WHITELIST -> BB_MULTI_PROVIDER_ALLOWED
BB_STAMP_WHITELIST and BB_STAMP_POLICY -> delete the code (already merged)

basewhitelist and taskwhitelist as used in sigdata/siginfo will need
to be renamed and older file usage of the variables renamed at import
for backwards compatibility. The variables in bitbake along with usage
of abort will be renamed as appropriate.

For most variables, errors will be shown to the user if the old
variable names are set. Mostly this can be done in event hooks but
some like the BB_ENV changes will need special handling.

These changes hopefully improve consistency (e.g. a consistent BB_
prefix and BASHHASH as terminology used elsewhere) and also improve
the description of the variables to be more understandable to users.

OE-Core Variables
For OE-Core, the proposals are:

For blacklist.bbclass, the proposal is to add the functionality to the
anonymous Python in base.bbclass instead. PNBLACKLIST[xxx] would
become SKIP_RECIPE[xxx]. INHERIT_BLACKLIST would simply be dropped.

SSTATE_DUPWHITELIST -> SSTATE_ALLOW_OVERLAP_FILES
CVE_CHECK_PN_WHITELIST -> CVE_CHECK_SKIPRECIPE
CVE_CHECK_WHITELIST -> CVE_CHECK_IGNORECVE
SYSROOT_DIRS_BLACKLIST -> SYSROOT_DIRS_IGNORE
LICENSE_FLAGS_WHITELIST -> LICENSE_FLAGS_ACCEPTED
UNKNOWN_CONFIGURE_WHITELIST -> UNKNOWN_CONFIGURE_OPT_IGNORE
SDK_LOCAL_CONF_BLACKLIST -> ESDK_LOCALCONF_REMOVE
SDK_LOCAL_CONF_WHITELIST -> ESDK_LOCALCONF_ALLOW
SDK_INHERIT_BLACKLIST -> ESDK_CLASS_INHERIT_DISABLE
TUNEABI_WHITELIST - already removed as obsolete

For the ICECC_USER_XXX and ICECC_SYSTEM_XXX, we think these can likely
be merged into single variables:

ICECC_USER_CLASS_BL -> ICECC_CLASS_DISABLE
ICECC_SYSTEM_CLASS_BL -> ICECC_CLASS_DISABLE
ICECC_USER_PACKAGE_WL -> ICECC_RECIPE_ENABLE
ICECC_USER_PACKAGE_BL -> ICECC_RECIPE_DISABLE
ICECC_SYSTEM_PACKAGE_BL -> ICECC_RECIPE_DISABLE

For license handling, we=E2=80=99d use the opportunity to clean up the
WHITELIST_(ANY LICENSE) syntax and replace it with a
INCOMPATIBLE_LICENSE_ALLOWED_RECIPES, which would be a list of recipes
which are of a blocked the INCOMPATIBLE_LICENSE list.

Everything else
The migration plan includes writing a script to assist with the
migration. In many cases it can likely make the translation. In cases
where that isn=E2=80=99t possible, it will aim to list the areas the user
needs to fix references.

A warning mechanism will be added to bitbake to detect usage of old
variable names (post parsing), except for BB_ENV issues which will
likely need special handling. A (limited) conversion script will be
created to help with the migration. For those instances where a 1-1
mapping is not achievable, a list of the occurrences and what it
should be changed to will occur.


Patch files in OE to be renamed:
11_tcpd_blacklist.patch -> 11_tcpd_blocklist.patch
mount.blacklist -> mount.disallow
0001-lxdm.conf.in-blacklist-root-for-release-images.patch ->
0001-lxdm.conf.in-deny-root-for-release-images.patch
022-RH-Remove-the-property-blacklist-exception-builtin.patch ->
022-RH-Remove-the-default-property-exception-builtin.patch
0001-Cargo.toml-do-not-abort-on-panic.patch ->
0001-Cargo.toml-do-not-exit-on-panic.patch
0004-Cargo.toml-do-not-abort-on-panic.patch ->
0004-Cargo.toml-do-not-exit-on-panic.patch
Also, there are a few others outside of OE that should probably be patched =
too.

Branch Names
The =E2=80=9Cmaster=E2=80=9D branches on the relevant OpenEmbedded and Yoct=
o Project
git trees will be changed to an alternative name at some point in the
future.  The current preferred name is =E2=80=9Cdevel=E2=80=9D.  There is n=
o time
table for this currently, and there is no obligation or requirement to
change the branch name for any downstream project which is beyond the
project=E2=80=99s remit.

Similarly, there is no need to change any recipes that are using a
=E2=80=9Cmaster=E2=80=9D branch as part of the SRC_URI.  Those are outside =
the scope
of YP/OE and this effort.

Note
These changes are only to bitbake and OE-Core.  There is no
requirement to change any other layers but we=E2=80=99d note consistency is
encouraged and helpful to users.

Helping
If you would like to help, please put your name by the items in
question on the inclusive language wiki page.
https://wiki.yoctoproject.org/wiki/Inclusive_language

Thanks
Special thanks to Richard Purdie, Michael Opdenacker. Marta
Rybczynska, Scott Murray, Jan-Simon Moeller, Saul Wold, and Armin
Kuster for providing their time, technical details, text, and feedback
on this task.

