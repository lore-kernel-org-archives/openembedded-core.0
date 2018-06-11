Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id D45F578C6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 21:38:35 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id p21-v6so10376045pgd.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 14:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=gkymtWa2oZRRapfhPpM6ij3OdWXCx9batuHE2UhLqM8=;
	b=JpuW0n6Qdf9UjJvJs5ZD6JEQnab3KljMJsA78CK1+Mg3KrPo7SDPslCNS4RwaewulJ
	YMMHX6kLnqtPKnuIWs1ggrdRMCtxiTiMlY59PHEtPVtauTLZi4KxlWrXY/P+Eu4BbJuD
	T8yvziO7OAixPeIvXvz1WMiFRT5HtdbrRCkIvCLR4j/Me7PR9TIBxP5F7HUtgyG6cHoe
	vSWOdSZ1fpdnO4WPLQ9gYHKS7ViVKFVkiOorwf28oVl/QCK+WjMw6X+SCQyfo9+exGzm
	NL47bmqRXypaw88HJy6KF7QDIr/aPzmsQ3H0rySi2GguixzOK3o1Pv3vmzQnzvKPL8x3
	oVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=gkymtWa2oZRRapfhPpM6ij3OdWXCx9batuHE2UhLqM8=;
	b=My+HWqmrkU6cNykDRR6jgJEPpBRmclQySbN1eWRbeYjnDwvR2TGjPErG2/GWRShKfG
	H2IYzC4jP3Eqd2QAvipnscTY0WmFTLhk2cVHUPbcq4dpa9Cr/3KSceLrxY808QkNmMU4
	mBdARzDKbU/4SDTdy8nP7FGWYiceygauN2yEAeBWTOVzLiGZpRX0URmlswKyJwDMoS5A
	qMpROs2w+NKK50Jk8mmtdHZ7EKgIj+7LL60Jd7+z/A58XQObVZQ6f1TrZ/ucz448RweQ
	+RadN19F/jKjxbqK1F0wvo+ORrkk7DPcYXTp76PmqQY14VA9yGY6XwD2RZw7Wu+g0PWE
	ZWpA==
X-Gm-Message-State: APt69E1c/qx4FFnkAFoH6R8htvhvFlJNYeCQTrK7pb+rUBglko2F9lCM
	pATC+FTq/et6oBtlvMIxOH3Kog==
X-Google-Smtp-Source: ADUXVKJOCixwEinqpHtbwVR7XrxcOqVSA/xt9J1pPCPYPkpGIs5+F/ouepy+YxerpXUUzdKfFph6uA==
X-Received: by 2002:a62:e208:: with SMTP id a8-v6mr894229pfi.6.1528753116807; 
	Mon, 11 Jun 2018 14:38:36 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:3dc0:dfd2:694f:63cf?
	([2601:202:4000:1184:3dc0:dfd2:694f:63cf])
	by smtp.gmail.com with ESMTPSA id
	o65-v6sm15440832pga.75.2018.06.11.14.38.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jun 2018 14:38:35 -0700 (PDT)
To: =?UTF-8?Q?Daniel_D=c3=adaz?= <daniel.diaz@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAEUSe78jgx_SYGcPc87F7F80UwDDnnr06sy6hB8K=ha=j8TG9A@mail.gmail.com>
	<3149f073-f524-d9ce-ad7e-e8a7c09e4dc1@gmail.com>
	<CAEUSe7-+VYOFA5X5fFR-=fsuzY_RREZ2V_myWTia=dDe7NkPZQ@mail.gmail.com>
	<CAEUSe7_AH1r9=g_HT-SYZXwyA3oWWxiJQ8z5GrYa31Uf21u0_A@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <11604122-a4df-e93c-6f34-baa7fe733723@gmail.com>
Date: Mon, 11 Jun 2018 14:38:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAEUSe7_AH1r9=g_HT-SYZXwyA3oWWxiJQ8z5GrYa31Uf21u0_A@mail.gmail.com>
Subject: Re: [morty][PATCH 1/2] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Mon, 11 Jun 2018 21:38:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 06/11/2018 10:30 AM, Daniel Díaz wrote:
> On 16 May 2018 at 16:20, Daniel Díaz <daniel.diaz@linaro.org> wrote:
>> On 6 April 2018 at 15:43, akuster808 <akuster808@gmail.com> wrote:
>>> On 04/06/2018 10:08 AM, Daniel Díaz Rodríguez wrote:
>>>> Ping on this series for Morty.
>>> This needs to be ported to Pyro first. I do it this weekend and morty too.
>> Ping on this series for Morty.
> Ping on this series for Morty.

this is in the stable/morty-next branch which is on hold for the current
morty QA. 

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=stable/pyro-next&id=76ffc6b7e5ff6f2bab6e53bb07f52a25fcb81ac9

regards,
Armin

