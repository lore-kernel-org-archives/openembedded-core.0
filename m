Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6AC7C8ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 21:17:55 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z84so7853653wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 13:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=smULf8kJybjO/fb/VyY6lmSEj0AGGNZl/aXVKffY1RU=;
	b=RxClWPcDA7UodSim3cKma7OAPcXyqhf2Q4bE7+dX3OeSncF75YaRVSM5AomyOhUqs/
	BUe6aK7jRTzBANY5b7Nhzfb+kAXVO7BSVn3o1lu4ny+wVu4ETtUuyjVvWDps5PYP0QZp
	gpRqca+Xdq29/xYo3X4OTDA4vm6eFHB5O5mao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=smULf8kJybjO/fb/VyY6lmSEj0AGGNZl/aXVKffY1RU=;
	b=Q2h3Bx4JDy0TEgROmwYJisotafJxOw1OEh6hIitDPvGtY6iF6jdW1foqhAdGbBsT9X
	JoZw860U3gFi2y9bzkJWWvIpjllbhkVIcV7Z2y/sj3XHKsYOdGw/f+stL+2Vh3Bo9i0n
	9rdUePOoQ4pyzmy40m5xN9YZPXulEOfNKs9H1dCLH+q2jxUpDDXm1M7Jz8F1HJfz82iG
	ce4aeCRXYyi+fYa2fTFmrBKp0Ew/nJGEHzPWH8tiPKtpye0be4iYc2GkndDPh48lkMOY
	ADuq3Rsp9f3QSd2GxPt1U6WB5ss6YHP+YIabNILgU2Ju47E5jqSo/0WZKDRpkvz8kUYq
	Oy3w==
X-Gm-Message-State: AHQUAuai1tJAPgAZ/mNEsATkXWzF+Yq4NI19GbugwwIs3wXpy8HTSuYE
	u59Lj1558PR/8pl4TlkRi1c0qg==
X-Google-Smtp-Source: AHgI3IZCG+mzXV7TejOTegJ+5elXoRBpYJr6HnafMwM9WnLp3eWw1i1/HDMJmQdoqvXJ7mLPF+OT4A==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr7571021wmb.136.1550697476078; 
	Wed, 20 Feb 2019 13:17:56 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id c1sm17753025wrw.7.2019.02.20.13.17.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 20 Feb 2019 13:17:55 -0800 (PST)
Message-ID: <4ee185d0f9115c57389a401b4caec53810c75afb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Feb 2019 21:17:54 +0000
In-Reply-To: <CAMKF1srTw-PdeNHswDubfXSAnuQ6-1KvSS7QUL94y-Phfy=XPQ@mail.gmail.com>
References: <20190219000849.6177-1-richard.purdie@linuxfoundation.org>
	<20190219000849.6177-3-richard.purdie@linuxfoundation.org>
	<CAMKF1sqKePayLE9-WXUe5Q9uv2qqFY7BRzfw67PdPbfDLAPijw@mail.gmail.com>
	<CAMKF1sp85fu5chPQfwL9TRQ+WHHrzddAj9FLJxQEd9VybW4mjg@mail.gmail.com>
	<CAMKF1srTw-PdeNHswDubfXSAnuQ6-1KvSS7QUL94y-Phfy=XPQ@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] gtk+3: upgrade 3.24.1 -> 3.24.5
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
X-List-Received-Date: Wed, 20 Feb 2019 21:17:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-02-20 at 10:57 -0800, Khem Raj wrote:
> On Wed, Feb 20, 2019 at 10:56 AM Khem Raj <raj.khem@gmail.com> wrote:
> > This has been applied to master but here is another failure on
> > musl/x86
> 
> I suspect this happens with gold linker and not really musl specific.

Sorry, there were a number of gtk+ failures from the meson patches and
I'd assumed this was one of them. I'd seen green builds for gtk+ on the
autobuilder so I'd assumed we were good to merge.

We may want to consider a build using gold on the autobuilder to help
catch problems like this...

Cheers,

Richard


