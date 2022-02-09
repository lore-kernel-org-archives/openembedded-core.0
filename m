Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4538C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 08:36:41 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web08.24076.1644395801034037863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 00:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b6MQIMxI;
 spf=pass (domain: gmail.com, ip: 209.85.217.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id w6so1339480vsf.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 00:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QUIH+FUkScDlo0usXFZSzIGJwvCTOiZTZ/FEdhzt/7Y=;
        b=b6MQIMxIADyqnHarZdswFt3xAgZ7XiRXqr1lhYPDusp2kX7U74Vb+Nr4uhf6Z1egkJ
         0imuKec0wu+OsCmem96iiF6jtDg+ujNReX8Hr4WEBehq9fTodu0Zqf45X45bl67yWFw6
         tmt8uFy9HKirk60KGSXxpzKR8CCuWmtCJryGMOFyU9qczt2G+brpS6saVdx9sSrRuY26
         68XHXFxLqFR8ftFzOa/RRlriNTPYI03yYn5CIJ0LeW+2FE2lB10wppL8tUR2/Jw8qWPV
         A5QAwSteZtRYTP4KiY7Kg4hMuPrOtcCTSoJlWrvx53ZeM5Art8JTgA972WfWZfwXyAap
         3jHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QUIH+FUkScDlo0usXFZSzIGJwvCTOiZTZ/FEdhzt/7Y=;
        b=ZHe81WeTWmUN8C6fMX0JZhob2bM01ChPsLW4hdIORCzoxW5pRwghZ2XDFgusja/8Xv
         v3MyMMYKD8i2kXf11tYiRxRKhGTFVco4uDZGpFb9leK0vYISoE8Fc41u0J1ZKnOK4WGN
         MDJdD+3M9VJssfNTKY0S0NxcmWH9YxrldfZYB6klAMC/M9GM2c5epTskxqiZaqBJ9Ujd
         PPvaXE6T6QGvQVvJB3Y7Lu/PVOboijbXVgFhca1KZhQ7vlzL4WYkoTG5qggBoXcO8Rd9
         Jjf6pyeg5pwMEIe2eRd6RLC4Puh3ky4iFUsDIfRCyQYKvVwRYw46r6eHCIsVZFJiUjc8
         J+XQ==
X-Gm-Message-State: AOAM532QN8F4oqqWiVyMuxEk26ow8sQHLMWbJj1JWhZyQt0zGmZiBRdb
	ZNRLnpHCHblGO2Ad82ETG/fTWgSomXswvaQLDqpdYDuw
X-Google-Smtp-Source: 
 ABdhPJyGAlFhBVSKoUV8e9MVKgWr/LY11TTd/ivjgQNnimAWSVq3+b1gD+jv2km88U2cGskBRw1OypQresK+FXDJGIc=
X-Received: by 2002:a67:4384:: with SMTP id q126mr321433vsa.81.1644395800171;
 Wed, 09 Feb 2022 00:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20220209080906.20759-1-sanakazisk19@gmail.com>
In-Reply-To: <20220209080906.20759-1-sanakazisk19@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Feb 2022 09:36:28 +0100
Message-ID: 
 <CANNYZj8atqujFs5+WtOGPnoJ=Vc=so3Rd5yDZnAohX4oivCj_Q@mail.gmail.com>
Subject: Re: [OE-core] [poky][master][PATCH 1/2] buildhistory.bbclass: Enable
 exporting more recipe and package data
To: sana kazi <sanakazisk19@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 08:36:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161542

I think what is set in poky.conf should be set directly in the class.
Not everyone uses poky as a distro, and buildhistory should work for
all.

Alex

On Wed, 9 Feb 2022 at 09:11, sana kazi <sanakazisk19@gmail.com> wrote:
>
> Used BUILDHISTORY_EXPORT_RECIPE_VARIABLES and
> BUILDHISTORY_EXPORT_PACKAGE_VARIABLES to export recipe and package
> data to the latest file of buildhistory and sorted it alphabetically.
>
> This makes extending data in buildhistory git tree simple and avoids
> patches to it for users who care about things like SRC_URI and like
> to track it in buildhistory git tree.
>
> Now we can add additional information as per our requirement to the
> buildhistory like LICENSE, SRC_URI AND MAINTAINER to the buildhistory
> by appending them in a recipe or distro specific conf file as follows:
>
> BUILDHISTORY_EXPORT_RECIPE_VARIABLES += "MAINTAINER"
> BUILDHISTORY_EXPORT_PACKAGE_VARIABLES += "MAINTAINER"
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> ---
>  meta-poky/conf/distro/poky.conf   |   2 +
>  meta/classes/buildhistory.bbclass | 106 +++++++++++++++++++-----------
>  2 files changed, 70 insertions(+), 38 deletions(-)
>
> diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
> index 2dc3606ae5..c382493dbc 100644
> --- a/meta-poky/conf/distro/poky.conf
> +++ b/meta-poky/conf/distro/poky.conf
> @@ -72,3 +72,5 @@ INHERIT += "uninative"
>
>  BB_SIGNATURE_HANDLER ?= "OEEquivHash"
>  BB_HASHSERVE ??= "auto"
> +BUILDHISTORY_EXPORT_RECIPE_VARIABLES ?= "PR PV PE LAYER DEPENDS PACKAGES SRC_URI LICENSE CONFIG"
> +BUILDHISTORY_EXPORT_PACKAGE_VARIABLES ?= "PE PV PR PKG PKGE PKGV PKGR RPROVIDES RDEPENDS RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS PKGSIZE FILES FILELIST"
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index daa96f3b63..04837cafc4 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -264,12 +264,11 @@ python buildhistory_emit_pkghistory() {
>      rcpinfo.pe = pe
>      rcpinfo.pv = pv
>      rcpinfo.pr = pr
> -    rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS') or ""))
>      rcpinfo.packages = packages
>      rcpinfo.layer = layer
> -    rcpinfo.license = license
>      rcpinfo.config = sortlist(oe.utils.squashspaces(d.getVar('PACKAGECONFIG') or ""))
> -    rcpinfo.src_uri = oe.utils.squashspaces(d.getVar('SRC_URI') or "")
> +    export_recipe_variables = d.getVar('BUILDHISTORY_EXPORT_RECIPE_VARIABLES') or ''
> +    rcpinfo.export_recipe_variables = export_recipe_variables
>      write_recipehistory(rcpinfo, d)
>
>      bb.build.exec_func("read_subpackage_metadata", d)
> @@ -323,6 +322,9 @@ python buildhistory_emit_pkghistory() {
>
>          pkginfo.size = int(localdata.getVar('PKGSIZE') or '0')
>
> +        export_package_variables = d.getVar('BUILDHISTORY_EXPORT_PACKAGE_VARIABLES') or ''
> +        pkginfo.export_package_variables = export_package_variables
> +
>          write_pkghistory(pkginfo, d)
>
>      oe.qa.exit_if_errors(d)
> @@ -370,17 +372,22 @@ def write_recipehistory(rcpinfo, d):
>      pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
>
>      infofile = os.path.join(pkghistdir, "latest")
> +    export_recipe_variables = set(rcpinfo.export_recipe_variables.split())
> +    ret = []
>      with open(infofile, "w") as f:
> -        if rcpinfo.pe != "0":
> -            f.write(u"PE = %s\n" %  rcpinfo.pe)
> -        f.write(u"PV = %s\n" %  rcpinfo.pv)
> -        f.write(u"PR = %s\n" %  rcpinfo.pr)
> -        f.write(u"DEPENDS = %s\n" %  rcpinfo.depends)
> -        f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
> -        f.write(u"LAYER = %s\n" %  rcpinfo.layer)
> -        f.write(u"LICENSE = %s\n" %  rcpinfo.license)
> -        f.write(u"CONFIG = %s\n" %  rcpinfo.config)
> -        f.write(u"SRC_URI = %s\n" %  rcpinfo.src_uri)
> +        for var in export_recipe_variables:
> +            if var == "PE":
> +                if rcpinfo.pe != "0":
> +                    ret.append("%s = %s" % (var, rcpinfo.pe))
> +            elif var == "LAYER":
> +                ret.append("%s = %s" % (var, rcpinfo.layer))
> +            elif var == "CONFIG":
> +                ret.append("%s = %s" % (var, rcpinfo.config))
> +            else:
> +                ret.append("%s = %s" % (var," ".join((str(d.getVar(var)).split()))))
> +        ret.sort()
> +        for element in ret:
> +            f.write(element + "\n")
>
>      write_latest_srcrev(d, pkghistdir)
>
> @@ -394,32 +401,55 @@ def write_pkghistory(pkginfo, d):
>          bb.utils.mkdirhier(pkgpath)
>
>      infofile = os.path.join(pkgpath, "latest")
> +    export_package_variables = set(pkginfo.export_package_variables.split())
> +    ret = []
>      with open(infofile, "w") as f:
> -        if pkginfo.pe != "0":
> -            f.write(u"PE = %s\n" %  pkginfo.pe)
> -        f.write(u"PV = %s\n" %  pkginfo.pv)
> -        f.write(u"PR = %s\n" %  pkginfo.pr)
> -
> -        if pkginfo.pkg != pkginfo.name:
> -            f.write(u"PKG = %s\n" % pkginfo.pkg)
> -        if pkginfo.pkge != pkginfo.pe:
> -            f.write(u"PKGE = %s\n" % pkginfo.pkge)
> -        if pkginfo.pkgv != pkginfo.pv:
> -            f.write(u"PKGV = %s\n" % pkginfo.pkgv)
> -        if pkginfo.pkgr != pkginfo.pr:
> -            f.write(u"PKGR = %s\n" % pkginfo.pkgr)
> -        f.write(u"RPROVIDES = %s\n" %  pkginfo.rprovides)
> -        f.write(u"RDEPENDS = %s\n" %  pkginfo.rdepends)
> -        f.write(u"RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
> -        if pkginfo.rsuggests:
> -            f.write(u"RSUGGESTS = %s\n" %  pkginfo.rsuggests)
> -        if pkginfo.rreplaces:
> -            f.write(u"RREPLACES = %s\n" %  pkginfo.rreplaces)
> -        if pkginfo.rconflicts:
> -            f.write(u"RCONFLICTS = %s\n" %  pkginfo.rconflicts)
> -        f.write(u"PKGSIZE = %d\n" %  pkginfo.size)
> -        f.write(u"FILES = %s\n" %  pkginfo.files)
> -        f.write(u"FILELIST = %s\n" %  pkginfo.filelist)
> +        for var in export_package_variables:
> +            if var == "PE":
> +                if pkginfo.pe != "0":
> +                    ret.append("%s = %s" % (var, pkginfo.pe))
> +            elif var == "PV":
> +                ret.append("%s = %s" % (var, pkginfo.pv))
> +            elif var == "PR":
> +                ret.append("%s = %s" % (var, pkginfo.pr))
> +            elif var == "RPROVIDES":
> +                ret.append("%s = %s" % (var, pkginfo.rprovides))
> +            elif var == "RDEPENDS":
> +                ret.append("%s = %s" % (var, pkginfo.rdepends))
> +            elif var == "RRECOMMENDS":
> +                ret.append("%s = %s" % (var, pkginfo.rrecommends))
> +            elif var == "PKGSIZE":
> +                ret.append("%s = %s" % (var, pkginfo.size))
> +            elif var == "FILES":
> +                ret.append("%s = %s" % (var, pkginfo.files))
> +            elif var == "FILELIST":
> +                ret.append("%s = %s" % (var, pkginfo.filelist))
> +            elif var == "RSUGGESTS":
> +                if pkginfo.rsuggests:
> +                    ret.append(u"RSUGGESTS = %s" %  pkginfo.rsuggests)
> +            elif var == "RREPLACES":
> +                if pkginfo.rreplaces:
> +                    ret.append(u"RREPLACES = %s" %  pkginfo.rreplaces)
> +            elif var == "RCONFLICTS":
> +                if pkginfo.rconflicts:
> +                    ret.append(u"RCONFLICTS = %s" %  pkginfo.rconflicts)
> +            elif var == "PKG":
> +                if pkginfo.pkg != pkginfo.name:
> +                    ret.append(u"PKG = %s" % pkginfo.pkg)
> +            elif var == "PKGE":
> +                if pkginfo.pkge != pkginfo.pe :
> +                    ret.append(u"PKGE = %s" % pkginfo.pkge)
> +            elif var == "PKGV":
> +                if pkginfo.pkgv != pkginfo.pv:
> +                    ret.append(u"PKGV = %s" % pkginfo.pkgv)
> +            elif var == "PKGR":
> +                if pkginfo.pkgr != pkginfo.pr:
> +                    ret.append(u"PKGR = %s" % pkginfo.pkgr)
> +            else:
> +                ret.append("%s = %s" % (var, d.getVar(var)))
> +        ret.sort()
> +        for element in ret:
> +            f.write(element + "\n")
>
>      for filevar in pkginfo.filevars:
>          filevarpath = os.path.join(pkgpath, "latest.%s" % filevar)
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161538): https://lists.openembedded.org/g/openembedded-core/message/161538
> Mute This Topic: https://lists.openembedded.org/mt/89017596/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

