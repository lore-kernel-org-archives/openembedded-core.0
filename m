Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UbR3W-0002km-BX for openembedded-core@lists.openembedded.org;
	Sun, 12 May 2013 09:50:59 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4C7ZDQw007384; Sun, 12 May 2013 08:35:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FQ7PxdJ8QzWx; Sun, 12 May 2013 08:35:13 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4C7Z78I007380
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 12 May 2013 08:35:10 +0100
Message-ID: <1368343938.21569.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 12 May 2013 08:32:18 +0100
In-Reply-To: <CAJTo0LYgAzXW4PEt_KucpDG7Uk5rpXJEDzWPGTgA7X3jZkU-yQ@mail.gmail.com>
References: <1368180910-17476-1-git-send-email-bogdan.a.marinescu@intel.com>
	<20130510102041.GA12329@jama.dyndns-home.com>
	<1368181932.11129.11.camel@ted>
	<1368182760.24706.3.camel@phil-desktop.brightsign>
	<1368183027.24706.6.camel@phil-desktop.brightsign>
	<CAJTo0LYgAzXW4PEt_KucpDG7Uk5rpXJEDzWPGTgA7X3jZkU-yQ@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Phil Blundell <philb@brightsign.biz>, Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] flex: updated to 2.5.37
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
X-List-Received-Date: Sun, 12 May 2013 07:51:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-05-10 at 12:00 +0100, Burton, Ross wrote:
> On 10 May 2013 11:50, Phil Blundell <philb@brightsign.biz> wrote:
> > Or you could replace the shell wrapper that create_wrapper() currently
> > generates with either a compiled binary or a Python script.  That would
> > allow you to execl("/path/foo.real", "foo", ...), which I don't think
> > you can do in shell but which would avoid this whole class of problem.
> 
> Bash can do that, but it's not POSIX. :/

I'm quite happy to have the wrapper as bash shell script. We only need
dash compatibility in things that get run under /bin/sh (i.e. bitbake
shell tasks).

Cheers,

Richard



