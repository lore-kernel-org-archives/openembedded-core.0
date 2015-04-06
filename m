Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 836C4605D2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 13:18:15 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so18994841igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 06:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=LAravxIVvySiHwRlKxTUmkw0/hlr7lzy4t3hqpjTvrM=;
	b=iRpVg6AlSpww0OD8nBZX+dVz9eZv4Q0xnM2QzWmVTldkVuDyf7aMpSzC76Ma/wdi7r
	XJZz1+9xrHkqknYBfCDYMwRtu3fJhSFm+9sAutOey4vK7GGerjHl3DnnvTdWB3767EzP
	9TZ33yYwF0Ar3zVMlTRRaAa/llU7Bha00CGT2ky4hqPBwzG0RDPtrI8pZKKE6JwZ4o3R
	SQzv+YV2MwWL7aGVmMYDj9PNXAgWobp5Y6gDJ9ixhoPetuwvEZr3+Q1zt32+qUaAi1iP
	DsDixHjgXnzM/FAKJZC61eLh64pX5uxKqjSNGzibNsdU1sfajzQ32eNNivnrf83u8zye
	uZBQ==
MIME-Version: 1.0
X-Received: by 10.107.34.210 with SMTP id i201mr22640324ioi.1.1428326296326;
	Mon, 06 Apr 2015 06:18:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Mon, 6 Apr 2015 06:18:16 -0700 (PDT)
In-Reply-To: <552282D7.6040108@pabigot.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<CAJTo0LYL4Mf9L0Fnij2yRLhyJwn-sxdDV2uWUAx-FCRFBgTHmQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F4944D2@irsmsx105.ger.corp.intel.com>
	<552282D7.6040108@pabigot.com>
Date: Mon, 6 Apr 2015 10:18:16 -0300
X-Google-Sender-Auth: wpJf55k5zturBVuEMSXMzM9dXSA
Message-ID: <CAP9ODKobzYLZS9K55S5rSw=Z=LHOaDOTt5mkzTx3SjomMvXnXg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Apr 2015 13:18:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2015 at 9:57 AM, Peter A. Bigot <pab@pabigot.com> wrote:
> On 04/06/2015 02:31 AM, Iorga, Cristian wrote:
>
> I thought of 1.9 as the preparatory stage for complete removal of bluez4,=
 so
> that in 2.0 it would be very easy to remove the support for bluez4.
> Continuing to have bluez5 added to DISTRO_FEATURES create the impression
> that BlueZ5 is still a second class citizen compared to BlueZ4, and it is
> not my intention to sustain this opinion via code.
>
> I hereby standup for my solution. At the moment, we are 1to1. =E2=80=9CWe=
 think=E2=80=9D =E2=80=93
> Who are the others persons, Ross?
>
> /Cristian
>
>
> While I fully support moving to bluez5 and use it in all my images, I do
> think it's a bit abrupt to make it the default in the first stable releas=
e
> that provides a usable bluez5.  On the other hand, Yocto's late to the
> bluez5 party and it's going to be harder to support bluez4 now.
>
> Six of one; sign me up as weak support for delaying the move to default
> bluez5 until 1.10.
>
> Just an opinion.

I prefer bluez5 default in 1.9 and removal in 2.0 (or 1.10). We
shouldn't be support legacy without a very strong reason and if any
member shows up to officially support bluez4 for longer we may drop
its removal but bluez5 default should be done as soon as possible so
we iron out regressions.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

