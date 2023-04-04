Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FCCC76188
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 22:26:34 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.116383.1680647186954113263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 15:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SOJPPGYw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id he13so244025wmb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 15:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680647185;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbJd+9AB6j+SBeHkPuRFB+4EqWPluRNA2wy0p/aZrDw=;
        b=SOJPPGYwUS1XLpy9/4VcZOwcD5JFtiVgzvw5sjBHRH4OVBzBl/3hZPjf4vMYLxsTFx
         XwzvgrIklwnqgOQZu6odHyitl2SRSxIXP29Lp1LUKHj8F+PBXLo8v8qX97HwqqA6Pj/t
         6/BoCAjBeDNCrNSb5ijBSCEz0HWVJ3tV+FUqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680647185;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TbJd+9AB6j+SBeHkPuRFB+4EqWPluRNA2wy0p/aZrDw=;
        b=39O45B+UMCSwulEmsaQkww2WsobQBJMYLhmoWp/lHmRJfcXnIrUCCewCeayrNbBF/j
         9QfnSCOrPRbLDHFxOUCImYwg758oWoeXcasxoLHLPbzIhva7UvwBYlmQJsG9j9uOYRW6
         ZAK26SnUKDCZ/KPhcJfp1JiQC/RWbZdmC98ZnrSGZnNK8N7ZBlKr9SQ7pfMbwm2aM2GZ
         otDl9birVpg8M963shsP0Z+TLBNSsySVzTLcz+d+MTz75IH4BlGJcP7V9eC9pk5aLMSh
         1JeorSUkT5wjcGYJAkIUY7VCAyShgkJT7XS0krSExaUOQHd8bEhM3KBgHow9ObtJIZL5
         dm4w==
X-Gm-Message-State: AAQBX9dprW7FLKhNQN5L1tunTaN7RnFIiIEt/Bzn9WnVdcBKfP4jRIsM
	Y2LswvTugFxhNfi39MApCcY+ig==
X-Google-Smtp-Source: AKy350bpIfMcnA6HRHVAElDc6syrF9BL4YXCy6wNowJJcJc1TCZQoExya4YOs+mxHoxXwEyVh6aEEA==
X-Received: by 2002:a05:600c:c8:b0:3ed:5d41:f998 with SMTP id u8-20020a05600c00c800b003ed5d41f998mr455973wmm.15.1680647185253;
        Tue, 04 Apr 2023 15:26:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5bf:59d3:395c:4325? ([2001:8b0:aba:5f3c:f5bf:59d3:395c:4325])
        by smtp.gmail.com with ESMTPSA id k14-20020a05600c0b4e00b003ef71d541cbsm247627wmr.1.2023.04.04.15.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 15:26:24 -0700 (PDT)
Message-ID: <eaa125c5ba2c1a13837c65df4a961abab5f5373b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: Exclude some issues
 not present in linux-yocto
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 04 Apr 2023 23:26:18 +0100
In-Reply-To: <9cb0aae1-c1be-ab0d-2263-1ab2f928c885@smile.fr>
References: <20230404164400.403462-1-richard.purdie@linuxfoundation.org>
	 <9cb0aae1-c1be-ab0d-2263-1ab2f928c885@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 22:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179711

