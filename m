Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SthJH-0005QD-LO for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 17:46:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6OFYdO3031881
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 16:34:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30562-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 16:34:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6OFYV8Z031875
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 16:34:33 +0100
Message-ID: <1343144070.22222.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jul 2012 16:34:30 +0100
In-Reply-To: <CAJTo0LYuuOvzPSW6g8HSr8_6bPHgP8A0jD5Rb3wbRneNEkdUQg@mail.gmail.com>
References: <1343137799-12032-1-git-send-email-yao.zhao@windriver.com>
	<CAJTo0LYuuOvzPSW6g8HSr8_6bPHgP8A0jD5Rb3wbRneNEkdUQg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bzip2-native: fix problems when bzip2-native is installed in parallel
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
X-List-Received-Date: Tue, 24 Jul 2012 15:46:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-24 at 14:57 +0100, Burton, Ross wrote:
> On 24 July 2012 14:49, Yao Zhao <yao.zhao@windriver.com> wrote:
> > when bzip2-native is installed in parallel to sysroot, it is possible that
> > some packages are using bzip2 to unpack, there are chances that bzip2 is
> > installed to sysroot but libbz2.so.0 not installed yet because parallel
> > installation.
> > link bzip2 and bzip2recover statically to avoid this problem and don't lose
> > parallel installation. libbz2.so is still available.
> 
> Is it me, or is this officially getting silly?  This probably happens
> for *every* binary in the sysroot that links to a library, which is
> probably a fair proportion of them.  Statically linking every single
> one and then special-casing further problems where a static link isn't
> sufficient (see pythonnative) just isn't going to scale.

It happens for things in ASSUME_PROVIDED so there is only a finite list
of these issues. I'm curious what is actually triggering bzip2-native to
build given its in ASSUME_PROVIDED...

Cheers,

Richard



