Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C87757E07D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 08:19:30 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id o189so11029574wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 01:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=99+BBvxgkyVlbjw6ezzeYDUbZRNyede3BPWFgZsgnIg=;
	b=An9+TBBqus0iNpquBJ3OhqyGVj8oxtkWEy7aja/Nd/3M9/1K2akDMcTHY2Jg/hgr+C
	VjgKCdTGZn01oZFqj6Lz95s2VaQRS237+tB971BlEl3iqAtcjnqe+bIAXodnbZy5bnWh
	S6p8rmOVy7u3iXzkuEfw+CztfIbfY2OeaBzoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=99+BBvxgkyVlbjw6ezzeYDUbZRNyede3BPWFgZsgnIg=;
	b=DzWL0ZZZq9eqnjvTSvE8zJX3bXcBDAN5jPnErSbPokmCmTy2mpG7R/J9jTOfKfcOD9
	fKehZWAQ7ePQisbD0r1mAtvJqsuPbPinl61CmLCXbOcROTaKfsgMnBYHKP3+hOsHMAZj
	opuY7nHdnBEob0Yq5ygaoL+NFykIe5A01UnYMtS9yT94+CMWckwXTJictxREr3N+6Hph
	oXJY44PlFZzx6sHrNzYlGnmz0JHUIJnqWQmkRgWAXCcQ8Q4a5U0JcEUEgma/OEYjys4+
	BV9jA4jmSPgakXk/qQwc9NFgLLHE7NYRZ8kVJkoDyKaZ7tY82f6oKRpcW7NP9Lxk9Je9
	soBA==
X-Gm-Message-State: APjAAAUOMjqjaJg70cO6rWpJ5tSPDrCpGtz7XtX8OaawAfQNizz9ro7k
	mo/YvubzFkAMox9aKgMjBof9pg==
X-Google-Smtp-Source: APXvYqw6JiymytBkWw5czsXAtZj35WdhkuVWl50befKbHWeWO3Ufmh2BPNJAR/E3SDSGHezi9yNpVw==
X-Received: by 2002:a1c:a745:: with SMTP id q66mr3159805wme.83.1557649171545; 
	Sun, 12 May 2019 01:19:31 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o130sm8398779wmo.43.2019.05.12.01.19.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 12 May 2019 01:19:30 -0700 (PDT)
Message-ID: <c45fbe383ed7c72f81e30f0942ee441a628300a0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Sun, 12 May 2019 09:19:30 +0100
In-Reply-To: <CAPbeDCmoxDEw6-Ke_eAQ2Rf1FszXavkj0qk08NJfq2jZy2rXHQ@mail.gmail.com>
References: <20190204031153.1348-1-jacob.kroon@gmail.com>
	<CAPbeDCmoxDEw6-Ke_eAQ2Rf1FszXavkj0qk08NJfq2jZy2rXHQ@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] base-passwd: Add kvm group
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
X-List-Received-Date: Sun, 12 May 2019 08:19:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-05-11 at 09:21 +0200, Jacob Kroon wrote:
> This patch hasn't made it into master yet, I guess frowned upon for
> adding yet another patch(?).
> I can merge the 3 patches that add missing groups into one patch if
> that helps ?

I'll queue it as you're right we should add it. Merging those three
into one patch sounds good too though.

Cheers,

Richard


