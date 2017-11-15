Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id AE7ED783DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 23:34:40 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id x7so18175075pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 15:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=0UlVqHchZ5VOGlstsftk0cLZpkH5S1mApk817buzSPg=;
	b=olbasMWyl6ChI9C6K5NpaW9G3XOUUL4qhuMoBDwYW9FGoWgWYzsH84nzqVEqpkSwci
	zmZKndMzuLMyjTnd8cnIRLk4eNr8DAMjqZbbCo96YYn36AJDr4uFATy+VUh3LI4bpZXG
	WNeSODx9ut0AjEosD2BNhMpmXhAiUMc741EOnJEYlvfKY9LJVzv01nCWv2hQnJ1YSHAv
	WsL35JZeIsUK3tHO2bHc78MT6RHH5iGDNaPF/1VPFM6pnnsVpInaQEcKvNqZXIJxwJpI
	fdNuY80wQYygSAcWoLz/QEMfkwg7EXkCtgcEf5QXDQtpuHpcFt+HIPNo5ufoKS+aJlED
	Kksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=0UlVqHchZ5VOGlstsftk0cLZpkH5S1mApk817buzSPg=;
	b=V3EdLM+3ZfFlcWNBB2KmR0uhICjq4pAj5YsOt3LufnAK5SnrBLkGtvaDj0o3YdIQ2O
	PI8QEy9z06rR0Z7Z0Czb6ZBITIuaI7SUAyj6+7OpFa5eeeUr6o1bLwIzgcZ2JH9CuX/U
	z8g/+8fwNVVMMSf3H2XeTWYexD55Pxw0lRaev/ojODZtF/S5CRdNjx+ZU2tqeMhPJAWT
	VmzFkY0dCXUl7n5vODR3LqYBAhRaBHHqh4HlAXOppptBX/Uk9YglOZmTDolFoYZHRp/n
	YbDgj7Wiac4fylHm3ho1sHLLmemsm0OOUpTq7jGjCjIk0y/TrbAOElah10kphqBI1Bbs
	gJTA==
X-Gm-Message-State: AJaThX4QGLk/MxfBb8d92y8gxgirBILv6fO9QUnfRVGdoa/qGnGtuOUY
	2NDzLxDY/PlnC7qsm5hy+q5g9Q==
X-Google-Smtp-Source: AGs4zMY4FUkqCyzIrgJInigANuZs2KWeK09gL/DFVlJ7j0FJ9pLLkoVKSieSbU7Ct/zrIxWi6vAf+Q==
X-Received: by 10.84.135.129 with SMTP id 1mr18055714plj.47.1510788881624;
	Wed, 15 Nov 2017 15:34:41 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:a90f:c0e3:b57a:b8e0?
	([2601:202:4001:9ea0:a90f:c0e3:b57a:b8e0])
	by smtp.gmail.com with ESMTPSA id
	z23sm12097051pgc.2.2017.11.15.15.34.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 15:34:41 -0800 (PST)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Javier Viguera <javier.viguera@digi.com>
References: <20171114195619.30923-1-javier.viguera@digi.com>
	<20171114195619.30923-2-javier.viguera@digi.com>
	<CAP9ODKoW7rQPc_fE9tm9ydfiz9ZdawE+b9yQEu4pTkHX=pSmow@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0c3d099a-e0a3-33fb-7e80-ed0cf12b7ca2@gmail.com>
Date: Wed, 15 Nov 2017 15:34:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoW7rQPc_fE9tm9ydfiz9ZdawE+b9yQEu4pTkHX=pSmow@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty backport][PATCH 1/2] tcf-agent: kill with USR2 in systemd stop
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
X-List-Received-Date: Wed, 15 Nov 2017 23:34:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/15/2017 12:37 PM, Otavio Salvador wrote:
> On Tue, Nov 14, 2017 at 5:56 PM, Javier Viguera <javier.viguera@digi.com> wrote:
>> From: Martin Kelly <mkelly@xevo.com>
>>
>> tcf-agent ignores SIGTERM, so upstream uses USR2 instead. This issue was noticed
>> by Jan Kiszka and Brian Avery around the same time:
>>
>> https://patchwork.openembedded.org/patch/139546/
>> https://patchwork.openembedded.org/patch/139560/
>>
>> However, these patches fixed only the init scripts, not the systemd service
>> file. This patch fixes the systemd file.
>>
>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Please also queue this for rocko backport. It seems a good fix.
rocko released with this fix.
http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/tcf-agent?h=rocko&id=4f8ed1b3bf676a58055ebe01184b3594459a4118




>


