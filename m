Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGsM8-0002LR-2c for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 16:12:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8QDxwY4020306;
	Wed, 26 Sep 2012 14:59:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20063-05; Wed, 26 Sep 2012 14:59:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8QDxoVG020300
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 26 Sep 2012 14:59:51 +0100
Message-ID: <1348667991.8662.108.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Sep 2012 14:59:51 +0100
In-Reply-To: <CAMKF1srWM46Jofrjd8xxX22waY1b7O3a0Nwr-Av+B_mid9fSfw@mail.gmail.com>
References: <1348530910-9917-1-git-send-email-raj.khem@gmail.com>
	<1348560878.8662.29.camel@ted>
	<CAMKF1srWM46Jofrjd8xxX22waY1b7O3a0Nwr-Av+B_mid9fSfw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] jpeg-native: Do not use libtool-cross for native recipe
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
X-List-Received-Date: Wed, 26 Sep 2012 14:12:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-25 at 06:27 -0700, Khem Raj wrote:
> On Tue, Sep 25, 2012 at 1:14 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > This wallpapers over cracks. Why is libtool-native/libtool-cross broken?
> > Shouldn't we fix whatever is breaking libtool?
> >
> 
> it is not broken. But we were ending up using cross-libtool for native
> recipe that does not seem right.

Looking at your original error message, it says:

 /work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool

which is libtool-native. I appreciate that the OEMAKE line to use the
cross version is wrong but it looks like it still manages to find the
native libtool and that it isn't working.

Cheers,

Richard




