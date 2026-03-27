Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E15510BA45C
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 09:14:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68881.1774602878430754104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 02:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0a91QG80;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D153E1A3016;
	Fri, 27 Mar 2026 09:14:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9E73760230;
	Fri, 27 Mar 2026 09:14:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 232D410450B0D;
	Fri, 27 Mar 2026 10:14:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774602876; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RtfdsY7LcJXuOquQM43HcE23AZ7uXYLmAyvfK7TKTh8=;
	b=0a91QG80acNYex2V+O3zvvZWxoq7HIFrcAkE3vUN4I3MkXHDo8akNr/HuVqgqRoU36J91q
	OOlLb5grqYMsysLzce9uZIysX0GkgTTr44e3mm3yzRLbHnny8v/+xKvOwSGhgLh2xcCA+v
	/iiEACqDyc+LQB1wC1aSC4Hep6I/wAM3/R13IKn3tBEhLULGpN54YYb6an4ufOXzskZoly
	TVwCncEyBA+muLtB15hEuIQgxTQJUkksEPBEIHv0+EmahyeYR8GwDsO5SN7dGochLw3E6z
	+cMHwHCugyMVfizftd20a14JLpbAnPQRGfbZqWgN96359PvbAdeIaJZgWz5jYQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 10:14:33 +0100
Message-Id: <DHDG7TO62INK.AIHO20K1C84O@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] kernel-fit-image: support arbitrary
 loadables
Cc: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>, "Adrian Freihofer"
 <adrian.freihofer@siemens.com>, "Marek Vasut" <marek.vasut@mailbox.org>,
 "Michael Opdenacker" <michael.opdenacker@rootcommit.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <francesco@valla.it>
References: <20260301-fit_loadables-v2-1-2cf4cdf36a91@valla.it>
 <896a5439-cafb-41c7-b770-0d328cb5bf8b@baylibre.com>
 <e3b71012-6f22-4d8b-82d3-6dfefc947a7d@valla.it>
 <DHDFDB6KCDMU.LLC8N7SBMK6H@bootlin.com> <acZGz-B14OB7ugyL@bywater>
In-Reply-To: <acZGz-B14OB7ugyL@bywater>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 09:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234073

Hi,

On Fri Mar 27, 2026 at 10:02 AM CET, Francesco Valla via lists.openembedded=
.org wrote:
> Hi Antonin,
>
> On Fri, Mar 27, 2026 at 09:34:42AM +0100, Antonin Godard wrote:
>> Hi,
>>=20
>> On Tue Mar 3, 2026 at 9:30 PM CET, Francesco Valla via lists.openembedde=
d.org wrote:
>> [...]
>> >> Thanks for submitting this. LGTM, but it'd be nice to have it=20
>> >> documented as well.
>> >>
>> >> Could you add some details to the Yocto Project docs (e.g. in the=20
>> >> "Variables Glossary" section) and submit it to=20
>> >> docs@lists.yoctoproject.org?
>> >
>> > Yes, documentation here is pretty much necessary to understand how thi=
s=20
>> > shall be used.
>> > I'll work on it as soon as possible.
>>=20
>> Did you manage to come up with some documentation for this? I am catchin=
g up
>> with the latest changes from OE-Core and this appears to be missing.
>>=20
>
> Uhm, I sent it twice to the list actually, without any reply. But... it
> just occurred to me that I'm not subscribed to that list, so maybe my
> message was droppe without notice?

Oh, that's bad :( No, I did not see a patch coming in and there is nothing =
here:
https://lore.kernel.org/yocto-docs/?q=3Df%3Afrancesco

It could have been moderated and approved manually but I guess it slipped
through...

> I'll subscribe and resend in a couple of hours. Apologies.

Thanks!
Antonin

