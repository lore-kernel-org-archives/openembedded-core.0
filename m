Return-Path: <vs.yocto@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E8BC28B28
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 16:11:35 +0000 (UTC)
Subject: Re: Issue: /var/tmp does not persist due to /var/volatile being tmpfs in fstab #scarthgap
To: openembedded-core@lists.openembedded.org
From: "Vish" <vs.yocto@outlook.com>
X-Originating-Location: San Jose, California, US (68.251.63.137)
X-Originating-Platform: Linux Chrome 130
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 18 Mar 2025 09:11:32 -0700
References: <PH0PR11MB561183431E26C593148B543AEDDE2@PH0PR11MB5611.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB561183431E26C593148B543AEDDE2@PH0PR11MB5611.namprd11.prod.outlook.com>
Message-ID: <2962.1742314292470649522@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="c6qxnokIEBY5E8S5nYOn"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 16:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213220

--c6qxnokIEBY5E8S5nYOn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the reply.

In Scarthgap LTS implementation is different, but I got the idea.
https://git.yoctoproject.org/poky/tree/meta/conf/bitbake.conf?h=3Dscarthgap=
#n387

I believe default behavior should be same as before to persist /var/temp ov=
er reboot and these changes should only be required for any customization. =
Also somewhat difficult for us to upgrade CI/CD with this config.

Can we know the reasons for original changes here?
https://git.yoctoproject.org/poky/commit/meta/recipes-core/systemd/systemd/=
00-create-volatile.conf?h=3Dscarthgap&id=3D3cc8c3520cedb66500757f843f757646=
da69ab30

I reviewed commit message but not giving much details. Considering default =
base-files and as persistence is required, this newer approach seems be an =
issue.

We recently migrated to Scarthgap and noticed the issues with our system. T=
his can be issue for other developers as well whoever is planning to migrat=
e to Scarthgap and embedded devices in the field. This commit requires all =
build systems to adopt changes bitbake.conf which is not preferable .

What is the usecases targeted with the changes? I believe the commit should=
 be reviewed again and potentially reverted considering default behavior wi=
th base-files and 00-create-volatile.conf.

Regards,
VS.

--c6qxnokIEBY5E8S5nYOn
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Thank you for the reply.&nbsp;</div>
<div>&nbsp;</div>
<div>In Scarthgap LTS implementation is different, but I got the idea.&nbsp=
;</div>
<div><a href=3D"https://git.yoctoproject.org/poky/tree/meta/conf/bitbake.co=
nf?h=3Dscarthgap#n387" target=3D"_blank" rel=3D"noopener">https://git.yocto=
project.org/poky/tree/meta/conf/bitbake.conf?h=3Dscarthgap#n387</a></div>
<div>&nbsp;</div>
<div>I believe default behavior should be same as before to persist /var/te=
mp over reboot and these changes should only be required for any customizat=
ion. Also somewhat difficult for us to upgrade CI/CD with this config.&nbsp=
;</div>
<div>&nbsp;</div>
<div>Can we know the reasons for original changes here?</div>
<div><a href=3D"https://git.yoctoproject.org/poky/commit/meta/recipes-core/=
systemd/systemd/00-create-volatile.conf?h=3Dscarthgap&amp;id=3D3cc8c3520ced=
b66500757f843f757646da69ab30" target=3D"_blank" rel=3D"noopener">https://gi=
t.yoctoproject.org/poky/commit/meta/recipes-core/systemd/systemd/00-create-=
volatile.conf?h=3Dscarthgap&amp;id=3D3cc8c3520cedb66500757f843f757646da69ab=
30</a></div>
<div>&nbsp;</div>
<div>I reviewed commit message but not giving much details. Considering def=
ault base-files and as persistence is required, this newer approach seems b=
e an issue.&nbsp;</div>
<div>&nbsp;</div>
<div>We recently migrated to Scarthgap and noticed the issues with our syst=
em. This can be issue for other developers as well whoever is planning to m=
igrate to Scarthgap and embedded devices in the field. This commit requires=
 all build systems to adopt changes bitbake.conf which is not preferable .&=
nbsp;&nbsp;</div>
<div>&nbsp;</div>
<div>What is the usecases targeted with the changes? I believe the commit s=
hould be reviewed again and potentially reverted considering default behavi=
or with base-files and 00-create-volatile.conf.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Regards,</div>
<div>VS.</div>

--c6qxnokIEBY5E8S5nYOn--

