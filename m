Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UNt2d-0006kp-K5 for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 00:53:59 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r34MlJJ2023058; Thu, 4 Apr 2013 23:47:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QjNpKUME1Jie; Thu,  4 Apr 2013 23:47:19 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r34MlEPu023040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 4 Apr 2013 23:47:17 +0100
Message-ID: <1365114987.6526.120.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 04 Apr 2013 23:36:27 +0100
In-Reply-To: <CAP9ODKoHXQt=HN7VkyeE+rWXkVV+hPLJhPFRUne+mCm7phhEdQ@mail.gmail.com>
References: <1365017211-17183-1-git-send-email-dv@pseudoterminal.org>
	<515D9F33.9060909@linux.intel.com>
	<CAP9ODKoHXQt=HN7VkyeE+rWXkVV+hPLJhPFRUne+mCm7phhEdQ@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: oe-core layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: [oe][PATCH] eglinfo: Add recipes for x11 and fb backends
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
X-List-Received-Date: Thu, 04 Apr 2013 22:53:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-04-04 at 14:09 -0300, Otavio Salvador wrote:
> On Thu, Apr 4, 2013 at 12:41 PM, Saul Wold <sgw@linux.intel.com> wrote:
> >
> > I am going to defer this to 1.5 when it opens up, I still need to review the
> > recipe, but wanted to give you a heads up about the deferral.
> 
> Any reasoning to defer it when it adds a good tool for validation and
> test? It also offers very low risk of breaking something.

We're two weeks before release and meant to be bug fixing now, new
features add risk.

You say this patch is low risk but it will actually break builds. Why?
It has machine specific code but isn't marked as machine specific and it
will not work well in world builds for example. That is just the part I
can spot from looking at it but it means its not been widely tested.

Yes, we can fix these things but I really want to focus on the bugs we
have right now, not fixing new code and adding new build failures.

So Saul is right here in deferring this.

Cheers,

Richard






