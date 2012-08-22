Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4HgX-0002nD-FJ
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 22:37:53 +0200
Received: by eekb57 with SMTP id b57so2870eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 13:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=x1QGtUp4bfjLo9JRAsaNy3roqEXGHzv2tj/DgUkPy8Q=;
	b=kx/sTXoXlYcZG0PAuA9fzW07eyMtDjTETiIHkRU3+giTnGW3u0fDrxdumHJ1dD0Qlu
	1WWYH7yCzr9rZ8+UvVp1cUvtl5M1EhVvXwWBoRkUHc6WXEXafXcpoi7nlMQKOpQKCqa3
	jzMRH9ncExebKhDjSLKDKQ+zbuOxMFk84O1bPSj6tWd+4KsP9/wLvWOq2BeyCnkW0CCB
	gkdBeshVzo4lqlqSE1haxK9SKMI6jGh/cTlsRZKWsXdGF6xszMAyg9chwsL9rh2neV9V
	7foRzf3X+mM/8p+hrUGctFW7EmiyYXVcqlnWRKIlnXSHTve7jU0WQrA5XFl/dsFiPEkc
	e7mA==
Received: by 10.14.4.201 with SMTP id 49mr20220443eej.0.1345667148051; Wed, 22
	Aug 2012 13:25:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 22 Aug 2012 13:25:17 -0700 (PDT)
In-Reply-To: <ly628a8z00.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <ly628a8z00.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Aug 2012 13:25:17 -0700
Message-ID: <CAMKF1sp7G1S-B5N-HR-2P_PEhkmeJnjDtskRe6EcubxiHah=nQ@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: libgcc_s.so not stripped
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
X-List-Received-Date: Wed, 22 Aug 2012 20:37:53 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 22, 2012 at 1:15 PM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
>
> I just noticed that libgcc_s.so.1 is not stripped in the .ipk.  Is
> there any reason to keep the debug symbols?  Uncompressed, this makes a
> difference of more than 1 MB.

I dont see a reason to have debug info there. Symbol table probably
should be left in.


