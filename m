Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id 03709795DA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 20:29:18 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id u20-v6so9295559otk.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 13:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=8IJIGZOIhXjwe3tHTVSo1kIV2uVTLlgzLfP33QntpK4=;
	b=aeEa9rjcIzLkZZICn6GE77PX6CS/bUDEB4YsWbosaxo6sQUMrohoufUkir9SiEdWLX
	MvwXOBXH/qgdyHas2dO5gZEm4o1UcRy75Tf7w2Zqo/lrp1kgR8+WkUk7grKSrJx5WFbh
	oyBTVSXOAACeKLyQkGjUcDyvJJHSgVRS6MwlirtS2UlGNKhZlIxgvCzx/9aZJz32bczn
	895+LMCkiDXUDzWuoUcCENzYD5cx3Q8wt7ZcCWR1eqNjbX9MHuqC9D/3nHgL5Q1tfEjV
	baZ14EZUKK1pVWvL3CgNaX/w8l4kwxU/cAA4FM4IPWVx4a6Z7Xq3UvHoD/rr6VxT4R1e
	4+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=8IJIGZOIhXjwe3tHTVSo1kIV2uVTLlgzLfP33QntpK4=;
	b=QqT/K1c3HsQu2sCKn6jCSAtxQ8XI1sIXFQsIvzVtV7Cqcvp15JgtZIJnWnFhpBoCON
	ALH72vMNTleKucB+jrF97cuZ5GZNvxdAyYWPr4s1+1tuRQb/JIlxqZb0grGMjyqrEtS6
	Xv3d+SWBo0pGp9MhExsMdD5hNE+4sTgAwCnEyU6+H+5tlWnuN2l+FCsTKXPnih2QVd3v
	BxgNqj1slOMe9R1lJ98Q2zTeJ3G15r6gMX2/30tTIkW/EQBa1s4St/TGycldIiaLS4Iv
	9wKmO1QvPfWMfXzooj7BJnDriRVRV3B/zxf9zb8C9FSh8cZWqkXOJwDRPoWDhuegVDii
	SHUQ==
X-Gm-Message-State: APzg51DAizSGj/83Bv08bSkAiUYe+oYRgkV9DNzmqkL9RbPjd5CY3rM9
	j4yydLkuKNiBltfKd96JAchfxYkJbOA8Vw==
X-Google-Smtp-Source: ANB0VdbtT/n4XXltnR6RTMbKuiFgEF+XGEBqOhjmUesjEzVBH4OXbfcOCTTB/rF7SnZLW1aLRT1sHQ==
X-Received: by 2002:a9d:6083:: with SMTP id
	m3-v6mr11207500otj.340.1537129759408; 
	Sun, 16 Sep 2018 13:29:19 -0700 (PDT)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com.
	[209.85.218.51]) by smtp.gmail.com with ESMTPSA id
	i132-v6sm6738878oif.20.2018.09.16.13.29.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Sep 2018 13:29:18 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f51.google.com with SMTP id b15-v6so17128552oib.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 13:29:18 -0700 (PDT)
X-Received: by 2002:aca:4994:: with SMTP id
	w142-v6mr15318326oia.114.1537129757799; 
	Sun, 16 Sep 2018 13:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20180916135628.DCFE9440003@auh.yoctoproject.org>
In-Reply-To: <20180916135628.DCFE9440003@auh.yoctoproject.org>
Date: Sun, 16 Sep 2018 17:29:02 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrzNBBV_NoYBt8f2TkU=aj9+7g+tVDbrMOyvxvuJsiKFg@mail.gmail.com>
Message-ID: <CAP9ODKrzNBBV_NoYBt8f2TkU=aj9+7g+tVDbrMOyvxvuJsiKFg@mail.gmail.com>
To: auh@auh.yoctoproject.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] cmake: upgrading to 3.12.2 FAILED
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
X-List-Received-Date: Sun, 16 Sep 2018 20:29:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 16, 2018 at 10:56 AM <auh@auh.yoctoproject.org> wrote:
> You are receiving this email because you are the maintainer
> of *cmake* recipe and this is to let you know that the automatic attempt
> to upgrade the recipe to *3.12.2* has Failed(do_compile).

Pending, will send soon.



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

