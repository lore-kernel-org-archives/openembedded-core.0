Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id D54EC61901
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 18:40:04 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id l7so136308pff.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2020 10:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=kgy9Amxjqgu0Q7PepOd1RnfWhT+TKcbwGldwdNGyUwI=;
	b=azCyszymPDfKwcsf8P0S9jyo1lUPTtfB1SAJvfLJqjpn9SvT8z614qSVfl81ClsJgp
	laS9MqgIsK1L/T5BRcWJ/ONVgK1BRAKcMUbT74m88apMqw5ZKPI7X6qacIRsMOfSxiJL
	MLK/PCnqx63FjPGwenU1vPL1UDWQLsjZZ3RgkikkO7Qz6rMdy8E51g6RDo343D1c8KWG
	8aQyU2FQ1gCbVwPvI/UcanGx0yIqxJ2oA3flmFon6japdsctGs+CS5x3tMpKSRyLEDcy
	7IxZNFPq18bXMGeAcSSijm6aJl6+VzZQT+i5+SXA1c2FzPB5dxSV+9dRxwneU+O118ho
	tY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kgy9Amxjqgu0Q7PepOd1RnfWhT+TKcbwGldwdNGyUwI=;
	b=J8tijlHn9J0hZmbrrPiL7s4uqHVpCcNSWVINe2p860F1UO79jRwTk8vXBFswjoLx5j
	uubh88jfyYItSDdi7p7V86YQUEaf4uPCcAyMkWwny+Dey/yGVxIU7qehBZZ76LoFmv/w
	X9vE5MI9+NjRUyHcT00fMGHiVE4kK/WqUYLEABVofyKQnSWewKPrr4NViTMyrpz4Hrnh
	Zk+mjVGIwpiFZGMzGBDYh5io7oYWIpy0QLYXavmkejirnxyvBhpJ4drCb8NemZ/y/ScZ
	4Sr7jYTBdZA38P6XVaW+4x+StlKw8ydUsXlfbiW6pTSVZGwhJ937oFCvPLdm9Z/iBFBo
	4oTg==
X-Gm-Message-State: ANhLgQ2xRbEKfn9Pgr3CNUPx7XDnzdEwox4cZgnK+CwWdCtP437LYILg
	DxmssIU4i6pXh+Fa9EoKXKg=
X-Google-Smtp-Source: ADFU+vsodE+MZYMFbPw69SDjxI7eatg4vRfQd7Em7h8/2Q2EWcoDn5uouNgDXEbXJAe8LVrqioXkHQ==
X-Received: by 2002:a63:5848:: with SMTP id i8mr244543pgm.438.1583174405759;
	Mon, 02 Mar 2020 10:40:05 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:8446:2edf:6d4c:9a00?
	([2601:646:9200:4e0:8446:2edf:6d4c:9a00])
	by smtp.gmail.com with ESMTPSA id
	q3sm12454917pgj.92.2020.03.02.10.40.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 02 Mar 2020 10:40:04 -0800 (PST)
To: Junling Zheng <zhengjunling@huawei.com>,
	openembedded-core@lists.openembedded.org
References: <20200302171744.30713-1-zhengjunling@huawei.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <c62719bb-8bda-2221-358d-3ff7f6f2a469@gmail.com>
Date: Mon, 2 Mar 2020 10:40:04 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302171744.30713-1-zhengjunling@huawei.com>
Cc: wangnan0@huawei.com
Subject: Re: [RESEND PATCH 1/2] security_flags: Remove stack protector flags from LDFLAGS
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
X-List-Received-Date: Mon, 02 Mar 2020 18:40:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/2/20 9:17 AM, Junling Zheng wrote:
> The stack protector flag is a compile option, not a link option, so
> remove it from LDFLAGS.

we use compiler driver to do linking as well, what does this change fix 
for you.

> 
> Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
> ---
>   meta/conf/distro/include/security_flags.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index aaf04e9e59..5b79340be9 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -26,8 +26,8 @@ SECURITY_STACK_PROTECTOR ?= "-fstack-protector-strong"
>   SECURITY_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>   SECURITY_NO_PIE_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>   
> -SECURITY_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro,-z,now"
> -SECURITY_X_LDFLAGS ?= "${SECURITY_STACK_PROTECTOR} -Wl,-z,relro"
> +SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
> +SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
>   
>   # powerpc does not get on with pie for reasons not looked into as yet
>   GCCPIE_powerpc = ""
> 

