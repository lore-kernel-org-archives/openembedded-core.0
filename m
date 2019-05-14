Return-Path: <martin@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id 91A0B7DF0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 06:41:27 +0000 (UTC)
Received: from [172.21.3.80] (unknown [87.54.42.112])
	by first.geanix.com (Postfix) with ESMTPSA id 564148D9;
	Tue, 14 May 2019 06:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1557816082; bh=qx3bDOAaEzMfZAxjBYCYELRjW+RGlQUVQn0SKk7obiE=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=GzRfb/FlIjrn2hbZPm7PcwdtHsQ5Esq/jzNFKt7eXbR/uAmCA+9gZvMu/iAOiTwRG
	wy0Uiu0Ccqsszgp/I0VH/h7qDq0Ikb3E2xAHq57iGVfFwiIRjSYoZk2OBkTO+LtBfV
	2PmW3GugBNcAEylYDGnFhBLGWhShSyzos2cudwXhl0tQv5pwIgp1RnoQqyEFeaqB5L
	JAeB/TxDu/H3HYGyJcGBtiAfLNu6SlucRBiJmRwIju67uyDVq3AwEh+vav3mX4uB90
	EgVL0dLHzYnpOxiA6GHFsI3jR5jcX8gxH20QRHbhRu1CknPFJjV9hI9RVpEbFKdbIb
	74Zda5CWwhmuA==
To: Douglas Royds <douglas.royds@taitradio.com>,
	openembedded-core@lists.openembedded.org
References: <20190514055559.17676-1-douglas.royds@taitradio.com>
	<5d269448-8fac-8405-7315-1f97786e04c9@taitradio.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <6aabd03c-d747-4a4f-4c9d-7496abf5fee4@geanix.com>
Date: Tue, 14 May 2019 08:41:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5d269448-8fac-8405-7315-1f97786e04c9@taitradio.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on 796779db2bec
Subject: Re: [PATCH] distutils: Tidy and simplify for readability
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
X-List-Received-Date: Tue, 14 May 2019 06:41:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

On 14/05/2019 08.16, Douglas Royds via Openembedded-core wrote:
> Can anyone explain why I appear on patchwork as "Andrii Bordunov via 
> Openembedded-core"?

Yes.

Because the DMARC policy for your domain is "quarantine":

   % dig _dmarc.taitradio.com TXT | grep -oE 'p=(reject|quarantine|none)'
   p=quarantine

If the mailing list simply forwards your mails, they will fail 
validation, and thus be held back by the receiving mail servers. To 
avoid this, Mailman changes the "From:" header to "Douglas Royds via 
Openembedded-core <openembedded-core@lists.openembedded.org>".

Now the email address seen by patchwork is the same for everyone with 
either "reject" or "quarantine" as DMARC policy. I guess patchwork has 
that address associated with Andrii (maybe he came first).

More info from mailman: https://wiki.list.org/DEV/DMARC

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix ApS
https://geanix.com
DK39600706

