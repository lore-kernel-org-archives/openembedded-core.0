Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F61C43217
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 14:35:29 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.10123.1646922926870607144
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:35:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=jkn5d1er;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-002-205-233-017.002.205.pools.vodafone-ip.de [2.205.233.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B272583AB9;
	Thu, 10 Mar 2022 15:35:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1646922923;
	bh=aAtWEXswPbZyWzMM647GjShSJ9yDi6YHoXkwNihOzCY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=jkn5d1erIVCiv0NGmEPZyfVrsZQc09HDTuA7VETuv3Hx5AdSJranMyjQ28cNYbtPA
	 SItb7dDQteCEhxDlOgoxqZMNc8ZVsGX+D401BvNiO13RRmwYTQ5tBHAEGfH7G9BoCr
	 xea6qZeKVe5OF1+9hesE5NwLReNO8hWRTtNyG/GUc6cf9zkqNFCgSL55a60bNDLmCl
	 +Y9iTn1S2QsKfMrNbdvgxA+LpthHaAV1Ex9mBUsdiUgP50d5U9CnhimEXsU2gB+fyd
	 Ug4kiJuRrAcxUrsu4Jc1r1PI7Te9coUCLQRcYKMJiLbNT3SHqaVwY5N7xbNaUro32c
	 Wl5nDBjGeWUCQ==
Message-ID: <f189d539-6e6f-231e-b682-5eceeacf921d@denx.de>
Date: Thu, 10 Mar 2022 15:35:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 0/4] Patches and bugfixes for overlayfs
Content-Language: en-US
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20220310131329.1906537-1-ch@denx.de>
 <4914a575-f6da-59da-1fce-12064f83dac0@gmail.com>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: <4914a575-f6da-59da-1fce-12064f83dac0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 14:35:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163030

Hi Vyacheslav,

On 2022-03-10 15:28, Vyacheslav Yurkov wrote:
> On 10.03.2022 14:13, Claudius Heine wrote:
>> Hi,
>>
>> I bundled my patches to overlayfs and overlayfs-etc togehter in this
>> patchset and fixed the whitespace issues.
>>
>> regards,
>> Claudius
>>
>> --=20
>> Changes from v1:
>> =C2=A0=C2=A0 - fixed whitespace issues: converted tabs to 4 spaces.
>> =C2=A0=C2=A0 - changed git commit title of patch 4
>>
>> Claudius Heine (4):
>> =C2=A0=C2=A0 overlayfs-etc: add condition to package-management featur=
e conflict
>> =C2=A0=C2=A0 overlayfs: add systemd unit path prefix to FILES:${PN} ar=
ray
>> =C2=A0=C2=A0 files: overlayfs-etc: wrap long lines of preinit file
>> =C2=A0=C2=A0 files: overlayfs-etc: add overlay mount options to preini=
t
>>
>> =C2=A0 meta/classes/overlayfs-etc.bbclass=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 ++-
>> =C2=A0 meta/classes/overlayfs.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
>> =C2=A0 meta/files/overlayfs-etc-preinit.sh.in | 12 ++++++++++--
>> =C2=A0 3 files changed, 14 insertions(+), 4 deletions(-)
>>
>=20
> Hi Claudius,
> Thanks for the patches. It seems like the first 2 are already in master=
=20
> branch or I'm missing something?

Yes, that seems to be the case, I missed that.

There are only non-essential white space differences between those and=20
mine, so my first two patches can be ignored.

Thanks for spotting that.

regards,
Claudius

