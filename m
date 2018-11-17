Return-Path: <marek.vasut@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id BC0E86C227
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 21:42:05 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id v6so6371645wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 13:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=U3qAw9Dqbf9nAvzOCNcvvDRIsC81PgJacmDR02eXIEo=;
	b=fNfy8LdSNxcktl2ixgZfP63oH4/xSuR3PTMJWvpKJeNV6hE+1QMWGF7EAGI6HVuNbP
	sukTv/Q7p2QbA5BMMHia3FVki5ezeRBe4/kUuTaqsQGsKRC/SzdbNqzDjiritBg+6Yhl
	HxWWK1lneJy3p/8rL0oOlu2FjIDB5mjpS6k4LU32VhwR4uSDWM640fXN9x46lY6SHTo4
	voQi1pMmnJknMrcXi8J+fQLMyLjfP1Ayek/hWodQFmDXi2kGrBc1jovma2lnnqDXBcod
	PGRTVcrNoOf0F4prB2ch6Gq9UeFT2GbP7AgVLQmoJyjqv8xyAqjHwwjkfDh1VEPTZO8o
	hqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=U3qAw9Dqbf9nAvzOCNcvvDRIsC81PgJacmDR02eXIEo=;
	b=I7j+bbxVttwBF4gnPBzJ6ybdhCe3rL0wz0ZljmDkFX05rJx+GATUyzBRcoLeytFj/y
	C3zYYSkx0fPJ6t1sOXvxVcdQsr8CaSq0lC5q5jRRESJg3E9+gQ+GoS8KKfNAAsG5kt9B
	Go5XXKwKwIM41vnQVRW7ERkQ3ELq9FIHvdX40Wu6KeBLnczEPIL2HZGLsNv/IKqDE54S
	dr/LVFZFetyjxuSQin5iCDJff1ZlmQUlCy9ClmvF2OO6/WA0kYY2tSRTbNnQwYY9lFck
	2g410H5mAxJopJDCXnA7bPvQNFbEM3rU3BvYQOCSqhOZggv7Elxrct3l7wgcPxu+bCxl
	EntA==
X-Gm-Message-State: AA+aEWZL5mU4AYNjKo5I8AN/RCDYAlEqfwZoaz6BZKt3PjEmKbV61yqm
	0SYEGql9+nG8S4OyryzYj9tMts4m
X-Google-Smtp-Source: AFSGD/VTj3ifw/2dmcBvut3cgt7ggeXhay0naYSW/hMIE9bBogOBOtWgeMPOam7QKP+l9YFUEoa/mg==
X-Received: by 2002:adf:bc02:: with SMTP id s2mr2013688wrg.255.1542490925872; 
	Sat, 17 Nov 2018 13:42:05 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz.
	[86.49.110.70]) by smtp.gmail.com with ESMTPSA id
	t5sm12401258wmd.15.2018.11.17.13.42.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Nov 2018 13:42:05 -0800 (PST)
To: auh@auh.yoctoproject.org, openembedded-core@lists.openembedded.org
References: <20181117144457.A7B74440002@auh.yoctoproject.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <be32ec5d-9c69-0625-10a2-a32b587bc02a@gmail.com>
Date: Sat, 17 Nov 2018 22:42:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181117144457.A7B74440002@auh.yoctoproject.org>
Subject: Re: [AUH] Upgrade status: 2018-11-17
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
X-List-Received-Date: Sat, 17 Nov 2018 21:42:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/17/2018 03:44 PM, auh@auh.yoctoproject.org wrote:
> Recipe upgrade statistics:
> 
>     * Failed(other errors): 1
>         u-boot, 2018.11, Marek Vasut <...>

Is there any chance AUH will be fixed to update U-Boot properly, that
is, all recipes at once ? Now it updates it partly and fails, obviously.

-- 
Best regards,
Marek Vasut

