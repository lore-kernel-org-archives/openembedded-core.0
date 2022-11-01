Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035E0C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 20:14:01 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web08.150.1667333630553282174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 13:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.107] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2A1KCaPu022749;
	Tue, 1 Nov 2022 15:12:36 -0500
Message-ID: <43cab497-3168-ea40-e13e-48d4e610533e@kernel.crashing.org>
Date: Tue, 1 Nov 2022 15:12:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: Running weston as non-weston user
Content-Language: en-US
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>,
        openembedded-core@lists.openembedded.org, PEWhacker@gmail.com
Cc: bruce.ashfield@gmail.com
References: <64cf9c1a-a3c7-42e3-d050-4f493c7fcebc@amd.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <64cf9c1a-a3c7-42e3-d050-4f493c7fcebc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 2A1KCaPu022749
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172385



On 11/1/22 3:03 PM, Gundlupet Raju, Sandeep wrote:
> Hello,
>=20
> We wanted to know what the actual use case is for running weston as
> weston user only in OE core
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-graphi=
cs/wayland/weston-init/weston.service#n44
>=20
>=20
> How is this expected to be used for another user.=C2=A0 Is this intende=
d to
> be run as the primary machine user or is there another approach? For a
> system where weston starts itself, it=E2=80=99s expected to start with =
the
> weston user only?
>=20
> Can we add a existing user to weston group and make it to work?

An additional question:

For a system w/o mouse and keyboard, can we ssh in and execute our waylan=
d tests=20
from remote?  If so, what user should we be using (weston), can we define=
 our=20
own user?

--Mark

> Thanks,
> Sandeep

