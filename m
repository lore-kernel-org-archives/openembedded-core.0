Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D96C17902F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 20:00:41 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g33-v6so3912526wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 13:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NvUvQnHzQAsCKB/hzt/vUnoB6a7bthe/3SxKcynteEo=;
	b=HZ6/1qsfGn7ObdonEi/u6gxtZHubW/dLYZyP4jjXBGRlNLqJ0H/FoCSZhP33n4UYpv
	4qLIVOJsdJcsxI3pI1QbYmW/Bi1IUVYYasMdrE6d/H3RUE/3TOzkUogcUH1v9u98HPw9
	9TxbQLQLtwBL7t9b9Ayez++BKC5/ngMr761io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NvUvQnHzQAsCKB/hzt/vUnoB6a7bthe/3SxKcynteEo=;
	b=LeXsrF+f8iooAkiSaSDwqu4QyQSiw9Eyw3X1u0y1e5ELye5xb8CH4N1PHF+4+ztO1F
	4LNP5jhmuP/Uf8pwyDuXheJ9yhlwxWCveiaTsJXKl99+Dby83VBaVEQ7lKQkKIu+KscF
	jnS+0oKDgsXCDJrkjU1a9SeFg9M6m2x+IoKHCWnU3s+Jm/Yso5Oy04612P2HA+Lv6p1v
	rofw7+QP9mg5jUloasZEeYOvOzwguyvovb8YYeJUmxgr0J+7tKiFyGFEUK9/FFoMtAed
	eT0jmL+qxdQxN4gDjp0FrxjP+r1cHbwGUFfaPFfqXc2n6+dAG3AG7VNehiiufU2tQJmV
	DkhQ==
X-Gm-Message-State: APzg51B661r3/fiA3wMar2HPDrziFIGIL70zqTqylQFBMHbwWHA+xQd+
	xhFhCLAJcYkIdzZNriy1A/XDyw==
X-Google-Smtp-Source: ANB0VdYhj3hhJLXIQ2BTZFbbBtihsyKmN4bxmmvDIN1h6X/U/cO7tkx6YIOltKlWW3Ph/7vYnRqZbw==
X-Received: by 2002:adf:b609:: with SMTP id f9-v6mr1860915wre.14.1534795242439;
	Mon, 20 Aug 2018 13:00:42 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e10-v6sm452421wmh.19.2018.08.20.13.00.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 Aug 2018 13:00:41 -0700 (PDT)
Message-ID: <0cec752f4557297ae78c23b26d89744667e40b07.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2018 21:00:40 +0100
In-Reply-To: <CAPybu_0OGj5z+qHP0f=s30cEOAo6nryJm2x=+S2JLAV_4HWtjw@mail.gmail.com>
References: <CAPybu_0OGj5z+qHP0f=s30cEOAo6nryJm2x=+S2JLAV_4HWtjw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: x86_64: ldd does not work (not a dynamic executable)
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
X-List-Received-Date: Mon, 20 Aug 2018 20:00:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-08-20 at 12:06 +0200, Ricardo Ribalda Delgado wrote:
> Hi
> 
> I think that I found a bug with ldd on sumo. Whenever I try to use it
> on the target with an dynamic binary, it returns:
> 
> root@qt5122:~# ldd ./qtec_webcam
> not a dynamic executable
> 
> 
> The reason seems to be that it cannot find the dynamic linker:
> 
> It is searching for:
> RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
> /libx32/ld-linux-x32.so.2"
> 
> whith ldd being at:
> /lib/ld-linux-x86-64.so.2

We allow base_libdir to be configured and default to /lib even on
x64_64. ldd should really be honouring base_libdir so that sounds like
a bit but it would be ours as upstream will just want to conform to the
architecture standard which is lib64.

Cheers,

Richard

