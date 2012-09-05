Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T9O95-0004EJ-K7
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 00:32:33 +0200
Received: by lagv3 with SMTP id v3so675921lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2012 15:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=UujR9q6OD0k2x3C2wJVtnLToAgK7fWEIqTQkQpaMNT4=;
	b=dmWEAdwE0P32me9zU3ecZhvX8a515pwzLl52dI01TXiyTY2mk8ziFD4vnS8AKckNx+
	Wuol9XfBnEti0urHwDOgM6zbRGUraR8kjXSc7I3R0Ljg8LLY6TaVkWLzBdhJ9yRNjvJr
	uS6p52hciXGYZrBvW7Su+e/jfbci7VhP9Ea7oKwkDHzU25q7l8PwH3wvEsDZeUdWiRAm
	nsvxfeoxmnHOBKOlzMfyNxI5jhQo5KHPEiZERu9txnXkoZwR/8fqMtSX4dryOSGRUfsR
	JZtYPKxyEY+kLaWYDhqrfJfSjq3UL7wtTGLF/cNBessjzcadr0tRO3JdGHrFGBUS6qPX
	QE3Q==
Received: by 10.112.82.168 with SMTP id j8mr163319lby.22.1346883603871; Wed,
	05 Sep 2012 15:20:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Wed, 5 Sep 2012 15:19:43 -0700 (PDT)
In-Reply-To: <1346879977.21985.88.camel@ted>
References: <cover.1346837268.git.liezhi.yang@windriver.com>
	<a30f2ce625990ccfb3e1e06794b353dc1f1257cb.1346837268.git.liezhi.yang@windriver.com>
	<32CDFC5F-610C-45E8-A239-A3387A8839FB@dominion.thruhere.net>
	<1346845447.21985.50.camel@ted>
	<E182019A-4B42-4F70-BA82-EDC685EDFA9A@dominion.thruhere.net>
	<1346879977.21985.88.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 5 Sep 2012 15:19:43 -0700
X-Google-Sender-Auth: Nd902dH_rmtHJeys8AAM8D21AJ8
Message-ID: <CABcZANk7NaXkEUzYRof5OS22keHLNPN6cfYr0gy=5AS+Lbh9Qg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Zhenfeng.Zhao@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 2/2] package_ipk.bbclass: use "--force-arch" when install package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 22:32:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 5, 2012 at 2:19 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> What I really need here is help with coming up with some working
> solution. Putting our heads in the sand and arguing whether its even a
> problem isn't going to go anywhere :(.

This doesn't make any sense. Deciding whether something is or isn't an
actual problem / is or isn't expected behavior is a good thing to be
doing, and is the opposite of putting heads in the sand, as it's
debating user expectations vs tool behavior. If you really think it's
better to blindly make changes before figuring out how the tool should
behave relative to user expectations, or think figuring out what
should be done first is "putting our heads in the sand", then I think
we have serious problems with you in charge of the project.
-- 
Christopher Larson


