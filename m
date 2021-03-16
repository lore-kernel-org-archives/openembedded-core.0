Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.57.1615916677501857659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 10:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DBB9D40C1C;
	Tue, 16 Mar 2021 17:44:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pxs9aWxtIju4; Tue, 16 Mar 2021 17:44:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AC71840A47;
	Tue, 16 Mar 2021 17:44:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 754AB174544; Tue, 16 Mar 2021 13:44:33 -0400 (EDT)
Date: Tue, 16 Mar 2021 13:44:33 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Anatol Belski <anbelski@linux.microsoft.com>
Cc: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>,
	Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
Message-ID: <20210316174433.GF18041@denix.org>
References: <20210311152128.41215-1-khairul.rohaizzat.jamaluddin@intel.com>
 <CAMKF1spX6z9vvv7QNbWhkapX-Z1=FWZVh0W2+OM2qSbxPqQgkQ@mail.gmail.com>
 <DM5PR11MB1322590C6E8F9272ECC912CFDE6F9@DM5PR11MB1322.namprd11.prod.outlook.com>
 <MWHPR11MB1326447A6A6AA12D09952A56DE6F9@MWHPR11MB1326.namprd11.prod.outlook.com>
 <f2d269853c88992f528419d5d20139a42728cada.camel@linux.microsoft.com>
 <20210315213606.GP4892@denix.org>
 <dd23f3e8-0db6-3f8b-466a-e9c9207c6604@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <dd23f3e8-0db6-3f8b-466a-e9c9207c6604@linux.microsoft.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 16, 2021 at 01:56:43PM +0100, Anatol Belski wrote:
> Hi,
> 
> On 3/15/2021 10:36 PM, Denys Dmytriyenko wrote:
> >https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable.2FLTS_Patch_Acceptance_Policies
> >
> >Stable/LTS Patch Acceptance Policies
> >
> >Potentially Acceptable:
> >* Bug fix only version upgrades for upstreams with a good stable process
> >
> >Unacceptable:
> >* General version upgrades
> >
> >
> >So, unless there's a bugfix-only minor release of glibc, e.g. 2.31.1,
> >upgrading to 2.32 or 2.33 in stable branches is highly unlikely, as both
> >2.32 and 2.33 have long lists of major changes:
> >
> >https://sourceware.org/pipermail/libc-announce/2020/000029.html
> >https://sourceware.org/pipermail/libc-announce/2021/000030.html
> 
> thanks for linking the LTS doc.
> 
> My suggestion was to pull the latest upstream from 2.31 actually,
> not upgrading the glibc version. As per
> 
> http://git.yoctoproject.org/clean/cgit.cgi/poky/tree/meta/recipes-core/glibc/glibc-version.inc?h=dunfell
> 
> we consume from the branch release/2.31/master. It already contains
> the backported patch fixing this CVE.
> 
> There doesn't seem to be a release process in terms of versions, but
> it regularly receives backports. In fact,
> 
> there are already some bug and CVE fixes between the current SRCREV
> used and HEAD.

Thanks for clarifying. In this case HEAD of release/2.31/master might make 
sense.

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
