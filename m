Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4622A7BE3C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 10:29:38 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q70so16002598wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 02:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=xrRm2WjE/Y1YZHxSv6mV3+AYq2dg/JlfpyvKuxTlpps=;
	b=TNRCsK0DAJMopuhZehEEgD3uDQOmVu5lUbE/Ml3v7eNbtrM1qzX1qMTvUKzSVwxf+i
	ZBJBU0wamaMZzTmV58pnDABaIasgtg69D6xjpZ5cOgGwl0BbYDNrb7ZCy6K3Ef03qKbx
	qjzEAWuoTPDFdx7aE28EHod11rHAOuhNvYnik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xrRm2WjE/Y1YZHxSv6mV3+AYq2dg/JlfpyvKuxTlpps=;
	b=W+Q/6t9AYNeNUZgdPC+8N9odxQQrFfC7qeak3Dqa6ySXEXfseJ+J4hsVAUe0pGDqet
	kHY3mO7v0THhSee2Vb0/5YHVebSIroqYRUqKKPifEK2yHolt0nggEzZK5+PUI40abgST
	6JJ6fWbNQhfiGEDD+twdViJ0qb40cfQHVzcdrTArZMJSHbaWffDh6S084Z+6SrOflAl1
	z+Wn6H7/Jnd9M/ewvRHVZ8/4JB7/NYWrBgWCxFX/CR3Ob3DrstOB/6lsdwH7I0lk0EkK
	S8UhN1bE4YST7LTdqC2wUR1fYRXV70JRmqh+SBuGL4KVyFsko/LKM+kMOesWPyBNOr8w
	Od9w==
X-Gm-Message-State: APjAAAXm0ufJBmiE2+95gDPZI5sEX5LBSqsQ5eSavfJK/Rksw6cZy96Q
	OWssppxqvVTSQkkqvaKe3FHs0w==
X-Google-Smtp-Source: APXvYqwA4QqtzYq+9x9HvXwo+cxQ5j9hVL22CR97woWXcS9rQHxbl9aHmRhqLkQLEgJPr0KKNEBe8w==
X-Received: by 2002:a1c:2745:: with SMTP id n66mr6364701wmn.171.1572863378974; 
	Mon, 04 Nov 2019 02:29:38 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a11sm16368301wmh.40.2019.11.04.02.29.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 02:29:38 -0800 (PST)
Message-ID: <d38744bdfaf4022f13f06f7ea25cf9f06b6d4844.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Douglas Royds <douglas.royds@taitradio.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Nov 2019 10:29:36 +0000
In-Reply-To: <20191104045245.19085-1-douglas.royds@taitradio.com>
References: <20191104011638.26010-1-douglas.royds@taitradio.com>
	<20191104045245.19085-1-douglas.royds@taitradio.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] insane: file-rdeps: Readability only
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
X-List-Received-Date: Mon, 04 Nov 2019 10:29:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-11-04 at 17:52 +1300, Douglas Royds via Openembedded-core
wrote:
> Mostly just longer (and hopefully more meaningful) variable names.

"Mostly" - what else is in there?

Cheers,

Richard


