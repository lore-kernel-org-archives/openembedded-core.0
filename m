Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5C95272498
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 20:36:07 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id z6so2324214yhz.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 12:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=JlIgPBx8ZLS0+PK6gR3qvkBC0b1vFc5hH2lPwSDx3tU=;
	b=fOK5RRuwsm0LKb7Ng4hKG0t20ZxXvRr1Ecezf21/7KTDFPwtncimRAtAFK9zjBFZEN
	ewgpL2lbs8EU2G6E5F/t1e/yXhZMP120KtiYQhbmwZUn4J0sZPA6XL4erk2VtDqnIuzj
	vhyKe9hjekZNiEjtaxjj6t5hOjEv8WHsVqREOdQQJZyEIhXVIWvsBcitvsppRLaNXBqG
	GqNoYqwK5WbSwG6OZB0PnkQhWKQ6EcWXVxI+u37AZQ6nIrLNe+FN1s1wzhuKUPUSrJXf
	p2L69unrnE4Tq9Ur31IudakeuEbT1beaCzfLN9IlVEp7y2dSaqXFBKtmo9VRTO302oqh
	fdiw==
MIME-Version: 1.0
X-Received: by 10.170.174.197 with SMTP id q188mr9678911ykd.110.1420749367811; 
	Thu, 08 Jan 2015 12:36:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Thu, 8 Jan 2015 12:36:06 -0800 (PST)
In-Reply-To: <1420747144-11925-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1420706622-31273-2-git-send-email-maciej.borzecki@open-rnd.pl>
	<1420747144-11925-1-git-send-email-maciej.borzecki@open-rnd.pl>
Date: Thu, 8 Jan 2015 18:36:06 -0200
X-Google-Sender-Auth: fKDSrudgs6B-JiQUStEPkGbXrEc
Message-ID: <CAP9ODKp_eP8SpXzcKorcbbaXWd6be9Lpmx+V6J6PhCNALEzr0w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: cherry-pick patch fixing networkd gateway route handling
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
X-List-Received-Date: Thu, 08 Jan 2015 20:36:11 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 8, 2015 at 5:59 PM, Maciej Borzecki
<maciej.borzecki@open-rnd.pl> wrote:
> Cherry-picking a patch that fixes gateway route handling in systemd-networkd.
> The patch adds a source IP to the automatically added gateway static route,
> thus allowing for proper IP communication in a scenario when a static or
> IPv4-LL address is used alongside a dynamically obtained one.
>
> (From systemd rev: 46b0c76e2c355c0d0cc4792abb98cde07b28bc5)
>
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

