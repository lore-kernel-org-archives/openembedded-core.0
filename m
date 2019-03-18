Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E56236C4F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 23:18:19 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id e74so14715321wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 16:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=cBxfWP9JVP4L+uAdZkoU6gCelS45nhi58sQ/J4gZRPk=;
	b=Jlka4eCwo/awSZfWCGrw7us2VhfpeoxhPGuDwfG39kZ0bxCc+vFvywXhLgJVDxNSMS
	y1NTOfhm/PZCS+Jzv/O9lrR3Hx7zduMcrBIQ/A/GdDOW7arnmcG1bCtI2DIHgradkAde
	9bAkyg9fPj3I5U2nlRwYEDu9bz8Bzai9nJOtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cBxfWP9JVP4L+uAdZkoU6gCelS45nhi58sQ/J4gZRPk=;
	b=jXGK4HBksOb7Bt+dpCgNZL1qC9jcqh8JKqLciUmwwYpRgoOs87LLc/7nVaq3PmbUxA
	7Rbe8kH+WAldnFk3m88uVXXlDGgYJdYzhTmHNb7O2YQKLvFYzGnVeRL9TTSPrtNX76lZ
	jyL6tORv5ALVT4WO0W+P6s7CqJSW2dJYVr6ST1ow996k6JnsxWEkDIcgKXz7fU7eHCsf
	WLh7Zt4PlojIakb5BbFdul9ZeAphFi35HxLIDMVOXD88jGc20JmaeqyERc9EWtNJo7cU
	VVsgbiaKZIc2aMxuKNxpmrKQ5dQQ1Iwpgqn8hH2+an/Qni1wnSN9KwY3Z2AuJvXNpGYg
	s5iA==
X-Gm-Message-State: APjAAAU5uygpVvF0vg3Yemst4eTszDUMLXrQOofi5HdgJFzYmXvLst0J
	HdXtQSRwrMGia7oSiwdfhN8pbA==
X-Google-Smtp-Source: APXvYqz94B5uJztBvdf/5GWq/IJ9PwqeGBuUsiMxS0SDWgdFuInW/w2i8dXx4zIXfa5fqOK+T+9jxw==
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr939453wma.111.1552951100642; 
	Mon, 18 Mar 2019 16:18:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y140sm2079533wmd.18.2019.03.18.16.18.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Mar 2019 16:18:19 -0700 (PDT)
Message-ID: <1fb71bec0195779b572ef9870d2efbb2bea40abd.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
Date: Mon, 18 Mar 2019 23:18:18 +0000
In-Reply-To: <81AEDE73-7DD8-4F69-BF8D-BC2BF92FFC06@gmail.com>
References: <20190318133618.4022-1-otavio@ossystems.com.br>
	<166926B2-31F9-4290-A4B8-1EC6486C7357@gmail.com>
	<CAP9ODKq_bxdcX8DijCz0WFXBKMmAfxE8AhnPDhGk1t01axXnEg@mail.gmail.com>
	<81AEDE73-7DD8-4F69-BF8D-BC2BF92FFC06@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH v2] openssl: Use the c_rehash shell re-implementation for target
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
X-List-Received-Date: Mon, 18 Mar 2019 23:18:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I was asked for my views on this thread.

OE is primarily targeting embedded systems and removing a perl
dependency from target is something we do care about and a significant
win. 

As such I'm tempted to merge this patch in for that reason. The fact
we're successfully using it at rootfs time is a good sign.

I was also made aware that on target ca-certificates is currently
broken by the last change in this area and this patch does in fact fix
that again. This tells us nobody uses it that heavily on target as
nobody noticed. It also means we could do with some better tests :/.

I think the commit message could use some work but IMO this patch
probably is worth it for OE.

I also note with interest that upstream are writing a C version as that
would solve much of this debate once and for all meaning we might not
have to carry this change forever. It would be good if the new upstream
version cared about sysroot style usage...

Cheers,

Richard



