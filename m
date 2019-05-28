Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id E788E7D3E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 00:57:14 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id x187so7169367ybc.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 17:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RuDXAc3Z/0cn2BZ3Y6elK0/30IPQWjl0MfwsZz94JaA=;
	b=ZolQ84+PYl7KlGDfQaYo8WNVmt47M0sLHZcFdA2CRC4IjTnVzXpDWt6y0Rn/QtlpVe
	qMMvZ+Ee+cnc0AGgGQUMGn4pm9YizNyZS4haJOlrssezNDYo71B4X/010nZ3n7poLAu0
	ymTyku/P/9xPA0cKZ4XQn+G77rmgxoS6zNBPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RuDXAc3Z/0cn2BZ3Y6elK0/30IPQWjl0MfwsZz94JaA=;
	b=hATLrZl98S5PwlndmMKMAYQBpPR0oBFaSrszOq1sACRrZL/6a21kKqjxUwJSS26p51
	Sz/h4eNfZVaDUq3b/ffdw/fs5qqjj7ZqAzkyDxYEd/KrH/qat0UIbwLN6h3Irz3qC+5U
	JrMypn5PDghI/Ws1ZHC16kJDx8PO81JH7lY1xPpVbeTPzZfpm2D8aH/s2PORiv6WLMex
	Ev3XwhSwODviQ7MG+ZmUW3BaTjKGTLnWkWH/oZZI4GhVaaid63YfMvb/tSvAlp+cLcr2
	PnGumsbB4Yl9UD+FCPnEO8WsuztKQkOnDQ+2QNoosZJKcP9s6fEcJxM2Rc8IbpGP0gCc
	2L2g==
X-Gm-Message-State: APjAAAUJ53qidIbrWgynEOHEcPBhOypjNtLz+5RBlYcJMIFh+ODY0X8+
	3AjuZYAQWiPrmKZWgRZYXkhTXuaKK+hBiw==
X-Google-Smtp-Source: APXvYqyv7mh2eaxAJjVHPORN4Govb0K1tsckSPdkbIAb7wkIUMRLoWAMm/h9ESU8FzA63bLuZJaPAw==
X-Received: by 2002:a25:9704:: with SMTP id d4mr19703950ybo.312.1559005035719; 
	Mon, 27 May 2019 17:57:15 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1401-82DE-61F9-B92F-B29B-14E2.dyn6.twc.com.
	[2606:a000:1401:82de:61f9:b92f:b29b:14e2])
	by smtp.gmail.com with ESMTPSA id
	185sm3247667ywn.12.2019.05.27.17.57.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 May 2019 17:57:15 -0700 (PDT)
Date: Mon, 27 May 2019 20:57:13 -0400
From: Tom Rini <trini@konsulko.com>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190528005713.GI20781@bill-the-cat>
References: <20190527203919.26326-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20190527203919.26326-1-bunk@stusta.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] vim: Move PACKAGECONFIG[gtkgui] from GTK 2 to GTK 3
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
X-List-Received-Date: Tue, 28 May 2019 00:57:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 27, 2019 at 11:39:17PM +0300, Adrian Bunk wrote:

> Signed-off-by: Adrian Bunk <bunk@stusta.de>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

