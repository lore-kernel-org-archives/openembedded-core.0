Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SwXad-0003ee-9E
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 13:59:47 +0200
Received: by pbbrq2 with SMTP id rq2so871913pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 04:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=2uwIpXMW1MuDdTnqwqH/9hYY1H/7XOtAQ+zcjQw45K8=;
	b=a47DfSk+/42i4fgSFK1uf1jGzp03iyNQRPY5y7dftjprLjzp5r1DGxiWstnhem6RVr
	booTsioFPovNZsji22aT4f15FfpFZ4SNpfrtHq7q8lUfzgUWzcqJBRomRb1iYvpLD1qd
	cmMHIP5tDmH0QCgYpXndNh6ynX69uEW3HqxSnCHMrnCR/IjognRk7tEePSnyc7skdLSs
	fqM8j0q5HVK2Q0+yrWj5f386P8nj1etc7Y55xvNQuARASKBVDaT5vEtO58aYQkr+Y7QD
	PtrlhVsBNEtdMLcGGamKUQCGws61KRObj1NKXeY8PneckpFpc9qjq4go3afYxfVm208c
	Twaw==
MIME-Version: 1.0
Received: by 10.68.129.168 with SMTP id nx8mr51099662pbb.112.1343821688085;
	Wed, 01 Aug 2012 04:48:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.63.102 with HTTP; Wed, 1 Aug 2012 04:48:08 -0700 (PDT)
In-Reply-To: <20120801065021.GC15199@jama.jama.net>
References: <20120801065021.GC15199@jama.jama.net>
Date: Wed, 1 Aug 2012 08:48:08 -0300
X-Google-Sender-Auth: LrSJE6U28zg70W7YQHhrPPH9KTw
Message-ID: <CAP9ODKoa2AWz=A8YOmcBDXjDt9jDXaUsgo1WOVrMsivwU--m_w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: u-boot do_compile should be reentrant even with ld-is-gold
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
X-List-Received-Date: Wed, 01 Aug 2012 11:59:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 1, 2012 at 3:50 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> reexecuting do_compile in u-boot causes .bfd being appended multiple
> times and resulting in errors like:
> /bin/bash: arm-oe-linux-gnueabi-ld.bfd.bfd.bfd: command not found

I am just wondering why it'd end re-executed? due changes on sstate hash?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


