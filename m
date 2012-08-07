Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SymQV-0007TO-Fl for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 18:14:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77G2lvE012950;
	Tue, 7 Aug 2012 17:02:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12085-08; Tue,  7 Aug 2012 17:02:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77G2dAh012944
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Aug 2012 17:02:40 +0100
Message-ID: <1344355363.9756.277.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2012 17:02:43 +0100
In-Reply-To: <CADkTA4P3L11rSZZZr83hbcjPnfmewqDKkzA1jvCkN5PwkJKB3A@mail.gmail.com>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <50212122.50109@windriver.com>
	<1344349336.9756.259.camel@ted> <50212648.8030204@windriver.com>
	<1344350670.9756.269.camel@ted> <502133A9.1080707@windriver.com>
	<1344354080.9756.274.camel@ted>
	<CADkTA4P3L11rSZZZr83hbcjPnfmewqDKkzA1jvCkN5PwkJKB3A@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: darren.hart@intel.com
Subject: Re: [PATCH] perf: pass STAGING_INCDIR(sysroot) to perf
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
X-List-Received-Date: Tue, 07 Aug 2012 16:14:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-07 at 11:54 -0400, Bruce Ashfield wrote:
> On Tue, Aug 7, 2012 at 11:41 AM, Richard Purdie

> > Lets try the sysroot prefix (=) approach then. The kernel is sparse on
> > these since it never actually has to deal with sysroots (or userspace)
> > often and is still learning in that area. I suspect this should be the
> > fix upstream might take.
> 
> Agreed. And to close the loop, I'd prefer to leave what you merged as-is for
> today, and by next week, have another pull request with an in tree and upstream
> submitted patch to replace it.
> 
> Does that work for you ?

Yes, that works, thanks.

Richard



