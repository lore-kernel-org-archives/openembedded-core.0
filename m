Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.50.1626713741252954033
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 09:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vy2v8gaQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.41, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f41.google.com with SMTP id f17so22902068wrt.6
        for <Openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 09:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aId8uLiVR0TdTeog5rY9aPL68sqOReMP9hf18NpGzmk=;
        b=vy2v8gaQI58icF/2QFUOcfHvrI7jHEteD27YDRgq4KkdyZSRFZC0njbZ7WW6KRHmJ8
         CVxASFifgJfwn2GHtuntciFHunTnRC9rKbkWxJryGV9VhFAbmbA4ARnQ7q05vI4JLSD8
         6xH6UoLPzUgM/dG1T5x8/YfkLw9GfhlTHMCX2HitUTxt4p+iZydsYleZSNlwUHkcEamH
         uvcLQrGwyAJVf6s/6FqOgn/0I1HtSKZZpNV2yyC9G22P/VMSjYT6rZkGRvWUUKMWig6j
         KC+ONfJglkkvioHR/XDpCO9lDQm8oMpqIxNF1kuOZt+fi7DUm+QZ5oBXmQsVKBH8iuQ9
         +fWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aId8uLiVR0TdTeog5rY9aPL68sqOReMP9hf18NpGzmk=;
        b=haPOgfUWkOdL0tSyFXwrvRnV4MSpNYxmTuRpBRy2S05/G1cP+bByBVMkiR2yTnE0iF
         +gSw6puaq/sf5A5a0vIitxT9Nv17kjf30YIEWRG8wM8RmR/rcyLOOALUk3q5EcmoSkJG
         l4uSn4e4rao1O7uYOuu0HY0rxZobuWE5IDRUzUhBbdv7wXohlqIHg6ZtMYB3cCFdWGJE
         Jj6t5dz85IN0toYlSWaA5Mm3QbZneqdAn7O/uhaGzwKn62syU6ee8vaHN7TSCAo/kJCA
         vuzC8YQ0IvHtpxjnUkQtYZEnGhMNU0pdUAeNOo54F7mzzS4emr/GyjTeofxZXMKcztn2
         BFoQ==
X-Gm-Message-State: AOAM5332AmYYeRxxPrxgNWV3jy/nEjuCFaPre7wRDU8qs6Cy8LV+bF5s
	BCqbV/qiugOsdQeELIE/8KJGU+POBmxFjJg8TmyKvQ==
X-Google-Smtp-Source: ABdhPJziW1nZmyPHVrLgzalNb5suxtmCCx4WMMgmaI1uDZElf+hAGstFX+PBenU7y/uXns/A250i+2xkkSf6C9mhWSU=
X-Received: by 2002:adf:ce10:: with SMTP id p16mr31016012wrn.205.1626713739703;
 Mon, 19 Jul 2021 09:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210719111950.3560-1-sanakazisk19@gmail.com>
In-Reply-To: <20210719111950.3560-1-sanakazisk19@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 19 Jul 2021 06:55:28 -1000
Message-ID: <CAOSpxdZpbnkLseMdLCcmYSrfhHg-0VKm6hr8nf+HtEV56DNsYQ@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] buildhistory.bbclass: Enable exporting more recipe and package data
To: sana kazi <sanakazisk19@gmail.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, nishaparrakat@gmail.com, 
	Sana Kazi <Sana.Kazi@kpit.com>
Content-Type: text/plain; charset="UTF-8"

There is a "master first" policy for dunfell, so this series would
need to be accepted into the master branch before it can be considered
for dunfell.

Also, this is a new feature, so that also is an issue for including
this in dunfell, where changes are typically only CVE and bug fixes.

Steve

On Mon, Jul 19, 2021 at 1:20 AM sana kazi <sanakazisk19@gmail.com> wrote:
>
> From: Sana Kazi <Sana.Kazi@kpit.com>
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
> BUILDHISTORY_EXPORT_RECIPE_VARIABLES += "LICENSE MAINTAINER SRC_URI"
> BUILDHISTORY_EXPORT_PACKAGE_VARIABLES += "LICENSE MAINTAINER"
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> ---
>  meta-poky/conf/distro/poky.conf   |  2 +
>  meta/classes/buildhistory.bbclass | 98 +++++++++++++++++++++----------
>  2 files changed, 68 insertions(+), 32 deletions(-)
>
> diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
> index 92e9ba5477..d766d4b1f5 100644
> --- a/meta-poky/conf/distro/poky.conf
> +++ b/meta-poky/conf/distro/poky.conf
> @@ -89,3 +89,5 @@ INHERIT += "reproducible_build"
>
>  BB_SIGNATURE_HANDLER ?= "OEEquivHash"
>  BB_HASHSERVE ??= "auto"
> +BUILDHISTORY_EXPORT_RECIPE_VARIABLES ?= "PR PV PE LAYER DEPENDS PACKAGES"
> +BUILDHISTORY_EXPORT_PACKAGE_VARIABLES ?= "PE PV PR PKG PKGE PKGV PKGR RPROVIDES RDEPENDS RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS PKGSIZE FILES FILELIST"
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 44a66df962..a2888666d9 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -254,6 +254,8 @@ python buildhistory_emit_pkghistory() {
>      rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS') or ""))
>      rcpinfo.packages = packages
>      rcpinfo.layer = layer
> +    export_recipe_variables = d.getVar('BUILDHISTORY_EXPORT_RECIPE_VARIABLES') or ''
> +    rcpinfo.export_recipe_variables = export_recipe_variables
>      write_recipehistory(rcpinfo, d)
>
>      pkgdest = d.getVar('PKGDEST')
> @@ -312,6 +314,9 @@ python buildhistory_emit_pkghistory() {
>
>          pkginfo.size = int(pkgdata['PKGSIZE'])
>
> +        export_package_variables = d.getVar('BUILDHISTORY_EXPORT_PACKAGE_VARIABLES') or ''
> +        pkginfo.export_package_variables = export_package_variables
> +
>          write_pkghistory(pkginfo, d)
>
>      # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
> @@ -360,14 +365,20 @@ def write_recipehistory(rcpinfo, d):
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
> +        for var in export_recipe_variables:
> +            if var == "PE":
> +                if rcpinfo.pe != "0":
> +                    ret.append("%s = %s" % (var, rcpinfo.pe))
> +            elif var == "LAYER":
> +                ret.append("%s = %s" % (var, rcpinfo.layer))
> +            else:
> +                ret.append("%s = %s" % (var," ".join((str(d.getVar(var)).split()))))
> +        ret.sort()
> +        for element in ret:
> +            f.write(element + "\n")
>
>      write_latest_srcrev(d, pkghistdir)
>
> @@ -381,32 +392,55 @@ def write_pkghistory(pkginfo, d):
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
> 
>
