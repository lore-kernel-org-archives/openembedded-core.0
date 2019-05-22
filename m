Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6AAFE7E3B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 11:10:33 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w13so1789857wru.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 04:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=xR45wl9YdQHHafIyaXfX7VK2004k9ZMhjAnGXWCPw6k=;
	b=Jj3cXl4uPJ36AJ6NKiglEkMTG4/cg/rKfiX5817dFXJ3t+Sq4zqI99hd9cP8xDFRlX
	tJPZTnz+2NHgGZMk7bTQa+PZDnGsrcqTdAUJr8Qpf8JhNWgHhqEg/5CNErlzwoy9Ty2z
	7x+uT+S0+ALaTOjkkMQ052B7h3ZItxk5uZyrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xR45wl9YdQHHafIyaXfX7VK2004k9ZMhjAnGXWCPw6k=;
	b=qLlsmy8mmAWDo6uEuxunRwrYQ0NyqfetfsSp7kFVK5t23LSyisPxPcAo5utjh/mh5S
	J371EAryuArYedQQQDZwMZBJz4YoUi8eCdNao3NlRo8Xf1cs/8QJumk03CLibmy0qofV
	YPxlJg3fcb3mmp78puuoH1k30gnRM4WUsLqc9U8ziR3r6nCF+ozLdjKs4FMTbb9Vtsvq
	J+D+7gJqd2wtIrrnY6vGOIGpSHdOrF6FqrS5BasrxwnQRHuKAVLMG8zt5sYYXW8M9Jk+
	TChj10DW16NklbkmbAhjYPSv5GIGNj+laZZzVxEXRXxZePMDkUwZ8IT7hCQMcWtXB+Ur
	H68w==
X-Gm-Message-State: APjAAAWc8jagoKRFqkRSEdb1uHQlY5KcCV592S25gSqlJ4+jUd136FFd
	vykvaZTLgFxnL0jdEywM+72qXg==
X-Google-Smtp-Source: APXvYqwbcAVyDNnqHdBLNr9hfrJI/ezTvx9AowXybtXwgD+e0cXMZIaq+Na1A6gcfiTx0L7tx+8Z3A==
X-Received: by 2002:a05:6000:1284:: with SMTP id
	f4mr42610567wrx.325.1558523434146; 
	Wed, 22 May 2019 04:10:34 -0700 (PDT)
Received: from hex ([85.255.234.137]) by smtp.gmail.com with ESMTPSA id
	o6sm51922047wrh.55.2019.05.22.04.10.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 04:10:33 -0700 (PDT)
Message-ID: <f3fecc483c5b64b3f2743cee80ebad3c2f798548.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 12:10:29 +0100
In-Reply-To: <20190522013228.7591-1-raj.khem@gmail.com>
References: <20190522013228.7591-1-raj.khem@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] musl-obstack: Add recipe
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
X-List-Received-Date: Wed, 22 May 2019 11:10:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-21 at 18:32 -0700, Khem Raj wrote:
> obstacks from GNUlib is used in some OE-Core packages e.g. elfutils
> and other packages outside OE-Core, this recipe helps provide this
> functionality standalone on musl systems, and helps in getting full
> versions of dependent packages
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl-obstack.bb | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta/recipes-core/musl/musl-obstack.bb

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/623

Cheers,

Richard


