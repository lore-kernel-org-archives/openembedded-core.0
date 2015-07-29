Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id B1EC8762DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 15:58:01 +0000 (UTC)
Received: by pabkd10 with SMTP id kd10so7767933pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 08:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=scEcMWNm6s1v4p/lEe4jcxJ4+7PErVU36k8a9s4t9Bk=;
	b=JG1lQ+oUBppZ28WqCM+w91m7hWdn0PjBQMbAOwLqIgKi77ChTn9EE7a3x/p++IAD34
	nQzEINHsrbzkn3h4zaw5IV2z/dbvxHDTNDp3lbHBfqAI/F1U2NQptS40s0Dto9ANuUNd
	5Xy+gU0v2FmJzlMpFaRtSf5XCiV5DwOGtrMaIKhRbnsZHsvTziLzrlOPpZSED/dxi5/S
	QMy9KCyvnxJ9CEyNs5D8/iDmzYR342Una8gRf3VAcPjZyv9u93wxWvcgW026oIlgHhqq
	BcWN5q8rde8ldkc0IYOLtUpeocF/ZrhYrWb4IaTGzbd7p2Cz6psXao19UTtqqB3AprcC
	FmuQ==
X-Gm-Message-State: ALoCoQl8uV8+FHIG8GTJ+4OQs38NhpVXmy/eE5uYZ2Fb5F3TlpPlW5AwRshlhYJzCKSuy9idhzTc
X-Received: by 10.67.7.199 with SMTP id de7mr93741268pad.107.1438185481410;
	Wed, 29 Jul 2015 08:58:01 -0700 (PDT)
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com.
	[209.85.220.51]) by smtp.gmail.com with ESMTPSA id
	v8sm41482538pdm.89.2015.07.29.08.57.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 08:58:00 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pabkd10 with SMTP id kd10so7767432pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 08:57:58 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.138.40 with SMTP id qn8mr95286401pab.19.1438185478887;
	Wed, 29 Jul 2015 08:57:58 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 29 Jul 2015 08:57:58 -0700 (PDT)
In-Reply-To: <1438213787-19374-2-git-send-email-b54851@freescale.com>
References: <1438213787-19374-1-git-send-email-b54851@freescale.com>
	<1438213787-19374-2-git-send-email-b54851@freescale.com>
Date: Wed, 29 Jul 2015 12:57:58 -0300
Message-ID: <CAP9ODKrhKveHmZQWeje0-XRj4tNz0yA5OCweaB-gLmGa9XXE1A@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v4] pulseaudio: revert commit 42156d2b5ac797e5f28f8d0d38b691053f3f6fc7
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
X-List-Received-Date: Wed, 29 Jul 2015 15:58:03 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 8:49 PM, Yuqing Zhu <b54851@freescale.com> wrote:
> Revert "launch: Avoid specifically starting PA and rely on autospawn/socket activation"
> or the pulseaudio can't be opened in yocto.
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>

Can you explain what this revert tries to fix?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

