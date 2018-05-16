Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id B92C171A9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 22:00:01 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id t1-v6so2724342ott.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 15:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=8UbhnWa6lo7+Q3yQDPA1oFe8xGU5v43EfWMnV6QyU+k=;
	b=aAYlK+wjjSRazDa8hm/meoaO3dIVqCjK1kxGr4rwlcxT7MykBFR281R6LkoBS2ne3v
	bGILiixjkbJE35NXuoMPCvA6LngWqOzuExL8F476vZZbLIe5SO0SXFVUzMokxsjyfa5e
	I7jrxDcZGxTjIqZCbqV884ro/25HIwotuzLLzLDSvjggg0u05Z9omBYrTysFu1Vwgsh8
	iJbU96Go391uQyEmwAgaosVp+CPZIX/bSPw1J+lhziZtmRY/AJbIJaeWW3/5Q9eWnGej
	wGcDF+MJkgSiqw68LCL4RTjb0Y+rLqPw+zkkkgUF0O0FcX8z5AJtgqGrCeRVqZt+1Odt
	/nUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=8UbhnWa6lo7+Q3yQDPA1oFe8xGU5v43EfWMnV6QyU+k=;
	b=LJ0cyOv768RaY2gG3G8qCTUqDqqK7R54nVhgourhRM1VjehhupSNhWDt9W7oJAtwn0
	cOLgmJvbAkPugsybfgCvRKJL91ffZ+1lA1T7dRzBzt+G5iQUyDBeeT9CDdQdm6efndXR
	QEqdHGCaJ6gtHbSpYIq7DYvEti7mVFS9SR4DeFXvZ4fxR3XiQ1QFWkvngEFbA5WQwcMB
	BWpot50lh+DGgGlwTPJWm6yZE04Uwdw4Za9GVyACglXp4DYWe4bhxqPWYtCVvnuQBjyT
	stc2HNF7/XzZz5HDQMo/vRVHI9JLG2Ua8TAPvr40UzZvR1NqY3wSOpp6AvrXmsxTg/mf
	86vg==
X-Gm-Message-State: ALKqPwe/jyzpmbDmKo3S0Qms4E1naCw85mJsBIbocGbjoZWWmJrjY8dY
	bcnqIYZYHW+CoeJ3s1LRexVChkoq
X-Google-Smtp-Source: AB8JxZrXdaIrFS4vICi9KF4PaoUNdZGt9+OwOclOQfiDyHVIupKiiHgaeA4nPktkHDTlAJmb03XDCg==
X-Received: by 2002:a9d:cce:: with SMTP id
	o14-v6mr1974592otd.112.1526508002223; 
	Wed, 16 May 2018 15:00:02 -0700 (PDT)
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com.
	[209.85.218.49]) by smtp.gmail.com with ESMTPSA id
	187-v6sm1842589oii.40.2018.05.16.15.00.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 May 2018 15:00:01 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f49.google.com with SMTP id y15-v6so2147856oia.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 15:00:01 -0700 (PDT)
X-Received: by 2002:aca:49d8:: with SMTP id
	w207-v6mr1926954oia.293.1526508000732; 
	Wed, 16 May 2018 15:00:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:3da5:0:0:0:0:0 with HTTP; Wed, 16 May 2018 15:00:00
	-0700 (PDT)
In-Reply-To: <20180516201415.8002-1-marex@denx.de>
References: <20180516201415.8002-1-marex@denx.de>
Date: Wed, 16 May 2018 19:00:00 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrXkwobok9O9RsebrZ7eOQze_t_fL5KqXCcDvkk9B3DRQ@mail.gmail.com>
Message-ID: <CAP9ODKrXkwobok9O9RsebrZ7eOQze_t_fL5KqXCcDvkk9B3DRQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.05 release
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
X-List-Received-Date: Wed, 16 May 2018 22:00:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 16, 2018 at 5:14 PM, Marek Vasut <marex@denx.de> wrote:
> This upgrades the U-Boot from 2018.03 to 2018.05 release.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Ross Burton <ross.burton@intel.com>

Nice work :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

