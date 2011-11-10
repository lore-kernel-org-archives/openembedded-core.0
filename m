Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ROZCx-0001wf-0m for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 19:18:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAAICKUx032300
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 18:12:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31622-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 18:12:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAAICDCr032294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 18:12:14 GMT
Message-ID: <1320948736.10252.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2011 18:12:16 +0000
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF1AC178@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF1AC178@MBX20.4emm.local>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: sdk generation broken for ipk
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
X-List-Received-Date: Thu, 10 Nov 2011 18:18:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-10 at 02:25 +0000, James Limbouris wrote:
> Hi,
> 
> multilib: Drop MULTILIB_IMAGE_INSTALL
> (7736862a74c92fe1afe42e170822be13117575c2) seems to break sdk
> generation on ipk systems.
> When I 'bitbake meta-toolchain-qte', populate_sdk_ipk() does not add
> any packages to the sysroot. The recipe then breaks later on, when it
> finds one of the sysroot folders missing.

I've pushed a fix to master for this problem.

Cheers,

Richard




