Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 862347FBFC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 22:16:55 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id v69so15111265ili.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 14:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bARlMQP0Rnl4E1mEEiEShc7khXZb9Kejk3/a7IUM1CI=;
	b=pgm+2BF3SQPUuxN4OOGIhSAC4Ao3K2e20lG6rHqE3ANqjps8Y+8X4S1EsRSal54ShR
	EF9+Be3lyu1ipiGaa6X8MGxuBASnS10y0/aruvnmGjSYiQjpq+ffdP0Bj7+yiItKelBz
	4a35+kbvdloKrYO1DrIsA2WNQT05gkqLRgHhhnZm4B9gs+BA3n1DEsnFMq3tIjXa6a/N
	NHH6kRzxNb204Voogi0fJym+STS/q47lm58RWeZh96HN0LOWISZbD95iGhK9eQv8E7Kv
	aY/bIJhPoYNEpnGiZ7lO1D1xAJ2uGdmGiGj2uBVI5b3RuiHAbF/27iP/8tPHg9dgfgyd
	Zxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bARlMQP0Rnl4E1mEEiEShc7khXZb9Kejk3/a7IUM1CI=;
	b=XDzx8e6ou6bp76PxLZJsJLibUMu6xV6lVJaqNP9s1AFYsmyUo4Umsln+lqHeGHGn6r
	oRrgm/5BumvEgt0zDQJnvWFR7lzDMmn7ggiqpC9a545tvXQBWSwWCaZd9p65qjqxUOxH
	EMLpRsa53pSD9MBwUGvuRHTDrm+io5S6PIql7RWpLQzEXe4rOKKUrOCwJ2Ni9hsiTmq0
	nIlzIbV7Dt1gzpqEllDRwiYMiAhTQZ6fdOr+OOygy8e+zz/UWnJwd6Ih7X3gz8UZseWo
	M14i/6WMKKWL6GancHDSfHwKJFf41X1GqH6vsJMeE3g8pIPbVn6JiUeBs8duRcdtvga3
	Su9A==
X-Gm-Message-State: APjAAAVsB5sFypYk1kyzeXt8p8FZ0Y8ME9LYOat/lVSQxyNWfViEnsG0
	6XVQQp5H+Uo/eiKn5Ho06klpU8f3WNO8VlJY8MBOAm/3
X-Google-Smtp-Source: APXvYqzXGaiIEQ6CpOoH4bH8EX7xlRB7Y1+rVbbu2ZhWdBsDhXMq2GGuDnv1QzyAXAyLq1LMGKphVD5T9SbemdU+YbY=
X-Received: by 2002:a92:cb09:: with SMTP id s9mr28875420ilo.224.1577139416692; 
	Mon, 23 Dec 2019 14:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20191223211331.30855-1-alexandre.bard@netmodule.com>
In-Reply-To: <20191223211331.30855-1-alexandre.bard@netmodule.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 23 Dec 2019 23:16:45 +0100
Message-ID: <CALbNGRRZ8-FAC0XRTo7sOBR+_C62_taDoU6UVxtwBSgng7e0+w@mail.gmail.com>
To: Alexandre Bard <Alexandre.Bard@netmodule.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkmanager: Add missing RDEPENDS to dnsmasq
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
X-List-Received-Date: Mon, 23 Dec 2019 22:16:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 23, 2019 at 10:14 PM Alexandre Bard
<Alexandre.Bard@netmodule.com> wrote:
>
> ---
>  .../networkmanager/networkmanager_1.18.4.bb                     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Wrong mailing list. It should be send to
openembedded-devel@lists.openembedded.org

Andreas

