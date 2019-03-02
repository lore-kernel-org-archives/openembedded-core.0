Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id DC3A67CCC3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 17:00:19 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g12so1057359wrm.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 09:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=td4T/NHaXYAGiZwEzWbUwHZUkVwqyvViCjWcLwHCQV4=;
	b=g3STx6x5kU7Vpo5xWWuOEApxtW/XAmIVFWAEjYzk1i2r00Je8iE1oix/RQEoZh3Qcw
	Q7KhmTCw/SzSPYLV7NAgGNsETBbFNJlReNX8ZIfhnpdD688SU79/1YooU8UgzyZ7iGZS
	g77qPYpNDj92UbBs8bquWhWRueyHqxRRZFoPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=td4T/NHaXYAGiZwEzWbUwHZUkVwqyvViCjWcLwHCQV4=;
	b=MWVtfGaTtnG0k9CHEsArM6kAI4SruCHMPZ01ShIVdfwMJen0PEfHxtIjOar+Z2hdEE
	T76O6Tdk31xHnqLYUsRqHHqRExWnTTDLEaSQElpqH9lIPmEnK563+2fqyKdPUuBBNwpZ
	nKCnHhdR0VjFJecVG8Arlivm2R26dPZtZwUrH75ZwOT17vOfaiyQ0Kau1MeGj+9/FJsQ
	kvRmGEpJ0/1rddF5MCvE8vpwXvmx8SkXYo25lloSCnm/JmLF3SjQsAI4K7mNPi2pKiYg
	KKleULLI//FfEEtAwfs3PH+vEZLnGj/N78sJU6Xu/QfyylBEgEdRd4kYSTcoyILAj0ch
	tsjA==
X-Gm-Message-State: APjAAAWRhtEYM2s0E9ignHyAhZHQXN11NC51990UwajsgbFKsamLYZiT
	MLw6WgcBkOQqfnMAudKa9YTxL6WNIcM=
X-Google-Smtp-Source: APXvYqx1d4lew/NJ7S67UJ+FeyNq9kWivxtZzGPPmr31MOEOWL8dPLqg5wReM1OyA8Kn85zXbN4REw==
X-Received: by 2002:adf:e48a:: with SMTP id i10mr7614943wrm.257.1551546020627; 
	Sat, 02 Mar 2019 09:00:20 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id n9sm1063946wmi.33.2019.03.02.09.00.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 02 Mar 2019 09:00:19 -0800 (PST)
Message-ID: <e44ab9ad197708fae61fefb6b235e62ae59f0dcb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>, openembedded-core@lists.openembedded.org
Date: Sat, 02 Mar 2019 17:00:18 +0000
In-Reply-To: <1551479212-28944-3-git-send-email-trini@konsulko.com>
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
	<1551479212-28944-3-git-send-email-trini@konsulko.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] inetutils: Import version 1.9.4
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
X-List-Received-Date: Sat, 02 Mar 2019 17:00:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-03-01 at 17:26 -0500, Tom Rini wrote:
> In order to have more robust stand-alone network tools in oe-core,
> bring
> in vim from meta-openembedded/meta-networking.  This imports the
> recipes
> as of git commit:
> commit 408204073e6bdcd8ac586e05d5b75213417673f2
> Author: Martin Jansa <martin.jansa@gmail.com>
> Date:   Thu Aug 16 20:39:15 2018 +0000
> 
>     inetutils: fix build with glibc-2.28
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>

vim and inetutils will need entries in maintainers.inc else we'll see
selftest failures.

Cheers,

Richard


