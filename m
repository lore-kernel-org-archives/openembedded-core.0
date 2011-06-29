Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbrSe-0007TV-Dm for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 11:53:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5T9npDj002477
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 10:49:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01875-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 10:49:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5T9ngiE002471
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 10:49:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <C10D3FB0CD45994C8A51FEC1227CE22F27050B57BE@shsmsx502.ccr.corp.intel.com>
References: <1308658461.20015.24.camel@rex>
	<C10D3FB0CD45994C8A51FEC1227CE22F27050B57BE@shsmsx502.ccr.corp.intel.com>
Date: Wed, 29 Jun 2011 10:49:26 +0100
Message-ID: <1309340966.20015.337.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Multilib] a problem of SHLIBSDIR
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
X-List-Received-Date: Wed, 29 Jun 2011 09:53:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 17:10 +0800, Lu, Lianhao wrote:
> Hi,
> 
> SHLIBSDIR is a central place where to store the pkg information about
> the shared libraries which the package would provide. In the
> do_package task,  the function package_do_shlibs() will use this kind
> of information to automatically add RDEPENDS for the package being
> built. In the multilib situation, the SHLIBSDIR should be set to a
> different place form the normal version, otherwise a 32bit application
> might RDEPENDS on lib64-eglibc instead of the 32bit eglibc. 
> 
> The following patch tries to solve this problem. Any comment?
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=llu/ml&id=1970842424c414db50058ff99c6627e3ca034a04 

I think I'd been assuming that SHLIBSDIR included the TARGET_VENDOR
string as part of the triplet but it obviously doesn't and we need this.

Good catch. I think the patch is a good one to add!

Cheers,

Richard



