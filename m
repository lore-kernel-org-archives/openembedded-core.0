Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UJ5RB-00057e-CL for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 18:08:09 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2MGxt7Z013285; Fri, 22 Mar 2013 16:59:55 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MHFrELmmrmLU; Fri, 22 Mar 2013 16:59:55 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2MGxk8p013276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 22 Mar 2013 16:59:49 GMT
Message-ID: <1363971011.3097.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luo Zhenhua-B19537 <B19537@freescale.com>
Date: Fri, 22 Mar 2013 16:50:11 +0000
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A0148460D@039-SN2MPN1-022.039d.mgd.msft.net>
References: <1363849246-9294-1-git-send-email-zhenhua.luo@freescale.com>
	<1363858329.16482.133.camel@ted>
	<CA452391058F6D4E9715FB2C29D9312A0148460D@039-SN2MPN1-022.039d.mgd.msft.net>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Guo Chunrong-B40290 <B40290@freescale.com>,
	Liu Ting-B28495 <B28495@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: rpm: fix probably redundant RPATH issue
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
X-List-Received-Date: Fri, 22 Mar 2013 17:08:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-03-21 at 12:29 +0000, Luo Zhenhua-B19537 wrote:
> The issue can be reproduced with FSL toolchain which has not been published yet. 
> 
> I am not sure if the issue can be reproduced with Yocto default toolchain. 

I'm going to guess that you have "lib/../lib" entries in some of your
external toolchain .la files. The question is therefore whether we can
better deal with this. I think other recipes will have this problem and
we need to fix libtool to better handle it.

Cheers,

Richard




