Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UNsvj-0006Pg-4W
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 00:47:33 +0200
Received: by mail-ve0-f172.google.com with SMTP id oz10so3097728veb.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 15:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=oWkrT2lcy1JRDRR+DfiLqobhtwSEomhh8brfmo+loHQ=;
	b=1G0vnlubBId6Q2QfTtAon4wPTb2dUkblrxdHjF3BV7GIGBmK0ICBlRx8nBauAYusJE
	tNJjQzV9MxH/t9oKzgJO1NqLPW5FllaW8g2zkcy4bYrkOIat5cOB6kg50klEAZTvr1oT
	V2cvkqTGjg8Pw4enw6NWcPoEPv4O1hSY7LQqt3N6to83Zr3NWdsm/EgghWUXRCUf00ha
	hJeeGWXl61jwf6CA9xA9dieIjaL5BXXFMJKV9+Cr8Qy5B8r9OOm/todwuNzllicPJbu4
	6ZPsv5n4iFfZ6z2k2QKNpZprvywXiLDsbIqb03dbCkNOpeNmbu/ABZNkQntY3tx4G8uQ
	nCQA==
MIME-Version: 1.0
X-Received: by 10.58.232.98 with SMTP id tn2mr28111vec.57.1365114577439; Thu,
	04 Apr 2013 15:29:37 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Thu, 4 Apr 2013 15:29:37 -0700 (PDT)
In-Reply-To: <CALbNGRSj7uahrGy1DoSe5zJasciTf2Q7j1xj5N8V-cs_WOW+4g@mail.gmail.com>
References: <CALbNGRSj7uahrGy1DoSe5zJasciTf2Q7j1xj5N8V-cs_WOW+4g@mail.gmail.com>
Date: Fri, 5 Apr 2013 00:29:37 +0200
Message-ID: <CALbNGRS4MTJny0yqf-oYx1S12O-ZETo4g9x+7BuRVh8pbuBW0g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: experiences with images based on current layer heads
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
X-List-Received-Date: Thu, 04 Apr 2013 22:47:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2013 at 4:02 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Hi,
>
> when migration of systemd to oe-core turned to unbuildable I decided
> to freeze my images and stopped further tests. Now that many issues
> were fixed and we are close to another release I built my standard
> xfce-based image based on latest layer HEADs. With this I face some
> issues which I would like to share:
>
> 1. X sessions crash with OOM. This is reproducible by opening
> google-maps with midori and changing to satellite view. In
> Xorg.0.log.old I see only
>
> | (EE)
> | (EE) Backtrace:
> | (EE)
> | (EE) Segmentation fault at address 0x9
> | (EE) BUG: triggered 'if (inSignalContext)'
> | (EE) BUG: log.c:502 in LogVMessageVerb()
> | (EE) Warning: attempting to log data in a signal unsafe manner while
> in signal context.
> | Please update to check inSignalContext and/or use
> LogMessageVerbSigSafe() or ErrorFSigSafe().
> | The offending log format message is:
> |
> | Fatal server error:
> |
> | (EE)
> | (EE) Backtrace:
> | (EE)
>
seems we are not alone [1]

[1] http://www.raspberrypi.org/phpBB3/viewtopic.php?t=3D38568&p=3D321298

Andreas


