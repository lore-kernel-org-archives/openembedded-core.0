Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SoMQv-0005ts-7l
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 00:27:57 +0200
Received: by eekc50 with SMTP id c50so12537eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 15:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=3RG9LAT3Il6UvCCti+fIbW2GUSVHj041DmyNvSuLYRo=;
	b=Q4VO97ThoyvzqVYf1rU2YphlI5MDrvFkV0I4Qjd7IDR/yFevOm5LzGtsqFQCANruvj
	p8o1YwQWH751x/pCUjBp+ZOv5x5Nz3NugcCkeK+N5X1Dw+J3X2lTUq9DqBjA5yG0BYRL
	g5miXBVZAelTS9Pd3xF+JgbwTaRxpnrhTS4gR93XQk3kGQ2pfALMjYCyx2d1M+Jdrrym
	siulogdeNRQp6Og4CRVfNybnM30vvjAptal+zhBxCymeTzmSER/J4g4f63L48vfbz493
	lRCzeBG8nhwQYifCl4LOVthj9DrYZVdV9cSVjGB3xyjnp29RryYTDnDkve+g2RZhww7N
	XfYw==
Received: by 10.14.95.138 with SMTP id p10mr10184423eef.110.1341872207574;
	Mon, 09 Jul 2012 15:16:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 9 Jul 2012 15:16:17 -0700 (PDT)
In-Reply-To: <20120709214759.GJ6308@jama.jama.net>
References: <4FFB4F7D.1040009@linux.intel.com>
	<20120709214759.GJ6308@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jul 2012 15:16:17 -0700
Message-ID: <CAMKF1srKeOOR_iq7xFfzJgMN7Ogkmg6-iD7xC3q+BAapOn73Jw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: build stats error with eglibc 2.16!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 22:27:57 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 9, 2012 at 2:47 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> something messing with EGLIBCVERSION during build (e.g. branch switch in
> other term)?
>
> It's building 2.16 but then running eglibc_2.15.bb...
>

yeah set EGLIBCVERSION = "2.16" in local.conf


