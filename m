Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id B57246142B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 21:27:59 +0000 (UTC)
Received: from [192.168.1.17] (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 6CE3A60057;
	Wed, 19 Feb 2020 22:28:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1582147680;
	bh=XWOp6ZhYSEy3YEfpNcT8rw/uVyfSVadBG8z+KMdBcjU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=IOg42fLdA+HzIfSNGjat57sNml4IlWjmI5Bk/7RMuOYjK8TMLHiCVCUyCHcojnlkn
	oShATq//h2tgTX8RPt/exzhX3xAkED8xGQgdehd+APkugEd/kUWkdLiSQJHMa04cbC
	FyeCa1iiCGQJUALefzqDY0P9a+avE/OII5/kLkhlAOUSD6fjujN2LKoP3QReBfqobH
	QE18M3VpEdh0X2aj9+aG8dckQyi/7VyRxqsoCOg+OLSkjRuMHw0T3Ry9lbsgRWbWS5
	vKg40EUKhw24Q3ZjEy/ZNDhBoSa7J9BIORiogA5tgVOtQNfIz86QKLskm8B78QIeMN
	A8+Jle9LeC5hA==
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <1582146491-20965-1-git-send-email-pjtexier@koncepto.io>
	<CANNYZj-8CG1HDuXbjmS4AVFe-LChc-MGKTTQXsjkc8H=SpYB5g@mail.gmail.com>
From: Pierre-Jean Texier <pjtexier@koncepto.io>
Message-ID: <d4041aff-ae09-a999-aac4-12a481766baf@koncepto.io>
Date: Wed, 19 Feb 2020 22:27:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj-8CG1HDuXbjmS4AVFe-LChc-MGKTTQXsjkc8H=SpYB5g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libubootenv: bump to revision ba952d0
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
X-List-Received-Date: Wed, 19 Feb 2020 21:28:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Alex,

Le 19/02/2020 à 22:17, Alexander Kanavin a écrit :
> If PV doesn't change, package managers will not be able to update this
> properly. You need to set it to something like 0.2+git${SRCPV}

Sure, you're indeed right.
I will send a v2.

Thanks !
-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io

