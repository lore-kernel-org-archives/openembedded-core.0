Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 513447519B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jun 2018 10:11:17 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id h6-v6so18566060otj.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2018 03:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uM/JN+aPlJV4Rbgf5HxVY9Q6/VYATixtbRRoGU4dgiM=;
	b=a0jv586d3hYhbluaqiCATd9St3Dmbae+qmSRly7+fyQwbufYu4u+KAWi4XUviti4Es
	36OI1XYWIwbu2BnZ7x04niFgO438v9qejP1Oy7LWcsEtMkDW07+E0H/jbk6KddmoC6GV
	e3IfgZeSK1ZwigzqUwoBOJ8FtHL+UbTqgQ2NAL3ktlCoA5UWBz/CnGJzneRdMhxeRTR2
	T+DIf7tSoqNu6TBRocgTZ7mvFQuykb4USVzWHjGzvZwMFk6E0uyy+ifer4fE3KZwxuOi
	jt17HYazKYPCnjbtYD/eLepGp5N0dKnMXimgvJ28kKKBokOiaSFymPDXIL4lzAwiPK4P
	Yydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uM/JN+aPlJV4Rbgf5HxVY9Q6/VYATixtbRRoGU4dgiM=;
	b=tatak/FG9Of4e53l71tf5S0w6SyXE8Hd9hVLT5emTasYuB2G/iUqaKWtixK2Kj11n0
	qfr0KjviaIKSbS1/x5Uv2Hc0ejbeA118BdJnEbjmgyOa6lU/iHz33vd+SjIi7QAD7h1e
	dDTArBnCGFDuWUqZR4wtrd1caOmniYhnC5zp/cYkOD2v4zElK8WHsNJlN3FtPtmMzsCn
	d+axkFqB0eKyKAliTgGkExJAz0946pbzYTHiQDvaG3kmKCB1p+59IS1rKF+ZiSaAbS/9
	I6629CnqJ2YsrAvUuMd2snk6ZprISzGGiFGkKDqco6hSSEUxuVhKRzmkJAeKQsgGS9Vk
	owMQ==
X-Gm-Message-State: APt69E3/e7d+EcQ/w1MJEUiKUMrzk8QXTXbNS74N6YqZlLVEefekd7d0
	nO6NF6KEz7+wPqyJARSVfBJfDUVu5PdzebXq38A=
X-Google-Smtp-Source: ADUXVKK9HJA8R61u9Dg/RH5VpGwjQH/BiUwxCed/+lsup990PpkKUkD3MEM0URYaOrxMFAvHD+0HYGWeJO48LhHiuA0=
X-Received: by 2002:a9d:cd:: with SMTP id 13-v6mr5897698otk.155.1528539078388; 
	Sat, 09 Jun 2018 03:11:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Sat, 9 Jun 2018 03:11:17 -0700 (PDT)
In-Reply-To: <toeefhhyt86.fsf@twin.sascha.silbe.org>
References: <20180608161841.10108-1-x-yo17@se-silbe.de>
	<CANNYZj_V7knzM_+3J+YnHNyG+mbGmkzYBM_GoxTK1jKoYx9UGw@mail.gmail.com>
	<toeh8mdywfy.fsf@twin.sascha.silbe.org>
	<CANNYZj9uwH9erkgu8Of5xq6PTLfTqdTdnUJtqMbyqgJa1ONKzA@mail.gmail.com>
	<toeefhhyt86.fsf@twin.sascha.silbe.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 9 Jun 2018 13:11:17 +0300
Message-ID: <CANNYZj894Yin6tnTSW1Mw3YdcLkX9CdSBcs8kOo1iubi+LmHEA@mail.gmail.com>
To: Sascha Silbe <x-yo17@se-silbe.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gobject-introspection: relocate typelib repository for native builds
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
X-List-Received-Date: Sat, 09 Jun 2018 10:11:17 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-08 22:27 GMT+03:00 Sascha Silbe <x-yo17@se-silbe.de>:
> We have some Python modules that we are extracting some information from
> and generating documentation for at build time; both times the modules
> get imported. We don't need GLib to actually work; it only needs to be
> importable. Fortunately no other typelib is used by the code.

Thanks for explanation. The patch is fine then and can be added to
oe-core - so that if later g-i needs to be fully supported on the
native side, this part would be already sorted. For now though it's
not 'officially' working.

Alex

