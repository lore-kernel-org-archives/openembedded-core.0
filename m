Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TQKUp-0004c9-22 for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 18:04:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MFpTd2006847;
	Mon, 22 Oct 2012 16:51:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06604-02; Mon, 22 Oct 2012 16:51:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MFpLLg006840
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 22 Oct 2012 16:51:23 +0100
Message-ID: <1350921081.22340.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Holger Freyther <holger@freyther.de>
Date: Mon, 22 Oct 2012 16:51:21 +0100
In-Reply-To: <loom.20121021T094018-148@post.gmane.org>
References: <1350064876-11475-1-git-send-email-holger@moiji-mobile.com>
	<loom.20121021T094018-148@post.gmane.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Do not chdir to /boot before	running update-alternatives
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
X-List-Received-Date: Mon, 22 Oct 2012 16:04:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-10-21 at 07:42 +0000, Holger Freyther wrote:
> Holger Hans Peter Freyther <holger@...> writes:
> 
> > 
> > The symlink from uImage-3... to uImage is not created at image creation
> > time and not properly update on kernel upgrades. This is fixed by removing
> > the chdir. The other users of update-alternative do not change the directory
> > before calling it.
> 
> Hi,
> 
> this patch has not been merged, nor has it received any comments. The symlink
> creation for uImage is broken right now and I would be very happy if it could
> be fixed.

Merged to master, thanks.

Richard



