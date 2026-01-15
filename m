Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A36D44C7F
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 16:41:24 +0000 (UTC)
Subject: Re: [PATCH v4 6/6] wic: extra-partitions: extend to support extra directories
To: openembedded-core@lists.openembedded.org
From: "Pierre-loup GOSSE" <pierre-loup.gosse@smile.fr>
X-Originating-Location: =?UTF-8?B?QXJnZW50ZXVpbCwgw45sZS1kZS1GcmFuY2UsIEZS?= (82.125.129.214)
X-Originating-Platform: Linux Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 15 Jan 2026 08:41:16 -0800
References: <20260115101432.162696-1-adam.duskett@amarulasolutions.com> <20260115101432.162696-6-adam.duskett@amarulasolutions.com> <CAHT-cZvh=aH5gyDbR0eE3ZQn3FJ=i=SQQtHhU+swZeXnLnUyBA@mail.gmail.com>
In-Reply-To: <CAHT-cZvh=aH5gyDbR0eE3ZQn3FJ=i=SQQtHhU+swZeXnLnUyBA@mail.gmail.com>
Message-ID: <62316.1768495276423528313@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="luaqjJpOCjzhVPIpUVq5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 16:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229424

--luaqjJpOCjzhVPIpUVq5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I missed one point,

Using logger.info in the _parse_extra functions would be more suitable when=
 the variable is unset.
Since a WicError is raised if both variables are unset, displaying a warnin=
g when only one of the two variables is set could be unnecessary and annoyi=
ng.

Thanks,

Pierre-Loup

--luaqjJpOCjzhVPIpUVq5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I missed one point,</div>
<div>&nbsp;</div>
<div>Using <span style=3D"font-family: 'courier new', courier;">logger.info=
</span>&nbsp;in the <span style=3D"font-family: 'courier new', courier;">_p=
arse_extra</span> functions would be more suitable when the variable is uns=
et.</div>
<div>Since a WicError is raised if both variables are unset, displaying a w=
arning when only one of the two variables is set could be unnecessary and a=
nnoying.</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>&nbsp;</div>
<div>Pierre-Loup</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>

--luaqjJpOCjzhVPIpUVq5--

