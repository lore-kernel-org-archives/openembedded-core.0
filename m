Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UAliN-0002cP-Oy
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 19:26:52 +0100
Received: by mail-wi0-f178.google.com with SMTP id hq4so1060337wib.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 10:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=zxbIBnh9eh+BQOHG8FE5Tyq//SZTcJmGvF7YlJQHM8w=;
	b=fMc63dRBe5clOKL3g8ErnGAyKE1ROAA1lR0CpYuGbu5RXHHCHNEGqR2IGPKAOivExA
	GSMdSxEbEmu2+paZbOc3raZqmezLZbyHO+ECSRDX2iQeQXKatGIW5cU/nXdbEshdNovm
	1u+QjHyC3PhfvR65jfjyONElCo/Jj63zGAO4//tiG2PCkPijGdKEd+YvaPXVcmtq4YY4
	uaHteTOMKhWxt1j+XdKAp8xTaLP17/2S4o7BXzpiaJzKuCqiE9p82bZGprGYR+3jhIug
	1OZ3HR6taZcxnplDekppWfkB9vPY4cf8z/1DRUqWilLGTdha47s9TiFskkx6NyeqRMmR
	2fjw==
MIME-Version: 1.0
X-Received: by 10.194.58.202 with SMTP id t10mr5947313wjq.4.1361988628839;
	Wed, 27 Feb 2013 10:10:28 -0800 (PST)
Received: by 10.194.45.100 with HTTP; Wed, 27 Feb 2013 10:10:28 -0800 (PST)
In-Reply-To: <cover.1361976853.git.tom.zanussi@linux.intel.com>
References: <cover.1361976853.git.tom.zanussi@linux.intel.com>
Date: Wed, 27 Feb 2013 13:10:28 -0500
Message-ID: <CAHUNapTgiR2uAo6uD+R32-wxUj=Eja58vZ+gCwFemvpsd8Kqyw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: tom.zanussi@linux.intel.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] add libaudit and enable 'perf trace'
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
X-List-Received-Date: Wed, 27 Feb 2013 18:26:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 27, 2013 at 10:00 AM,  <tom.zanussi@linux.intel.com> wrote:
> 'perf-trace' is a new perf subcommand available in the 3.8 kernel -
> this patchset enables it.

Out of curiosity, from where can I find the recipe(s) for a 3.8 kernel?

My meta/recipes-kernel/linux/ only includes:
    linux-dummy.bb
    linux-yocto-dev.bb
    linux-yocto-rt_3.0.bb
    linux-yocto-rt_3.2.bb
    linux-yocto-rt_3.4.bb
    linux-yocto-tiny_3.2.bb
    linux-yocto-tiny_3.4.bb
    linux-yocto_3.0.bb
    linux-yocto_3.2.bb
    linux-yocto_3.4.bb


