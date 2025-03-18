Return-Path: <vs.yocto@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C696C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 23:24:17 +0000 (UTC)
Subject: Re: Issue: /var/tmp does not persist due to /var/volatile being tmpfs in fstab #scarthgap
To: openembedded-core@lists.openembedded.org
From: "Vish" <vs.yocto@outlook.com>
X-Originating-Location: San Ramon, California, US (107.141.38.29)
X-Originating-Platform: Linux Chrome 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 18 Mar 2025 16:24:07 -0700
References: <83c9c92162d9c0bc1387c633f1464e67f57c70bc.camel@linuxfoundation.org>
In-Reply-To: <83c9c92162d9c0bc1387c633f1464e67f57c70bc.camel@linuxfoundation.org>
Message-ID: <29973.1742340247475380282@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="wD6A70Jc9T0g2ucrNkwq"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 23:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213259

--wD6A70Jc9T0g2ucrNkwq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the reply.

Do maintainers recognize this as an issue with having this as default optio=
n? There are chances that similar to us other devs/orgs are planning migrat=
ion in phases to Scarthgap considering Kirkstone getting updates, so this c=
ould potentially become issue for others as well. We do have sizable amount=
 of edge systems in production with various CI, and this change broke an im=
portant feature and took some time for us to find root cause.

I believe correcting is still a proper thing to do and can be planned durin=
g any releases.
Additional reference -
https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s15.html ( https://ref=
specs.linuxfoundation.org/FHS_3.0/fhs/ch05s15.html )

Also, it would be good to know what scenarios were considered with this cha=
nge, probably we are missing some context.

Regards,
VS.

--wD6A70Jc9T0g2ucrNkwq
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Thanks for the reply.&nbsp;</div>
<div>&nbsp;</div>
<div>Do maintainers recognize this as an issue with having this as default =
option? There are chances that similar to us other devs/orgs are planning m=
igration in phases to Scarthgap considering Kirkstone getting updates, so t=
his could potentially become issue for others as well. We do have sizable a=
mount of edge systems in production with various CI, and this change broke =
an important feature and took some time for us to find root cause.</div>
<div>&nbsp;</div>
<div>
<div>I believe correcting is still a proper thing to do and can be planned =
during any releases.</div>
<div>
<div>
<div><span style=3D"background-color: var(--light-mode-body-color);">Additi=
onal reference -</span></div>
</div>
<div>
<div><a href=3D"https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s15.ht=
ml" target=3D"_blank" rel=3D"noopener">https://refspecs.linuxfoundation.org=
/FHS_3.0/fhs/ch05s15.html&nbsp;</a></div>
</div>
</div>
<div>&nbsp;</div>
<div>Also, it would be good to know what scenarios were considered with thi=
s change, probably we are missing some context.</div>
</div>
<div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Regards,</div>
<div>VS.</div>
</div>

--wD6A70Jc9T0g2ucrNkwq--

