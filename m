Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T22iZ-0005Np-Ux for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 18:14:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7GG2lw3032487
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 17:02:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32260-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 17:02:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7GG2cBI032481
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 17:02:39 +0100
Message-ID: <1345132958.14667.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2012 17:02:38 +0100
In-Reply-To: <CAJTo0LbKPX-T4R0kM2gNzy6vAjLJseKq31ZDSDGp8GBnh3UAuA@mail.gmail.com>
References: <CAJTo0LbKPX-T4R0kM2gNzy6vAjLJseKq31ZDSDGp8GBnh3UAuA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Dropping GTK+ 2.12
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
X-List-Received-Date: Thu, 16 Aug 2012 16:14:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-16 at 16:36 +0100, Burton, Ross wrote:
> Hi,
> 
> GTK+ 2.12 is very, very old (2007).  Does anyone still use it, or can
> we drop it from oe-core?
> 
> Actually, if anyone still wants it, can we move it to meta-oe?  Do we
> really need three versions of GTK+ in oe-core?

It was kept for the filechooser patches. There is no other reason and it
can probably be dropped.

Cheers,

Richard



