Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D26CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 18:06:43 +0000 (UTC)
Subject: Re: [PATCH v4 1/1] fitimage: Add support for custom compatible string via optional parameter
To: openembedded-core@lists.openembedded.org
From: "Kavinaya S" <kavinaya@qti.qualcomm.com>
X-Originating-Location: Mumbai, Maharashtra, IN (163.116.213.159)
X-Originating-Platform: Windows Chrome 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 08 Oct 2025 11:06:42 -0700
References: <gahunfldkpx3p453csdcoxnosrvbcnnzoeamsmxvzxxesvyls4@v4eicwchoz3p>
In-Reply-To: <gahunfldkpx3p453csdcoxnosrvbcnnzoeamsmxvzxxesvyls4@v4eicwchoz3p>
Message-ID: <10142.1759946802485185141@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 18:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224589

On Mon, Oct  6, 2025 at 04:04 AM, Dmitry Baryshkov wrote:

>
> Also no need for .dtb here. What about:
>=20
> FIT_DTB_COMPATIBLE_OVERRIDE[qcs6490-rb3gen2-vision-mezzanine]
>=20
> >=20
> > diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
> > index f303799155..54baba28bc 100644
> > --- a/meta/lib/oe/fitimage.py
> > +++ b/meta/lib/oe/fitimage.py
> > @@ -289,7 +289,7 @@ class ItsNodeRootKernel(ItsNode):
> > self._kernel =3D kernel_node
> >=20
> > def fitimage_emit_section_dtb(self, dtb_id, dtb_path,
> > dtb_loadaddress=3DNone,
> > - dtbo_loadaddress=3DNone, add_compatible=3DFalse):
> > + dtbo_loadaddress=3DNone, add_compatible=3DFalse, custom_compatible=3D=
None):
>=20
> Also too long
>
I'll refine the code as suggested in next patch. I will also update the tes=
t cases as required.

