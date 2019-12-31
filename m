Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 70BA27FB0A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 11:19:03 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so34921316wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 03:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=JwljHBVuwUCISs4oqhXy8k2Re+p9v1aVU63OIY+Je0I=;
	b=AWWyTA30SslSCt5gXpD+kuxwuk2qZ4RcOVCCcRzfkiGdxNOXLbkbXe8KIvZWjpVI4J
	KEQmb739O0F9qhfSopo6QTvQPySUkdJ2cerbxvCbE5IBTNWzDXlfL4IJusgyIGf7ZC82
	AMq9uOPjGkVsBs2GA/IATAoOHnp1keB+rw37U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=JwljHBVuwUCISs4oqhXy8k2Re+p9v1aVU63OIY+Je0I=;
	b=pS3Q7VWRTpb+D70hW3A74m5Q/vt2N8sfOU//SWEGtDLEaoV6pBGkkoaozEnm383mdR
	uoUTQRuY3k+o5teHQIPX33dHqeBCXQXBKwHTsDWyvCVNMUxfNixGhrPci4PC7cV2TK/O
	zmQF8oWMMNZ7HYEuExwWDYoDIJvt4PoC9OvNNG9hstOV1TlSYV6YuI9RbMdjDYIvfpXk
	ojqfBJZPTGOlhQVymMiM6V4jOlckuvMQEx9Fjkibf5Nhcil6V+HvsAeooIBkvRSr414w
	AXMbKk0+4R3LpMVt8fNHEoxjsL1CbBghBxZDjnWOnlvbusLcPGCPEXmd80yHnIHdvqP2
	CQ9A==
X-Gm-Message-State: APjAAAUXOP6JGZnZiCBjQJpwYpaYi+AdOK0EQDZ0v/hKmZkd6Fw/iEr4
	oE0mhtbVn+TqDvGI8HnURTzxtg==
X-Google-Smtp-Source: APXvYqyvKDjT0SudXlKkfZbWdm6YTZvNeT3Z/xo8uZt284S9bgKzknWUseZfWR4hFvmFW3z8ZM5rMg==
X-Received: by 2002:a5d:6349:: with SMTP id b9mr74841875wrw.346.1577791144128; 
	Tue, 31 Dec 2019 03:19:04 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k8sm48305322wrl.3.2019.12.31.03.19.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 31 Dec 2019 03:19:03 -0800 (PST)
Message-ID: <b609105543ebd272e0f72086f69634daf71ef620.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 31 Dec 2019 11:19:02 +0000
In-Reply-To: <20191230194235.1424120-1-raj.khem@gmail.com>
References: <20191230194235.1424120-1-raj.khem@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] nfs-utils: Drop unneeded patches, cmdline option overrides
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
X-List-Received-Date: Tue, 31 Dec 2019 11:19:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-12-30 at 11:42 -0800, Khem Raj wrote:
> Ensure that it can build with clang as well on the way

The commit needs to say why the patches are unneeded, its not clear to
me even after I looked.

Cheers,

Richard


