Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SB2zG-0008FS-9W for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 12:48:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NBdw8c026045
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 11:39:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25941-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 11:39:54 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NBdoUW026038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 11:39:51 GMT
Message-ID: <1332502793.9740.385.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Mar 2012 11:39:53 +0000
In-Reply-To: <20120323093623.GB3879@jama.jama.net>
References: <1332485029-9148-1-git-send-email-Martin.Jansa@gmail.com>
	<1332494193.9740.382.camel@ted> <20120323093623.GB3879@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] kernel.bbclass: populate /etc/modules-load.d/ with module_autoload entries too
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
X-List-Received-Date: Fri, 23 Mar 2012 11:48:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 10:36 +0100, Martin Jansa wrote:
> On Fri, Mar 23, 2012 at 09:16:33AM +0000, Richard Purdie wrote:
> > On Fri, 2012-03-23 at 07:43 +0100, Martin Jansa wrote:
> > > * /etc/modules-load.d/foo.conf is used by systemd like /etc/modutils/foo was with sysvinit
> > > 
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/classes/kernel.bbclass |   10 ++++++++--
> > >  1 files changed, 8 insertions(+), 2 deletions(-)
> > 
> > Since these look identical couldn't we symlink them? I'm not a big fan
> > of writing duplicate data to a package :/.
> 
> OK I'll change it in v2

Note that I'm wondering if we can just symlink the directory entirely
rather than the files themselves. There may be a reason that is a bad
idea but I don't know...

Cheers,

Richard



