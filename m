Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832F8E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 07:53:09 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
 by mx.groups.io with SMTP id smtpd.web10.9458.1735285981908744504
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Dec 2024 23:53:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=marcel@ziswiler.com header.s=s1-ionos header.b=oCaGSFmi;
 spf=pass (domain: ziswiler.com, ip: 74.208.4.197, mailfrom: marcel@ziswiler.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1735285979; x=1735890779; i=marcel@ziswiler.com;
	bh=GkFZKCJCDU+rAe4GpmMcJD/vSTDmmZC2B04b82V7XI4=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oCaGSFmidxs2xlblEtyXo/GiLeohgiTqUukTlvkf1MFKFaa5BnVguyDvB+ylrvMm
	 S0Et0gIb73e0QG2F15jsZLw9ovDBmXGBsEBjMiBdmhmam/eu+Iwrha0MauJhBtazE
	 9sBmBUlceVpJKU83d9QW1omibDA1lLqS1o+XnYxkS2dUd8NqFO+aH+RjTqE9CmOdh
	 LtlqR3ZVER6bQ+DLg4N+ivXxkhHGaWpAxbX9bqGSiKn4jRXxjajk8A8EBbMO+z/1R
	 8UzIrYXDfK7wGsLmSwee1rftfeNUG/fw3rjioeCIdzmT1rMGl3kpk6dzXEzb/f7aO
	 a63oGoUP4AEa+G6KLQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [10.10.1.204] ([194.230.241.203]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1MEmlb-1tKDfE1MOR-00BxU1;
 Fri, 27 Dec 2024 08:52:59 +0100
Message-ID: <b88747d19c66608c330add7285002d52606c0606.camel@ziswiler.com>
Subject: Re: [OE-core] [PATCH v2] gettext: upgrade 0.22.5 -> 0.23
From: Marcel Ziswiler <marcel@ziswiler.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Dec 2024 08:52:55 +0100
In-Reply-To: <D6LLEUFB3992.32ILPEG9SHGJ@bootlin.com>
References: <20241225103244.3514559-1-marcel@ziswiler.com>
	 <D6LJ8P97UJIR.2ZV3G9G2APPTE@bootlin.com>
	 <c17236c58b3d7f041746b0ede69c271d1c7f8eed.camel@ziswiler.com>
	 <D6LLEUFB3992.32ILPEG9SHGJ@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (by Flathub.org) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:xdc/coeGE8B/JQuVMkXzDgSTqJl/S0HjAIMhy7e4+oBikscbmuQ
 GywQALKB9EoOG06HnzGcD8iF5OJTOTp8y9G3YRndylQ+C96hxQftQpMAKUks1HPXyHeF1vT
 73cAj65iH5fbB674v90bqGlw+JtCh+OOCs5wjZYGR4TiZrxlP0OqZJrUApvn7YUqXpKeaKD
 VX4bYFF88S7ZR/MR3AHKA==
UI-OutboundReport: notjunk:1;M01:P0:PmTWSnK7wqI=;2sVHHwyaMQ5cY9bkL3NouBRtaBn
 yYGSFyhtGJS26pUNXMbbXHAD/dvIykB67z1IY+DDz92zUcx9lpoDU0NOH00yN3+JlPgNdFF5Z
 7THVCvAPcZu2DaOuiODB+UHLv85SNymIlQoqh0itT78xg9opoEOpQVkQ2FhoGF5rpikaePvuR
 Mh/z8VmLoN61YAVFHh9zWIpDpPFrAhpXrqK/9KXeZRbKIBo06PPyLuX2JfXs9xB58VQ9zYD2Q
 Cyq2V0++AOn9GxLy/d0OaBDF+8ObW1GYdbKKJ9Tf7BqbVlleDwZg0psjMRlNr8JP+TU8mSHIA
 kj4V121Snsb5vIbhW67xVyk+OqsiyqSKjYLcLIo8c1RRvTmF/6h+SO1XtrrUOJuKgG5SrwB2c
 VRLTMBmEPD72WngKqUds0DUQ8DXBPg6WJc/P5hmNOhxWOo32wNrkjVVxR1BYlE5g259O6rmLW
 l63VgXIvNR0eSsnY7NV8IbfXj317GlMX+183TxOp5CO6ucjchTAh0vvSkHCiaqo07rTljodhE
 KFfdCYXqWZceDjzHV12RLA5492F+Hd/MKXVbNL6OF/GsSROhfLWvlXd5/XLwnbSQn7NdT5UgS
 9/khW2NLpm2ZewaJUr2gYg95kgj8XvL4K4EZRM++GLD35zzgAmSgjOfoM7q7SxeBius0VNiHL
 WvBcwcu1QaWlAqf68IildjlJmq53vh2g53loAatmJLUgkbtE/IIReZt0yhFaNAKxWOd7OzUBG
 anGmRwA3JsYgDQCJw5AVhmlUbVqqs3ZMeXLhVpCbG3y5CSV/DPWDff+eN+ISgFJLsduxzsFPp
 mbOUFyIlXOG31agsyQ+241TknqtuPfXyifnckDy2DlTZ5eUjQrRb+1SPNa4XykkysfyJ5AHRm
 o/X3aHC7wh6Ufgraebpr1sLj2AgRRZLmhHGoPiMZQnhFSg0PFnoavw/a+55HnNdQ25Pdj1/BX
 Cc1A6ZX7RrwyeDD8Irq6umf3+Wa4ZRf/acHTuItyWXB6+gACYQI9NlmO+STbuYXNPnhEpMmng
 whtq3aRdzQTomVp1ssoWCG2JBEZy7IXqKtPhHis
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 07:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209099

On Thu, 2024-12-26 at 12:24 +0100, Mathieu Dubois-Briand wrote:
> On Thu Dec 26, 2024 at 11:47 AM CET, Marcel Ziswiler wrote:
> > Hi Mathieu
> >=20
> > On Thu, 2024-12-26 at 10:42 +0100, Mathieu Dubois-Briand wrote:
> > > =C2=A0On Wed Dec 25, 2024 at 11:32 AM CET, Marcel Ziswiler wrote:
> > > > Signed-off-by: Marcel Ziswiler <marcel@ziswiler.com>
> > > > ---
> > > >=20
> > >=20
> > > Hi Marcel,
> > >=20
> > > I'm taking this patch in my branch, but just a quick note: it looks l=
ike
> > > you setup is breaking the patch format while sending it, so picking i=
t
> > > is a bit painful. Particularly, it looks like it drops spaces on line
> > > ends, which do mess the changes on patches.
> >=20
> > V1 indeed had an issue but V2 I sent straight with patman which uses gi=
t format-patch and git send-email
> > and
> > should not mess with any such.
> >=20
> > > Can you fix this for your next patches please ?
> >=20
> > I am happy to fix anything but V2 should really apply cleanly, not?
>=20
> No, I still had the issue. Either using b4 or saving the raw mail, the
> patch does not apply. Running:

Yes, I see it now. It's a new feature of the 1and1 smtp server silently con=
verting everything sent as 7bit to
quoted-printable! Let me see how I may solve this. Thanks!

> b4 am -s 20241225103244.3514559-1-marcel@ziswiler.com
> git am v2_20241225_marcel_gettext_upgrade_0_22_5_0_23.mbx
>=20
> The git am fails with:
>=20
> Applying: gettext: upgrade 0.22.5 -> 0.23
> error: patch failed: meta/recipes-core/gettext/gettext/0001-intl-Fix-buil=
d-failure-with-make-j.patch:1
> error: meta/recipes-core/gettext/gettext/0001-intl-Fix-build-failure-with=
-make-j.patch: patch does not apply
> error: patch failed: meta/recipes-core/gettext/gettext/0001-tests-autopoi=
nt-3-unset-MAKEFLAGS.patch:16
> error: meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAK=
EFLAGS.patch: patch does not apply
> error: patch failed: meta/recipes-core/gettext/gettext/parallel.patch:15
> error: meta/recipes-core/gettext/gettext/parallel.patch: patch does not a=
pply
> error: patch failed: meta/recipes-core/gettext/gettext/serial-tests-confi=
g.patch:41
> error: meta/recipes-core/gettext/gettext/serial-tests-config.patch: patch=
 does not apply
> error: patch failed: meta/recipes-core/gettext/gettext/use-pkgconfig.patc=
h:30
> error: meta/recipes-core/gettext/gettext/use-pkgconfig.patch: patch does =
not apply
> Patch failed at 0001 gettext: upgrade 0.22.5 -> 0.23

