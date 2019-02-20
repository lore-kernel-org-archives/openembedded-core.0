Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6910760248
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 18:15:23 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id t7so25351162otk.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 10:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=piTchM+w2Hpnij3Q2UdZfLw47GZZWm7eS6LnVu/OiUI=;
	b=YkJI+jXVKg8IbZBIyFAVipmtt4k6ns7ENfxx4XIaYz/jZWa1Mxa7VSc8fR7KdsC1Ma
	hEHvnjl3UKaMF7c7YDIJg9sXW+V5hpcKd3nbcdfCaXiNKzbASX10xr4808TVOZzmY8bT
	e48gh+ereOtilFbM6JEbd11Egxf8lEc95cgXYIcq9D/2PB8dUO7r7IyZZREAoWMW0vfn
	DSllJrx7PPK50TccxXQGcO9pSDOa6pnQ6qGVoxDvpdXQ31QHxblFwuc8JjJ0cFSkGF6n
	wYa9bTF3Niw7N89ekk5EoXT1h+50geKSJc1vfeDF+RTWFzuODNBytijGQb8UKD9H2S5S
	+dXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=piTchM+w2Hpnij3Q2UdZfLw47GZZWm7eS6LnVu/OiUI=;
	b=H62NSVZ+54QvfyU0WHIuVMhLAzdjTGIu6wj4O4yq5l1wa/XVCxJ5pzgEHfPzJ8bq6A
	SAH+BWsaqKQGbmOS8kX1ivEvaJc5+6Wd6cxX1XvJTy9Qs97UzAsD3/z+5DaJSkhb5MIS
	H919t0010jerXHzsnTLzHXTEmPIGlmh6Ao2HQXeXgnDE1U09h7FtY+EY9pFhh41ofDY7
	Gl5oRnZrbpdYQ7G2nHmNpwJxb+oaMcO7B9IlpmkgOsFcauG6xJdhapNRU4BzxkWPMnhk
	ldqjEIglmUhGgvTO/iw1g8AFVBuB96c6wVW7utmHJ9gqn065xAY2j4EOWDgNKMwKI8IN
	HiVA==
X-Gm-Message-State: AHQUAub8nXJTolCft53o4Uy6Cw/8xfqgrFAOFi1u3E+c5XBxHzDAkxQO
	+xTrkFOMyI6G2eUuoT0I2udKQUlDvMXzYXsWx94=
X-Google-Smtp-Source: AHgI3IY8ESpTJuiVz9hkxVTNa1q2qw3OyLgAg/N2ukizfQ2Ui692v/tDfoaIV+9xSTMoq5hr8NJgPJwWd53sQt9I/Zw=
X-Received: by 2002:aca:6206:: with SMTP id w6mr6903153oib.132.1550686523804; 
	Wed, 20 Feb 2019 10:15:23 -0800 (PST)
MIME-Version: 1.0
References: <20190220135043.25837-1-alex.kanavin@gmail.com>
	<7e7bf60a91548dc0373fd53b32baa28f163cb86a.camel@linuxfoundation.org>
In-Reply-To: <7e7bf60a91548dc0373fd53b32baa28f163cb86a.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Feb 2019 19:15:11 +0100
Message-ID: <CANNYZj9PO4jPdkesW0t3hRUAx7Jo=m01G7a67EUChRjLfUS5sA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] pango: convert from autotools to meson
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
X-List-Received-Date: Wed, 20 Feb 2019 18:15:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Feb 2019 at 17:43, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> and I think we have a race:
>
> http://errors.yoctoproject.org/Errors/Details/229403/

Somehow this link won't open here, but I think the race is this one?
https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/310/steps/7/logs/step1b

Alex

