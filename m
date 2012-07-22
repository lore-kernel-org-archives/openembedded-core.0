Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SsvDP-00018O-Fn for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 14:24:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6MCDOsT027953;
	Sun, 22 Jul 2012 13:13:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19951-10; Sun, 22 Jul 2012 13:13:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6MCDGhl027947
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 22 Jul 2012 13:13:17 +0100
Message-ID: <1342959200.21788.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Sun, 22 Jul 2012 13:13:20 +0100
In-Reply-To: <35FBB7A8207843A5AFC9AF27326C7ABC@intel.com>
References: <1342799746.21788.37.camel@ted>
	<35FBB7A8207843A5AFC9AF27326C7ABC@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-doc: Ensure we run gtkdocize else we could see build failures (e.g. evolution-data-server)
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
X-List-Received-Date: Sun, 22 Jul 2012 12:24:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-20 at 20:29 +0100, Ross Burton wrote:
> On Friday, 20 July 2012 at 16:55, Richard Purdie wrote:
> > This is a fix to Ross' series, we need to run gtkdocize in case anything
> > was built from source control and the appropriate files are missing.
> 
> Good point but I'm curious how the build was succeeding/what broke before this.

Probably you used an existing build which already had the gtk-doc.make
file touched and your didn't bump PR. The file therefore hung around. It
would only happen on something built from SCM (evolution-data-server is
a git recipe).

I'm guessing if you clean eds, it would show up.

Cheers,

Richard



