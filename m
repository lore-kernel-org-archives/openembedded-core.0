Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64538C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 08:04:17 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.17759.1665561852563869969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 01:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pRO9Rlzs;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id b2so24618570lfp.6
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 01:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ag+7IW2UNwH2ekQZ/jLhrfgyLwWmlhli99xHkwRlCMY=;
        b=pRO9Rlzs7ZJs2xUwNRvyJvj67EVYvvfFABYPbwwMzgBaQKhVnmcFn+X7T+lBYyYoRF
         vgUF3fCCQR3P0AGH38/1kGzieMG+I96+HcBbFc0n9aKItYuhxjlv/csJdLdiZ3ZZ83GO
         CZ89RfrzHHIy2GxmB9phVTURLkO+48xCagsQrFxIrhoOTtDLUfIfyXpMV9U84zbEYRHa
         9/VmOvEXqsnLnBYLVoCTqNgHt/62rYNzSkAWVNfVJrPiJMQ683dGfsp96cA4ZyM1kjUB
         DwToyWNyaCXE9cGqs08FBasy/MhpxzrpQIqstECcUUyp1TVV83rElgqLJKe1grYaxdkr
         kmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ag+7IW2UNwH2ekQZ/jLhrfgyLwWmlhli99xHkwRlCMY=;
        b=rLAbr3pr920BE4WaDyu+GQvHI+hizZFLfztfWtRpK8Vyw/797tC4jX2v9L8yBRtNKB
         Ss/07D4AuXpVmaN/8QiGeLx/2cnIHptlya3IvgEkGxEfLKAqOc1WJmf6+xA71m4m0DqI
         1om45e9WJxl4fjoIliqQOvLuT/gkZmFY4ln2KOIKqV/KjlXm+JTrQgjvHQXPwmMJvJhy
         jckjgQbZrNpnmvvIXKyMEiTSzx3I02kRUYXhrvIIijjyWPzi3/7fSHfTXoIBeAbzJQU/
         AR51rl7KWrmWJtqOGSVux47dvb6ljiK+vWel5Kfu9lb6dcsmZXJThy56MbS+H32IBTnw
         RkbQ==
X-Gm-Message-State: ACrzQf1iaRX1UMEDwLcm47MCpB6RNKYjkH9CXz+aEkr3OavwrYAlhtZ9
	MNNFsIr7BqkO7LUfF9BBDxQN3g==
X-Google-Smtp-Source: AMsMyM6YV3v+MjTdQawEnzVkyBSCnTRVhIbxDhvtEB/dqHkcWlrM7mJlg/m8SR6jTPqQLgVK31HBxg==
X-Received: by 2002:a05:6512:3d9f:b0:4a2:4986:281 with SMTP id k31-20020a0565123d9f00b004a249860281mr9469161lfv.123.1665561850454;
        Wed, 12 Oct 2022 01:04:10 -0700 (PDT)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id du10-20020a056512298a00b004a044928923sm2181832lfb.293.2022.10.12.01.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 01:04:09 -0700 (PDT)
Date: Wed, 12 Oct 2022 11:04:07 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alberto Pianon <alberto@pianon.eu>,
	OE-core <openembedded-core@lists.openembedded.org>,
	marta.rybczynska@linaro.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Carlo Piana <carlo@piana.eu>
Subject: Re: [OE-core] severe issue in CVE checker
Message-ID: <Y0Z090vGsHtnQA+M@nuoska>
References: <233c014c169e00e6a9ce464f3ab2bf79@pianon.eu>
 <CANNYZj_MhYekau2ufotcMe8atj79F+NkYPg0FhasMdu1TvVBqA@mail.gmail.com>
 <CAApg2=RcCWR2e0iRGzoW2ADhS3wA0ptTHy9otenv2rSndgZLKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAApg2=RcCWR2e0iRGzoW2ADhS3wA0ptTHy9otenv2rSndgZLKQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 08:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171659

Hi,

Can the downloads be turned into normal do_fetch() SRC_URI downloads including
caches in yocto infrastructure?

There are many issues around CVE checking that it's really
a process where a lot of details and uncertainties just need to be
accepted. It's far from a perfect and users just need to accept this.

Cheers,

-Mikko

