Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id BE634605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:53:51 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id pv5so29715213pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=9qqQ2572Sx0M8viobGSzosxN1IDvTY9nbh/zgXFn2ns=;
	b=J2GZwuBV1dZDJFATs5ujttBcPT0OzC30Dfn7njtg1Jjw73l7u8j/Tfa8hDR1ZOMR8R
	2RCDXqZN210MW/rysPPbxBHhUx6H2dc1OPIKGv+UfIHo4A6ANmSACPYrjepVs50uFAln
	j5OCTbA+Rk3nI4L/JXoJMAyGdNvoU+l7f9hTa52gN2Zc1UnFF1Thn8kh/OY+n2FEVA1p
	uGFfMUrM/Vjjp1Tf1RFhYcOpSfXw0sGDCoyfuMgU6im2933yHGDFlC58vEo2uYiyq9WJ
	9vTc8817EOFQCpw4CRIcLtYhpwKuoTbqKtjFyZChxW85n3tEf0L/IGDLdBE275Exz+yW
	ar4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=9qqQ2572Sx0M8viobGSzosxN1IDvTY9nbh/zgXFn2ns=;
	b=F4Q5RMUvKGkJiNGJ+9FDmgxkr0exAWEzZL+u/SjXw3mwGg3N8xNRvI0aTsPnmewGJy
	j62JJmBFm+iugHpajwNSLsvxGq6Sjp+86+Hhq7k+LbQdUpgIJFb/tJ++oJPU2jaF0kPL
	cAyxAbVKylXUXX/69xudeg7gBYmWr0PZuFVUjXqeUOZP5SNDD/62Ymy0DZj8/BaRXXuU
	IazRGgdqc4zI7Vgy1Kd4zPDUgDmr390N+a4HbuSeC4imb8KcVhFO7MM1fq3yHGiR9jtN
	NVjbH3zShGG+Y6gBubZzVxir0C8yvwP08zX3o6A/w6fFrRf/xrb9E71yKZR45IGd3kwx
	JMyQ==
X-Gm-Message-State: ALoCoQlUyIZv8Rwx7DwAvmfOYHz+ceoXo3OBuaYkXyoDyDF37agUGLdySFVjupqCs8mKRmQh1qlxHXCu8pM22ts2DKj8BJHywA==
X-Received: by 10.66.118.135 with SMTP id km7mr9257123pab.159.1452804832556;
	Thu, 14 Jan 2016 12:53:52 -0800 (PST)
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com.
	[209.85.192.171]) by smtp.gmail.com with ESMTPSA id
	p66sm11249159pfi.34.2016.01.14.12.53.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jan 2016 12:53:50 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f171.google.com with SMTP id q63so108594409pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:53:50 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.74.135 with SMTP id c7mr9151584pfj.129.1452804830249;
	Thu, 14 Jan 2016 12:53:50 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Thu, 14 Jan 2016 12:53:50 -0800 (PST)
In-Reply-To: <1452741432-10746-1-git-send-email-marex@denx.de>
References: <1452741432-10746-1-git-send-email-marex@denx.de>
Date: Thu, 14 Jan 2016 18:53:50 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqezbmY2vOX2fkdjC=SSPstRBMx4HhcE1jvzzG5SzH01g@mail.gmail.com>
Message-ID: <CAP9ODKqezbmY2vOX2fkdjC=SSPstRBMx4HhcE1jvzzG5SzH01g@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Tom Rini <trini@konsulko.com>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Thu, 14 Jan 2016 20:53:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 14, 2016 at 1:17 AM, Marek Vasut <marex@denx.de> wrote:
> Upgrade U-Boot to latest version and drop upstreamed patches.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