On Tue, 2023-04-04 at 21:48 +0200, Yoann Congal wrote:
> Hi,
>=20
> On 4/4/23 18:44, Richard Purdie wrote:
> > Exclude some CVEs where the patches were backported to the stable serie=
s
> > kernels we have.>=20
> > https://www.linuxkernelcves.com/cves/CVE-XXXX-XXXX is useful to help
> > with this.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  .../distro/include/cve-extra-exclusions.inc   | 40 +++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >=20
> > diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/c=
onf/distro/include/cve-extra-exclusions.inc
> > index a281a8ac65c..680f613c9f9 100644
> > --- a/meta/conf/distro/include/cve-extra-exclusions.inc
> > +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> > @@ -381,6 +381,46 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-0266"
> >  # Backported in version v6.1.7 0afa5f0736584411771299074bbeca8c1f9706d=
4
> >  CVE_CHECK_IGNORE +=3D "CVE-2023-0394"
> > =20
> > +# https://nvd.nist.gov/vuln/detail/CVE-2023-0461
> > +# Introduced in version 4.13 734942cc4ea6478eed125af258da1bdbb4afe578
> > +# Patched in kernel v6.2 2c02d41d71f90a5168391b6a5f2954112ba2307c
> > +# Backported in version v6.1.5 7d242f4a0c8319821548c7176c09a6e0e71f223=
c
> > +# Backported in version v5.15.88 dadd0dcaa67d27f550131de95c8e182643d2c=
9d6
> > +CVE_CHECK_IGNORE +=3D "CVE-2023-0461"
> > +
> > +# https://nvd.nist.gov/vuln/detail/CVE-2023-0386
> > +# Introduced in 5.11 459c7c565ac36ba09ffbf24231147f408fde4203
> > +# Patched in kernel v6.2 4f11ada10d0ad3fd53e2bd67806351de63a4f9c3
> > +# Backported in version 6.1.9 42fea1c35254c49cce07c600d026cbc00c6d3c81
> > +# Backported in version 5.15.91 e91308e63710574c4b6a0cadda3e042a369966=
6e
> > +CVE_CHECK_IGNORE +=3D "CVE-2023-0386"
> > +
> > +# https://nvd.nist.gov/vuln/detail/CVE-2023-1073
> > +# Introduced in 1b15d2e5b8077670b1e6a33250a0d9577efff4a5
>=20
> The earliest version containing this commit is v3.16
>=20
> > +# Patched in kernel v6.2 b12fece4c64857e5fab4290bf01b2e0317a88456
> > +# Backported in version 5.10.166
>=20
> You are missing the SHA1 here : It is 5dc3469a1170dd1344d262a332b26994214=
eeb58
>=20
> > +# Backported in version 5.15.91 2b49568254365c9c247beb0eabbaa15d0e279d=
64
> > +# Backported in version 6.1.9 cdcdc0531a51659527fea4b4d064af343452062d
> > +CVE_CHECK_IGNORE +=3D "CVE-2023-1073"
> > +
> > +# https://nvd.nist.gov/vuln/detail/CVE-2023-1074
> > +# Patched in kernel v6.2 458e279f861d3f61796894cd158b780765a1569f
> > +# Backported in version 5.15.91 3391bd42351be0beb14f438c7556912b9f96cb=
32
> > +# Backported in version 6.1.9 9f08bb650078dca24a13fea1c375358ed6292df3
> > +CVE_CHECK_IGNORE +=3D "CVE-2023-1074"
> > +
> > +# https://nvd.nist.gov/vuln/detail/CVE-2023-1077
> > +# Patched in kernel 6.3rc1 7c4a5b89a0b5a57a64b601775b296abf77a9fe97
> > +# Backported in version 5.15.99 2c36c390a74981d03f04f01fe7ee9c3ac3ea11=
f7
> > +# Backported in version 6.1.16 6b4fcc4e8a3016e85766c161daf0732fca16c3a=
3
> > +CVE_CHECK_IGNORE +=3D "CVE-2023-1077"
> > +
> > +# https://nvd.nist.gov/vuln/detail/CVE-2023-1078
> > +# Patched in kernel 6.2 f753a68980cf4b59a80fe677619da2b1804f526d
> > +# Backported in version 5.15.94 528e3f3a4b53df36dafd10cdf6b8c0fe2aa1c4=
ba
> > +# Backported in version 6.1.12 1d52bbfd469af69fbcae88c67f160ce1b968e7f=
3
> > +CVE_CHECK_IGNORE +=3D "CVE-2023-1078"
> > +
> >  # Wrong CPE in NVD database
> >  # https://nvd.nist.gov/vuln/detail/CVE-2022-3563
> >  # https://nvd.nist.gov/vuln/detail/CVE-2022-3637
>=20
> Apart from these two comments:
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

Thanks, I tweaked those bits. I did a bit more research and the other
easier looking linux-yocto ones to mark up are listed below along with
the versions known to contain fixes. I'd still need to map out the
revisions and so on for these but several look like they can be
resolved for our versions if this data is correct.

That left 13 linux-yocto CVEs that would need more work to track down
and 5 non linux-yocto ones.

CVE-2022-2196: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2196 *
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3D2e7eab81425ad6c875f2ed47c0ce01e78afc38a5
5.10.170
5.15.96
6.1.14

CVE-2022-3424: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3424 *
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3D643a16a0eb1d6ac23744bb6e90a00fc21148a9dc
5.10.163
5.15.86
6.1.2

CVE-2022-3523: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3523 *
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3D16ce101db85db694a91380aa4c89b25530871d33

CVE-2022-3566: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3566 *
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3Df49cd2f4d6170d27a2c61f1fecb03d8a70c91f57

CVE-2022-3567: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3567 *
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3D364f997b5cfe1db0d63a390fe7c801fa2b3115f6

CVE-2022-38457: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38457 *
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3Da309c7194e8a2f8bd4539b9449917913f6c2cd50
6.1.7

CVE-2022-40133: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-40133 *
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3Da309c7194e8a2f8bd4539b9449917913f6c2cd50

CVE-2023-0179: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-0179 *
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3D696e1a48b1a1b01edad542a1ef293665864a4dd0
5.10.164
5.15.89
6.1.7

CVE-2023-1079: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1079 *
Fixed in
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3D4ab3a086d10eeec1424f2e8a968827a6336203df
5.10.173
5.15.99
6.1.16

CVE-2023-1118: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1118 *
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3D29b0589a865b6f66d141d79b2dd1373e4e50fe17
5.10.173
5.15.99
6.1.16

CVE-2023-1281: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1281 *
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3Dee059170b1f7e94e55fa6cadee544e176a6e59c2
5.10.169
5.15.95
6.1.13

CVE-2023-1513: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1513 *
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3D2c10b61421a28e95a46ab489fd56c0f442ff6952
5.10.169
5.15.95
6.1.13

CVE-2023-23005: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-23005 *
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3D4a625ceee8a0ab0273534cb6b432ce6b331db5ee
Disputed?

CVE-2023-28466: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-28466 *
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3D49c47cc21b5b7a3d8deb18fc57b0aa2ab1286962
5.15.105
6.1.20

CVE-2023-28866: linux-yocto
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-28866 *
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3Dbce56405201111807cc8e4f47c6de3e10b17c1ac
6.1.22

Cheers,

Richard

