Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THagb-0005Wx-U7 for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 15:32:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SDK2jc010407;
	Fri, 28 Sep 2012 14:20:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09843-07; Fri, 28 Sep 2012 14:19:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SDJpXp010394
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 28 Sep 2012 14:19:52 +0100
Message-ID: <1348838392.15753.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <Kai.Kang@windriver.com>
Date: Fri, 28 Sep 2012 14:19:52 +0100
In-Reply-To: <50658E84.9090206@windriver.com>
References: <50658E84.9090206@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Some problems about nativesdk-perl
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
X-List-Received-Date: Fri, 28 Sep 2012 13:32:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-28 at 19:48 +0800, Kang Kai wrote:
> Hi Richard,
> 
> I meet 2 problems about nativesdk-perl. 
> 
> First one is that nativesdk-perl-modules doesn't depends on the single
> nativesdk-perl-module-xxx which I asked you yesterday, but I still
> don't know how to fix it.
> I tried to add one line to perl_5.14.2.bb:
> RRECOMMENDS_perl-modules_virtclass-nativesdk +=
> "nativesdk-perl-module-config" 
> 
> and it will cover the original value and make nativesdk-perl-modules
> only depends on nativesdk-perl-module-config.
> Doesn't "+=" work for nativesdk ?

I will need to investigate this issue further to comment and I'm short
on time at the moment.

> 
> The second issue is the latest commit for perl(Yocto commit
> 876ec81c039132d07a5f3d99bae40d6154351d41) . I build
> meta-toolchain-gmae with it, 
> and the perl @INC path remove the "/opt/poky/1.2
> +snapshot/sysroots/x86_64-pokysdk-linux" prefix.
> Is that the right operation?

No, please try with the patch I just sent applied as this will hopefully
fix it.

Cheers,

Richard



