Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id C870960116
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 08:13:28 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id d140so11606777wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 00:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0MoLhYRkQqMYBnO+K0zXOvhGfZKUxlJkcCLr2RlQ4wo=;
	b=b1t/jpEtU6II1Tp8iGR+IxLGKKj8RbltOq1jPQyRcjGHhv0EJctxmxzxXZ2dwBKMOo
	1xVF+d9DkEwvhmnwCvcQ6cvGzFfteQMWgQbJlQm2WQ+7Knz5bnsV9ONamfK3ag6fuJdO
	jiWaD9jWLGoSlVii6ZrrE2DjRhoHj0RzU+kFVFJL2RuowrPnWFDH51eH7oMyNImx6+ag
	brXZRXrNVTWpY3Ue6yCpoShayF6sqt1pOvLS3lbwPbVAuYDs4t1/3VZmzsUw/OSdT8Ve
	Hdo1Qfu7tqo3StCkVMA93IAZ+L8i8IfND/qrAqL10/cCAo1v1SiJwjI1DPipNOFo7tRU
	YKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0MoLhYRkQqMYBnO+K0zXOvhGfZKUxlJkcCLr2RlQ4wo=;
	b=gki2bIVTlEjLT94SZ7n3GdNDCrJVpcALaSwVeHijUPxYUqi+5MnyRUrTN6Ro6NLmYZ
	EfNz/QPH9T06ekNRUJwX40MC9TQssyVvf+g8TlpDVFKVnRwkozLWwJ0QDf3gA3tK8hLl
	hUGv0XPpBzOCzXVLg+PwkrTJXwKFu+cdimw9PhRWW3RQMkopTe83XNUZGC8bAfIRt0m1
	X4sfmnD/wAfh/daX1a78o87Ql5gYVu9REhKn4QsowD57+dLNZcKQWNhnTC5zM+DCI5Q/
	t5JqmLtsmGvRkiWWGCgTjyQD1CApD5nLoa1Er26WkPSwn6j0je9uYG1xg6PXYkr07weg
	totg==
X-Gm-Message-State: AIkVDXLFdXIy8GZkGRevN7WEXyBO71I1qxuvn6e+2V5ys59VO1LaA0wmwWRJVqbNCeoklg==
X-Received: by 10.28.24.5 with SMTP id 5mr1881679wmy.1.1485504808408;
	Fri, 27 Jan 2017 00:13:28 -0800 (PST)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	z67sm6532400wrb.49.2017.01.27.00.13.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 00:13:27 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Fri, 27 Jan 2017 09:13:20 +0100
Message-ID: <3464392.1MJyhgMitv@crde-port-20.cahors.local>
In-Reply-To: <CABcZANku1Wz5zdouv5e1sCp8FgHRBWMQTdTQ6-mN3Bot8rg8eQ@mail.gmail.com>
References: <20170126164518.23219-1-freesilicon@gmail.com>
	<CABcZANku1Wz5zdouv5e1sCp8FgHRBWMQTdTQ6-mN3Bot8rg8eQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: conditional inclusion of login utilities
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
X-List-Received-Date: Fri, 27 Jan 2017 08:13:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On jeudi 26 janvier 2017 09:55:17 CET Christopher Larson wrote:
> Question, why not use ${PN} here?

It was done the same way in the recipe for other fragments so I made it look 
like the existing declarations.

David

