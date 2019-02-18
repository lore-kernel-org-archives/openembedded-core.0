Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id C09A27C87D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 13:42:47 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id i20so28366894otl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 05:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=hN6YYI/jnogz/ZJG3HiCLrs+OOYi4kLeBRUDKMFta5c=;
	b=e21jJrRsK4sfMA58IHBTsr9HxPrQwfD2huFCU6znjp3X4urmAvkabbXH/nLOyHNqUL
	1+8cEVTXZAIwe80PUsdJeL/UV7xQvvJA82gCxXUcbvsHXUOlFED1dWe+ErLmCzWyOKIf
	kCfjbNRSJ9njnEUQPrfEpfwfem/wf60E99GZi2UVeQUV7fsuy6+W9/Y8/0mOf+iIjhzI
	gl9OP/Fm+lArvvcM/vnQMwcBjYHzmrkdt9L1LOie6+wEA71h4BOX04ULMq0sr1z57RYi
	i5D+gqAGujxf4wHfEgsyxLLfWhih8f0Pg4q7b0ANaTSvva/SRrFUaCzCCGmj3gxJLzAv
	0nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=hN6YYI/jnogz/ZJG3HiCLrs+OOYi4kLeBRUDKMFta5c=;
	b=SNK9hAwmCtLu4YlcT9t5xjGfwq2AVd+JVrBe9DzUxHcxdzjNRlJF1pz7oPYzPNEf03
	JA1Cegny6ydsu5AAgbRnvvXKQd+E2qAN94LW+dC8x9jIB8oTpyFMaCDrZZm98RN/3ntq
	c4TdenHgkw9jTrso6g4xDZIlRrZIIUwuVBaU1ajUMzSimiDotuoDu7I9jfFJkJ16N/Ig
	eQRBefy7FussXjEu8Nt1tEUsfenVobfvzX2xn4IcBdVQAAUamRvntXGy7VTsQ2TPya82
	ykprZ0LhmCTnZbtnI9IqLHbqiln2LFsaYFmjNa4MQhFDJ3XBz2nXyfAkdQpKY+vwjIeD
	mR1g==
X-Gm-Message-State: AHQUAuZetMTeXTAN5aDHCLmi5kgD0sBTJGODzZHfroe0ZwC7NC6h9tZB
	o7f9kYJ7qZUaXwJPexK5cxy4+qjhBVauhg==
X-Google-Smtp-Source: AHgI3IYylTm4mRKzMjU5NYX2KXs39FXNAnxGPi1Ch4Qk1dvPNO+A1B1EJNWrhJNwWLmVBZIWFIbOtg==
X-Received: by 2002:aca:53c2:: with SMTP id h185mr14745595oib.87.1550497368457;
	Mon, 18 Feb 2019 05:42:48 -0800 (PST)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com.
	[209.85.210.50])
	by smtp.gmail.com with ESMTPSA id q5sm895479otf.73.2019.02.18.05.42.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 05:42:47 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f50.google.com with SMTP id t7so11892489otk.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 05:42:47 -0800 (PST)
X-Received: by 2002:a9d:1b2c:: with SMTP id l41mr14004061otl.1.1550497367114; 
	Mon, 18 Feb 2019 05:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20190218132948.27668-1-fabio.berton@ossystems.com.br>
	<20190218132948.27668-3-fabio.berton@ossystems.com.br>
In-Reply-To: <20190218132948.27668-3-fabio.berton@ossystems.com.br>
Date: Mon, 18 Feb 2019 10:42:35 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpRw9GvmEnNLm+bO35GYUP7usEhM6ikUhR7vxUjSoOAEA@mail.gmail.com>
Message-ID: <CAP9ODKpRw9GvmEnNLm+bO35GYUP7usEhM6ikUhR7vxUjSoOAEA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] mesa: Add opengl to native and nativesdk PACKAGECONFIG
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
X-List-Received-Date: Mon, 18 Feb 2019 13:42:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 18, 2019 at 10:30 AM Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
>
> Allow the use of opengl for native and nativesdk packages.
>
> Based on https://patchwork.openembedded.org/patch/158748/
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

