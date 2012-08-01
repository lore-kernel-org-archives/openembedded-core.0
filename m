Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SwYH8-0004do-Rm
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:43:45 +0200
Received: by pbbrq2 with SMTP id rq2so918826pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=wvbbQMMnyvz0mo1slb5u9XQQnuYsm4/7t/q/5kBO9zQ=;
	b=qcuEls2PkzA6NrZDZ0HSsnlqUaJzetTHhb3bjvNQw/Pi74eqM/dHRdUIhMnVMFzIT9
	uzrCWTWytaFJghcaD6m1aoh+mgD+QGDfTpOxfM8XAa7BU/3b2fnQa96+cxALTCTD1wMy
	IOAUUNtobnNStlgAbNCzl7jjg0vObnCwIc1JjkHMAwV2+DgU9JlZU6fL3gjulwjuKLEm
	DpopxOfriPrQzGtr2xOvTUG5jgDYrz09c6Wq6Cna3qjUHHrXxoqkLi2hiQ7em+bsOntK
	huJw2/EnwKh4qlV89wB1yBcZAaZ6ShwSEuKBsSU8tpeYBiJ8cKIU5kJNOaJk/TtL8B97
	oGVA==
MIME-Version: 1.0
Received: by 10.68.130.73 with SMTP id oc9mr47721434pbb.34.1343824323896; Wed,
	01 Aug 2012 05:32:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.63.102 with HTTP; Wed, 1 Aug 2012 05:32:03 -0700 (PDT)
In-Reply-To: <20120801115943.GC16306@jama.jama.net>
References: <20120801065021.GC15199@jama.jama.net>
	<CAP9ODKoa2AWz=A8YOmcBDXjDt9jDXaUsgo1WOVrMsivwU--m_w@mail.gmail.com>
	<20120801115943.GC16306@jama.jama.net>
Date: Wed, 1 Aug 2012 09:32:03 -0300
X-Google-Sender-Auth: lum7R1PAqd3z15lWA3etmr6RjeI
Message-ID: <CAP9ODKo_XN=RaaSM2HfwuwujJROEtk50MHYZka=ZQRLUJQ3m7A@mail.gmail.com>
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
X-List-Received-Date: Wed, 01 Aug 2012 12:43:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 1, 2012 at 8:59 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Aug 01, 2012 at 08:48:08AM -0300, Otavio Salvador wrote:
>> On Wed, Aug 1, 2012 at 3:50 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > reexecuting do_compile in u-boot causes .bfd being appended multiple
>> > times and resulting in errors like:
>> > /bin/bash: arm-oe-linux-gnueabi-ld.bfd.bfd.bfd: command not found
>>
>> I am just wondering why it'd end re-executed? due changes on sstate hash?
>
> e.g. when it fails due to compile error and someone reexecutes it then
> he will see arm-oe-linux-gnueabi-ld.bfd.bfd.bfd instead of real compile
> error.

Wouldn't be better to grep for 'ld.bfd' and apply it *only* if not is not found?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