On Wed, Oct 12, 2022 at 04:54:57PM +0900, Marta Rybczynska wrote:
> I'll be looking into how to fix it. My current idea is to make the download
> a transaction, so do not update the database until we're sure the download
> is complete. Plus a warning that we have had an issue, I think.
> 
> In a next step we can retry a number of times.
> 
> Regards
> Marta
> 
> On Wed, 12 Oct 2022, 16:50 Alexander Kanavin, <alex.kanavin@gmail.com>
> wrote:
> 
> > Thanks for the information, can you send a patch?
> >
> > Alex
> >
> > On Wed, 12 Oct 2022 at 09:25, Alberto Pianon <alberto@pianon.eu> wrote:
> > >
> > > All, Marta, Richard,
> > >
> > > while implementing stats aggregation for CVE metadata in the Oniro
> > > project, I encountered a severe issue in Yocto's CVE checker, apparently
> > > due to this:
> > >
> > https://git.yoctoproject.org/poky/tree/meta/recipes-core/meta/cve-update-db-native.bb#n81
> > >
> > > It appears that when cve-update-db-native fails to fetch some years of
> > > NIST CVE db, it just issues a warning but goes on anyway.
> > >
> > > The result is that in some builds, randomly (depending on NIST webserver
> > > timeouts or other connection problems), CVE db is not complete, so the
> > > CVE check returns false negatives (i.e. no vulnerabilities found in some
> > > components even if such vulnerabilities do exist)
> > >
> > > I ran into such problem because in Oniro we need aggregate data from
> > > different builds for a large target matrix; I added a check to check
> > > that CVE metadata for each component are the same in all builds, and it
> > > failed, so I tried to figure out the cause and I found this:
> > >
> > > - in a build where cve-check found a vulnerability for acl:
> > >      $ sqlite3 build-linux-clang-qemuarm-efi/tmp/CVE_CHECK/nvdcve_1.1.db
> > >      sqlite> SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS "acl";
> > >      CVE-2009-4411
> > >      sqlite>
> > >
> > > - in another build where cve-check did not found any vulnerability for
> > > the very same version of acl:
> > >      $ sqlite3 build-linux-clang-qemux86/tmp/CVE_CHECK/nvdcve_1.1.db
> > >      sqlite> SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS "acl";
> > >      sqlite>
> > >
> > > so I listed both CVE db files in those two builds and this is what I
> > > got:
> > >
> > >      $ ls -ll build-linux-clang-qemuarm-efi/tmp/CVE_CHECK/nvdcve_1.1.db
> > > build-linux-clang-qemux86/tmp/CVE_CHECK/nvdcve_1.1.db
> > >      -rw-r--r-- 1 ubuntu ubuntu 215093248 Oct 11 10:56
> > > build-linux-clang-qemuarm-efi/tmp/CVE_CHECK/nvdcve_1.1.db
> > >      -rw-r--r-- 1 ubuntu ubuntu     28672 Oct 11 10:00
> > > build-linux-clang-qemux86/tmp/CVE_CHECK/nvdcve_1.1.db
> > >
> > > The two CVE db files were fetched just about 1h apart, but the second
> > > file is apparently incomplete.
> > >
> > > I checked the log for the second build, and I found this:
> > >
> > >      WARNING: cve-update-db-native-1.0-r0 do_fetch: Failed to fetch CVE
> > > data ([Errno 99] Cannot assign requested address)
> > >      NOTE: recipe cve-update-db-native-1.0-r0: task do_fetch: Succeeded
> > >
> > > Fetch fails, but do_fetch task succeeds.
> > >
> > > So I looked into the recipe's code, and I found this:
> > >
> > https://git.yoctoproject.org/poky/tree/meta/recipes-core/meta/cve-update-db-native.bb#n81
> > >
> > > It iterates over NIST CVE db years, but if some year fail to download,
> > > it goes on anyway, and it still merges the successful downloads into
> > > nvdcve_1.1.db, without returning error.
> > >
> > > IMHO this is a severe issue because it may silently lead to false
> > > negatives in the CVE check. If some downloads fail due to timeouts or
> > > other connection problems, cve-check should retry a number of times, and
> > > if any download still fails, cve-update-db-native do_fecth should fail,
> > > and it turn all do_cve_check tasks should fail, since doing a CVE check
> > > against a corrupted/incomplete CVE database is clearly useless
> > >
> > > Regards,
> > >
> > > Alberto
> > >
> > >
> > >
> >
> > 
> >
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171658): https://lists.openembedded.org/g/openembedded-core/message/171658
> Mute This Topic: https://lists.openembedded.org/mt/94276393/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


