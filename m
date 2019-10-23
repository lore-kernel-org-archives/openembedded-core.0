Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 386987F8C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 21:17:17 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id s22so18717695otr.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 14:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=c9mwW4slPcvhdFQ8CFkGOVKjLzzf3aRvfmHnF8nrUgA=;
	b=YDcG1qPJXImhCnYsKEiSJICxUWTHdN6YdoLcmFViEON+F3LYtmOEJ13I1KwWKwjlJ5
	CABNVH3ggVbd2lzBAEwaZR9onO8VUuJ6FW/qolGxsaJWtbwUPFqZFXZrneTBqq571yvt
	nnL1XDhUsaja9B/E1Qg4hMuYbDBl0CwYts7pXf1Vpogfml3ek9qVwdqpM7PB3W+fiY2F
	TpTL2ImM93t5PKOQpZJSswITiGnM8LXc9vSu64v4znWKzUxFfbATTSaMUTC+/MtIinfo
	60/ptCd98uqJMvalF16RyPAycUhqMomcq5ofmCDVyBsyqGxNGd3vy61IGIzYRQkvNo5I
	F6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=c9mwW4slPcvhdFQ8CFkGOVKjLzzf3aRvfmHnF8nrUgA=;
	b=AnKKx9BXIywa3PcA7uin5Q6WS78PfA/IVBpS/odH+kpCpcfX7v2gCrWBWfnz2aNDYx
	4Wq1a4EOx7nhXFAqDRtdGl3ncZNOXjHySmT7Qc4CDS+Rk+3hbKT1zIoaUGKmPqpEo/ty
	+Z1Yf+vnuM3YXWuOfM4KNUuyxk+XjQJxQyiy3SHjGZSCwW4OdKzE8x1gDF/ddmLD9oQu
	vzxjkSU1+QlMtUp5fuu+E7Xo/6fRgjsLXCpUrzBJ3jqHVskmGzwwQK1EZr6eZn9B93/+
	dX5XWFR5bgJ1k5W8/YYlmZ4h6FA3LBi++zK+YYNavivm6Jn6XJjFQqYKq0KVbeXvgbzG
	EfTQ==
X-Gm-Message-State: APjAAAWxUbzw0sK2hxa86xiFDw5C6/lYbnOoeLAiB/PDIKMU6g3idqud
	nV78tkkrYSSMMDRnb721PXL6qYnP217VVQ==
X-Google-Smtp-Source: APXvYqzcRDFc4D8aq+Wgo5AsZGzTjyXvHr8iQ5iguWEK9RSW3zPwUPAAdWrVHAm5qSoRU9d67MO1Kg==
X-Received: by 2002:a9d:7e8e:: with SMTP id m14mr3287383otp.158.1571865438507; 
	Wed, 23 Oct 2019 14:17:18 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com.
	[209.85.167.172])
	by smtp.gmail.com with ESMTPSA id i4sm6452041otc.37.2019.10.23.14.17.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 23 Oct 2019 14:17:17 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f172.google.com with SMTP id w144so18716136oia.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 14:17:17 -0700 (PDT)
X-Received: by 2002:aca:4d8b:: with SMTP id a133mr1808809oib.140.1571865436923;
	Wed, 23 Oct 2019 14:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191023210240.27983-1-alistair.francis@wdc.com>
In-Reply-To: <20191023210240.27983-1-alistair.francis@wdc.com>
Date: Wed, 23 Oct 2019 18:17:04 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpVrkpPXTWGEoO1=idjpgGfp7UMQ=Jqnkeyh0SoJSOoVQ@mail.gmail.com>
Message-ID: <CAP9ODKpVrkpPXTWGEoO1=idjpgGfp7UMQ=Jqnkeyh0SoJSOoVQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Wed, 23 Oct 2019 21:17:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 23, 2019 at 6:07 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> From: Alistair Francis <alistair@alistair23.me>
>
> Upgrade mesa and mesa-gl to 19.2.1.
>
> The license hash change was a trivial new line removal.
>
> The glx-tls option was removed as it isn't included in the meson.build
> file. It has been replaced with 'use-elf-tls' instead.
>
> The -Dasm=false was removed as it also is no longer included.
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

