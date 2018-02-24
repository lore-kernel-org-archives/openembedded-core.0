Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED98787D0;
	Sat, 24 Feb 2018 17:56:44 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id y186so4166173pfb.2;
	Sat, 24 Feb 2018 09:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=KCAbH0En4IZLaWcYAvE4JoboZNUHQFzLzTB7kwkyUnI=;
	b=ovqcUgzuFP6ULZcgzODJbz5Ug3Z0cq9NXX/3W7msHzTXX57+TVgR5c+EzgPYd0bPBE
	ee0yCOkZ2MusB3AFqSoa8hXhScdi4R9g/vEu42sYtjXHiZT2/D/ly+L2s1qRjW05xEGX
	8ZVxSSREpifiNYKkUjtiAk72fogQgUe+NhBjt34cYFeBRGqK2mBJEsPmOxT72Y1SNxr1
	pWGbR4ssu/Sl7SGbjnDWpjfolR5lx/qXb1q3P0srxb/1plFs2qYLTkM6QySVCslhEy3T
	NpPE9WoWWJJSgnuytIowms2IPL9KAVWAy6PkOGzUsJX07/N04ZwR/YDFaA0ZMx5RP63g
	qXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=KCAbH0En4IZLaWcYAvE4JoboZNUHQFzLzTB7kwkyUnI=;
	b=MFcgSdbAsS+Ejup1NbH0AsCaDArUkjkTlq+W9h3+LioZpzMUNtCOj5QMtlQPL2hqPo
	z9bRLxXGqx6dKxDLy5SfXyCb0uUdFEIBjJUxTnJd+Va2k00+Ilbvsp6F5qGFTl+kiOCk
	klBCtk/R9aVzwteZfxj/e98gNTicdQ8Xek5i3xnLBF19QJQlRN0UK+Z+E9cZJMpl/h6q
	WhUk6+Ux3nURFyAPHZcHzizbOA8DSg/2hCCKua4/9wT0TjrS5Jgb3b85dU840gmCW+oM
	pwSI3KspucaVxtdfegHYWYoQXy4o8WmCmDIqVsCFypqxwoj8wx7Q5Z3vFMgUs7elyYpB
	XnXw==
X-Gm-Message-State: APf1xPDFEwTHjLZ0UuzBh/PPe6CML36aZqmcH8U/W41EtO0t3/1DY05Z
	cYoT28dewwDxS15lXrThwbXCcQ==
X-Google-Smtp-Source: AH8x224JBi3xgasG+4l3AEz2yNqCC7gqR2d//9xrwF0MPMlDrTVyHXs3Dc7QG40tR1kr5JiJhy+YzA==
X-Received: by 10.101.70.133 with SMTP id h5mr4541118pgr.166.1519495005599;
	Sat, 24 Feb 2018 09:56:45 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:301f:20d9:41ea:5ba?
	([2601:202:4000:1184:301f:20d9:41ea:5ba])
	by smtp.gmail.com with ESMTPSA id
	t11sm10036823pfe.17.2018.02.24.09.56.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Feb 2018 09:56:44 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <966e95a6-4401-5c12-b69c-9bd37bb236fd@gmail.com>
Date: Sat, 24 Feb 2018 09:56:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Subject: [RFC] meta-openembedded/meta-oe re-org
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
X-List-Received-Date: Sat, 24 Feb 2018 17:56:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello,

I am planning on moving some recipes to new locations that are more
in-line with their function.

Also, I plan on adding *-shells, *-dbs, *-security and *.crypto and
moving the appropriate recipes there.

This might help facilitate folks signing up to maintain a grouping like
recipes-crypto if that is their thing.


I will be sending out patches later today for review.

I have staged the changes @
http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dakuster/m=
eta-oe-reorg

- armin



