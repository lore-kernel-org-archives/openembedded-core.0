Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77DBC001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 16:10:10 +0000 (UTC)
Received: from mailrelay2-2.pub.mailoutpod2-cph3.one.com (mailrelay2-2.pub.mailoutpod2-cph3.one.com [46.30.211.183])
 by mx.groups.io with SMTP id smtpd.web11.65720.1691511008070633495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 09:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=iTy5zWun;
 dkim=pass header.i=@berginkonsult.se header.s=ed1 header.b=QO7y9q0n;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.211.183, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=+jXuJUfkgZDsSTXEtQlJXZdpdL2gTjyyQhZvBuYIKf8=;
	b=iTy5zWunS/YfQTT9kHDdy34BX29PO4r9S0fYRv2t86PfTuY6+JTTbtEA9PyTUNRtStX/oY3kgb4GD
	 Qhe6IfogrdUODeVNHz96Q44BcqplxinoZCIzWBBOTcnuEr7g8gVEJ+pm/fUbSzdXuKcT1cVXEBzmKN
	 QXPX6lClT74RCgHch+DNZ5kLhTCuvDcE8WEyRU5cy13WciRj51PBYZNGIDvwBc0sbLxkP9Db73uDO7
	 YQaVWiJqDuUWUrSTES4orfnZ8pcHgnLdA8l+WG73k+dXvjsMaIa7qGT+jGaxrD7h/MNO6aOcQ41WOT
	 jICI84GsnFXWSYMm9IZVH6jx1lX8QRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=+jXuJUfkgZDsSTXEtQlJXZdpdL2gTjyyQhZvBuYIKf8=;
	b=QO7y9q0nwLkoh1OFH3OLfjEXLlGKkt82tSv97dnZdLs7TKbnfl28AhiAE+rAvpBaPeLMQ2tOZX7ji
	 3Sm4AC5DA==
X-HalOne-ID: 08d1a0fe-3606-11ee-99c1-13db1c4e5356
Received: from [192.168.68.121] (ua-85-225-47-244.bbcust.telenor.se [85.225.47.244])
	by mailrelay2 (Halon) with ESMTPSA
	id 08d1a0fe-3606-11ee-99c1-13db1c4e5356;
	Tue, 08 Aug 2023 16:10:05 +0000 (UTC)
Message-ID: <280b5b1f-9f3e-57b8-51a1-cf83e3bdb34a@berginkonsult.se>
Date: Tue, 8 Aug 2023 18:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] systemd issue with network commandline config and 6.4
 kernel
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <000572c1ba81252efa552b812b0dc0838772c2f1.camel@linuxfoundation.org>
 <CO6PR11MB56028B6144B7556C8610CED3ED0DA@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: <CO6PR11MB56028B6144B7556C8610CED3ED0DA@CO6PR11MB5602.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 16:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185667


On 2023-08-08 17:34, Chen Qi via lists.openembedded.org wrote:
> Maybe some changes in new kernel allows renaming network interface while it's up?

Seems correct!

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit?id=bd039b5ea2a91ea707ee8539df26456bd5be80af

That was added in v6.2

/Peter


