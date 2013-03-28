Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ULDJz-0005Q6-Bz for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 14:56:55 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2SDnetv008442; Thu, 28 Mar 2013 13:49:41 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wEjLStRSLxvZ; Thu, 28 Mar 2013 13:49:40 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2SDnYRd008410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 28 Mar 2013 13:49:37 GMT
Message-ID: <1364477968.28471.151.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luo Zhenhua-B19537 <B19537@freescale.com>
Date: Thu, 28 Mar 2013 13:39:28 +0000
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A0148ADFF@039-SN2MPN1-022.039d.mgd.msft.net>
References: <CA452391058F6D4E9715FB2C29D9312A0148ADFF@039-SN2MPN1-022.039d.mgd.msft.net>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Guo Chunrong-B40290 <B40290@freescale.com>,
	Liu Ting-B28495 <B28495@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Tar failed occasionally during the nativesdk toolchain build
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
X-List-Received-Date: Thu, 28 Mar 2013 13:56:55 -0000
X-List-Received-Date: Thu, 28 Mar 2013 13:56:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-03-27 at 10:55 +0000, Luo Zhenhua-B19537 wrote:
> When I build nativesdk toolchain, following build error appears sometimes, any suggestion to solve the issue?
> 
>     "tar: ./sysroots/ppce500mc-fsl_networking-linux/var/lib/rpm/__db.002: file changed as we read it" 
> 
> Thanks in advance.

Sounds like something is still writing to the rpm database whilst we're
packaging it which would be bad.

More logs/information might help debug it further. Were you running
mutliple builds or just one sdk? meta-toolchain or populate_sdk? Really
need more info to help further.

Cheers,

Richard





