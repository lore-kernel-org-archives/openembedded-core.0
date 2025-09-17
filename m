Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17C3CA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 12:15:02 +0000 (UTC)
Subject: Re: [PATCH 4/8] debug_build.inc: collect debug build tuning configuration
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (128.224.246.2)
X-Originating-Platform: Linux Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 05:15:00 -0700
References: <DCV1DEVKB7V0.2YZ96FPV5N3X6@bootlin.com>
In-Reply-To: <DCV1DEVKB7V0.2YZ96FPV5N3X6@bootlin.com>
Message-ID: <27586.1758111300460254901@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ypU6vtXHyUJARDQlTYwV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 12:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223599

--ypU6vtXHyUJARDQlTYwV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 04:24 AM, Mathieu Dubois-Briand wrote:

>=20
> Just a note about this patches: I had perf reproducibility issues [1][2]
> after taking this series and I believe this is linked with this patch. I
> suspect this is not directly related with it, but more with the issue we
> have had with perf reproducibility last week.
>=20
> So I dropped this patch for now, but I will take it a bit later this
> week and try to go further. I still wanted to provide some feedback
> here.

Got it, I will have a look

//Hongxu

>=20
> Also, if anyone believes this issue IS related with this series,
> please share your thoughts.
>=20
> [1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/25=
05
>=20
> [2] http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250916-0ss7=
2vce/
>=20
>=20
> Thanks,
> Mathieu

--ypU6vtXHyUJARDQlTYwV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Sep 17, 2025 at 04:24 AM, Mathieu Dubois-Briand wrote:</div>
<div>
<blockquote>Just a note about this patches: I had perf reproducibility issu=
es [1][2]<br />after taking this series and I believe this is linked with t=
his patch. I<br />suspect this is not directly related with it, but more wi=
th the issue we<br />have had with perf reproducibility last week.<br /><br=
 />So I dropped this patch for now, but I will take it a bit later this<br =
/>week and try to go further. I still wanted to provide some feedback<br />=
here.</blockquote>
Got it, I will have a look</div>
<div>&nbsp;</div>
<div>//Hongxu<br />
<blockquote>Also, if anyone believes this issue IS related with this series=
,<br />please share your thoughts.<br /><br />[1] <a href=3D"https://autobu=
ilder.yoctoproject.org/valkyrie/#/builders/37/builds/2505" target=3D"_blank=
" rel=3D"noopener">https://autobuilder.yoctoproject.org/valkyrie/#/builders=
/37/builds/2505</a><br />[2] <a href=3D"http://valkyrie.yocto.io/pub/repro-=
fail/oe-reproducible-20250916-0ss72vce/" target=3D"_blank" rel=3D"noopener"=
>http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250916-0ss72vce/=
</a><br /><br />Thanks,<br />Mathieu</blockquote>
</div>

--ypU6vtXHyUJARDQlTYwV--

