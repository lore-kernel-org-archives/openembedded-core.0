Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShFwB-0005wQ-F0
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 10:06:51 +0200
Received: by eekd49 with SMTP id d49so2317408eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 00:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=lFSDvjZWTXMr/SKe5wCuReZjgsHKPZ5fIuN7n2qckBU=;
	b=ZCXV8KLrjdMdQWOTGndenGmE0jOlYY84SYQWNNn7qSVhCzF5+yIAtbB4DcQ93ebDdo
	xmm2tbvrD4YQjZar+PGtOAK/8Iq1AGPIT6SgloW6XsoSgGGmXTXfJTx8matC3pvEv+kI
	HD+gA5XYYvwWZn7tFYZBn0TrgYoWDA+28m7NO34yGUCC+SZpt06MCoI1QHZM57PLys3H
	r5RVM48uhYJeoeY4OI4UstSgzwb9T4DDTxiO7nVUmNmLT1808c5fh6Lz28g6I4G16xkV
	lIubr8/5eVjY4D62BShJLwpTgjlprryfJCnXHDK68WrRQcViZW/U/QSe7m7yb/k6w8QH
	LRcw==
Received: by 10.14.37.76 with SMTP id x52mr5084118eea.102.1340178966961; Wed,
	20 Jun 2012 00:56:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Wed, 20 Jun 2012 00:55:36 -0700 (PDT)
In-Reply-To: <4FE0A7DF.7030909@linaro.org>
References: <4FE0684D.2000906@linaro.org> <4FE0714A.1060603@linaro.org>
	<CAMKF1spK-ezqmFr+rh7J5dcbVvPbpDFGHxW02HvX9uaWdqTohQ@mail.gmail.com>
	<4FE0A7DF.7030909@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jun 2012 00:55:36 -0700
Message-ID: <CAMKF1so50NhTxaeeghsH8ogD=HUgmGDjR8rnh4yPbYv0JaU5tA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Is target toolchain supposed to be working?
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
X-List-Received-Date: Wed, 20 Jun 2012 08:06:51 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 19, 2012 at 9:25 AM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> W dniu 19.06.2012 18:19, Khem Raj pisze:
>
>> includedir already has leading slash so I wonder if you changed
>> includedir in your setup somehow ?
>
> bitbake gcc -e|grep ^includedir shown "/usr/include" value. G++ started
> on target as "g++ -v" shown "--with-c++-includes=/usr/include/c++" so I
> was surprised when it was not working.
>
> Added extra slash and it works. But please check in your configuration.
>

can you try the fixes from my branch

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc-updates

this should fix both gcc and binutils on target
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


